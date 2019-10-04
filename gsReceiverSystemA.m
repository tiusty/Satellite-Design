classdef gsReceiverSystemA
    % The ground station that receives the signal from the satellite
   properties
        % Phsyical properties of the system
        Dant = 5; % The diameter of the antenna
        Aef = 89; % The percent efficient of the aperature
        
        % Properties related to internal components
        Tant = 190; % Temp of antenna in Kelvin
        Tlna = 50; % Temp of LNA in Kelvin
        Glna = 30; % Gain of the LNA in dB
        Tmixer = 80; % Temp of the mixer in Kelvin
        Gmixer = 0; % Gain of the mixer in dB
   end
   
   methods
       % Returns the temperture of the system
       % Output Arguments
       %    output - the system temperature in kelvin
       function output = GetSystemTemp(obj)
           output = obj.Tant + obj.Tlna + obj.Tmixer/(10^(obj.Gmixer/10));
       end
       
       % Returns the directivity of the system based on the intrinsics of
       % the antenna
       % Output Arguments
       %    output - The directivity in dBi
       function output = GetSysDirectivity(obj)
            output = l0*log10((obj.Aef * pi * obj.Dant) / obj.GetTransmitWavelength());
       end
       
       % Gets the wavelength of the system based on the tramsmission
       % frequnecy
       % Output Arguments
       %    output - The wavelength of the signal in meters
       function output = GetTransmitWavelength(obj)
           output = (3*10^6)/(obj.f);
       end
   end
end