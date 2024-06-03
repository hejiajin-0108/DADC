
clc;clear
%系统参数
a=2.5;b=1.5;h=1; 
eta=0.95;
d11=0.1;d12=0.1;d21=0.5;d22=0.7;
k1=0;k2=0;k3=0;k4=0;

% 拉普拉斯特征值
Lambda=-40:0.01:0;

%变量参数
m1=b*h-1-k1;
m2=-d11-d22;
m3=d11*d22-d12*d21;
m4=-b*h*d11-a*h*d12-k3*d21+d22+k1*d22;
m5=-b*h-k1*b*h-k3*a*h;
m6=a*h;
m7=d21;

P1=m1+m2.*Lambda;
P2=m3.*Lambda.^2+m4.*Lambda+m5;
P3=m6+m7.*Lambda;

Q1=2.*P1*cos(eta*pi/2);
Q2=P1.^2+2.*P2*cos(eta*pi);
Q3=2.*P1.*P2*cos(eta*pi/2);
Q4=P2.^2-P3.^2;

%各个假设
H1_1=m1;           %>0
H1_2=m5+m6;        %>0

H2=m3;             %>0

H3=m4+m7;          %<0
H4=4*m3*(m5+m6)-(m4+m7)^2;   %>0

H5=P2+P3;          %<0


%连续线
plot(Lambda,H5,'-','linewidth',3,'color',[255,193,127]/255);
hold on;




clc;clear
%系统参数
a=2.5;b=1.5;h=1; 
eta=0.95;
d11=0.1;d12=0.1;d21=0.5;d22=0.7;
k1=0;k2=0;k3=0;k4=0;

% 拉普拉斯特征值
load A.mat
L=A-diag(sum(A));
Lambda=eig(L);

%变量参数
m1=b*h-1-k1;
m2=-d11-d22;
m3=d11*d22-d12*d21;
m4=-b*h*d11-a*h*d12-k3*d21+d22+k1*d22;
m5=-b*h-k1*b*h-k3*a*h;
m6=a*h;
m7=d21;

P1=m1+m2.*Lambda;
P2=m3.*Lambda.^2+m4.*Lambda+m5;
P3=m6+m7.*Lambda;

Q1=2.*P1*cos(eta*pi/2);
Q2=P1.^2+2.*P2*cos(eta*pi);
Q3=2.*P1.*P2*cos(eta*pi/2);
Q4=P2.^2-P3.^2;


%各个假设
H1_1=m1;           %>0
H1_2=m5+m6;        %>0

H2=m3;             %>0

H3=m4+m7;          %<0
H4=4*m3*(m5+m6)-(m4+m7)^2;   %>0

H5=P2+P3;          %<0


%离散线
scatter(Lambda,H5,200,[86,160,251]/255,marker='.');
hold on



%辅助线
plot([-40,0],[0,0],'-','linewidth',2,'color','k');
hold on

axis([-40 0 -10 5])

legend('Continuum','Network','Interpreter','latex','fontsize',14);
xlabel('$\Lambda_\alpha$','Interpreter','latex');
ylabel('$P_2({\Lambda _{\alpha}})+P_3({\Lambda _{\alpha}})$','Interpreter','latex');
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
box on
grid minor




