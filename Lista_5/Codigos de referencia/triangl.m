%triangl(t) = 1 - |t|, se |t| < 1
%triangl(t) = 0, se |t| > 1
% t - deve ser real, podendo ser vetor ou matriz

function y = triangl(t)
    y = (1-abs(t)).*(t>=-1).*(t<1);
end

