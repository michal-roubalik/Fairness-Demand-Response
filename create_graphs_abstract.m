function create_graphs_abstract(resultsFDR, config)
%
%
%
%%
fig = figure(1);
subplot(1,2,1)
hold on
title ('Gen 1 ON(k)')
y_pi_minus_mean = mean(resultsFDR.pi_minus.X1_sum,1);
y_pi_minus_std = std(resultsFDR.pi_minus.X1_sum,0,1);
fill([1:length(y_pi_minus_mean),length(y_pi_minus_mean):-1:1],[y_pi_minus_mean+y_pi_minus_std,y_pi_minus_mean(end:-1:1)-y_pi_minus_std(end:-1:1)],[0.8 1 0.5]);
%plot(1:length(y_pi_minus_mean),y_pi_minus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_pi_minus_mean),y_pi_minus_mean+y_pi_minus_std,'LineWidth', 1,'Color',[0.8 1 0.5]);
plot(1:length(y_pi_minus_mean),y_pi_minus_mean-y_pi_minus_std,'LineWidth', 1,'Color',[0.8 1 0.5]);
 
y_pi_plus_mean = mean(resultsFDR.pi_plus.X1_sum,1);
y_pi_plus_std = std(resultsFDR.pi_plus.X1_sum,0,1);
fill([1:length(y_pi_plus_mean),length(y_pi_plus_mean):-1:1],[y_pi_plus_mean+y_pi_plus_std,y_pi_plus_mean(end:-1:1)-y_pi_plus_std(end:-1:1)],[0.8 1 0.5]);
%plot(1:length(y_pi_plus_mean),y_pi_plus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_pi_plus_mean),y_pi_plus_mean+y_pi_plus_std,'LineWidth', 2,'Color',[0.8 1 0.5]);
plot(1:length(y_pi_plus_mean),y_pi_plus_mean-y_pi_plus_std,'LineWidth', 2,'Color',[0.8 1 0.5]);
plot(1:length(y_pi_minus_mean),y_pi_minus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_pi_plus_mean),y_pi_plus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
 
 
box on
xlabel('k');ylabel('P(k)');
%axis([0 400 0 10])
title('PI controller')
subplot(1,2,2)
hold on
 
y_lag_minus_mean = mean(resultsFDR.lag_minus.X1_sum,1);
y_lag_minus_std = std(resultsFDR.lag_minus.X1_sum,0,1);
fill([1:length(y_lag_minus_mean),length(y_lag_minus_mean):-1:1],[y_lag_minus_mean+y_lag_minus_std,y_lag_minus_mean(end:-1:1)-y_lag_minus_std(end:-1:1)],[1 0.4 1]);
%plot(1:length(y_lag_minus_mean),y_lag_minus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_lag_minus_mean),y_lag_minus_mean+y_lag_minus_std,'LineWidth', 1,'Color',[1 0.4 1]);
plot(1:length(y_lag_minus_mean),y_lag_minus_mean-y_lag_minus_std,'LineWidth', 1,'Color',[1 0.4 1]);
 
y_lag_plus_mean = mean(resultsFDR.lag_plus.X1_sum,1);
y_lag_plus_std = std(resultsFDR.lag_plus.X1_sum,0,1);
fill([1:length(y_lag_plus_mean),length(y_lag_plus_mean):-1:1],[y_lag_plus_mean+y_lag_plus_std,y_lag_plus_mean(end:-1:1)-y_lag_plus_std(end:-1:1)],[1 0.4 1]);
%plot(1:length(y_lag_plus_mean),y_lag_plus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_lag_plus_mean),y_lag_plus_mean+y_lag_plus_std,'LineWidth', 2,'Color',[1 0.4 1]);
plot(1:length(y_lag_plus_mean),y_lag_plus_mean-y_lag_plus_std,'LineWidth', 2,'Color',[1 0.4 1]);
plot(1:length(y_lag_minus_mean),y_lag_minus_mean, 'LineWidth', 2, 'Color', [1 0 1]);
plot(1:length(y_lag_plus_mean),y_lag_plus_mean, 'LineWidth', 2, 'Color', [1 0 1]);
box on
xlabel('k');ylabel('P(k)');
%axis([0 400 0 10])
title('Lag controller')
hold on
 
saveas(fig,['01_GEN_1_ON', config.name, '.png']);
close(fig);
%%
fig = figure(2);
subplot(1,2,1)
hold on
title ('Gen 2 ON(k)')
y_pi_minus_mean = mean(resultsFDR.pi_minus.X2_sum,1);
y_pi_minus_std = std(resultsFDR.pi_minus.X2_sum,0,1);
fill([1:length(y_pi_minus_mean),length(y_pi_minus_mean):-1:1],[y_pi_minus_mean+y_pi_minus_std,y_pi_minus_mean(end:-1:1)-y_pi_minus_std(end:-1:1)],[0.8 1 0.5]);
%plot(1:length(y_pi_minus_mean),y_pi_minus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_pi_minus_mean),y_pi_minus_mean+y_pi_minus_std,'LineWidth', 1,'Color',[0.8 1 0.5]);
plot(1:length(y_pi_minus_mean),y_pi_minus_mean-y_pi_minus_std,'LineWidth', 1,'Color',[0.8 1 0.5]);
 
y_pi_plus_mean = mean(resultsFDR.pi_plus.X2_sum,1);
y_pi_plus_std = std(resultsFDR.pi_plus.X2_sum,0,1);
fill([1:length(y_pi_plus_mean),length(y_pi_plus_mean):-1:1],[y_pi_plus_mean+y_pi_plus_std,y_pi_plus_mean(end:-1:1)-y_pi_plus_std(end:-1:1)],[0.8 1 0.5]);
%plot(1:length(y_pi_plus_mean),y_pi_plus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_pi_plus_mean),y_pi_plus_mean+y_pi_plus_std,'LineWidth', 2,'Color',[0.8 1 0.5]);
plot(1:length(y_pi_plus_mean),y_pi_plus_mean-y_pi_plus_std,'LineWidth', 2,'Color',[0.8 1 0.5]);
plot(1:length(y_pi_minus_mean),y_pi_minus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_pi_plus_mean),y_pi_plus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
 
 
box on
xlabel('k');ylabel('P(k)');
%axis([0 400 0 10])
title('PI controller')
subplot(1,2,2)
hold on
 
y_lag_minus_mean = mean(resultsFDR.lag_minus.X2_sum,1);
y_lag_minus_std = std(resultsFDR.lag_minus.X2_sum,0,1);
fill([1:length(y_lag_minus_mean),length(y_lag_minus_mean):-1:1],[y_lag_minus_mean+y_lag_minus_std,y_lag_minus_mean(end:-1:1)-y_lag_minus_std(end:-1:1)],[1 0.4 1]);
%plot(1:length(y_lag_minus_mean),y_lag_minus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_lag_minus_mean),y_lag_minus_mean+y_lag_minus_std,'LineWidth', 1,'Color',[1 0.4 1]);
plot(1:length(y_lag_minus_mean),y_lag_minus_mean-y_lag_minus_std,'LineWidth', 1,'Color',[1 0.4 1]);
 
y_lag_plus_mean = mean(resultsFDR.lag_plus.X2_sum,1);
y_lag_plus_std = std(resultsFDR.lag_plus.X2_sum,0,1);
fill([1:length(y_lag_plus_mean),length(y_lag_plus_mean):-1:1],[y_lag_plus_mean+y_lag_plus_std,y_lag_plus_mean(end:-1:1)-y_lag_plus_std(end:-1:1)],[1 0.4 1]);
%plot(1:length(y_lag_plus_mean),y_lag_plus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_lag_plus_mean),y_lag_plus_mean+y_lag_plus_std,'LineWidth', 2,'Color',[1 0.4 1]);
plot(1:length(y_lag_plus_mean),y_lag_plus_mean-y_lag_plus_std,'LineWidth', 2,'Color',[1 0.4 1]);
plot(1:length(y_lag_minus_mean),y_lag_minus_mean, 'LineWidth', 2, 'Color', [1 0 1]);
plot(1:length(y_lag_plus_mean),y_lag_plus_mean, 'LineWidth', 2, 'Color', [1 0 1]);
box on
xlabel('k');ylabel('P(k)');
%axis([0 400 0 10])
title('Lag controller')
hold on
saveas(fig,['02_GEN_2_ON', config.name, '.png']);
close(fig);
 
%%
fig = figure(3);
subplot(1,2,1)
hold on
title ('PI (k)')
y_pi_minus_mean = mean(resultsFDR.pi_minus.pi,1);
y_pi_minus_std = std(resultsFDR.pi_minus.pi,0,1);
fill([1:length(y_pi_minus_mean),length(y_pi_minus_mean):-1:1],[y_pi_minus_mean+y_pi_minus_std,y_pi_minus_mean(end:-1:1)-y_pi_minus_std(end:-1:1)],[0.8 1 0.5]);
%plot(1:length(y_pi_minus_mean),y_pi_minus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_pi_minus_mean),y_pi_minus_mean+y_pi_minus_std,'LineWidth', 1,'Color',[0.8 1 0.5]);
plot(1:length(y_pi_minus_mean),y_pi_minus_mean-y_pi_minus_std,'LineWidth', 1,'Color',[0.8 1 0.5]);
 
y_pi_plus_mean = mean(resultsFDR.pi_plus.pi,1);
y_pi_plus_std = std(resultsFDR.pi_plus.pi,0,1);
fill([1:length(y_pi_plus_mean),length(y_pi_plus_mean):-1:1],[y_pi_plus_mean+y_pi_plus_std,y_pi_plus_mean(end:-1:1)-y_pi_plus_std(end:-1:1)],[0.8 1 0.5]);
%plot(1:length(y_pi_plus_mean),y_pi_plus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_pi_plus_mean),y_pi_plus_mean+y_pi_plus_std,'LineWidth', 2,'Color',[0.8 1 0.5]);
plot(1:length(y_pi_plus_mean),y_pi_plus_mean-y_pi_plus_std,'LineWidth', 2,'Color',[0.8 1 0.5]);
plot(1:length(y_pi_minus_mean),y_pi_minus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_pi_plus_mean),y_pi_plus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
 
 
box on
xlabel('k');ylabel('\pi(k)');
%axis([0 400 0 10])
title('PI controller')
subplot(1,2,2)
hold on
 
y_lag_minus_mean = mean(resultsFDR.lag_minus.pi,1);
y_lag_minus_std = std(resultsFDR.lag_minus.pi,0,1);
fill([1:length(y_lag_minus_mean),length(y_lag_minus_mean):-1:1],[y_lag_minus_mean+y_lag_minus_std,y_lag_minus_mean(end:-1:1)-y_lag_minus_std(end:-1:1)],[1 0.4 1]);
%plot(1:length(y_lag_minus_mean),y_lag_minus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_lag_minus_mean),y_lag_minus_mean+y_lag_minus_std,'LineWidth', 1,'Color',[1 0.4 1]);
plot(1:length(y_lag_minus_mean),y_lag_minus_mean-y_lag_minus_std,'LineWidth', 1,'Color',[1 0.4 1]);
 
y_lag_plus_mean = mean(resultsFDR.lag_plus.pi,1);
y_lag_plus_std = std(resultsFDR.lag_plus.pi,0,1);
fill([1:length(y_lag_plus_mean),length(y_lag_plus_mean):-1:1],[y_lag_plus_mean+y_lag_plus_std,y_lag_plus_mean(end:-1:1)-y_lag_plus_std(end:-1:1)],[1 0.4 1]);
%plot(1:length(y_lag_plus_mean),y_lag_plus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_lag_plus_mean),y_lag_plus_mean+y_lag_plus_std,'LineWidth', 2,'Color',[1 0.4 1]);
plot(1:length(y_lag_plus_mean),y_lag_plus_mean-y_lag_plus_std,'LineWidth', 2,'Color',[1 0.4 1]);
plot(1:length(y_lag_minus_mean),y_lag_minus_mean, 'LineWidth', 2, 'Color', [1 0 1]);
plot(1:length(y_lag_plus_mean),y_lag_plus_mean, 'LineWidth', 2, 'Color', [1 0 1]);
box on
xlabel('k');ylabel('\pi(k)');
%axis([0 400 0 10])
title('Lag controller')
hold on
saveas(fig,['03_PI', config.name, '.png']);
close(fig);
 
%%
fig = figure(4);
subplot(1,2,1)
hold on
title ('X_C (k)')
y_pi_minus_mean = mean(resultsFDR.pi_minus.xc,1);
y_pi_minus_std = std(resultsFDR.pi_minus.xc,0,1);
fill([1:length(y_pi_minus_mean),length(y_pi_minus_mean):-1:1],[y_pi_minus_mean+y_pi_minus_std,y_pi_minus_mean(end:-1:1)-y_pi_minus_std(end:-1:1)],[0.8 1 0.5]);
%plot(1:length(y_pi_minus_mean),y_pi_minus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_pi_minus_mean),y_pi_minus_mean+y_pi_minus_std,'LineWidth', 1,'Color',[0.8 1 0.5]);
plot(1:length(y_pi_minus_mean),y_pi_minus_mean-y_pi_minus_std,'LineWidth', 1,'Color',[0.8 1 0.5]);
 
y_pi_plus_mean = mean(resultsFDR.pi_plus.xc,1);
y_pi_plus_std = std(resultsFDR.pi_plus.xc,0,1);
fill([1:length(y_pi_plus_mean),length(y_pi_plus_mean):-1:1],[y_pi_plus_mean+y_pi_plus_std,y_pi_plus_mean(end:-1:1)-y_pi_plus_std(end:-1:1)],[0.8 1 0.5]);
%plot(1:length(y_pi_plus_mean),y_pi_plus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_pi_plus_mean),y_pi_plus_mean+y_pi_plus_std,'LineWidth', 2,'Color',[0.8 1 0.5]);
plot(1:length(y_pi_plus_mean),y_pi_plus_mean-y_pi_plus_std,'LineWidth', 2,'Color',[0.8 1 0.5]);
plot(1:length(y_pi_minus_mean),y_pi_minus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_pi_plus_mean),y_pi_plus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
 
 
box on
xlabel('k');ylabel('x_c(k)');
%axis([0 400 0 10])
title('PI controller')
subplot(1,2,2)
hold on
 
y_lag_minus_mean = mean(resultsFDR.lag_minus.xc,1);
y_lag_minus_std = std(resultsFDR.lag_minus.xc,0,1);
fill([1:length(y_lag_minus_mean),length(y_lag_minus_mean):-1:1],[y_lag_minus_mean+y_lag_minus_std,y_lag_minus_mean(end:-1:1)-y_lag_minus_std(end:-1:1)],[1 0.4 1]);
%plot(1:length(y_lag_minus_mean),y_lag_minus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_lag_minus_mean),y_lag_minus_mean+y_lag_minus_std,'LineWidth', 1,'Color',[1 0.4 1]);
plot(1:length(y_lag_minus_mean),y_lag_minus_mean-y_lag_minus_std,'LineWidth', 1,'Color',[1 0.4 1]);
 
y_lag_plus_mean = mean(resultsFDR.lag_plus.xc,1);
y_lag_plus_std = std(resultsFDR.lag_plus.xc,0,1);
fill([1:length(y_lag_plus_mean),length(y_lag_plus_mean):-1:1],[y_lag_plus_mean+y_lag_plus_std,y_lag_plus_mean(end:-1:1)-y_lag_plus_std(end:-1:1)],[1 0.4 1]);
%plot(1:length(y_lag_plus_mean),y_lag_plus_mean, 'LineWidth', 2, 'Color', [0 1 0]);
plot(1:length(y_lag_plus_mean),y_lag_plus_mean+y_lag_plus_std,'LineWidth', 2,'Color',[1 0.4 1]);
plot(1:length(y_lag_plus_mean),y_lag_plus_mean-y_lag_plus_std,'LineWidth', 2,'Color',[1 0.4 1]);
plot(1:length(y_lag_minus_mean),y_lag_minus_mean, 'LineWidth', 2, 'Color', [1 0 1]);
plot(1:length(y_lag_plus_mean),y_lag_plus_mean, 'LineWidth', 2, 'Color', [1 0 1]);
box on
xlabel('k');ylabel('x_c(k)');
%axis([0 400 0 10])
title('Lag controller')
hold on
saveas(fig,['04_XC', config.name, '.png']);
close(fig);
 
 
 
 
end
