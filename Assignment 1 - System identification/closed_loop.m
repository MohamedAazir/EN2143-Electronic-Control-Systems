figure;
tf1_pid = feedback(C*tf1, 1);
step(tf1_pid, 'b', 8);                          % Estimated model with PID
title('Closed-Loop Response');
grid on;