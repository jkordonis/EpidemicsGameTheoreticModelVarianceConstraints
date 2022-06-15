% Plotting the cones of improvement 

%subset of U 
U_sparse = [0.5:0.02:0.8];
v_pol_1_x=[];
v_pol_1_y=[];
v_pol_2_x=[];
v_pol_2_y=[];

cnt=0;
for ii=1:length(U_sparse)
    for jj=1:length(U_sparse)
        cnt=cnt+1;
        X(cnt)=U_sparse(ii);
        Y(cnt)=U_sparse(jj);
        [minival, i_dense] = min(abs(U-X(cnt)));%find the appropriate indices
        [minival, j_dense] = min(abs(U-Y(cnt)));
        Vec1=[partial_J1_partial_u1(i_dense,j_dense);partial_J1_partial_u2(i_dense,j_dense)];
        Vec2=[partial_J2_partial_u1(i_dense,j_dense);partial_J2_partial_u2(i_dense,j_dense)];
        Vec3=Vec2-Vec1;
        
        vec_pol_1(2) =Vec3(1);
        vec_pol_1(1) =-Vec3(2);
        
        if vec_pol_1*Vec1<0
            vec_pol_1=-vec_pol_1;
        end
        vec_pol_2(2) =Vec1(1);
        vec_pol_2(1) =-Vec1(2);
        
        if vec_pol_2*Vec3<0
            vec_pol_2=-vec_pol_2;
        end
        
        
        v_pol_1_x(cnt) =-vec_pol_1(1)/(2+norm(vec_pol_1));
        v_pol_1_y(cnt) =-vec_pol_1(2)/(2+norm(vec_pol_1));
        v_pol_2_x(cnt) =-vec_pol_2(1)/(2+norm(vec_pol_2));
        v_pol_2_y(cnt) =-vec_pol_2(2)/(2+norm(vec_pol_2));
    end
end
        
        
%figure
hold on;
quiver(X,Y,v_pol_1_x/10,v_pol_1_y/10)
quiver(X,Y,v_pol_2_x/10,v_pol_2_y/10)
