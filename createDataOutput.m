function [meanTime, meanIteration, varianceTime, varianceIteration] = createDataOutput( timeArray, IterationArray)
%CREATEDATAOUTPUT Summary of this function goes here
%   Detailed explanation goes here
hist(timeArray);
title('Frequency of running times');
xlabel('Time taken to find Goal');
ylabel('Frequency');
figure()
hist(IterationArray);
title('Frequency of iterations');
xlabel('Iterations to Find Goal');
ylabel('Frequency');
meanTime = mean(timeArray);
meanIteration = mean(IterationArray);
varianceTime = var(timeArray);
varianceIteration = var(IterationArray);
end