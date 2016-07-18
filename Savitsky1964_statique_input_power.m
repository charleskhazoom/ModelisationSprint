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
% v = 50*1.6/3.6;%40*0.514444; % m/s (1 noeud = 0.514444 m/s); vitesse d'avance du bateau
Pinput = 15000; % INPUT POWER (W)
a = VCG - (b/4)*tand(beta);
% a = 1.39*12*2.54/100;
f = 0.1;%0.5*12*2.54/100;
epsilon = 0; % degrés
global g
g= 9.81;% m/s2, accélération gravitationnelle
global rho
rho = 1000; % kg/m3; eau douce = 1000; eau salée = 1025
%% Planing coefficients
% Cv = v/sqrt(g*b);
% CL_beta = m*g/(0.5*rho*v^2*b^2);% lift coefficient pour un angle beta. 
% Déjà calculés dans la fonction 
%% Calculs
% tau = [1:.1:8];%[2 4 6 10 12 15]%
test = 1;
v_devine(1) = 20;
k = 0;
% while test
v_devine = 21.5:.05:23;
for k=1:length(v_devine)
%     k=k+1
    tau = [1:.1:8];%[2 4 6 10 12 15]%
    Residus = zeros(size(tau));
    for ii = 1:length(tau)
        [Residus(ii),lambda(ii),D(ii),CL_beta,Cv,c(ii),Df(ii)] =  statique_input_vitesse_v2(m,LCG,VCG,b,beta,v_devine(k),a,f,epsilon,tau(ii));
    end
    %% Méthode de Newton
    %%%%%%%% Fonctionne mal %%%%%%%
    % tau0=2.25;
    % eps=0.001;
    %     [~,~,~,~,~,c,Df] =  statique_input_power(m,LCG,VCG,b,beta,v,a,f,epsilon,tau0);
    %
    % y = m*g*((1-sind(tau0)*sind(tau0+epsilon))*c/cosd(tau0)-f*sind(tau0)) + Df*(a-f);
    %
    % Dy=-g*m*(f*cosd(tau0) + (c*(cosd(epsilon + tau0)*sind(tau0) + sind(epsilon + tau0)*cosd(tau0)))/cosd(tau0) + (c*sind(tau0)*(sind(epsilon + tau0)*sind(tau0) - 1))/cosd(tau0)^2);
    % k=0;
    % tau1=tau0-y/Dy;
    % while abs(tau1-tau0)>eps
    %     tau0=tau1;
    %     [~,~,~,~,~,c,Df] =  statique_input_power(m,LCG,VCG,b,beta,v,a,f,epsilon,tau0);
    % Dy=-g*m*(f*cosd(tau0) + (c*(cosd(epsilon + tau0)*sind(tau0) + sind(epsilon + tau0)*cosd(tau0)))/cosd(tau0) + (c*sind(tau0)*(sind(epsilon + tau0)*sind(tau0) - 1))/cosd(tau0)^2);
    %     if Dy<eps&&Dy>-eps
    %         disp('Dérivée nulle : L''itération a été interrompue')
    %         break ;
    %     end
    %     y = m*g*((1-sind(tau0)*sind(tau0+epsilon))*c/cosd(tau0)-f*sind(tau0)) + Df*(a-f);
    %     tau1=tau0-y/Dy;
    %     k=k+1
    % end
    % tau_e_Newton=tau1;
    %% Solution pour laquelle eq35 = 0
    % figure;plot(Residus,tau)
    tau_e(k) = interp1(Residus,tau,0);%,'linear','extrap'); % tau à l'équilibre.
    lambda_e(k) = interp1(tau,lambda,tau_e(k));%,'linear','extrap'); % lambda à l'équilibre
    D_e(k) = interp1(tau,D,tau_e(k));%,'linear','extrap');% Drag horizonal D à l'équilibre
    P_e(k) = D_e(k)*v_devine(k); % Puissance à l'état d'équilibre
    
    r(k) = Pinput-P_e(k);
%     test = abs(r(k))> 100;
%     v_devine(k+1)=v_devine(k)*1.1; %= Pinput/D_e(k);
    % if (Pinput-P_e)>= 0; % vitesse sous-estimée
    %      v_devine(k) = v_devine(k-1)*1.02;
    % else % cas où (Pinput-P_e)< 0; % vitesse sur-estimée
    %     v_devine(k) = v_devine(k-1)*0.98;
    % end
end
interp1(r,v_devine,0)


% [r,l,d] = statique_input_power(m,LCG,VCG,b,beta,v,a,f,epsilon,tau_e)
%% Porpoising Stability

% CL_beta
