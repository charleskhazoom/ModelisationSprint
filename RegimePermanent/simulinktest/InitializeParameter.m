% Cet script initialise la variable dans le «model workspace»
m = Simulink.Signal;
L = Simulink.Signal;
LCG = Simulink.Signal;
VCG = Simulink.Signal;
b = Simulink.Signal;
beta = Simulink.Signal;
a = Simulink.Signal;
f = Simulink.Signal;
epsilon = Simulink.Signal;
g = Simulink.Signal;
rho = Simulink.Signal;

set(m,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.m')

set(L,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.L')
 
set(LCG,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.LCG')
 
set(VCG,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.VCG')
 
set(b,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.b')
 
set(beta,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.beta')
 set(a,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.a')

set(f,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.f')
 
set(epsilon,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.epsilon')
 
set(g,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','physics.g')

set(rho,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','physics.rho')
