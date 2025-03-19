%% Second Order System Feedback Gain Tuning
m=50;
b=700; k=125; Dg=6000;                  % b[Ns/cm] k[N/cm] m[kg]
sigma=b/(2*m); rho=k/m; eta=1/m;        % model coefficients
gc=(sigma^2-rho)/eta; gu=-rho/eta;      % critical and unstable gain
criDCG=eta/sigma^2;                     % critical DCG

%% Output Voltage Variation
subplot(211);
%g=gc+Dg; cltrfun=tf([eta], [1 2*sigma rho+g*eta]);          %under
%step(cltrfun); hold on; deltasq=sigma^2-rho-g*eta
%g=gc; cltrfun=tf([eta], [1 2*sigma rho+g*eta]);             %critical
%step(cltrfun); hold on; grid on; deltasq=sigma^2-rho-g*eta
%g=(gc+gu)/2; cltrfun=tf([eta], [1 2*sigma rho+g*eta]);      %over
%step(cltrfun); hold on; deltasq=sigma^2-rho-g*eta
%g=0; cltrfun=tf([eta], [1 2*sigma rho+g*eta]);              %open
%step(cltrfun); hold on; deltasq=sigma^2-rho-g*eta
g=gc; cltrfun=tf([eta/criDCG], [1 2*sigma rho+g*eta]);       %tuned
step(cltrfun); hold on;grid on;

%legend("UnderD", "CriticalD", "OverD")
ylabel('Table height y[cm]');

%% Controlled Force by way of Feedback
subplot(212);
%g=gc+Dg; exoinput=tf([1 2*sigma rho], [1 2*sigma rho+g*eta]);       %under
%step(exoinput); hold on; grid on;
%g=gc; exoinput=tf([1 2*sigma rho], [1 2*sigma rho+g*eta]);       %critical
%step(exoinput); hold on; grid on;
%g=(gc+gu)/2; exoinput=tf([1 2*sigma rho], [1 2*sigma rho+g*eta]);   %over
%step(exoinput); hold on; grid on;
%g=0; exoinput=tf([1 2*sigma rho], [1 2*sigma rho+g*eta]);           %open
%step(exoinput); hold on; grid on;
g=gc; exoinput=tf(1/criDCG*[1 2*sigma rho], [1 2*sigma rho+g*eta]);   %tuned
step(exoinput); hold on; grid on;

%legend("UnderD", "CriticalD", "OverD")
ylabel('Control Force[N]');

