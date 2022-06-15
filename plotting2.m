Initialization;
script_1;
equ_comp;
find_undominated_gne;

figure 
hold on
plot(GNE_u1,GNE_u2,'.')
%plot(GNE_u1_undom,GNE_u2_undom,'r.')
C=0.022;
contour(U,U,V',[C C])
find_eq_V_C
plot(GNE_C_u1,GNE_C_u2,'markersize',10)
C=0.04;
contour(U,U,V',[C C])
find_eq_V_C
plot(GNE_C_u1,GNE_C_u2,'.','markersize',10)
C=0.06;
contour(U,U,V',[C C])
find_eq_V_C
plot(GNE_C_u1,GNE_C_u2,'.','markersize',10)


plot(GNE_u1_MANY_C,GNE_u2_MANY_C)
plot(GNE_u1_undom,GNE_u2_undom)
legend('Sat. Condition', 'V=0.02','GNE, V=0.02','V=0.04','GNE, V=0.02','V=0.04','GNE, V=0.06')
grid
xlabel('u_1')
ylabel('u_2')
