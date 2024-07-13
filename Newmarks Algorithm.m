% Parameters
m = 1;          % Mass (kg)
wn = 5;         % Natural frequency (rad/s)
zeta_values = [0.1, 1, 2]; % Damping ratios
x0 = 0.01;      % Initial displacement (m)
v0 = 0;         % Initial velocity (m/s)
duration = 5;   % Total simulation time (s)
dt = 0.01;      % Time step (s)

% Initialize arrays
time = 0:dt:duration;
displacements = zeros(length(time), length(zeta_values));
velocities = zeros(length(time), length(zeta_values));

% Newmark's algorithm
for i = 1:length(zeta_values)
    zeta = zeta_values(i);
    beta = 0.25;
    gamma = 0.5;

    % Initial conditions
    x = x0;
    v = v0;

    for j = 1:length(time)
        omega_d = wn * sqrt(1 - zeta^2);

        a = -2 * zeta * wn * v - wn^2 * x; % Acceleration

        delta_t = time(j) - dt;

        % Predictions
        x_pred = x + dt * v + (1/2 - beta) * dt^2 * a;
        v_pred = v + (1 - gamma) * dt * a;

        % Corrector
        a_pred = -2 * zeta * wn * v_pred - wn^2 * x_pred;
        x = x + dt * v + beta * dt^2 * a_pred;
        v = v + gamma * dt * a_pred;

        % Store results
        displacements(j, i) = x;
        velocities(j, i) = v;
    end
end

% Plot displacements
figure;
plot(time, displacements(:, 1), 'r', 'LineWidth', 1.5, 'DisplayName', '\zeta = 0.1');
hold on;
plot(time, displacements(:, 2), 'g', 'LineWidth', 1.5, 'DisplayName', '\zeta = 1');
plot(time, displacements(:, 3), 'b', 'LineWidth', 1.5, 'DisplayName', '\zeta = 2');
hold off;
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Free Vibration with Newmark''s Algorithm');
legend('Location', 'best');

% Plot velocities
figure;
plot(time, velocities(:, 1), 'r', 'LineWidth', 1.5, 'DisplayName', '\zeta = 0.1');
hold on;
plot(time, velocities(:, 2), 'g', 'LineWidth', 1.5, 'DisplayName', '\zeta = 1');
plot(time, velocities(:, 3), 'b', 'LineWidth', 1.5, 'DisplayName', '\zeta = 2');
hold off;
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity Response with Newmark''s Algorithm');
legend('Location', 'best');
