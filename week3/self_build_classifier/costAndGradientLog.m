function [J, grad] = costAndGradientLog(theta, X, y, h)

% Initialize some useful values
m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

% Cost function is log function
J = (1/m) * sum( -y' * log(h) - (1.-y')*log(1-h)  );

% Gradient is derivative of log function
for n=1:size(theta)
  grad(n) = (1/m) * sum( (h .- y)' * X(:,n) );

end
