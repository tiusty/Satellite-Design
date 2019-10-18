classdef gsTrasmitSystemA
    % The ground station that trasmits to the satellite
   properties
        % Phsyical properties of the system
        Dant = 30; % The diameter of the antenna in meters
        Aef = 67; % The percent efficient of the aperature
        Pt = 4000; % Power of the transmitted signal in Watts 
        f = 83 * 10^9 % 83 GHZ transmit signal frequency
        bandwidth = 6*10^6; % 6MHz transmit bandwidth
   end
   
   methods
       % Returns the directivity of the system based on the intrinsics of
       % the antenna
       % Output Arguments
       %    output - The directivity in dBi
       function output = GetSysDirectivity(obj)
            output = 10*log10((obj.Aef * pi * obj.Dant) / obj.GetTransmitWavelength());
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