function m = minmod(x,y)
    A=(x.*y > 0);
    m = A .* sign(x) .* min(abs(x),abs(y));
end