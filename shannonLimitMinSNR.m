% Calcualtes the min SNR based off the data rate and the bandwidth desired
% Input Arguments
%   C - The data rate/capcity in bits persecond
%   B - The bandwidth of the RF signal in hz
% Output Values
%   output - The min SNR in dB
function [output] = shannonLimitMinSNR(C,B)
%SHANNONLIMITMINSNR Calculates the min SNR needed to support the
%   desired data rate and the bandwidth of the RF signal

% Using the shannon limit calculate the min SNR
minSNRlinear = 2^(C/B) - 1; 

% Conver to dB
output = 10*log10(minSNRlinear);
end

