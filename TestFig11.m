%%Test Fig 11
CL_0 = -0.1:.0001:0.1;
CL_beta = CL_0 - 0.0065*10*CL_0.^0.6;
figure;plot(CL_0,CL_beta)

