function dydt = ode_F_randomizing(t,x,r,u_m,u_M,n,a,u1,u2)
dydt = zeros(9,1);
I_f= u_m*n(1)*x(5)*(1-u1) +u_M*n(1)*x(6)*u1+u_m*n(2)*x(7)*(1-u2)+u_M*n(2)*x(8)*u2;

dydt(1) = -r*u_m*I_f*x(1);
dydt(2) = -r*u_M*I_f*x(2);
dydt(3) = -r*u_m*I_f*x(3);
dydt(4) = -r*u_M*I_f*x(4);
dydt(5) = r*u_m*I_f*x(1)-a(1)*x(5);
dydt(6) = r*u_M*I_f*x(2)-a(1)*x(6);
dydt(7) = r*u_m*I_f*x(3)-a(2)*x(7);
dydt(8) = r*u_M*I_f*x(4)-a(2)*x(8);
dydt(9) = I_f;
end
