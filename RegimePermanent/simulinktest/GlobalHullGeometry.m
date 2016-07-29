function GlobalHullGeometry(boat_geometry)
if not(ischar(boat_geometry))
    error('Input doit être un string correpondant à la géométrie à loader')
end

global m L LCG VCG b beta a f epsilon

switch boat_geometry
    case 'Cedarville'
        m = 600/2.2;%60000/2.2; % kg
        L = 4.19; % Longeur du bateau en m
        LCG = 0.3* L;%29*12*2.54/100; % m LCG = position du CG (bateau au complet) à partir de la poupe (arrière du bateau)
        VCG = 0.15;%2*12*2.54/100; % m ; VCG = ??
        b = 0.5;%14*12*2.54/100; % m ; b = beam
        beta = 0;%30;%10;% degrés ; deadrise angle
        a =  VCG - (b/4)*tand( beta);
        % a = 1.39*12*2.54/100;
        f = 0.1;%0.5*12*2.54/100;
        epsilon = 0; % degrés
    case 'SavitskyExample'
        m = 60000/2.2; % kg
%         L = 4.19; % Longeur du bateau en m
        LCG = 29*12*2.54/100; % m LCG = position du CG (bateau au complet) à partir de la poupe (arrière du bateau)
        VCG = 2*12*2.54/100; % m ; VCG = ??
        b = 14*12*2.54/100; % m ; b = beam
        beta = 10;% degrés ; deadrise angle
        a =  VCG - (b/4)*tand( beta);
        % a = 1.39*12*2.54/100;
        f = 0.5*12*2.54/100;
        epsilon = 4; % degrés
end
