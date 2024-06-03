
clc;clear
%系统参数
a=2.5;b=1.5;h=1; 
eta=0.95;
d11=0.1;d12=0.1;d21=0.5;d22=0.7;
k1=-0.6;k2=0.1;k3=0.2;k4=0.1;

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

H6_1=Q1;           %>0
H6_2=Q2;           %>0
H6_3=Q3;          %>0
H6_4=Q4;           %>0
H7=Q4;             %<0


%计算临界频率
syms x
for i=1:85
z(1:2,i)=double(solve(x^2+P1(i)*x+P2(i)+P3(i)==0,x));
end
zarg1=angle(z);
zarg=abs(zarg1);

%离散线
scatter(Lambda,zarg,70,[0.47,0.67,0.19],'d','linewidth',1);
hold on


clc;clear
%系统参数
a=2.5;b=1.5;h=1; 
eta=0.95;
d11=0.1;d12=0.1;d21=0.5;d22=0.7;
k1=-0.6;k2=0.1;k3=0;k4=0.1;

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

H6_1=Q1;           %>0
H6_2=Q2;           %>0
H6_3=Q3;          %>0
H6_4=Q4;           %>0
H7=Q4;             %<0


%计算临界频率
syms x
for i=1:85
z(1:2,i)=double(solve(x^2+P1(i)*x+P2(i)+P3(i)==0,x));
end
zarg1=angle(z);
zarg=abs(zarg1);

%离散线
scatter(Lambda,zarg,30,[0.00,0.45,0.74],'o','linewidth',1);
hold on



clc;clear
%系统参数
a=2.5;b=1.5;h=1; 
eta=0.95;
d11=0.1;d12=0.1;d21=0.5;d22=0.7;
k1=-0.6;k2=0.1;k3=-0.2;k4=0.1;

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

H6_1=Q1;           %>0
H6_2=Q2;           %>0
H6_3=Q3;          %>0
H6_4=Q4;           %>0
H7=Q4;             %<0


%计算临界频率
syms x
for i=1:85
z(1:2,i)=double(solve(x^2+P1(i)*x+P2(i)+P3(i)==0,x));
end
zarg1=angle(z);
zarg=abs(zarg1);

%离散线
scatter(Lambda,zarg,40,[0.85,0.33,0.10],'x','linewidth',1);
hold on


plot([-40 0],[eta*pi/2 eta*pi/2],'-','linewidth',1.5,'color','k');
hold on;


% text(-9,1.7,'$|arg(\lambda_{\alpha})|=\frac{\eta \pi}{2}$','Interpreter','latex','FontSize',16);

axis([-40 0 -2 5])
xlabel('$\Lambda_{\alpha}$','Interpreter','latex');
ylabel('$|arg(\lambda_{\alpha})|$','Interpreter','latex');
legend('$k_3=0.2$','','$k_3=0$','','$k_3=-0.2$','Interpreter','latex','fontsize',14);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
box on
grid minor







