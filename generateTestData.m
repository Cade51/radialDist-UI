clear all; clc;

%% Ellipse
r1 = 8000;
r2 = 5000;
x0 = 10000;
y0 = 10000;
t = -pi:0.01:pi;
t = t';
x = x0+r1*cos(t);
y = x0+r2*sin(t);

%% Data
[xx, yy] = meshgrid(0:50:20000);
uniformValues = [xx(:) yy(:)];

%% Plot
scatter(x,y,'k')
hold on
scatter(uniformValues(:,1),uniformValues(:,2),0.2,'y')


testOutputData = [uniformValues,ones(size(uniformValues,1),1),2000*ones(size(uniformValues,1),1)];
testOutputEllipse =[x,y,ones(size(x,1),1),2000*ones(size(x,1),1)];

testOutputData = array2table(testOutputData);
testOutputEllipse = array2table(testOutputEllipse);
testOutputData.Properties.VariableNames(1:4) = {'header1', 'header2','header3', 'header4'};
testOutputEllipse.Properties.VariableNames(1:4) = {'header1', 'header2','header3', 'header4'};


writetable(testOutputData,'testOutputData.txt', 'Delimiter',' ')
writetable(testOutputEllipse,'testOutputEllipse.txt', 'Delimiter',' ')