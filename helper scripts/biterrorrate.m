alpha = .68;
SNR = 15;


x = @(t)  exp((-(t).^2)/2);
start = sqrt(2*alpha*SNR);

l = integral(x, start, inf);

1/(sqrt(2*pi)) * l