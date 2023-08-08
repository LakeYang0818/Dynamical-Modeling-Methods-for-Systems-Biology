% Week 2 - Dynamic Systems

% Euler's method example:
    % Differential Equation: dx/dt = a - bx
    % Initial Condition:     x(t = 0) = c
    % Assume a = 20, b = 2, c = 5
%{
a = 20 ;
b = 2  ; 
c = 5  ;
dt = 0.05;
tlast = 2;

iterations = round(tlast / dt) ;
xall = zeros(iterations, 1)    ;

x = c ;  % Initial Condition
for i  = 1:iterations
    xall(i) = x ;
    dxdt = a - b * x;
    x = x + dxdt * dt ;
end

time = dt * (0:iterations - 1)';
figure
plot(time, xall)

% -----Assignment 2-----

% Question 1
    % Differential Equation: d[ATP]/dt = 2k1[G][ATP] - kp[ATP] / ([ATP] + Km)
    %                        d[G]/dt = Vin - k1[G][ATP]
    % Initial Condition:     [ATP](t = 0) = 4
    %                        G(t = 0) = 3
Vin = 0.36 ; 
k1 = 0.02 ;
kp = 6 ;
Km = 12 ;
dt = 0.05;
tlast = 300;
iterations = round(tlast / dt) ;
ATP_all = zeros(iterations, 1) ;
G_all   = zeros(iterations, 1) ;
ATP = 4;
G = 3;
for i  = 1:iterations
    ATP_all(i) = ATP ;
    G_all(i)   = G ;
    dATPdt = 2 * k1 * G * ATP - kp * ATP / (ATP + Km) ;
    dGdt = Vin - k1 * G * ATP ;

    ATP = ATP + dATPdt * dt ;
    G = G + dGdt * dt ;
end

time = dt * (0:iterations - 1)';
figure
plot(time, ATP_all)
figure
plot(time, G_all)

% Question 2
fprintf("The maxumum concentraction of Glucose is " + max(G_all) + "\n") ;
fprintf("The maxumum concentraction of ATP is " + max(ATP_all) + "\n") ;
    
% Question 3
% Create a figure window
figure;

% Define the range and initial value of the slider
sliderMin = 0;
sliderMax = 100;
sliderValue = 50;

% Create the slider using uicontrol
slider = uicontrol('Style', 'slider', ...
                   'Min', sliderMin, ...
                   'Max', sliderMax, ...
                   'Value', sliderValue, ...
                   'Position', [50, 50, 200, 20]);

ax = axes('Position', [0.1, 0.4, 0.8, 0.5]);

% Callback function for the slider
slider.Callback = @(src, event) updatePlot(src, ax);

function updatePlot(slider, ax)
    Vin = 0.36 ; 
    k1 = 0.02 ;
    kp = 6 ;
    Km = get(slider, 'Value')
    dt = 0.05;
    tlast = 300;
    iterations = round(tlast / dt) ;
    ATP_all = zeros(iterations, 1) ;
    G_all   = zeros(iterations, 1) ;
    ATP = 4;
    G = 3;
    for i  = 1:iterations
        ATP_all(i) = ATP ;
        G_all(i)   = G ;
        dATPdt = 2 * k1 * G * ATP - kp * ATP / (ATP + Km) ;
        dGdt = Vin - k1 * G * ATP ;
        ATP = ATP + dATPdt * dt ;
        G = G + dGdt * dt ;
    end
    time = dt * (0:iterations - 1)';
    figure
    plot(ax, time, ATP_all)
    figure
    plot(ax, time, G_all)
end

% Question 4
% frequency: 2.5
Vin = 0.36 ; 
k1 = 0.02 ;
kp = 6 ;
Km = 50; 

% frequency: 5
Vin = 0.01 ; 
k1 = 0.01 ;
kp = 6 ;
Km = 20;

% frequency: 3
Vin = 0.1 ; 
k1 = 0.01 ;
kp = 6 ;
Km = 20;

% frequency: 3
Vin = 0.7 ; 
k1 = 0.01 ;
kp = 2 ;
Km = 23;

dt = 0.05;
tlast = 300;
iterations = round(tlast / dt) ;
ATP_all = zeros(iterations, 1) ;
G_all   = zeros(iterations, 1) ;
ATP = 4;
G = 3;
for i  = 1:iterations
    ATP_all(i) = ATP ;
    G_all(i)   = G ;
    dATPdt = 2 * k1 * G * ATP - kp * ATP / (ATP + Km) ;
    dGdt = Vin - k1 * G * ATP ;

    ATP = ATP + dATPdt * dt ;
    G = G + dGdt * dt ;
end

time = dt * (0:iterations - 1)';
figure
plot(time, ATP_all)
figure
plot(time, G_all)

% Question 5
% amplitude: 5.5, 7.5
Vin = 0.36 ; 
k1 = 0.02 ;
kp = 4 ;
Km = 15; 

% amplitude: 15, 8
Vin = 0.2 ; 
k1 = 0.02 ;
kp = 5 ;
Km = 13;

% amplitude: 20, 15
Vin = 0.1 ; 
k1 = 0.02 ;
kp = 6 ;
Km = 12;

% amplitude: 30, 35
Vin = 0.36 ; 
k1 = 0.02 ;
kp = 6 ;
Km = 9;

dt = 0.05;
tlast = 300;
iterations = round(tlast / dt) ;
ATP_all = zeros(iterations, 1) ;
G_all   = zeros(iterations, 1) ;
ATP = 4;
G = 3;
for i  = 1:iterations
    ATP_all(i) = ATP ;
    G_all(i)   = G ;
    dATPdt = 2 * k1 * G * ATP - kp * ATP / (ATP + Km) ;
    dGdt = Vin - k1 * G * ATP ;

    ATP = ATP + dATPdt * dt ;
    G = G + dGdt * dt ;
end

time = dt * (0:iterations - 1)';
figure
plot(time, ATP_all)
figure
plot(time, G_all)

% Question 6
% continuing oscillations
Vin = 0.5 ; 
k1 = 0.02 ;
kp = 6 ;
Km = 12; 

% damped oscillations
Vin = 0.3 ; 
k1 = 0.02 ;
kp = 6 ;
Km = 18; 

% continuing oscillations
Vin = 0.36 ; 
k1 = 0.01 ;
kp = 7 ;
Km = 13; 

% continuing oscillations
Vin = 0.36 ; 
k1 = 0.01 ;
kp = 6 ;
Km = 13; 

dt = 0.05;
tlast = 300;
iterations = round(tlast / dt) ;
ATP_all = zeros(iterations, 1) ;
G_all   = zeros(iterations, 1) ;
ATP = 4;
G = 3;
for i  = 1:iterations
    ATP_all(i) = ATP ;
    G_all(i)   = G ;
    dATPdt = 2 * k1 * G * ATP - kp * ATP / (ATP + Km) ;
    dGdt = Vin - k1 * G * ATP ;

    ATP = ATP + dATPdt * dt ;
    G = G + dGdt * dt ;
end

time = dt * (0:iterations - 1)';
figure
plot(time, ATP_all)
figure
plot(time, G_all)

% Question 7
% plot of ATP vs G under damped oscillatory behaviour
% damped oscillations
Vin = 0.3 ; 
k1 = 0.02 ;
kp = 6 ;
Km = 18;

dt = 0.05;
tlast = 300;
iterations = round(tlast / dt) ;
ATP_all = zeros(iterations, 1) ;
G_all   = zeros(iterations, 1) ;
ATP = 4;
G = 3;
for i  = 1:iterations
    ATP_all(i) = ATP ;
    G_all(i)   = G ;
    dATPdt = 2 * k1 * G * ATP - kp * ATP / (ATP + Km) ;
    dGdt = Vin - k1 * G * ATP ;

    ATP = ATP + dATPdt * dt ;
    G = G + dGdt * dt ;
end

time = dt * (0:iterations - 1)';
figure
plot(G_all, ATP_all)

% Question 8
% Create a figure window
figure
% Define the range and initial value of the slider
sliderMin = 0;
sliderMax = 1.3;
sliderValue = 0;

% Create the slider using uicontrol
slider = uicontrol('Style', 'slider', ...
                   'Min', sliderMin, ...
                   'Max', sliderMax, ...
                   'Value', sliderValue, ...
                   'Position', [50, 50, 200, 20]);

ax = axes('Position', [0.1, 0.4, 0.8, 0.5]);

% Callback function for the slider
slider.Callback = @(src, event) updatePlot(src, ax);

function updatePlot(slider, ax)
    k1 = 0.02 ;
    kp = 6 ;
    Vin = get(slider, 'Value') ;
    Km = 12 ;
    dt = 0.05;
    tlast = 5000;
    iterations = round(tlast / dt) ;
    ATP_all = zeros(iterations, 1) ;
    G_all   = zeros(iterations, 1) ;
    ATP = 4;
    G = 3;
    for i  = 1:iterations
        ATP_all(i) = ATP ;
        G_all(i)   = G ;
        dATPdt = 2 * k1 * G * ATP - kp * ATP / (ATP + Km) ;
        dGdt = Vin - k1 * G * ATP ;
        ATP = ATP + dATPdt * dt ;
        G = G + dGdt * dt ;
    end
    time = dt * (0:iterations - 1)';
    %plot(ax, time, ATP_all)
    plot(ax, time, G_all)
end

% Question 9
% Create a figure window
figure
% Define the range and initial value of the slider
sliderMin = 0;
sliderMax = 20;
sliderValue = 10;

% Create the slider using uicontrol
slider = uicontrol('Style', 'slider', ...
                   'Min', sliderMin, ...
                   'Max', sliderMax, ...
                   'Value', sliderValue, ...
                   'Position', [50, 50, 200, 20]);

ax = axes('Position', [0.1, 0.4, 0.8, 0.5]);

% Callback function for the slider
slider.Callback = @(src, event) updatePlot(src, ax);

function updatePlot(slider, ax)
    Vin = 0.36 ;
    k1 = 0.02 ;
    kp = 6 ;
    Km = get(slider, 'Value') ;
    dt = 0.05;
    tlast = 5000;
    iterations = round(tlast / dt) ;
    ATP_all = zeros(iterations, 1) ;
    G_all   = zeros(iterations, 1) ;
    ATP = 4;
    G = 3;
    for i  = 1:iterations
        ATP_all(i) = ATP ;
        G_all(i)   = G ;
        dATPdt = 2 * k1 * G * ATP - kp * ATP / (ATP + Km) ;
        dGdt = Vin - k1 * G * ATP ;
        ATP = ATP + dATPdt * dt ;
        G = G + dGdt * dt ;
    end
    time = dt * (0:iterations - 1)';
    plot(ax, time, ATP_all)
    %plot(ax, time, G_all)
end

% Question 10
% Create a figure window
figure
% Define the range and initial value of the slider
sliderMin = 0.1;
sliderMax = 1.6;
sliderValue = 0.1;

% Create the slider using uicontrol
slider = uicontrol('Style', 'slider', ...
                   'Min', sliderMin, ...
                   'Max', sliderMax, ...
                   'Value', sliderValue, ...
                   'Position', [50, 50, 200, 20]);

ax = axes('Position', [0.1, 0.4, 0.8, 0.5]);

% Callback function for the slider
slider.Callback = @(src, event) updatePlot(src, ax);

function updatePlot(slider, ax)
    Vin = get(slider, 'Value') ;
    k1 = 0.02 ;
    kp = 6 ;
    Km = 12 ;
    dt = 0.05;
    tlast = 2000;
    iterations = round(tlast / dt) ;
    ATP_all = zeros(iterations, 1) ;
    G_all   = zeros(iterations, 1) ;
    ATP = 4;
    G = 3;
    for i  = 1:iterations
        ATP_all(i) = ATP ;
        G_all(i)   = G ;
        dATPdt = 2 * k1 * G * ATP - kp * ATP / (ATP + Km) ;
        dGdt = Vin - k1 * G * ATP ;
        ATP = ATP + dATPdt * dt ;
        G = G + dGdt * dt ;
    end
    time = dt * (0:iterations - 1)';
    plot(ax, G_all, ATP_all)
end
%}


