%% Évaluation de la performance d'une «planing hull»
% Selon Savitsky 1964
% Par Charles Khazoom
clear;close all;clc
%% Données
%% Ajouter les variables globales
tic
GlobalHullGeometry; % load hull geometry
global m L LCG VCG b beta a f epsilon
global g
g= 9.81;% m/s2, accélération gravitationnelle
global rho
rho = 1000; % kg/m3; eau douce = 1000; eau salée = 1025
Pinput = 15000; % INPUT POWER (W)

%% Planing coefficients
% Cv = v/sqrt(g*b);
% CL_beta = m*g/(0.5*rho*v^2*b^2);% lift coefficient pour un angle beta. 
% Déjà calculés dans la fonction 
%% Calculs
% while test
v_devine = 21.5:.05:23;
for k=1:length(v_devine)
    %     k=k+1
    intervalle_tau = [1 12];
    [tau_e_v_devine, D_e_v_devine,P_e_v_devine]= Savitsky1964_statique_input_vitesse_fcn(v_devine(k),intervalle_tau);
    r(k) = Pinput-P_e_v_devine;
end
interp1(r,v_devine,0)


% [r,l,d] = statique_input_power(m,LCG,VCG,b,beta,v,a,f,epsilon,tau_e)
%% Porpoising Stability
toc
% CL_beta
