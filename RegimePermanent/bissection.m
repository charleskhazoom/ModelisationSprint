%% Méthode de la bissection

A=tau(1);
B=tau(end);
cA=c(1);
cB=c(end);
DfA = Df(1);
DfB = Df(end);
y = @(tau0,c,Df) m*g*((1-sind(tau0)*sind(tau0+epsilon))*c/cosd(tau0)-f*sind(tau0)) + Df*(a-f);
precision = 0.05;
yA=y(A,cA,DfA);
yB=y(B,cB,DfB);
nb_iter_bissection=0;                       % pas nécessaire
while abs(A-B)>precision
    C=(A+B)/2;
    [~,~,~,~,~,cC,DfC] =  statique_input_vitesse_v2(m,LCG,VCG,b,beta,v,a,f,epsilon,C);
    yC=y(C,cC,DfC);
    nb_iter_bissection=nb_iter_bissection+1;% pas nécessaire
    if (yA*yC<=0)
        B=C;
%         yB=y(B);                            % pas nécessaire
    else
        A=C;
%         yA=y(A);
    end
end
racine_bissection=(A+B)/2;