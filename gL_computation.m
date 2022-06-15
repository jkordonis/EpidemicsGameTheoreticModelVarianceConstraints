%given u_play the vector of players actions we compute gLj=g^K_{j,u_play}(u_dev)


x0 = [(1-I0) (1-I0) I0 I0 (1-I0) I0 0 0 0 0 0 0];
j=1;
uc=u_play;
for k=1:length(U)
    u=U(k);
    [t,x] = ode45(@(t,x) odefcn1(t,x,r,u,uc,n,a,j), tspan, x0);
    Tl=size(x,1);
    DF=r*x(Tl,11);
    Fl=r*x(Tl,12);
    Du=(u-uc(j))/n(j);
    DJ1=G(1)*(1-I0)*uc(1)*exp(-uc(1)*Fl)*DF-S(1,j)*uc(1)*Du;
    DJ2=G(2)*(1-I0)*uc(2)*exp(-uc(2)*Fl)*DF-S(2,j)*uc(2)*Du;
    J=payoffs( G,S,uc,Fl,I0 );
    J_av=(n(1)*J(1)+n(2)*J(2))/(n(1)+n(2));
    DJ1_av=DJ1+(1/n(1))*(J_dev(1,u,G,S,uc,Fl,I0)-J(1));
    DJ2_av=DJ2;
    DJ_av= (n(1)*DJ1_av+n(2)*DJ2_av)/(n(1)+n(2));
    DV1= (J_dev(1,u,G,S,uc,Fl,I0)-J_av)^2-(J(1)-J_av)^2+2*n(1)*(J(1)-J_av)*(DJ1-DJ_av);
    DV2= 2*n(2)*(J(2)-J_av)*(DJ2-DJ_av);
    DV= (DV1+DV2)/(n(1)+n(2));
    gL1(k)=DV;
end


j=2;
for k=1:length(U)
    u=U(k);
    [t,x] = ode45(@(t,x) odefcn1(t,x,r,u,uc,n,a,j), tspan, x0);
    Tl=size(x,1);
    DF=r*x(Tl,11);
    F2=r*x(Tl,12);
    Du=(u-uc(j))/n(j);
    DJ1=G(1)*(1-I0)*uc(1)*exp(-uc(1)*F2)*DF-S(1,j)*uc(1)*Du;
    DJ2=G(2)*(1-I0)*uc(2)*exp(-uc(2)*F2)*DF-S(2,j)*uc(2)*Du;
    J=payoffs( G,S,uc,F2,I0 );
    J_av=(n(1)*J(1)+n(2)*J(2))/(n(1)+n(2));
    DJ1_av=DJ1;
    DJ2_av=DJ2+(1/n(2))*(J_dev(2,u,G,S,uc,F2,I0)-J(2));
    DJ_av= (n(1)*DJ1_av+n(2)*DJ2_av)/(n(1)+n(2));
    DV1= 2*n(1)*(J(1)-J_av)*(DJ1-DJ_av);
    DV2= (J_dev(2,u,G,S,uc,F2,I0)-J_av)^2-(J(2)-J_av)^2+2*n(2)*(J(2)-J_av)*(DJ2-DJ_av);
    DV= (DV1+DV2)/(n(1)+n(2));
    gL2(k)=DV;
end
 
 

