%% Évaluation de la performance d'une «planing hull»
% Selon Savitsky 1964
% Par Charles Khazoom
%% Données
function [tau_e,D_e,P_e,Df_e] = Savitsky1964_statique_input_vitesse_fcn(v,intervalle_tau)
%% Ajouter les variables globales
% GlobalHullGeometry('SavitskyExample'); % load hull geometry
% GlobalHullGeometry('Cedarville');
% global m L LCG VCG b beta a f epsilon
% global g
% g = 9.81;% m/s2, accélération gravitationnelle
% global rho
% rho = 1000; % kg/m3; eau douce = 1000; eau salée = 1025
global g
global rho
global m L LCG VCG b beta a f epsilon
%% Planing coefficients
% Cv = v/sqrt(g*b);
% CL_beta = m*g/(0.5*rho*v^2*b^2);% lift coefficient pour un angle beta.
% Déjà calculés dans la fonction statique_input_vitesse_v2
%% Calculs
[tau_e, D_e,Df_e] = bissection_fcn_v_input(intervalle_tau(1),intervalle_tau(end),0.001,v);
P_e = D_e*v;
%% Porpoising Stabilityd

% CL_beta
