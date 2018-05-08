%Permutte les éléments en positon a et b du vecteur 
function [ vector ] = exchange(vector, a, b)
if (a ~= b)
   temp = vector(a);
   vector(a) = vector(b);
   vector(b) = temp;
end


end

