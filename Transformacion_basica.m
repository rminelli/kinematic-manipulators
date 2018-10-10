% Roberto de Figueiredo Minelli
% UGR - 2016q
% SISTEMAS ROBÓTICOS INDUSTRIALES
% Transformacion Básica de DH

function Tb = Transformacion_basica(alpha,a,d,tetha)
 
Tb = eye(4);
cc = cos(tetha);
sc = sin(tetha);
ca = cos(alpha);
sa = sin(alpha);
Tb(1,1) = cc;
Tb(1,2) = -sc;
Tb(1,4) = a;
Tb(2,1) = sc*ca;
Tb(2,2) = cc*ca;
Tb(2,3) = -sa;
Tb(2,4) = -sa*d;
Tb(3,1) = sc*sa;
Tb(3,2) = cc*sa;
Tb(3,3) = ca;
Tb(3,4) = ca*d;
 

 
   
      
      
      
 



