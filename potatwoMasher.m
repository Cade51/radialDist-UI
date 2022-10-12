clear all; close all; clc;

%folder = 'twoColourOutput\';
folder = 'C:\Users\PAVILION\Desktop\data\Exp 2 - sorted\Naive K27\radialDist with threshold\';
numberOfOutputs = 7;

files = dir(folder);


% Geometric Properties
files = dir(folder + "*- Geometric Properties.csv");
geometricProperties = cell(length(files),6);
for i = 1:length(files)
    file = files(i);
    data = readmatrix(fullfile(file.folder,file.name));
    geometricProperties{i,1} = file.name;
    geometricProperties{i,2} = data;
end
geometricProperties = cell2table(geometricProperties);
geometricProperties = splitvars(geometricProperties);
geometricProperties = removevars(geometricProperties,[7:10]);
geometricProperties.Properties.VariableNames(1:6) = {'FileName', 'MajorAxis', 'MinorAxis', 'Area', 'Circumference','Eccentricity'};
writetable(geometricProperties,folder + "Geometric Properties.csv");

% Lamin normalised densities do later
% files = dir(folder + "*Geometric Properties.csv");
% for i = 1:n
%     file = files(i);
%     data = readmatrix(fullfile(file.folder,file.name));
% end
% radialDistributionDensity{i,1} = file.name;
% radialDistributionDensity{i,2} = data(1,1:end-1);

% lamin RadialDistribution density

% lamin RadDist

% normalised RadialDistribution density
files = dir(folder + "*- normalised RadialDistribution density(signal per um^2).csv");
normalisedRadialDistributionDensity = cell(length(files)+1,2);
for i = 1:length(files)
    file = files(i);
    data = readmatrix(fullfile(file.folder,file.name));
    normalisedRadialDistributionDensity{i,1} = file.name;
    normalisedRadialDistributionDensity{i,2} = data(1,1:end-1);
end
normalisedRadialDistributionDensity{length(files)+1,2} = linspace(0,1.2,25);
writecell(normalisedRadialDistributionDensity,strcat(folder,'NormalisedRadialDistributionDensity.csv'))

% radDist
files = dir(folder + "*- radDist.csv");
averageRadialDist = cell(length(files)+1,3);
averageRadialDist{1,2} = "mean";
averageRadialDist{1,3} = "median";

for i = 1:length(files)
    file = files(i);
    data = readmatrix(fullfile(file.folder,file.name));
    averageRadialDist{i+1,1} = file.name;
    averageRadialDist{i+1,2} = mean(data);
    averageRadialDist{i+1,3} = median(data);
end
writecell(averageRadialDist,strcat(folder,'averageRadialDist.csv'));
% RadialDistribution density

