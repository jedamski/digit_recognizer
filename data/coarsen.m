% Program initialization
clc; clear; close all;


% Load the whole training set
disp('Loading training set...')
data = importdata('train.csv');
img = data.data;
disp('Training set loaded.')


% Create subset
frac = 1/16;
num = 1;
if round(size(img,1)*frac) ~= size(img,1)*frac
    disp('Invalid fraction')
else
    disp('Exporting data')
    indeces = randperm(size(img,1),size(img,1)*frac);
    img_sub = img(indeces, :);
    
    fid = fopen(['train_' num2str(1/frac) '.csv'], 'w');
    fprintf(fid, '%s', data.textdata{1});
    for ii = 2:size(img,2)
        fprintf(fid, ', %s', data.textdata{ii});
    end
    fprintf(fid, '\n');
    for ii = 1:length(indeces)
        fprintf(fid, '%i', img_sub(ii,1));
        for jj = 2:size(img,2)
            fprintf(fid, ', %i', img_sub(ii, jj));
        end
        fprintf(fid, '\n');
        
        printProgress(ii, length(indeces))
%         if num < 1
%             num = num + 1;
%         else
%             fprintf('%4.1f%% \n', ii/length(indeces)*100)
%             num = 0;
%         end
    end
end


