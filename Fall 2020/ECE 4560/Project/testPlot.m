addpath '/Users/Prashikh/Desktop/Fall 2020/ECE 4560/Homework/rvctools'
clear all 
close all
clc
startup_rvc

% Plotting the contour
x = linspace(-6,6,1000);
y = linspace(-3,3,1000);
dt = 0.1;

[X,Y] = meshgrid(x,y);
Z = (X+2).^2+(Y).^2;
contour(X,Y,Z,250)
colorbar
grid on
hold on
r0 = [-2,0]';
r1 = [3,1]';
plot(r1(1),r1(2),'o', 'MarkerFaceColor', 'b');
% Creating robot 2
r2 = [4,1]';
plot(r2(1),r2(2),'o', 'MarkerFaceColor', 'r');

k1 = 0.05;
speed1 = (norm(r1-r0)).^2;
speed2 = (norm(r2-r0)).^2;
while((speed1+speed2)/2 >= 0.28) 
    %w = r1 - r2/ abs(r1-r2)
    w = (r1-r2)/norm(r1-r2);
    %v = Rw
    v = [0,-1;1,0]*w;
    
    speed1 = (norm(r1-r0)).^2;
    u1 = k1 * speed1 *v;
    
    speed2 = (norm(r2-r0)).^2;
    u2 = k1 * speed2 *v;
    
    plot(r1(1),r1(2),'o', 'MarkerFaceColor', 'b');
    hold on
    plot(r2(1),r2(2),'o', 'MarkerFaceColor', 'r');
    hold on
    r1 = r1+u1*dt;
    r2 = r2+u2*dt;
end
