%% RC Circuit: First Order System Example 

% System Information
% time const. = 50 ms
% DCG=1 Response
% R1=R2= 1000, and C=200u

r=1000; c=0.0002;                       % circuit components
a=2/(r*c); b=1/(r*c);                   % model coefficients
dur = 0.6;                              % simulation duration

%% Output Voltage
subplot(211);
K = 2; ag = a+K*b; cct = tf([4*b], [1 ag]); step(cct, dur); hold on; grid on;
ylabel('Output Voltage [V]');

%% Controlled Voltage
subplot(212);
K = 2; ag = a+K*b; Vs = tf([4 4*a], [1 ag]); step(Vs, dur); hold on; grid on;
ylabel('Control Voltage [V]');