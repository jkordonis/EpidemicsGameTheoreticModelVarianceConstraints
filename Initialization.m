%time horizon
tspan = [0 100];

%population size/percentage/concentrations
%N=[800 200];
%n=N./(N*[1 1]');
n=[0.8 0.2];

%initial conditions (infection)
I0=0.01;
x0 = [(1-I0) (1-I0) I0 I0 0];

%epidemic's parameters
r=5/16;
a=[1 1]/8;
%a_d=[0.99 0.75];

%payoffs' parameters
%G=50*(a-a_d)./a;
%G =24.0*[2 10];
G =[2 3.5];

%S=[2 0.5; 0.5 2];
%S=[1 1]'*n;
S=[2 0.5;2 0.5];

%action spaces
u_m=0.5 ;
u_M=0.8;
U=[u_m:0.002:u_M];
l=length(U);

u1_store=ones(3)/0;
u2_store=ones(3)/0;
Nash_eq
 
%figure;   plot(u1_n,u2_n,'.','markersize',20); grid; 
%figure;  hold on; plot(J1_n,J2_n,'.','markersize',20); grid; 

%j_ = (J1_n*n(1)+ J2_n*n(2))/(n(1)+n(2))

%V = ( n(1)*(J1_n-j_).^2 +  n(2)*(J2_n-j_).^2 ) /(n(1)+n(2))