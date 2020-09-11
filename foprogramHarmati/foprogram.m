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
global ControllerMatrix;
global light;
global vantorlodas; %torlodas tipusanak felismeresehez
global lampaciklusaktualis;
global lampaciklusnext;
%3x1 esetben a szembesav tiltasahoz
global blockn2;
global blockw2;
global blocks2;
global blocke2;
global car;
global carnum;
global allow2;
global allow4;
global allow6;
global allow8;
global allow2x2;


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


%% lampakhoz tartozo valtozok
%kozep ellenorzesehez
middlepos = {[-60 60] [-20 60] [20 60] [60 60]...
    [-60 20] [-20 20] [20 20] [60 20]...
    [-60 -20] [-20 -20] [20 -20] [60 -20]...
    [-60 -60] [-20 -60] [20 -60] [60 -60]};

%torlodas tipusanak felismeresehez (autok lehetseges pozicioi)(KELLENEK A 3. SAVOK IS)
n1 = {[-60 600] [-60 548] [-60 496] [-60 444] [-60 392] [-60 340] [-60 288] [-60 236] [-60 184] [-60 132] [-60 80]}; 
n2 = {[-20 600] [-20 548] [-20 496] [-20 444] [-20 392] [-20 340] [-20 288] [-20 236] [-20 184] [-20 132] [-20 80]};
n3 = {[20 600] [20 548] [20 496] [20 444] [20 392] [20 340] [20 288] [20 236] [20 184] [20 132] [20 80]};
w1 = {[-600 -60] [-548 -60] [-496 -60] [-444 -60] [-392 -60] [-340 -60] [-288 -60] [-236 -60] [-184 -60] [-132 -60] [-80 -60]};
w2 = {[-600 -20] [-548 -20] [-496 -20] [-444 -20] [-392 -20] [-340 -20] [-288 -20] [-236 -20] [-184 -20] [-132 -20] [-80 -20]};
w3 = {[-600 20] [-548 20] [-496 20] [-444 20] [-392 20] [-340 20] [-288 20] [-236 20] [-184 20] [-132 20] [-80 20]};
s1 = {[60 -600] [60 -548] [60 -496] [60 -444] [60 -392] [60 -340] [60 -288] [60 -236] [60 -184] [60 -132] [60 -80]};
s2 = {[20 -600] [20 -548] [20 -496] [20 -444] [20 -392] [20 -340] [20 -288] [20 -236] [20 -184] [20 -132] [20 -80]};
s3 = {[-20 -600] [-20 -548] [-20 -496] [-20 -444] [-20 -392] [-20 -340] [-20 -288] [-20 -236] [-20 -184] [-20 -132] [-20 -80]};
e1 = {[600 60] [548 60] [496 60] [444 60] [392 60] [340 60] [288 60] [236 60] [184 60] [132 60] [80 60]};
e2 = {[600 20] [548 20] [496 20] [444 20] [392 20] [340 20] [288 20] [236 20] [184 20] [132 20] [80 20]};
e3 = {[600 -20] [548 -20] [496 -20] [444 -20] [392 -20] [340 -20] [288 -20] [236 -20] [184 -20] [132 -20] [80 -20]};

%lampak pocizioi vizsgalathoz, hogy a lampa ele ert e az auto
lampStop = cell(1,12);
lampStop{1} = [-60 80]; %N1
lampStop{2} = [-20 80]; %N2
lampStop{3} = [20 80]; %N3
lampStop{4} = [-80 -60]; %W1
lampStop{5} = [-80 -20]; %W2
lampStop{6} = [-80 20]; %W3
lampStop{7} = [60 -80]; %S1
lampStop{8} = [20 -80]; %S2
lampStop{9} = [-20 -80]; %S3
lampStop{10} = [80 60]; %E1
lampStop{11} = [80 20]; %E2
lampStop{12} = [80 -20]; %E3

%valtozok
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
%utkozes vizsgalat
collision = cell(1,3); %[volt e utkozes, egyik auto, masik auto]
collision{1} = 0;


%% foprogram
cycledone = 0;

prompt1 = {'Enter cycle number:','Intelligent(1-YES, 0-NO):'};
dlgtitle1 = 'Input';
dims1 = [1 20];
definput1 = {'1','0'};
initializedatastr = inputdlg(prompt1,dlgtitle1,dims1,definput1);
cyclenumgoal = str2double(initializedatastr{1});
intelligent = str2double(initializedatastr{2});
elapsedtime = zeros(1,cyclenumgoal);


while((cycledone ~= cyclenumgoal) && (collision{1} == 0))
    %valtozok nullazasa
    %lampaciklus es lampa valtasahoz(szamlalok)
    lampChange = 2;
    lampChangeCntr = 1;
    lampCycleChange = 13;
    row = 1;
    
    %autokhoz tartozo szamlalok
    carnum = 0;
    carnumarrived = 0;
    lampCycleChanged = 0;
    
    %torlodas felismeresehez es a tiltasok kezelesehez 3x1 esetben
    vantorlodas = 0;
    blockn2 = 0;
    blockw2 = 0;
    blocks2 = 0;
    blocke2 = 0;
    allow2 = 0;
    allow4 = 0;
    allow6 = 0;
    allow8 = 0;
    allow2x2 = 0;
    
    %savban levo autok szamolasahoz ha torlodas van
    nelorecntr = 1;
    nbalracntr = 1;
    welorecntr = 1;
    wbalracntr = 1;
    selorecntr = 1;
    sbalracntr = 1;
    eelorecntr = 1;
    ebalracntr = 1;
    
    %sarga lampa tartasahoz ha van belul valaki
    breakbool1 = 0;
    
    %autok generalasahoz
    generateNewCarRand = 0;
    whileLoopCounter = 0;
    
    %autok szamanak bekerese felhasznalotol
    prompt2 = {'Enter car number:','Enter cycle type:'};
    dlgtitle2 = 'Input';
    dims2 = [1 20];
    definput2 = {'100','1'};
    initializedatastr = inputdlg(prompt2,dlgtitle2,dims2,definput2);
    carnumgoal = str2double(initializedatastr{1});
    cycletype = str2double(initializedatastr{2});
    
    %uj lampaciklus kezelese
    lampaciklusnext = cycletype;
    lampaciklusaktualis = lampaciklusnext;
    
    %utkozes vizsgalat
    collision = cell(1,3); %[volt e utkozes, egyik auto, masik auto]
    collision{1} = 0;
    
    car = cell(1,carnumgoal);
    for i = 1:carnumgoal
        car{i} = cell(1,8); %[utvonal, plot, aktualis pozicio, maximum pozicio, vegcel, utvonalszam, canmove, finished]
        car{i}{8} = 0;
    end
    
    %idomeres elinditasa
    tic;
    
    while(carnumarrived ~= carnumgoal)        
        %% lampa kivetelek kezelese
        %kivetelek kezelese amik helyet 1-es jon
        if(lampaciklusaktualis == 3 && lampaciklusnext == 2)
            lampaciklusnext = 1;
        elseif(lampaciklusaktualis == 5 && lampaciklusnext == 4)
            lampaciklusnext = 1;
        elseif(lampaciklusaktualis == 7 && lampaciklusnext == 6)
            lampaciklusnext = 1;
        elseif(lampaciklusaktualis == 9 && lampaciklusnext == 8)
            lampaciklusnext = 1;
        elseif(lampaciklusaktualis == 2 && lampaciklusnext == 6)
            lampaciklusnext = 1;
        elseif(lampaciklusaktualis == 4 && lampaciklusnext == 8)
            lampaciklusnext = 1;
        elseif(lampaciklusaktualis == 6 && lampaciklusnext == 2)
            lampaciklusnext = 1;
        elseif(lampaciklusaktualis == 8 && lampaciklusnext == 4)
            lampaciklusnext = 1;
        end
        
        %blokkolasok beallitasa azonnal ha masik ciklust akarunk
        if(lampaciklusnext == 2 && lampaciklusaktualis ~= 2)
            blocks2 = 1;
        elseif(lampaciklusnext == 4 && lampaciklusaktualis ~= 4)
            blocke2 = 1;
        elseif(lampaciklusnext == 6 && lampaciklusaktualis ~= 6)
            blockn2 = 1;
        elseif(lampaciklusnext == 8 && lampaciklusaktualis ~= 8)
            blockw2 = 1;
        end
        
        %% autok
        % uj auto generalasa
        if(whileLoopCounter == 2)
            whileLoopCounter = 0;
            generateNewCarRand = randi([1 8]);
            for i = 1:generateNewCarRand
                if(carnum ~= carnumgoal)                    
                    addCar(); %hozzáadjuk a következo autót
                end
            end
        end
        
        %ujonnan hozaadott autok utvonalat frissiti a kovetkezo ciklusnak megfeleloen
        changeRouteDeploy();
        
        %minden auto alapbol tud lepni es majd a tovabbi vizsgalatok dontik el,
        %hogy valoban tud e
        for o = 1:carnum
            car{o}{7} = 1;
        end
               
        
        %hogyha valtozott a lampaciklus akkor frissitjuk az autok utvonalat
        if(lampCycleChanged == 1)
            lampCycleChanged = 0;
            changeRoute();
        end
        
        % ellenorzi hogy ha a lampa ele ert akkor mit mutat a lampa es a
        % szerint cselekszik
        for cars = 1:carnum
            if(car{cars}{8} == 0)
                if(car{cars}{3} < 13)
                    for lamps = 1:12
                        if(car{cars}{2}.XData == lampStop{lamps}(1) && car{cars}{2}.YData == lampStop{lamps}(2)) % ha a lampa elott vagyunk
                            checkLampStatus(cars, lamps); %tudjuk h melyik lampa elott vagyunk
                            break; %csak egy lampa elott lehetunk szoval a tobbire mar nem kell vizsgalni
                        end
                    end
                end
            end
        end
        
        %megvizsgaljuk, hogy lephetunk e
        for h = 1:carnum
            if(car{h}{8} == 0)
                checkSurrounding(h);
            end
        end
        
        
        %megnezzuk h lephetunk e es az alapjan hatarozzuk meg hogy mi tortenik
        for t = 1:carnum
            if((car{t}{3} == car{t}{4})) %vizsgaljuk h vegigert e
                if(car{t}{8} ~= 1)
                    carnumarrived = carnumarrived + 1;
                    car{t}{2}.Visible  = 'off';
                    car{t}{8} = 1;
                end
            else
                if(car{t}{7} == 1) %ha lephetunk
                    car{t}{3} = car{t}{3} + 1;
                    car{t}{2}.XData = car{t}{1}{car{t}{3}}(1); %ha lephetunk akkor frissitjuk a plotot egyebkent nem
                    car{t}{2}.YData = car{t}{1}{car{t}{3}}(2);
                else
                    car{t}{3} = car{t}{3};
                end
            end
        end
        
        %utkozes vizsgalata
        for q = 1:carnum
            for w = 1:carnum
                if(q ~= w)
                    if(isequal(car{q}{2}.XData, car{w}{2}.XData) && isequal(car{q}{2}.YData, car{w}{2}.YData) && isequal(car{q}{8}, 0) && isequal(car{w}{8}, 0))
                       collision{1} = 1;
                       collision{2} = q;
                       collision{3} = w;
                    end
                end
            end
        end
        lampChangeCntr = lampChangeCntr + 1;

        %% lampak
                
        %ha eleget lepett az auto resz valtjuk a lampat
        if(lampChange == lampChangeCntr)
            row = row + 1;
            lampChangeCntr = 1;
            
            % lampaciklust valtunk ha a vegere ertunk
            if(lampCycleChange == 13)
                lampCycleChange = 1;
                
                %kivetelek kezelese amik helyet 1-es jon
                if(lampaciklusaktualis == 3 && lampaciklusnext == 2)
                    lampaciklusnext = 1;
                elseif(lampaciklusaktualis == 5 && lampaciklusnext == 4)
                    lampaciklusnext = 1;
                elseif(lampaciklusaktualis == 7 && lampaciklusnext == 6)
                    lampaciklusnext = 1;
                elseif(lampaciklusaktualis == 9 && lampaciklusnext == 8)
                    lampaciklusnext = 1;
                elseif(lampaciklusaktualis == 2 && lampaciklusnext == 6)
                    lampaciklusnext = 1;
                elseif(lampaciklusaktualis == 4 && lampaciklusnext == 8)
                    lampaciklusnext = 1;
                elseif(lampaciklusaktualis == 6 && lampaciklusnext == 2)
                    lampaciklusnext = 1;
                elseif(lampaciklusaktualis == 8 && lampaciklusnext == 4)
                    lampaciklusnext = 1;
                end
                
                % itt vizsgaljuk h a 3X1 teljesulhet e
                if((lampaciklusnext == 2) || (lampaciklusnext == 4) || (lampaciklusnext == 6) || (lampaciklusnext == 8))
                    check3X1();
                end
                
                % itt vizsgaljuk h a 2x2 teljesulhet e
                if((lampaciklusnext == 1) || (lampaciklusnext == 3) || (lampaciklusnext == 4) || (lampaciklusnext == 7) || (lampaciklusnext == 9))
                    check2x2();
                end
                
                
                %feltetelek az uj lampaciklus valtasara
                if(lampaciklusnext == 2 && allow2 == 1)
                    lampaciklusaktualis = lampaciklusnext;
                    lampCycleChanged = 1;
                elseif(lampaciklusnext == 4 && allow4 == 1)
                    lampaciklusaktualis = lampaciklusnext;
                    lampCycleChanged = 1;
                elseif(lampaciklusnext == 6 && allow6 == 1)
                    lampaciklusaktualis = lampaciklusnext;
                    lampCycleChanged = 1;
                elseif(lampaciklusnext == 8 && allow8 == 1)
                    lampaciklusaktualis = lampaciklusnext;
                    lampCycleChanged = 1;
                elseif(((lampaciklusnext == 1) || (lampaciklusnext == 3) || (lampaciklusnext == 5) || (lampaciklusnext == 7) || (lampaciklusnext == 9)) && (allow2x2 == 1))
                    lampaciklusaktualis = lampaciklusnext;
                    lampCycleChanged = 1; %ha valtozik a ciklus jelezzuk autoknak hogy uj utvonalat vegyenek fel
                else
                    lampaciklusaktualis = lampaciklusaktualis;
                end
                
                %kivesszuk a megfelelo blokkolast jelzo bitet ha mar engedtuk
                %azt a ciklust
                if(lampaciklusaktualis == 2)
                    blocks2 = 0;
                elseif(lampaciklusaktualis == 4)
                    blocke2 = 0;
                elseif(lampaciklusaktualis == 6)
                    blockn2 = 0;
                elseif(lampaciklusaktualis == 8)
                    blockw2 = 0;
                end
                % a matrixot forgatjuk a torlodasnak megfeleloen (ciklus kezi allitasa gombokkal egyenlore)
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
                linestylechange(lampaciklusaktualis);
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
                lampChange = 2;
                for m = 1:carnum
                    for n = 1:16
                        if(car{m}{2}.XData == middlepos{n}(1) && car{m}{2}.YData == middlepos{n}(2))
                            breakbool1 = 1;
                            break
                        end
                    end
                    if(breakbool1 == 1)
                        row = row - 1;
                        lampCycleChange = lampCycleChange - 1;
                        breakbool1 = 0;
                        break
                    end
                end
                
            else
                lampChange = 5;
            end
            
            lampCycleChange = lampCycleChange + 1;
        end
        
        %utkozes kezeles
        if(isequal(collision{1}, 1))
            break;
        end
        pause(0.5);
        whileLoopCounter = whileLoopCounter + 1;
    end
    cycledone = cycledone + 1;
    elapsedtime(cycledone) = toc;
end
figure(2);
results = bar(elapsedtime);

function one()
global lampaciklusnext;
lampaciklusnext = 1;

end
function two()
global lampaciklusnext;
lampaciklusnext = 2;
end
function three()
global lampaciklusnext;
lampaciklusnext = 3;
end
function four()
global lampaciklusnext;
lampaciklusnext = 4;
end
function five()
global lampaciklusnext;
lampaciklusnext = 5;
end
function six()
global lampaciklusnext;
lampaciklusnext = 6;
end
function seven()
global lampaciklusnext;
lampaciklusnext = 7;
end
function eight()
global lampaciklusnext;
lampaciklusnext = 8;
end
function nine()
global lampaciklusnext;
lampaciklusnext = 9;
end