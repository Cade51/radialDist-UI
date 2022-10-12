clear all; close all; clc;

folder = 'singleColourOutput\';
extension = '*.csv';
directory = strcat(folder,extension);

files = dir(directory);
n = floor(size(files,1) / 3);

normalisedRadialDistributionDensity = cell(n+1,2);
radialDistributionDensity = cell(n+1,2);

for i = 1:n
    % normalised
    file = files(3*i-2);
    data = readmatrix(fullfile(file.folder,file.name));
    normalisedRadialDistributionDensity{i,1} = file.name;
    normalisedRadialDistributionDensity{i,2} = data(1,1:end-1);

    % not normalised
    file = files(3*i-1); % matlab doesn't do alphabetical order correctly?
    data = readmatrix(fullfile(file.folder,file.name));
    radialDistributionDensity{i,1} = file.name;
    radialDistributionDensity{i,2} = data(1,1:end-1);
end
normalisedRadialDistributionDensity{n+1,2} = linspace(0,1.2,25);
radialDistributionDensity{n+1,2} = linspace(0,1.2,25);

writecell(normalisedRadialDistributionDensity,strcat(folder,'NormalisedRadialDistributionDensity.csv'))
writecell(radialDistributionDensity,strcat(folder,'RadialDistributionDensity.csv'))