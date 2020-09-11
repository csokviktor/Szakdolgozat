function foprogrambiztonsagi()
plotBIMAGE();

%% utvonalhoz tartozo valtozok letrehozasa
global routeMatrixBase;
global routeMatrixLeft;
global routeMatrixStraight;
global endgoalsNL;
global endgoalsFT2;
global endgoalsFT4;
global endgoalsFT6;
global endgoalsFT8;
global car;


car = cell(1,5);
start = 1;

%lampaciklus kezi allitasahoz(teszteleshez csak)
f = uifigure;
bg = uibuttongroup(f,'Position',[150 150 300 300]);
tb1 = uibutton(bg,'Position',[100 225 140 22],'Text','One','ButtonPushedFcn', @(tb1,event) one());
tb2 = uibutton(bg,'Position',[100 200 140 22],'Text','Two','ButtonPushedFcn', @(tb2,event) two());
tb3 = uibutton(bg,'Position',[100 175 140 22],'Text','Three','ButtonPushedFcn', @(tb3,event) three());
tb4 = uibutton(bg,'Position',[100 150 140 22],'Text','Four','ButtonPushedFcn', @(tb4,event) four());
tb5 = uibutton(bg,'Position',[100 125 140 22],'Text','Five','ButtonPushedFcn', @(tb5,event) five());
tb6 = uibutton(bg,'Position',[100 100 140 22],'Text','Six','ButtonPushedFcn', @(tb6,event) six());
tb7 = uibutton(bg,'Position',[100 75 140 22],'Text','Seven','ButtonPushedFcn', @(tb7,event) seven());
tb8 = uibutton(bg,'Position',[100 50 140 22],'Text','Eight','ButtonPushedFcn', @(tb8,event) eight());
tb9 = uibutton(bg,'Position',[100 25 140 22],'Text','Nine','ButtonPushedFcn', @(tb9,event) nine());

    function one()
        lampaciklus = 1;
    end
    function two()
        lampaciklus = 2;
    end
    function three()
        lampaciklus = 3;
    end
    function four()
        lampaciklus = 4;
    end
    function five()
        lampaciklus = 5;
    end
    function six()
        lampaciklus = 6;
    end
    function seven()
        lampaciklus = 7;
    end
    function eight()
        lampaciklus = 8;
    end
    function nine()
        lampaciklus = 9;
    end
%% lampakhoz tartozo valtozok
global light;

global vantorlodas; %torlodas tipusanak felismeresehez
vantorlodas = 0;

%3x1 esetben a szembesav tiltasahoz
blockn2 = 0;
blockw2 = 0;
blocks2 = 0;
blocke2 = 0;

%kozep ellenorzesehez
middlepos = {[-60 60] [-20 60] [20 60] [60 60]...
    [-60 20] [-20 20] [20 20] [60 20]...
    [-60 -20] [-20 -20] [20 -20] [60 -20]...
    [-60 -60] [-20 -60] [20 -60] [60 -60]};

%torlodas tipusanak felismeresehez (autok lehetseges pozicioi)
n1 = {[-60 600] [-60 548] [-60 496] [-60 444] [-60 392] [-60 340] [-60 288] [-60 236] [-60 184] [-60 132] [-60 80]};
n2 = {[-20 600] [-20 548] [-20 496] [-20 444] [-20 392] [-20 340] [-20 288] [-20 236] [-20 184] [-20 132] [-20 80]};
w1 = {[-600 -60] [-548 -60] [-496 -60] [-444 -60] [-392 -60] [-340 -60] [-288 -60] [-236 -60] [-184 -60] [-132 -60] [-80 -60]};
w2 = {[-600 -20] [-548 -20] [-496 -20] [-444 -20] [-392 -20] [-340 -20] [-288 -20] [-236 -20] [-184 -20] [-132 -20] [-80 -20]};
s1 = {[60 -600] [60 -548] [60 -496] [60 -444] [60 -392] [60 -340] [60 -288] [60 -236] [60 -184] [60 -132] [60 -80]};
s2 = {[20 -600] [20 -548] [20 -496] [20 -444] [20 -392] [20 -340] [20 -288] [20 -236] [20 -184] [20 -132] [20 -80]};
e1 = {[600 60] [548 60] [496 60] [444 60] [392 60] [340 60] [288 60] [236 60] [184 60] [132 60] [80 60]};
e2 = {[600 20] [548 20] [496 20] [444 20] [392 20] [340 20] [288 20] [236 20] [184 20] [132 20] [80 20]};
nelorecntr = 1;
nbalracntr = 1;
welorecntr = 1;
wbalracntr = 1;
selorecntr = 1;
sbalracntr = 1;
eelorecntr = 1;
ebalracntr = 1;

%3x1 savelosztas ellenorzesehez
n2s3pos = {[-20 600] [-20 548] [-20 496] [-20 444] [-20 392] [-20 340] [-20 288] [-20 236] [-20 184]...
    [-20 132] [-20 80] [-20 60] [-20 20] [-20 -20] [-20 -60] [-20 -80] [-20 -132] [-20 -184]...
    [-20 -236] [-20 -288] [-20 -340] [-20 -392] [-20 -444] [-20 -496] [-20 -548] [-20 -600]};

s2n3pos = {[20 -600] [20 -548] [20 -496] [20 -444] [20 -392] [20 -340] [20 -288] [20 -236]...
    [20 -184] [20 -132] [20 -80] [20 -60] [20 -20] [20 20] [20 60] [20 80] [20 132]...
    [20 184] [20 236] [20 288] [20 340] [20 392] [20 444] [20 496] [20 548] [20 600]};

e2w3pos = {[-600 20] [-548 20] [-496 20] [-444 20] [-392 20] [-340 20] [-288 20] [-236 20]...
    [-184 20] [-132 20] [-80 20] [-60 20] [-20 20] [20 20] [60 20] [80 20] [132 20]...
    [184 20] [236 20] [288 20] [340 20] [392 20] [444 20] [496 20] [548 20] [600 20]};

w2e3pos = {[-600 -20] [-548 -20] [-496 -20] [-444 -20] [-392 -20] [-340 -20] [-288 -20] [-236 -20]...
    [-184 -20] [-132 -20] [-80 -20] [-60 -20] [-20 -20] [20 -20] [60 -20] [80 -20] [132 -20]...
    [184 -20] [236 -20] [288 -20] [340 -20] [392 -20] [444 -20] [496 -20] [548 -20] [600 -20]};

middlefull = 1; %mar elso whileba is meglegyen a vizsgalat
breakbool1 = 0;
breakbool2 = 0;
breakbool3 = 0;
breakbool4 = 0;
breakbool5 = 0;

X1 = sym('X1');
X2 = sym('X2');
X3 = sym('X3');
X4 = sym('X4');
X5 = sym('X5');
X6 = sym('X6');
X7 = sym('X7');
X8 = sym('X8');
X9 = sym('X9');
X10 = sym('X10');

N1 = sym('N1');
N2 = sym('N2');
N3 = sym('N3');
N4 = sym('N4');
W1 = sym('W1');
W2 = sym('W2');
W3 = sym('W3');
W4 = sym('W4');
S1 = sym('S1');
S2 = sym('S2');
S3 = sym('S3');
S4 = sym('S4');
E1 = sym('E1');
E2 = sym('E2');
E3 = sym('E3');
E4 = sym('E4');

ControllerMatrix = {X4	X1	X10	X4	X1	X10	X6	X7	X10	X1	X1	X10;... %alap eset
    X2	X1	X10	X4	X1	X10	X6	X7	X10	X1	X1	X10;...
    X1	X1	X10	X4	X1	X10	X2	X2	X10	X9	X9	X10;...
    X1	X1	X10	X4	X1	X10	X4	X1	X10	X6	X7	X10;...
    X1	X1	X10	X4	X1	X10	X4	X1	X10	X6	X7	X10;...
    X9	X9	X10	X2	X1	X10	X4	X1	X10	X2	X2	X10;...
    X6	X7	X10	X1	X1	X10	X4	X1	X10	X4	X1	X10;...
    X6	X7	X10	X1	X1	X10	X4	X1	X10	X4	X1	X10;...
    X2	X2	X10	X9	X9	X10	X2	X1	X10	X4	X1	X10;...
    X4	X1	X10	X6	X7	X10	X1	X1	X10	X4	X1	X10;...
    X4	X1	X10	X6	X7	X10	X1	X1	X10	X4	X1	X10;...
    X1	X1	X10	X2	X2	X10	X1	X1	X10	X1	X1	X10;...
    
    X6	X3	X7	X1	X1	X10	X4	X10	X10	X4	X1	X10;... %torlodas elore emnok miatt
    X6	X3	X7	X1	X1	X10	X4	X10	X10	X4	X1	X10;...
    X2	X2	X2	X9	X9	X10	X2	X10	X10	X2	X1	X10;...
    X4	X1	X1	X6	X7	X10	X1	X10	X10	X1	X1	X10;...
    X4	X1	X1	X6	X7	X10	X1	X10	X10	X1	X1	X10;...
    X4	X1	X1	X2	X2	X10	X9	X10	X10	X1	X1	X10;...
    X4	X1	X1	X4	X1	X10	X8	X10	X10	X1	X1	X10;...
    X4	X1	X1	X4	X1	X10	X8	X10	X10	X1	X1	X10;...
    X2	X1	X1	X4	X1	X10	X2	X10	X10	X9	X9	X10;...
    X1	X1	X1	X4	X1	X10	X4	X10	X10	X6	X7	X10;...
    X1	X1	X1	X4	X1	X10	X4	X10	X10	X6	X7	X10;...
    X1	X1	X1	X1	X1	X10	X1	X10	X10	X2	X2	X10;...
    
    X8	X5	X10	X1	X1	X10	X1	X1	X10	X4	X1	X10;... %torlodas balra kanyarodok miatt
    X8	X5	X10	X1	X1	X10	X1	X1	X10	X4	X1	X10;...
    X2	X2	X10	X9	X9	X10	X1	X1	X10	X4	X1	X10;...
    X4	X1	X10	X6	X7	X10	X1	X1	X10	X4	X1	X10;...
    X4	X1	X10	X6	X7	X10	X1	X1	X10	X4	X1	X10;...
    X4	X1	X10	X2	X2	X10	X9	X9	X10	X2	X1	X10;...
    X4	X1	X10	X4	X1	X10	X6	X7	X10	X1	X1	X10;...
    X4	X1	X10	X4	X1	X10	X6	X7	X10	X1	X1	X10;...
    X2	X1	X10	X4	X1	X10	X2	X2	X10	X9	X9	X10;...
    X1	X1	X10	X4	X1	X10	X4	X1	X10	X6	X7	X10;...
    X1	X1	X10	X4	X1	X10	X4	X1	X10	X6	X7	X10;...
    X1	X1	X10	X1	X1	X10	X1	X1	X10	X2	X2	X10;...
    };

%% uj valtozok
lampChange = 2;
lampChangeCntr = 1;
cycleChange = 13;
row = 1;
carnum = 1;
lampaciklus = 1;
lampaciklusaktualis = lampaciklus;

car{3} = 1;
car{4} = 2;

%%
while(1) % 1 autora lampa es mozgatas
    
    %% autok mozgatasa
    %matrixok forgatasa (uj autot amikor vegigert az elozo)
    if(car{3} == car{4})
        car{2}.Visible  = 'off';
    end

    if(car{3} == car{4} || start == 1)
        start = 0;
        switch lampaciklusaktualis
            case 1 %Nincs torlodas
                random = randi([1 48]);
                car{1} = routeMatrixBase{random};
                car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
                car{3} = 0;
                car{4} = length(car{1});
                car{5} = endgoalsNL{random};
                
            case 2 %N-rol elore miatt
                random1 = randi([1 30]);
                random2 = randi([37 48]);
                random3 = randi([1 2]);
                switch random3
                    case 1
                        random = random1;
                    case 2
                        random = random2;
                end
                car{1} = routeMatrixStraight{random};
                car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
                car{3} = 1;
                car{4} = length(car{1});
                car{5} = endgoalsFT2{random};
                
            case 3 %N-rol balra miatt
                random = randi([1 48]);
                car{1} = routeMatrixLeft{random};
                car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
                car{3} = 1;
                car{4} = length(car{1});
                car{5} = endgoalsNL{random};
                
            case 4 %W-rol elore miatt, forgatassal
                random = randi([1 42]);
                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                for i = 1:length(routeMatrixStraightTemp{random})
                    temp = routeMatrixStraightTemp{random}{i}(1);
                    routeMatrixStraightTemp{random}{i}(1) = -routeMatrixStraightTemp{random}{i}(2);
                    routeMatrixStraightTemp{random}{i}(2) = temp;
                end
                car{1} = routeMatrixStraightTemp{random};
                car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
                car{3} = 1;
                car{4} = length(car{1});
                car{5} = endgoalsFT4{random};

                
            case 5 %W-rol balra miatt, forgatas
                random = randi([1 48]);
                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                for i = 1:length(routeMatrixLeftTemp{random})
                    temp = routeMatrixLeftTemp{random}{i}(1);
                    routeMatrixLeftTemp{random}{i}(1) = -routeMatrixLeftTemp{random}{i}(2);
                    routeMatrixLeftTemp{random}{i}(2) = temp;
                end
                car{1} = routeMatrixLeftTemp{random};
                car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
                car{3} = 1;
                car{4} = length(car{1});
                car{5} = endgoalsNL{random};
                
            case 6 %S-rol elore miatt
                random1 = randi([1 6]);
                random2 = randi([13 48]);
                random3 = randi([1 2]);
                switch random3
                    case 1
                        random = random1;
                    case 2
                        random = random2;
                end
                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                for i = 1:length(routeMatrixStraightTemp{random})
                    routeMatrixStraightTemp{random}{i}(1) = -routeMatrixStraightTemp{random}{i}(1);
                    routeMatrixStraightTemp{random}{i}(2) = -routeMatrixStraightTemp{random}{i}(2);
                end
                car{1} = routeMatrixStraightTemp{random};
                car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
                car{3} = 1;
                car{4} = length(car{1});
                car{5} = endgoalsFT6{random};
                
            case 7 %S-rol balra miatt, forgatas
                random = randi([1 48]);
                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                for i = 1:length(routeMatrixLeftTemp{random})
                    routeMatrixLeftTemp{random}{i}(1) = -routeMatrixLeftTemp{random}{i}(1);
                    routeMatrixLeftTemp{random}{i}(2) = -routeMatrixLeftTemp{random}{i}(2);
                end
                car{1} = routeMatrixLeftTemp{random};
                car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
                car{3} = 1;
                car{4} = length(car{1});
                car{5} = endgoalsNL{random};
                
            case 8 %E-rol elore miatt
                random1 = randi([1 18]);
                random2 = randi([25 48]);
                random3 = randi([1 2]);
                switch random3
                    case 1
                        random = random1;
                    case 2
                        random = random2;
                end
                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                for i = 1:length(routeMatrixStraightTemp{random})
                    temp = -routeMatrixStraightTemp{random}{i}(1);
                    routeMatrixStraightTemp{random}{i}(1) = routeMatrixStraightTemp{random}{i}(2);
                    routeMatrixStraightTemp{random}{i}(2) = temp;
                end
                car{1} = routeMatrixStraightTemp{random};
                car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
                car{3} = 1;
                car{4} = length(car{1});
                car{5} = endgoalsFT8{random};
                
            case 9 %E-rol balra miatt, forgatas
                random = randi([1 48]);
                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                for i = 1:length(routeMatrixLeftTemp{random})
                    temp = -routeMatrixLeftTemp{random}{i}(1);
                    routeMatrixLeftTemp{random}{i}(1) = routeMatrixLeftTemp{random}{i}(2);
                    routeMatrixLeftTemp{random}{i}(2) = temp;
                end
                car{1} = routeMatrixLeftTemp{random};
                car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
                car{3} = 1;
                car{4} = length(car{1});
                car{5} = endgoalsNL{random};
        end
    end
        
    
    if(car{3} == 11) % ha a lampa elott vagyunk
        if(car{2}.XData == -60 && car{2}.YData == 80) %N1 lampa elott vagyunk
            if((car{5} == W4 || car{5} == W3) && (light{1}{5} == X4 || light{1}{5} == X6 || light{1}{5} == X8))
                car{3} = car{3};
            elseif((car{5} == S4 || car{5} == S3 || car{5} == S2) && (light{1}{5} == X3 || light{1}{5} == X6 || light{1}{5} == X8))
                car{3} = car{3};
            elseif((car{5} == E4 || car{5} == E3) && (light{1}{5} == X8))
                car{3} = car{3};
            else
                car{3} = car{3} - 1;
            end
        elseif(car{2}.XData == -20 && car{2}.YData == 80) %N2 lampa elott allunk
            if((car{5} == S4 || car{5} == S3 || car{5} == S2) && (light{2}{5} == X3 || light{2}{5} == X7))
                car{3} = car{3};
            elseif((car{5} == E4 || car{5} == E3) && (light{2}{5} == X5 || light{2}{5} == X7))
                car{3} = car{3};
            else
                car{3} = car{3} - 1;
            end
        elseif(car{2}.XData == 20 && car{2}.YData == 80) %N3 lampa elott allunk
            if((car{5} == S4 || car{5} == S3 || car{5} == S2) && (light{3}{5} == X7))
                car{3} = car{3};
            elseif((car{5} == E4 || car{5} == E3) && (light{3}{5} == X5 || light{3}{5} == X7))
                car{3} = car{3};
            else
                car{3} = car{3} - 1;
            end
            
            
        elseif(car{2}.XData == -80 && car{2}.YData == -60) %W1 lampa elott allunk
            if((car{5} == S4 || car{5} == S3) && (light{4}{5} == X4 || light{4}{5} == X6 || light{4}{5} == X8))
                car{3} = car{3};
            elseif((car{5} == E4 || car{5} == E3 || car{5} == E2) && (light{4}{5} == X3 || light{4}{5} == X6 || light{4}{5} == X8))
                car{3} = car{3};
            elseif((car{5} == N4 || car{5} == N3) && (light{4}{5} == X8))
                car{3} = car{3};
            else
                car{3} = car{3} - 1;
            end        
        elseif(car{2}.XData == -80 && car{2}.YData == -20) %W2 lampa elott allunk
            if((car{5} == E4 || car{5} == E3 || car{5} == E2) && (light{5}{5} == X3 || light{5}{5} == X7))
                car{3} = car{3};
            elseif((car{5} == N4 || car{5} == N3) && (light{5}{5} == X5 || light{5}{5} == X7))
                car{3} = car{3};
            else
                car{3} = car{3} - 1;
            end
        elseif(car{2}.XData == -80 && car{2}.YData == 20) %W3 lampa elott allunk
            if((car{5} == E4 || car{5} == E3 || car{5} == E2) && (light{6}{5} == X7))
                car{3} = car{3};
            elseif((car{5} == N4 || car{5} == N3) && (light{6}{5} == X5 || light{6}{5} == X7))
                car{3} = car{3};
            else
                car{3} = car{3} - 1;
            end
            
            
         elseif(car{2}.XData == 60 && car{2}.YData == -80) %S1 lampa elott allunk
            if((car{5} == E4 || car{5} == E3) && (light{7}{5} == X4 || light{7}{5} == X6 || light{7}{5} == X8))
                car{3} = car{3};
            elseif((car{5} == N4 || car{5} == N3 || car{5} == N2) && (light{7}{5} == X3 || light{7}{5} == X6 || light{7}{5} == X8))
                car{3} = car{3};
            elseif((car{5} == W4 || car{5} == W3) && (light{7}{5} == X8))
                car{3} = car{3};
            else
                car{3} = car{3} - 1;
            end        
        elseif(car{2}.XData == 20 && car{2}.YData == -80) %S2 lampa elott allunk
            if((car{5} == N4 || car{5} == N3 || car{5} == N2) && (light{8}{5} == X3 || light{8}{5} == X7))
                car{3} = car{3};
            elseif((car{5} == W4 || car{5} == W3) && (light{8}{5} == X5 || light{8}{5} == X7))
                car{3} = car{3};
            else
                car{3} = car{3} - 1;
            end
        elseif(car{2}.XData == -20 && car{2}.YData == -80) %S3 lampa elott allunk
            if((car{5} == N4 || car{5} == N3 || car{5} == N2) && (light{9}{5} == X7))
                car{3} = car{3};
            elseif((car{5} == W4 || car{5} == W3) && (light{9}{5} == X5 || light{9}{5} == X7))
                car{3} = car{3};
            else
                car{3} = car{3} - 1;
            end
            
            
        elseif(car{2}.XData == 80 && car{2}.YData == 60) %E1 lampa elott allunk
            if((car{5} == N4 || car{5} == N3) && (light{10}{5} == X4 || light{10}{5} == X6 || light{10}{5} == X8))
                car{3} = car{3};
            elseif((car{5} == W4 || car{5} == W3 || car{5} == W2) && (light{10}{5} == X3 || light{10}{5} == X6 || light{10}{5} == X8))
                car{3} = car{3};
            elseif((car{5} == S4 || car{5} == S3) && (light{10}{5} == X8))
                car{3} = car{3};
            else
                car{3} = car{3} - 1;
            end        
        elseif(car{2}.XData == 80 && car{2}.YData == 20) %E2 lampa elott allunk
            if((car{5} == W4 || car{5} == W3 || car{5} == W2) && (light{11}{5} == X3 || light{11}{5} == X7))
                car{3} = car{3};
            elseif((car{5} == S4 || car{5} == S3) && (light{11}{5} == X5 || light{11}{5} == X7))
                car{3} = car{3};
            else
                car{3} = car{3} - 1;
            end
        elseif(car{2}.XData == 80 && car{2}.YData == -20) %E3 lampa elott allunk
            if((car{5} == W4 || car{5} == W3 || car{5} == W2) && (light{12}{5} == X7))
                car{3} = car{3};
            elseif((car{5} == S4 || car{5} == S3) && (light{12}{5} == X5 || light{12}{5} == X7))
                car{3} = car{3};
            else
                car{3} = car{3} - 1;
            end    
            
        end
    end
    
    car{3} = car{3} + 1;
    car{2}.XData = car{1}{car{3}}(1);
    car{2}.YData = car{1}{car{3}}(2);
    
    lampChangeCntr = lampChangeCntr + 1;
    pause(0.4);

    
    
    
    %% lampak allitasa
    %ha eleget lepett az auto resz valtjuk a lampat
    if(lampChange == lampChangeCntr)
        row = row + 1;
        lampChangeCntr = 1;
        
        % lampaciklust valtunk ha a vegere ertunk
        if(cycleChange == 13)
            cycleChange = 1;
            
            
            % itt vizsgaljuk a torlodast es a tipusat es valtjuk a ciklust
            % a torlodasnak megfelelore
            nelorecntr = 1;
            nbalracntr = 1;
            welorecntr = 1;
            wbalracntr = 1;
            selorecntr = 1;
            sbalracntr = 1;
            eelorecntr = 1;
            ebalracntr = 1;
            
            if(vantorlodas ~= 0)
                switch vantorlodas
                    case 1 %North
                        %for s = 1:carnum
                        for x = 1:11 %n1 savra
                            if ((car{2}.XData == n1{x}(1)) && (car{2}.YData == n1{x}(2)))
                                if(car{5} == S3 || car{5} == S4) %elore menok
                                    nelorecntr = nelorecntr + 1;
                                elseif(car{5} == E3 || car{5} == E4) %balra fordulok
                                    nbalracntr = nbalracntr + 1;
                                end
                            end
                        end
                        
                        for y = 1:11 %n2 savra
                            if ((car{2}.XData == n2{x}(1)) && (car{2}.YData == n2{x}(2)))
                                if(car{5} == S3 || car{5} == S4) %elore menok
                                    nelorecntr = nelorecntr + 1;
                                elseif(car{5} == E3 || car{5} == E4) %balra fordulok
                                    nbalracntr = nbalracntr + 1;
                                end
                            end
                        end
                        %end
                        if (nelorecntr >= nbalracntr)
                            torlodastipus = 2;
                        else
                            torlodastipus = 3;
                        end
                        
                    case 2 %West
                        %for s = 1:carnum
                        for x = 1:11 %w1 savra minden poziciora
                            if ((car{2}.XData == w1{x}(1)) && (car{2}.YData == w1{x}(2)))
                                if(car{5} == E3 || car{5} == E4) %elore menok
                                    welorecntr = welorecntr + 1;
                                elseif(car{5} == N3 || car{5} == N4) %balra fordulok
                                    wbalracntr = wbalracntr + 1;
                                end
                            end
                        end
                        
                        for y = 1:11 %w2 savra minden poziciora
                            if ((car{2}.XData == w2{x}(1)) && (car{2}.YData == w2{x}(2)))
                                if(car{5} == E3 || car{5} == E4) %elore menok
                                    welorecntr = welorecntr + 1;
                                elseif(car{5} == N3 || car{5} == N4) %balra fordulok
                                    wbalracntr = wbalracntr + 1;
                                end
                            end
                        end
                        %end
                        if (welorecntr >= wbalracntr)
                            torlodastipus = 4;
                        else
                            torlodastipus = 5;
                        end
                        
                    case 3 %South
                        %for s = 1:carnum
                        for x = 1:11 %s1 savra minden poziciora
                            if ((car{2}.XData == s1{x}(1)) && (car{2}.YData == s1{x}(2)))
                                if(car{5} == N3 || car{5} == N4) %elore menok
                                    selorecntr = selorecntr + 1;
                                elseif(car{5} == W3 || car{5} == W4) %balra fordulok
                                    sbalracntr = sbalracntr + 1;
                                end
                            end
                        end
                        
                        for y = 1:11 %s2 savra minden poziciora
                            if ((car{2}.XData == s2{x}(1)) && (car{2}.YData == s2{x}(2)))
                                if(car{5} == N3 || car{5} == N4) %elore menok
                                    selorecntr = selorecntr + 1;
                                elseif(car{5} == W3 || car{5} == W4) %balra fordulok
                                    sbalracntr = sbalracntr + 1;
                                end
                            end
                        end
                        %end
                        if (selorecntr >= sbalracntr)
                            torlodastipus = 6;
                        else
                            torlodastipus = 7;
                        end
                        
                    case 4 %East
                        %for s = 1:carnum
                        for x = 1:11 %e1 savra minden poziciora
                            if ((car{2}.XData == e1{x}(1)) && (car{2}.YData == e1{x}(2)))
                                if(car{5} == W3 || car{5} == W4) %elore menok
                                    eelorecntr = eelorecntr + 1;
                                elseif(car{5} == S3 || car{5} == S4) %balra fordulok
                                    ebalracntr = ebalracntr + 1;
                                end
                            end
                        end
                        
                        for y = 1:11 %e2 savra minden poziciora
                            if ((car{2}.XData == e2{x}(1)) && (car{2}.YData == e2{x}(2)))
                                if(car{5} == W3 || car{5} == W4) %elore menok
                                    eelorecntr = eelorecntr + 1;
                                elseif(car{5} == S3 || car{5} == S4) %balra fordulok
                                    ebalracntr = ebalracntr + 1;
                                end
                            end
                        end
                        %end
                        if (eelorecntr >= ebalracntr)
                            torlodastipus = 8;
                        else
                            torlodastipus = 9;
                        end
                        
                end
            elseif(vantorlodas == 0)
                torlodastipus = 1;
            end
            lampaciklusaktualis = lampaciklusaktualis; %ha mukodik akkor lampaciklusaktualis = torlodastipus;
            
            
            % itt vizsgaljuk h a 3X1 teljesulhet e (ures e a szembe sav)
            % majd ha tobb auto lesz akkor kell aktivalni ezt a reszt,
                        
            %             if((torlodastipus == 2) || (torlodastipus == 4) || (torlodastipus == 6) || (torlodastipus == 8))
            %                 switch torlodastipus
            %                     case 2
            %                         for p = 1:carnum
            %                             for r = 1:26
            %                                 if((cars{p}{2}.XData == s2n3pos{r}(1)) && (cars{p}{2}.YData == s2n3pos{r}(2)))
            %                                     lampaciklusaktualis = 1; %ha van valaki a szembesavba akkor alap ciklus
            %                                     %lampaciklusprev = torlodastipus;
            %                                     blocks2 = 1; %sav blokkolasat jelzo bit (ne rakodjon oda tobb auto)
            %                                     breakbool2 = 1;
            %                                     break
            %                                 end
            %                             end
            %                             if(breakbool2 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            %                                 breakbool2 = 0;
            %                                 break
            %                             end
            %                         end
            %                     case 4
            %                         for p = 1:carnum
            %                             for r = 1:26
            %                                 if((cars{p}{2}.XData == e2w3pos{r}(1)) && (cars{p}{2}.YData == e2w3pos{r}(2)))
            %                                     lampaciklusaktualis = 1;
            %                                     %lampaciklusprev = torlodastipus;
            %                                     blocke2 = 1; %sav blokkolasat jelzo bit (ne rakodjon oda tobb auto)
            %                                     breakbool3 = 1;
            %                                     break
            %                                 end
            %                             end
            %                             if(breakbool3 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            %                                 breakbool3 = 0;
            %                                 break
            %                             end
            %                         end
            %                     case 6
            %                         for p = 1:carnum
            %                             for r = 1:26
            %                                 if((cars{p}{2}.XData == n2s3pos{r}(1)) && (cars{p}{2}.YData == n2s3pos{r}(2)))
            %                                     lampaciklusaktualis = 1;
            %                                     %lampaciklusprev = torlodastipus;
            %                                     blockn2 = 1; %sav blokkolasat jelzo bit (ne rakodjon oda tobb auto)
            %                                     breakbool4 = 1;
            %                                     break
            %                                 end
            %                             end
            %                             if(breakbool4 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            %                                 breakbool4 = 0;
            %                                 break
            %                             end
            %                         end
            %                     case 8
            %                         for p = 1:carnum
            %                             for r = 1:26
            %                                 if((cars{p}{2}.XData == w2e3pos{r}(1)) && (cars{p}{2}.YData == w2e3pos{r}(2)))
            %                                     lampaciklusaktualis = 1;
            %                                     %lampaciklusprev = torlodastipus;
            %                                     blockw2 = 1; %sav blokkolasat jelzo bit (ne rakodjon oda tobb auto)
            %                                     breakbool5 = 1;
            %                                     break
            %                                 end
            %                             end
            %                             if(breakbool5 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            %                                 breakbool5 = 0;
            %                                 break
            %                             end
            %                         end
            %                 end
            %             end
            
               
            % a matrixot forgatjuk a torlodasnak megfeleloen (ciklus kezi allitasa gombokkal egyenlore)
            lampaciklusaktualis = lampaciklus; %gombokkal torteno valtas
            switch lampaciklusaktualis
                case 1 %Nincs torlodas
                    row = 1;
                    TM = ControllerMatrix;
                case 2 %N-rol elore miatt, 0 shift
                    row = 13;
                    TM = ControllerMatrix;
                case 3 %N-rol balra miatt, 0 shift
                    row = 25;
                    TM = ControllerMatrix;
                case 4 %W-rol elore miatt, 3 shift
                    row = 13;
                    TM = circshift(ControllerMatrix,3,2);
                case 5 %W-rol balra miatt, 3 shift
                    row = 25;
                    TM = circshift(ControllerMatrix,3,2);
                case 6 %S-rol elore miatt, 6 shift
                    row = 13;
                    TM = circshift(ControllerMatrix,6,2);
                case 7 %S-rol balra miatt, 6 shift
                    row = 25;
                    TM = circshift(ControllerMatrix,6,2);
                case 8 %E-rol elore miatt, 9 shift
                    row = 13;
                    TM = circshift(ControllerMatrix,9,2);
                case 9 %E-rol balra miatt, 9 shift
                    row = 25;
                    TM = circshift(ControllerMatrix,9,2);
            end
        end
        
        
        for i=1:12 %12 lampara beallitjuk hogy mit kell mutassanak
            if(TM(row,i) == X1) %piros
                light{i}{1}.MarkerEdgeColor = 'white';
                light{i}{1}.MarkerFaceColor = 'white';
                light{i}{1}.Marker = 's';
                
                light{i}{2}.MarkerEdgeColor = 'white';
                light{i}{2}.MarkerFaceColor = 'white';
                light{i}{2}.Marker = 's';
                
                light{i}{3}.MarkerEdgeColor = 'red';
                light{i}{3}.MarkerFaceColor = 'red';
                light{i}{3}.Marker = 's';
                
                light{i}{4}.MarkerEdgeColor = 'white';
                light{i}{4}.MarkerFaceColor = 'white';
                light{i}{4}.Marker = 's';
                
                light{i}{5} = X1;
                
            elseif(TM(row,i) == X2) %sarga
                light{i}{1}.MarkerEdgeColor = 'yellow';
                light{i}{1}.MarkerFaceColor = 'yellow';
                light{i}{1}.Marker = 's';
                
                light{i}{2}.MarkerEdgeColor = 'white';
                light{i}{2}.MarkerFaceColor = 'white';
                light{i}{2}.Marker = 's';
                
                light{i}{3}.MarkerEdgeColor = 'white';
                light{i}{3}.MarkerFaceColor = 'white';
                light{i}{3}.Marker = 's';
                
                light{i}{4}.MarkerEdgeColor = 'white';
                light{i}{4}.MarkerFaceColor = 'white';
                light{i}{4}.Marker = 's';
                
                light{i}{5} = X2;
                
                
            elseif(TM(row,i) == X3) %elore
                light{i}{1}.MarkerEdgeColor = 'white';
                light{i}{1}.MarkerFaceColor = 'white';
                light{i}{1}.Marker = 's';
                
                light{i}{2}.MarkerEdgeColor = 'white';
                light{i}{2}.MarkerFaceColor = 'white';
                light{i}{2}.Marker = 's';
                
                light{i}{3}.MarkerEdgeColor = 'green';
                light{i}{3}.MarkerFaceColor = 'green';
                if((i == 1) || (i == 2) || (i == 3))
                    light{i}{3}.Marker = 'v';
                elseif((i == 4) || (i == 5) || (i == 6))
                    light{i}{3}.Marker = '>';
                elseif((i == 7) || (i == 8) || (i == 9))
                    light{i}{3}.Marker = '^';
                elseif((i == 10) || (i == 11) || (i == 12))
                    light{i}{3}.Marker = '<';
                end
                
                light{i}{4}.MarkerEdgeColor = 'white';
                light{i}{4}.MarkerFaceColor = 'white';
                light{i}{4}.Marker = 's';
                
                light{i}{5} = X3;
                
                
            elseif(TM(row,i) == X4) %jobbra
                light{i}{1}.MarkerEdgeColor = 'white';
                light{i}{1}.MarkerFaceColor = 'white';
                light{i}{1}.Marker = 's';
                
                light{i}{2}.MarkerEdgeColor = 'white';
                light{i}{2}.MarkerFaceColor = 'white';
                light{i}{2}.Marker = 's';
                
                light{i}{3}.MarkerEdgeColor = 'white';
                light{i}{3}.MarkerFaceColor = 'white';
                light{i}{3}.Marker = 's';
                
                light{i}{4}.MarkerEdgeColor = 'green';
                light{i}{4}.MarkerFaceColor = 'green';
                if((i == 1) || (i == 2) || (i == 3))
                    light{i}{4}.Marker = '<';
                elseif((i == 4) || (i == 5) || (i == 6))
                    light{i}{4}.Marker = 'v';
                elseif((i == 7) || (i == 8) || (i == 9))
                    light{i}{4}.Marker = '>';
                elseif((i == 10) || (i == 11) || (i == 12))
                    light{i}{4}.Marker = '^';
                end
                
                light{i}{5} = X4;
                
            elseif(TM(row,i) == X5) %balra
                light{i}{1}.MarkerEdgeColor = 'white';
                light{i}{1}.MarkerFaceColor = 'white';
                light{i}{1}.Marker = 's';
                
                light{i}{2}.MarkerEdgeColor = 'green';
                light{i}{2}.MarkerFaceColor = 'green';
                if((i == 1) || (i == 2) || (i == 3))
                    light{i}{2}.Marker = '>';
                elseif((i == 4) || (i == 5) || (i == 6))
                    light{i}{2}.Marker = '^';
                elseif((i == 7) || (i == 8) || (i == 9))
                    light{i}{2}.Marker = '<';
                elseif((i == 10) || (i == 11) || (i == 12))
                    light{i}{2}.Marker = 'v';
                end
                
                light{i}{3}.MarkerEdgeColor = 'white';
                light{i}{3}.MarkerFaceColor = 'white';
                light{i}{3}.Marker = 's';
                
                light{i}{4}.MarkerEdgeColor = 'white';
                light{i}{4}.MarkerFaceColor = 'white';
                light{i}{4}.Marker = 's';
                
                light{i}{5} = X5;
                
            elseif(TM(row,i) == X6) %elore es jobbra
                light{i}{1}.MarkerEdgeColor = 'white';
                light{i}{1}.MarkerFaceColor = 'white';
                light{i}{1}.Marker = 's';
                
                light{i}{2}.MarkerEdgeColor = 'white';
                light{i}{2}.MarkerFaceColor = 'white';
                light{i}{2}.Marker = 's';
                
                light{i}{3}.MarkerEdgeColor = 'green';
                light{i}{3}.MarkerFaceColor = 'green';
                if((i == 1) || (i == 2) || (i == 3))
                    light{i}{3}.Marker = 'v';
                elseif((i == 4) || (i == 5) || (i == 6))
                    light{i}{3}.Marker = '>';
                elseif((i == 7) || (i == 8) || (i == 9))
                    light{i}{3}.Marker = '^';
                elseif((i == 10) || (i == 11) || (i == 12))
                    light{i}{3}.Marker = '<';
                end
                
                light{i}{4}.MarkerEdgeColor = 'green';
                light{i}{4}.MarkerFaceColor = 'green';
                if((i == 1) || (i == 2) || (i == 3))
                    light{i}{4}.Marker = '<';
                elseif((i == 4) || (i == 5) || (i == 6))
                    light{i}{4}.Marker = 'v';
                elseif((i == 7) || (i == 8) || (i == 9))
                    light{i}{4}.Marker = '>';
                elseif((i == 10) || (i == 11) || (i == 12))
                    light{i}{4}.Marker = '^';
                end
                
                light{i}{5} = X6;
                
            elseif(TM(row,i) == X7) %elore es balra
                light{i}{1}.MarkerEdgeColor = 'white';
                light{i}{1}.MarkerFaceColor = 'white';
                light{i}{1}.Marker = 's';
                
                light{i}{2}.MarkerEdgeColor = 'green';
                light{i}{2}.MarkerFaceColor = 'green';
                if((i == 1) || (i == 2) || (i == 3))
                    light{i}{2}.Marker = '>';
                elseif((i == 4) || (i == 5) || (i == 6))
                    light{i}{2}.Marker = '^';
                elseif((i == 7) || (i == 8) || (i == 9))
                    light{i}{2}.Marker = '<';
                elseif((i == 10) || (i == 11) || (i == 12))
                    light{i}{2}.Marker = 'v';
                end
                
                light{i}{3}.MarkerEdgeColor = 'green';
                light{i}{3}.MarkerFaceColor = 'green';
                if((i == 1) || (i == 2) || (i == 3))
                    light{i}{3}.Marker = 'v';
                elseif((i == 4) || (i == 5) || (i == 6))
                    light{i}{3}.Marker = '>';
                elseif((i == 7) || (i == 8) || (i == 9))
                    light{i}{3}.Marker = '^';
                elseif((i == 10) || (i == 11) || (i == 12))
                    light{i}{3}.Marker = '<';
                end
                
                light{i}{4}.MarkerEdgeColor = 'white';
                light{i}{4}.MarkerFaceColor = 'white';
                light{i}{4}.Marker = 's';
                
                light{i}{5} = X7;
                
            elseif(TM(row,i) == X8) %elore es jobbra es balra
                light{i}{1}.MarkerEdgeColor = 'white';
                light{i}{1}.MarkerFaceColor = 'white';
                light{i}{1}.Marker = 's';
                
                light{i}{2}.MarkerEdgeColor = 'green';
                light{i}{2}.MarkerFaceColor = 'green';
                if((i == 1) || (i == 2) || (i == 3))
                    light{i}{2}.Marker = '>';
                elseif((i == 4) || (i == 5) || (i == 6))
                    light{i}{2}.Marker = '^';
                elseif((i == 7) || (i == 8) || (i == 9))
                    light{i}{2}.Marker = '<';
                elseif((i == 10) || (i == 11) || (i == 12))
                    light{i}{2}.Marker = 'v';
                end
                
                light{i}{3}.MarkerEdgeColor = 'green';
                light{i}{3}.MarkerFaceColor = 'green';
                if((i == 1) || (i == 2) || (i == 3))
                    light{i}{3}.Marker = 'v';
                elseif((i == 4) || (i == 5) || (i == 6))
                    light{i}{3}.Marker = '>';
                elseif((i == 7) || (i == 8) || (i == 9))
                    light{i}{3}.Marker = '^';
                elseif((i == 10) || (i == 11) || (i == 12))
                    light{i}{3}.Marker = '<';
                end
                
                light{i}{4}.MarkerEdgeColor = 'green';
                light{i}{4}.MarkerFaceColor = 'green';
                if((i == 1) || (i == 2) || (i == 3))
                    light{i}{4}.Marker = '<';
                elseif((i == 4) || (i == 5) || (i == 6))
                    light{i}{4}.Marker = 'v';
                elseif((i == 7) || (i == 8) || (i == 9))
                    light{i}{4}.Marker = '>';
                elseif((i == 10) || (i == 11) || (i == 12))
                    light{i}{4}.Marker = '^';
                end
                
                light{i}{5} = X8;
                
            elseif(TM(row,i) == X9) %piros sarga
                light{i}{1}.MarkerEdgeColor = 'yellow';
                light{i}{1}.MarkerFaceColor = 'yellow';
                light{i}{1}.Marker = 's';
                
                light{i}{2}.MarkerEdgeColor = 'white';
                light{i}{2}.MarkerFaceColor = 'white';
                light{i}{2}.Marker = 's';
                
                light{i}{3}.MarkerEdgeColor = 'red';
                light{i}{3}.MarkerFaceColor = 'red';
                light{i}{3}.Marker = 's';
                
                light{i}{4}.MarkerEdgeColor = 'white';
                light{i}{4}.MarkerFaceColor = 'white';
                light{i}{4}.Marker = 's';
                
                light{i}{5} = X9;
                
            elseif(TM(row,i) == X10) %off
                light{i}{1}.MarkerEdgeColor = 'white';
                light{i}{1}.MarkerFaceColor = 'white';
                light{i}{1}.Marker = 's';
                
                light{i}{2}.MarkerEdgeColor = 'white';
                light{i}{2}.MarkerFaceColor = 'white';
                light{i}{2}.Marker = 's';
                
                light{i}{3}.MarkerEdgeColor = 'white';
                light{i}{3}.MarkerFaceColor = 'white';
                light{i}{3}.Marker = 's';
                
                light{i}{4}.MarkerEdgeColor = 'white';
                light{i}{4}.MarkerFaceColor = 'white';
                light{i}{4}.Marker = 's';
                
                light{i}{5} = X10;
                
            end
        end
        
        
        
        %beallitjuk hogy mennyi legyen a lampa ideje az adott sornak
        %megfeleloen es vizsgaljuk hogy addig nem enged uj zoldet amig
        %van valaki a keresztezodesben
        if(row == 3 || row == 6 || row == 9 || row == 12 || row == 15 || row == 18 || ...
                row == 21 || row == 24 || row == 27 || row == 30 || row == 33 || row == 36)
            lampChange = 3;
            %for m = 1:1
            for n = 1:16
                if(car{2}.XData == middlepos{n}(1) && car{2}.YData == middlepos{n}(2)) %car{m}{2}.XData == middlepos{n}(1) && car{m}{2}.YData == middlepos{n}(2) TOBB autora
                    breakbool1 = 1;
                    break
                end
            end
            if(breakbool1 == 1)
                row = row - 1;
                cycleChange = cycleChange - 1;
                breakbool1 = 0;
                %break
            end
            %end
            
        else
            lampChange = 15;
        end
        
        cycleChange = cycleChange + 1;
    end
end

end