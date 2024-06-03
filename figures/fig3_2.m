%基于CriticalCondition


clc;clear

v1 = [-2 -2;0.5 -2;0.5 0.1;-2 1.6];
f1 = [1 2 3 4];
patch('Faces',f1,'Vertices',v1,'FaceColor',[86,160,251]/255);
hold on


syms k1 k3
%系统参数
a=2.5;b=1.5;h=1; 
rho=7;sigma=0;
d11=0.1;d12=0;
d21=d12*sigma;d22=d11*rho;

%变量参数
m1=b*h-1-k1;
m2=-d11-d22;
m3=d11*d22-d12*d21;
m4=-b*h*d11-a*h*d12-k3*d21+d22+k1*d22;
m5=-b*h-k1*b*h-k3*a*h;
m6=a*h;
m7=d21;

k3=solve(4*m3*(m5+m6)-(m4+m7)^2==0,k3);
k3_0=double(subs(k3,k1,-2:0.01:0.5));

h=double(subs(0.4-0.6*k1,k1,-2:0.01:0.5));

fill([-2:0.01:0.5 fliplr(-2:0.01:0.5)],[-2*ones(1,251) fliplr(k3_0)],[255 193 127]/255);

plot(-2:0.01:0.5,h,'-','linewidth',2,'color',[71,55,63]/255)
hold on
plot(-2:0.01:0.5,k3_0,'-','linewidth',2,'color',[71,55,63]/255)
hold on
plot([0.5 0.5],[0.1 -2],'-','linewidth',2,'color',[71,55,63]/255)
hold on


text(0.54,-1.7,'$L_1$','Interpreter','latex','FontSize',15);
text(-1.9,1.65,'$L_2$','Interpreter','latex','FontSize',15);
text(-1.9,0.93,'$L_3$','Interpreter','latex','FontSize',15);



scatter(-7/10,41/50,200,'.','k');
%text(-0.665,1,'$(-\frac{11}{14},\frac{61}{70})$','Interpreter','latex','FontSize',14);
text(-1.4,0.67,'$(-0.79,0.87)$','Interpreter','latex','FontSize',13);

scatter(0.5,-1.06,200,'.','k');
%text(-0.665,1,'$(-\frac{11}{14},\frac{61}{70})$','Interpreter','latex','FontSize',14);
text(-0.16,-1.17,'$(0.5,-1.06)$','Interpreter','latex','FontSize',13);


axis([-2 1 -2 2])
xlabel('$k_1$','Interpreter','latex')
ylabel('$k_3$','Interpreter','latex')
legend('Stable range','Turing instability range','Interpreter','latex','fontsize',14);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
box on
grid minor


% %%%%%% 求三个点
% solve(- (17*k1)/10 - (7*k1^2)/10 - 9/280,k1)
% subs(- (17*k1)/10 - (7*k1^2)/10 - 9/280,k1,-2)
% subs(- (17*k1)/10 - (7*k1^2)/10 - 9/280,k1,0.5)
% solve(- (17*k1)/10 - (7*k1^2)/10 - 9/280==0.4-0.6*k1,k1)
% subs(- (17*k1)/10 - (7*k1^2)/10 - 9/280,k1,-11/14)
% k1=-11/14;k3=61/70;
% k1=0.5;k3=-37/35;
% k1=-2;k3=159/280;
% %%%%%%

