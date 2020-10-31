plotBIMAGE();
global lbl2;
global lbl3;
global lbl5;
global popUp;

%% utvonalhoz tartozo valtozok letrehozasa
% global routeMatrixBase;
% global routeMatrixLeft;
% global routeMatrixStraight;
% global endgoalsNL;
% global endgoalsFT2;
% global endgoalsFT4;
% global endgoalsFT6;
% global endgoalsFT8;
global ControllerMatrix;
global light;
global vantorlodas; %torlodas tipusanak felismeresehez
global lampaciklusaktualis;
global lampaciklusnext;
global lampaciklusnexttemp;

global cycleVerificationCntr;
global row;
global lampChange;

%3x1 esetben a szembesav tiltasahoz
global blockn2;
global blockw2;
global blocks2;
global blocke2;
global allow2;
global allow4;
global allow6;
global allow8;
global allow2x2;

%jarmuvek
global car;
global carnum;
global carnumadded;

%tulterheles
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;


%% lampakhoz tartozo valtozok
global jamBoolN;
global jamBoolW;
global jamBoolS;
global jamBoolE;


%kozep ellenorzesehez
middlepos = {[-60 60] [-20 60] [20 60] [60 60]...
    [-60 20] [-20 20] [20 20] [60 20]...
    [-60 -20] [-20 -20] [20 -20] [60 -20]...
    [-60 -60] [-20 -60] [20 -60] [60 -60]};


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
dims1 = [1 30];
definput1 = {'1','0'};
initializedatastr = inputdlg(prompt1,dlgtitle1,dims1,definput1);
cyclenumgoal = str2double(initializedatastr{1});
intelligent = str2double(initializedatastr{2});
elapsedtime = cell(1,cyclenumgoal);
for q = 1:cyclenumgoal
    elapsedtime{q} = cell(1,11);
    elapsedtime{q}{11} = 0;
end

while((cycledone ~= cyclenumgoal) && (collision{1} == 0))
    %valtozok nullazasa
    %lampaciklus es lampa valtasahoz(szamlalok)
    lampChange = 2;
    lampChangeCntr = 1;
    lampCycleChange = 9;
    row = 1;
    
    %autokhoz tartozo szamlalok
    carnum = 0;
    carnumadded = 0;
    carnumarrived = 0;
    lampCycleChanged = 0;
    
    %torlodas felismeresehez es a tiltasok/engedelyezesek kezelesehez
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
    
    jamBoolN = 0;
    jamBoolW = 0;
    jamBoolS = 0;
    jamBoolE = 0;
    
    %tulterheles kezelese
    overloadNTS = 0;
    overloadNTE = 0;
    overloadWTE = 0;
    overloadWTN = 0;
    overloadSTN = 0;
    overloadSTW = 0;
    overloadETW = 0;
    overloadETS = 0;
    nooverload = 1;
    
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
    dims2 = [1 30];
    definput2 = {'300','1'};
    initializedatastr = inputdlg(prompt2,dlgtitle2,dims2,definput2);
    carnumgoal = str2double(initializedatastr{1});
    cycletype = str2double(initializedatastr{2});
    %carnumgoal = 300;
    %cycletype = 1;
    
    if(cycledone == 5 || cycledone == 6 || cycledone == 7 || cycledone == 8 || cycledone == 9)
        olNTS();
        elapsedtime{cycledone+1}{2} = overloadNTS;
        elapsedtime{cycledone+1}{3} = overloadNTE;
        elapsedtime{cycledone+1}{4} = overloadWTE;
        elapsedtime{cycledone+1}{5} = overloadWTN;
        elapsedtime{cycledone+1}{6} = overloadSTN;
        elapsedtime{cycledone+1}{7} = overloadSTW;
        elapsedtime{cycledone+1}{8} = overloadETW;
        elapsedtime{cycledone+1}{9} = overloadETS;
        elapsedtime{cycledone+1}{10} = nooverload;
%         cycletype = 1;
    elseif(cycledone == 10 || cycledone == 11 || cycledone == 12 || cycledone == 13 || cycledone == 14)
        olNTE();
        elapsedtime{cycledone+1}{2} = overloadNTS;
        elapsedtime{cycledone+1}{3} = overloadNTE;
        elapsedtime{cycledone+1}{4} = overloadWTE;
        elapsedtime{cycledone+1}{5} = overloadWTN;
        elapsedtime{cycledone+1}{6} = overloadSTN;
        elapsedtime{cycledone+1}{7} = overloadSTW;
        elapsedtime{cycledone+1}{8} = overloadETW;
        elapsedtime{cycledone+1}{9} = overloadETS;
        elapsedtime{cycledone+1}{10} = nooverload;
%         cycletype = 3;
    elseif(cycledone == 15 || cycledone == 16 || cycledone == 17 || cycledone == 18 || cycledone == 19)
        olWTE();
        elapsedtime{cycledone+1}{2} = overloadNTS;
        elapsedtime{cycledone+1}{3} = overloadNTE;
        elapsedtime{cycledone+1}{4} = overloadWTE;
        elapsedtime{cycledone+1}{5} = overloadWTN;
        elapsedtime{cycledone+1}{6} = overloadSTN;
        elapsedtime{cycledone+1}{7} = overloadSTW;
        elapsedtime{cycledone+1}{8} = overloadETW;
        elapsedtime{cycledone+1}{9} = overloadETS;
        elapsedtime{cycledone+1}{10} = nooverload;
%         cycletype = 4;
    elseif(cycledone == 20 || cycledone == 21 || cycledone == 22 || cycledone == 23 || cycledone == 24)
        olWTN();
        elapsedtime{cycledone+1}{2} = overloadNTS;
        elapsedtime{cycledone+1}{3} = overloadNTE;
        elapsedtime{cycledone+1}{4} = overloadWTE;
        elapsedtime{cycledone+1}{5} = overloadWTN;
        elapsedtime{cycledone+1}{6} = overloadSTN;
        elapsedtime{cycledone+1}{7} = overloadSTW;
        elapsedtime{cycledone+1}{8} = overloadETW;
        elapsedtime{cycledone+1}{9} = overloadETS;
        elapsedtime{cycledone+1}{10} = nooverload;
%         cycletype = 5;
    elseif(cycledone == 25 || cycledone == 26 || cycledone == 27 || cycledone == 28 || cycledone == 29)
        olSTN();
        elapsedtime{cycledone+1}{2} = overloadNTS;
        elapsedtime{cycledone+1}{3} = overloadNTE;
        elapsedtime{cycledone+1}{4} = overloadWTE;
        elapsedtime{cycledone+1}{5} = overloadWTN;
        elapsedtime{cycledone+1}{6} = overloadSTN;
        elapsedtime{cycledone+1}{7} = overloadSTW;
        elapsedtime{cycledone+1}{8} = overloadETW;
        elapsedtime{cycledone+1}{9} = overloadETS;
        elapsedtime{cycledone+1}{10} = nooverload;
%         cycletype = 6;
    elseif(cycledone == 30 || cycledone == 31 || cycledone == 32 || cycledone == 33 || cycledone == 34)
        olSTW();
        elapsedtime{cycledone+1}{2} = overloadNTS;
        elapsedtime{cycledone+1}{3} = overloadNTE;
        elapsedtime{cycledone+1}{4} = overloadWTE;
        elapsedtime{cycledone+1}{5} = overloadWTN;
        elapsedtime{cycledone+1}{6} = overloadSTN;
        elapsedtime{cycledone+1}{7} = overloadSTW;
        elapsedtime{cycledone+1}{8} = overloadETW;
        elapsedtime{cycledone+1}{9} = overloadETS;
        elapsedtime{cycledone+1}{10} = nooverload;
%         cycletype = 7;
    elseif(cycledone == 35 || cycledone == 36 || cycledone == 37 || cycledone == 38 || cycledone == 39)
        olETW();
        elapsedtime{cycledone+1}{2} = overloadNTS;
        elapsedtime{cycledone+1}{3} = overloadNTE;
        elapsedtime{cycledone+1}{4} = overloadWTE;
        elapsedtime{cycledone+1}{5} = overloadWTN;
        elapsedtime{cycledone+1}{6} = overloadSTN;
        elapsedtime{cycledone+1}{7} = overloadSTW;
        elapsedtime{cycledone+1}{8} = overloadETW;
        elapsedtime{cycledone+1}{9} = overloadETS;
        elapsedtime{cycledone+1}{10} = nooverload;
%         cycletype = 8;
    elseif(cycledone == 40 || cycledone == 41 || cycledone == 42 || cycledone == 43 || cycledone == 44)
        olETS();
        elapsedtime{cycledone+1}{2} = overloadNTS;
        elapsedtime{cycledone+1}{3} = overloadNTE;
        elapsedtime{cycledone+1}{4} = overloadWTE;
        elapsedtime{cycledone+1}{5} = overloadWTN;
        elapsedtime{cycledone+1}{6} = overloadSTN;
        elapsedtime{cycledone+1}{7} = overloadSTW;
        elapsedtime{cycledone+1}{8} = overloadETW;
        elapsedtime{cycledone+1}{9} = overloadETS;
        elapsedtime{cycledone+1}{10} = nooverload;
%         cycletype = 9;
    end
    
    %uj lampaciklus kezelese
    cycleVerificationCntr = 0;
    lampaciklusnexttemp = [0 0];
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
    tStart = tic;
    
    while(carnumarrived ~= carnumgoal)
        %% set the text on the button group
        lbl2.String = "Current lamp cycle type: " + int2str(lampaciklusaktualis);
        lbl3.String = "Next lamp cycle type: " + int2str(lampaciklusnext);
        if(nooverload == 1)
            lbl5.String = "Overload type: " + newline + "No overload";
        elseif(overloadNTS == 1)
            lbl5.String = "Overload type: " + newline + "North to South";
        elseif(overloadNTE == 1)
            lbl5.String = "Overload type: " + newline + "North to East";
        elseif(overloadWTE == 1)
            lbl5.String = "Overload type: " + newline + "West to East";
        elseif(overloadWTN == 1)
            lbl5.String = "Overload type: " + newline + "West to North";
        elseif(overloadSTN == 1)
            lbl5.String = "Overload type: " + newline + "South to North";
        elseif(overloadSTW == 1)
            lbl5.String = "Overload type: " + newline + "South to West";
        elseif(overloadETW == 1)
            lbl5.String = "Overload type: " + newline + "East to West";
        elseif(overloadETS == 1)
            lbl5.String = "Overload type: " + newline + "East to South";
        end
        
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
            blockn2 = 0;
            blockw2 = 0;
            blocks2 = 1;
            blocke2 = 0;
        elseif(lampaciklusnext == 4 && lampaciklusaktualis ~= 4)
            blockn2 = 0;
            blockw2 = 0;
            blocks2 = 0;
            blocke2 = 1;
        elseif(lampaciklusnext == 6 && lampaciklusaktualis ~= 6)
            blockn2 = 1;
            blockw2 = 0;
            blocks2 = 0;
            blocke2 = 0;
        elseif(lampaciklusnext == 8 && lampaciklusaktualis ~= 8)
            blockn2 = 0;
            blockw2 = 1;
            blocks2 = 0;
            blocke2 = 0;
        end
        
        %% autok
        % uj auto generalasa
        if(whileLoopCounter == 3)
            whileLoopCounter = 0;
            generateNewCarRand = randi([1 popUp.Value]);
            for i = 1:generateNewCarRand
                if(carnumadded ~= carnumgoal)
                    addCar(); %hozzáadjuk a következo autót
                end
            end
        end
        
        %autok utvonalat frissiti a kovetkezo ciklusnak megfeleloen meg a
        %ciklus bevaltasa elott
        if(lampaciklusaktualis ~= lampaciklusnext)
            changeRouteSpecific();
        elseif(lampaciklusaktualis == lampaciklusnext) %utvonalak frissitese, hogy jobb pozicioba legyenek
            tStart2 = tic;
            changeLane();
            elapsedtime{cycledone+1}{11} = elapsedtime{cycledone+1}{11} + toc(tStart2);
        end
        
        
        %minden auto alapbol tud lepni es majd a tovabbi vizsgalatok dontik el,
        %hogy valoban tud e
        for o = 1:carnum
            car{o}{7} = 1;
        end
        
        
        %hogyha valtozott a lampaciklus akkor frissitjuk az autok utvonalat
        if(lampCycleChanged == 1)
            lampCycleChanged = 0;
            changeRouteAll();
        end
        

        checkLampStatus(); %tudjuk h melyik lampa elott vagyunk
        checkSurrounding();
        
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
        
        %kivesszuk azokat az autokat amig vegigertek, hogy ne legyenek
        %felesleges szamolasok
        if(carnum >= 1)
            torlescntr = 0;
            for e = 1:carnum
                if(car{e}{8} ~= 1)
                    torlescntr = torlescntr + 1;
                end
            end
            cartemp = cell(1, torlescntr);
            atmeneti = 0;
            for e = 1:carnum
                if(car{e}{8} ~= 1)
                    atmeneti = atmeneti + 1;
                    cartemp{atmeneti} = car{e};
                end
            end
            car = cartemp;
            carnum = torlescntr;
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
        
        %torlodas ellenorzese
        checkForTrafficJam();
        
        %ha eleget lepett az auto resz valtjuk a lampat
        if(lampChange == lampChangeCntr)
            row = row + 1;
            lampChangeCntr = 1;
            
            % lampaciklust valtunk ha a vegere ertunk
            if(lampCycleChange == 9)
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
                        row = 9;
                        TM = ControllerMatrix;
                    case 3 %N-rol balra miatt, 0 shift
                        row = 17;
                        TM = ControllerMatrix;
                    case 4 %W-rol elore miatt, 3 shift
                        row = 9;
                        TM = circshift(ControllerMatrix,3,2);
                    case 5 %W-rol balra miatt, 3 shift
                        row = 17;
                        TM = circshift(ControllerMatrix,3,2);
                    case 6 %S-rol elore miatt, 6 shift
                        row = 9;
                        TM = circshift(ControllerMatrix,6,2);
                    case 7 %S-rol balra miatt, 6 shift
                        row = 17;
                        TM = circshift(ControllerMatrix,6,2);
                    case 8 %E-rol elore miatt, 9 shift
                        row = 9;
                        TM = circshift(ControllerMatrix,9,2);
                    case 9 %E-rol balra miatt, 9 shift
                        row = 17;
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
            if(row == 2 || row == 4 || row == 6 || row == 8 || row == 10 || row == 12 || ...
                    row == 14 || row == 16 || row == 18 || row == 20 || row == 22 || row == 24)
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
                %TODO: lampChange valtoztatasa forgalomtol fuggoen
                changeMainLampCycleLength()
                disp(lampChange)
                valami = 1;
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
    elapsedtime{cycledone}{1} = toc(tStart);
end
% figure(2);
% results = bar(elapsedtime);