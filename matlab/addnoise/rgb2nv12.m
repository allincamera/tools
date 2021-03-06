function [nv12] = rgb2nv12(width, height)

[filename, pathname] = uigetfile( ...
{ '*.png','PNG files (*.png)'; ...
  '*.jpg','JPEG files (*.jpg)'; ...
  '*.bmp','Bitmap files (*.bmp)'; ...
  '*.tif','TIF files (*.tif)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file');

fullfilename = fullfile(pathname, filename);
[pathstr, name, ext] = fileparts(fullfilename);

orig_frame = im2double(imread(fullfilename));
[row, col, channel] = size(orig_frame);

if (mod(row, 2) ~= 0)
    frame = orig_frame(1:1: row-1, :, :);
    row = row - 1;
    if (mod(col, 2) ~= 0)
        rgb_frame = frame(:, 1:1: col-1, :);
        col = col - 1;
    else
        rgb_frame = frame(:, :, :);
    end
else
    if (mod(col, 2) ~= 0)
        rgb_frame = orig_frame(:, 1:1: col-1, :);
        col = col - 1;
    else
        rgb_frame = orig_frame(:, :, :);
    end
end


if (channel == 3)
    R = rgb_frame(:, :, 1);
    G = rgb_frame(:, :, 2);
    B = rgb_frame(:, :, 3);
elseif (channel == 1)
    R = rgb_frame(:, :, 1);
    G = rgb_frame(:, :, 1);
    B = rgb_frame(:, :, 1);
end

max_R = 255 * max(max(R));
min_R = 255 * min(min(R));
max_G = 255 * max(max(G));
min_G = 255 * min(min(G));
max_B = 255 * max(max(B));
min_B = 255 * min(min(B));

figure();
imshow(rgb_frame);
title(['R Max:' mat2str(max_R) ', R Min:' mat2str(min_R) ';  G Max:' mat2str(max_G) ', G Min:' mat2str(min_G) ';  B Max:' mat2str(max_B) ', B Min:' mat2str(min_B)]);

yuv_frame = rgb2yuv(256 * R, 256 * G, 256 * B);
Y = yuv_frame(:, :, 1);
U = yuv_frame(:, :, 2);
V = yuv_frame(:, :, 3);
max_Y = max(max(Y));
min_Y = min(min(Y));

U_nv12 = U(2:2:end, 2:2:end);
V_nv12 = V(1:2:end, 1:2:end);

UV_NV12 = zeros(row/2, col); 
UV_NV12(1:1:end, 1:2:end) = U_nv12; 
UV_NV12(1:1:end, 2:2:end) = V_nv12;


figure();
subplot(2, 2, 1);
imshow(Y);
title(['Y Max:' mat2str(max_Y) ', Y Min:' mat2str(min_Y)]);
subplot(2, 2, 3);
imshow(U);
subplot(2, 2, 4);
imshow(V);

nv12 = [Y; UV_NV12];

fname = [pathstr '\' name '_' mat2str(col) 'x' mat2str(row) '_NV12.yuv'];
yuv_file = fopen(fname, 'w');
fwrite(yuv_file, nv12');
fclose(yuv_file);

Y_fname = [pathstr '\' name '_' mat2str(col) 'x' mat2str(row) '_Y.bmp'];
imwrite(Y, Y_fname);
U_fname = [pathstr '\' name '_' mat2str(col) 'x' mat2str(row) '_U.bmp'];
imwrite(U, U_fname);
V_fname = [pathstr '\' name '_' mat2str(col) 'x' mat2str(row) '_V.bmp'];
imwrite(V, V_fname);

end

