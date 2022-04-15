data = struct2array(load('USPS.mat', 'A'));

mu = mean(data, 2);
data_c = data - mu;

[U, S, V] = svd(data_c);

projection = U(:, 1:10) * S(1:10, 1:10) * V(:, 1:10)';
a = figure;
A2 = reshape(projection(1,:), 16, 16);
imshow(A2');

a = figure;
A2 = reshape(projection(2,:), 16, 16);
imshow(A2');

loss = norm(data - projection, 'fro')^2/numel(data);

display(loss);


projection = U(:, 1:50) * S(1:50, 1:50) * V(:, 1:50)';

a = figure;
A2 = reshape(projection(1,:), 16, 16);
imshow(A2');

a = figure;
A2 = reshape(projection(2,:), 16, 16);
imshow(A2');

loss = norm(data - projection, 'fro')^2/numel(data);

display(loss);

projection = U(:, 1:100) * S(1:100, 1:100) * V(:, 1:100)';

a = figure;
A2 = reshape(projection(1,:), 16, 16);
imshow(A2');

a = figure;
A2 = reshape(projection(2,:), 16, 16);
imshow(A2');

loss = norm(data - projection, 'fro')^2/numel(data);

display(loss);

projection = U(:, 1:200) * S(1:200, 1:200) * V(:, 1:200)';

a = figure;
A2 = reshape(projection(1,:), 16, 16);
imshow(A2');

a = figure;
A2 = reshape(projection(2,:), 16, 16);
imshow(A2');

loss = norm(data - projection, 'fro')^2/numel(data);

display(loss);

% A2 = reshape(data(2,:), 16, 16);
% imshow(A2');