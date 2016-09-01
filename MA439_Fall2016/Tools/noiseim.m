function y = noiseim(x, lev)
% Usage: y = noiseim(x, lev).  Add uniform random noise to an image x,
% range -lev to + lev.

[m,n] = size(x);

y = double(x) + 2.0*lev*(rand(m,n)-0.5);

