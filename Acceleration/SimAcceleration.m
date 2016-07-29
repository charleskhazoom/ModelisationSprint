%% Accélération, modèle simulink
clear;close all;clc
%% Load géométrie
addpath('C:\Users\charl\OneDrive\Documents\Université\Projet Hyperion\Matlab\ModelisationSprint\trunk\')
% GlobalHullGeometry('Cedarville')
% global m L LCG VCG b beta a f epsilon
% %% Load physique
% global g 
% g = 9.81;
% global rho 
% rho = 1000;
geometry = StructHullGeometry('Cedarville');
physics.rho = 1000;
physics.g = 9.81;
%% Conditions initiales
x0 = 0;
Cv0 = 1; % Modèle seulement valide pour certaines valeurs de Cv, à valider ici !
v0x = Cv0*sqrt(geometry.b*physics.g);
%%
dist = 300; % distance à parcourir sur le sprint (m)
intervalle_tau = [1 12];
%%
T = 38491;% 
N= geometry.m*physics.g;
Df = T/10;
% tau = 2;
%% 
sim('Simulink_Accel.slx')
