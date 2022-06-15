function dydt = odefcn1(t,x,r,u,uc,n,a,j)
dydt = zeros(12,1);
I_f= uc(1)*n(1)*x(3)+uc(2)*n(2)*x(4);
dydt(1) = -r*uc(1)*I_f*x(1);
dydt(2) = -r*uc(2)*I_f*x(2);
dydt(3) = r*uc(1)*I_f*x(1)-a(1)*x(3);
dydt(4) = r*uc(2)*I_f*x(2)-a(2)*x(4);
dydt(5) = -r*u*I_f*x(5);
dydt(6) = r*u*I_f*x(5)-a(j)*x(6);
I_f1=uc(1)*n(1)*x(9)+uc(2)*n(2)*x(10);
dydt(7) = -r*uc(1)*I_f*x(7) -r*uc(1)*x(1)*(I_f1+x(6)-x(j+2));
dydt(8) = -r*uc(2)*I_f*x(8) -r*uc(1)*x(2)*(I_f1+x(6)-x(j+2));
dydt(9) = r*uc(1)*I_f*x(7)-a(1)*x(9) +r*uc(1)*x(1)*(I_f1+x(6)-x(j+2));
dydt(10) = r*uc(2)*I_f*x(8)-a(2)*x(10) +r*uc(1)*x(2)*(I_f1+x(6)-x(j+2));
dydt(11) = I_f1+x(6)-x(j+2);
dydt(12) = I_f;
end