function [x] = gauss_elim(A,b)

[modA, modb]= fwd_elim(A,b);
[x] = bwd_subs(modA,modb);


end