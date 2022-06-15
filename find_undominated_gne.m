cnt=0;
GNE_u1_undom=[];
GNE_u2_undom=[];
NashBarg=[];

for eq_cnt1=1:length(GNE_u1)
    flag=1; %flag remains 1 if the GNE is undominated
	[minival, i_dense1] = min(abs(U-GNE_u1(eq_cnt1))); %find i index of GNE_u1(eq_cnt1);
    [minival, j_dense1] = min(abs(U-GNE_u2(eq_cnt1))); %find j index of GNE_u1(eq_cnt1);
    %compare with other equilibria 
    for eq_cnt2=1:length(GNE_u1) 
        [minival, i_dense2] = min(abs(U-GNE_u1(eq_cnt2))); %find i index of GNE_u1(eq_cnt2);
        [minival, j_dense2] = min(abs(U-GNE_u2(eq_cnt2))); %find j index of GNE_u1(eq_cnt2);
        if (J1(i_dense2,j_dense2)<J1(i_dense1,j_dense1))&&(J2(i_dense2,j_dense2)<J2(i_dense1,j_dense1))&&(V(i_dense2,j_dense2)<V(i_dense1,j_dense1))
            flag=0;
        end
    end
    if flag==1
        cnt=cnt+1;
        GNE_u1_undom(cnt)=U(i_dense1);
        GNE_u2_undom(cnt)=U(j_dense1);

        J1_gne_und (cnt)=J1(i_dense1,j_dense1);
        J2_gne_und (cnt)=J2(i_dense1,j_dense1);

        NashBarg(cnt) = max(J1_n-J1_gne_und (cnt),0)*max(J2_n-J2_gne_und (cnt),0);
    end

end
 

if max(NashBarg)>0
    [val ind]=max(NashBarg);
    GNE_BARG_u1 = GNE_u1_undom(ind)   
    GNE_BARG_u2 = GNE_u2_undom(ind)
    GNE_BARG_J1 = J1_gne_und(ind)
    GNE_BARG_J2 = J2_gne_und(ind)
end