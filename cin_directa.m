% Roberto de Figueiredo Minelli
% UGR - 2016
% SISTEMAS ROBÓTICOS INDUSTRIALES
% Cinematica Directa

function cd = cin_directa(Tdv,v,DH)

n = size(Tdv)*[1 0]';
n1 = length(v);
cd = eye(4);
for i = 1:n,
   alpha = DH(i,1);
   a = DH(i,2);
   if v(i) == 1,
      d = DH(i,3);
      tetha = Tdv(i);
   else
      d = Tdv(i);
      tetha = DH(i,3);
   end
   cd = cd*Transformacion_basica(alpha,a,d,tetha);
end
if n1 > n,
   alpha = DH(n1,1);
   a = DH(n1,2);
   d = DH(n1,3);
   tetha = 0;
   cd = cd*Transformacion_basica(alpha,a,d,tetha);
end

   
      
      
      
 



