choice = 'null';
[pcaCoefficients, pcaScores, ~, ~, explained, pcaCenters] = pca(...
    classificationNN');
explainedVarianceToKeepAsFraction = 99.5/100;
numComponentsToKeep = find(cumsum(explained)/sum(explained) >= explainedVarianceToKeepAsFraction, 1);
classificationNN = pcaScores(:,1:numComponentsToKeep);
classificationNN = classificationNN';