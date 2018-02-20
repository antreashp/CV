close all
clear all
clc
 
disp('Part 1: Photometric Stereo')

% obtain many images in a fixed view under different illumination
disp('Loading images...')
image_dir = './SphereGray/';   % TODO: get the path of the script
% %image_ext = '*.png';
% 
% [image_stack, scriptV] = load_syn_images(image_dir);
% [h, w, n] = size(image_stack);
% fprintf('Finish loading %d images.\n\n', n);
% 
% % compute the surface gradient from the stack of imgs and light source mat
% disp('Computing surface albedo and normal map...')
% [albedo, normals] = estimate_alb_nrm(image_stack, scriptV);
% 
% 
% %% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
% disp('Integrability checking')
% [p, q, SE] = check_integrability(normals);
% 
% threshold = 0.005;
% SE(SE <= threshold) = NaN; % for good visualization
% fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));
% 
% %% compute the surface height
% height_map = construct_surface( p, q );
% 
% %% Display
% show_results(albedo, normals, SE);
% show_model(albedo, height_map);


% %% Face
% [image_stack, scriptV] = load_face_images('./yaleB02/');
% [h, w, n] = size(image_stack);
% fprintf('Finish loading %d images.\n\n', n);
% disp('Computing surface albedo and normal map...')
% [albedo, normals] = estimate_alb_nrm(image_stack, scriptV);
% 
% %% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
% disp('Integrability checking')
% [p, q, SE] = check_integrability(normals);
% 
% threshold = 0.005;
% SE(SE <= threshold) = NaN; % for good visualization
% fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));
% 
% %% compute the surface height
% height_map = construct_surface( p, q );
% 
% show_results(albedo, normals, SE);
% show_model(albedo, height_map);
% % 
%% 
disp('Part 1.2: Coloured Photometric Stereo')

% obtain many images in a fixed view under different illumination
disp('Loading images...')
image_dir = './MonkeyColor/';   % TODO: get the path of the script
%image_ext = '*.png';

[image_stack, scriptV] = load_syn_images(image_dir);
[h, w, n] = size(image_stack);
fprintf('Finish loading %d images.\n\n', n);

% compute the surface gradient from the stack of imgs and light source mat
disp('Computing surface albedo and normal map...')
[albedos, normals] = albedoNormColor(image_stack, scriptV,false,image_dir);


%% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
disp('Integrability checking')
[p1, q1, SE1] = check_integrability(squeeze(normals(1,:,:,:)));
[p2, q2, SE2] = check_integrability(squeeze(normals(2,:,:,:)));
[p3, q3, SE3] = check_integrability(squeeze(normals(3,:,:,:)));
threshold = 0.005;
SE1(SE1 <= threshold) = NaN; % for good visualization
SE2(SE2 <= threshold) = NaN; % for good visualization
SE3(SE3 <= threshold) = NaN; % for good visualization
fprintf('Number of outliers Red: %d\n\n', sum(sum(SE1 > threshold)));
fprintf('Number of outliers Green: %d\n\n', sum(sum(SE2 > threshold)));
fprintf('Number of outliers Blue: %d\n\n', sum(sum(SE3 > threshold)));

%% compute the surface height

height_map1 = construct_surface( p1, q1 );
height_map2 = construct_surface( p2, q2 );

height_map3 = construct_surface( p3, q3 );
height_map=permute(cat(3,height_map1,height_map2,height_map3),[3,1,2]);


colorAlbedo=permute(albedos,[2,3,1]);

meeeh=permute(normals,[2,3,4,1]);
normednormals=zeros(h,w,3);
for i = 1:h
    
    for j = 1:w
        for k=1:3
            normednormals(i,j,k)=norm(meeeh(i,j,k));
        end
    end
end

% mehnormals=squeeze(norm(meeeh(:,:,:,:)));
[pmeh, qmeh, SEmeh] = check_integrability(normednormals);

height_mapmeh = construct_surface( pmeh, qmeh );
%% Display
show_results(squeeze(albedos(1,:,:,:)), squeeze(normals(1,:,:,:)), SE1);
show_results(squeeze(albedos(2,:,:,:)), squeeze(normals(2,:,:,:)), SE2);
show_results(squeeze(albedos(3,:,:,:)), squeeze(normals(3,:,:,:)), SE3);
show_model(squeeze(albedos(1,:,:,:)), squeeze(height_map(1,:,:)));
show_model(squeeze(albedos(2,:,:,:)), squeeze(height_map(2,:,:)));
show_model(squeeze(albedos(3,:,:,:)), squeeze(height_map(3,:,:)));
show_model(colorAlbedo, height_mapmeh);

