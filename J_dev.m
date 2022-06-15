function [ Jd ] = J_dev( j, u_dev,G,S,u,Fu,I0  )
Jd=G(j)*(I0+(1-I0)*(1-exp(-u_dev*Fu)))-S(j,j)*u(j)*u_dev-S(j,3-j)*u(3-j)*u_dev;
end

