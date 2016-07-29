function geometry = StructHullGeometry(boat_geometry)
if not(ischar(boat_geometry))
    error('Input doit �tre un string correpondant � la g�om�trie � loader')
end

% global m L LCG VCG b beta a f epsilon

switch boat_geometry
    case 'Cedarville'
        geometry.m = 600/2.2;%60000/2.2; % kg
        geometry.L = 4.19; % Longeur du bateau en m
        geometry.LCG = 0.3* geometry.L;%29*12*2.54/100; % m LCG = position du CG (bateau au complet) � partir de la poupe (arri�re du bateau)
        geometry.VCG = 0.15;%2*12*2.54/100; % m ; VCG = ??
        geometry.b = 0.5;%14*12*2.54/100; % m ; b = beam
        geometry.beta = 0;%30;%10;% degr�s ; deadrise angle
        geometry.a =  geometry.VCG - (geometry.b/4)*tand(geometry.beta);
        % a = 1.39*12*2.54/100;
        geometry.f = 0.1;%0.5*12*2.54/100;
        geometry.epsilon = 0; % degr�s
    case 'SavitskyExample'
        geometry.m = 60000/2.2; % kg
%         geometry.L = 4.19; % Longeur du bateau en m
        geometry.LCG = 29*12*2.54/100; % m LCG = position du CG (bateau au complet) � partir de la poupe (arri�re du bateau)
        geometry.VCG = 2*12*2.54/100; % m ; VCG = ??
        geometry.b = 14*12*2.54/100; % m ; b = beam
        geometry.beta = 10;% degr�s ; deadrise angle
        geometry.a =  geometry.VCG - (geometry.b/4)*tand(geometry.beta);
        % a = 1.39*12*2.54/100;
        geometry.f = 0.5*12*2.54/100;
        geometry.epsilon = 4; % degr�s
end


