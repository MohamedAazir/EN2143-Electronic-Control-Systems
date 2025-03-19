%% First Order Response: RC Circuit
R1=1000; R2=2000; C=200*10^-6;          % circuit components
a=(R1+R2)/(R1*R2*C); b=1/(R1*C);        % model coefficients
v0 = 2;                                 % intial condition
dur= 0.6;                               % simulation duration
t = [0:0.01:dur];                      % sampling interval

%% Homogeneous Response
yH = v0*exp(-a*t);

%% Exogenous Response
yE = (b/a)*(1-exp(-a*t));

%% Total Response
yT = yH + yE;

%% Plot Graphs
subplot(311); plot(t,yH); axis([0 dur 0 2]);
ylabel('Homogeneous response [V]'); grid on;

subplot(312); plot(t,yE); axis([0 dur 0 2]);
ylabel('Exogenous response [V]'); grid on;

subplot(313); plot(t,yT); axis([0 dur 0 2]);
ylabel('Total Response [V]'); xlabel('time [s]'); grid on;
