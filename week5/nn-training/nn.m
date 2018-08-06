%% Train a NN

%==== Initialization
clear ; close all; clc

%==== Load Data
data = load('circle.txt');
X = data(:, [1, 2]); y = data(:, 3);
[m, n] = size(X);

input_layer_size  = 2; % 2 features
hidden_layer_size = 3; % 1 hidden layer with 3 neurons
num_labels = 2; % Output 2 classes

% Randomize initial theta
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

% Train NN
options = optimset('MaxIter', 50);
lambda = 1;
costFunctionRef = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

[nn_params, cost] = fmincg(costFunctionRef, initial_nn_params, options);

% Final result
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1))

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1))
                 
% Try to make predictions
pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);