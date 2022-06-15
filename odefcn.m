function dydt = odefcn(t,x,r,u,n,a)
dydt = zeros(5,1);
I_f= u(1)*n(1)*x(3)+u(2)*n(2)*x(4);
dydt(1) = -r*u(1)*I_f*x(1);
dydt(2) = -r*u(2)*I_f*x(2);
dydt(3) = r*u(1)*I_f*x(1)-a(1)*x(3);
dydt(4) = r*u(2)*I_f*x(2)-a(2)*x(4);
dydt(5) = I_f;
end
