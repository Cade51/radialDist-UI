clc; clear all; close all;

input = uigetdir('','Select input folder');
folders = dir(input);
folders = folders(~cellfun('isempty', {folders.date})); 
folders(1:2) = [];
output = uigetdir('','Select output folder');

% hacky way of getting parent folder name
parts = strsplit(input, '\');
mkdir(output, parts{end} + " - sorted");
output = output + "\" + parts{end} + " - sorted";

for i = 1:size(folders)
    % Make output subfolders
    folder = folders(i);
    mkdir(output,folder.name);
    
    subfolders = dir(strcat(folder.folder,'\',folder.name));
    subfolders = subfolders(~cellfun('isempty', {subfolders.date}));
    subfolders(1:2) = [];
    for j = 1:size(subfolders)
        subfolder = subfolders(j);
        % deal with epis
        if strcmp(lower(subfolder.name), 'epis')
            files = dir(strcat(subfolder.folder,'\',subfolder.name));
            files(1:2) = [];
            copyfile(strcat(files(1).folder,'\',files(1).name),strcat(output,'\',folder.name));
        else
           files = [dir(strcat(subfolder.folder,'\',subfolder.name,'\','*.png'));dir(strcat(subfolder.folder,'\',subfolder.name,'\','*ome.txt'))];
           for k = 1:size(files)
               copyfile(strcat(files(k).folder,'\',files(k).name),strcat(output,'\',folder.name));
           end
        end
    end
end
