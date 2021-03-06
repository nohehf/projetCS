close all;
clear;

load iter_v0.mat;
load iter_v1.mat;
load iter_v2.mat;
load iter_v3.mat;

lin = [1 : 46];

figure;

semilogy(lin,qv0, lin, qv1, lin,qv2, lin,qv3);
grid on
legend qv0 qv1 qv2 qv3
title 'Erreur générée par les différents scripts.'
figure
semilogy(lin, vecnorm(V0), lin, vecnorm(V1), lin,vecnorm(V2), lin,vecnorm(V3));