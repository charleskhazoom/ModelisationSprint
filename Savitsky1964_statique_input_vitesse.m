%% Évaluation de la performance d'une «planing hull»
% Selon Savitsky 1964
% Par Charles Khazoom
clear;close all;clc
%% Données
m = 600/2.2;%60000/2.2; % kg
L = 4.19; % Longeur du bateau en m
LCG = 0.3*L;%29*12*2.54/100; % m LCG = position du CG (bateau au complet) à partir de la poupe (arrière du bateau)
VCG = 0.15;%2*12*2.54/100; % m ; VCG = ??
b = 0.5;%14*12*2.54/100; % m ; b = beam
beta = 0;%30;%10;% degrés ; deadrise angle
v = 22.2633;%50*1.6/3.6;%40*0.514444; % m/s (1 noeud = 0.514444 m/s); vitesse d'avance du bateau
a = VCG - (b/4)*tand(beta);
% a = 1.39*12*2.54/100;
f = 0.1;%0.5*12*2.54/100;
epsilon = 0; % degrés
global g
g= 9.81;% m/s2, accélération gravitationnelle
global rho
rho = 1000; % kg/m3; eau douce = 1000; eau salée = 1025
methode = 'biss';
% methode = 'it';
%% Planing coefficients
% Cv = v/sqrt(g*b);
% CL_beta = m*g/(0.5*rho*v^2*b^2);% lift coefficient pour un angle beta. 
% Déjà calculés dans la fonction 
%% Calculs
tic
tau = [1:.05:12];%[2 4 6 10 12 15]%
if strcmp(methode,'biss')
    [~,~,~,~,~,c(1),Df(1)] =  statique_input_vitesse_v2(m,LCG,VCG,b,beta,v,a,f,epsilon,tau(1));
    [~,~,~,~,~,c(2),Df(2)] =  statique_input_vitesse_v2(m,LCG,VCG,b,beta,v,a,f,epsilon,tau(end));
elseif strcmp(methode,'it')
    Residus = zeros(size(tau));
    for ii = 1:length(tau)
        [Residus(ii),lambda(ii),D(ii),CL_beta,Cv,c(ii),Df(ii)] =  statique_input_vitesse_v2(m,LCG,VCG,b,beta,v,a,f,epsilon,tau(ii));
    end
end
%%
if strcmp(methode,'biss')
bissection
tau_e = racine_bissection;
end
%% Solution pour laquelle eq35 = 0
if strcmp(methode,'it')

% figure;plot(Residus,tau)
tau_e = interp1(Residus,tau,0); % tau à l'équilibre.
lambda_e = interp1(tau,lambda,tau_e); % lambda à l'équilibre
D_e = interp1(tau,D,tau_e);% Drag horizonal D à l'équilibre
P = D_e*v; % Puissance à l'état d'équilibre

[r,l,d] = statique_input_vitesse(m,LCG,VCG,b,beta,v,a,f,epsilon,tau_e);
end
%% Porpoising Stability

% CL_beta
toc