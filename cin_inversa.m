% Roberto de Figueiredo Minelli
% UGR - 2016
% SISTEMAS ROBÓTICOS INDUSTRIALES
% Cinemática Inversa

function theta=cin_inversa(x,y,L1,L2)
    M=(x^2+y^2-L1^2-L2^2)/(2*L1*L2);
    s2=sqrt(1-M^2); 
    
    theta_2=atan2(s2,M);
    
    c1=L1+L2*M;
    c2=L2*s2;
    
    theta_1=atan2(y,x)-atan2(c2,c1);
   
    theta=[theta_1, theta_2]*180/pi;
    
return
