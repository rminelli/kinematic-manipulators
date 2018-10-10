% Roberto de Figueiredo Minelli
% UGR - 2016
% SISTEMAS ROB�TICOS INDUSTRIALES
% Polinomios Cubicos

function [d,v,a]=polinomio_cubico(L1,L2,theta_inicial,theta_final,tiempo,passo)

n=length(theta_inicial);
for i=1:n
    % Valores Polinomios Cubicos
    a0 = theta_inicial(i);
    a1 = 0;
    a2 = 3/tiempo^2*(theta_final(i)-theta_inicial(i));
    a3 =-2/tiempo^3*(theta_final(i)-theta_inicial(i));

    % Valores de las trajet�rias. Tiempo, desplaziamento e velocidad.
    t = 0:passo:tiempo;
    d = a0+a1.*t+a2.*t.^2+a3.*t.^3;
    v = a1+2.*a2.*t+3.*a3.*t.^2;
    a = 2.*a2+6.*a3.*t;
    Tdv(i,:)=d;

    % Desplaziamento
    
	hold on;
    figure(2)
    plot(t,d)
    title('Tiempo X Desplaziamento','fontsize', 14)
    xlabel('Tiempo (s)','fontsize', 12)
    ylabel('Grados (g)','fontsize', 12)
    if i==1
        text(1,a0+a1+a2+a3,'Articulaci�n 1')
    else
        text(1,a0+a1+a2+a3,'Articulaci�n 2')
    end
    axis square
    
    % Velocidad
	
    hold on;
    figure(3)
    plot(t,v)
    title('Tiempo X Velocidad','fontsize', 14)
    xlabel('Tiempo (s)','fontsize', 12)
    ylabel('Velocidad (g/s)','fontsize', 12)
    if i==1
        text(1,a1+2*a2+3*a3,'Articulaci�n 1')
    else
        text(1,a1+2*a2+3*a3,'Articulaci�n 2')
    end
    axis square
    
    % Aceleraci�n
	
    hold on;
    figure(4)
    plot(t,a)
    title('Tiempo X Aceleraci�n','fontsize', 14)
    xlabel('Tiempo (s)','fontsize', 12)
    ylabel('Aceleraci�n (deg/s^2)','fontsize', 12)
    if i==1
        text(1,2*a2+6*a3,'Articulaci�n 1')
    else
        text(1,2*a2+6*a3,'Articulaci�n 2')
    end
    axis square
end
% Representar gr�ficos

robot_rr(Tdv*pi/180,L1,L2)