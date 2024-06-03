

clear;
clc;
dt=0.05;
for i=1:61
    h=0.05;N=3000;
    sigma0=1+(i-1)*dt;
    xs=g(sigma0,h,N);
    s(:,i)=xs(:,end);
end


text(2.18,-1.715,'$2.29$','Interpreter','latex','FontSize',18);
hold on

plot([2.29 2.29],[0.03 -1.5],'k--','linewidth',2)
hold on

scatter([1 1.05 1.1 1.15 1.2],[0 0 0 0 0],30,'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7])
hold on 
scatter(1.05:0.05:4.05,s,30,'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7])
hold on 

xlabel('$\sigma$','Interpreter','latex')
ylabel('$v_i$','Interpreter','latex')
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
axis([1 4 -1.5 1.5])
box on
grid minor


function x=g(sigma,h,N)
load A.mat %%%% 大脑网络连接矩阵 
tau=0;
alp=0.95;q1=alp;q2=alp;
rho=5;
d11=0.1;d12=0.1;
d21=d12*sigma;d22=d11*rho;

M=size(A,1);

L=A-diag(sum(A));
Lambda=eig(L);

tau1=fix(tau/h); 
tau2=fix(tau/h);
x0=(0.5*sin(linspace(0, 4*pi, M)))';
y0=(0.5*sin(linspace(0, 4*pi, M)))';
% x0=1*rand(M,1)-0.5;
% y0=1*rand(M,1)-0.5;
M1=zeros(M,1);M2=zeros(M,1);
N1=zeros(M,1);N2=zeros(M,1);
x=zeros(M,N+1);y=zeros(M,N+1);
x1=zeros(M,N+1);y1=zeros(M,N+1);
d1111=d11*L*x0;d1122=d12*L*y0;
d2211=d21*L*x0;d2222=d22*L*y0;
    if 1>tau1
        x00=x0;
    else
        x00=zeros(M,1);
    end
    if 1>tau2
        y00=y0;
    else
        y00=zeros(M,1);
    end 
[s1, s2]=f(x0,y0,x00,y00,d1111,d1122,d2211,d2222);
f1=s1;f2=s2;
x1(:,1)=x0+h^q1.*f1./(gamma(q1)*q1);
y1(:,1)=y0+h^q2.*f2./(gamma(q2)*q2);
  if 1>tau1
        x00=x1(:,1);
    else
        x00=zeros(M,1);
  end
  if 1>tau2
        y00=y1(:,1);
  else
        y00=zeros(M,1);
  end

d1111=d11*L*x1(:,1);d1122=d12*L*y1(:,1);
d2211=d21*L*x1(:,1);d2222=d22*L*y1(:,1);
[s1, s2]=f(x1(:,1),y1(:,1),x00,y00,d1111,d1122,d2211,d2222);
g1=s1;g2=s2;
x(:,1)=x0+h^q1*(g1+q1*f1)/(gamma(q1+2));
y(:,1)=y0+h^q2*(g2+q2*f2)/(gamma(q2+2));
for n=1:N  
M1=(n^(q1+1)-(n-q1)*(n+1)^q1)*f1;
M2=(n^(q2+1)-(n-q2)*(n+1)^q2)*f2;
N1=((n+1)^q1-n^q1)*f1;
N2=((n+1)^q2-n^q2)*f2;
for j=1:n
    if j>tau1
        x00=x(:,j-tau1);
    else
        x00=zeros(M,1);
    end
    if j>tau2
        y00=y(:,j-tau2);
    else
        y00=zeros(M,1);
    end
d1111=d11*L*x(:,j);d1122=d12*L*y(:,j);
d2211=d21*L*x(:,j);d2222=d22*L*y(:,j);
[s1, s2]=f(x(:,j),y(:,j),x00,y00,d1111,d1122,d2211,d2222);
t1=s1;t2=s2;
M1=M1+((n-j+2)^(q1+1)+(n-j)^(q1+1)-2*(n-j+1)^(q1+1))*t1;
M2=M2+((n-j+2)^(q2+1)+(n-j)^(q2+1)-2*(n-j+1)^(q2+1))*t2;
N1=N1+((n-j+1)^q1-(n-j)^q1)*t1;
N2=N2+((n-j+1)^q2-(n-j)^q2)*t2;  
end
x1(:,n+1)=x0+h^q1*N1/(gamma(q1)*q1);
y1(:,n+1)=y0+h^q2*N2/(gamma(q2)*q2);
    if n+1>tau1
        x00=x1(:,n+1-tau1);
    else
        x00=zeros(M,1);
    end
    if n+1>tau2
        y00=y1(:,n+1-tau2);
    else
        y00=zeros(M,1);
    end 
d1111=d11*L*x1(:,n+1);d1122=d12*L*y1(:,n+1);
d2211=d21*L*x1(:,n+1);d2222=d22*L*y1(:,n+1); 
[s1, s2]=f(x1(:,n+1),y1(:,n+1),x00,y00,d1111,d1122,d2211,d2222);  
r1=s1;r2=s2;
x(:,n+1)=x0+h^q1*(r1+M1)/gamma(q1+2);
y(:,n+1)=y0+h^q2*(r2+M2)/gamma(q2+2);
end
end

function [s1, s2]=f(u,v,ut,vt,d11,d12,d21,d22)
a=2.5;
b=1.5;
e=1; 

k1=0;k2=0;k3=0;k4=0;
     s1=(u-u.^3/3-vt)+d11+d12+k1.*u+k2.*u.^3+k3.*v+k4.*v.^3;
     s2=e*(a.*u-b.*v)+d21+d22;
end

