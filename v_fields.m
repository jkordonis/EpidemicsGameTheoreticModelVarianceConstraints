% This script computes the vector fields of \nabla J_1, \nabla J_2

%subset of U 
U_sparse = [0.5:0.02:0.8];

% cnt counts the origins of the vectors in the vector fields
cnt=0;
for ii=1:length(U_sparse)
    for jj=1:length(U_sparse)
        cnt=cnt+1;
        X(cnt)=U_sparse(ii);
        Y(cnt)=U_sparse(jj);
        [minival, i_dense] = min(abs(U-X(cnt))); %find the appropriate indices 
        [minival, j_dense] = min(abs(U-Y(cnt)));
        Vec1=[partial_J1_partial_u1(i_dense,j_dense);partial_J1_partial_u2(i_dense,j_dense)];
        Vec2=[partial_J2_partial_u1(i_dense,j_dense);partial_J2_partial_u2(i_dense,j_dense)];
        %Vec2=Vec2-Vec1; % this line introduces \nabla V~=\nabla J_2-\nabla
        %J_1
        Vec1=0.03*Vec1/(1+norm(Vec1)); %normalization
        part1_u1(cnt) =Vec1(1);
        part1_u2(cnt) =Vec1(2);
        Vec2=0.03*Vec2/(1+norm(Vec2));%normalization
        part2_u1(cnt) =Vec2(1);
        part2_u2(cnt) =Vec2(2);
    end
end
        
%plot vector fields
figure
hold on;
quiver(X,Y,part1_u1,part1_u2) 
quiver(X,Y,part2_u1,part2_u2)
contour(U,U,determ',[0 0])