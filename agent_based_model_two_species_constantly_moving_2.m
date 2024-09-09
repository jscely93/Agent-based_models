% Base model with two species constantly moving

clear all % Clears all variables from the workspace

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
world = rand(nside, nside) > 0.5; % Species A = 0; Species B = 1;
% rand(nside,nside) creates a 50x50 matrix of random numbers between 0 and 1.

% Preallocate memory for matrices
% Preallocate memory for large matrices for better performance
nB = zeros(nside); % Matrix to store the number of Species B neighbors for each agent
uncomfortableB = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species B
uncomfortableA = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species A

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green and Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % Temporary high values to satisfy while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)
    
    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    nB = A + B + C + D; % Now nB has numbers of Species B neighbors for each agent in world
    
    % Logical matrices for uncomfortable species
    uncomfortableB = world & ((world .* nB) < 3); % Species B wants to be around at least 3 other Species B
    uncomfortableA = ~world & ((~world .* nB) > 1); % Species A is uncomfortable with more than 1 Species B neighbor
    
    % Logical indexing is used for efficiency
    numUncomfortableB = sum(uncomfortableB(:)); numUncomfortableA = sum(uncomfortableA(:)); % Count the number of uncomfortable Species A and B
    
    % Randomly choose an uncomfortable Species B and change it to Species A:
    [r, c] = find(uncomfortableB); % Get row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Randomly choose an uncomfortable Species B
    world(r(index), c(index)) = false; % Change Species B to Species A
    
    % Randomly choose an uncomfortable Species A and change it to Species B:
    [r, c] = find(uncomfortableA); % Get row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Randomly choose an uncomfortable Species A
    world(r(index), c(index)) = true; % Change Species A to Species B
    
end
imagesc(world) % Draw a color map
% We are only interested in seeing the final state, not the whole process.

% The final state of this model shows a high degree of polarization. 
% Both species only tolerate a small number of members from the other species nearby.

%%
% Changing Neighbor Tolerance
% Species B can tolerate two neighbors from Species A
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
world = rand(nside, nside) > 0.5; % Species A = 0; Species B = 1;

% Preallocate memory for matrices
nB = zeros(nside); % Matrix to store the number of Species B neighbors for each agent
uncomfortableB = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species B
uncomfortableA = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species A

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green and Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % Temporary high values to satisfy while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)
    
    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    nB = A + B + C + D; % Now nB has numbers of Species B neighbors for each agent in world
    
    % Logical matrices for uncomfortable species
    uncomfortableB = world & ((world .* nB) < 2); % Species B wants to be around at least 2 other Species B
    uncomfortableA = ~world & ((~world .* nB) > 1); % Species A is uncomfortable with more than 1 Species B neighbor
    
    numUncomfortableB = sum(uncomfortableB(:)); numUncomfortableA = sum(uncomfortableA(:)); % Count the number of uncomfortable Species A and B
    
    % Randomly choose an uncomfortable Species B and change it to Species A:
    [r, c] = find(uncomfortableB); % Get row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Randomly choose an uncomfortable Species B
    world(r(index), c(index)) = false; % Change Species B to Species A
    
    % Randomly choose an uncomfortable Species A and change it to Species B:
    [r, c] = find(uncomfortableA); % Get row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Randomly choose an uncomfortable Species A
    world(r(index), c(index)) = true; % Change Species A to Species B
    
end
imagesc(world) % Draw a color map

% This first variation of the base model is making Species B a bit more tolerant, 
% comfortable with two or less Species A neighbors. Here, Species A again only tolerates 
% one Species B neighbor. The final state of this model reflects a lower degree of polarization 
% compared with the first scenario.

%%
% Species A can tolerate two neighbors
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
world = rand(nside, nside) > 0.5; % Species A = 0; Species B = 1;

% Preallocate memory for matrices
nB = zeros(nside); % Matrix to store the number of Species B neighbors for each agent
uncomfortableB = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species B
uncomfortableA = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species A

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green and Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % Temporary high values to satisfy while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)
    
    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    nB = A + B + C + D; % Now nB has numbers of Species B neighbors for each agent in world

    % Logical matrices for uncomfortable species
    uncomfortableB = world & ((world .* nB) < 3); % Species B wants to be around at least 3 other Species B
    uncomfortableA = ~world & ((~world .* nB) > 2); % Species A is uncomfortable with more than 2 Species B neighbors
    
    numUncomfortableB = sum(uncomfortableB(:)); numUncomfortableA = sum(uncomfortableA(:)); % Count the number of uncomfortable Species A and B
    
    % Randomly choose an uncomfortable Species B and change it to Species A:
    [r, c] = find(uncomfortableB); % Get row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Randomly choose an uncomfortable Species B
    world(r(index), c(index)) = false; % Change Species B to Species A
    
    % Randomly choose an uncomfortable Species A and change it to Species B:
    [r, c] = find(uncomfortableA); % Get row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Randomly choose an uncomfortable Species A
    world(r(index), c(index)) = true; % Change Species A to Species B
    
end
imagesc(world) % Draw a color map

% In this variation of the base model, Species A now tolerates up to two Species B neighbors, 
% while Species B only tolerates one Species A neighbor. The final state of this model 
% shows again a relatively low degree of polarization.

%%
% Both Species A and Species B can tolerate two different neighbors
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
world = rand(nside, nside) > 0.5; % Species A = 0; Species B = 1;

% Preallocate memory for matrices
nB = zeros(nside); % Matrix to store the number of Species B neighbors for each agent
uncomfortableB = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species B
uncomfortableA = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species A

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green and Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % Temporary high values to satisfy while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)
    
    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    nB = A + B + C + D; % Now nB has numbers of Species B neighbors for each agent in world

    % Logical matrices for uncomfortable species
    uncomfortableB = world & ((world .* nB) < 2); % Species B wants to be around at least 2 other Species B
    uncomfortableA = ~world & ((~world .* nB) > 2); % Species A is uncomfortable with more than 2 Species B neighbors
    
    numUncomfortableB = sum(uncomfortableB(:)); numUncomfortableA = sum(uncomfortableA(:)); % Count the number of uncomfortable Species A and B
    
    % Randomly choose an uncomfortable Species B and change it to Species A:
    [r, c] = find(uncomfortableB); % Get row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Randomly choose an uncomfortable Species B
    world(r(index), c(index)) = false; % Change Species B to Species A
    
    % Randomly choose an uncomfortable Species A and change it to Species B:
    [r, c] = find(uncomfortableA); % Get row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Randomly choose an uncomfortable Species A
    world(r(index), c(index)) = true; % Change Species A to Species B
    
end
imagesc(world) % Draw a color map

% In this variation of the base model, both Species A and Species B tolerate 
% up to two neighbors from the other species. The final state of this model 
% shows a relatively low degree of polarization.

%%
% Increasing Number of Species A
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
world = rand(nside, nside) > 0.75; % Species A = 0; Species B = 1;
% Now, each cell in the matrix will be 1 if the corresponding cell in the 
% random matrix is greater than 0.75, and 0 otherwise. Initially, there are more Species A than Species B.

% Preallocate memory for matrices
nB = zeros(nside); % Matrix to store the number of Species B neighbors for each agent
uncomfortableB = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species B
uncomfortableA = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species A

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green and Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % Temporary high values to satisfy while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)
    
    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    nB = A + B + C + D; % Now nB has numbers of Species B neighbors for each agent in world
    
    % Logical matrices for uncomfortable species
    uncomfortableB = world & ((world .* nB) < 3); % Species B wants to be around at least 3 other Species B
    uncomfortableA = ~world & ((~world .* nB) > 1); % Species A is uncomfortable with more than 1 Species B neighbor
    
    numUncomfortableB = sum(uncomfortableB(:)); numUncomfortableA = sum(uncomfortableA(:)); % Count the number of uncomfortable Species A and B
    
    % Randomly choose an uncomfortable Species B and change it to Species A:
    [r, c] = find(uncomfortableB); % Get row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Randomly choose an uncomfortable Species B
    world(r(index), c(index)) = false; % Change Species B to Species A
    
    % Randomly choose an uncomfortable Species A and change it to Species B:
    [r, c] = find(uncomfortableA); % Get row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Randomly choose an uncomfortable Species A
    world(r(index), c(index)) = true; % Change Species A to Species B
    
end
imagesc(world) % Draw a color map

% In this variation, the initial number of Species A was increased. The final state shows 
% a similar degree of polarization, but with a higher number of Species A.

%%
% Expanded Neighborhood (1st order Moore neighborhood)
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
world = rand(nside, nside) > 0.5; % Species A = 0; Species B = 1;

% Preallocate memory for matrices
nB = zeros(nside); % Matrix to store the number of Species B neighbors for each agent
uncomfortableB = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species B
uncomfortableA = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species A

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green and Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % Temporary high values to satisfy while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)
    
    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    % The agents now consider the whole neighborhood around them, 
    % which means they are also considering their diagonal neighbors
    E = circshift(A', 1)'; F = circshift(A', -1)';
    G = circshift(B', 1)'; H = circshift(B', -1)';
    nB = A + B + C + D + E + F + G + H; % Now nB has numbers of Species B neighbors for each agent in world
    
    % Logical matrices for uncomfortable species
    uncomfortableB = world & ((world .* nB) < 5); % Species B wants to be around at least 5 other Species B
    uncomfortableA = ~world & ((~world .* nB) > 3); % Species A is uncomfortable with more than 3 Species B neighbors
    
    numUncomfortableB = sum(uncomfortableB(:)); numUncomfortableA = sum(uncomfortableA(:)); % Count the number of uncomfortable Species A and B
    
    % Randomly choose an uncomfortable Species B and change it to Species A:
    [r, c] = find(uncomfortableB); % Get row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Randomly choose an uncomfortable Species B
    world(r(index), c(index)) = false; % Change Species B to Species A
    
    % Randomly choose an uncomfortable Species A and change it to Species B:
    [r, c] = find(uncomfortableA); % Get row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Randomly choose an uncomfortable Species A
    world(r(index), c(index)) = true; % Change Species A to Species B
    
end
imagesc(world) % Draw a color map

% In this variation, the neighborhood considered by each agent was expanded. 
% The neighborhood now includes eight neighbors (1st order Moore neighborhood). 
% The agents are more tolerant, but polarization remains high.

%%
% Only adjacent neighbors can switch
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
world = rand(nside, nside) > 0.5; % Species A = 0; Species B = 1;

% Preallocate memory for matrices
nB = zeros(nside); % Matrix to store the number of Species B neighbors for each agent
uncomfortableB = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species B
uncomfortableA = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species A

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green and Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % Temporary high values to satisfy while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)
    
    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    nB = A + B + C + D; % Now nB has numbers of Species B neighbors for each agent in world
    
    % Logical matrices for uncomfortable species
    uncomfortableB = world & ((world .* nB) < 3); % Species B wants to be around at least 3 other Species B
    uncomfortableA = ~world & ((~world .* nB) > 1); % Species A is uncomfortable with more than 1 Species B neighbor
    
    numUncomfortableB = sum(uncomfortableB(:)); numUncomfortableA = sum(uncomfortableA(:)); % Count the number of uncomfortable Species A and B
    
    % Choose a random uncomfortable Species B:
    [r, c] = find(uncomfortableB); % Get the row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Choose a random uncomfortable Species B
    
    % Find adjacent uncomfortable Species A
    sadpA = circshift(uncomfortableA, 1); sadpB = circshift(uncomfortableA, -1);
    sadpC = circshift(uncomfortableA', 1)'; sadpD = circshift(uncomfortableA', -1)';
    
    % Switch positions if adjacent
    if sadpA(r(index), c(index)) == 1; % If above is uncomfortable Species A, switch
        a = circshift(world, 1);
        a(r(index), c(index)) = 1;
        world = circshift(a, -1);
        world(r(index), c(index)) = 0;
    elseif sadpB(r(index), c(index)) == 1; % If below is uncomfortable Species A, switch
        b = circshift(world, -1);
        b(r(index), c(index)) = 1;
        world = circshift(b, 1);
        world(r(index), c(index)) = 0;
    elseif sadpC(r(index), c(index)) == 1; % If left is uncomfortable Species A, switch
        c = circshift(world', 1)';
        c(r(index), c(index)) = 1;
        world = circshift(c', -1)';
        world(r(index), c(index)) = 0;
    else sadpD(r(index), c(index)) == 1; % If right is uncomfortable Species A, switch
        d = circshift(world', -1)';
        d(r(index), c(index)) = 1;
        world = circshift(d', 1)';
        world(r(index), c(index)) = 0;
    end
    
    % Choose a random uncomfortable Species A:
    [r, c] = find(uncomfortableA); % Get the row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Choose a random uncomfortable Species A

    % Find adjacent uncomfortable Species B
    sadeA = circshift(uncomfortableB, 1); sadeB = circshift(uncomfortableB, -1);
    sadeC = circshift(uncomfortableB', 1)'; sadeD = circshift(uncomfortableB', -1)';
    
    % Switch positions if adjacent
    if sadeA(r(index), c(index)) == 1; % If above is uncomfortable Species B, switch
        a = circshift(world, 1);
        a(r(index), c(index)) = 0;
        world = circshift(a, -1);
        world(r(index), c(index)) = 1;
    elseif sadeB(r(index), c(index)) == 1; % If below is uncomfortable Species B, switch
        b = circshift(world, -1);
        b(r(index), c(index)) = 0;
        world = circshift(b, 1);
        world(r(index), c(index)) = 1;
    elseif sadeC(r(index), c(index)) == 1; % If left is uncomfortable Species B, switch
        c = circshift(world', 1)';
        c(r(index), c(index)) = 0;
        world = circshift(c', -1)';
        world(r(index), c(index)) = 1;
    else sadeD(r(index), c(index)) == 1; % If right is uncomfortable Species B, switch
        d = circshift(world', -1)';
        d(r(index), c(index)) = 0;
        world = circshift(d', 1)';
        world(r(index), c(index)) = 1;
    end

end
imagesc(world) % Draw a color map

% This variation changes the rule, allowing only adjacent uncomfortable species to switch positions. 
% Limiting exchanges to adjacent neighbors seems to increase polarization.

%%
% Expanded Neighborhood (2nd order Moore neighborhood)
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
world = rand(nside, nside) > 0.5; % Species A = 0; Species B = 1;

% Preallocate memory for matrices
nB = zeros(nside); % Matrix to store the number of Species B neighbors for each agent
uncomfortableB = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species B
uncomfortableA = false(nside); % Matrix to store the state (comfortable/uncomfortable) of each Species A

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green and Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % Temporary high values to satisfy while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)
    
    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    E = circshift(A', 1)'; F = circshift(A', -1)';
    G = circshift(B', 1)'; H = circshift(B', -1)';
    I = circshift(world, 2); J = circshift(world, -2);
    K = circshift(world', 2)'; L = circshift(world', -2)';
    nB = A + B + C + D + E + F + G + H + I + J + K + L; % Expanded 2nd order Moore neighborhood
    
    % Logical matrices for uncomfortable species
    uncomfortableB = world & ((world .* nB) < 16); % Species B wants to be around at least 16 other Species B
    uncomfortableA = ~world & ((~world .* nB) > 8); % Species A is uncomfortable with more than 8 Species B neighbors
    
    numUncomfortableB = sum(uncomfortableB(:)); numUncomfortableA = sum(uncomfortableA(:)); % Count the number of uncomfortable Species A and B
    
    % Randomly choose an uncomfortable Species B and change it to Species A:
    [r, c] = find(uncomfortableB); % Get row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Randomly choose an uncomfortable Species B
    world(r(index), c(index)) = false; % Change Species B to Species A
    
    % Randomly choose an uncomfortable Species A and change it to Species B:
    [r, c] = find(uncomfortableA); % Get row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Randomly choose an uncomfortable Species A
    world(r(index), c(index)) = true; % Change Species A to Species B
    
end
imagesc(world) % Draw a color map

% In this final variation, the neighborhood was expanded further (2nd order Moore neighborhood). 
% The agents consider the neighbors of their neighbors. The final state shows a degree of polarization 
% similar to the 1st order Moore neighborhood scenario.
