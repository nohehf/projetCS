clear all;
format long;

%%%%%%%%%%%%
% PARAMÈTRES
%%%%%%%%%%%%

% taille de la matrice symétrique
n = 500;

% type de la matrice (voir matgen_csad)
% imat == 1 valeurs propres D(i) = i
% imat == 2 valeurs propres D(i) = random(1/cond, 1) avec leur logarithmes
%                                  uniformément répartie, cond = 1e10
% imat == 3 valeurs propres D(i) = cond**(-(i-1)/(n-1)) avec cond = 1e5
% imat == 4 valeurs propres D(i) = 1 - ((i-1)/(n-1))*(1 - 1/cond) avec cond = 1e2

% on génère la matrice (1) ou on lit dans un fichier (0)
% si vous avez déjà généré la matrice d'une certaine taille et d'un type donné
% vous pouvez mettre cette valeur à 0
genere = 0;

% méthode de calcul
v = 10; % eig
imat = 1;
[W1, ~, ~] = eigen_2021(imat, n, v, [], [], [], [], [], genere);
imat = 2;
[W2, ~, ~] = eigen_2021(imat, n, v, [], [], [], [], [], genere);
imat = 3;
[W3, ~, ~] = eigen_2021(imat, n, v, [], [], [], [], [], genere);
imat = 4;
[W4, ~, ~] = eigen_2021(imat, n, v, [], [], [], [], [], genere);

subplot(221);
histogram(W1, 50);
title('repartition des valeurs propres sur une matrice de type 1 500x500', 'FontSize', 15);
subplot(222);
histogram(W2, 50);
title('repartition des valeurs propres sur une matrice de type 2 500x500', 'FontSize', 15);
subplot(223);
histogram(W3, 50);
title('repartition des valeurs propres sur une matrice de type 3 500x500', 'FontSize', 15);
subplot(224);
histogram(W4, 50);
title('repartition des valeurs propres sur une matrice de type 4 500x500', 'FontSize', 15);
