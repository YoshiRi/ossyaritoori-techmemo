%%

img1=imread('R0010164_20191130022242.jpg');
img2=imread('R0010165_20191130022418.jpg');
img3=imread('R0010166_20191130022609.jpg');

avgimg = (img1+img2+img3)/3;
%%

imshow(avgimg)

%%
imwrite(avgimg,'avg.jpg')