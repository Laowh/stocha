%Donne le nombre d'�l�ments de a et b qui ont la m�me valeur � la m�me position 
function [ result ] = common( a, b )
result = 0;

for i = 1 : length(a)
    if (a(i) == b(i))
        result = result +1;
    end
end

end

