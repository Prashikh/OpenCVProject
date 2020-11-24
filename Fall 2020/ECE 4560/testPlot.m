addpath '/Users/Prashikh/Desktop/Fall 2020/ECE 4560/Homework/rvctools'
startup_rvc

% Plotting the contour
x = linspace(-6,6,1000);
y = linspace(-3,3,1000);
[X,Y] = meshgrid(x,y);
Z = (X+2).^2+(Y).^2;
contour(X,Y,Z,250)
colorbar
grid on
hold on
r0 = [-2,1]';
r1 = [3,1]';
plot(r1(1),r1(2),'o', 'MarkerFaceColor', 'b');
% Creating robot 2
r2 = [4,1]';
plot(r2(1),r2(2),'o', 'MarkerFaceColor', 'r');
% 
%w = r1 - r2/ abs(r1-r2)
w = (r1-r2)/norm(r1-r2);
%v = Rw
v = [0,-1;1,0]*w;
% 
%u = k1*z(ri)*v
k1 = 0.05;
while((all(r1~=r0)) && all((r2~=r0)))
    speed1 = (norm(r1-r0)).^2;
    u1 = k1 * speed1 *v;
    speed2 = (norm(r2-r0)).^2;
    u2 = k1 * speed2 *v;
    % u2 = k1 * ((abs(r1-r0)).^2) *v;
    plot(u1(1),u1(2),'o', 'MarkerFaceColor', 'b');
    plot(u2(1),u2(2),'o', 'MarkerFaceColor', 'r');
    r1 = r1+u1;
    r2 = r2+u2;
end
