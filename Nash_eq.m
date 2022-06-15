k=0;
u1_n=[];u2_n=[];
J1_n=[];J2_n=[];

% Is (0,0) an equilibrium?
u1=0;  u2=0;
x0= [1-I0;1-I0;1-I0;1-I0;I0 ;I0 ;I0;I0;0]';
[t,x] = ode45(@(t,x) ode_F_randomizing(t,x,r,u_m,u_M,n,a,u1,u2), tspan, x0);
F = r*x(end,end);
u1_bar = u_m*(1-u1)+u_M*u1;   u2_bar = u_m*(1-u2)+u_M*u2;

if ( G(1)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))>=(u_M-u_m)*(S(1,1)*u1_bar+S(1,2)*u2_bar) )
    if ( G(2)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))>=(u_M-u_m)*(S(2,1)*u1_bar+S(2,2)*u2_bar) )
        k=k+1;
        u1_n(k)=u1;
        u2_n(k)=u2;
        J1_n(k)=G(1)*( I0+ (1-I0)*(1- exp(-u1_bar*F)))-u1_bar *(S(1,1)*u1_bar+S(1,2)*u2_bar); 
        J2_n(k)=G(2)*( I0+ (1-I0)*(1- exp(-u2_bar*F)))-u2_bar *(S(2,1)*u1_bar+S(2,2)*u2_bar);
    end
end



% Is (1,0) an equilibrium?
u1=1; u2=0;
x0= [1-I0;1-I0;1-I0;1-I0;I0 ;I0 ;I0;I0;0]';
[t,x] = ode45(@(t,x) ode_F_randomizing(t,x,r,u_m,u_M,n,a,u1,u2), tspan, x0);
F = r*x(end,end);
u1_bar = u_m*(1-u1)+u_M*u1;   u2_bar = u_m*(1-u2)+u_M*u2;

if ( G(1)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))<=(u_M-u_m)*(S(1,1)*u1_bar+S(1,2)*u2_bar) )
    if ( G(2)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))>=(u_M-u_m)*(S(2,1)*u1_bar+S(2,2)*u2_bar) )
        k=k+1;
        u1_n(k)=u1;
        u2_n(k)=u2;
        J1_n(k)=G(1)*( I0+ (1-I0)*(1- exp(-u1_bar*F)))-u1_bar *(S(1,1)*u1_bar+S(1,2)*u2_bar); 
        J2_n(k)=G(2)*( I0+ (1-I0)*(1- exp(-u2_bar*F)))-u2_bar *(S(2,1)*u1_bar+S(2,2)*u2_bar);
    end
end

% Is (0,1) an equilibrium?
u1=0; u2=1;
 x0= [1-I0;1-I0;1-I0;1-I0;I0 ;I0 ;I0;I0;0]';
[t,x] = ode45(@(t,x) ode_F_randomizing(t,x,r,u_m,u_M,n,a,u1,u2), tspan, x0);
F = r*x(end,end);
u1_bar = u_m*(1-u1)+u_M*u1;   u2_bar = u_m*(1-u2)+u_M*u2;

if ( G(1)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))>=(u_M-u_m)*(S(1,1)*u1_bar+S(1,2)*u2_bar) )
    if ( G(2)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))<=(u_M-u_m)*(S(2,1)*u1_bar+S(2,2)*u2_bar) )
        k=k+1;
        u1_n(k)=u1;
        u2_n(k)=u2;
        J1_n(k)=G(1)*( I0+ (1-I0)*(1- exp(-u1_bar*F)))-u1_bar *(S(1,1)*u1_bar+S(1,2)*u2_bar); 
        J2_n(k)=G(2)*( I0+ (1-I0)*(1- exp(-u2_bar*F)))-u2_bar *(S(2,1)*u1_bar+S(2,2)*u2_bar);
    end
end

% Is (1,1) an equilibrium?
u1=1; u2=1;
 x0= [1-I0;1-I0;1-I0;1-I0;I0 ;I0 ;I0;I0;0]';;
[t,x] = ode45(@(t,x) ode_F_randomizing(t,x,r,u_m,u_M,n,a,u1,u2), tspan, x0);
F = r*x(end,end);
u1_bar = u_m*(1-u1)+u_M*u1;   u2_bar = u_m*(1-u2)+u_M*u2;

if ( G(1)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))<=(u_M-u_m)*(S(1,1)*u1_bar+S(1,2)*u2_bar) )
    if ( G(2)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))<=(u_M-u_m)*(S(2,1)*u1_bar+S(2,2)*u2_bar) )
        k=k+1;
        u1_n(k)=u1;
        u2_n(k)=u2;
        J1_n(k)=G(1)*( I0+ (1-I0)*(1- exp(-u1_bar*F)))-u1_bar *(S(1,1)*u1_bar+S(1,2)*u2_bar); 
        J2_n(k)=G(2)*( I0+ (1-I0)*(1- exp(-u2_bar*F)))-u2_bar *(S(2,1)*u1_bar+S(2,2)*u2_bar);
    end
end











% Search for indif on u2=0 u1:free
u2=0;
for ii=1:101    
    u1=(ii-1)/100;
    x0= [1-I0;1-I0;1-I0;1-I0;I0 ;I0 ;I0;I0;0]';
    [t,x] = ode45(@(t,x) ode_F_randomizing(t,x,r,u_m,u_M,n,a,u1,u2), tspan, x0);
    F = r*x(end,end);
    u1_bar = u_m*(1-u1)+u_M*u1;   u2_bar = u_m*(1-u2)+u_M*u2;
 
    Indiff_1(ii)= ( G(1)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))-(u_M-u_m)*(S(1,1)*u1_bar+S(1,2)*u2_bar) );
    if ii>1
        if Indiff_1(ii-1)*Indiff_1(ii)<0
            x=(ii-2)/100;
            y=Indiff_1(ii-1);
            x_=(ii-1)/100;
            y_=Indiff_1(ii);
            u1=(y_*x-x_*y)/(y_-y);
            if ( G(2)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))>=(u_M-u_m)*(S(2,1)*u1_bar+S(2,2)*u2_bar) )
                k=k+1;
                u1_n(k)=u1;
                u2_n(k)=u2;
                J1_n(k)=G(1)*( I0+ (1-I0)*(1- exp(-u_m*F)))-u_m *(S(1,1)*u1_bar+S(1,2)*u2_bar); 
                J2_n(k)=G(2)*( I0+ (1-I0)*(1- exp(-u_m*F)))-u_m *(S(2,1)*u1_bar+S(2,2)*u2_bar);
            end
        end
    end                
end

% Search for indif on u2=1 u1:free

u2=1;
for ii=1:101    
    u1=(ii-1)/100;
      x0= [1-I0;1-I0;1-I0;1-I0;I0 ;I0 ;I0;I0;0]';
    [t,x] = ode45(@(t,x) ode_F_randomizing(t,x,r,u_m,u_M,n,a,u1,u2), tspan, x0);
    F = r*x(end,end);
    u1_bar = u_m*(1-u1)+u_M*u1;   u2_bar = u_m*(1-u2)+u_M*u2;
 
    Indiff_1(ii)= ( G(1)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))-(u_M-u_m)*(S(1,1)*u1_bar+S(1,2)*u2_bar) );
    if ii>1
        if Indiff_1(ii-1)*Indiff_1(ii)<0
            x=(ii-2)/100;
            y=Indiff_1(ii-1);
            x_=(ii-1)/100;
            y_=Indiff_1(ii);
            u1=(y_*x-x_*y)/(y_-y);
            if ( G(2)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))<=(u_M-u_m)*(S(2,1)*u1_bar+S(2,2)*u2_bar) )
                k=k+1;
                u1_n(k)=u1;
                u2_n(k)=u2;
                J1_n(k)=G(1)*( I0+ (1-I0)*(1- exp(-u_m*F)))-u_m *(S(1,1)*u1_bar+S(1,2)*u2_bar); 
                J2_n(k)=G(2)*( I0+ (1-I0)*(1- exp(-u_M*F)))-u_M *(S(2,1)*u1_bar+S(2,2)*u2_bar);
           end
        end
    end                
end


% Search for indif on u1=0 u2:free
u1=0;
for ii=1:101    
    u2=(ii-1)/100;
    x0= [1-I0;1-I0;1-I0;1-I0;I0 ;I0 ;I0;I0;0]';
    [t,x] = ode45(@(t,x) ode_F_randomizing(t,x,r,u_m,u_M,n,a,u1,u2), tspan, x0);
    F = r*x(end,end);
    u1_bar = u_m*(1-u1)+u_M*u1;   u2_bar = u_m*(1-u2)+u_M*u2;
 
    Indiff_2(ii)= ( G(2)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))-(u_M-u_m)*(S(2,1)*u1_bar+S(2,2)*u2_bar) );

    if ii>1
        if Indiff_2(ii-1)*Indiff_2(ii)<0
            x=(ii-2)/100;
            y=Indiff_2(ii-1);
            x_=(ii-1)/100;
            y_=Indiff_2(ii);
            u2=(y_*x-x_*y)/(y_-y);
            if ( G(1)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))>=(u_M-u_m)*(S(1,1)*u1_bar+S(1,2)*u2_bar) )
                k=k+1;
                u1_n(k)=u1;
                u2_n(k)=u2;
                J1_n(k)=G(1)*( I0+ (1-I0)*(1- exp(-u_m*F)))-u_m *(S(1,1)*u1_bar+S(1,2)*u2_bar); 
                J2_n(k)=G(2)*( I0+ (1-I0)*(1- exp(-u_M*F)))-u_M *(S(2,1)*u1_bar+S(2,2)*u2_bar);
            end
        end
    end                
end




% Search for indif on u1=1 u2:free
u1=1;
for ii=1:101    
    u2=(ii-1)/100;
    x0=  [1-I0;1-I0;1-I0;1-I0;I0 ;I0 ;I0;I0;0]';
    [t,x] = ode45(@(t,x) ode_F_randomizing(t,x,r,u_m,u_M,n,a,u1,u2), tspan, x0);
    F = r*x(end,end);
    u1_bar = u_m*(1-u1)+u_M*u1;   u2_bar = u_m*(1-u2)+u_M*u2;
 
    Indiff_2(ii)= ( G(2)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))-(u_M-u_m)*(S(2,1)*u1_bar+S(2,2)*u2_bar) );

    if ii>1
        if Indiff_2(ii-1)*Indiff_2(ii)<0
            x=(ii-2)/100;
            y=Indiff_2(ii-1);
            x_=(ii-1)/100;
            y_=Indiff_2(ii);
            u2=(y_*x-x_*y)/(y_-y);
            if ( G(1)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))<=(u_M-u_m)*(S(1,1)*u1_bar+S(1,2)*u2_bar) )
                k=k+1;
                u1_n(k)=u1;
                u2_n(k)=u2;
                J1_n(k)=G(1)*( I0+ (1-I0)*(1- exp(-u_M*F)))-u_M *(S(1,1)*u1_bar+S(1,2)*u2_bar); 
                J2_n(k)=G(2)*( I0+ (1-I0)*(1- exp(-u_M*F)))-u_M *(S(2,1)*u1_bar+S(2,2)*u2_bar);
            end
        end
    end                
end



% Search for indif on u1:free  u2:free
flag=(1==2); 
Indiff_2=[];
for ii=1:101    
    u2=(ii-1)/100;
    u1 = (   ( G(1)*(S(2,1)+S(2,2))-G(2)*(S(1,1)+S(1,2)))*u_m/(u_M-u_m)-u2*(G(2)*S(1,2)-G(1)*S(2,2))) /(G(2)*S(1,1)-G(1)*S(2,1));
    if (0<=u1)&(u1<=1)
     x0=  [1-I0;1-I0;1-I0;1-I0;I0 ;I0 ;I0;I0;0]';
        [t,x] = ode45(@(t,x) ode_F_randomizing(t,x,r,u_m,u_M,n,a,u1,u2), tspan, x0);
        F = r*x(end,end);
        u1_bar = u_m*(1-u1)+u_M*u1;   u2_bar = u_m*(1-u2)+u_M*u2;        
        
        Indiff_2(ii)= ( G(2)*(1-I0)*(exp(-u_m*F)-exp(-u_M*F))-(u_M-u_m)*(S(2,1)*u1_bar+S(2,2)*u2_bar) );
        if flag
            if Indiff_2(ii-1)*Indiff_2(ii)<0
                x=(ii-2)/100;
                y=Indiff_2(ii-1);
                x_=(ii-1)/100;
                y_=Indiff_2(ii);
                u2=(y_*x-x_*y)/(y_-y);
                u1 = (   ( G(1)*(S(2,1)+S(2,2))-G(2)*(S(1,1)+S(1,2)))*u_m/(u_M-u_m)-u2*(G(2)*S(1,2)-G(1)*S(2,2))) /(G(2)*S(1,1)-G(1)*S(2,1));
                k=k+1;
                u1_n(k)=u1;
                u2_n(k)=u2;
                J1_n(k)=G(1)*( I0+ (1-I0)*(1- exp(-u_M*F)))-u_M *(S(1,1)*u1_bar+S(1,2)*u2_bar); 
                J2_n(k)=G(2)*( I0+ (1-I0)*(1- exp(-u_M*F)))-u_M *(S(2,1)*u1_bar+S(2,2)*u2_bar);
                u1_int=u1;
                u2_int=u2;
            %    error();
            end
        end
        flag = (1==1);
    end
end


%figure
%hold on;
%plot(u1_n,u2_n,'.','markersize',20)
%figure
%hold on;
%plot(J1_n,J2_n,'.','markersize',20)






[J1_n;J2_n]'
[u1_n;u2_n]'