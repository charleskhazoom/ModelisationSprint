clear;close all;clc
syms T tau epsilon Df N m g c f a D

eq1 = T*cos(tau+epsilon) == Df*cos(tau)+N*sin(tau);
eq2 = N*cos(tau)-Df*sin(tau)+T*sin(tau+epsilon)==m*g;
eq3 = -N*c+T*f-Df*a == 0 ;
% eq4 = D == T*cos(tau+epsilon);
% eq4 = D == m*g*tan(tau)+Df/cos(tau)
% solution = solve(eq1,eq2,eq3,eq4,D)
sol = solve(eq1,eq2,T)

%% 
% A  = T*sin(tau+epsilon)^2+T*cos(tau+epsilon)^2;
 T = sqrt((Df*cos(tau)+N*sin(tau))^2+(m*g-N*cos(tau)+Df*sin(tau))^2)

 T1 = expand(T);
T2 = simplify(T1)
%%

 N = sqrt()


