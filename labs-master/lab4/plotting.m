function [] = plotting(transf_a, transf_b, im_a, im_b)
    transf_b(1, :) = transf_b(1, :) + size(im_a, 2);
    imshow(cat(2, im_a, im_b));
    hold on;
    vl_plotframe(transf_a);
    vl_plotframe(transf_b);
    for i = 1:size(transf_a,2)
        l = line([transf_a(1, i); transf_b(1, i)], [transf_a(2,i); transf_b(2,i)]);
        set(l, 'linewidth', 1, 'color', 'r');
    end
end

