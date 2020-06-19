% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
function decrypted_message = decrypt(e,L,message)
if(e ==1)
    n = length(message);
    index = 1:L+1:n;
    dec = message(index);
    decrypted_message = dec;
      
      
elseif(e ==2)
     get_double =double(message);
     encrypt = get_double - L;
     decrypted_message = char(encrypt);

end
