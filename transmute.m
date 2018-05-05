%Remplace les éléments de strings par les élements correspondanr dans
%"replace"
function [ result ] = transmute( string, alphabet, replace )
result = [];
for i = 1 : length(string)
    result = [result replace(find(alphabet == string(i),1))];
end

end

