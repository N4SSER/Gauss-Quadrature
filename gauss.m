warning('off', 'all');
pkg load symbolic;
syms x
%Legendre
P = @(n) 1/(factorial(n)*2^n)*diff((x^2-1)^n,n);
%Weights
W = @(n) 2/((1-x^2)*(diff(P(n))^2));
%Gauss-interval (f(Xn)'W)
Gauss = @(f,X,W,a,b) (b-a)/2*double(subs(f,((b-a)/2*X+(b+a)/2)))'*W;
%degree
n = 5
%points
X = double(solve(P(n)));
%Weights
Weights  =  double(subs(W(n),X));
%function
f = exp(-x)/x
interval = [2 5]
%Result
result = Gauss(f,X,Weights,interval(1),interval(2))
