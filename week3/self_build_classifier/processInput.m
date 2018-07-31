function processedX = processInput(X)

u = mean(X);
s = std(X);

processedX = (X .- u) ./ s;

end
