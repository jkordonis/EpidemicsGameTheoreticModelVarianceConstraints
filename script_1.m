% initialize the partial derivatives
partial_J1_partial_u1=[];
partial_J1_partial_u2=[];
partial_J2_partial_u1=[];
partial_J2_partial_u2=[];


%initial conditions (infection)
I0=0.01;
x0 = [(1-I0) (1-I0) I0 I0 0];

l=length(U);


%Small constant to compute the derivatives according to the centered
%Euler's method
epsil = 0.0001;

for i=1:l
    for j=1:l
        u=[U(i) U(j)];
        [t,x] = ode45(@(t,x) odefcn(t,x,r,u,n,a), tspan, x0);
        Ts=size(x,1);
        F(i,j)=r*x(Ts,5); 
        f=F(i,j);
        J=payoffs( G,S,u,f,I0 );
        J1(i,j)=J(1);
        J2(i,j)=J(2);
        V(i,j)=variance( J, n );
        
        %u1<-- u_1+epsil
        u=[U(i)+epsil U(j)];
        [t,x] = ode45(@(t,x) odefcn(t,x,r,u,n,a), tspan, x0);
        Ts=size(x,1);
        f = r*x(Ts,5); 
        J=payoffs( G,S,u,f,I0 );
        J1_u1_pl_epsil=J(1);
        J2_u1_pl_epsil=J(2);
        
        %u1<-- u_1-epsil
        u=[U(i)-epsil U(j)];
        [t,x] = ode45(@(t,x) odefcn(t,x,r,u,n,a), tspan, x0);
        Ts=size(x,1);
        f = r*x(Ts,5); 
        J=payoffs( G,S,u,f,I0 );
        J1_u1_min_epsil=J(1);
        J2_u1_min_epsil=J(2);

     
        %u2<-- u_2+epsil
        u=[U(i) U(j)+epsil];
        [t,x] = ode45(@(t,x) odefcn(t,x,r,u,n,a), tspan, x0);
        Ts=size(x,1);
        f = r*x(Ts,5); 
        J=payoffs( G,S,u,f,I0 );
        J1_u2_pl_epsil=J(1);
        J2_u2_pl_epsil=J(2);
                
        %u2<-- u_2-epsil
        u=[U(i) U(j)-epsil];
        [t,x] = ode45(@(t,x) odefcn(t,x,r,u,n,a), tspan, x0);
        Ts=size(x,1);
        f = r*x(Ts,5); 
        J=payoffs( G,S,u,f,I0 );
        J1_u2_min_epsil=J(1);
        J2_u2_min_epsil=J(2);
        
        partial_J1_partial_u1(i,j) = (J1_u1_pl_epsil-J1_u1_min_epsil)/(2*epsil);
        partial_J1_partial_u2(i,j) = (J1_u2_pl_epsil-J1_u2_min_epsil)/(2*epsil);
        partial_J2_partial_u1(i,j) = (J2_u1_pl_epsil-J2_u1_min_epsil)/(2*epsil);
        partial_J2_partial_u2(i,j) = (J2_u2_pl_epsil-J2_u2_min_epsil)/(2*epsil);
        
        determ(i,j) = det([partial_J1_partial_u1(i,j), partial_J1_partial_u2(i,j);
                           partial_J2_partial_u1(i,j), partial_J2_partial_u2(i,j)]);
        
    end
end 


max(max(V))
min(min(V))


