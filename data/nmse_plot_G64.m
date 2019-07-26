close all
clear
clc

%% Load files
PS_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16   = load('PS_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16.mat');
SW_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16   = load('switches_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16.mat');
LS_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16   = load('lens_Nt64_Nr16_Lt88_Lr2_G64_Np4_Q16.mat');

PS_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16   = load('PS_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16.mat');
SW_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16   = load('switches_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16.mat');
LS_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16   = load('lens_Nt64_Nr16_Lt88_Lr4_G64_Np4_Q16.mat');

PS_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16   = load('PS_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.mat');
SW_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16   = load('switches_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.mat');
LS_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16   = load('lens_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.mat');

figureSize = [8,5]; %inches
yRange = [-26, 0];
SNRdb = -10:5:15;
threshold = 1.5;

lineWidth = 1.1;
markerSize = 8;
marker_PS_OR = 's-';            color_PS_OR         = [      0         0         0];
marker_PS_LS_sung = '*-';       color_PS_LS_sung    = [      0         0         0];
marker_OPT        = 'x-';       color_OPT           = [      0         0         0];

marker_PS_OMP_sung = 'o-';      color_sung          = [      0    0.4470    0.7410];
marker_PS_BPDN_sung = '^-';     

marker_SW_OMP_sung = 'o:';      
marker_SW_BPDN_sung = '^:';

marker_LS_OMP_sung = 'o--';     
marker_LS_BPDN_sung = '^--';

marker_PS_OMP_md = 'o-';        color_md            = [ 0.8500    0.3250    0.0980];
marker_PS_BPDN_md = '^-';

marker_SW_OMP_md = 'o:';        
marker_SW_BPDN_md = '^:'; 

marker_LS_OMP_md = 'o--';       
marker_LS_BPDN_md = '^--';

%% Plot: 8 RX antennas
fig = figure;
hold on
set(gca, 'FontSize', 13)
set(gcf, 'Units', 'inches')
pos = get(gcf, 'position');
pos(3:4) = figureSize;
set(gcf, 'position', pos)

NMSE_OMP_det_concat = [];
NMSE_OMP_rnd_concat = [];
NMSE_BPDN_det_concat = [];
NMSE_BPDN_rnd_concat = [];

SP = PS_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.SP;

plot(inf, inf, marker_PS_OR, 'color', color_PS_OR, 'LineWidth', lineWidth, 'MarkerSize', markerSize)
plot(inf, inf, marker_PS_LS_sung, 'color', color_PS_LS_sung, 'LineWidth', lineWidth, 'MarkerSize', markerSize)
plot(inf, inf, 'p', 'color', color_sung, 'MarkerSize', markerSize)
plot(inf, inf, 'p', 'color', color_md, 'MarkerFaceColor', color_md, 'MarkerSize', markerSize)
plot(inf, inf, '-k', 'LineWidth', lineWidth)
plot(inf, inf, ':k', 'LineWidth', lineWidth)
plot(inf, inf, '--k', 'LineWidth', lineWidth)
plot(inf, inf, 'ok', 'MarkerSize', markerSize)
plot(inf, inf, '^k', 'MarkerSize', markerSize)

% plot(SNRdb, 10*log10(mean(          SP.NMSE_OR                    )), marker_OPT,           'color', color_OPT,         'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', 'Perfect CSI')
plot(SNRdb, 10*log10(mean(          SP.NMSE_OR                    )), marker_PS_OR,         'color', color_PS_OR,       'LineWidth', lineWidth, 'MarkerSize', markerSize)
plot(SNRdb, 10*log10(mean(          SP.NMSE_LS_sung               )), marker_PS_LS_sung,    'color', color_PS_LS_sung,  'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Detrm|PS] LSE')
plot(SNRdb, 10*log10(mean(          SP.NMSE_OMP_sung              )), marker_PS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Detrm|PS] OMP')
plot(SNRdb, 10*log10(mean(          SP.NMSE_BPDN_sung             )), marker_PS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Detrm|PS] BPDN')
% plot(SNRdb, 10*log10(mean(          SP.NMSE_IHT_sung              )), marker_PS_IHT_sung,   'color', color_PS_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|PS] IHT')
plot(SNRdb, 10*log10(mean(          SP.NMSE_OMP_md                )), marker_PS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] OMP')
plot(SNRdb, 10*log10(mean(          SP.NMSE_BPDN_md               )), marker_PS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|PS] BPDN')
% plot(SNRdb, 10*log10(mean(          SP.NMSE_IHT_md                )), marker_PS_IHT_md,     'color', color_PS_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Rand|PS] IHT')

NMSE_OMP_det_concat(1,:)  = ( mean( SP.NMSE_OMP_sung  ) );
NMSE_OMP_rnd_concat(1,:)  = ( mean( SP.NMSE_OMP_md    ) );
NMSE_BPDN_det_concat(1,:) = ( mean( SP.NMSE_BPDN_sung ) );
NMSE_BPDN_rnd_concat(1,:) = ( mean( SP.NMSE_BPDN_md   ) );

SP = SW_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.SP;
plot(SNRdb, 10*log10(mean(          SP.NMSE_OMP_sung              )), marker_SW_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Detrm|SW] OMP')
plot(SNRdb, 10*log10(mean(          SP.NMSE_BPDN_sung             )), marker_SW_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Detrm|SW] BPDN')
% plot(SNRdb, 10*log10(mean(          SP.NMSE_IHT_sung              )), marker_SW_IHT_sung,   'color', color_SW_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|SW] IHT')
plot(SNRdb, 10*log10(mean(          SP.NMSE_OMP_md                )), marker_SW_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] OMP')
plot(SNRdb, 10*log10(mean(          SP.NMSE_BPDN_md               )), marker_SW_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|SW] BPDN')
% plot(SNRdb, 10*log10(mean(          SP.NMSE_IHT_md                )), marker_SW_IHT_md,     'color', color_SW_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Rand|SW] IHT')

NMSE_OMP_det_concat(2,:)  = ( mean( SP.NMSE_OMP_sung  ) );
NMSE_OMP_rnd_concat(2,:)  = ( mean( SP.NMSE_OMP_md    ) );
NMSE_BPDN_det_concat(2,:) = ( mean( SP.NMSE_BPDN_sung ) );
NMSE_BPDN_rnd_concat(2,:) = ( mean( SP.NMSE_BPDN_md ) );

SP = LS_Nt64_Nr16_Lt88_Lr8_G64_Np4_Q16.SP;
plot(SNRdb, 10*log10(mean(          SP.NMSE_OMP_sung              )), marker_LS_OMP_sung,   'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Detrm|LS] OMP')
plot(SNRdb, 10*log10(mean(          SP.NMSE_BPDN_sung             )), marker_LS_BPDN_sung,  'color', color_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Detrm|LS] BPDN')
% plot(SNRdb, 10*log10(mean(          SP.NMSE_IHT_sung              )), marker_LS_IHT_sung,   'color', color_LS_sung,     'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Sung|LS] IHT')
plot(SNRdb, 10*log10(mean(          SP.NMSE_OMP_md                )), marker_LS_OMP_md,     'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] OMP')
plot(SNRdb, 10*log10(mean(          SP.NMSE_BPDN_md               )), marker_LS_BPDN_md,    'color', color_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'MarkerFaceColor', color_md, 'DisplayName', '[Rand|LS] BPDN')
% plot(SNRdb, 10*log10(mean(          SP.NMSE_IHT_md                )), marker_LS_IHT_md,     'color', color_LS_md,       'LineWidth', lineWidth, 'MarkerSize', markerSize, 'DisplayName', '[Rand|LS] IHT')

NMSE_OMP_det_concat(3,:)  = ( mean( SP.NMSE_OMP_sung  ) );
NMSE_OMP_rnd_concat(3,:)  = ( mean( SP.NMSE_OMP_md    ) );
NMSE_BPDN_det_concat(3,:) = ( mean( SP.NMSE_BPDN_sung ) );
NMSE_BPDN_rnd_concat(3,:) = ( mean( SP.NMSE_BPDN_md   ) );

NMSE_OMP_det_diff = abs( (NMSE_OMP_det_concat - mean(NMSE_OMP_det_concat))./ mean(NMSE_OMP_det_concat) )*100;
NMSE_OMP_rnd_diff = abs( (NMSE_OMP_rnd_concat - mean(NMSE_OMP_rnd_concat))./ mean(NMSE_OMP_rnd_concat) )*100;
NMSE_BPDN_det_diff = abs( (NMSE_BPDN_det_concat - mean(NMSE_BPDN_det_concat))./ mean(NMSE_BPDN_det_concat) )*100;
NMSE_BPDN_rnd_diff = abs( (NMSE_BPDN_rnd_concat - mean(NMSE_BPDN_rnd_concat))./ mean(NMSE_BPDN_rnd_concat) )*100;

fprintf('8RX OMP det max diff: %.2f percent \n', max(max(NMSE_OMP_det_diff)))
fprintf('8RX OMP rnd max diff: %.2f percent \n', max(max(NMSE_OMP_rnd_diff)))
fprintf('8RX BPDN det max diff: %.2f percent \n', max(max(NMSE_BPDN_det_diff)))
fprintf('8RX BPDN rnd max diff: %.2f percent \n', max(max(NMSE_BPDN_rnd_diff)))

hold off
grid on
grid minor
ylim(yRange)
% xlim([-10, 25])
xlabel('SNR [dB]')
ylabel('NMSE [dB]')
% title('8 RX Antennas')

% hLegend = legend('show');
hLegend = legend('Oracle', ...
    'LSE', ... % [Determ|PS] 
    '[Unfilled] Proposed', ...
    '[Filled] Random', ...
    'Phase shifter', ...
    'Switch', ...
    'Lens', ...
    'OMP [13]', ...
    'BPDN [14]',...
    'Location', 'southwest')
hLegend.FontSize = 12;
% saveLegendToImage(fig, hLegend, 'testImage');
annotation(fig,'ellipse',...
    [0.719409282700419 0.486551724137931 0.0590717299578082 0.151724137931034],'LineWidth',1);
annotation(fig,'textarrow',[0.622362869198312 0.717299578059072],...
    [0.468965517241379 0.537931034482759],'String',{'Random','Codebook'},'FontSize',12);
annotation(fig,'ellipse',...
    [0.733067510548522 0.405689655172414 0.0306455696202537 0.0809999999999992],'LineWidth',1);
annotation(fig,'textarrow',[0.628691983122363 0.729957805907173],...
    [0.337931034482759 0.431034482758621],'String',{'Proposed','Codebook'},'FontSize',12);

%% Functions
function mean_vector = filtered_mean(matrix, threshold)
    mean_vector = zeros( 1, size(matrix,2) );
    for col_ind = 1:size(matrix,2)
        vector      = matrix(:,col_ind);
        mean_value  = mean( vector((vector<threshold)) );
        mean_vector(col_ind) = mean_value;
    end
end