%% Self Build a Classifier

%==== Initialization
clear ; close all; clc

%==== Load Data
data = load('circle.txt');
X = data(:, [1, 2]); y = data(:, 3);
[m, n] = size(X);

% Layer 2: 3 neurons
theta11 = [-5 -1.55 1];
theta12 = [-5 1.55 1];
theta13 = [2.5 -0.05 1];

% Plot layer 2
plotData(X, y, [1 2]);
hold on
plotDecisionBoundary(theta11, X, y);
plotDecisionBoundary(theta12, X, y);
plotDecisionBoundary(theta13, X, y);
#legend('Class 1', 'Class 2', 'Neuron 1 Decision Boundary', 'Neuron 2 Decision Boundary', 'Neuron 3 Decision Boundary')
axis([-8, 8, -8, 8])
hold off

% Output of layer 2
appended_X = [ones(m, 1) X];
a21 = sigmoid(appended_X * theta11');
a22 = sigmoid(appended_X * theta12');
a23 = sigmoid(appended_X * theta13');
a2 = [ones(m, 1), a21, a22, a23];

% Layer 3 (output): 1 neuron

%{
% Logistic Regression
options = optimset('GradObj', 'on', 'MaxIter', 400);
initial_theta = zeros(4, 1);
encoded_y = (y==1);
[theta21, cost21] = fminunc(@(t)(costFunction(t, a2, encoded_y)), initial_theta, options);
fprintf('theta21: \n');
fprintf(' %f \n', theta21);
fprintf('cost21: %f\n', cost21);
%}

% Predefined
theta21 = [11.049076 29.623975 28.734228 -30.660159];
a31 = sigmoid(a2 * theta21');
predictions = a31 > 0.5;

fprintf('\nTraining Set Accuracy: %f\n', mean(double(predictions == (y==1))) * 100);
