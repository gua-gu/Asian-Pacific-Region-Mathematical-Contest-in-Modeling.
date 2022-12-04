function output = sigmoid(x)
if x>1
output =1./(1+exp((-x+1)./10));
output = output.*18-8;
else
    output =x.*x-0.1.*x+0.1;
end