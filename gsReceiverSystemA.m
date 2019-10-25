classdef gsReceiverSystemA
    % The ground station that receives the signal from the satellite
   properties
        % Phsyical properties of the system
        Dant = 5; % The diameter of the antenna
        Aef = 67; % The percent efficient of the aperature
        
        % Properties related to internal components
        Tant = 30; % Temp of antenna in Kelvin
        Tlna = 110; % Temp of LNA in Kelvin
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
       % the antenna and the receiving wavelength
       % Input Arguments
       %    wavelength - The wavelength that the gs is receiving
       % Output Arguments
       %    output - The directivity in dBi
       function output = GetSysDirectivity(obj, wavelength)
            output = 10*log10((obj.Aef * pi * obj.Dant) / wavelength);
       end
   end
end