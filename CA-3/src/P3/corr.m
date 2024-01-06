function coeff = corr(p1 , p2)
    coeff = sum((p1.*p2)) / sqrt( sum(p1.*p1) .* sum(p2.*p2) );

end


