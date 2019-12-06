%% Choose variables
% Weather conditions we are testing for
weather = weatherConditions.clear;

% System designs
satellite = satelliteSystemA;
gsTransmiter = gsTrasmitSystemA;
gsReceiver = gsReceiverSystemA;

% Our objective specs we are designing for
% thresohld - is the minimum requirments
% objective - the desired values to design for
objectiveSpecs = systemThreshold;


%% Calculate SNR for uplink
[uplinkSNR, Cup, Nup] = calculateSNR(gsTransmiter.Pt, gsTransmiter.GetSysDirectivity(), satellite.Grant, gsTransmiter.f, gsTransmiter.bandwidth, satellite.R, satellite.GetSystemTemp(), weather, objectiveSpecs);
display(uplinkSNR);

%% Calculate SNR for downlink
downlinkSNR = calculateSNR(satellite.GetPtFromPrWatts(Cup), satellite.Gtant, gsReceiver.GetSysDirectivity(), satellite.f, satellite.bandwidth, satellite.R, gsReceiver.GetSystemTemp(), weather, objectiveSpecs);
display(downlinkSNR);

%% Calculate Total SNR
SNRtot = 1 / ( (1/(10^(uplinkSNR/10))) + (1/(10^(downlinkSNR/10))) ); % Make sure to convert SNR to linear
display(SNRtot);
