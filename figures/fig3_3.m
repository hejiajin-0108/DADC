%基于CriticalCondition

clc;clear

v1 = [-2 -2;0.5 -2;0.5 0.1;-2 1.6];
f1 = [1 2 3 4];
patch('Faces',f1,'Vertices',v1,'FaceColor',[86,160,251]/255);
hold on


syms k1 k3
%系统参数
a=2.5;b=1.5;h=1; 
rho=7;sigma=5;
d11=0.1;d12=0.1;
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
k3_0=double(subs(k3,k1,-2:0.01:-0.5));

h=double(subs(0.4-0.6*k1,k1,-2:0.01:0.5));

fill([-2:0.01:-0.5 fliplr(-2:0.01:-0.5)],[k3_0(1,:) fliplr(k3_0(2,:))],[255 193 127]/255);

plot(-2:0.01:0.5,h,'-','linewidth',2,'color',[71,55,63]/255)
hold on
plot(-2:0.01:-0.5,k3_0,'-','linewidth',2,'color',[71,55,63]/255)
hold on
plot(-2:0.01:-0.5,k3_0,'-','linewidth',2,'color',[71,55,63]/255)
hold on
plot([0.5 0.5],[0.1 -2],'-','linewidth',2,'color',[71,55,63]/255)
hold on



text(0.53,-1.72,'$L_1$','Interpreter','latex','FontSize',15);
text(-1.9,1.68,'$L_2$','Interpreter','latex','FontSize',15);
text(-1.9,0.3,'$L_3$','Interpreter','latex','FontSize',15);
text(-1.2,-1.72,'$L_4$','Interpreter','latex','FontSize',15);


scatter(-3/5,19/25,200,'.','k')

text(-0.55,0.9,'$(-0.6,0.76)$','Interpreter','latex','FontSize',14);


axis([-2 1 -2 2])
xlabel('$k_1$','Interpreter','latex')
ylabel('$k_3$','Interpreter','latex')
legend('Stable range','Turing instability range','Interpreter','latex','fontsize',14);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
box on
grid minor



% %%%%%% 求三个点
% solve((7*k1)/5 - 2*(- (2*k1)/5 - 1/5)^(1/2) + 6/5==-2,k1)
% subs((7*k1)/5 + 2*(- (2*k1)/5 - 1/5)^(1/2) + 6/5,k1,-2)
% solve((7*k1)/5 + 2*(- (2*k1)/5 - 1/5)^(1/2) + 6/5==0.4-0.6*k1,k1)
% subs((7*k1)/5 + 2*(- (2*k1)/5 - 1/5)^(1/2) + 6/5,k1,-3/5)
% k1=(10*39^(1/2))/49 - 132/49;k3=-2;
% k1=-3/5;k3=19/25;
% k1=-2;k3=(2*3^(1/2)*5^(1/2))/5 - 8/5;
% %%%%%%

