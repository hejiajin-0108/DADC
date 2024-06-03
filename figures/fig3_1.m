clc;clear;
v1 = [-2 -2;0.5 -2;0.5 0.1;-2 1.6];
f1 = [1 2 3 4];
patch('Faces',f1,'Vertices',v1,'FaceColor',[86,160,251]/255);
hold on

k1=-2:0.00001:0.5;
plot(k1,0.4-0.6*k1,'-','linewidth',2,'color',[71,55,63]/255)
hold on
plot([0.5 0.5],[-2 0.1],'-','linewidth',2,'color',[71,55,63]/255)
hold on



% text(0.55,0.2,'(0.5, 0.1)','FontSize',12);
% text(-1.95,1.75,'(-2, 1.6)','FontSize',12);
% text(0.55,-1.8,'(0.5, -2)','FontSize',12);
scatter(0.5,0.1,200,'.','k')
text(0.52,0.25,'$(0.5,0.1)$','Interpreter','latex','FontSize',13);

text(0.53,-1.7,'$L_1$','Interpreter','latex','FontSize',15);
text(-1.8,1.6,'$L_2$','Interpreter','latex','FontSize',15);

% scatter(0.5,0.1,300,'.','k')
% scatter(-2,1.6,300,'.','k')
% scatter(0.5,-2,300,'.','k')
% hold on 
axis([-2 1 -2 2])
xlabel('$k_1$','Interpreter','latex')
ylabel('$k_3$','Interpreter','latex')
legend(' Stable range','Interpreter','latex','fontsize',14);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
box on
grid minor






