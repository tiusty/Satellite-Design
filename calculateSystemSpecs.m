%% Choose variables
weather = weatherConditions.clear;

satellite = satelliteSystemA;
gsTransmiter = gsTrasmitSystemA;
gsReceiver = gsReceiverSystemA;


%% Calculate SNR for uplink
[uplinkSNR, Cup, Nup] = calculateSNR(gsTransmiter.Pt, gsTransmiter.GetSysDirectivity(), satellite.Grant, gsTransmiter.f, gsTransmiter.bandwidth, satellite.R, satellite.GetSystemTemp(), weather);
display(uplinkSNR);

%% Calculate SNR for downlink
downlinkSNR = calculateSNR(satellite.GetPtFromPrWatts(Cup), satellite.Gtant, gsReceiver.GetSysDirectivity(satellite.GetTransmitWavelength()), satellite.f, satellite.bandwidth, satellite.R, gsReceiver.GetSystemTemp(), weather);
display(downlinkSNR);

%% Calculate Total SNR
SNRtot = 1 / ( (1/(10^(uplinkSNR/10))) + (1/(10^(downlinkSNR/10))) ); % Make sure to convert SNR to linear
display(SNRtot);
