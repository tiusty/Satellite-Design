classdef satelliteSystemA
   properties
        % Phsyical properties of the system
        R = 36000000; % The distance the satellite is from earth in meters
        Grant = 50; % The receive antenna directivity in dB
        Gtant = 50; % The transmit antenna directivity in dB
        f = 73*10^9; % The frequency of the transmit signal in hz
        bandwidth = 18*10^6; % The bandwidth of the transmit signal
        
       
        % System gains
        Glna = 35; % Gain of the LNA in dB.
        GpaHigh = 20; % PA gain of 80.5-86.5 GHZ
        Gdownconv = 10; % Down converter from 81Ghz
        Gupconv = 35; % Up convert to 71 Ghz
        GpaLow = 25; % PA gain of 70.5-76.5 Ghz
        Ghpa = 40; % Gain of high power amplifer in dB              
        
        % Properties related to internal components
        % Properites in Kelin
        Tant = 190; % Temp of antenna in Kelvin
        
        % Properites based off Noise Floor        
        NFpahigh = 4; % NF of PA 80.5-86.5 GHZ
        NFdownconv = 5; % NF of down converter
        NFupconv = 28; % NF of up converter
        NFlna = 4; % NF of LNA
        NFhpa = 4; % NF of HPA
        NFpalow = 4; % NF of PA 70.5-76.5 GHZ  
   end
   
   methods
       % Calculates the temperature based on the Noise Figure
       function output = GetTempFromNF(~, nf)
          output = constants.To*(10^(nf/10) - 1);
       end
       % Calculates the system temperature of the satellite
       % Output Arguments
       %    output - The output system temp in Kelvin
       function output = GetSystemTemp(obj)
           output = obj.Tant + obj.GetTempFromNF(obj.NFlna) + obj.GetTempFromNF(obj.NFpahigh)/10^(obj.Glna/10) + obj.GetTempFromNF(obj.NFdownconv)/10^((obj.Glna + obj.GpaHigh)/10) + obj.GetTempFromNF(obj.NFupconv)/10^((obj.Glna + obj.GpaHigh + obj.Gdownconv)/10) + obj.GetTempFromNF(obj.NFpalow)/10^((obj.Glna + obj.GpaHigh + obj.Gdownconv + obj.Gupconv)/10) + obj.GetTempFromNF(obj.NFhpa)/10^((obj.Glna + obj.GpaHigh + obj.Gdownconv + obj.Gupconv + obj.GpaLow)/10);
       end
       
       % Get the system gain based off internal componenets
       % Output
       %    output - The system gain in dbs
       function output = GetSystemGain(obj)
          output = obj.Glna + obj.GpaHigh + obj.Gdownconv + obj.Gupconv + obj.GpaLow + obj.Ghpa; 
       end
       
       % Based on the received power of the satellite, calculates the power transmitted based
       % on internal componenets
       % Input Arguments
       %    Pr - recieved power in dB
       % Output Arguments
       %    output - the power transmitted by the sattelite in dBs
       function output = GetPtFromPrdB(obj, Pr)
           output = Pr + obj.GetSystemGain();
       end
       
       % Same as above but outputs the Pt in Watts
       function output = GetPtFromPrWatts(obj, Pr)
           output = 10^(obj.GetPtFromPrdB(Pr)/10); % Convert the output to Watts
       end
       
       % Gets the wavelength of the system based on the tramsmission
       % frequnecy
       % Output Arguments
       %    output - The wavelength of the signal in meters
       function output = GetTransmitWavelength(obj)
           output = physconst('LightSpeed')/(obj.f);
       end
   end
end