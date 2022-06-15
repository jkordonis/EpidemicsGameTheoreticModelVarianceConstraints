function [ V ] = variance( J, n )
J_av=(n(1)*J(1)+n(2)*J(2))/(n(1)+n(2));
V=(n(1)*(J(1)-J_av)^2+n(2)*(J(2)-J_av)^2)/(n(1)+n(2));
end

