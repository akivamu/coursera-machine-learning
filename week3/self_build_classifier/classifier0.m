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

fprintf('Gradient Descent with fminunc...\n');

% Training
options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

fprintf('theta: \n');
fprintf(' %f \n', theta);
fprintf('cost: %f\n', cost);
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
