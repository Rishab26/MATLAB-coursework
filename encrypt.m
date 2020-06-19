% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
function encrypted_message = encrypt(e,L,message)
if(e ==1)
    split_message = num2cell(message);
    l_msg = length(message);
    for i = 1:(l_msg -1 )
       random_char_i = char(randi([int32('a'), int32('z')],1,L));
       split_message{i}=[split_message{i}, random_char_i];
    end
    encrypted_message = strjoin(split_message);
    encrypted_message = strrep(encrypted_message, ' ', '');
       
      
elseif(e ==2)
     get_double =double(message);
     encrypt = get_double + L;
     encrypted_message = char(encrypt);
end
