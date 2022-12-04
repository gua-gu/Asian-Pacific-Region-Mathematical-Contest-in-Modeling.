load topo topo topomap1    % load data 
whos('topo','topomap1')
x = 0:359;                                % longitude
y = -89:90;                               % latitude

figure
contour(x,y,topo,[0 0])

axis equal                                % set axis units to be the same size
box on                                    % display bounding box

ax = gca;                                 % get current axis               
ax.XLim = [0 360];                        % set x limits
ax.YLim = [-90 90];                       % set y limits
ax.XTick = [0 60 120 180 240 300 360];    % define x ticks
ax.YTick = [-90 -60 -30 0 30 60 90];  

image([0 360],[-90 90], flip(topo), 'CDataMapping', 'scaled')
colormap(topomap1)

axis equal                                % set axis units to be the same size

ax = gca;                                 % get current axis               
ax.XLim = [0 360];                        % set x limits
ax.YLim = [-90 90];                       % set y limits
ax.XTick = [0 60 120 180 240 300 360];    % define x ticks
ax.YTick = [-90 -60 -30 0 30 60 90];      % define y ticks