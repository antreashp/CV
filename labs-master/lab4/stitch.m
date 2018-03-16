function [shiftedIm, shifted_w, shifted_h, shift] = stich(M, T, im1, im2)
    [im_h, im_w] = size(im1);
    [h, w] = meshgrid(1:im_h, 1:im_w);

    h_vector = reshape(h.', 1, []);
    w_vector = reshape(w.', 1, []);

    new_pos = int32(ceil([w_vector; h_vector]' * M' + T'));
    h_vector = h_vector.';
    w_vector = w_vector.';

    left_corner = min(new_pos);
    right_corner = max(new_pos);

    [img2_h, img2_w] = size(im2);

    min_c = min([left_corner; 1 1]);
    max_c = max([right_corner; img2_w img2_h]);

    shift = 1 - min_c;

    shifted_w = max_c(1) - 1 + min_c(1);
    shifted_h = max_c(2) - 1 + min_c(2);

    new_image_pos = new_pos + shift;
    shiftedIm = zeros(shifted_h, shifted_w);

    for i = 1:length(new_pos)
        shiftedIm(new_pos(i, 2), new_pos(i, 1)) = im1(h_vector(i), w_vector(i));
    end
end