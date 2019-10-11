% Start with worse case parameters
% number of iterations
k = 10;
desiredUpSNR = 15; % in dB
desiredDownSNR = 15; % in dB
desiredTotalSNR = 15;  % in dB

objectiveSpecs = systemThreshold; 
weather = weatherConditions.clear;

satellite = testSatellite;
gsTransmiter = testGsTrasmitSystem;
gsReceiver = testGsReceiveSystem;

% Determine all the parameters we can change
% Determine weights for the parameters (how much we would like to change
% it)
for n = 1:k
    %% Calculate the Uplink SNR
    [uplinkSNR, Cup, Nup] = calculateSNR(gsTransmiter.Pt.curr, gsTransmiter.Gant.curr, satellite.Grant.curr, gsTransmiter.f, gsTransmiter.bandwidth, satellite.R, satellite.systemTemp.curr, weather, objectiveSpecs);
    display(uplinkSNR);
    %% Calculate the Downlink SNR
    downlinkSNR = calculateSNR(10^((satellite.systemGain.curr + uplinkSNR)/10), satellite.Gtant.curr, gsReceiver.Gant.curr, satellite.f.curr, satellite.bandwidth, satellite.R, gsReceiver.systemTemp.curr, weather, objectiveSpecs);
    display(downlinkSNR);
    %% Cacluate the total SNR
    SNRtot = 1 / ( (1/(10^(uplinkSNR/10))) + (1/(10^(downlinkSNR/10))) ); % Make sure to convert SNR to linear
    display(SNRtot);
end

% Get a range of the acceptable values and compute the number of steps we
% can take

% Then determine which one gives us the best gradient, i.e which one gives
% us the most bang for the buck. (The most reduction in the cost function)

% Change that parameter by the time step and recompute 