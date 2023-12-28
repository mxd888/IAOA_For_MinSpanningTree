function [distance, angle] = calc_distance(Aw,Aj,Bw,Bj)

% [distance (km), angle (degree)] = calc_distance(A_lat,A_lon,B_lat,B_lon)
% Calculating the epicentral distance of two points
% You need to enter the coordinates of two points A and B
% All coordinates can be entered in degrees or degrees, minutes and seconds
% The coordinates in the format of degrees, minutes and seconds should be input in string, 
% the coordinates in degrees can be input in string or number
% e.g., [distace, angle] = calc_distance(27.3397, 128.352, 18.81, 119.911)
% e.g., calc_distance(27.3397, -128.352, '18.48.36', '119.54.40'), return distance
% e.g., [~, angle] = calc_distance('-27.3397', 128.352, '18.48.36', 119.911), return angle
% Yuechu WU
% 12131066@mail.sustech.edu.cn
% updated 2022-05-30

Aw = num2str(Aw);
Aj = num2str(Aj);
Bw = num2str(Bw);
Bj = num2str(Bj);

% Radius of the earth (km)
R = 6378.1370;

if length(find(Aw=='.')) > 1
    DMS = find(Aw=='.');M = DMS(1);S = DMS(2);
    Aw = str2double(Aw(1:M-1))+str2double(Aw(M+1:S-1))/60+str2double(Aw(S+1:end))/3600;
else
    Aw = str2double(Aw);
end

if length(find(Aj=='.')) > 1
    DMS = find(Aj=='.');M = DMS(1);S = DMS(2);
    Aj = str2double(Aj(1:M-1))+str2double(Aj(M+1:S-1))/60+str2double(Aj(S+1:end))/3600;
else
    Aj = str2double(Aj);
end

if length(find(Bw=='.')) > 1
    DMS = find(Bw=='.');M = DMS(1);S = DMS(2);
    Bw = str2double(Bw(1:M-1))+str2double(Bw(M+1:S-1))/60+str2double(Bw(S+1:end))/3600;
else
    Bw = str2double(Bw);
end

if length(find(Bj=='.')) > 1
    DMS = find(Bj=='.');M = DMS(1);S = DMS(2);
    Bj = str2double(Bj(1:M-1))+str2double(Bj(M+1:S-1))/60+str2double(Bj(S+1:end))/3600;
else
    Bj = str2double(Bj);
end

Aw = Aw*pi/180;
Aj = Aj*pi/180;

Bw = Bw*pi/180;
Bj = Bj*pi/180;


distance = 2*R*asin(sqrt((sin((Bw-Aw)/2).^2)+cos(Aw)*cos(Bw)*(sin((Bj-Aj)/2)).^2));

angle = (distance/R)*180/pi;

end

