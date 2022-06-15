%C=1;
%Initialization
cnt=0;
GNE_C_u1=[];
GNE_C_u2=[];
GNE_C_J1=[];
GNE_C_J2=[];
 

% V=C exactly on a grid point
for ii=1:length(U)
    for jj=1:length(U)
        if equ(ii,jj)==1
            if V(ii,jj)==C
                cnt=cnt+1;
                GNE_C_u1(cnt)=U(ii);
                GNE_C_u2(cnt)=U(jj);
                GNE_C_J1(cnt)=J1(ii,jj);
                GNE_C_J2(cnt)=J2(ii,jj);
            end
        end
    end
end
% V=C between two nearby grid points placed one above the other
for ii=1:length(U)
    for jj=1:length(U)-1
        if (equ(ii,jj)==1)&&(equ(ii,jj+1)==1)
            if (V(ii,jj)-C)*(V(ii,jj+1)-C)<0
                cnt=cnt+1;
                del = -(V(ii,jj)-C)/(V(ii,jj+1)-V(ii,jj));
                GNE_C_u1(cnt)=U(ii);
                GNE_C_u2(cnt)=U(jj)+del*(U(jj+1)-U(jj));
                GNE_C_J1(cnt)=(1-del)*J1(ii,jj)+del*J1(ii,jj+1) ;
                GNE_C_J2(cnt)=(1-del)*J2(ii,jj)+del*J2(ii,jj+1) ;                
            end
        end
    end
end
%V=C between two nearby grid points placed one to the right of the other
for ii=1:length(U)-1
    for jj=1:length(U)
        if (equ(ii,jj)==1)&&(equ(ii+1,jj)==1)
            if (V(ii,jj)-C)*(V(ii+1,jj)-C)<0
                cnt=cnt+1;
                del=-(V(ii,jj)-C)/(V(ii+1,jj)-V(ii,jj));
                GNE_C_u1(cnt)=U(ii)+del*(U(ii+1)-U(ii));
                GNE_C_u2(cnt)=U(jj);
                GNE_C_J1(cnt)=(1-del)*J1(ii,jj)+del*J1(ii+1,jj) ;
                GNE_C_J2(cnt)=(1-del)*J2(ii,jj)+del*J2(ii+1,jj) ;
            end
        end
    end
end


