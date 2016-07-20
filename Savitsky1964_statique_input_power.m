%% Évaluation de la performance d'une «planing hull»
% Selon Savitsky 1964
% Par Charles Khazoom
clear;close all;clc
%% Données
v = 22.2633;%50*1.6/3.6;%40*0.514444; % m/s (1 noeud = 0.514444 m/s); vitesse d'avance du bateau
%% Ajouter les variables globales
GlobalHullGeometry; % load hull geometry
global m L LCG VCG b beta a f epsilon
global g
g= 9.81;% m/s2, accélération gravitationnelle
global rho
rho = 1000; % kg/m3; eau douce = 1000; eau salée = 1025
%% Planing coefficients
% Cv = v/sqrt(g*b);
% CL_beta = m*g/(0.5*rho*v^2*b^2);% lift coefficient pour un angle beta.
% Déjà calculés dans la fonction statique_input_vitesse_v2
%% Calculs
tic
tau = [1 12]; % Fenêtre pour la méthode de la bissection.
tau_e = bissection_fcn(tau(1),tau(end),@statique_input_vitesse_v2,0.01,v)
toc
%% Porpoising Stability

% CL_beta
