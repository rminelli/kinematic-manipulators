% Roberto de Figueiredo Minelli
% UGR - 2016
% SISTEMAS ROBÓTICOS INDUSTRIALES
% Dibujo del Robot de dos grados - RR


function robot_rr(Tdv,L1,L2)

[fila,columna] = size(Tdv);

% Generar las trayectorias del efector final - parametros de DH.

DH = [0 0 0; 0 L1 0; 0 L2 0];
v = [1 1 -1]';
DH1 = DH(1:2,:);
v1 = [1 -1]';

for i = 1:columna,
%for i = 1:(columna/50),
   cd3 = cin_directa(Tdv(1:2,i),v,DH);
   cd2 = cin_directa(Tdv(1:1,i),v1,DH1);
   R3(:,2*i-1:2*i) = cd3(1:2,1:2);
   Tj3(:,i) = cd3(1:2,4);
   Tj2(:,i) = cd2(1:2,4);
end

% Gráfica de trayectoria entre los puntos inicial y final
figure(1)
plot(Tj3(1,:), Tj3(2,:),'r:')
%grid on
hold on;
q1 = [0 Tj2(1,1) Tj3(1,1)];
q2 = [0 Tj2(2,1) Tj3(2,1)];
plot(q1(1:2),q2(1:2),'.-',q1(2:3),q2(2:3),'r*') 
Q1 = Tj3(:,1) + 0.07*R3(:,1) + 0.05*R3(:,2);
Q2 = Tj3(:,1) + 0.05*R3(:,2);
Q3 = Tj3(:,1) - 0.05*R3(:,2);
Q4 = Tj3(:,1) + 0.07*R3(:,1) - 0.05*R3(:,2);
Q = [Q1 Q2 Q3 Q4];
plot(Q(1,:),Q(2,:),'-o'),grid


for i = 1:(columna/50),
   ii = i*50;
   q1 = [0 Tj2(1,ii) Tj3(1,ii)];
   q2 = [0 Tj2(2,ii) Tj3(2,ii)];
   plot(q1(1:2),q2(1:2),'b',q1(2:3),q2(2:3),'r')
   Q1 = Tj3(:,ii) + 0.07*R3(:,2*ii-1) + 0.05*R3(:,2*ii);
   Q2 = Tj3(:,ii) + 0.05*R3(:,2*ii);
   Q3 = Tj3(:,ii) - 0.05*R3(:,2*ii);
   Q4 = Tj3(:,ii) + 0.07*R3(:,2*ii-1) - 0.05*R3(:,2*ii);
   Q = [Q1 Q2 Q3 Q4];
   plot(Q(1,:),Q(2,:),'-o') ,grid
end


%plot(-0.25:0.5/100:0.25,zeros(1,150),'linewidth',3)
%plot(-0.25:0.5/100:0.25,-0.04*ones(1,150),'linewidth',3)

plot(-0.25:0.5/100:0.25,zeros(1,101),'linewidth',3)
plot(-0.25:0.5/100:0.25,-0.04*ones(1,101),'linewidth',3)

axis equal

%text(-0.13,-0.3,'Base del robt')
title('Trayectoria entre los puntos inicial y final','fontsize', 14)
xlabel('Eje X','fontsize', 12)
ylabel('Eje Y','fontsize', 12)
hold on;