syms m g x epsilon c Df a f
y = m*g*((1-sind(x)*sind(x+epsilon))*c/cosd(x)-f*sind(x)) + Df*(a-f);

g*m*(-f*cosd(tau)+c*secd(tau)*(-cosd(epsilon+tau)*sind(tau)-cosd(tau)*sind(epsilon+tau))+...
    c*secd(tau)*(1-sind(tau)*sind(epsilon+tau))*tand(tau));