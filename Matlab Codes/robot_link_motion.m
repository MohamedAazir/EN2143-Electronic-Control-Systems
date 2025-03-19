L = 0.062;
R = 2.5;
n = 20;
dur = 0.2;

kt = 0.026;                     %Nm/A
kb = 0.02;                      %V/rad.s-1

Jeq = 0.00004;                  %kg/m2
beq = 0.001;                    %Nm/rad.s-1

b2 = L*Jeq;
b1 = L*beq+R*Jeq;
b0 = R*beq+kb*kt;
a0 = kt/n;

Psys = tf([a0], [b2 b1 b0 0]);
subplot(211);
step(Psys, dur);
ylabel('Joint Position [rad]'); grid on;

Vsys = tf([a0], [b2 b1 b0]);
subplot(212);
step(Vsys, dur);
ylabel('Joint Speed [rad/s]'); grid on;
xlabel('Time [s]')


