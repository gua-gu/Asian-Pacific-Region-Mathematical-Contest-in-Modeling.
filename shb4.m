% 函数shang.m, 实现用熵值法求各指标(列）的权重及各数据行的得分
% x为原始数据矩阵, 一行代表一个国家, 每列对应一个指标
% s返回各行得分, w返回各列权重

% 塞罕坝，蒙古北， au， 印尼， 马来，朝鲜，韩国，jp，nz， 蒙南；
x = [
    
    525,7.088,25,-2.9,0.08;
    470,15.388,155,11,0.2;
    2500,.819,0.01,26,0.509;
    3000,8.13,0.01,28,0.734;
    1120,1.617,0.01,27/2,0.64;
    1500,10.12,0.01,15.3,0.67;
    1777.68,9.53,0.01,15.3,0.67;
    3464,7.686,0.01,25/2,0.29;
    25,7.088,25,-2.9,0.08
];

[n,m]=size(x); % n=23个国家, m=5个指标
%% 数据的归一化处理
% Matlab2010b,2011a,b版本都有bug,需如下处理. 其它版本直接用[X,ps]=mapminmax(x',0,1);即可

[X,ps]=mapminmax(x',0,1);
ps.ymin=0.002; % 归一化后的最小值
ps.ymax=0.996; % 归一化后的最大值
ps.yrange=ps.ymax-ps.ymin; % 归一化后的极差,若不调整该值, 则逆运算会出错
X=mapminmax(x',ps);
% mapminmax('reverse',xx,ps); % 反归一化, 回到原数据
X=X';  % X为归一化后的数据, 23行(国家), 5列(指标)
%% 计算第j个指标下，第i个记录占该指标的比重p(i,j)
for i=1:n
    for j=1:m
        p(i,j)=X(i,j)/sum(X(:,j));
    end
end
%% 计算第j个指标的熵值e(j)
k=1/log(n);
for j=1:m
    e(j)=-k*sum(p(:,j).*log(p(:,j)));
end
d=ones(1,m)-e;  % 计算信息熵冗余度
w=d./sum(d);    % 求权值w
s=w*p';         % 求综合得分[\code]
