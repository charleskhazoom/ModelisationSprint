function [r, tau_e] = get_tau_e_v_devine(v_devine,intervalle_tau,Pinput,CstData)
% Cette fonction reçoit en input la vitesse devinée par la méthode de la
% bissection. Pour cette vitesse devinée, elle trouve l'état d'équilibre
% correspondante (tau_e_v_denive, D_e_v_denive, P_e_v_denive) à l'aide de
% la fonction Savitsky1964_statique_input_vitesse_fcn.
% Après avoir appelé la fonction Savitsky1964_statique_input_vitesse_fcn,
% les fonction get_tau_e_v_devine calcule les résidus r, qui correspond à
% la fonction à minimiser dans la fonction  bissection_fcn_Power_input.m.
    [tau_e_v_devine, D_e_v_devine,P_e_v_devine]= Savitsky1964_statique_input_vitesse_fcn(v_devine,intervalle_tau,CstData);
    r = Pinput-P_e_v_devine;
    tau_e = tau_e_v_devine;
