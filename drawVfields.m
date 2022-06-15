CC=[0.02  0.0411  0.07  0.1 0.2 0.3];
for count=1:length(CC)
    C=CC(count);
A=contour(U,U,V',[C C]);
A=A(:,2:end);
X=[];
Y=[];
V_1_y=[];
V_1_par_x=[];
V_1_par_y=[];
V_1_perp_x=[];
V_1_perp_y=[];
V_1_x=[];
ii=0;
for cnt=1:10:length(A)
    ii=ii+1;
	[minival, i_dense] = min(abs(U-A(1,cnt)));%find the appropriate indices
    [minival, j_dense] = min(abs(U-A(2,cnt)));
    Vec1=[partial_J1_partial_u1(i_dense,j_dense);partial_J1_partial_u2(i_dense,j_dense)];
    Vec2=[partial_J2_partial_u1(i_dense,j_dense);partial_J2_partial_u2(i_dense,j_dense)];
    Vec3=Vec2-Vec1;    
   
    V3_unit = Vec3/norm(Vec3);
    
    v_1_parall_v3 = (V3_unit'*Vec1)*V3_unit;
    v_1_perp_v3 = Vec1-v_1_parall_v3;
    
    v_1_parall_v3 =0.02*v_1_parall_v3 /(.1+norm(v_1_parall_v3 ));
    v_1_perp_v3 = 0.02*v_1_perp_v3 /(.1+norm(v_1_perp_v3 ));
    
    
    
    X(ii)=U(i_dense);
    Y(ii)=U(j_dense); 

    V_1_par_x(ii)=-v_1_parall_v3(1);
    V_1_par_y(ii)=-v_1_parall_v3(2);
    V_1_perp_x(ii)=-v_1_perp_v3(1);
    V_1_perp_y(ii)=-v_1_perp_v3(2);   
end
hold on
quiver(X,Y,V_1_par_x,V_1_par_y,'MaxHeadSize',0.05, 'AutoScale','Off')
quiver(X,Y,V_1_perp_x,V_1_perp_y,'MaxHeadSize',0.05 ,'AutoScale','Off')
end
%legend('V=0.02', '','','V=0.04', '','','V=0.07', '','','V=0.1', '','','V=0.2', '','','V=0.3', '','')

