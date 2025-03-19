%% RC Circuit: First Order System Feedback Gain Tuning
r=1000; c=0.0002;                       % circuit components
a=2/(r*c); b=1/(r*c);                   % model coefficients
dur = 0.6;                              % simulation duration

%% Output Voltage
subplot(211);
K = 0; ag = a+K*b; cct = tf([b], [1 ag]); step(cct, dur); hold on;
K = -1; ag = a + K*b;  %% DCG = 1 
cct = tf([b], [1 ag]); step(cct, dur); hold on;
K = -1.5; ag = a+K*b; cct = tf([b], [1 ag]); step(cct, dur); hold on;
K = 2; ag = a+K*b; cct = tf([b], [1 ag]); step(cct, dur); hold on; grid on;
K = -2; ag = a+K*b; cct = tf([b], [1 ag]); step(cct, dur); hold on;
K = -2.05; ag = a+K*b; cct = tf([b], [1 ag]); step(cct, dur); hold on;
ylabel('Output Voltage [V]');

legend("K=0", "K=-1", "K=-1.5", "K=2", "K=-2", "K=-2.05")


%% Control Voltage
subplot(212);
K = 0; ag = a+K*b; Vs = tf([1 a], [1 ag]); step(Vs, dur); hold on;
K = -1; ag = a + K*b;  %% DCG = 1 
Vs = tf([1 a], [1 ag]); step(Vs, dur); hold on;
K = -1.5; ag = a+K*b; Vs = tf([1 a], [1 ag]); step(Vs, dur); hold on;
K = 2; ag = a+K*b; Vs = tf([1 a], [1 ag]); step(Vs, dur); hold on; grid on;
K = -2; ag = a+K*b; Vs = tf([1 a], [1 ag]); step(Vs, dur); hold on;
K = -2.05; ag = a+K*b; Vs = tf([1 a], [1 ag]); step(Vs, dur); hold on;
ylabel('Control Voltage [V]');

legend("K=0", "K=-1", "K=-1.5", "K=2", "K=-2", "K=-2.05")


