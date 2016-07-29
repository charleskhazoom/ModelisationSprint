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
'real','InitialValue','geometry.m','SamplingMode','Sample based')

set(L,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.L','SamplingMode','Sample based')
 
set(LCG,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.LCG','SamplingMode','Sample based')
 
set(VCG,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.VCG','SamplingMode','Sample based')
 
set(b,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.b','SamplingMode','Sample based')
 
set(beta,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.beta','SamplingMode','Sample based')
 set(a,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.a','SamplingMode','Sample based')

set(f,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.f','SamplingMode','Sample based')
 
set(epsilon,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','geometry.epsilon','SamplingMode','Sample based')
 
set(g,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','physics.g','SamplingMode','Sample based')

set(rho,'DataType','double','Dimensions',1,'Complexity',...
'real','InitialValue','physics.rho','SamplingMode','Sample based')
