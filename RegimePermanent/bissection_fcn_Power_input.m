function [v_final,tau_final] = bissection_fcn_Power_input(vA,vB,precision,Pinput,intervalle_tau,CstData)
%% Méthode de la bissection
% Cette fonction trouve l'état d'équilibre (vitesse v_final et angle tau_final)
% d'une coque en régime permanent. Il faut donner en input une fenêtre de
% vitesse devinée, puis un intervalle de tau correspondant.
% La solution doit de trouver à l'intérieur de l'intervalle pour que le
% l'algorithme converge.

 yvA =  get_tau_e_v_devine(vA,intervalle_tau,Pinput,CstData);
%  get_tau_e_v_devine ; Il s'agit de la fonction à mettre = 0 à l'aide de
%  la méthode de la bissection.
 yvB =  get_tau_e_v_devine(vB,intervalle_tau,Pinput,CstData);
while abs(vA-vB) > precision
    vC=(vA+vB)/2;
%     [yC,~,~,~,~,cC,DfC] =  fcn_hdle(v,C);
yC =  get_tau_e_v_devine(vC,intervalle_tau,Pinput,CstData);
    if (yvA*yC<=0)
        vB=vC;
    else
        vA=vC;
    end
end
v_final = (vA+vB)/2;%tau_e
[~,tau_final] =  get_tau_e_v_devine(v_final,intervalle_tau,Pinput,CstData);
end
%%

% v_devine = 21.5:.01:23;
% for k=1:length(v_devine)
%     %     k=k+1
%     intervalle_tau = [1 12];
%     [tau_e_v_devine, D_e_v_devine,P_e_v_devine]= Savitsky1964_statique_input_vitesse_fcn(v_devine(k),intervalle_tau);
%     r(k) = Pinput-P_e_v_devine;
% end
% interp1(r,v_devine,0)

