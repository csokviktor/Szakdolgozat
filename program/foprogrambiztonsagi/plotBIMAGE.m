function plotBIMAGE()

initialize();
global n1;
global n2;
global n3;
global w1;
global w2;
global w3;
global s1;
global s2;
global s3;
global e1;
global e2;
global e3;
N11=[-80, -80];
N12=[80, 600];
N21=[-40, -40];
N22=[80, 600];
N31=[0, 0];
N32=[80, 600];
N41=[40, 40];
N42=[80, 600];
N51=[80, 80];
N52=[80, 600];

W11=[-80, -600];
W12=[80,80];
W21=[-80, -600];
W22=[40,40];
W31=[-80, -600];
W32=[0,0];
W41=[-80, -600];
W42=[-40,-40];
W51=[-80, -600];
W52=[-80,-80];

S11=[-80, -80];
S12=[-80, -600];
S21=[-40, -40];
S22=[-80, -600];
S31=[0, 0];
S32=[-80, -600];
S41=[40, 40];
S42=[-80, -600];
S51=[80, 80];
S52=[-80, -600];

E11=[80, 600];
E12=[80,80];
E21=[80, 600];
E22=[40,40];
E31=[80, 600];
E32=[0, 0];
E41=[80, 600];
E42=[-40,-40];
E51=[80, 600];
E52=[-80,-80];

%roads
%north
plot(N11,N12,'k', 'linewidth', 1.5)
hold on
n1 = plot(N21,N22,'--k', 'linewidth', 1);
hold on
n2 = plot(N31,N32,'k', 'linewidth', 1);
hold on
n3 = plot(N41,N42,'--k', 'linewidth', 1);
hold on
plot(N51,N52,'k', 'linewidth', 1.5)
hold on

%west
plot(W11,W12,'k', 'linewidth', 1.5)
hold on
w1 = plot(W21,W22,'--k', 'linewidth', 1);
hold on
w2 = plot(W31,W32,'k', 'linewidth', 1);
hold on
w3 = plot(W41,W42,'--k', 'linewidth', 1);
hold on
plot(W51,W52,'k', 'linewidth', 1.5)
hold on

%south
plot(S11,S12,'k', 'linewidth', 1.5)
hold on
s1 = plot(S21,S22,'--k', 'linewidth', 1);
hold on
s2 = plot(S31,S32,'k', 'linewidth', 1);
hold on 
s3 = plot(S41,S42,'--k', 'linewidth', 1);
hold on
plot(S51,S52,'k', 'linewidth', 1.5)
hold on

%east
plot(E11,E12,'k', 'linewidth', 1.5)
hold on
e1 = plot(E21,E22,'--k', 'linewidth', 1);
hold on
e2 = plot(E31,E32,'k', 'linewidth', 1);
hold on
e3 = plot(E41,E42,'--k', 'linewidth', 1);
hold on
plot(E51,E52,'k', 'linewidth', 1.5)
hold on

%lampak kirajzolasa
global light;
global lightpos;
light = cell(1,12);
for i = 1:12
    light{i} = cell(1,5);  %1:kozep, 2:bal, 3:felso, 4:jobb, 5:allapot
end

lightpos = cell(1,12);
for i = 1:12
    lightpos{i} = cell(1,4);
end

lightpos{1}{1} = [-60 70]; %N1 kozep
lightpos{1}{2} = [-50 70]; %N1 bal
lightpos{1}{3} = [-60 60]; %N1 felso
lightpos{1}{4} = [-70 70]; %N1 jobb

lightpos{2}{1} = [-20 70]; %N2 kozep
lightpos{2}{2} = [-10 70]; %N2 bal
lightpos{2}{3} = [-20 60]; %N2 felso
lightpos{2}{4} = [-30 70]; %N2 jobb

lightpos{3}{1} = [20 70]; %N3 kozep
lightpos{3}{2} = [30 70]; %N3 bal
lightpos{3}{3} = [20 60]; %N3 felso
lightpos{3}{4} = [10 70]; %N3 jobb


lightpos{4}{1} = [-70 -60]; %W1 kozep
lightpos{4}{2} = [-70 -50]; %W1 bal
lightpos{4}{3} = [-60 -60]; %W1 felso
lightpos{4}{4} = [-70 -70]; %W1 jobb

lightpos{5}{1} = [-70 -20]; %W2 kozep
lightpos{5}{2} = [-70 -10]; %W2 bal
lightpos{5}{3} = [-60 -20]; %W2 felso
lightpos{5}{4} = [-70 -30]; %W2 jobb

lightpos{6}{1} = [-70 20]; %W3 kozep
lightpos{6}{2} = [-70 30]; %W3 bal
lightpos{6}{3} = [-60 20]; %W3 felso
lightpos{6}{4} = [-70 10]; %W3 jobb


lightpos{7}{1} = [60 -70]; %S1 kozep
lightpos{7}{2} = [50 -70]; %S1 bal
lightpos{7}{3} = [60 -60]; %S1 felso
lightpos{7}{4} = [70 -70]; %S1 jobb

lightpos{8}{1} = [20 -70]; %S2 kozep
lightpos{8}{2} = [10 -70]; %S2 bal
lightpos{8}{3} = [20 -60]; %S2 felso
lightpos{8}{4} = [30 -70]; %S2 jobb

lightpos{9}{1} = [-20 -70]; %S3 kozep
lightpos{9}{2} = [-30 -70]; %S3 bal
lightpos{9}{3} = [-20 -60]; %S3 felso
lightpos{9}{4} = [-10 -70]; %S3 jobb


lightpos{10}{1} = [70 60]; %E1 kozep
lightpos{10}{2} = [70 50]; %E1 bal
lightpos{10}{3} = [60 60]; %E1 felso
lightpos{10}{4} = [70 70]; %E1 jobb

lightpos{11}{1} = [70 20]; %E2 kozep
lightpos{11}{2} = [70 10]; %E2 bal
lightpos{11}{3} = [60 20]; %E2 felso
lightpos{11}{4} = [70 30]; %E2 jobb

lightpos{12}{1} = [70 -20]; %E3 kozep
lightpos{12}{2} = [70 -30]; %E3 bal
lightpos{12}{3} = [60 -20]; %E3 felso
lightpos{12}{4} = [70 -10]; %E3 jobb


for i=1:12
    for j = 1:4
    light{i}{j} = plot(lightpos{i}{j}(1),lightpos{i}{j}(2),'s', 'MarkerSize', 4, 'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red');
    end
end

%sorban a harmadik lampanak a lathatatlanna tetele
for k=3:3:12
    for e=1:4
    light{3}{e}.MarkerEdgeColor = 'white';
    light{3}{e}.MarkerFaceColor = 'white';
    light{6}{e}.MarkerEdgeColor = 'white';
    light{6}{e}.MarkerFaceColor = 'white';
    light{9}{e}.MarkerEdgeColor = 'white';
    light{9}{e}.MarkerFaceColor = 'white';
    light{12}{e}.MarkerEdgeColor = 'white';
    light{12}{e}.MarkerFaceColor = 'white';
    end
end

LH(1) = plot(nan, nan, 's', 'MarkerSize',5,'MarkerEdgeColor','blue',...
    'MarkerFaceColor','blue');
LH(2) = plot(nan, nan, 's', 'MarkerSize',5,'MarkerEdgeColor','magenta',...
    'MarkerFaceColor','magenta');
LH(3) = plot(nan, nan, 's', 'MarkerSize',5,'MarkerEdgeColor','cyan',...
    'MarkerFaceColor','cyan');
LH(4) = plot(nan, nan, 's', 'MarkerSize',5,'MarkerEdgeColor','black',...
    'MarkerFaceColor','black');
L(1) = "To N3/N4";
L(2) = "To W3/W4";
L(3) = "To S3/S4";
L(4) = "To E3/E4";
lgd = legend(LH,L);
lgd.AutoUpdate = 'off';

% map size
axis([-600, 600, -600, 600]);
end