function [J, grad] = costAndGradientMSE(theta, X, y, h)

% Initialize some useful values
m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

% Cost function is MSE
J = sum((h .- y) .^ 2) / (2 * m);

% Gradient is derivative
for n=1:size(theta)
  grad(n) = (1/m) * sum( (h .- y)' * X(:,n) );

end
