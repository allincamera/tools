function whiteGuassianNoise(mean, stdDev)

[filename, pathname, filterindex] = uigetfile( ...
{ '*.png','PNG files (*.png)'; ...
  '*.bmp','Bitmap files (*.bmp)'; ...
  '*.jpg','JPEG files (*.jpg)'; ...
  '*.tif','TIF files (*.tif)'; ...
   '*.raw','RAW files (*.raw)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file', ...
   'MultiSelect', 'on');

if (nargin < 1)
    mean = 0;
    stdDev = 5;
end

if (iscell(filename) == 0);
    if filename == 0;
        number_of_images = 0;
    else
        number_of_images = 1;
    end
else
    number_of_images = length(filename);
end

variance = stdDev / 255;

if number_of_images == 1
    original = im2double(imread(fullfile(pathname, filename)));

    randn('seed', 0);
    noisy = original + variance*randn(size(original));

    [row, column, channel] = size(original);

    MSE = 1 / (row * column) * sum(sum((original - noisy).^2));
    PSNR = 10 * log10(1^2/MSE);

    imwrite(noisy, [fullfile(pathname, filename) '_Gaussian_noise_stdDev' mat2str(stdDev)  ' psnr' mat2str(PSNR(:,:,1)) '.png']);

    figure();
    subplot(1, 2, 1);
    imshow(original);
    title('Original Image');
    subplot(1, 2, 2);
    imshow(noisy);
    title(['GaussianNoisy Image, StdDev = ' mat2str(stdDev) ' PSNR = ' mat2str(PSNR(:,:,1)) ' Variance =  ' mat2str(variance)]);
end
 
if number_of_images > 1
    for i = 1: number_of_images
        original{i} = im2double(imread(fullfile(pathname, filename{i})));

        randn('seed', 0);
        noisy{i} = original{i} + variance*randn(size(original{i}));

        [row, column, channel] = size(original{i});

        MSE = 1 / (row * column) * sum(sum((original{i} - noisy{i}).^2));
        PSNR = 10 * log10(1^2/MSE);

        imwrite(noisy{i}, [fullfile(pathname, filename{i}) '_Gaussian_noise_stdDev' mat2str(stdDev)  ' psnr' mat2str(PSNR(:,:,1)) '.png']);

        figure();
        subplot(1, 2, 1);
        imshow(original{i});
        title('Original Image');
        subplot(1, 2, 2);
        imshow(noisy{i});
        title(['GaussianNoisy Image, StdDev = ' mat2str(stdDev) ' PSNR = ' mat2str(PSNR(:,:,1)) ' Variance =  ' mat2str(variance)]);
    end
end
end

