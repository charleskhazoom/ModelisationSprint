function [racine_bissection,D_e,Df_e] = bissection_fcn_v_input(A,B,precision,v,CstData)
% global g
% global rho
% global m L LCG VCG b beta a f epsilon
%% Méthode de la bissection
% input : soit vitesse ou Power.
 yA =  statique_input_vitesse(v,A,CstData);
 yB =  statique_input_vitesse(v,B,CstData);
while abs(A-B) > precision
    C=(A+B)/2;
%     [yC,~,~,~,~,cC,DfC] =  fcn_hdle(input,C);
yC =  statique_input_vitesse(v,C,CstData);
    if (yA*yC<=0)
        B=C;
    else
        A=C;
    end
end
racine_bissection=(A+B)/2;%tau_e
[~,~,D_e,~,~,~,Df_e] =  statique_input_vitesse(v,racine_bissection,CstData);
