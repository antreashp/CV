% test your code by using this simple script

clear
clc
close all

I = imread('peppers.png');
figure(1);
J = ConvertColorSpace(I, 'opponent', 0);
figure(2);
% close all
J = ConvertColorSpace(I, 'rgb', 0);
figure(3);
% close all
J = ConvertColorSpace(I, 'hsv', 0);
figure(4);
% close all
J = ConvertColorSpace(I, 'ycbcr', 0);
figure(5);
% close all
J = ConvertColorSpace(I, 'gray', 1);
figure(6);
% close all
J = ConvertColorSpace(I, 'gray', 2);
% close all
figure(7);
J = ConvertColorSpace(I, 'gray', 3);
% close all
figure(8);
J = ConvertColorSpace(I, 'gray', 4);