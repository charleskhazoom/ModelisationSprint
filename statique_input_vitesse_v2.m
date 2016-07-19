function [Residus,lambda,D,CL_beta,Cv,c,Df] = statique_input_vitesse_v2(v,tau)
global g
global rho
global m L LCG VCG b beta a f epsilon
%%%% Planing coefficients
Cv = v/sqrt(g*b);
CL_beta = m*g/(0.5*rho*v^2*b^2);% lift coefficient pour un angle beta.
if not(Cv >= 1)
    warning('Attention, le modèle est seulement valide pour Cv >= 1')
end
%%%%% *g pour que ce soit consistent avec l'utilisation des slugs.
%%%% Calcul de CL_0
r = roots([1,0,-0.0065*beta,0,0,-CL_beta]); % = sqrt(lambda), voir équation 2 surlignée en jaune, p.71 de mon logbook1
CL_0 = r((imag(r)==0))^5; %%%%%%% valider que le 3e est toujours la solution à partie essentiellement réelle.

if length(CL_0)>1
    error('Calcul CL_0 : Attention, plus d''une racine réelle a été trouvée')
elseif isempty(CL_0)
    error('Calcul CL_0 : Attention, aucune racine réelle n''a été trouvée')
end

%%%% Calcul de lambda
r = roots([0.0055/Cv/Cv,0,0,0,0.0120,-CL_0/(tau^1.1)]); % = sqrt(lambda), voir équation 1 surlignée en jaune, p.71 de mon logbook1
lambda = r((imag(r)==0))^2; 

if length(lambda)>1
    error('Calcul lambda : Attention, plus d''une racine réelle a été trouvée')
elseif isempty(lambda)
    error('Calcul lambda : Attention, aucune racine réelle n''a été trouvée')
end

%%%% Calcul de vm
% if beta == 0;
%     vm = v*sqrt(1-0.0120*tau^1.1/sqrt(lambda)/cosd(tau)); %%%%% Only if beta == 0;
% if beta == 10
%     switch tau
%         case 2
%             vm = 67.0*12*2.54/100;
%         case 3
%             vm = 66.6*12*2.54/100;
%         case 4
%             vm = 66.2*12*2.54/100;
%         otherwise
%             vm = (67 + 66.6)/2*12*2.54/100;
%     end
% else % if beta == 0;
%     vm = v*sqrt(1-0.0120*tau^1.1/sqrt(lambda)/cosd(tau)); %%%%% Only if beta == 0;
% end
%     vm = v*sqrt(1-0.0120*tau^1.1/sqrt(lambda)/cosd(tau)); %%%%% Only if beta == 0;
vm = v*sqrt(1 - (0.0120*sqrt(lambda)*tau^1.1 -...
    0.0065*beta*(0.0120*sqrt(lambda)*tau^1.1)^0.6)/lambda/cosd(tau));

%%%% Calcul nombre de Reynolds Re

% nu = 1.007e-6; % viscosité cinématique (m2/s) , eau à 20degrésC
% %source wiki : https://fr.wikipedia.org/wiki/Viscosit%C3%A9_cin%C3%A9matique 
nu = 0.9293091e-06; % valeur utilisée par Savitsky.
Re = vm*lambda*b/nu;

%%%% Calcul Cf
Cf = 0.075/((log10(Re)-2)^2); %%%% L'auteur propose  Schoenherr Cf formula,
% mais j'ai décidé de prendre le modèle de l'ITTC, Source : Introduction to
% Naval Architecture, p.143.
% Selon Introduction to Naval Architecture, p.143, Cf selon Shoenherr est
% donnée par l'équation 0.242/sqrt(Cf) = log10(Rn*Cf).
delta_Cf = 0.0004 ;% ATTC Standard Roughness

%%%% Calcul Df, (frictional drag)
% Df = rho*vm^2*lambda*b^2*(Cf+delta_Cf)/2/cosd(beta);
% switch tau
%     case 2
%         Df = 7340/2.2*g;
%     case 3
%         Df =    5160/2.2*g;
%     case 4
%         Df =3760/2.2*g;
%     otherwise
        Df = rho*vm^2*lambda*b^2*(Cf+delta_Cf)/2/cosd(beta);
% end

%%%% Calcul D (Drag total)
% D = Df/cosd(tau) + m*g*tand(tau); % Ce calcul du drag néglige le lift 
% généré par le trust, qui peut avoir une composante verticale.
% N = m*g*(1-sind(tau)*sind(tau+epsilon))/cosd(tau);
T = (m*g*sind(tau)+Df)/cosd(epsilon);

N = (m*g + Df*sind(tau)-T*sind(tau+epsilon))/cosd(tau);
% T1 =( m*g- N*cosd(tau)+Df*sind(tau))/sind(tau+epsilon)
% T2 =(N*sind(tau)+Df*cosd(tau))/cosd(tau+epsilon)
D = Df*cosd(tau)+N*sind(tau);
%%%% Calcul de c
Cp = 0.75 - 1/(5.21*Cv^2/lambda^2+2.39);
lp = Cp*lambda*b;
c = LCG - lp;


%%%% Équation 35 de Savitsky1964 à mettre égale à 0.
% eq35 = @(m,g,tau,epsilon,a,c,f) m*g*((1-sind(tau)*sind(tau+epsilon))*c/cosd(tau)-f*sind(tau)) + Df*(a-f);
% Residus =  eq35(m,g,tau,epsilon,a,c,f);
Residus = N*c + Df*a-T*f;

% Residus = m*g*((1-sind(tau)*sind(tau+epsilon))*c/cosd(tau)-f*sind(tau)) + Df*(a-f); %%%%%%%% quantité à mettre égale à 0;


end

