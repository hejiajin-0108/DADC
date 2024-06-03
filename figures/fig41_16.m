clc;clear
%系统参数
for n=1:11
 for p=1:11
eta=0.95;
a=2.5;b=1.5;h=1; 
d11=0.1;d12=0.1;d21=0.2;d22=0.5;
k1=-1+(n-1)*0.1;k2=0.1;k3=-1+(p-1)*0.1;k4=0.1;

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
H6_3=Q3;           %>0
H6_4=Q4;           %>0
H7=Q4;             %<0

syms x
for i=1:85
z(i,1:4)=double(solve(x^4+Q1(i)*x^3+Q2(i)*x^2+Q3(i)*x+Q4(i)==0,x));
end


for i=1:85
    for j=1:4
    if imag(z(i,j))==0 && real(z(i,j))>0
       z1(i)=real(z(i,j));
    end
    end
end

w=z1.^(1/eta);

w=w';


% tau_01=(1./w).*(pi-acos((cos(eta*pi).*w.^(2*eta)+P1.*cos(eta*pi/2).*w.^(eta)+P2)./P3));

tau_01=(1./w).*acos((cos(eta*pi).*w.^(2*eta)+P1.*cos(eta*pi/2).*w.^(eta)+P2)./(-P3));
tau_0(n,p)=min(tau_01);
 end
end

surf(-1:0.1:0,-1:0.1:0,tau_0);

shading interp
xlabel('$k_1$','Interpreter','latex');
ylabel('$k_3$','Interpreter','latex');
zlabel('$\tau_0$','Interpreter','latex');
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
box on
grid minor


