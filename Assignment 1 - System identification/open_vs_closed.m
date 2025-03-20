figure;
tf1_pid = feedback(C*tf1, 1);
step(tf1_pid, 'b', tf1, 'r', 8);            % Blue for Closed-Loop, Red for Open-Loop
legend('Closed-Loop', 'Open-Loop');
title('Open-Loop Vs Closed-Loop response');
grid on;