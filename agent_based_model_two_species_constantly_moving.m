% Base Schelling-style model
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
randworld = rand(nside, nside); % Could also use round(rand(nside, nside))
world = randworld > 0.5; % Species A = 0; Species B = 1
% Approximately half of the species are Species A and half are Species B

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green, Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % High values to satisfy the while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)

    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    nB = A + B + C + D; % Now nB has numbers of Species B neighbors for each agent in world

    % Now determine the uncomfortable Species B
    uncomfortableB = world .* ((world .* nB) < 3); % Species B wants to be around at least 3 other Species B

    % Now determine the uncomfortable Species A
    uncomfortableA = abs(world - 1) .* ((abs(world - 1) .* nB) > 1); % Species A is uncomfortable around > 1 Species B

    numUncomfortableB = sum(sum(uncomfortableB)); numUncomfortableA = sum(sum(uncomfortableA));

    % Now choose a random uncomfortable Species B and change to be Species A:
    [r, c] = find(uncomfortableB); % Get the row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Choose a random uncomfortable Species B
    world(r(index), c(index)) = 0; % Change Species B to Species A

    % Now choose a random uncomfortable Species A and change to be Species B:
    [r, c] = find(uncomfortableA); % Get the row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Choose a random uncomfortable Species A
    world(r(index), c(index)) = 1; % Change Species A to Species B

end
imagesc(world) % Draw a color map

%%
% Changing Neighbour Tolerance
% Species B can tolerate two different neighbors
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
randworld = rand(nside, nside); % Could also use round(rand(nside, nside))
world = randworld > 0.5; % Species A = 0; Species B = 1

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green, Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % High values to satisfy the while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)

    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    nB = A + B + C + D; % Now nB has numbers of Species B neighbors for each agent in world

    % Now determine the uncomfortable Species B
    uncomfortableB = world .* ((world .* nB) < 2); % Species B wants to be around at least 2 other Species B

    % Now determine the uncomfortable Species A
    uncomfortableA = abs(world - 1) .* ((abs(world - 1) .* nB) > 1); % Species A is uncomfortable around > 1 Species B

    numUncomfortableB = sum(sum(uncomfortableB)); numUncomfortableA = sum(sum(uncomfortableA));

    % Now choose a random uncomfortable Species B and change to be Species A:
    [r, c] = find(uncomfortableB); % Get the row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Choose a random uncomfortable Species B
    world(r(index), c(index)) = 0; % Change Species B to Species A

    % Now choose a random uncomfortable Species A and change to be Species B:
    [r, c] = find(uncomfortableA); % Get the row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Choose a random uncomfortable Species A
    world(r(index), c(index)) = 1; % Change Species A to Species B

end
imagesc(world) % Draw a color map

%%
% Species A can tolerate two different neighbors
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
randworld = rand(nside, nside); % Could also use round(rand(nside, nside))
world = randworld > 0.5; % Species A = 0; Species B = 1

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green, Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % High values to satisfy the while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)

    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    nB = A + B + C + D; % Now nB has numbers of Species B neighbors for each agent in world

    % Now determine the uncomfortable Species B
    uncomfortableB = world .* ((world .* nB) < 3); % Species B wants to be around at least 3 other Species B

    % Now determine the uncomfortable Species A
    uncomfortableA = abs(world - 1) .* ((abs(world - 1) .* nB) > 2); % Species A is uncomfortable around > 2 Species B

    numUncomfortableB = sum(sum(uncomfortableB)); numUncomfortableA = sum(sum(uncomfortableA));

    % Now choose a random uncomfortable Species B and change to be Species A:
    [r, c] = find(uncomfortableB); % Get the row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Choose a random uncomfortable Species B
    world(r(index), c(index)) = 0; % Change Species B to Species A

    % Now choose a random uncomfortable Species A and change to be Species B:
    [r, c] = find(uncomfortableA); % Get the row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Choose a random uncomfortable Species A
    world(r(index), c(index)) = 1; % Change Species A to Species B

end
imagesc(world) % Draw a color map

%%
% Both Species A and Species B can tolerate two different neighbors
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
randworld = rand(nside, nside); % Could also use round(rand(nside, nside))
world = randworld > 0.5; % Species A = 0; Species B = 1

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green, Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % High values to satisfy the while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)

    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    nB = A + B + C + D; % Now nB has numbers of Species B neighbors for each agent in world

    % Now determine the uncomfortable Species B
    uncomfortableB = world .* ((world .* nB) < 2); % Species B wants to be around at least 2 other Species B

    % Now determine the uncomfortable Species A
    uncomfortableA = abs(world - 1) .* ((abs(world - 1) .* nB) > 2); % Species A is uncomfortable around > 2 Species B

    numUncomfortableB = sum(sum(uncomfortableB)); numUncomfortableA = sum(sum(uncomfortableA));

    % Now choose a random uncomfortable Species B and change to be Species A:
    [r, c] = find(uncomfortableB); % Get the row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Choose a random uncomfortable Species B
    world(r(index), c(index)) = 0; % Change Species B to Species A

    % Now choose a random uncomfortable Species A and change to be Species B:
    [r, c] = find(uncomfortableA); % Get the row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Choose a random uncomfortable Species A
    world(r(index), c(index)) = 1; % Change Species A to Species B

end
imagesc(world) % Draw a color map

%%
% There are initially more Species A than Species B
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
randworld = rand(nside, nside); % Could also use round(rand(nside, nside))
world = randworld > 0.75; % Species A = 0; Species B = 1; initially more Species A

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green, Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % High values to satisfy the while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)

    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    nB = A + B + C + D; % Now nB has numbers of Species B neighbors for each agent in world

    % Now determine the uncomfortable Species B
    uncomfortableB = world .* ((world .* nB) < 3); % Species B wants to be around at least 3 other Species B

    % Now determine the uncomfortable Species A
    uncomfortableA = abs(world - 1) .* ((abs(world - 1) .* nB) > 1); % Species A is uncomfortable around > 1 Species B

    numUncomfortableB = sum(sum(uncomfortableB)); numUncomfortableA = sum(sum(uncomfortableA));

    % Now choose a random uncomfortable Species B and change to be Species A:
    [r, c] = find(uncomfortableB); % Get the row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Choose a random uncomfortable Species B
    world(r(index), c(index)) = 0; % Change Species B to Species A

    % Now choose a random uncomfortable Species A and change to be Species B:
    [r, c] = find(uncomfortableA); % Get the row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Choose a random uncomfortable Species A
    world(r(index), c(index)) = 1; % Change Species A to Species B

end
imagesc(world) % Draw a color map

%%
% Expanded Neighborhood
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
randworld = rand(nside, nside); % Could also use round(rand(nside, nside))
world = randworld > 0.5; % Species A = 0; Species B = 1
% Approximately half of the species are Species A and half are Species B

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green, Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % High values to satisfy the while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)

    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    % Agents now consider their whole neighbourhood, including diagonal neighbours
    topleft = circshift(A', 1)'; topright = circshift(A', -1)';
    bottomleft = circshift(B', 1)'; bottomright = circshift(B', -1)';
    nB = A + B + C + D + topleft + topright + bottomleft + bottomright; % Now nB has numbers of Species B neighbors for each agent in world

    % Now determine the uncomfortable Species B
    uncomfortableB = world .* ((world .* nB) < 5); % Species B wants to be around at least 5 other Species B

    % Now determine the uncomfortable Species A
    uncomfortableA = abs(world - 1) .* ((abs(world - 1) .* nB) > 3); % Species A is uncomfortable around > 3 Species B

    numUncomfortableB = sum(sum(uncomfortableB)); numUncomfortableA = sum(sum(uncomfortableA));

    % Now choose a random uncomfortable Species B and change to be Species A:
    [r, c] = find(uncomfortableB); % Get the row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Choose a random uncomfortable Species B
    world(r(index), c(index)) = 0; % Change Species B to Species A

    % Now choose a random uncomfortable Species A and change to be Species B:
    [r, c] = find(uncomfortableA); % Get the row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Choose a random uncomfortable Species A
    world(r(index), c(index)) = 1; % Change Species A to Species B

end
imagesc(world) % Draw a color map

%%
% Only adjacent neighbors can switch
clear all

% First we set up a world with randomly scattered Species A and Species B
nside = 50; % The number of agents on each side of the matrix
randworld = rand(nside, nside); % Could also use round(rand(nside, nside))
world = randworld > 0.5; % Species A = 0; Species B = 1
% Approximately half of the species are Species A and half are Species B

figure;
colormap([0 1 0; 1 0 0]); % Sets Species A as green, Species B as red

numUncomfortableB = 100; numUncomfortableA = 100; % High values to satisfy the while condition

while (numUncomfortableB > 50) && (numUncomfortableA > 50)

    % First calculate number of Species B surrounding each agent
    A = circshift(world, 1); B = circshift(world, -1);
    C = circshift(world', 1)'; D = circshift(world', -1)';
    nB = A + B + C + D; % Now nB has numbers of Species B neighbors for each agent in world

    % Now determine the uncomfortable Species B
    uncomfortableB = world .* ((world .* nB) < 3); % Species B wants to be around at least 3 other Species B

    % Now determine the uncomfortable Species A
    uncomfortableA = abs(world - 1) .* ((abs(world - 1) .* nB) > 1); % Species A is uncomfortable around > 1 Species B

    numUncomfortableB = sum(sum(uncomfortableB)); numUncomfortableA = sum(sum(uncomfortableA));

    % Choose a random uncomfortable Species B:
    [r, c] = find(uncomfortableB); % Get the row and col indices of all uncomfortable Species B
    index = ceil(rand * numUncomfortableB); % Choose a random uncomfortable Species B

    sadpA = circshift(uncomfortableA, 1); sadpB = circshift(uncomfortableA, -1);
    sadpC = circshift(uncomfortableA', 1)'; sadpD = circshift(uncomfortableA', -1)';

    % Change the Species B to Species A (only adjacent neighbors)
    % In this part, the code selects a random uncomfortable Species B and checks if
    % it has an uncomfortable Species A in any of the four adjacent positions (above, below, left, or right).
    % If it finds one, it changes the Species A to Species B and the original Species B to Species A.

    if sadpA(r(index), c(index)) == 1; % If above is uncomfortable Species A, switch
        wa = circshift(world, 1);
        wa(r(index), c(index)) = 1;
        world = circshift(wa, -1);
        world(r(index), c(index)) = 0;
    elseif sadpB(r(index), c(index)) == 1; % If below is uncomfortable Species A, switch
        wb = circshift(world, -1);
        wb(r(index), c(index)) = 1;
        world = circshift(wb, 1);
        world(r(index), c(index)) = 0;
    elseif sadpC(r(index), c(index)) == 1; % If left is uncomfortable Species A, switch
        wc = circshift(world', 1)';
        wc(r(index), c(index)) = 1;
        world = circshift(wc', -1)';
        world(r(index), c(index)) = 0;
    else sadpD(r(index), c(index)) == 1; % If right is uncomfortable Species A, switch
        wd = circshift(world', -1)';
        wd(r(index), c(index)) = 1;
        world = circshift(wd', 1)';
        world(r(index), c(index)) = 0;
    end

    % Choose a random uncomfortable Species A:
    [r, c] = find(uncomfortableA); % Get the row and col indices of all uncomfortable Species A
    index = ceil(rand * numUncomfortableA); % Choose a random uncomfortable Species A

    sadpA = circshift(uncomfortableB, 1); sadpB = circshift(uncomfortableB, -1);
    sadpC = circshift(uncomfortableB', 1)'; sadpD = circshift(uncomfortableB', -1)';

    % Change the Species A to Species B (only adjacent neighbors)
    % In this part, the code selects a random uncomfortable Species A and checks
    % if it has an uncomfortable Species B in any of the four adjacent positions.
    % If it finds one, it switches the Species B to Species A and vice versa.

    if sadpA(r(index), c(index)) == 1; % If above is uncomfortable Species B, switch
        wa = circshift(world, 1);
        wa(r(index), c(index)) = 0;
        world = circshift(wa, -1);
        world(r(index), c(index)) = 1;
    elseif sadpB(r(index), c(index)) == 1; % If below is uncomfortable Species B, switch
        wb = circshift(world, -1);
        wb(r(index), c(index)) = 0;
        world = circshift(wb, 1);
        world(r(index), c(index)) = 1;
    elseif sadpC(r(index), c(index)) == 1; % If left is uncomfortable Species B, switch
        wc = circshift(world', 1)';
        wc(r(index), c(index)) = 0;
        world = circshift(wc', -1)';
        world(r(index), c(index)) = 1;
    else sadpD(r(index), c(index)) == 1; % If right is uncomfortable Species B, switch
        wd = circshift(world', -1)';
        wd(r(index), c(index)) = 0;
        world = circshift(wd', 1)';
        world(r(index), c(index)) = 1;
    end

end
imagesc(world) % Draw a color map
