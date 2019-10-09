classdef satelliteSystemA
   properties
        % Phsyical properties of the system
        R = 40000000; % The distance the satellite is from earth in meters
        Grant = 50; % The receive antenna directivity in dB
        Gtant = 50; % The transmit antenna directivity in dB
        f = 73*10^9; % The frequency of the transmit signal in hz
        bandwidth = 6*10^6; % The bandwidth of the transmit signal
        
       
        % Properties related to internal components
        Tant = 190; % Temp of antenna in Kelvin
        Glna = 35; % Gain of the LNA in dB.
        Tlna = 627.06; % Temp of LNA in Kelvin
        Gmixer = 0; % Gain of the mixer in dB
        Tmixer = 627.06; % Temp of the mixer in Kelvin
        Ghpa = 40; % Gain of high power amplifer in dB
        Thpa = 298.15; % Temp of hpa in kelvin
   end
   
   methods
       % Calculates the system temperature of the satellite
       % Output Arguments
       %    output - The output system temp in Kelvin
       function output = GetSystemTemp(obj)
           output = obj.Tant + obj.Tlna + obj.Tmixer/(10^(obj.Glna/10)) + obj.Thpa/(10^(obj.Glna/10) + 10^(obj.Gmixer));
       end
       
       % Get the system gain based off internal componenets
       % Output
       %    output - The system gain in dbs
       function output = GetSystemGain(obj)
          output = obj.Glna + obj.Gmixer + obj.Ghpa; 
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