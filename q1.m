% Generate 1000 random numbers as our dataset
X = rand(1000, 2);
a = figure;
plot(X(:, 1), X(:, 2), '.');

% a = figure;
% Number of clusters
K = 3;

d = 1;

% Initialize centroids
random_points = randperm(size(X, 1));
centroids = X(random_points(1:K), :); % Initial centroids

display(size(centroids));

% Assign points to the centroids untile the centroids don't change
while d > 0

  assigned_points = zeros(1000, 1);

  for i=1:1000
    best_k = 1;
    min_dist = 100000;
    for j=1:K % For each point see which cluster it belongs to based on euclidean distance.
        dist = sqrt(sum((X(i, :) - centroids(j, :)) .^ 2));
        if(dist < min_dist)
        % If the points should belong to the current cluster.
          min_dist = dist;
          best_k = j;
        end
    end
    assigned_points(i) = best_k; % Update the points that are in cluster i.
  end
  
  
  % Recompute the centroids
  new_centroids = zeros(K, 2);
  
  for i=1:K
    points_in_cluster = X(assigned_points==i, :); % For each cluster, find all the points that were assigned to it

    num_of_points_in_cluster = size(points_in_cluster,1);

    mean_x = (1/num_of_points_in_cluster) * sum(points_in_cluster(:,1)); % Find the new coordinates for the cluster by computing the mean of x and y coordinates.
    mean_y = (1/num_of_points_in_cluster) * sum(points_in_cluster(:,2));
    new_centroids(i, :) = [mean_x mean_y];
  end

%   display(new_centroids);
% Break if the centroids are the same.
  if centroids == new_centroids
      break;
  end
  
  % Update the centroids.
  centroids = new_centroids;
  display(centroids);

end
