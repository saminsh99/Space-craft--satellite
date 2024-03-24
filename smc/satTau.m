function Tau = satTau(Tau,sTau)
m = length(Tau);
for i = 1:m
    if abs(Tau(i)) > sTau(i)
        Tau(i) = sign(Tau(i)).* sTau(i);
    end
end