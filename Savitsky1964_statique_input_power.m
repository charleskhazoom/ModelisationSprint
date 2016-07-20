%% Évaluation de la performance d'une «planing hull»
% Selon Savitsky 1964
% Par Charles Khazoom
clear;close all;clc
%% Power input

Pinput = 15000;
intervalle_tau = [1 12]; % intervalle pour tau à l'équilibre.
intervalle_vitesse = [20 25];
%%
[v_final,tau_final] = bissection_fcn_Power_input(intervalle_vitesse(1),intervalle_vitesse(2),.001,Pinput,[1 12]);