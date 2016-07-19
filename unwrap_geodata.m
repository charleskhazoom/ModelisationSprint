function [m,L,LCG,VCG,b,beta,a,f,epsilon] = unwrap_geodata(geodata)
data = struct2cell(geodata);
if length(data) ~= 9
    error('Erreur à soupçonner!')
end
% fields = fieldnames(geodata);
% for n = 1:length(fields)
    m = cell2mat(data(1));
    L = cell2mat(data(2));
    LCG = cell2mat(data(3));
    VCG = cell2mat(data(4));
    b = cell2mat(data(5));
    beta = cell2mat(data(6));
    a = cell2mat(data(7));
    f = cell2mat(data(8));
    epsilon = cell2mat(data(9));
% end