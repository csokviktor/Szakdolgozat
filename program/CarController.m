function CarController()

plotBIMAGE();

global routeMatrixBase;
global routeMatrixLeft;
global routeMatrixStraight;


global lampaciklus;
lampaciklus = 2;
car = cell(1,4);
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
car{3} = 1;
car{4} = 2;
while(1)
    
    %matrixok forgatasa
    if(car{3} == car{4} || start == 1)
        start = 0;
    switch lampaciklus
        case 1 %Nincs torlodas
            random = randi([1 48]);
            car{1} = routeMatrixBase{random};
            car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
            car{3} = 1;
            car{4} = length(car{1});
            
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
            
        case 3 %N-rol balra miatt
            random = randi([1 48]);
            car{1} = routeMatrixLeft{random};
            car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
            car{3} = 1;
            car{4} = length(car{1});
            
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
            
    end
    end
    
    
        car{2}.XData = car{1}{car{3}}(1);
        car{2}.YData = car{1}{car{3}}(2);
        car{3} = car{3} + 1;
        pause(0.1);
       if(car{3} == car{4})
           car{2}.Visible  = 'off';
       end

end
end