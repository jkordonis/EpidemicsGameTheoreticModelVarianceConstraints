equ =zeros(length(U)); % the set of GNE, for different C
almostZero=1e-7; % a small constant. It is used to avoid 0/0 computations 

for i_u1 = 1:length(U)
    tic
    i_u1
    for i_u2 = 1:length(U)
        u_play = [U(i_u1);U(i_u2)]; % Check if the conditions of Proposition 4 hold true for a pair of strategies u1 u2
        gk_computation; % Compute the valeus of g^k_1,g^k_2
        gL_computation; % Compute the valeus of g^L_1,g^L_2
        flag=1; % if flag remains 1, we have an equilibrium
        % initialization of the angles for the several quaardants 
        th_21=0; 
        th_41=0; 
        th_22=0;
        th_42=0;
        
        for ii=1:length(U)
            if gk1(ii)<-almostZero&&gL1(ii)<-almostZero % g^k,g^L belongs to the third quadrant. 
                flag=0;
            end
            if gk1(ii)<-almostZero&&gL1(ii)>almostZero % g^k,g^L belongs to the second quadrant. Computation of the maximum angle
                th_21=max(th_21,atan(abs(gk1(ii)/gL1(ii))));
            end
            if gk1(ii)>almostZero&&gL1(ii)<-almostZero % g^k,g^L belongs to the fourth quadrant. Computation of the maximum angle
                th_41=max(th_41,atan(abs(gL1(ii)/gk1(ii))));
            end
            % Repeat for j=2. That is, the second kind of players
            if gk2(ii)<-almostZero&&gL2(ii)<-almostZero
                flag=0;
            end
            if gk2(ii)<-almostZero&&gL2(ii)>almostZero
                th_22=max(th_22,atan(abs(gk2(ii)/gL2(ii))));
            end
            if gk2(ii)>almostZero&&gL2(ii)<-almostZero
                th_42=max(th_42,atan(abs(gL2(ii)/gk2(ii))));
            end
        end
        if (th_21+th_41>pi/2)||(th_22+th_42>pi/2) % Condition of Propostion 4
           flag =0 ;
        end
        
        if flag ==1 % Stores a new equilibrium
            equ(i_u1,i_u2)=1;
        end
            
    end
    toc
end

cnt=0;

% Store the GNEs
GNE_u1=[];
GNE_u2=[];
for ii=1:length(U)
    for jj=1:length(U)
        if equ(ii,jj)==1;
            cnt=cnt+1;
            GNE_u1(cnt)=U(ii);
            GNE_u2(cnt)=U(jj);
        end
    end
end
            