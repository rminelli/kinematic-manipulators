% Roberto de Figueiredo Minelli
% UGR - 2016
% SISTEMAS ROB�TICOS INDUSTRIALES

clc
clear all
close all

%Geometria del robot
 
L1=100;
L2=50;

%Evoluci�n Temporal
%Duraci�n
tiempo=5; 
%Passo
passo=0.01; 


%Calcular la cinematica inversa

%Punto inicial 
x=150;
y=0;

theta_inicial=cin_inversa(x,y,L1,L2);

for i=1:2
    if theta_inicial(i)<0
        theta_inicial(i)=theta_inicial(i)+360;
   end; 
end

%Punto Final  
x=0;
y=150;
theta_final=cin_inversa(x,y,L1,L2);

for i=1:2
    if theta_final(i)<0
        theta_final(i)=theta_final(i)+360;
   end; 
end



%Ejecutar funci�n para calcular el polinomio c�bico
[d,v,a]=polinomio_cubico(L1,L2,theta_inicial,theta_final,tiempo,passo);

