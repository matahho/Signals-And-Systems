

% Define the time range
t = 0:0.1:5; % Adjust the step size as needed

% Define the function
f_t = (1/2 * exp(-3*t) - 3/2 * exp(-t) + 1) .* (t >= 0);

% Plot the function
plot(t, f_t, 'LineWidth', 2);

% Label the axes
xlabel('Time (t)');
ylabel('f(t)');

% Title for the plot
title('Plot of (1/2 * e^(-3t) - 3/2 * e^(-t) + 1) * u(t)');

% Show the grid
grid on;

% Show the plot
legend('(1/2 * e^(-3t) - 3/2 * e^(-t) + 1) * u(t)');
