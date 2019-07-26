function [ Phibar, PhibarNorm, Sigma, Phi, A_t, A_r,  Wbar_diag, Xbar, W, gridBeamPairs] = sung2( SP )
% SP.Mt = SP.Nt/SP.Lt * SP.LtBar
% SP.Mr = SP.Nr/SP.Lr
% SP.M  = SP.Mt*SP.Mr;
rfPossAngles = (1:2^SP.rfQuantBits)*2*pi/2^SP.rfQuantBits - pi;
%% RF precoder/combiner and Array Response Matrix generation
[A_t, A_r, gridBeamPairs] = ARM(SP.Nt, SP.Nr, SP.G, 'spatial'); % Array reponse matrices generation
switch SP.rfArchitecture
    case 'PS'
        switch SP.rfBFtype
            case 'DFT'
                Frf = 1/sqrt(SP.Nt) * dftmtx(SP.Nt); % unquantized RF precoder PS angles
                Wrf = 1/sqrt(SP.Nr) * dftmtx(SP.Nr); % unquantized RF combiner PS angles
            case 'DCT'
                Frf = dctmtx(SP.Nt); % unquantized RF precoder PS angles
                Wrf = dctmtx(SP.Nr); % unquantized RF precoder PS angles
                % need to populate for
            case 'Hadamard'
                % Hadamard consists of +-1. Thus 2bit resolution is enough for it.
                Frf = 1/sqrt(SP.Nt) * hadamard(SP.Nt); % unquantized RF precoder PS angles
                Wrf = 1/sqrt(SP.Nr) * hadamard(SP.Nr); % unquantized RF combiner PS angles
            otherwise
                error('Wrong analog beamformer type')
        end
        % quantized angle
        if SP.rfQuant == true
            for m = 1:SP.Nt
                for n = 1:SP.Nt
                    [~, Find] = min(abs(rfPossAngles - angle(Frf(m,n))));
                    Frf(m,n) = 1/sqrt(SP.Nt)*exp(1j*rfPossAngles(Find));
                end
            end
            for m = 1:SP.Nr
                for n = 1:SP.Nr
                    [~, Wind] = min(abs(rfPossAngles - angle(Wrf(m,n))));
                    Wrf(m,n) = 1/sqrt(SP.Nr)*exp(1j*rfPossAngles(Wind));
                end
            end
        end
        
    case 'switches'
        Frf = eye(SP.Nt);
        Wrf = eye(SP.Nr);
    case 'lens'
        Frf = 1/sqrt(SP.Nt)*dftmtx(SP.Nt);
        Wrf = 1/sqrt(SP.Nr)*dftmtx(SP.Nr);
    otherwise
        error('Wrong RF architecture')
end

% Frf = Frf(:, randperm(SP.Nt));
% Wrf = Wrf(:, randperm(SP.Nr));

%% Delete
% Phase Shifters without quantization
% Frf_ps   = 1/sqrt(SP.Nt) * dftmtx(SP.Nt);
% Wrf_ps   = 1/sqrt(SP.Nr) * dftmtx(SP.Nr);
% Phase Shifters with quantization
% Frf_ps_q = zeros(size(Frf_ps));
% Wrf_ps_q = zeros(size(Wrf_ps));
% for m = 1:SP.Nt
%     for n = 1:SP.Nt
%         [~, Find] = min(abs(rfPossAngles - angle(Frf_ps(m,n))));
%         Frf_ps_q(m,n) = 1/sqrt(SP.Nt)*exp(1j*rfPossAngles(Find));
%     end
% end
% for m = 1:SP.Nr
%     for n = 1:SP.Nr
%         [~, Wind] = min(abs(rfPossAngles - angle(Wrf_ps(m,n))));
%         Wrf_ps_q(m,n) = 1/sqrt(SP.Nr)*exp(1j*rfPossAngles(Wind));
%     end
% end

%% BB precoder/combiner generation
I           = eye(SP.Lt);
Xbar_cell   = cell(1,SP.Lt);
for fInd    = 1:SP.LtBar
    x_tilde         = I(:,fInd);
    [Fbbx, ~, ~]    = BBprecoderGen(SP, x_tilde);
    Xbar_cell{fInd} = Frf*kron(eye(SP.Nt/SP.Lt), Fbbx);
end
% for fInd = 1:SP.Lt
%     step    = SP.Nt/SP.Lt;
%     x_tilde = I(:,fInd);
%     [Fbbx, ~, ~]    = BBprecoderGen(SP, x_tilde);
%     Xbar_cell{fInd} = Frf(:,1:(SP.LtBar*step))*kron(eye(SP.LtBar), Fbbx);
% end
Xbar    = cell2mat(Xbar_cell);
Wbb     = BBcombinerGen(SP);
W       = Wrf*kron(eye(SP.Nr/SP.Lr), Wbb);
Wbar_cell = mat2cell(W, SP.Nr, SP.Lr*ones(1, SP.Nr/SP.Lr));
Wbar_diag = blkdiag(Wbar_cell{:}); % This block diagonal matrix is for noise generation.

%% Phi and Phi_bar Generation
Phi    = kron(Xbar.', W'); % sensing matrix
Phibar = Phi*kron(conj(A_t), A_r); % sensing*dictionary matrix (equivalent dictionary or eq. sens. mat.)
PhibarNorm = zeros(size(Phibar));
% Sigma  = zeros(size(Phibar,2));
SigmaVec = zeros(size(Phibar,2),1);
for index = 1:size(Phibar,2)
%     Sigma(index, index) = 1/norm(Phibar(:,index));
    SigmaVec(index) = 1/norm(Phibar(:,index));
%     PhibarNorm(:, index) = Phibar(:, index)*Sigma(index,index); % <=> PhibarNorm = Phibar*Sigma;
end
Sigma = sparse(1:size(Phibar,2), 1:size(Phibar,2), SigmaVec);
PhibarNorm = Phibar*Sigma;
disp('')

%% Functions
    function [Fbbx, Fbb, x] = BBprecoderGen(SP, x_input)
        U = 1/sqrt(SP.Lt)*dftmtx(SP.Lt); V = U;
        S_Fbb_vec   = ones(SP.Lt, 1).*x_input;
        S_Fbb       = diag(S_Fbb_vec);
        Fbbx        = U*S_Fbb*x_input;
        Fbb         = U*S_Fbb*V';
        x           = V*x_input;
    end

    function Wbb = BBcombinerGen(SP)
        U = 1/sqrt(SP.Lr)*dftmtx(SP.Lr); V = U;
        S_Wbb   = sqrt(SP.Nr/SP.G)*eye(SP.Lr);
        Wbb     = U*S_Wbb*V';
    end
end

