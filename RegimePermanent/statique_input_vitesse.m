function [Residus,lambda,D,CL_beta,Cv,c,Df] = statique_input_vitesse(v,tau,CstData)
% global g
% global rho
% global m L LCG VCG b beta a f epsilon
%%
m = CstData.geometry.m;
L = CstData.geometry.L;
LCG = CstData.geometry.LCG;
VCG = CstData.geometry.VCG;
b = CstData.geometry.b;
beta = CstData.geometry.beta;
a = CstData.geometry.a;
f = CstData.geometry.f;
epsilon = CstData.geometry.epsilon;
g = CstData.physics.g;
rho = CstData.physics.rho;
%%
%%%% Planing coefficients
Cv = v/sqrt(g*b);
CL_beta = m*g/(0.5*rho*v^2*b^2);% lift coefficient pour un angle beta.
% if not(Cv >= 1)
%     warning('Attention, le mod�le est seulement valide pour Cv >= 1')
% end
%%%%% *g pour que ce soit consistent avec l'utilisation des slugs.
%%%% Calcul de CL_0
r = roots([1,0,-0.0065*beta,0,0,-CL_beta]); % = sqrt(lambda), voir �quation 2 surlign�e en jaune, p.71 de mon logbook1
CL_0 = r((imag(r)==0))^5; %%%%%%% valider que le 3e est toujours la solution � partie essentiellement r�elle.

if length(CL_0)>1
    error('Calcul CL_0 : Attention, plus d''une racine r�elle a �t� trouv�e')
elseif isempty(CL_0)
    error('Calcul CL_0 : Attention, aucune racine r�elle n''a �t� trouv�e')
end

%%%% Calcul de lambda
r = roots([0.0055/Cv/Cv,0,0,0,0.0120,-CL_0/(tau^1.1)]); % = sqrt(lambda), voir �quation 1 surlign�e en jaune, p.71 de mon logbook1
lambda = r((imag(r)==0))^2;

if length(lambda)>1
    error('Calcul lambda : Attention, plus d''une racine r�elle a �t� trouv�e')
elseif isempty(lambda)
    error('Calcul lambda : Attention, aucune racine r�elle n''a �t� trouv�e')
end

%%%% Calcul de vm
vm = v*sqrt(1 - (0.0120*sqrt(lambda)*tau^1.1 -...
    0.0065*beta*(0.0120*sqrt(lambda)*tau^1.1)^0.6)/lambda/cosd(tau));

%%%% Calcul nombre de Reynolds Re

% nu = 1.007e-6; % viscosit� cin�matique (m2/s) , eau � 20degr�sC
% %source wiki : https://fr.wikipedia.org/wiki/Viscosit%C3%A9_cin%C3%A9matique
nu = 0.9293091e-06; % valeur utilis�e par Savitsky.
Re = vm*lambda*b/nu;

%%%% Calcul Cf
Cf = 0.075/((log10(Re)-2)^2); %%%% L'auteur propose  Schoenherr Cf formula,
% mais j'ai d�cid� de prendre le mod�le de l'ITTC, Source : Introduction to
% Naval Architecture, p.143.
% Selon Introduction to Naval Architecture, p.143, Cf selon Shoenherr est
% donn�e par l'�quation 0.242/sqrt(Cf) = log10(Rn*Cf).
delta_Cf = 0.0004 ;% ATTC Standard Roughness

%%%% Calcul Df, (frictional drag)
Df = rho*vm^2*lambda*b^2*(Cf+delta_Cf)/2/cosd(beta);

%%%% Calcul D (Drag total)
T = (m*g*sind(tau)+Df)/cosd(epsilon);
N = (m*g + Df*sind(tau)-T*sind(tau+epsilon))/cosd(tau);
D = Df*cosd(tau)+N*sind(tau);

%%%% Calcul de c
Cp = 0.75 - 1/(5.21*Cv^2/lambda^2+2.39);
lp = Cp*lambda*b;
c = LCG - lp;

%%%% �quation 35 de Savitsky1964 � mettre �gale � 0.
Residus = N*c + Df*a-T*f;
end

