clear;close all;clc

% addpath('C:\Users\charl\OneDrive\Documents\Université\Projet Hyperion\Logiciels\Matlab\ModelisationSprint\trunk\RegimePermanent');
%%
CstData.geometry = StructHullGeometry('Cedarville');
CstData.physics.g = 9.81;
CstData.physics.rho = 1000;
%%
SimulinkParam = Simulink.Parameter;
SimulinkParam.Value = CstData;
SimulinkParam.DataType = 'struct';
SimulinkParam = Simulink.Parameter;
SimulinkParam.Value = CstData;
SimulinkParam.DataType = 'struct';
% global g
% global rho
% global m L LCG VCG b beta a f epsilon
% InitializeGlobalSimulinkSignals;

%%
vx = 22;
intervalle_tau = [1 12];
sim('Simulink_test_tiberlot')