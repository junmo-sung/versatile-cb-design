function [ Phibar, PhibarNorm, Sigma, Phi, A_t, A_r, Q_diag, gridBeamPairs] = md2016access( SP )
% SP.Mt = (SP.Nt/SP.Lt*SP.Ns * SP.Nr/SP.Lr*SP.Ns) / SP.Lr;
% SP.Mt = SP.Ns * SP.Nt/SP.Lt;
% SP.Mt = SP.Nt;
% SP.Mr = SP.Nr/SP.Lr;
[A_t, A_r, gridBeamPairs] = ARM(SP.Nt, SP.Nr, SP.G, 'spatial'); % Array reponse matrices generation
P = PGenSC(SP); % equivalent to Xbar
Q = QGenSC(SP); % equivalent to W
Phi = kron(P.', Q');
Phibar = Phi*kron(conj(A_t), A_r);
Qbar_cell = mat2cell(Q, SP.Nr, SP.Lr*ones(1, SP.Nr/SP.Lr));
Q_diag = blkdiag(Qbar_cell{:}); % This block diagonal matrix is for noise generation.
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

% Phi_cell = cell(SP.Mt, 1);
% Q_cell   = cell(SP.Mt, 1);
% for mInd = 1:SP.Mt
%     [p, Q] = pqGen(SP);
%     Phi_cell{mInd} = kron(p.', Q');
%     Q_cell{mInd}   = Q;
% end
% Q_diag = blkdiag(Q_cell{:});
% Phi    = cell2mat(Phi_cell);
% Phibar = Phi*kron(conj(A_t), A_r);

    function P = PGenSC(SP)
        It = eye(SP.Nt);
        U = 1/sqrt(SP.Nt)*dftmtx(SP.Nt);
        P = zeros(SP.Nt, SP.Mt);
        switch SP.rfArchitecture
            case 'PS'
                P_temp  = 1/sqrt(SP.Nt)*randsample([1, -1, 1j, -1j], SP.Nt*SP.Mt, true).';
                P       = reshape(P_temp, SP.Nt, SP.Mt);
%                 for ind = 1:SP.Mt
%                     P(:, ind) = 1/sqrt(SP.Nt)*randsample([1, -1, 1j, -1j], SP.Nt, true).';
%                 end
            case 'switches'
                for ind = 1:SP.Mt
                    P(:, ind) = It(:, randi(SP.Nt, 1, 1));
                end
            case 'lens'
                for ind = 1:SP.Mt
%                     S           = randi([0,1], SP.Nt, SP.Lt); % adaptive selecting network
                    S = reshape( randsample([-1, 1], SP.Nt*SP.Lt, true), SP.Nt, SP.Lt); % adaptive selecting network
                    trainSym    = ones(SP.Lt, 1); % BB training symbols 
                    P(:, ind)   = U*S*trainSym;
                end
                P           = sqrt(SP.Nt)/norm(P, 'fro')*P;
        end
    end

    function Q = QGenSC(SP)
        Q = zeros(SP.Nr, SP.Nr);
        U = 1/sqrt(SP.Nr)*dftmtx(SP.Nr);
        Ir = eye(SP.Nr);
        switch SP.rfArchitecture
            case 'PS'
                Q_temp  = sqrt(1/SP.G)*randsample([1, -1, 1j, -1j], SP.Nr^2, true).';
                Q       = reshape(Q_temp, SP.Nr, SP.Nr);
%                 for ind = 1:SP.Nr
%                     Q(:, ind) = sqrt(1/SP.G)*randsample([1, -1, 1j, -1j], SP.Nr, true).';
%                 end
            case 'switches'
                for ind = 1:SP.Nr
                    Q(:, ind) = sqrt(SP.Nr/SP.G)*Ir(:, randi(SP.Nr, 1, 1));
                end
            case 'lens'
                if isinteger(SP.Nr/SP.Lr); error('Nr is not a multiple of Lr.'); end
                Q = [];
                for ind = 1:(SP.Nr/SP.Lr)
%                     S = randi([0,1], SP.Nr, SP.Lr); % adaptive selecting network
                    S = reshape( randsample([-1, 1], SP.Nr*SP.Lr, true), SP.Nr, SP.Lr); % adaptive selecting network
                    Q = [Q, U*S];
                end
                Q = SP.Nr/(sqrt(SP.G)*norm(Q, 'fro'))*Q;
        end
    end

%     function [p, Q] = pqGen_MC(SP) % p and Q generation for the MC case
%         switch SP.rfArchitecture
%             case 'PS'
%                 p = 1/sqrt(SP.Nt)*randsample([1, -1, 1j, -1j], SP.Nt, true).';
%                 Q = zeros(SP.Nr, SP.Lr);
%                 for ind = 1:SP.Lr
%                     Q(:,ind) = 1/sqrt(SP.G)*randsample([1, -1, 1j, -1j], SP.Nr, true).';
%                 end
%             case 'switches'
%                 It = eye(SP.Nt); Ir = eye(SP.Nr);
%                 p = It(:, randi(SP.Nt, 1, 1));
%                 Q = zeros(SP.Nr, SP.Lr);
%                 for ind = 1:SP.Lr
%                     Q(:, ind) = Ir(:, randi(SP.Nr, 1, 1));
%                 end
%         end
%     end
end

