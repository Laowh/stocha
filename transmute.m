%Remplace les �l�ments de strings par les �lements correspondanr dans
%"replace"
function [ result ] = transmute( string, alphabet, replace )
result = [];
for i = 1 : length(string)
    result = [result replace(find(alphabet == string(i),1))];
end

end

