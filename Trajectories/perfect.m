lon_start = 38.661029;
lat_start = -9.202821;
alt_start = 550;

lon_7 = 38.7185;
lat_7 = -9.169229;
alt_7 = tan(3*pi/180)*7000;

lon_aero = 38.77559;
lat_aero = -9.13536;
alt_aero = 0;

len_data = 1800;
len_7 = 450;

lon = 0:len_data;
lat = 0:len_data;
alt = 0:len_data;
x = 0:len_data;
dist = 0:len_data;

pitch = 0:len_data;
roll = 0:len_data;
yaw = 0:len_data;

for k = 1:len_data+1
    if (k <= len_7)
        lon(k) = lon_start+(lon_7-lon_start)/(len_7)*k;
        lat(k) = lat_start+(lat_7-lat_start)/(len_7)*k;
        alt(k) = alt_start+(alt_7-alt_start)/(len_7)*k;
    else
        lon(k) = lon_7+(lon_aero-lon_7)/(len_data-len_7)*(k-len_7-1);
        lat(k) = lat_7+(lat_aero-lat_7)/(len_data-len_7)*(k-len_7-1);
        alt(k) = alt_7+(alt_aero-alt_7)/(len_data-len_7)*(k-len_7-1);
    end
    
    pitch(k) = 5;
    roll(k) = 0;
    yaw(k) = 25;

    fi1 = lat(k)*pi/180;
    fi2 = lat_aero*pi/180;
    delta_fi = (lat_aero-lat(k))*pi/180;
    delta_lambda = (lon_aero-lon(k))*pi/180;
    a = sin(delta_fi/2)*sin(delta_fi/2)+cos(fi1)*cos(fi2)*sin(delta_lambda/2)*sin(delta_lambda/2);
    c = 2*atan(sqrt(a)/sqrt(1-a));
    dist(k) = 6371*c;
end
close all;
plot(x,alt);
%hold on;
%hline = refline([0 alt_7]);
%hline.Color = 'r';

%A = [x;lon; lat; alt];
%fileID = fopen('perfect_pos.txt','w');
%fprintf(fileID,'%f %f %f %f\r\n',A);
%fclose(fileID);

%A = [pitch;roll;yaw];
%fileID = fopen('perfect_att.txt','w');
%fprintf(fileID,'AB CD EF GH %f %f %f\r\n',A);
%fclose(fileID);

%str_lon = 1:len_data;
%for k = 1:len_data+1
%    d = int(lon(k));
%    m = int((lon(k)-d))*60;
%    s = (lon(k)-d-m/60)*3600;
%    str_lon(k)= sprintf('%d%d.%f'  
%
%end

A = [lon;lat;alt;pitch;roll;yaw];
fileID = fopen('C:\Users\paulo\Dropbox\SAInt\ILS\client_dummy\perfect.txt','w');
fprintf(fileID,'%f;%f;%f;%f;%f;%f\r\n',A);
fclose(fileID);
lat(1)





