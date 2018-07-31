%% Self Build a Classifier

%==== Initialization
clear ; close all; clc
page_output_immediately (1);

%==== Load Data
data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);
[m, n] = size(X);

%==== Training

% Initialize fitting parameters
X = [ones(m, 1) X];
initial_theta = zeros(n + 1, 1);
alpha = 0.003;
iterations = 200000;

fprintf('Gradient Descent with step hypothesis\n');

% Training
[theta cost] = gradientDescent(X, y, initial_theta, alpha, iterations, @hypothesisStep, @costAndGradientLog);

fprintf('theta: \n');
fprintf(' %f \n', theta);
fprintf('Expected theta with :\n');
fprintf(' -25.161\n 0.206\n 0.201\n');

%==== Plot Boundary
plotDecisionBoundary(theta, X, y);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')

% Specified in plot order
legend('Admitted', 'Not admitted')
hold off;

%==== Plot learning curve
plotLearningCurve(cost)