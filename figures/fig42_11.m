clc;clear

for n=1:67
%系统参数
a=2.5;b=1.5;h=1; 
eta=0.95;
d11=0.1;d12=0;d21=0;d22=(n-1)*0.01;
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
tau_01=(1./w).*acos((cos(eta*pi).*w.^(2*eta)+P1.*cos(eta*pi/2).*w.^(eta)+P2)./(-P3));
h=15;
tau0(n,:)=tau_01(end-h+1:end);
end


dq=turbo(h);
for n=1:h
    plot(0:0.1:6.6,tau0(:,n),'-','linewidth',2,'color',dq(n,:));
    hold on;
end
colormap(turbo);
colorbar('FontSize',15,'Direction','reverse','TickLabelInterpreter','latex','TickLabels',{'$\alpha=15$','','','','','$\alpha=1$'})
text(3,0.05,'$\tau_0=0.26$','Interpreter','latex','fontsize',15,'color',[0.4796	0.01583	0.01055]);

axis([0 6.6 -0.2 3.5])
xlabel('$\rho$','Interpreter','latex');
ylabel('$\tau_{\alpha,l_0}^{(0)}$','Interpreter','latex');
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
grid minor
box on







