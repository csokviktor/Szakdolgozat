function plotBIMAGE()
initialize();
global lbl1;
global lbl2;
global lbl3;
global lbl4;
global lbl5;
global pb1;
global pb2;
global pb3;
global pb4;
global pb5;
global pb6;
global pb7;
global pb8;
global pb9;
global pb10;
global pb11;
global pb12;
global pb13;
global pb14;
global pb15;
global pb16;
global pb17;
global pb18;
global popUp;

figure('Visible','on','Position',[100,100,1000,500], 'Name', 'Intersection GUI', 'NumberTitle','off');
%lampaciklus kezi allitasahoz
lbl1 = uicontrol('Style', 'text', 'Position', [570 450 140 22], 'String', 'Cycle type selector', 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
pb1 = uicontrol('Style', 'pushbutton', 'Position',[570 420 140 22], 'String','One','Callback', @one);
pb2 = uicontrol('Style', 'pushbutton', 'Position',[570 390 140 22],'String','Two','Callback', @two);
pb3 = uicontrol('Style', 'pushbutton', 'Position',[570 360 140 22],'String','Three','Callback', @three);
pb4 = uicontrol('Style', 'pushbutton', 'Position',[570 330 140 22],'String','Four','Callback', @four);
pb5 = uicontrol('Style', 'pushbutton', 'Position',[570 300 140 22],'String','Five','Callback', @five);
pb6 = uicontrol('Style', 'pushbutton', 'Position',[570 270 140 22],'String','Six','Callback', @six);
pb7 = uicontrol('Style', 'pushbutton', 'Position',[570 240 140 22],'String','Seven','Callback', @seven);
pb8 = uicontrol('Style', 'pushbutton', 'Position',[570 210 140 22],'String','Eight','Callback', @eight);
pb9 = uicontrol('Style', 'pushbutton', 'Position',[570 180 140 22],'String','Nine','Callback', @nine);
lbl2 = uicontrol('Style', 'text', 'Position', [555 150 170 22], 'String', 'Current lamp cycle type: ', 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
lbl3 = uicontrol('Style', 'text', 'Position', [555 120 170 22], 'String', 'Next lamp cycle type: ', 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
lbl6 = uicontrol('Style', 'text', 'Position', [555 80 170 30], 'String', 'Max amount of cars to add in a round', 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
popUp = uicontrol('Style', 'popupmenu', 'Position', [595 50 100 22], 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
popUp.String = {'1', '2', '3', '4', '5', '6', '7', '8'};
popUp.Value = 5;

%terheles allitasahoz
lbl4 = uicontrol('Style', 'text', 'Position', [800 450 140 22], 'String', 'Overload type selector', 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
pb10 = uicontrol('Style', 'pushbutton', 'Position',[800 420 140 22],'String','Overload N To S','Callback', @olNTS);
pb11 = uicontrol('Style', 'pushbutton', 'Position',[800 390 140 22],'String','Overload N To E','Callback', @olNTE);
pb12 = uicontrol('Style', 'pushbutton', 'Position',[800 360 140 22],'String','Overload W To E','Callback', @olWTE);
pb13 = uicontrol('Style', 'pushbutton', 'Position',[800 330 140 22],'String','Overload W To N','Callback', @olWTN);
pb14 = uicontrol('Style', 'pushbutton', 'Position',[800 300 140 22],'String','Overload S To N','Callback', @olSTN);
pb15 = uicontrol('Style', 'pushbutton', 'Position',[800 270 140 22],'String','Overload S To W','Callback', @olSTW);
pb16 = uicontrol('Style', 'pushbutton', 'Position',[800 240 140 22],'String','Overload E To W','Callback', @olETW);
pb17 = uicontrol('Style', 'pushbutton', 'Position',[800 210 140 22],'String','Overload E To S','Callback', @olETS);
pb18 = uicontrol('Style', 'pushbutton', 'Position',[800 180 140 22],'String','No Overload','Callback', @nool);
lbl5 = uicontrol('Style', 'text', 'Position', [785 110 170 50], 'String', 'Overload type: ', 'HorizontalAlignment', 'center', 'FontWeight', 'bold');

% map size
axes('Units','Pixels','Position',[50,70,450,400]);
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

global n1s;
global n2s;
global n3s;
global w1s;
global w2s;
global w3s;
global s1s;
global s2s;
global s3s;
global e1s;
global e2s;
global e3s;

N1x = [-80, -80];
N1y = [80, 600];
N2x = [-40, -40];
N2y = [80, 600];
N3x = [0, 0];
N3y = [80, 600];
N4x = [40, 40];
N4y = [80, 600];
N5x = [80, 80];
N5y = [80, 600];

W1x = [-80, -600];
W1y = [80,80];
W2x = [-80, -600];
W2y = [40,40];
W3x = [-80, -600];
W3y = [0,0];
W4x = [-80, -600];
W4y = [-40,-40];
W5x = [-80, -600];
W5y = [-80,-80];

S1x = [-80, -80];
S1y = [-80, -600];
S2x = [-40, -40];
S2y = [-80, -600];
S3x = [0, 0];
S3y = [-80, -600];
S4x = [40, 40];
S4y = [-80, -600];
S5x = [80, 80];
S5y = [-80, -600];

E1x = [80, 600];
E1y = [80,80];
E2x = [80, 600];
E2y = [40,40];
E3x = [80, 600];
E3y = [0, 0];
E4x = [80, 600];
E4y = [-40,-40];
E5x = [80, 600];
E5y = [-80,-80];

%roads
%north
plot(N1x,N1y,'k', 'linewidth', 1.5)
hold on
n1 = plot(N2x,N2y,'--k', 'linewidth', 1);
hold on
n2 = plot(N3x,N3y,'k', 'linewidth', 1);
hold on
n3 = plot(N4x,N4y,'--k', 'linewidth', 1);
hold on
plot(N5x,N5y,'k', 'linewidth', 1.5)
hold on

%west
plot(W1x,W1y,'k', 'linewidth', 1.5)
hold on
w1 = plot(W2x,W2y,'--k', 'linewidth', 1);
hold on
w2 = plot(W3x,W3y,'k', 'linewidth', 1);
hold on
w3 = plot(W4x,W4y,'--k', 'linewidth', 1);
hold on
plot(W5x,W5y,'k', 'linewidth', 1.5)
hold on

%south
plot(S1x,S1y,'k', 'linewidth', 1.5)
hold on
s1 = plot(S2x,S2y,'--k', 'linewidth', 1);
hold on
s2 = plot(S3x,S3y,'k', 'linewidth', 1);
hold on 
s3 = plot(S4x,S4y,'--k', 'linewidth', 1);
hold on
plot(S5x,S5y,'k', 'linewidth', 1.5)
hold on

%east
plot(E1x,E1y,'k', 'linewidth', 1.5)
hold on
e1 = plot(E2x,E2y,'--k', 'linewidth', 1);
hold on
e2 = plot(E3x,E3y,'k', 'linewidth', 1);
hold on
e3 = plot(E4x,E4y,'--k', 'linewidth', 1);
hold on
plot(E5x,E5y,'k', 'linewidth', 1.5)
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

%legend
LH(1) = plot(nan, nan, 's', 'MarkerSize',5,'MarkerEdgeColor','blue',...
    'MarkerFaceColor','blue');
LH(2) = plot(nan, nan, 's', 'MarkerSize',5,'MarkerEdgeColor','magenta',...
    'MarkerFaceColor','magenta');
LH(3) = plot(nan, nan, 's', 'MarkerSize',5,'MarkerEdgeColor','cyan',...
    'MarkerFaceColor','cyan');
LH(4) = plot(nan, nan, 's', 'MarkerSize',5,'MarkerEdgeColor','black',...
    'MarkerFaceColor','black');
L(1) = "Car to N";
L(2) = "Car to W";
L(3) = "Car to S";
L(4) = "Car to E";
lgd = legend(LH,L);
lgd.AutoUpdate = 'off';

%% direction of travel indicator box

%borders
border1x = [-540, -140];
border1y = [540, 540];
border2x = [-540, -540];
border2y = [540, 140];
border3x = [-540, -140];
border3y = [140, 140];
border4x = [-140, -140];
border4y = [140, 540];

plot(border1x,border1y,'k', 'linewidth', 1.5)
hold on
plot(border2x,border2y,'k', 'linewidth', 1.5);
hold on
plot(border3x,border3y,'k', 'linewidth', 1.5);
hold on
plot(border4x,border4y,'k', 'linewidth', 1.5);
hold on

%roads
N1sx = [-420, -420];
N1sy = [420, 540];
N2sx = [-380, -380];
N2sy = [420, 540];
N3sx = [-340, -340];
N3sy = [420, 540];
N4sx = [-300, -300];
N4sy = [420, 540];
N5sx = [-260, -260];
N5sy = [420, 540];

W1sx = [-420, -540];
W1sy = [420, 420];
W2sx = [-420, -540];
W2sy = [380, 380];
W3sx = [-420, -540];
W3sy = [340, 340];
W4sx = [-420, -540];
W4sy = [300, 300];
W5sx = [-420, -540];
W5sy = [260, 260];

S1sx = [-420, -420];
S1sy = [260, 140];
S2sx = [-380, -380];
S2sy = [260, 140];
S3sx = [-340, -340];
S3sy = [260, 140];
S4sx = [-300, -300];
S4sy = [260, 140];
S5sx = [-260, -260];
S5sy = [260, 140];

E1sx = [-260, -140];
E1sy = [420, 420];
E2sx = [-260, -140];
E2sy = [380, 380];
E3sx = [-260, -140];
E3sy = [340, 340];
E4sx = [-260, -140];
E4sy = [300, 300];
E5sx = [-260, -140];
E5sy = [260, 260];

%roads
%north
plot(N1sx,N1sy,'k', 'linewidth', 1.5)
hold on
n1s = plot(N2sx,N2sy,'--k', 'linewidth', 1);
hold on
n2s = plot(N3sx,N3sy,'k', 'linewidth', 1);
hold on
n3s = plot(N4sx,N4sy,'--k', 'linewidth', 1);
hold on
plot(N5sx,N5sy,'k', 'linewidth', 1.5)
hold on

%west
plot(W1sx,W1sy,'k', 'linewidth', 1.5)
hold on
w1s = plot(W2sx,W2sy,'--k', 'linewidth', 1);
hold on
w2s = plot(W3sx,W3sy,'k', 'linewidth', 1);
hold on
w3s = plot(W4sx,W4sy,'--k', 'linewidth', 1);
hold on
plot(W5sx,W5sy,'k', 'linewidth', 1.5)
hold on

%south
plot(S1sx,S1sy,'k', 'linewidth', 1.5)
hold on
s1s = plot(S2sx,S2sy,'--k', 'linewidth', 1);
hold on
s2s = plot(S3sx,S3sy,'k', 'linewidth', 1);
hold on 
s3s = plot(S4sx,S4sy,'--k', 'linewidth', 1);
hold on
plot(S5sx,S5sy,'k', 'linewidth', 1.5)
hold on

%east
plot(E1sx,E1sy,'k', 'linewidth', 1.5)
hold on
e1s = plot(E2sx,E2sy,'--k', 'linewidth', 1);
hold on
e2s = plot(E3sx,E3sy,'k', 'linewidth', 1);
hold on
e3s = plot(E4sx,E4sy,'--k', 'linewidth', 1);
hold on
plot(E5sx,E5sy,'k', 'linewidth', 1.5)
hold on

global lightsmall;
global lightpossmall;
lightsmall = cell(1,12);
for i = 1:12
    lightsmall{i} = cell(1,5);  %1:kozep, 2:bal, 3:felso, 4:jobb, 5:allapot
end

lightpossmall = cell(1,12);
for i = 1:12
    lightpossmall{i} = cell(1,4);
end

lightpossmall{1}{1} = [-400 430]; %N1 kozep
lightpossmall{1}{2} = [-390 430]; %N1 bal
lightpossmall{1}{3} = [-400 420]; %N1 felso
lightpossmall{1}{4} = [-410 430]; %N1 jobb

lightpossmall{2}{1} = [-360 430]; %N2 kozep
lightpossmall{2}{2} = [-350 430]; %N2 bal
lightpossmall{2}{3} = [-360 420]; %N2 felso
lightpossmall{2}{4} = [-370 430]; %N2 jobb

lightpossmall{3}{1} = [-320 430]; %N3 kozep
lightpossmall{3}{2} = [-310 430]; %N3 bal
lightpossmall{3}{3} = [-320 420]; %N3 felso
lightpossmall{3}{4} = [-330 430]; %N3 jobb


lightpossmall{4}{1} = [-430 280]; %W1 kozep
lightpossmall{4}{2} = [-430 290]; %W1 bal
lightpossmall{4}{3} = [-420 280]; %W1 felso
lightpossmall{4}{4} = [-430 270]; %W1 jobb

lightpossmall{5}{1} = [-430 320]; %W2 kozep
lightpossmall{5}{2} = [-430 330]; %W2 bal
lightpossmall{5}{3} = [-420 320]; %W2 felso
lightpossmall{5}{4} = [-430 310]; %W2 jobb

lightpossmall{6}{1} = [-430 360]; %W3 kozep
lightpossmall{6}{2} = [-430 370]; %W3 bal
lightpossmall{6}{3} = [-420 360]; %W3 felso
lightpossmall{6}{4} = [-430 350]; %W3 jobb


lightpossmall{7}{1} = [-280 250]; %S1 kozep
lightpossmall{7}{2} = [-290 250]; %S1 bal
lightpossmall{7}{3} = [-280 260]; %S1 felso
lightpossmall{7}{4} = [-270 250]; %S1 jobb

lightpossmall{8}{1} = [-320 250]; %S2 kozep
lightpossmall{8}{2} = [-330 250]; %S2 bal
lightpossmall{8}{3} = [-320 260]; %S2 felso
lightpossmall{8}{4} = [-310 250]; %S2 jobb

lightpossmall{9}{1} = [-360 250]; %S3 kozep
lightpossmall{9}{2} = [-370 250]; %S3 bal
lightpossmall{9}{3} = [-360 260]; %S3 felso
lightpossmall{9}{4} = [-350 250]; %S3 jobb


lightpossmall{10}{1} = [-250 400]; %E1 kozep
lightpossmall{10}{2} = [-250 390]; %E1 bal
lightpossmall{10}{3} = [-260 400]; %E1 felso
lightpossmall{10}{4} = [-250 410]; %E1 jobb

lightpossmall{11}{1} = [-250 360]; %E2 kozep
lightpossmall{11}{2} = [-250 350]; %E2 bal
lightpossmall{11}{3} = [-260 360]; %E2 felso
lightpossmall{11}{4} = [-250 370]; %E2 jobb

lightpossmall{12}{1} = [-250 320]; %E3 kozep
lightpossmall{12}{2} = [-250 310]; %E3 bal
lightpossmall{12}{3} = [-260 320]; %E3 felso
lightpossmall{12}{4} = [-250 330]; %E3 jobb

for i=1:12
    for j = 1:4
    lightsmall{i}{j} = plot(lightpossmall{i}{j}(1),lightpossmall{i}{j}(2),'s', 'MarkerSize', 4, 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'black');
    end
end

%sorban a harmadik lampanak a lathatatlanna tetele
for k=3:3:12
    for e=1:4
    lightsmall{3}{e}.MarkerEdgeColor = 'white';
    lightsmall{3}{e}.MarkerFaceColor = 'white';
    lightsmall{6}{e}.MarkerEdgeColor = 'white';
    lightsmall{6}{e}.MarkerFaceColor = 'white';
    lightsmall{9}{e}.MarkerEdgeColor = 'white';
    lightsmall{9}{e}.MarkerFaceColor = 'white';
    lightsmall{12}{e}.MarkerEdgeColor = 'white';
    lightsmall{12}{e}.MarkerFaceColor = 'white';
    end
end













end
%lampaciklusok valtasa kezileg
function one(source,eventdata)
global lampaciklusnext;
lampaciklusnext = 1;
end
function two(source,eventdata)
global lampaciklusnext;
lampaciklusnext = 2;
end
function three(source,eventdata)
global lampaciklusnext;
lampaciklusnext = 3;
end
function four(source,eventdata)
global lampaciklusnext;
lampaciklusnext = 4;
end
function five(source,eventdata)
global lampaciklusnext;
lampaciklusnext = 5;
end
function six(source,eventdata)
global lampaciklusnext;
lampaciklusnext = 6;
end
function seven(source,eventdata)
global lampaciklusnext;
lampaciklusnext = 7;
end
function eight(source,eventdata)
global lampaciklusnext;
lampaciklusnext = 8;
end
function nine(source,eventdata)
global lampaciklusnext;
lampaciklusnext = 9;
end

%tulterheles kezelese
function olNTS(source,eventdata)
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 1;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 0;
nooverload = 0;
end
function olNTE(source,eventdata)
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 1;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 0;
nooverload = 0;
end
function olWTE(source,eventdata)
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 1;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 0;
nooverload = 0;
end
function olWTN(source,eventdata)
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 1;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 0;
nooverload = 0;
end
function olSTN(source,eventdata)
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 1;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 0;
nooverload = 0;
end
function olSTW(source,eventdata)
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 1;
overloadETW = 0;
overloadETS = 0;
nooverload = 0;
end
function olETW(source,eventdata)
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 1;
overloadETS = 0;
nooverload = 0;
end
function olETS(source,eventdata)
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 1;
nooverload = 0;
end
function nool(source,eventdata)
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 0;
nooverload = 1;
end
