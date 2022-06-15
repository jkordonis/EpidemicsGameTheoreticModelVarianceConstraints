CC=[0:0.001:2];
cnt_=0;

J1_min_MANY_C=[];
J2_min_MANY_C=[];
CCC=[];
GNE_u1_MANY_C=[];
GNE_u2_MANY_C=[];
CCC=[];
NashBarg=[];
for ii_=1:length(CC)
    C=CC(ii_);
    find_eq_V_C;
    if GNE_C_J1*0==0
        cnt_=cnt_+1;
        [val1 ind1]=min(GNE_C_J1);
        [val2 ind2]=min(GNE_C_J2);
        if abs(val1-GNE_C_J1(ind2))+abs(val2-GNE_C_J2(ind1))>0.001
            error('Error in indexing ');
        end
        GNE_u1_MANY_C(cnt_)=GNE_C_u1(ind1);
        GNE_u2_MANY_C(cnt_)=GNE_C_u2(ind2);
        
        J1_min_MANY_C(cnt_)=min(GNE_C_J1);
        J2_min_MANY_C(cnt_)=min(GNE_C_J2);
        
        CCC(cnt_) = C ;
        NashBarg(cnt_) = max(J1_n-J1_min_MANY_C(cnt_),0)*max(J2_n-J2_min_MANY_C(cnt_),0);
    end
end
[val ind_barg]=max(NashBarg);
[val ind_J1]=min(J1_min_MANY_C);


figure
subplot(2,1,1)
hold on;
grid 
plot(CCC,CCC*0+J1_n,'--')
plot(CCC,J1_min_MANY_C)
plot(CCC(ind_barg),J1_min_MANY_C(ind_barg),'.','markersize',10)
plot(CCC(ind_J1),J1_min_MANY_C(ind_J1),'.','markersize',10)

xlabel('C')
ylabel('J_1')
legend('Nash Cost ', 'Variance Constrained Cost','Barg. Chosen Solution','J1 Optimal')

subplot(2,1,2)
grid 
hold on;
plot(CCC,CCC*0+J2_n,'--')
plot(CCC,J2_min_MANY_C)
plot(CCC(ind_barg),J2_min_MANY_C(ind_barg),'.','markersize',10)
plot(CCC(ind_J1),J2_min_MANY_C(ind_J1),'.','markersize',10)
xlabel('C')
ylabel('J_2')
legend('Nash Cost ', 'Variance Constrained Cost','Barg. Chosen Solution','J1 Optimal')