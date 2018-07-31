function plotLearningCurve(cost)

% Create New Figure
figure; hold on;

x = 1:length(cost);
plot(x, cost);
ylabel('Cost');
xlabel('Iterations');

hold off;

end
