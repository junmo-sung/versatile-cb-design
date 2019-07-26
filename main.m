close all
clear
clc

addpath functions

%% Parameter setup
% Iteration parameters
SP.iter             = 10;
SP.SNR_db_array     = 0; %SP.sig
% OMP parameters
SP.algorithms       = 'OMP'; % {'LS', 'OMP', 'BPDN', 'IHT'};
SP.criteria         = 'residual'; % 'paths' or 'residual'
% System parameters
SP.Nt               = 64;
SP.Nr               = 16;
SP.Lt               = 8;
SP.LtBar            = 8;
SP.Lr               = 8;
SP.G                = 64;
SP.bandwidth        = 500e6;
SP.sigma            = sqrt(10^(.1*(-174+10*log10(SP.bandwidth))));
SP.rfArchitecture   = 'PS'; % 'PS': phase shifters or 'switches' or 'lens'
% Following two parameters only applicable when 'PS' architecture is used.
SP.rfBFtype         = 'DFT'; % RF beamformer type. 'DFT', 'DCT', 'Hadamard'.
SP.rfQuant          = true; % RF precoder/combiner quantization (HW constraint).
SP.rfQuantBits      = 6;
% Channel-related parameters
SP.Np               = 4; % # of total paths

%% Simulation
SP = main_function(SP);
