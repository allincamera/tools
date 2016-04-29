function [RGB] = nv12torgb(width, height)

[filename, pathname] = uigetfile( ...
{ '*.yuv','NV12 files (*.yuv)'; ...
  '*.raw','raw files (*.raw)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file');

if (nargin < 3)
    width = 640;
    heigh = 480;
end

fullfilename = fullfile(pathname, filename);
[pathstr, name, ext] = fileparts(fullfilename);

fip = fopen(fullfilename,'rb');  

[RAW, num] = fread(fip, inf, 'uint8');

fclose(fip);

y_size = num * 2 / 3;
uv_size = num / 3;

for i = 1 : y_size
    Y(i) = RAW(i);
end

for i = y_size+1 : num
    UV(i-y_size) = RAW(i);
end

U = zeros([width, heigh]);
V = zeros([width, heigh]);
U = reshape(U, 1, width*heigh);
V = reshape(V, 1, width*heigh);

U(1:4:y_size) = UV(1:2:uv_size);
U(2:4:y_size) = UV(1:2:uv_size);
U(3:4:y_size) = UV(1:2:uv_size);
U(4:4:y_size) = UV(1:2:uv_size);

V(1:4:y_size) = UV(2:2:uv_size);
V(2:4:y_size) = UV(2:2:uv_size);
V(3:4:y_size) = UV(2:2:uv_size);
V(4:4:y_size) = UV(2:2:uv_size);

Y = reshape(Y, width, heigh);
U = reshape(U, width, heigh);
V = reshape(V, width, heigh);

RGB = yuv2rgb(Y', U', V', 'YUV444_8');

figure();
subplot(2, 2, 1);
imshow(Y'/255);
title('Y ');
subplot(2, 2, 2);
imshow(U'/255);
title('U ');
subplot(2, 2, 3);
imshow(V'/255);
title('V ');
subplot(2, 2, 4);
imshow(RGB);
title('RGB ');

fname = [pathstr '\' name '_' mat2str(heigh) 'x' mat2str(width) '_rgb.bmp'];
rgb_file = fopen(fname, 'w');
fwrite(rgb_file, RGB);
fclose(rgb_file);

end

