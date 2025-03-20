figure;
step(G, 'b', tf1, 'r--', 8); % Blue for actual, Red dashed for estimated
legend('Actual Model', 'Estimated Model');
title('Step Response Comparison');
grid on;