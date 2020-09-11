function addCar()
global lampaciklusaktualis;
global car;
global blockn2;
global blockw2;
global blocks2;
global blocke2;
global routeMatrixBase;
global routeMatrixLeft;
global routeMatrixStraight;
global endgoalsNL;
global endgoalsFT2;
global endgoalsFT4;
global endgoalsFT6;
global endgoalsFT8;
global carnum;

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

carnum = carnum + 1;
cantgenerate = 0;

switch lampaciklusaktualis
    case 1 %Nincs torlodas
        if(blockn2 == 1)
            random1 = randi([1 6]);
            random2 = randi([13 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blockw2 == 1)
            random1 = randi([1 18]);
            random2 = randi([25 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocks2 == 1)
            random1 = randi([1 30]);
            random2 = randi([37 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocke2 == 1)
            random = randi([1 42]);
        else
            random = randi([1 48]);
        end
        
        car{carnum}{1} = routeMatrixBase{random};
        %vizsgalat arra hogyha addig all a sor, hogy vegig er a savon akkor
        %oda mar ne generaljon uj autot
        if(carnum > 1)
            for j = 1:(carnum - 1)
                if(isequal(car{j}{2}.XData, car{carnum}{1}{1}(1)) && isequal(car{j}{2}.YData, car{carnum}{1}{1}(2)))
                    cantgenerate = 1;
                    break;
                end
            end
        end
        if(cantgenerate == 1) %toroljuk az autot(nem generalunk)
            car{carnum} = cell(1,8);
            car{carnum}{8} = 0;
            carnum = carnum - 1;
        else %legeneraljuk az autot
            car{carnum}{2} = plot(car{carnum}{1}{1}(1),car{carnum}{1}{1}(2),'s');
            car{carnum}{3} = 1;
            car{carnum}{4} = length(car{carnum}{1});
            car{carnum}{5} = endgoalsNL{random};
            car{carnum}{6} = random;
        end
%         car{1} = routeMatrixBase{random};
%         car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
%         car{3} = 0;
%         car{4} = length(car{1});
%         car{5} = endgoalsNL{random};
%         car{6} = random;
        
    case 2 %N-rol elore miatt
        if(blockn2 == 1)
            random1 = randi([1 6]);
            random2 = randi([13 30]);
            random3 = randi([36 48]);
            random4 = randi([1 3]);
            switch random4
                case 1
                    random = random1;
                case 2
                    random = random2;
                case 3
                    random = random3;
            end
        elseif(blockw2 == 1)
            random1 = randi([1 18]);
            random2 = randi([25 30]);
            random3 = randi([36 48]);
            random4 = randi([1 3]);
            switch random4
                case 1
                    random = random1;
                case 2
                    random = random2;
                case 3
                    random = random3;
            end
        elseif(blocks2 == 1)
            random1 = randi([1 30]);
            random2 = randi([37 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocke2 == 1)
            random1 = randi([1 30]);
            random2 = randi([37 42]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        else
            random1 = randi([1 30]);
            random2 = randi([37 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        end
        
        car{carnum}{1} = routeMatrixStraight{random};
        %vizsgalat arra hogyha addig all a sor, hogy vegig er a savon akkor
        %oda mar ne generaljon uj autot
        if(carnum > 1)
            for j = 1:carnum - 1
                if(isequal(car{j}{2}.XData, car{carnum}{1}{1}(1)) && isequal(car{j}{2}.YData, car{carnum}{1}{1}(2)))
                    cantgenerate = 1;
                    break;
                end
            end
        end
        if(cantgenerate == 1) %toroljuk az autot(nem generalunk)
            car{carnum} = cell(1,8);
            car{carnum}{8} = 0;
            carnum = carnum - 1;
        else %legeneraljuk az autot
            car{carnum}{2} = plot(car{carnum}{1}{1}(1),car{carnum}{1}{1}(2),'s');
            car{carnum}{3} = 1;
            car{carnum}{4} = length(car{carnum}{1});
            car{carnum}{5} = endgoalsFT2{random};
            car{carnum}{6} = random;
        end        
%         car{1} = routeMatrixStraight{random};
%         car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
%         car{3} = 1;
%         car{4} = length(car{1});
%         car{5} = endgoalsFT2{random};
%         car{6} = random;
        
    case 3 %N-rol balra miatt
        if(blockn2 == 1)
            random1 = randi([1 6]);
            random2 = randi([13 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blockw2 == 1)
            random1 = randi([1 18]);
            random2 = randi([25 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocks2 == 1)
            random1 = randi([1 30]);
            random2 = randi([37 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocke2 == 1)
            random = randi([1 42]);
        else
            random = randi([1 48]);
        end
        
        car{carnum}{1} = routeMatrixLeft{random};
        %vizsgalat arra hogyha addig all a sor, hogy vegig er a savon akkor
        %oda mar ne generaljon uj autot
        if(carnum > 1)
            for j = 1:carnum - 1
                if(isequal(car{j}{2}.XData, car{carnum}{1}{1}(1)) && isequal(car{j}{2}.YData, car{carnum}{1}{1}(2)))
                    cantgenerate = 1;
                    break;
                end
            end
        end
        if(cantgenerate == 1) %toroljuk az autot(nem generalunk)
            car{carnum} = cell(1,8);
            car{carnum}{8} = 0;
            carnum = carnum - 1;
        else %legeneraljuk az autot
            car{carnum}{2} = plot(car{carnum}{1}{1}(1),car{carnum}{1}{1}(2),'s');
            car{carnum}{3} = 1;
            car{carnum}{4} = length(car{carnum}{1});
            car{carnum}{5} = endgoalsNL{random};
            car{carnum}{6} = random;
        end        
%         car{1} = routeMatrixLeft{random};
%         car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
%         car{3} = 1;
%         car{4} = length(car{1});
%         car{5} = endgoalsNL{random};
%         car{6} = random;
        
    case 4 %W-rol elore miatt, forgatassal
        if(blockn2 == 1)
            random1 = randi([1 6]);
            random2 = randi([13 42]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blockw2 == 1)
            random1 = randi([1 18]);
            random2 = randi([25 42]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocks2 == 1)
            random1 = randi([1 30]);
            random2 = randi([37 42]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocke2 == 1)
            random = randi([1 42]);
        else
            random = randi([1 42]);
        end
        
        routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
        for i = 1:length(routeMatrixStraightTemp{random})
            temp = routeMatrixStraightTemp{random}{i}(1);
            routeMatrixStraightTemp{random}{i}(1) = -routeMatrixStraightTemp{random}{i}(2);
            routeMatrixStraightTemp{random}{i}(2) = temp;
        end
        
        car{carnum}{1} = routeMatrixStraightTemp{random};
        %vizsgalat arra hogyha addig all a sor, hogy vegig er a savon akkor
        %oda mar ne generaljon uj autot
        if(carnum > 1)
            for j = 1:carnum - 1
                if(isequal(car{j}{2}.XData, car{carnum}{1}{1}(1)) && isequal(car{j}{2}.YData, car{carnum}{1}{1}(2)))
                    cantgenerate = 1;
                    break;
                end
            end
        end
        if(cantgenerate == 1) %toroljuk az autot(nem generalunk)
            car{carnum} = cell(1,8);
            car{carnum}{8} = 0;
            carnum = carnum - 1;
        else %legeneraljuk az autot
            car{carnum}{2} = plot(car{carnum}{1}{1}(1),car{carnum}{1}{1}(2),'s');
            car{carnum}{3} = 1;
            car{carnum}{4} = length(car{carnum}{1});
            car{carnum}{5} = endgoalsFT4{random};
            car{carnum}{6} = random;
        end 
%         car{1} = routeMatrixStraightTemp{random};
%         car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
%         car{3} = 1;
%         car{4} = length(car{1});
%         car{5} = endgoalsFT4{random};
%         car{6} = random;
        
    case 5 %W-rol balra miatt, forgatas
        if(blockn2 == 1)
            random1 = randi([1 6]);
            random2 = randi([13 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blockw2 == 1)
            random1 = randi([1 18]);
            random2 = randi([25 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocks2 == 1)
            random1 = randi([1 30]);
            random2 = randi([37 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocke2 == 1)
            random = randi([1 42]);
        else
            random = randi([1 48]);
        end
        
        routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
        for i = 1:length(routeMatrixLeftTemp{random})
            temp = routeMatrixLeftTemp{random}{i}(1);
            routeMatrixLeftTemp{random}{i}(1) = -routeMatrixLeftTemp{random}{i}(2);
            routeMatrixLeftTemp{random}{i}(2) = temp;
        end
        
        car{carnum}{1} = routeMatrixLeftTemp{random};
        %vizsgalat arra hogyha addig all a sor, hogy vegig er a savon akkor
        %oda mar ne generaljon uj autot
        if(carnum > 1)
            for j = 1:carnum - 1
                if(isequal(car{j}{2}.XData, car{carnum}{1}{1}(1)) && isequal(car{j}{2}.YData, car{carnum}{1}{1}(2)))
                    cantgenerate = 1;
                    break;
                end
            end
        end
        if(cantgenerate == 1) %toroljuk az autot(nem generalunk)
            car{carnum} = cell(1,8);
            car{carnum}{8} = 0;
            carnum = carnum - 1;
        else %legeneraljuk az autot
            car{carnum}{2} = plot(car{carnum}{1}{1}(1),car{carnum}{1}{1}(2),'s');
            car{carnum}{3} = 1;
            car{carnum}{4} = length(car{carnum}{1});
            car{carnum}{5} = endgoalsNL{random};
            car{carnum}{6} = random;
        end
%         car{1} = routeMatrixLeftTemp{random};
%         car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
%         car{3} = 1;
%         car{4} = length(car{1});
%         car{5} = endgoalsNL{random};
%         car{6} = random;
        
    case 6 %S-rol elore miatt
        if(blockn2 == 1)
            random1 = randi([1 6]);
            random2 = randi([13 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blockw2 == 1)
            random1 = randi([1 6]);
            random2 = randi([13 18]);
            random3 = randi([25 48]);
            random4 = randi([1 3]);
            switch random4
                case 1
                    random = random1;
                case 2
                    random = random2;
                case 3
                    random = random3;
            end
        elseif(blocks2 == 1)
            random1 = randi([1 6]);
            random2 = randi([13 30]);
            random3 = randi([37 48]);
            random4 = randi([1 3]);
            switch random4
                case 1
                    random = random1;
                case 2
                    random = random2;
                case 3
                    random = random3;
            end
        elseif(blocke2 == 1)
            random1 = randi([1 6]);
            random2 = randi([13 42]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        else
            random1 = randi([1 6]);
            random2 = randi([13 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        end
        
        routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
        for i = 1:length(routeMatrixStraightTemp{random})
            routeMatrixStraightTemp{random}{i}(1) = -routeMatrixStraightTemp{random}{i}(1);
            routeMatrixStraightTemp{random}{i}(2) = -routeMatrixStraightTemp{random}{i}(2);
        end
        
        car{carnum}{1} = routeMatrixStraightTemp{random};
        %vizsgalat arra hogyha addig all a sor, hogy vegig er a savon akkor
        %oda mar ne generaljon uj autot
        if(carnum > 1)
            for j = 1:carnum - 1
                if(isequal(car{j}{2}.XData, car{carnum}{1}{1}(1)) && isequal(car{j}{2}.YData, car{carnum}{1}{1}(2)))
                    cantgenerate = 1;
                    break;
                end
            end
        end
        if(cantgenerate == 1) %toroljuk az autot(nem generalunk)
            car{carnum} = cell(1,8);
            car{carnum}{8} = 0;
            carnum = carnum - 1;
        else %legeneraljuk az autot
            car{carnum}{2} = plot(car{carnum}{1}{1}(1),car{carnum}{1}{1}(2),'s');
            car{carnum}{3} = 1;
            car{carnum}{4} = length(car{carnum}{1});
            car{carnum}{5} = endgoalsFT6{random};
            car{carnum}{6} = random;
        end
        
%         car{1} = routeMatrixStraightTemp{random};
%         car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
%         car{3} = 1;
%         car{4} = length(car{1});
%         car{5} = endgoalsFT6{random};
%         car{6} = random;
        
    case 7 %S-rol balra miatt, forgatas
        if(blockn2 == 1)
            random1 = randi([1 6]);
            random2 = randi([13 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blockw2 == 1)
            random1 = randi([1 18]);
            random2 = randi([25 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocks2 == 1)
            random1 = randi([1 30]);
            random2 = randi([37 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocke2 == 1)
            random = randi([1 42]);
        else
            random = randi([1 48]);
        end
        
        routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
        for i = 1:length(routeMatrixLeftTemp{random})
            routeMatrixLeftTemp{random}{i}(1) = -routeMatrixLeftTemp{random}{i}(1);
            routeMatrixLeftTemp{random}{i}(2) = -routeMatrixLeftTemp{random}{i}(2);
        end
        
        car{carnum}{1} = routeMatrixLeftTemp{random};
        %vizsgalat arra hogyha addig all a sor, hogy vegig er a savon akkor
        %oda mar ne generaljon uj autot
        if(carnum > 1)
            for j = 1:carnum - 1
                if(isequal(car{j}{2}.XData, car{carnum}{1}{1}(1)) && isequal(car{j}{2}.YData, car{carnum}{1}{1}(2)))
                    cantgenerate = 1;
                    break;
                end
            end
        end
        if(cantgenerate == 1) %toroljuk az autot(nem generalunk)
            car{carnum} = cell(1,8);
            car{carnum}{8} = 0;
            carnum = carnum - 1;
        else %legeneraljuk az autot
            car{carnum}{2} = plot(car{carnum}{1}{1}(1),car{carnum}{1}{1}(2),'s');
            car{carnum}{3} = 1;
            car{carnum}{4} = length(car{carnum}{1});
            car{carnum}{5} = endgoalsNL{random};
            car{carnum}{6} = random;
        end
        
%         car{1} = routeMatrixLeftTemp{random};
%         car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
%         car{3} = 1;
%         car{4} = length(car{1});
%         car{5} = endgoalsNL{random};
%         car{6} = random;
        
    case 8 %E-rol elore miatt
        if(blockn2 == 1)
            random1 = randi([1 6]);
            random2 = randi([13 18]);
            random3 = randi([25 48]);
            random4 = randi([1 3]);
            switch random4
                case 1
                    random = random1;
                case 2
                    random = random2;
                case 3
                    random = random3;
            end
        elseif(blockw2 == 1)
            random1 = randi([1 18]);
            random2 = randi([25 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocks2 == 1)
            random1 = randi([1 18]);
            random2 = randi([25 30]);
            random3 = randi([37 48]);
            random4 = randi([1 3]);
            switch random4
                case 1
                    random = random1;
                case 2
                    random = random2;
                case 3
                    random = random3;
            end
        elseif(blocke2 == 1)
            random1 = randi([1 18]);
            random2 = randi([25 42]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        else
            random1 = randi([1 18]);
            random2 = randi([25 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        end
        
        routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
        for i = 1:length(routeMatrixStraightTemp{random})
            temp = -routeMatrixStraightTemp{random}{i}(1);
            routeMatrixStraightTemp{random}{i}(1) = routeMatrixStraightTemp{random}{i}(2);
            routeMatrixStraightTemp{random}{i}(2) = temp;
        end
        
        car{carnum}{1} = routeMatrixStraightTemp{random};
        %vizsgalat arra hogyha addig all a sor, hogy vegig er a savon akkor
        %oda mar ne generaljon uj autot
        if(carnum > 1)
            for j = 1:carnum - 1
                if(isequal(car{j}{2}.XData, car{carnum}{1}{1}(1)) && isequal(car{j}{2}.YData, car{carnum}{1}{1}(2)))
                    cantgenerate = 1;
                    break;
                end
            end
        end
        if(cantgenerate == 1) %toroljuk az autot(nem generalunk)
            car{carnum} = cell(1,8);
            car{carnum}{8} = 0;
            carnum = carnum - 1;
        else %legeneraljuk az autot
            car{carnum}{2} = plot(car{carnum}{1}{1}(1),car{carnum}{1}{1}(2),'s');
            car{carnum}{3} = 1;
            car{carnum}{4} = length(car{carnum}{1});
            car{carnum}{5} = endgoalsFT8{random};
            car{carnum}{6} = random;
        end
        
%         car{1} = routeMatrixStraightTemp{random};
%         car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
%         car{3} = 1;
%         car{4} = length(car{1});
%         car{5} = endgoalsFT8{random};
%         car{6} = random;
        
    case 9 %E-rol balra miatt, forgatas
        if(blockn2 == 1)
            random1 = randi([1 6]);
            random2 = randi([13 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blockw2 == 1)
            random1 = randi([1 18]);
            random2 = randi([25 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocks2 == 1)
            random1 = randi([1 30]);
            random2 = randi([37 48]);
            random3 = randi([1 2]);
            switch random3
                case 1
                    random = random1;
                case 2
                    random = random2;
            end
        elseif(blocke2 == 1)
            random = randi([1 42]);
        else
            random = randi([1 48]);
        end
        
        routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
        for i = 1:length(routeMatrixLeftTemp{random})
            temp = -routeMatrixLeftTemp{random}{i}(1);
            routeMatrixLeftTemp{random}{i}(1) = routeMatrixLeftTemp{random}{i}(2);
            routeMatrixLeftTemp{random}{i}(2) = temp;
        end
        
        routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
        for i = 1:length(routeMatrixStraightTemp{random})
            temp = -routeMatrixStraightTemp{random}{i}(1);
            routeMatrixStraightTemp{random}{i}(1) = routeMatrixStraightTemp{random}{i}(2);
            routeMatrixStraightTemp{random}{i}(2) = temp;
        end
        
        car{carnum}{1} = routeMatrixLeftTemp{random};
        %vizsgalat arra hogyha addig all a sor, hogy vegig er a savon akkor
        %oda mar ne generaljon uj autot
        if(carnum > 1)
            for j = 1:carnum - 1
                if(isequal(car{j}{2}.XData, car{carnum}{1}{1}(1)) && isequal(car{j}{2}.YData, car{carnum}{1}{1}(2)))
                    cantgenerate = 1;
                    break;
                end
            end
        end
        if(cantgenerate == 1) %toroljuk az autot(nem generalunk)
            car{carnum} = cell(1,8);
            car{carnum}{8} = 0;
            carnum = carnum - 1;
        else %legeneraljuk az autot
            car{carnum}{2} = plot(car{carnum}{1}{1}(1),car{carnum}{1}{1}(2),'s');
            car{carnum}{3} = 1;
            car{carnum}{4} = length(car{carnum}{1});
            car{carnum}{5} = endgoalsNL{random};
            car{carnum}{6} = random;
        end
        
%         car{1} = routeMatrixLeftTemp{random};
%         car{2} = plot(car{1}{1}(1),car{1}{1}(2),'s');
%         car{3} = 1;
%         car{4} = length(car{1});
%         car{5} = endgoalsNL{random};
%         car{6} = random;
end

if(cantgenerate == 0)
%kulonbozo szinek a kulonbozo iranyba menoknek
if(car{carnum}{5} == N2 || car{carnum}{5} == N3 || car{carnum}{5} == N4)
    car{carnum}{2}.MarkerFaceColor = 'blue';
    car{carnum}{2}.MarkerEdgeColor = 'blue';
elseif(car{carnum}{5} == W2 || car{carnum}{5} == W3 || car{carnum}{5} == W4)
    car{carnum}{2}.MarkerFaceColor = 'magenta';
    car{carnum}{2}.MarkerEdgeColor = 'magenta';
elseif(car{carnum}{5} == S2 || car{carnum}{5} == S3 || car{carnum}{5} == S4)
    car{carnum}{2}.MarkerFaceColor = 'cyan';
    car{carnum}{2}.MarkerEdgeColor = 'cyan';
elseif(car{carnum}{5} == E2 || car{carnum}{5} == E3 || car{carnum}{5} == E4)
    car{carnum}{2}.MarkerFaceColor = 'black';
    car{carnum}{2}.MarkerEdgeColor = 'black';
end
elseif(cantgenerate == 1)
    cantgenerate = 0;
end

end