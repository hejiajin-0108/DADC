clc
clear



v1 = [0 0; 0 20;2 20;2 2*6.66];
f1 = [1 2 3 4];

patch('Faces',f1,'Vertices',v1,'FaceColor',[86 160 251]/256,'FaceAlpha',0.1);

pa(1)=patch('Faces',f1,'Vertices',v1,'FaceColor','w','FaceAlpha',0);
hatchfill2(pa(1),'single','HatchAngle',60,'HatchDensity',41,'HatchColor',[86 160 251]/256,'HatchLineWidth',2);
hold on

v2 = [0 0; 0 20; 2 20; 2 2*8.32];
f2 = [1 2 3 4];
pa(2)=patch('Faces',f2,'Vertices',v2,'FaceColor','w','FaceAlpha',0);
hatchfill2(pa(2),'single','HatchAngle',90,'HatchDensity',40,'HatchColor',[255 193 127]/256,'HatchLineWidth',2);
hold on

plot([0 1.5],[0 1.5*6.66],'k','linewidth',2);
hold on
plot([0 1.5],[0 1.5*8.32],'k','linewidth',2);
hold on


%txt = 'Turing instability';
%text(0.2,11,txt,'Interpreter','latex','FontSize',20);

[~,legend_pa,~,~] = legendflex(pa,{'Uncontrolled Turing instability','Controlled Turing instability'});
hatchfill2((legend_pa(length(pa)+1)),'single','HatchAngle',60,'HatchDensity',10,'HatchColor',[86 160 251]/256,'HatchLineWidth',2);
hatchfill2((legend_pa(length(pa)+2)),'single','HatchAngle',90,'HatchDensity',20,'HatchColor',[255 193 127]/256,'HatchLineWidth',2);
% legend('Uncontrolled','Controlled','Interpreter','latex','fontsize',13);
xlabel('$d_{1}$','Interpreter','latex');
ylabel('$\rho$','Interpreter','latex');
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
axis([0 1.5 0 20])
box on
