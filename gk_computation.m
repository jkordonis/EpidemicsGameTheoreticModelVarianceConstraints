%given u_play the vector of players actions we compute gkj=g^K_{j,u_play}(u_dev)

x0 = [(1-I0) (1-I0) I0 I0 0];
[t,x] = ode45(@(t,x) odefcn(t,x,r,u_play,n,a), tspan, x0);
Ts=size(x,1);
Fu=r*x(Ts,5);
J=payoffs( G,S,u_play,Fu,I0 );
gk1=[];
for k=1:length(U)
    u_dev=U(k);
    gk1(k)=J_dev(1,u_dev,G,S,u_play,Fu,I0)-J(1);
    gk2(k)=J_dev(2,u_dev,G,S,u_play,Fu,I0)-J(2);
end
