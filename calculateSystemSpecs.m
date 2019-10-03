%% Choose variables
weather = weatherConditions.clear;

satellite = satelliteSystemA;
gsTransmiter = gsTrasmitSystemA;
gsReceiver = gsReceiverSystemA;


%% Calculate SNR for uplink
uplinkSNR = calculateSNR(gsTransmiter.Pt, gsTransmiter.Gtant, satellite.Grant, gsTransmiter.f, gsTransmiter.bandwidth, satellite.R, satellite.GetSystemTemp(), weather);
display(uplinkSNR);

%% Calculate SNR for downlink
downlinkSNR = calculateSNR(satellite.Pt, satellite.Gtant, gsReceiver.Grant, satellite.f, satellite.bandwidth, satellite.R, gsReceiver.GetSystemTemp(), weather);
display(downlinkSNR);


