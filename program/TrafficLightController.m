function TrafficLightController() %vantorlodas jelzo a lampanak hogy van torlodas es majd a lampa kitalalja hogy mi az oka (4 erteke lehet 4 irany szerint)


plotBIMAGE();
%% valtozok letrehozasa
global light;
global cars;
cars = cell(1,10);
for u = 1:10
    cars{u} = cell(1,5); %[plot id kiindulopoz vegpoz utvonal]
end

global carnum;
carnum = 0;

global vantorlodas; %torlodas tipusanak felismeresehez
vantorlodas = 0;

global blockn2 blockw2 blocks2 blocke2; %3x1 esetben a szembesav tiltasahoz
blockn2 = 0;
blockw2 = 0;
blocks2 = 0;
blocke2 = 0;
global lampaciklus; %autok is tudjak majd hogy milyen ciklus van eppen

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

N3 = sym('N3');
N4 = sym('N4');
W3 = sym('W3');
W4 = sym('W4');
S3 = sym('S3');
S4 = sym('S4');
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

        
                
%% teszteleshez
fig1 = uifigure;
fig2 = uifigure;
btn1 = uibutton(fig1,'push',...
               'Text', 'AddCar','Position',[420, 218, 100, 22],...
               'ButtonPushedFcn', @(btn1,event) plotCar());
btn2 = uibutton(fig2,'push',...
               'Text', 'MoveCar','Position',[420, 218, 100, 22],...
               'ButtonPushedFcn', @(btn2,event) moveCar());   
           
function plotCar()
    cars{1}{1} = plot(-60, 60,'s');
    cars{1}{2} = 1;
    cars{1}{4} = S3;
    %cars{2}{1} = plot(20, -548,'s');
    %cars{1}{2} = 2;
    vantorlodas = 1;
    carnum = 1;
end

function moveCar()
    cars{1}{1}.XData = 100;
    cars{1}{1}.YData = 100;
    vantorlodas = 0;
end

%% foprogram
while(1)
    
    %% itt vizsgaljuk a torlodast es a tipusat es valtjuk a ciklust (ATRAKVA)
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
                for s = 1:carnum
                    for x = 1:11 %n1 savra
                        if ((cars{s}{1}.XData == n1{x}(1)) && (cars{s}{1}.YData == n1{x}(2)))
                            if(cars{s}{4} == S3 || cars{s}{4} == S4) %elore menok
                                nelorecntr = nelorecntr + 1;
                            elseif(cars{s}{4} == E3 || cars{s}{4} == E4) %balra fordulok
                                nbalracntr = nbalracntr + 1;
                            end
                        end
                    end
                    
                    for y = 1:11 %n2 savra
                        if ((cars{s}{1}.XData == n2{x}(1)) && (cars{s}{1}.YData == n2{x}(2)))
                            if(cars{s}{4} == S3 || cars{s}{4} == S4) %elore menok
                                nelorecntr = nelorecntr + 1;
                            elseif(cars{s}{4} == E3 || cars{s}{4} == E4) %balra fordulok
                                nbalracntr = nbalracntr + 1;
                            end
                        end
                    end
                end
                if (nelorecntr >= nbalracntr)
                    torlodastipus = 2;
                else
                    torlodastipus = 3;
                end
                
            case 2 %West
                for s = 1:carnum
                    for x = 1:11 %w1 savra minden poziciora
                        if ((cars{s}{1}.XData == w1{x}(1)) && (cars{s}{1}.YData == w1{x}(2)))
                            if(cars{s}{4} == E3 || cars{s}{4} == E4) %elore menok
                                welorecntr = welorecntr + 1;
                            elseif(cars{s}{4} == N3 || cars{s}{4} == N4) %balra fordulok
                                wbalracntr = wbalracntr + 1;
                            end
                        end
                    end
                    
                    for y = 1:11 %w2 savra minden poziciora
                        if ((cars{s}{1}.XData == w2{x}(1)) && (cars{s}{1}.YData == w2{x}(2)))
                            if(cars{s}{4} == E3 || cars{s}{4} == E4) %elore menok
                                welorecntr = welorecntr + 1;
                            elseif(cars{s}{4} == N3 || cars{s}{4} == N4) %balra fordulok
                                wbalracntr = wbalracntr + 1;
                            end
                        end
                    end
                end
                if (welorecntr >= wbalracntr)
                    torlodastipus = 4;
                else
                    torlodastipus = 5;
                end
                
            case 3 %South
                for s = 1:carnum
                    for x = 1:11 %s1 savra minden poziciora
                        if ((cars{s}{1}.XData == s1{x}(1)) && (cars{s}{1}.YData == s1{x}(2)))
                            if(cars{s}{4} == N3 || cars{s}{4} == N4) %elore menok
                                selorecntr = selorecntr + 1;
                            elseif(cars{s}{4} == W3 || cars{s}{4} == W4) %balra fordulok
                                sbalracntr = sbalracntr + 1;
                            end
                        end
                    end
                    
                    for y = 1:11 %s2 savra minden poziciora
                        if ((cars{s}{1}.XData == s2{x}(1)) && (cars{s}{1}.YData == s2{x}(2)))
                            if(cars{s}{4} == N3 || cars{s}{4} == N4) %elore menok
                                selorecntr = selorecntr + 1;
                            elseif(cars{s}{4} == W3 || cars{s}{4} == W4) %balra fordulok
                                sbalracntr = sbalracntr + 1;
                            end
                        end
                    end
                end
                if (selorecntr >= sbalracntr)
                    torlodastipus = 6;
                else
                    torlodastipus = 7;
                end
                
            case 4 %East
                for s = 1:carnum
                    for x = 1:11 %e1 savra minden poziciora
                        if ((cars{s}{1}.XData == e1{x}(1)) && (cars{s}{1}.YData == e1{x}(2)))
                            if(cars{s}{4} == W3 || cars{s}{4} == W4) %elore menok
                                eelorecntr = eelorecntr + 1;
                            elseif(cars{s}{4} == S3 || cars{s}{4} == S4) %balra fordulok
                                ebalracntr = ebalracntr + 1;
                            end
                        end
                    end
                    
                    for y = 1:11 %e2 savra minden poziciora
                        if ((cars{s}{1}.XData == e2{x}(1)) && (cars{s}{1}.YData == e2{x}(2)))
                            if(cars{s}{4} == W3 || cars{s}{4} == W4) %elore menok
                                eelorecntr = eelorecntr + 1;
                            elseif(cars{s}{4} == S3 || cars{s}{4} == S4) %balra fordulok
                                ebalracntr = ebalracntr + 1;
                            end
                        end
                    end
                end
                if (eelorecntr >= ebalracntr)
                    torlodastipus = 8;
                else
                    torlodastipus = 9;
                end
                
        end
    else
        torlodastipus = 1;
    end
    
    
    
    %% itt vizsgaljuk h a 3X1 teljesulhet e (ures e a szembe sav) (meg nincs atrakva)
    
    %ha volt korabban beallitott ertek akkor arra vizsgalunk ujra mert az
    %meg fent all csak nem tudtuk teljesiteni, (KERDES HOGY KELL E, NEM BIZTOS)
    
%     if(lampaciklusprev ~= 0)
%         torlodastipus = lampaciklusprev;
%     end
%    lampaciklusprev = 0;
    lampaciklus = torlodastipus;
    
    if((torlodastipus == 2) || (torlodastipus == 4) || (torlodastipus == 6) || (torlodastipus == 8)) %meg nincs atrakva
        switch torlodastipus
            case 2
                for p = 1:carnum
                    for r = 1:26
                        if((cars{p}{1}.XData == s2n3pos{r}(1)) && (cars{p}{1}.YData == s2n3pos{r}(2)))
                            lampaciklus = 1; %ha van valaki a szembesavba akkor alap ciklus
                            %lampaciklusprev = torlodastipus;
                            blocks2 = 1; %sav blokkolasat jelzo bit (ne rakodjon oda tobb auto)
                            breakbool2 = 1;
                            break
                        end
                    end
                    if(breakbool2 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
                        breakbool2 = 0;
                        break
                    end
                end
            case 4
                for p = 1:carnum
                    for r = 1:26
                        if((cars{p}{1}.XData == e2w3pos{r}(1)) && (cars{p}{1}.YData == e2w3pos{r}(2)))
                            lampaciklus = 1;
                            %lampaciklusprev = torlodastipus;
                            blocke2 = 1; %sav blokkolasat jelzo bit (ne rakodjon oda tobb auto)
                            breakbool3 = 1;
                            break
                        end
                    end
                    if(breakbool3 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
                        breakbool3 = 0;
                        break
                    end
                end
            case 6
                for p = 1:carnum
                    for r = 1:26
                        if((cars{p}{1}.XData == n2s3pos{r}(1)) && (cars{p}{1}.YData == n2s3pos{r}(2)))
                            lampaciklus = 1;
                            %lampaciklusprev = torlodastipus;
                            blockn2 = 1; %sav blokkolasat jelzo bit (ne rakodjon oda tobb auto)
                            breakbool4 = 1;
                            break
                        end
                    end
                    if(breakbool4 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
                        breakbool4 = 0;
                        break
                    end
                end
            case 8
                for p = 1:carnum
                    for r = 1:26
                        if((cars{p}{1}.XData == w2e3pos{r}(1)) && (cars{p}{1}.YData == w2e3pos{r}(2)))
                            lampaciklus = 1;
                            %lampaciklusprev = torlodastipus;
                            blockw2 = 1; %sav blokkolasat jelzo bit (ne rakodjon oda tobb auto)
                            breakbool5 = 1;
                            break
                        end
                    end
                    if(breakbool5 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
                        breakbool5 = 0;
                        break
                    end
                end
        end
    end
    
    
    
    
    
    
    %% a matrixot forgatjuk a torlodasnak megfeleloen
switch lampaciklus
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

%% beallitjuk a lampakat matrixnak megfeleloen
    for k=1:12 %12 sor
        for i=1:12 %12 lampa
            if(TM(row,i) == X1)
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

            elseif(TM(row,i) == X2)
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

               
            elseif(TM(row,i) == X3)                
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


            elseif(TM(row,i) == X4)
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
                
            elseif(TM(row,i) == X5)
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

            elseif(TM(row,i) == X6)
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
     
            elseif(TM(row,i) == X7)
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

            elseif(TM(row,i) == X8)
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
                
            elseif(TM(row,i) == X9)
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
                
            elseif(TM(row,i) == X10)
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
        pause(0.01)
        
        %% lampaciklusok varakozasa (MUKODIK, TESZTELVE)
        if(row == 3 || row == 6 || row == 9 || row == 12 || row == 15 || row == 18 || ...
                row == 21 || row == 24 || row == 27 || row == 30 || row == 33 || row == 36)
            if(carnum ~= 0) %atrakva
            while(middlefull == 1)
                 middlefull = 0;
                 for m = 1:carnum
                     for n = 1:16
                         if(cars{m}{1}.XData == middlepos{n}(1) && cars{m}{1}.YData == middlepos{n}(2))
                             middlefull = 1;
                             breakbool1 = 1;
                             break
                         end
                     end
                     if(breakbool1 == 1)
                         breakbool1 = 0;
                         break
                     end
                 end
                 pause(0.001);
            end
            middlefull = 1;
            end
            pause(1);
        else
            pause(3);
        end
        row = row + 1;
        
    end
    %vantorlodas = 0;
end
end