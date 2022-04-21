close all;
clear;

% M1 = rand(10);
% M2 = rand(100);
% M3 = rand(250);
% 
% S1 = M1 + M1';
% S2 = M2 + M2';
% S3 = M3 + M3';

% N = 6;
n = 200;
m = 46;
% tolérance
eps = 1e-8;
% nombre d'itérations max pour atteindre la convergence
maxit = 10000;
percentage = .4;
p = 72;
genere = 1;

methods = [0 1 2 3 10 11 12];
temps = zeros(4, length(methods));


for imat = 1:4
    i = 1;
    for v = methods
        
        [~, ~, ~, t_v] = eigen_2022Modifie(imat, n, v, m, eps, maxit, percentage, p, genere);
        temps(imat,i) = t_v;
        i = i + 1;
    end


end

figure;
hold on
for m = [1: length(methods)]
    plot(temps(:,m));
end
legend("méthode subspace iteration v0", ...
    "méthode subspace iteration v1", ...
    "méthode subspace iteration v2", ...
    "méthode subspace iteration v3", ...
    "méthode eig de matlab", ...
    "méthode de la puissance itérée avec déflation", ...
    "méthode de la puissance itérée avec déflation améliorée")

