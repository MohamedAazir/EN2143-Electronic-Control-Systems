%% Shock3p8 : Second Order Response of Shock-Absorber
dur = 25; m = 50;                                % weight of the rider
b = 700; k = 125;                                % case 1: b[Ns/cm] k[N/cm] m[kg] over damped
%b = 700; k = b^2/(4*m);                         % case 2: b[Ns/cm] k[N/cm] m[kg] critically damped
%b = 300; k = 2450;                              % case 3: b[Ns/cm] k[N/cm] m[kg] under damped

sigma = b/(2*m); rho = k/m; eta = 1/m;           % model coefficients
d = sigma^2-rho;                                 % determinant
A = 10*m;                                        % weight step input

t = 0:0.01:dur;
y0 = -1.50; yd0 = 1.80;
k1 = y0; k2 = 2*sigma*y0 + yd0;

%% Determination of Poles
if d>0
    alpha1 = -sigma + sqrt(d);
    alpha2 = -sigma - sqrt(d);
    p1 = (alpha1*k1 + k2)/(alpha1 - alpha2);
    p2 = (alpha2*k1 + k2)/(alpha2 - alpha1);
    q1 = 1/(alpha1*(alpha1 - alpha2));
    q2 = 1/(alpha2*(alpha2 - alpha1));
    q3 = 1/(alpha1*alpha2);

    yH = p1*exp(alpha1*t) + p2*exp(alpha2*t);
    yE = eta*A*(q1*exp(alpha1*t) + q2*exp(alpha2*t) + q3);

elseif d==0
    alpha = -sigma;
    p5 = (k1*alpha + k2)/alpha; p6 = -k2/alpha; p7 = 1/alpha; p8 = -1/alpha;  

    yH = (p6+p5)*exp(alpha1*t) + alpha*t.*exp(alpha*t);
    yE = eta*A*(-p7*t.*exp(alpha*t) + p8*(exp(alpha*t)-1)/alpha);

else
    omega = sqrt(-d); phiH = atan2(k1, (k2-sigma*k1)/omega);
    phiE = atan2(omega,sigma);
    K = sqrt(k1^2+(k2-sigma*k1)^2/omega^2);

    yH = K*exp(-sigma*t).*sin(omega*t+phiH);
    yE1 = exp(-sigma*t).*sin(omega*t+phiE);
    yE = eta*A/omega*(omega/(omega^2+sigma^2)-yE1);
   
end

%% Total Response
yT = yH + yE;

%% Plot Graphs
subplot(311); plot(t,yH); axis([0 dur -2.8 5]);
ylabel('Homogeneous response [y_H]'); grid on;

subplot(312); plot(t,yE); axis([0 dur -2.8 5]);
ylabel('Exogenous response [y_E]'); grid on;

subplot(313); plot(t,yT); axis([0 dur -2.8 5]);
ylabel('Total Response [y_T]'); xlabel('time [s]'); grid on;
