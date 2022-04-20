clear variables;clc
% tolerance relative minimum pour l'ecart entre deux iteration successives 
% de la suite tendant vers la valeur propre dominante 
% (si |lambda-lambda_old|/|lambda_old|<eps, l'algo a converge)
eps = 1e-8;
% nombre d iterations max pour atteindre la convergence 
% (si i > kmax, l'algo finit)
imax = 5000; 

% Generation d une matrice rectangulaire aleatoire A de taille n x p.
% On cherche le vecteur propre et la valeur propre dominants de AA^T puis
% de A^TA
n = 1500; p = 500;
A = 5*randn(n,p);

% AAt, AtA sont deux matrices carrees de tailles respectives (n x n) et 
% (p x p). Elles sont appelees "equations normales" de la matrice A
AAt = A*A'; AtA = A'*A;

%% Methode de la puissance iteree pour la matrice AAt de taille nxn
% Point de depart de l'algorithme de la puissance iteree : un vecteur
% aleatoire, normalise
x = ones(n,1); x = x/norm(x);

cv = false;
iv1 = 0;        % pour compter le nombre d'iterations effectuees
t_v1 = cputime; % pour calculer le temps d execution de l'algo
err1 = 0;       % indication que le calcul est satisfaisant
                % on stoppe quand err1 < eps 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODER L'ALGORITHME DE LA PUISSANCE ITEREE POUR LA MATRICE AAt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% V1 = orth(rand(1500,1));
% while(~cv)
%    iv1 = iv1 + 1
%    y = AAt * V1;
%    H = V1' * AAt * V1;
%    %H = V1' * y;
%    err1 = norm(AAt * V1 - V1 * H) / norm(AAt);
%    V1 = orth(y);
%    cv = (err1 <= eps || iv1 >= imax);
% end
% t_v1 = cputime-t_v1; % t_version1 : temps d execution de l algo de la 
                     % puissance iteree pour la matrice AAt

V1 = orth(rand(size(AAt)));
while(~cv)
   iv1 = iv1 + 1;
   y = AAt * V1;
   H = V1' * AAt * V1;
   err1 = norm(AAt * V1 - V1 * H) / norm(AAt);
   cv = (err1 <= eps || iv1 >= imax);
   V1 = orth(y);
end
lambda1 =mean((AAt * V1(:, 1) )./ V1(:, 1) );
t_v1 = cputime-t_v1;
                     

%% Methode de la puissance iteree pour la matrice AtA de taille pxp
% Point de depart de l'algorithme de la puissance iteree : un vecteur
% aleatoire, normalise
y = ones(p,1); 
y = y/norm(y);

cv = false;
iv2 = 0;        % pour compter le nombre d iterations effectuees
t_v2 = cputime; % pour calculer le temps d execution de l'algo
err2 = 0;       % indication que le calcul est satisfaisant
                % on stoppe quand err2 < eps 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODER L ALGORITHME DE LA PUISSANCE ITEREE POUR LA MATRICE AtA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

V2 = orth(rand(size(AtA)));
while(~cv)
   iv2 = iv2 + 1;
   y = AtA * V2;
   H = V2' * AtA * V2;
   err2 = norm(AtA * V2 - V2 * H) / norm(AtA);
   cv = (err2 <= eps || iv2 >= imax);
   V2 = orth(y);
end
lambda2 =mean((AtA * V2(:, 1) )./ V2(:, 1) );
t_v2 = cputime-t_v2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% APRES VOUS ETRE ASSURE DE LA CONVERGENCE DES DEUX METHODES, AFFICHER 
% L'ECART RELATIF ENTRE LES DEUX VALEURS PROPRES TROUVEES, ET LE TEMPS
% MOYEN PAR ITERATION POUR CHACUNE DES DEUX METHODES. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Erreur pour la methode avec la grande matrice = %0.3e\n', err1);
fprintf('Erreur pour la methode avec la petite matrice = %0.3e\n', err2);
fprintf('Ecart relatif entre les deux valeurs propres trouvees = %1.2e\n', (err1 - err2)/(max(err1,err2)))
fprintf('Temps pour une ite avec la grande matrice = %0.3e\n', t_v1/iv1);
fprintf('Temps pour une ite avec la petite matrice = %0.3e\n', t_v2/iv2);

D = eig(AAt);
D = sort(D, 'descend');

fprintf('\nValeur propre dominante (methode avec la grande matrice) = %0.3e\n', lambda1);
fprintf('Valeur propre dominante (methode avec la petite matrice) = %0.3e\n', lambda2);
fprintf('Valeur propre dominante (fonction eig) = %0.3e\n', D(1));
