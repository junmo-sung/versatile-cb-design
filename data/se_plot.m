close all
clear
clc

%% Load files
% G=64
PS_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16   = load('PS_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16.mat');
SW_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16   = load('switches_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16.mat');
LS_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16   = load('lens_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16.mat');

PS_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16   = load('PS_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16.mat');
SW_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16   = load('switches_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16.mat');
LS_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16   = load('lens_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16.mat');

PS_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16   = load('PS_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.mat');
SW_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16   = load('switches_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.mat');
LS_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16   = load('lens_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.mat');

% G=180
PS_Nt64_Nr16_Lt88_Lr2_G180_Np4_Q16   = load('PS_Nt64_Nr16_Lt88_Lr2_G180_Np4_Q16.mat');
SW_Nt64_Nr16_Lt88_Lr2_G180_Np4_Q16   = load('switches_Nt64_Nr16_Lt88_Lr2_G180_Np4_Q16.mat');
LS_Nt64_Nr16_Lt88_Lr2_G180_Np4_Q16   = load('lens_Nt64_Nr16_Lt88_Lr2_G180_Np4_Q16.mat');

PS_Nt64_Nr16_Lt88_Lr4_G180_Np4_Q16   = load('PS_Nt64_Nr16_Lt88_Lr4_G180_Np4_Q16.mat');
SW_Nt64_Nr16_Lt88_Lr4_G180_Np4_Q16   = load('switches_Nt64_Nr16_Lt88_Lr4_G180_Np4_Q16.mat');
LS_Nt64_Nr16_Lt88_Lr4_G180_Np4_Q16   = load('lens_Nt64_Nr16_Lt88_Lr4_G180_Np4_Q16.mat');

PS_Nt64_Nr16_Lt88_Lr8_G180_Np4_Q16   = load('PS_Nt64_Nr16_Lt88_Lr8_G180_Np4_Q16.mat');
SW_Nt64_Nr16_Lt88_Lr8_G180_Np4_Q16   = load('switches_Nt64_Nr16_Lt88_Lr8_G180_Np4_Q16.mat');
LS_Nt64_Nr16_Lt88_Lr8_G180_Np4_Q16   = load('lens_Nt64_Nr16_Lt88_Lr8_G180_Np4_Q16.mat');

figureSize = [8,5]; %inches
yRange = [-20, 0];
SNRdb = -10:5:15;
threshold = 1.5;

lineWidth = 1.1;
markerSize = 8;
marker_PS_OR = 's-';            color_PS_OR         = [      0         0         0];
marker_PS_LS_sung = '*-';       color_PS_LS_sung    = [      0         0         0];
marker_OPT        = 'x-';       color_OPT           = [      0         0         0];

marker_PS_OMP_sung = 'o-';      color_sung          = [      0    0.4470    0.7410];
marker_PS_BPDN_sung = '^-';     
% marker_PS_IHT_sung = 'o-';

marker_SW_OMP_sung = 'o:';      
marker_SW_BPDN_sung = '^:';
% marker_SW_IHT_sung = 'o:';

marker_LS_OMP_sung = 'o--';     
marker_LS_BPDN_sung = '^--';
% marker_LS_IHT_sung = 'o--';

marker_PS_OMP_md = 'o-';        color_md            = [ 0.8500    0.3250    0.0980];
marker_PS_BPDN_md = '^-';
% marker_PS_IHT_md = 'o-';

marker_SW_OMP_md = 'o:';        
marker_SW_BPDN_md = '^:'; 
% marker_SW_IHT_md = 'o:';

marker_LS_OMP_md = 'o--';       
marker_LS_BPDN_md = '^--';
% marker_LS_IHT_md = 'o--';

%% Plot: G=64 

% Outer plot
fig1 = figure;
hold on
set(gca, 'FontSize', 13)
set(gcf, 'Units', 'inches')
pos = get(gcf, 'position');
pos(3:4) = figureSize;
set(gcf, 'position', pos)

SE_OMP_det_concat = [];
SE_OMP_rnd_concat = [];
SE_BPDN_det_concat = [];
SE_BPDN_rnd_concat = [];

% Lr=2
% SP = PS_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_LS_sung       ), marker_PS_LS_sung,    'color', color_PS_LS_sung,  'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] LSE')
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_PS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_PS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_PS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_PS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] BPDN')
% 
% SE_OMP_det_concat(1,:)  = nanmean( SP.SE_OMP_sung );
% SE_OMP_rnd_concat(1,:)  = nanmean( SP.SE_OMP_md   );
% SE_BPDN_det_concat(1,:) = nanmean( SP.SE_BPDN_sung);
% SE_BPDN_rnd_concat(1,:) = nanmean( SP.SE_BPDN_md  );
% 
% SP = SW_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_SW_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_SW_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_SW_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_SW_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] BPDN')
% 
% SE_OMP_det_concat(2,:)  = nanmean( SP.SE_OMP_sung );
% SE_OMP_rnd_concat(2,:)  = nanmean( SP.SE_OMP_md   );
% SE_BPDN_det_concat(2,:) = nanmean( SP.SE_BPDN_sung);
% SE_BPDN_rnd_concat(2,:) = nanmean( SP.SE_BPDN_md  );
% 
% SP = LS_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_opt           ), marker_OPT,           'color', color_OPT,      'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Perfect CSI') 
% plot(SNRdb, nanmean(   SP.SE_oracle        ), marker_PS_OR,         'color', color_PS_OR,    'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Oracle')
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_LS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_LS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_LS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_LS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] BPDN')
% 
% SE_OMP_det_concat(3,:)  = nanmean( SP.SE_OMP_sung );
% SE_OMP_rnd_concat(3,:)  = nanmean( SP.SE_OMP_md   );
% SE_BPDN_det_concat(3,:) = nanmean( SP.SE_BPDN_sung);
% SE_BPDN_rnd_concat(3,:) = nanmean( SP.SE_BPDN_md  );
% 
% SE_OMP_det_diff = abs( (SE_OMP_det_concat - mean(SE_OMP_det_concat))./ mean(SE_OMP_det_concat) )*100;
% SE_OMP_rnd_diff = abs( (SE_OMP_rnd_concat - mean(SE_OMP_rnd_concat))./ mean(SE_OMP_rnd_concat) )*100;
% SE_BPDN_det_diff = abs( (SE_BPDN_det_concat - mean(SE_BPDN_det_concat))./ mean(SE_BPDN_det_concat) )*100;
% SE_BPDN_rnd_diff = abs( (SE_BPDN_rnd_concat - mean(SE_BPDN_rnd_concat))./ mean(SE_BPDN_rnd_concat) )*100;
% 
% fprintf('G64, 2RX OMP det max diff: %.2f percent \n', max(max(SE_OMP_det_diff)))
% fprintf('G64, 2RX OMP rnd max diff: %.2f percent \n', max(max(SE_OMP_rnd_diff)))
% fprintf('G64, 2RX BPDN det max diff: %.2f percent \n', max(max(SE_BPDN_det_diff)))
% fprintf('G64, 2RX BPDN rnd max diff: %.2f percent \n', max(max(SE_BPDN_rnd_diff)))

% Lr=4
% SP = PS_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_LS_sung       ), marker_PS_LS_sung,    'color', color_PS_LS_sung,  'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] LSE')
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_PS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_PS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_PS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_PS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] BPDN')
% 
% SP = SW_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_SW_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_SW_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_SW_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_SW_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] BPDN')
% 
% SP = LS_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_opt           ), marker_OPT,        'color', color_OPT,      'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Perfect CSI') 
% plot(SNRdb, nanmean(   SP.SE_oracle        ), marker_PS_OR,         'color', color_PS_OR,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Oracle')
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_LS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_LS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_LS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_LS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] BPDN')

% Lr=8
SE_OMP_det_concat = [];
SE_OMP_rnd_concat = [];
SE_BPDN_det_concat = [];
SE_BPDN_rnd_concat = [];

SP = PS_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.SP;

plot(inf, inf, '-xk', 'LineWidth', lineWidth, 'MarkerSize', markerSize)
plot(inf, inf, marker_PS_OR, 'color', color_PS_OR, 'LineWidth', lineWidth, 'MarkerSize', markerSize)
plot(inf, inf, marker_PS_LS_sung, 'color', color_PS_LS_sung, 'LineWidth', lineWidth, 'MarkerSize', markerSize)
plot(inf, inf, 'p', 'color', color_sung, 'MarkerSize', markerSize)
plot(inf, inf, 'p', 'color', color_md, 'MarkerFaceColor', color_md, 'MarkerSize', markerSize)
plot(inf, inf, '-k', 'LineWidth', lineWidth)
plot(inf, inf, ':k', 'LineWidth', lineWidth)
plot(inf, inf, '--k', 'LineWidth', lineWidth)
plot(inf, inf, 'ok', 'MarkerSize', markerSize)
plot(inf, inf, '^k', 'MarkerSize', markerSize)

plot(SNRdb, nanmean(   SP.SE_LS_sung       ), marker_PS_LS_sung,    'color', color_PS_LS_sung,  'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] LSE')
plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_PS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_PS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] BPDN')
plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_PS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_PS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] BPDN')

SE_OMP_det_concat(1,:)  = nanmean( SP.SE_OMP_sung );
SE_OMP_rnd_concat(1,:)  = nanmean( SP.SE_OMP_md   );
SE_BPDN_det_concat(1,:) = nanmean( SP.SE_BPDN_sung);
SE_BPDN_rnd_concat(1,:) = nanmean( SP.SE_BPDN_md  );

SP = SW_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.SP;
plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_SW_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_SW_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] BPDN')
plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_SW_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_SW_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] BPDN')

SE_OMP_det_concat(2,:)  = nanmean( SP.SE_OMP_sung );
SE_OMP_rnd_concat(2,:)  = nanmean( SP.SE_OMP_md   );
SE_BPDN_det_concat(2,:) = nanmean( SP.SE_BPDN_sung);
SE_BPDN_rnd_concat(2,:) = nanmean( SP.SE_BPDN_md  );

SP = LS_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.SP;
plot(SNRdb, nanmean(   SP.SE_opt           ), marker_OPT,           'color', color_OPT,      'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Perfect CSI') 
plot(SNRdb, nanmean(   SP.SE_oracle        ), marker_PS_OR,         'color', color_PS_OR,    'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Oracle')
plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_LS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_LS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] BPDN')
plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_LS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_LS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] BPDN')

SE_OMP_det_concat(3,:)  = nanmean( SP.SE_OMP_sung );
SE_OMP_rnd_concat(3,:)  = nanmean( SP.SE_OMP_md   );
SE_BPDN_det_concat(3,:) = nanmean( SP.SE_BPDN_sung);
SE_BPDN_rnd_concat(3,:) = nanmean( SP.SE_BPDN_md  );

SE_OMP_det_diff = abs( (SE_OMP_det_concat - mean(SE_OMP_det_concat))./ mean(SE_OMP_det_concat) )*100;
SE_OMP_rnd_diff = abs( (SE_OMP_rnd_concat - mean(SE_OMP_rnd_concat))./ mean(SE_OMP_rnd_concat) )*100;
SE_BPDN_det_diff = abs( (SE_BPDN_det_concat - mean(SE_BPDN_det_concat))./ mean(SE_BPDN_det_concat) )*100;
SE_BPDN_rnd_diff = abs( (SE_BPDN_rnd_concat - mean(SE_BPDN_rnd_concat))./ mean(SE_BPDN_rnd_concat) )*100;

fprintf('G64, 8RX OMP det max diff: %.2f percent \n', max(max(SE_OMP_det_diff)))
fprintf('G64, 8RX OMP rnd max diff: %.2f percent \n', max(max(SE_OMP_rnd_diff)))
fprintf('G64, 8RX BPDN det max diff: %.2f percent \n', max(max(SE_BPDN_det_diff)))
fprintf('G64, 8RX BPDN rnd max diff: %.2f percent \n', max(max(SE_BPDN_rnd_diff)))

hold off
grid on
% ylim([5, 15])
% xlim([-10, 0])
xlabel('SNR [dB]')
ylabel('Spectral Efficiency [bits/s/Hz]')
% legend('show')
hLegend = legend('Perfect CSI',...
    'Oracle', ...
    'LSE', ... % [Determ|PS] 
    '[Unfilled] Proposed', ...
    '[Filled] Random', ...
    'Phase shifter', ...
    'Switch', ...
    'Lens', ...
    'OMP [13]', ...
    'BPDN [14]',...
    'Location', 'southeast')
hLegend.FontSize = 12;

% title('G=64')

% annotation(fig1,'textbox',...
%     [0.66319444444444 0.763888888888889 0.0555555555555597 0.0601111111111117],...
%     'String','L_r=8',...
%     'FontSize',12,...
%     'FontName','Helvetica Neue',...
%     'FitBoxToText','off',...
%     'EdgeColor',[1 1 1]);
% annotation(fig1,'textbox',...
%     [0.670138888888884 0.488888888888889 0.0555555555555597 0.0601111111111116],...
%     'String','L_r=2',...
%     'FontSize',12,...
%     'FontName','Helvetica Neue',...
%     'FitBoxToText','off',...
%     'EdgeColor',[1 1 1]);
% annotation(fig1,'ellipse',...
%     [0.724958333333333 0.558333333333334 0.0528194444444444 0.280555555555556]);
% annotation(fig1,'ellipse',...
%     [0.730166666666667 0.422222222222222 0.0424027777777778 0.122222222222222]);

% Inner plot1
axes('position',  [.17, .6, .25, .3]);
box on
hold on
SP = PS_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.SP;
plot(SNRdb, nanmean(   SP.SE_LS_sung       ), marker_PS_LS_sung,    'color', color_PS_LS_sung,  'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] LSE')
plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_PS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_PS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] BPDN')
plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_PS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_PS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] BPDN')

SP = SW_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.SP;
plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_SW_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_SW_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] BPDN')
plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_SW_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_SW_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] BPDN')

SP = LS_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.SP;
plot(SNRdb, nanmean(   SP.SE_opt           ), marker_OPT,        'color', color_OPT,      'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Perfect CSI') 
plot(SNRdb, nanmean(   SP.SE_oracle        ), marker_PS_OR,         'color', color_PS_OR,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Oracle')
plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_LS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_LS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] BPDN')
plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_LS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_LS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] BPDN')
xlim([-1,1]);
ylim([19.5, 23.5]);
hold off

% Inner plot2
% axes('position',  [.62, .15, .25, .25]);
% box on
% hold on
% SP = PS_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_LS_sung       ), marker_PS_LS_sung,    'color', color_PS_LS_sung,  'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] LSE')
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_PS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_PS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_PS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_PS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] BPDN')
% 
% SP = SW_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_SW_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_SW_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_SW_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_SW_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] BPDN')
% 
% SP = LS_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_opt           ), marker_OPT,        'color', color_OPT,      'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Perfect CSI') 
% plot(SNRdb, nanmean(   SP.SE_oracle        ), marker_PS_OR,         'color', color_PS_OR,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Oracle')
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_LS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_LS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_LS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_LS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] BPDN')
% xlim([-.1,.1]);
% ylim([14.2, 14.7]);
% hold off

%% Plot: G=180 
fig2 = figure;
hold on
set(gca, 'FontSize', 13)
set(gcf, 'Units', 'inches')
pos = get(gcf, 'position');
pos(3:4) = figureSize;
set(gcf, 'position', pos)

% Lr=2
% SE_OMP_det_concat = [];
% SE_OMP_rnd_concat = [];
% SE_BPDN_det_concat = [];
% SE_BPDN_rnd_concat = [];
% 
% SP = PS_Nt64_Nr16_Lt88_Lr2_G180_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_LS_sung       ), marker_PS_LS_sung,    'color', color_PS_LS_sung,  'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] LSE')
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_PS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_PS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_PS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_PS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] BPDN')
% 
% SE_OMP_det_concat(1,:)  = nanmean( SP.SE_OMP_sung );
% SE_OMP_rnd_concat(1,:)  = nanmean( SP.SE_OMP_md   );
% SE_BPDN_det_concat(1,:) = nanmean( SP.SE_BPDN_sung);
% SE_BPDN_rnd_concat(1,:) = nanmean( SP.SE_BPDN_md  );
% 
% SP = SW_Nt64_Nr16_Lt88_Lr2_G180_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_SW_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_SW_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_SW_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_SW_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] BPDN')
% 
% SE_OMP_det_concat(2,:)  = nanmean( SP.SE_OMP_sung );
% SE_OMP_rnd_concat(2,:)  = nanmean( SP.SE_OMP_md   );
% SE_BPDN_det_concat(2,:) = nanmean( SP.SE_BPDN_sung);
% SE_BPDN_rnd_concat(2,:) = nanmean( SP.SE_BPDN_md  );
% 
% SP = LS_Nt64_Nr16_Lt88_Lr2_G180_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_opt           ), marker_OPT,        'color', color_OPT,      'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Perfect CSI') 
% plot(SNRdb, nanmean(   SP.SE_oracle        ), marker_PS_OR,         'color', color_PS_OR,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Oracle')
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_LS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_LS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_LS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_LS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] BPDN')
% 
% SE_OMP_det_concat(3,:)  = nanmean( SP.SE_OMP_sung );
% SE_OMP_rnd_concat(3,:)  = nanmean( SP.SE_OMP_md   );
% SE_BPDN_det_concat(3,:) = nanmean( SP.SE_BPDN_sung);
% SE_BPDN_rnd_concat(3,:) = nanmean( SP.SE_BPDN_md  );
% 
% SE_OMP_det_diff = abs( (SE_OMP_det_concat - mean(SE_OMP_det_concat))./ mean(SE_OMP_det_concat) )*100;
% SE_OMP_rnd_diff = abs( (SE_OMP_rnd_concat - mean(SE_OMP_rnd_concat))./ mean(SE_OMP_rnd_concat) )*100;
% SE_BPDN_det_diff = abs( (SE_BPDN_det_concat - mean(SE_BPDN_det_concat))./ mean(SE_BPDN_det_concat) )*100;
% SE_BPDN_rnd_diff = abs( (SE_BPDN_rnd_concat - mean(SE_BPDN_rnd_concat))./ mean(SE_BPDN_rnd_concat) )*100;
% 
% fprintf('G180, 2RX OMP det max diff: %.2f percent \n', max(max(SE_OMP_det_diff)))
% fprintf('G180, 2RX OMP rnd max diff: %.2f percent \n', max(max(SE_OMP_rnd_diff)))
% fprintf('G180, 2RX BPDN det max diff: %.2f percent \n', max(max(SE_BPDN_det_diff)))
% fprintf('G180, 2RX BPDN rnd max diff: %.2f percent \n', max(max(SE_BPDN_rnd_diff)))

% Lr=4
% SP = PS_Nt64_Nr16_Lt88_Lr4_G180_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_opt           ), marker_OPT,        'color', color_OPT,      'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Perfect CSI') 
% plot(SNRdb, nanmean(   SP.SE_oracle        ), marker_PS_OR,         'color', color_PS_OR,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Oracle')
% plot(SNRdb, nanmean(   SP.SE_LS_sung       ), marker_PS_LS_sung,    'color', color_PS_LS_sung,  'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] LSE')
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_PS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_PS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_PS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_PS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] BPDN')
% 
% SP = SW_Nt64_Nr16_Lt88_Lr4_G180_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_SW_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_SW_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_SW_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_SW_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] BPDN')
% 
% SP = LS_Nt64_Nr16_Lt88_Lr4_G180_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_LS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_LS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_LS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_LS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] BPDN')

% Lr=8
SE_OMP_det_concat = [];
SE_OMP_rnd_concat = [];
SE_BPDN_det_concat = [];
SE_BPDN_rnd_concat = [];

SP = PS_Nt64_Nr16_Lt88_Lr8_G180_Np4_Q16.SP;

plot(inf, inf, '-xk', 'LineWidth', lineWidth, 'MarkerSize', markerSize)
plot(inf, inf, marker_PS_OR, 'color', color_PS_OR, 'LineWidth', lineWidth, 'MarkerSize', markerSize)
plot(inf, inf, marker_PS_LS_sung, 'color', color_PS_LS_sung, 'LineWidth', lineWidth, 'MarkerSize', markerSize)
plot(inf, inf, 'p', 'color', color_sung, 'MarkerSize', markerSize)
plot(inf, inf, 'p', 'color', color_md, 'MarkerFaceColor', color_md, 'MarkerSize', markerSize)
plot(inf, inf, '-k', 'LineWidth', lineWidth)
plot(inf, inf, ':k', 'LineWidth', lineWidth)
plot(inf, inf, '--k', 'LineWidth', lineWidth)
plot(inf, inf, 'ok', 'MarkerSize', markerSize)
plot(inf, inf, '^k', 'MarkerSize', markerSize)

plot(SNRdb, nanmean(   SP.SE_LS_sung       ), marker_PS_LS_sung,    'color', color_PS_LS_sung,  'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] LSE')
plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_PS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_PS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] BPDN')
plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_PS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_PS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] BPDN')

SE_OMP_det_concat(1,:)  = nanmean( SP.SE_OMP_sung );
SE_OMP_rnd_concat(1,:)  = nanmean( SP.SE_OMP_md   );
SE_BPDN_det_concat(1,:) = nanmean( SP.SE_BPDN_sung);
SE_BPDN_rnd_concat(1,:) = nanmean( SP.SE_BPDN_md  );

SP = SW_Nt64_Nr16_Lt88_Lr8_G180_Np4_Q16.SP;
plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_SW_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_SW_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] BPDN')
plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_SW_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_SW_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] BPDN')

SE_OMP_det_concat(2,:)  = nanmean( SP.SE_OMP_sung );
SE_OMP_rnd_concat(2,:)  = nanmean( SP.SE_OMP_md   );
SE_BPDN_det_concat(2,:) = nanmean( SP.SE_BPDN_sung);
SE_BPDN_rnd_concat(2,:) = nanmean( SP.SE_BPDN_md  );

SP = LS_Nt64_Nr16_Lt88_Lr8_G180_Np4_Q16.SP;
plot(SNRdb, nanmean(   SP.SE_opt           ), marker_OPT,        'color', color_OPT,      'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Perfect CSI') 
plot(SNRdb, nanmean(   SP.SE_oracle        ), marker_PS_OR,         'color', color_PS_OR,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Oracle')
plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_LS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_LS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] BPDN')
plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_LS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_LS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] BPDN')

SE_OMP_det_concat(3,:)  = nanmean( SP.SE_OMP_sung );
SE_OMP_rnd_concat(3,:)  = nanmean( SP.SE_OMP_md   );
SE_BPDN_det_concat(3,:) = nanmean( SP.SE_BPDN_sung);
SE_BPDN_rnd_concat(3,:) = nanmean( SP.SE_BPDN_md  );

SE_OMP_det_diff = abs( (SE_OMP_det_concat - mean(SE_OMP_det_concat))./ mean(SE_OMP_det_concat) )*100;
SE_OMP_rnd_diff = abs( (SE_OMP_rnd_concat - mean(SE_OMP_rnd_concat))./ mean(SE_OMP_rnd_concat) )*100;
SE_BPDN_det_diff = abs( (SE_BPDN_det_concat - mean(SE_BPDN_det_concat))./ mean(SE_BPDN_det_concat) )*100;
SE_BPDN_rnd_diff = abs( (SE_BPDN_rnd_concat - mean(SE_BPDN_rnd_concat))./ mean(SE_BPDN_rnd_concat) )*100;

fprintf('G180, 8RX OMP det max diff: %.2f percent \n', max(max(SE_OMP_det_diff)))
fprintf('G180, 8RX OMP rnd max diff: %.2f percent \n', max(max(SE_OMP_rnd_diff)))
fprintf('G180, 8RX BPDN det max diff: %.2f percent \n', max(max(SE_BPDN_det_diff)))
fprintf('G180, 8RX BPDN rnd max diff: %.2f percent \n', max(max(SE_BPDN_rnd_diff)))


hold off
grid on
% ylim([5, 15])
% xlim([-10, 0])
xlabel('SNR [dB]')
ylabel('Spectral Efficiency [bits/s/Hz]')
% hLegend = legend('show');
hLegend = legend('Perfect CSI',...
    'Oracle', ...
    'LSE', ... % [Determ|PS] 
    '[Unfilled] Proposed', ...
    '[Filled] Random', ...
    'Phase shifter', ...
    'Switch', ...
    'Lens', ...
    'OMP [13]', ...
    'BPDN [14]',...
    'Location', 'southeast')
hLegend.FontSize = 12;

% title('G=180')
% annotation(fig2,'textbox',...
%     [0.66319444444444 0.763888888888889 0.0555555555555597 0.0601111111111117],...
%     'String','L_r=8',...
%     'FontSize',12,...
%     'FontName','Helvetica Neue',...
%     'FitBoxToText','off',...
%     'EdgeColor',[1 1 1]);
% annotation(fig2,'textbox',...
%     [0.670138888888884 0.488888888888889 0.0555555555555597 0.0601111111111116],...
%     'String','L_r=2',...
%     'FontSize',12,...
%     'FontName','Helvetica Neue',...
%     'FitBoxToText','off',...
%     'EdgeColor',[1 1 1]);
% annotation(fig2,'ellipse',...
%     [0.724958333333333 0.558333333333334 0.0528194444444444 0.280555555555556]);
% annotation(fig2,'ellipse',...
%     [0.730166666666667 0.422222222222222 0.0424027777777778 0.122222222222222]);
% saveLegendToImage(fig2, hLegend, 'testImage');

% Inner plot1
axes('position',  [.17, .6, .25, .3]);
box on
hold on
% Lr=8
SP = PS_Nt64_Nr16_Lt88_Lr8_G180_Np4_Q16.SP;
plot(SNRdb, nanmean(   SP.SE_LS_sung       ), marker_PS_LS_sung,    'color', color_PS_LS_sung,  'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] LSE')
plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_PS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_PS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] BPDN')
plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_PS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_PS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] BPDN')

SP = SW_Nt64_Nr16_Lt88_Lr8_G180_Np4_Q16.SP;
plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_SW_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_SW_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] BPDN')
plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_SW_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_SW_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] BPDN')

SP = LS_Nt64_Nr16_Lt88_Lr8_G180_Np4_Q16.SP;
plot(SNRdb, nanmean(   SP.SE_opt           ), marker_OPT,        'color', color_OPT,      'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Perfect CSI') 
plot(SNRdb, nanmean(   SP.SE_oracle        ), marker_PS_OR,         'color', color_PS_OR,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Oracle')
plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_LS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_LS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] BPDN')
plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_LS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] OMP')
plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_LS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] BPDN')
xlim([-1,1]);
ylim([21, 24.5]);
hold off

% % Inner plot2
% axes('position',  [.62, .15, .25, .25]);
% box on
% hold on
% SP = PS_Nt64_Nr16_Lt88_Lr2_G180_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_LS_sung       ), marker_PS_LS_sung,    'color', color_PS_LS_sung,  'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] LSE')
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_PS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_PS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_PS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_PS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] BPDN')
% 
% SP = SW_Nt64_Nr16_Lt88_Lr2_G180_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_SW_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_SW_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_SW_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_SW_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] BPDN')
% 
% SP = LS_Nt64_Nr16_Lt88_Lr2_G180_Np4_Q16.SP;
% plot(SNRdb, nanmean(   SP.SE_opt           ), marker_OPT,        'color', color_OPT,      'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Perfect CSI') 
% plot(SNRdb, nanmean(   SP.SE_oracle        ), marker_PS_OR,         'color', color_PS_OR,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Oracle')
% plot(SNRdb, nanmean(   SP.SE_OMP_sung      ), marker_LS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_sung     ), marker_LS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] BPDN')
% plot(SNRdb, nanmean(   SP.SE_OMP_md        ), marker_LS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] OMP')
% plot(SNRdb, nanmean(   SP.SE_BPDN_md       ), marker_LS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] BPDN')
% xlim([-.1,.1]);
% ylim([14.5, 15]);
% hold off

