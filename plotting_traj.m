I0=0.01;
CC=[ 0.02,0.04,0.1 0.14];
x0=  [1-I0;1-I0;1-I0;1-I0;I0 ;I0 ;I0;I0;0]';
[t,x] = ode45(@(t,x) ode_F_randomizing(t,x,r,u_m,u_M,n,a,u1_n,u2_n), tspan, x0);

figure ;
subplot(2,1,1);
hold on;
plot(t,n(1)*x(:,1)*(1-u1_n) +n(1)*x(:,2)*u1_n+n(2)*x(:,3)*(1-u2_n)+n(2)*x(:,4)*u2_n);
subplot(2,1,2);
plot(t,n(1)*x(:,5)*(1-u1_n) +n(1)*x(:,6)*u1_n+n(2)*x(:,7)*(1-u2_n)+n(2)*x(:,8)*u2_n);
hold on;

x0 = [(1-I0) (1-I0) I0 I0 0];
for iter=1:length(CC)
    C=CC(iter);
    find_eq_V_C;
    [val1 ind1]=min(GNE_C_J1);
    u1=GNE_C_u1(ind1);
    u2=GNE_C_u2(ind1);
    u=[u1;u2];
    [t,x] = ode45(@(t,x) odefcn(t,x,r,u,n,a), tspan, x0);
    subplot(2,1,1);
    plot(t,x(:,1)*n(1)+x(:,2)*n(2))
    subplot(2,1,2)
    plot(t,x(:,3)*n(1)+x(:,4)*n(2))
end



subplot(2,1,1);
grid;
xlabel('Time (Days)')
ylabel('Susceptible')
subplot(2,1,1);
legend('Nash','V\leq 0.02','V\leq 0.04','V\leq 0.1', 'V\leq0.14')
title('Total Susceptible')

subplot(2,1,2);
grid;
xlabel('Time (Days)')
ylabel('Infected')
legend('Nash','V\leq 0.02','V\leq 0.04','V\leq 0.1', 'V\leq0.14')
title('Total Infected')