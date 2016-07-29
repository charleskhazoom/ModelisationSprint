function [r, tau_e] = get_tau_e_v_devine(v_devine,intervalle_tau,Pinput,CstData)
% Cette fonction re�oit en input la vitesse devin�e par la m�thode de la
% bissection. Pour cette vitesse devin�e, elle trouve l'�tat d'�quilibre
% correspondante (tau_e_v_denive, D_e_v_denive, P_e_v_denive) � l'aide de
% la fonction Savitsky1964_statique_input_vitesse_fcn.
% Apr�s avoir appel� la fonction Savitsky1964_statique_input_vitesse_fcn,
% les fonction get_tau_e_v_devine calcule les r�sidus r, qui correspond �
% la fonction � minimiser dans la fonction  bissection_fcn_Power_input.m.
    [tau_e_v_devine, D_e_v_devine,P_e_v_devine]= Savitsky1964_statique_input_vitesse_fcn(v_devine,intervalle_tau,CstData);
    r = Pinput-P_e_v_devine;
    tau_e = tau_e_v_devine;
