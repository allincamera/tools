function CalculatePSNR()

[filename, pathname, filterindex] = uigetfile( ...
{  '*.jpg','JPEG files (*.jpg)'; ...
   '*.bmp','Bitmap files (*.bmp)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file', ...
   'MultiSelect', 'on');

original = im2double(imread(fullfile(pathname, filename{1})));
nosiy = im2double(imread(fullfile(pathname, filename{2})));

[row, column, channel] = size(original);

MSE = 1 / (row * column) * sum(sum((original - nosiy).^2));
PSNR = 10 * log10(1^2/MSE)



 