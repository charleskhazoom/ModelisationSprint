clear;close all;clc

%%
CstData.geometry = StructHullGeometry('Cedarville');
CstData.physics.g = 9.81;
CstData.physics.rho = 1000;
%%
v =    22.2946;
intervalle_tau = [1 12];
%%
[tau_e,D_e,P_e,Df_e] = Savitsky1964_statique_input_vitesse_fcn(v,intervalle_tau,CstData)