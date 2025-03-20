clc; close all; clear; 

s = tf('s'); 
G = (s + 1.5) / (2*s^3 + 3*s^2 + 5*s + 2);  % My transfer Function for data generation               
dt = 0.001;                             % Sampling Interval
t = 0:dt:8; 
u = ones(length(t),1); 
u(1:1/dt)=0;                            % this sets the first 10 samples to zero 
y = lsim(G,u,t);                        % this generates the plant response for input u 
y = y + rand(length(t),1)*0.02;         % add random noise to the response 
plot(t,[u,y]); axis([0 8 0 1.2]); 