function changeLane()
global lampaciklusaktualis;
global car;
global carnum;

global routeMatrixBase;
global routeMatrixLeft;
global routeMatrixStraight;
global endgoalsNL;
global endgoalsFT2;
global endgoalsFT4;
global endgoalsFT6;
global endgoalsFT8;

global nlane1;
global nlane2;
global nlane3;
global wlane1;
global wlane2;
global wlane3;
global slane1;
global slane2;
global slane3;
global elane1;
global elane2;
global elane3;

global light;

N2 = sym('N2');
N3 = sym('N3');
N4 = sym('N4');
W2 = sym('W2');
W3 = sym('W3');
W4 = sym('W4');
S2 = sym('S2');
S3 = sym('S3');
S4 = sym('S4');
E2 = sym('E2');
E3 = sym('E3');
E4 = sym('E4');

X7 = sym('X7');
X5 = sym('X5');

if(isequal(light{3}{5}, X7) || isequal(light{6}{5}, X7) || isequal(light{9}{5}, X7) || isequal(light{12}{5}, X7) || isequal(light{2}{5}, X5) || isequal(light{5}{5}, X5) || isequal(light{8}{5}, X5) || isequal(light{11}{5}, X5))
    range = 5;
else
    range = 10;
end

switch lampaciklusaktualis
    case 1
        for i = 1:carnum %minden autora
            for k = 1:range %poziciokra
                if(isequal(car{i}{2}.XData, nlane1{k}(1)) && isequal(car{i}{2}.YData, nlane1{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                car{i}{1} = routeMatrixBase{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{10};
                                car{i}{6} = 10;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                car{i}{1} = routeMatrixBase{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{3};
                                car{i}{6} = 3;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, nlane2{k}(1)) && isequal(car{i}{2}.YData, nlane2{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                car{i}{1} = routeMatrixBase{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{3};
                                car{i}{6} = 3;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                car{i}{1} = routeMatrixBase{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{10};
                                car{i}{6} = 10;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, wlane1{k}(1)) && isequal(car{i}{2}.YData, wlane1{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                car{i}{1} = routeMatrixBase{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{22};
                                car{i}{6} = 22;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                car{i}{1} = routeMatrixBase{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{15};
                                car{i}{6} = 15;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, wlane2{k}(1)) && isequal(car{i}{2}.YData, wlane2{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                car{i}{1} = routeMatrixBase{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{15};
                                car{i}{6} = 15;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                car{i}{1} = routeMatrixBase{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{22};
                                car{i}{6} = 22;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, slane1{k}(1)) && isequal(car{i}{2}.YData, slane1{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                car{i}{1} = routeMatrixBase{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{34};
                                car{i}{6} = 34;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                car{i}{1} = routeMatrixBase{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{27};
                                car{i}{6} = 27;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, slane2{k}(1)) && isequal(car{i}{2}.YData, slane2{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                car{i}{1} = routeMatrixBase{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{27};
                                car{i}{6} = 27;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                car{i}{1} = routeMatrixBase{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{34};
                                car{i}{6} = 34;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, elane1{k}(1)) && isequal(car{i}{2}.YData, elane1{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                car{i}{1} = routeMatrixBase{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{46};
                                car{i}{6} = 46;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                car{i}{1} = routeMatrixBase{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{39};
                                car{i}{6} = 39;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, elane2{k}(1)) && isequal(car{i}{2}.YData, elane2{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                car{i}{1} = routeMatrixBase{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{39};
                                car{i}{6} = 39;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                car{i}{1} = routeMatrixBase{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{46};
                                car{i}{6} = 46;
                                break;
                            end
                        end
                    end
                end
            end
        end
    case 2
        for i = 1:carnum %minden autora
            for k = 1:range %poziciokra
                if(isequal(car{i}{2}.XData, nlane1{k}(1)) && isequal(car{i}{2}.YData, nlane1{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                car{i}{1} = routeMatrixStraight{9};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{9};
                                car{i}{6} = 9;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                car{i}{1} = routeMatrixStraight{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{3};
                                car{i}{6} = 3;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, nlane2{k}(1)) && isequal(car{i}{2}.YData, nlane2{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %kozepso sav itt 2 iranyba is valthat
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %elore menne es kovi pozija foglalt
                            canchangeto1 = 1; % elore inicializalas
                            canchangeto3 = 1;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re vizsgalat)
                                    %nem valt savot
                                    canchangeto1 = 0;
                                elseif(canchangeto1 ~= 0)
                                    canchangeto1 = 1;
                                end
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane3{k+1}(1)) && isequal(car{y}{2}.YData, nlane3{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n3-ra vizsgalat)
                                    %nem valt savot
                                    canchangeto3 = 0;
                                elseif(canchangeto3 ~= 0)
                                    canchangeto3 = 1;
                                end
                            end
                            %valtunk savot ha lehet es break a j-s ciklusbol
                            if(canchangeto3 == 1) %atrakjuk n3-re
                                car{i}{1} = routeMatrixStraight{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{10};
                                car{i}{6} = 10;
                                break;
                            elseif(canchangeto1 == 1) %atrakjuk n1-ra
                                car{i}{1} = routeMatrixStraight{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{3};
                                car{i}{6} = 3;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %savot valtana es kovi pozija foglalt
                            canchangeto2 = 1; % elore inicializalas
                            canchangeto3 = 1;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re vizsgalat)
                                    %nem valt savot
                                    canchangeto2 = 0;
                                elseif(canchangeto2 ~= 0)
                                    canchangeto2 = 1;
                                end
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane3{k+1}(1)) && isequal(car{y}{2}.YData, nlane3{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n3-ra vizsgalat)
                                    %nem valt savot
                                    canchangeto3 = 0;
                                elseif(canchangeto3 ~= 0)
                                    canchangeto3 = 1;
                                end
                            end
                            %valtunk savot ha lehet es break a j-s ciklusbol
                            if(canchangeto3 == 1) %atrakjuk n3-re
                                car{i}{1} = routeMatrixStraight{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{10};
                                car{i}{6} = 10;
                                break;
                            elseif(canchangeto2 == 1) %atrakjuk n2-ra
                                car{i}{1} = routeMatrixStraight{9};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{9};
                                car{i}{6} = 9;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %savot valtana es kovi pozija foglalt
                            canchangeto1 = 1; % elore inicializalas
                            canchangeto2 = 1;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchangeto1 = 0;
                                elseif(canchangeto1 ~= 0)
                                    canchangeto1 = 1;
                                end
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-ra vizsgalat)
                                    %nem valt savot
                                    canchangeto2 = 0;
                                elseif(canchangeto2 ~= 0)
                                    canchangeto2 = 1;
                                end
                            end
                            if(canchangeto1 == 1) %atrakjuk n1-re IF SORRENDET ATGONDOLNI
                                car{i}{1} = routeMatrixStraight{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{3};
                                car{i}{6} = 3;
                                break;
                            elseif(canchangeto2 == 1) %hagyjuk n2-n
                                car{i}{1} = routeMatrixStraight{9};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{9};
                                car{i}{6} = 9;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, nlane3{k}(1)) && isequal(car{i}{2}.YData, nlane3{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %harmadik savon van, csak elore mehet
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                car{i}{1} = routeMatrixStraight{9};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{9};
                                car{i}{6} = 9;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane3{k+1}(1)) && isequal(car{y}{2}.YData, nlane3{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n3-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %hagyjuk n3-en
                                car{i}{1} = routeMatrixStraight{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{10};
                                car{i}{6} = 10;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, wlane1{k}(1)) && isequal(car{i}{2}.YData, wlane1{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                car{i}{1} = routeMatrixStraight{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{22};
                                car{i}{6} = 22;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                car{i}{1} = routeMatrixStraight{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{15};
                                car{i}{6} = 15;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, wlane2{k}(1)) && isequal(car{i}{2}.YData, wlane2{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                car{i}{1} = routeMatrixStraight{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{15};
                                car{i}{6} = 15;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                car{i}{1} = routeMatrixStraight{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{22};
                                car{i}{6} = 22;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, elane1{k}(1)) && isequal(car{i}{2}.YData, elane1{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                car{i}{1} = routeMatrixStraight{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{46};
                                car{i}{6} = 46;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                car{i}{1} = routeMatrixStraight{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{39};
                                car{i}{6} = 39;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, elane2{k}(1)) && isequal(car{i}{2}.YData, elane2{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                car{i}{1} = routeMatrixStraight{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{39};
                                car{i}{6} = 39;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                car{i}{1} = routeMatrixStraight{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT2{46};
                                car{i}{6} = 46;
                                break;
                            end
                        end
                    end
                end
            end
        end
    case 3
        for i = 1:carnum %minden autora
            for k = 1:range %poziciokra
                if(isequal(car{i}{2}.XData, nlane1{k}(1)) && isequal(car{i}{2}.YData, nlane1{k}(2)) && ( isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %megvizsgaljuk, hogy az adott savon van e es balra akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                car{i}{1} = routeMatrixLeft{12};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{12};
                                car{i}{6} = 12;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                car{i}{1} = routeMatrixLeft{5};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{5};
                                car{i}{6} = 5;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, nlane2{k}(1)) && isequal(car{i}{2}.YData, nlane2{k}(2)) && (isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %belso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0; % elore inicializalas
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re vizsgalat)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-ra
                                car{i}{1} = routeMatrixLeft{5};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{5};
                                car{i}{6} = 5;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0; % elore inicializalas
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            %valtunk savot ha lehet es break a j-s ciklusbol
                            if(canchange == 1) %atrakjuk n2-ra
                                car{i}{1} = routeMatrixLeft{12};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{12};
                                car{i}{6} = 12;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, wlane1{k}(1)) && isequal(car{i}{2}.YData, wlane1{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                car{i}{1} = routeMatrixLeft{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{22};
                                car{i}{6} = 22;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                car{i}{1} = routeMatrixLeft{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{15};
                                car{i}{6} = 15;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, wlane2{k}(1)) && isequal(car{i}{2}.YData, wlane2{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                car{i}{1} = routeMatrixLeft{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{15};
                                car{i}{6} = 15;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                car{i}{1} = routeMatrixLeft{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{22};
                                car{i}{6} = 22;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    elseif(isequal(car{i}{2}.XData, slane1{k}(1)) && isequal(car{i}{2}.YData, slane1{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                car{i}{1} = routeMatrixLeft{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{34};
                                car{i}{6} = 34;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                car{i}{1} = routeMatrixLeft{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{27};
                                car{i}{6} = 27;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, slane2{k}(1)) && isequal(car{i}{2}.YData, slane2{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                car{i}{1} = routeMatrixLeft{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{27};
                                car{i}{6} = 27;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                car{i}{1} = routeMatrixLeft{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{34};
                                car{i}{6} = 34;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, elane1{k}(1)) && isequal(car{i}{2}.YData, elane1{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                car{i}{1} = routeMatrixLeft{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{46};
                                car{i}{6} = 46;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                car{i}{1} = routeMatrixLeft{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{39};
                                car{i}{6} = 39;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, elane2{k}(1)) && isequal(car{i}{2}.YData, elane2{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                car{i}{1} = routeMatrixLeft{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{39};
                                car{i}{6} = 39;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                car{i}{1} = routeMatrixLeft{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{46};
                                car{i}{6} = 46;
                                break;
                            end
                        end
                    end
                end
            end
        end
    case 4
        for i = 1:carnum
            for k = 1:range %poziciokra
                if(isequal(car{i}{2}.XData, nlane1{k}(1)) && isequal(car{i}{2}.YData, nlane1{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{10})
                                    temp = routeMatrixStraightTemp{10}{h}(1);
                                    routeMatrixStraightTemp{10}{h}(1) = -routeMatrixStraightTemp{10}{h}(2);
                                    routeMatrixStraightTemp{10}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{10};
                                car{i}{6} = 10;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{3})
                                    temp = routeMatrixStraightTemp{3}{h}(1);
                                    routeMatrixStraightTemp{3}{h}(1) = -routeMatrixStraightTemp{3}{h}(2);
                                    routeMatrixStraightTemp{3}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{3};
                                car{i}{6} = 3;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, nlane2{k}(1)) && isequal(car{i}{2}.YData, nlane2{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{3})
                                    temp = routeMatrixStraightTemp{3}{h}(1);
                                    routeMatrixStraightTemp{3}{h}(1) = -routeMatrixStraightTemp{3}{h}(2);
                                    routeMatrixStraightTemp{3}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{3};
                                car{i}{6} = 3;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{10})
                                    temp = routeMatrixStraightTemp{10}{h}(1);
                                    routeMatrixStraightTemp{10}{h}(1) = -routeMatrixStraightTemp{10}{h}(2);
                                    routeMatrixStraightTemp{10}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{10};
                                car{i}{6} = 10;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, wlane1{k}(1)) && isequal(car{i}{2}.YData, wlane1{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(w2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk w2-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{21})
                                    temp = routeMatrixStraightTemp{21}{h}(1);
                                    routeMatrixStraightTemp{21}{h}(1) = -routeMatrixStraightTemp{21}{h}(2);
                                    routeMatrixStraightTemp{21}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{21};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{21};
                                car{i}{6} = 21;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(w1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %hagyjuk n1-en
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{15})
                                    temp = routeMatrixStraightTemp{15}{h}(1);
                                    routeMatrixStraightTemp{15}{h}(1) = -routeMatrixStraightTemp{15}{h}(2);
                                    routeMatrixStraightTemp{15}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{15};
                                car{i}{6} = 15;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, wlane2{k}(1)) && isequal(car{i}{2}.YData, wlane2{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %kozepso sav itt 2 iranyba is valthat
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %elore menne es kovi pozija foglalt
                            canchangeto1 = 1;
                            canchangeto3 = 1;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(w1-re vizsgalat)
                                    %nem valt savot
                                    canchangeto1 = 0;
                                elseif(canchangeto1 ~= 0)
                                    canchangeto1 = 1;
                                end
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane3{k+1}(1)) && isequal(car{y}{2}.YData, wlane3{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(w3-ra vizsgalat)
                                    %nem valt savot
                                    canchangeto3 = 0;
                                elseif(canchangeto3 ~= 0)
                                    canchangeto3 = 1;
                                end
                            end
                            %valtunk savot ha lehet es break a j-s ciklusbol
                            if(canchangeto3 == 1) %atrakjuk w3-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{22})
                                    temp = routeMatrixStraightTemp{22}{h}(1);
                                    routeMatrixStraightTemp{22}{h}(1) = -routeMatrixStraightTemp{22}{h}(2);
                                    routeMatrixStraightTemp{22}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{22};
                                car{i}{6} = 22;
                                break;
                            elseif(canchangeto1 == 1) %atrakjuk w1-ra
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{15})
                                    temp = routeMatrixStraightTemp{15}{h}(1);
                                    routeMatrixStraightTemp{15}{h}(1) = -routeMatrixStraightTemp{15}{h}(2);
                                    routeMatrixStraightTemp{15}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{15};
                                car{i}{6} = 15;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %savot valtana es kovi pozija foglalt
                            canchangeto2 = 1; % elore inicializalas
                            canchangeto3 = 1;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re vizsgalat)
                                    %nem valt savot
                                    canchangeto2 = 0;
                                elseif(canchangeto2 ~= 0)
                                    canchangeto2 = 1;
                                end
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane3{k+1}(1)) && isequal(car{y}{2}.YData, wlane3{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n3-ra vizsgalat)
                                    %nem valt savot
                                    canchangeto3 = 0;
                                elseif(canchangeto3 ~= 0)
                                    canchangeto3 = 1;
                                end
                            end
                            %valtunk savot ha lehet es break a j-s ciklusbol
                            if(canchangeto3 == 1) %atrakjuk w3-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{22})
                                    temp = routeMatrixStraightTemp{22}{h}(1);
                                    routeMatrixStraightTemp{22}{h}(1) = -routeMatrixStraightTemp{22}{h}(2);
                                    routeMatrixStraightTemp{22}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{22};
                                car{i}{6} = 22;
                                break;
                            elseif(canchangeto2 == 1) %atrakjuk w2-ra
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{21})
                                    temp = routeMatrixStraightTemp{21}{h}(1);
                                    routeMatrixStraightTemp{21}{h}(1) = -routeMatrixStraightTemp{21}{h}(2);
                                    routeMatrixStraightTemp{21}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{21};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{21};
                                car{i}{6} = 21;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %savot valtana es kovi pozija foglalt (csak a 3. savba valthat a 2.bol)
                            canchangeto1 = 1;
                            canchangeto2 = 1;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(w1-re kell vizsgalni)
                                    %nem valt savot
                                    canchangeto1 = 0;
                                elseif(canchangeto1 ~= 0)
                                    canchangeto1 = 1;
                                end
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(w2-ra vizsgalat)
                                    %nem valt savot
                                    canchangeto2 = 0;
                                elseif(canchangeto2 ~= 0)
                                    canchangeto2 = 1;
                                end
                            end
                            if(canchangeto1 == 1) %atrakjuk w1-re IF SORRENDET ATGONDOLNI
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{15})
                                    temp = routeMatrixStraightTemp{15}{h}(1);
                                    routeMatrixStraightTemp{15}{h}(1) = -routeMatrixStraightTemp{15}{h}(2);
                                    routeMatrixStraightTemp{15}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{15};
                                car{i}{6} = 15;
                                break;
                            elseif(canchangeto2 == 1) %hagyjuk w2-n
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{21})
                                    temp = routeMatrixStraightTemp{21}{h}(1);
                                    routeMatrixStraightTemp{21}{h}(1) = -routeMatrixStraightTemp{21}{h}(2);
                                    routeMatrixStraightTemp{21}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{21};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{21};
                                car{i}{6} = 21;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, wlane3{k}(1)) && isequal(car{i}{2}.YData, wlane3{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %harmadik savon van, csak elore mehet
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk w2-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{21})
                                    temp = routeMatrixStraightTemp{21}{h}(1);
                                    routeMatrixStraightTemp{21}{h}(1) = -routeMatrixStraightTemp{21}{h}(2);
                                    routeMatrixStraightTemp{21}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{21};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{21};
                                car{i}{6} = 21;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane3{k+1}(1)) && isequal(car{y}{2}.YData, wlane3{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n3-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %hagyjuk w3-en
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{22})
                                    temp = routeMatrixStraightTemp{22}{h}(1);
                                    routeMatrixStraightTemp{22}{h}(1) = -routeMatrixStraightTemp{22}{h}(2);
                                    routeMatrixStraightTemp{22}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{22};
                                car{i}{6} = 22;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, slane1{k}(1)) && isequal(car{i}{2}.YData, slane1{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{34})
                                    temp = routeMatrixStraightTemp{34}{h}(1);
                                    routeMatrixStraightTemp{34}{h}(1) = -routeMatrixStraightTemp{34}{h}(2);
                                    routeMatrixStraightTemp{34}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{34};
                                car{i}{6} = 34;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{27})
                                    temp = routeMatrixStraightTemp{27}{h}(1);
                                    routeMatrixStraightTemp{27}{h}(1) = -routeMatrixStraightTemp{27}{h}(2);
                                    routeMatrixStraightTemp{27}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{27};
                                car{i}{6} = 27;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, slane2{k}(1)) && isequal(car{i}{2}.YData, slane2{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{27})
                                    temp = routeMatrixStraightTemp{27}{h}(1);
                                    routeMatrixStraightTemp{27}{h}(1) = -routeMatrixStraightTemp{27}{h}(2);
                                    routeMatrixStraightTemp{27}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{27};
                                car{i}{6} = 27;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                                for h = 1:length(routeMatrixStraightTemp{34})
                                    temp = routeMatrixStraightTemp{34}{h}(1);
                                    routeMatrixStraightTemp{34}{h}(1) = -routeMatrixStraightTemp{34}{h}(2);
                                    routeMatrixStraightTemp{34}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT4{34};
                                car{i}{6} = 34;
                                break;
                            end
                        end
                    end
                end
            end
        end
    case 5
        for i = 1:carnum %minden autora
            for k = 1:range %poziciokra
                if(isequal(car{i}{2}.XData, nlane1{k}(1)) && isequal(car{i}{2}.YData, nlane1{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{10})
                                    temp = routeMatrixLeftTemp{10}{h}(1);
                                    routeMatrixLeftTemp{10}{h}(1) = -routeMatrixLeftTemp{10}{h}(2);
                                    routeMatrixLeftTemp{10}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{10};
                                car{i}{6} = 10;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{3})
                                    temp = routeMatrixLeftTemp{3}{h}(1);
                                    routeMatrixLeftTemp{3}{h}(1) = -routeMatrixLeftTemp{3}{h}(2);
                                    routeMatrixLeftTemp{3}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{3};
                                car{i}{6} = 3;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, nlane2{k}(1)) && isequal(car{i}{2}.YData, nlane2{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{3})
                                    temp = routeMatrixLeftTemp{3}{h}(1);
                                    routeMatrixLeftTemp{3}{h}(1) = -routeMatrixLeftTemp{3}{h}(2);
                                    routeMatrixLeftTemp{3}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{3};
                                car{i}{6} = 3;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{10})
                                    temp = routeMatrixLeftTemp{10}{h}(1);
                                    routeMatrixLeftTemp{10}{h}(1) = -routeMatrixLeftTemp{10}{h}(2);
                                    routeMatrixLeftTemp{10}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{10};
                                car{i}{6} = 10;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, wlane1{k}(1)) && isequal(car{i}{2}.YData, wlane1{k}(2)) && ( isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %megvizsgaljuk, hogy az adott savon van e es balra akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{24})
                                    temp = routeMatrixLeftTemp{24}{h}(1);
                                    routeMatrixLeftTemp{24}{h}(1) = -routeMatrixLeftTemp{24}{h}(2);
                                    routeMatrixLeftTemp{24}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{24};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{24};
                                car{i}{6} = 24;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{17})
                                    temp = routeMatrixLeftTemp{17}{h}(1);
                                    routeMatrixLeftTemp{17}{h}(1) = -routeMatrixLeftTemp{17}{h}(2);
                                    routeMatrixLeftTemp{17}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{17};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{17};
                                car{i}{6} = 17;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, wlane2{k}(1)) && isequal(car{i}{2}.YData, wlane2{k}(2)) && (isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %belso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0; % elore inicializalas
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re vizsgalat)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-ra
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{17})
                                    temp = routeMatrixLeftTemp{17}{h}(1);
                                    routeMatrixLeftTemp{17}{h}(1) = -routeMatrixLeftTemp{17}{h}(2);
                                    routeMatrixLeftTemp{17}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{17};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{17};
                                car{i}{6} = 17;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0; % elore inicializalas
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            %valtunk savot ha lehet es break a j-s ciklusbol
                            if(canchange == 1) %atrakjuk n2-ra
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{24})
                                    temp = routeMatrixLeftTemp{24}{h}(1);
                                    routeMatrixLeftTemp{24}{h}(1) = -routeMatrixLeftTemp{24}{h}(2);
                                    routeMatrixLeftTemp{24}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeft{24};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{24};
                                car{i}{6} = 24;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    elseif(isequal(car{i}{2}.XData, slane1{k}(1)) && isequal(car{i}{2}.YData, slane1{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{34})
                                    temp = routeMatrixLeftTemp{34}{h}(1);
                                    routeMatrixLeftTemp{34}{h}(1) = -routeMatrixLeftTemp{34}{h}(2);
                                    routeMatrixLeftTemp{34}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{34};
                                car{i}{6} = 34;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{27})
                                    temp = routeMatrixLeftTemp{27}{h}(1);
                                    routeMatrixLeftTemp{27}{h}(1) = -routeMatrixLeftTemp{27}{h}(2);
                                    routeMatrixLeftTemp{27}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{27};
                                car{i}{6} = 27;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, slane2{k}(1)) && isequal(car{i}{2}.YData, slane2{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{27})
                                    temp = routeMatrixLeftTemp{27}{h}(1);
                                    routeMatrixLeftTemp{27}{h}(1) = -routeMatrixLeftTemp{27}{h}(2);
                                    routeMatrixLeftTemp{27}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{27};
                                car{i}{6} = 27;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{34})
                                    temp = routeMatrixLeftTemp{34}{h}(1);
                                    routeMatrixLeftTemp{34}{h}(1) = -routeMatrixLeftTemp{34}{h}(2);
                                    routeMatrixLeftTemp{34}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{34};
                                car{i}{6} = 34;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    elseif(isequal(car{i}{2}.XData, elane1{k}(1)) && isequal(car{i}{2}.YData, elane1{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{46})
                                    temp = routeMatrixLeftTemp{46}{h}(1);
                                    routeMatrixLeftTemp{46}{h}(1) = -routeMatrixLeftTemp{46}{h}(2);
                                    routeMatrixLeftTemp{46}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{46};
                                car{i}{6} = 46;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{39})
                                    temp = routeMatrixLeftTemp{39}{h}(1);
                                    routeMatrixLeftTemp{39}{h}(1) = -routeMatrixLeftTemp{39}{h}(2);
                                    routeMatrixLeftTemp{39}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{39};
                                car{i}{6} = 39;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, elane2{k}(1)) && isequal(car{i}{2}.YData, elane2{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{39})
                                    temp = routeMatrixLeftTemp{39}{h}(1);
                                    routeMatrixLeftTemp{39}{h}(1) = -routeMatrixLeftTemp{39}{h}(2);
                                    routeMatrixLeftTemp{39}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{39};
                                car{i}{6} = 39;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                                for h = 1:length(routeMatrixLeftTemp{46})
                                    temp = routeMatrixLeftTemp{46}{h}(1);
                                    routeMatrixLeftTemp{46}{h}(1) = -routeMatrixLeftTemp{46}{h}(2);
                                    routeMatrixLeftTemp{46}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{46};
                                car{i}{6} = 46;
                                break;
                            end
                        end
                    end
                end
            end
        end
    case 6
        for i = 1:carnum
            for k = 1:range %poziciokra
                if(isequal(car{i}{2}.XData, wlane1{k}(1)) && isequal(car{i}{2}.YData, wlane1{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{22})
                                    routeMatrixStraightTemp{22}{h}(1) = -routeMatrixStraightTemp{22}{h}(1);
                                    routeMatrixStraightTemp{22}{h}(2) = -routeMatrixStraightTemp{22}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{22};
                                car{i}{6} = 22;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{15})
                                    routeMatrixStraightTemp{15}{h}(1) = -routeMatrixStraightTemp{15}{h}(1);
                                    routeMatrixStraightTemp{15}{h}(2) = -routeMatrixStraightTemp{15}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{15};
                                car{i}{6} = 15;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, wlane2{k}(1)) && isequal(car{i}{2}.YData, wlane2{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{15})
                                    routeMatrixStraightTemp{15}{h}(1) = -routeMatrixStraightTemp{15}{h}(1);
                                    routeMatrixStraightTemp{15}{h}(2) = -routeMatrixStraightTemp{15}{h}(2);
                                end
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{15};
                                car{i}{6} = 15;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{22})
                                    routeMatrixStraightTemp{22}{h}(1) = -routeMatrixStraightTemp{22}{h}(1);
                                    routeMatrixStraightTemp{22}{h}(2) = -routeMatrixStraightTemp{22}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{22};
                                car{i}{6} = 22;
                                break;
                            end
                        end
                    end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, slane1{k}(1)) && isequal(car{i}{2}.YData, slane1{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk s2-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{33})
                                    routeMatrixStraightTemp{33}{h}(1) = -routeMatrixStraightTemp{33}{h}(1);
                                    routeMatrixStraightTemp{33}{h}(2) = -routeMatrixStraightTemp{33}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{33};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{33};
                                car{i}{6} = 33;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %hagyjuk s1-en
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{27})
                                    routeMatrixStraightTemp{27}{h}(1) = -routeMatrixStraightTemp{27}{h}(1);
                                    routeMatrixStraightTemp{27}{h}(2) = -routeMatrixStraightTemp{27}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{27};
                                car{i}{6} = 27;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, slane2{k}(1)) && isequal(car{i}{2}.YData, slane2{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %kozepso sav itt 2 iranyba is valthat
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %elore menne es kovi pozija foglalt
                            canchangeto1 = 1;
                            canchangeto3 = 1;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s1-re vizsgalat)
                                    %nem valt savot
                                    canchangeto1 = 0;
                                elseif(canchangeto1 ~= 0)
                                    canchangeto1 = 1;
                                end
                                if((i ~= y) && isequal(car{y}{2}.XData, slane3{k+1}(1)) && isequal(car{y}{2}.YData, slane3{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s3-ra vizsgalat)
                                    %nem valt savot
                                    canchangeto3 = 0;
                                elseif(canchangeto3 ~= 0)
                                    canchangeto3 = 1;
                                end
                            end
                            %valtunk savot ha lehet es break a j-s ciklusbol
                            if(canchangeto3 == 1) %atrakjuk s3-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{34})
                                    routeMatrixStraightTemp{34}{h}(1) = -routeMatrixStraightTemp{34}{h}(1);
                                    routeMatrixStraightTemp{34}{h}(2) = -routeMatrixStraightTemp{34}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{34};
                                car{i}{6} = 34;
                                break;
                            elseif(canchangeto1 == 1) %atrakjuk s1-ra
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{27})
                                    routeMatrixStraightTemp{27}{h}(1) = -routeMatrixStraightTemp{27}{h}(1);
                                    routeMatrixStraightTemp{27}{h}(2) = -routeMatrixStraightTemp{27}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{27};
                                car{i}{6} = 27;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %savot valtana es kovi pozija foglalt
                            canchangeto2 = 1; % elore inicializalas
                            canchangeto3 = 1;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re vizsgalat)
                                    %nem valt savot
                                    canchangeto2 = 0;
                                elseif(canchangeto2 ~= 0)
                                    canchangeto2 = 1;
                                end
                                if((i ~= y) && isequal(car{y}{2}.XData, slane3{k+1}(1)) && isequal(car{y}{2}.YData, slane3{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n3-ra vizsgalat)
                                    %nem valt savot
                                    canchangeto3 = 0;
                                elseif(canchangeto3 ~= 0)
                                    canchangeto3 = 1;
                                end
                            end
                            %valtunk savot ha lehet es break a j-s ciklusbol
                            if(canchangeto3 == 1) %atrakjuk s3-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{34})
                                    routeMatrixStraightTemp{34}{h}(1) = -routeMatrixStraightTemp{34}{h}(1);
                                    routeMatrixStraightTemp{34}{h}(2) = -routeMatrixStraightTemp{34}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{34};
                                car{i}{6} = 34;
                                break;
                            elseif(canchangeto2 == 1) %atrakjuk s1-ra
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{33})
                                    routeMatrixStraightTemp{33}{h}(1) = -routeMatrixStraightTemp{33}{h}(1);
                                    routeMatrixStraightTemp{33}{h}(2) = -routeMatrixStraightTemp{33}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{33};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{33};
                                car{i}{6} = 33;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %savot valtana es kovi pozija foglalt (csak a 3. savba valthat a 2.bol)
                            canchangeto1 = 1;
                            canchangeto2 = 1;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s1-re kell vizsgalni)
                                    %nem valt savot
                                    canchangeto1 = 0;
                                elseif(canchangeto1 ~= 0)
                                    canchangeto1 = 1;
                                end
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s2-ra vizsgalat)
                                    %nem valt savot
                                    canchangeto2 = 0;
                                elseif(canchangeto2 ~= 0)
                                    canchangeto2 = 1;
                                end
                            end
                            if(canchangeto1 == 1) %atrakjuk s1-re IF SORRENDET ATGONDOLNI
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{27})
                                    routeMatrixStraightTemp{27}{h}(1) = -routeMatrixStraightTemp{27}{h}(1);
                                    routeMatrixStraightTemp{27}{h}(2) = -routeMatrixStraightTemp{27}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{27};
                                car{i}{6} = 27;
                                break;
                            elseif(canchangeto2 == 1) %hagyjuk s2-n
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{33})
                                    routeMatrixStraightTemp{33}{h}(1) = -routeMatrixStraightTemp{33}{h}(1);
                                    routeMatrixStraightTemp{33}{h}(2) = -routeMatrixStraightTemp{33}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{33};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{33};
                                car{i}{6} = 33;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, slane3{k}(1)) && isequal(car{i}{2}.YData, slane3{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %harmadik savon van, csak elore mehet
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk s2-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{33})
                                    routeMatrixStraightTemp{33}{h}(1) = -routeMatrixStraightTemp{33}{h}(1);
                                    routeMatrixStraightTemp{33}{h}(2) = -routeMatrixStraightTemp{33}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{33};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{33};
                                car{i}{6} = 33;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane3{k+1}(1)) && isequal(car{y}{2}.YData, slane3{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n3-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %hagyjuk s3-en
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{34})
                                    routeMatrixStraightTemp{34}{h}(1) = -routeMatrixStraightTemp{34}{h}(1);
                                    routeMatrixStraightTemp{34}{h}(2) = -routeMatrixStraightTemp{34}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{34};
                                car{i}{6} = 34;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, elane1{k}(1)) && isequal(car{i}{2}.YData, elane1{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{46})
                                    routeMatrixStraightTemp{46}{h}(1) = -routeMatrixStraightTemp{46}{h}(1);
                                    routeMatrixStraightTemp{46}{h}(2) = -routeMatrixStraightTemp{46}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{46};
                                car{i}{6} = 46;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{39})
                                    routeMatrixStraightTemp{39}{h}(1) = -routeMatrixStraightTemp{39}{h}(1);
                                    routeMatrixStraightTemp{39}{h}(2) = -routeMatrixStraightTemp{39}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{39};
                                car{i}{6} = 39;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, elane2{k}(1)) && isequal(car{i}{2}.YData, elane2{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{39})
                                    routeMatrixStraightTemp{39}{h}(1) = -routeMatrixStraightTemp{39}{h}(1);
                                    routeMatrixStraightTemp{39}{h}(2) = -routeMatrixStraightTemp{39}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{39};
                                car{i}{6} = 39;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                                for h = 1:length(routeMatrixStraightTemp{46})
                                    routeMatrixStraightTemp{46}{h}(1) = -routeMatrixStraightTemp{46}{h}(1);
                                    routeMatrixStraightTemp{46}{h}(2) = -routeMatrixStraightTemp{46}{h}(2);
                                end
                                car{i}{1} = routeMatrixStraightTemp{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT6{46};
                                car{i}{6} = 46;
                                break;
                            end
                        end
                    end
                end
            end
        end
    case 7
        for i = 1:carnum %minden autora
            for k = 1:range %poziciokra
                if(isequal(car{i}{2}.XData, nlane1{k}(1)) && isequal(car{i}{2}.YData, nlane1{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{10})
                                    routeMatrixLeftTemp{10}{h}(1) = -routeMatrixLeftTemp{10}{h}(1);
                                    routeMatrixLeftTemp{10}{h}(2) = -routeMatrixLeftTemp{10}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{10};
                                car{i}{6} = 10;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{3})
                                    routeMatrixLeftTemp{3}{h}(1) = -routeMatrixLeftTemp{3}{h}(1);
                                    routeMatrixLeftTemp{3}{h}(2) = -routeMatrixLeftTemp{3}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{3};
                                car{i}{6} = 3;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, nlane2{k}(1)) && isequal(car{i}{2}.YData, nlane2{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{3})
                                    routeMatrixLeftTemp{3}{h}(1) = -routeMatrixLeftTemp{3}{h}(1);
                                    routeMatrixLeftTemp{3}{h}(2) = -routeMatrixLeftTemp{3}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{3};
                                car{i}{6} = 3;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{10})
                                    routeMatrixLeftTemp{10}{h}(1) = -routeMatrixLeftTemp{10}{h}(1);
                                    routeMatrixLeftTemp{10}{h}(2) = -routeMatrixLeftTemp{10}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{10};
                                car{i}{6} = 10;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, wlane1{k}(1)) && isequal(car{i}{2}.YData, wlane1{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{22})
                                    routeMatrixLeftTemp{22}{h}(1) = -routeMatrixLeftTemp{22}{h}(1);
                                    routeMatrixLeftTemp{22}{h}(2) = -routeMatrixLeftTemp{22}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{22};
                                car{i}{6} = 22;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{15})
                                    routeMatrixLeftTemp{15}{h}(1) = -routeMatrixLeftTemp{15}{h}(1);
                                    routeMatrixLeftTemp{15}{h}(2) = -routeMatrixLeftTemp{15}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{15};
                                car{i}{6} = 15;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, wlane2{k}(1)) && isequal(car{i}{2}.YData, wlane2{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{15})
                                    routeMatrixLeftTemp{15}{h}(1) = -routeMatrixLeftTemp{15}{h}(1);
                                    routeMatrixLeftTemp{15}{h}(2) = -routeMatrixLeftTemp{15}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{15};
                                car{i}{6} = 15;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{22})
                                    routeMatrixLeftTemp{22}{h}(1) = -routeMatrixLeftTemp{22}{h}(1);
                                    routeMatrixLeftTemp{22}{h}(2) = -routeMatrixLeftTemp{22}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{22};
                                car{i}{6} = 22;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, slane1{k}(1)) && isequal(car{i}{2}.YData, slane1{k}(2)) && ( isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %megvizsgaljuk, hogy az adott savon van e es balra akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{36})
                                    routeMatrixLeftTemp{36}{h}(1) = -routeMatrixLeftTemp{36}{h}(1);
                                    routeMatrixLeftTemp{36}{h}(2) = -routeMatrixLeftTemp{36}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{36};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{36};
                                car{i}{6} = 36;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{29})
                                    routeMatrixLeftTemp{29}{h}(1) = -routeMatrixLeftTemp{29}{h}(1);
                                    routeMatrixLeftTemp{29}{h}(2) = -routeMatrixLeftTemp{29}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{29};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{29};
                                car{i}{6} = 29;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, slane2{k}(1)) && isequal(car{i}{2}.YData, slane2{k}(2)) && (isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %belso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0; % elore inicializalas
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re vizsgalat)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-ra
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{29})
                                    routeMatrixLeftTemp{29}{h}(1) = -routeMatrixLeftTemp{29}{h}(1);
                                    routeMatrixLeftTemp{29}{h}(2) = -routeMatrixLeftTemp{29}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{29};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{29};
                                car{i}{6} = 29;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0; % elore inicializalas
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            %valtunk savot ha lehet es break a j-s ciklusbol
                            if(canchange == 1) %atrakjuk n2-ra
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{36})
                                    routeMatrixLeftTemp{36}{h}(1) = -routeMatrixLeftTemp{36}{h}(1);
                                    routeMatrixLeftTemp{36}{h}(2) = -routeMatrixLeftTemp{36}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeft{36};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{36};
                                car{i}{6} = 36;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, elane1{k}(1)) && isequal(car{i}{2}.YData, elane1{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{46})
                                    routeMatrixLeftTemp{46}{h}(1) = -routeMatrixLeftTemp{46}{h}(1);
                                    routeMatrixLeftTemp{46}{h}(2) = -routeMatrixLeftTemp{46}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{46};
                                car{i}{6} = 46;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{39})
                                    routeMatrixLeftTemp{39}{h}(1) = -routeMatrixLeftTemp{39}{h}(1);
                                    routeMatrixLeftTemp{39}{h}(2) = -routeMatrixLeftTemp{39}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{39};
                                car{i}{6} = 39;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, elane2{k}(1)) && isequal(car{i}{2}.YData, elane2{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{39})
                                    routeMatrixLeftTemp{39}{h}(1) = -routeMatrixLeftTemp{39}{h}(1);
                                    routeMatrixLeftTemp{39}{h}(2) = -routeMatrixLeftTemp{39}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{39};
                                car{i}{6} = 39;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                                for h = 1:length(routeMatrixLeftTemp{46})
                                    routeMatrixLeftTemp{46}{h}(1) = -routeMatrixLeftTemp{46}{h}(1);
                                    routeMatrixLeftTemp{46}{h}(2) = -routeMatrixLeftTemp{46}{h}(2);
                                end
                                car{i}{1} = routeMatrixLeftTemp{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{46};
                                car{i}{6} = 46;
                                break;
                            end
                        end
                    end
                end
            end
        end
    case 8
        for i = 1:carnum
            for k = 1:range %poziciokra
                if(isequal(car{i}{2}.XData, nlane1{k}(1)) && isequal(car{i}{2}.YData, nlane1{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{10})
                                    temp = -routeMatrixStraightTemp{10}{h}(1);
                                    routeMatrixStraightTemp{10}{h}(1) = routeMatrixStraightTemp{10}{h}(2);
                                    routeMatrixStraightTemp{10}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{10};
                                car{i}{6} = 10;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{3})
                                    temp = -routeMatrixStraightTemp{3}{h}(1);
                                    routeMatrixStraightTemp{3}{h}(1) = routeMatrixStraightTemp{3}{h}(2);
                                    routeMatrixStraightTemp{3}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{3};
                                car{i}{6} = 3;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, nlane2{k}(1)) && isequal(car{i}{2}.YData, nlane2{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{3})
                                    temp = -routeMatrixStraightTemp{3}{h}(1);
                                    routeMatrixStraightTemp{3}{h}(1) = routeMatrixStraightTemp{3}{h}(2);
                                    routeMatrixStraightTemp{3}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{3};
                                car{i}{6} = 3;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{10})
                                    temp = -routeMatrixStraightTemp{10}{h}(1);
                                    routeMatrixStraightTemp{10}{h}(1) = routeMatrixStraightTemp{10}{h}(2);
                                    routeMatrixStraightTemp{10}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{10};
                                car{i}{6} = 10;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, slane1{k}(1)) && isequal(car{i}{2}.YData, slane1{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{34})
                                    temp = -routeMatrixStraightTemp{34}{h}(1);
                                    routeMatrixStraightTemp{34}{h}(1) = routeMatrixStraightTemp{34}{h}(2);
                                    routeMatrixStraightTemp{34}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{34};
                                car{i}{6} = 34;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{27})
                                    temp = -routeMatrixStraightTemp{27}{h}(1);
                                    routeMatrixStraightTemp{27}{h}(1) = routeMatrixStraightTemp{27}{h}(2);
                                    routeMatrixStraightTemp{27}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{27};
                                car{i}{6} = 27;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, slane2{k}(1)) && isequal(car{i}{2}.YData, slane2{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{27})
                                    temp = -routeMatrixStraightTemp{27}{h}(1);
                                    routeMatrixStraightTemp{27}{h}(1) = routeMatrixStraightTemp{27}{h}(2);
                                    routeMatrixStraightTemp{27}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{27};
                                car{i}{6} = 27;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{34})
                                    temp = -routeMatrixStraightTemp{34}{h}(1);
                                    routeMatrixStraightTemp{34}{h}(1) = routeMatrixStraightTemp{34}{h}(2);
                                    routeMatrixStraightTemp{34}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{34};
                                car{i}{6} = 34;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, elane1{k}(1)) && isequal(car{i}{2}.YData, elane1{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk e2-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{45})
                                    temp = -routeMatrixStraightTemp{45}{h}(1);
                                    routeMatrixStraightTemp{45}{h}(1) = routeMatrixStraightTemp{45}{h}(2);
                                    routeMatrixStraightTemp{45}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{45};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{45};
                                car{i}{6} = 45;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %hagyjuk e1-en
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{39})
                                    temp = -routeMatrixStraightTemp{39}{h}(1);
                                    routeMatrixStraightTemp{39}{h}(1) = routeMatrixStraightTemp{39}{h}(2);
                                    routeMatrixStraightTemp{39}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{39};
                                car{i}{6} = 39;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, elane2{k}(1)) && isequal(car{i}{2}.YData, elane2{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %kozepso sav itt 2 iranyba is valthat
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %elore menne es kovi pozija foglalt
                            canchangeto1 = 1;
                            canchangeto3 = 1;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s1-re vizsgalat)
                                    %nem valt savot
                                    canchangeto1 = 0;
                                elseif(canchangeto1 ~= 0)
                                    canchangeto1 = 1;
                                end
                                if((i ~= y) && isequal(car{y}{2}.XData, elane3{k+1}(1)) && isequal(car{y}{2}.YData, elane3{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s3-ra vizsgalat)
                                    %nem valt savot
                                    canchangeto3 = 0;
                                elseif(canchangeto3 ~= 0)
                                    canchangeto3 = 1;
                                end
                            end
                            %valtunk savot ha lehet es break a j-s ciklusbol
                            if(canchangeto3 == 1) %atrakjuk e3-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{46})
                                    temp = -routeMatrixStraightTemp{46}{h}(1);
                                    routeMatrixStraightTemp{46}{h}(1) = routeMatrixStraightTemp{46}{h}(2);
                                    routeMatrixStraightTemp{46}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{46};
                                car{i}{6} = 46;
                                break;
                            elseif(canchangeto1 == 1) %atrakjuk e1-ra
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{39})
                                    temp = -routeMatrixStraightTemp{39}{h}(1);
                                    routeMatrixStraightTemp{39}{h}(1) = routeMatrixStraightTemp{39}{h}(2);
                                    routeMatrixStraightTemp{39}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{39};
                                car{i}{6} = 39;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %savot valtana es kovi pozija foglalt
                            canchangeto2 = 1; % elore inicializalas
                            canchangeto3 = 1;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re vizsgalat)
                                    %nem valt savot
                                    canchangeto2 = 0;
                                elseif(canchangeto2 ~= 0)
                                    canchangeto2 = 1;
                                end
                                if((i ~= y) && isequal(car{y}{2}.XData, elane3{k+1}(1)) && isequal(car{y}{2}.YData, elane3{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n3-ra vizsgalat)
                                    %nem valt savot
                                    canchangeto3 = 0;
                                elseif(canchangeto3 ~= 0)
                                    canchangeto3 = 1;
                                end
                            end
                            %valtunk savot ha lehet es break a j-s ciklusbol
                            if(canchangeto3 == 1) %atrakjuk e3-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{46})
                                    temp = -routeMatrixStraightTemp{46}{h}(1);
                                    routeMatrixStraightTemp{46}{h}(1) = routeMatrixStraightTemp{46}{h}(2);
                                    routeMatrixStraightTemp{46}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{46};
                                car{i}{6} = 46;
                                break;
                            elseif(canchangeto2 == 1) %atrakjuk e2-ra
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{45})
                                    temp = -routeMatrixStraightTemp{45}{h}(1);
                                    routeMatrixStraightTemp{45}{h}(1) = routeMatrixStraightTemp{45}{h}(2);
                                    routeMatrixStraightTemp{45}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{45};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{45};
                                car{i}{6} = 45;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %savot valtana es kovi pozija foglalt (csak a 3. savba valthat a 2.bol)
                            canchangeto1 = 1;
                            canchangeto2 = 1;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s1-re kell vizsgalni)
                                    %nem valt savot
                                    canchangeto1 = 0;
                                elseif(canchangeto1 ~= 0)
                                    canchangeto1 = 1;
                                end
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s2-ra vizsgalat)
                                    %nem valt savot
                                    canchangeto2 = 0;
                                elseif(canchangeto2 ~= 0)
                                    canchangeto2 = 1;
                                end
                            end
                            if(canchangeto1 == 1) %atrakjuk s1-re IF SORRENDET ATGONDOLNI
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{39})
                                    temp = -routeMatrixStraightTemp{39}{h}(1);
                                    routeMatrixStraightTemp{39}{h}(1) = routeMatrixStraightTemp{39}{h}(2);
                                    routeMatrixStraightTemp{39}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{39};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{39};
                                car{i}{6} = 39;
                                break;
                            elseif(canchangeto2 == 1) %hagyjuk e2-n
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{45})
                                    temp = -routeMatrixStraightTemp{45}{h}(1);
                                    routeMatrixStraightTemp{45}{h}(1) = routeMatrixStraightTemp{45}{h}(2);
                                    routeMatrixStraightTemp{45}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{45};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{45};
                                car{i}{6} = 45;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, elane3{k}(1)) && isequal(car{i}{2}.YData, elane3{k}(2)) && (isequal(car{i}{5},W2) || isequal(car{i}{5},W3) || isequal(car{i}{5},W4))) %harmadik savon van, csak elore mehet
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(s2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk e2-re
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{45})
                                    temp = -routeMatrixStraightTemp{45}{h}(1);
                                    routeMatrixStraightTemp{45}{h}(1) = routeMatrixStraightTemp{45}{h}(2);
                                    routeMatrixStraightTemp{45}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{45};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{45};
                                car{i}{6} = 45;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane3{k+1}(1)) && isequal(car{y}{2}.YData, elane3{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(e3-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %hagyjuk e3-en
                                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                                for h = 1:length(routeMatrixStraightTemp{46})
                                    temp = -routeMatrixStraightTemp{46}{h}(1);
                                    routeMatrixStraightTemp{46}{h}(1) = routeMatrixStraightTemp{46}{h}(2);
                                    routeMatrixStraightTemp{46}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixStraightTemp{46};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsFT8{46};
                                car{i}{6} = 46;
                                break;
                            end
                        end
                    end
                end
            end
        end
    case 9
        for i = 1:carnum %minden autora
            for k = 1:range %poziciokra
                if(isequal(car{i}{2}.XData, nlane1{k}(1)) && isequal(car{i}{2}.YData, nlane1{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{10})
                                    temp = -routeMatrixLeftTemp{10}{h}(1);
                                    routeMatrixLeftTemp{10}{h}(1) = routeMatrixLeftTemp{10}{h}(2);
                                    routeMatrixLeftTemp{10}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{10};
                                car{i}{6} = 10;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{3})
                                    temp = -routeMatrixLeftTemp{3}{h}(1);
                                    routeMatrixLeftTemp{3}{h}(1) = routeMatrixLeftTemp{3}{h}(2);
                                    routeMatrixLeftTemp{3}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{3};
                                car{i}{6} = 3;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, nlane2{k}(1)) && isequal(car{i}{2}.YData, nlane2{k}(2)) && (isequal(car{i}{5},S2) || isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane1{k+1}(1)) && isequal(car{y}{2}.YData, nlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{3})
                                    temp = -routeMatrixLeftTemp{3}{h}(1);
                                    routeMatrixLeftTemp{3}{h}(1) = routeMatrixLeftTemp{3}{h}(2);
                                    routeMatrixLeftTemp{3}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{3};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{3};
                                car{i}{6} = 3;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, nlane2{k+1}(1)) && isequal(car{y}{2}.YData, nlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{10})
                                    temp = -routeMatrixLeftTemp{10}{h}(1);
                                    routeMatrixLeftTemp{10}{h}(1) = routeMatrixLeftTemp{10}{h}(2);
                                    routeMatrixLeftTemp{10}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{10};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{10};
                                car{i}{6} = 10;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, wlane1{k}(1)) && isequal(car{i}{2}.YData, wlane1{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{22})
                                    temp = -routeMatrixLeftTemp{22}{h}(1);
                                    routeMatrixLeftTemp{22}{h}(1) = routeMatrixLeftTemp{22}{h}(2);
                                    routeMatrixLeftTemp{22}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{22};
                                car{i}{6} = 22;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{15})
                                    temp = -routeMatrixLeftTemp{15}{h}(1);
                                    routeMatrixLeftTemp{15}{h}(1) = routeMatrixLeftTemp{15}{h}(2);
                                    routeMatrixLeftTemp{15}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{15};
                                car{i}{6} = 15;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, wlane2{k}(1)) && isequal(car{i}{2}.YData, wlane2{k}(2)) && (isequal(car{i}{5},E2) || isequal(car{i}{5},E3) || isequal(car{i}{5},E4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane1{k+1}(1)) && isequal(car{y}{2}.YData, wlane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{15})
                                    temp = -routeMatrixLeftTemp{15}{h}(1);
                                    routeMatrixLeftTemp{15}{h}(1) = routeMatrixLeftTemp{15}{h}(2);
                                    routeMatrixLeftTemp{15}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{15};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{15};
                                car{i}{6} = 15;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, wlane2{k+1}(1)) && isequal(car{y}{2}.YData, wlane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{22})
                                    temp = -routeMatrixLeftTemp{22}{h}(1);
                                    routeMatrixLeftTemp{22}{h}(1) = routeMatrixLeftTemp{22}{h}(2);
                                    routeMatrixLeftTemp{22}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{22};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{22};
                                car{i}{6} = 22;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, slane1{k}(1)) && isequal(car{i}{2}.YData, slane1{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %megvizsgaljuk, hogy az adott savon van e es elore akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{34})
                                    temp = -routeMatrixLeftTemp{34}{h}(1);
                                    routeMatrixLeftTemp{34}{h}(1) = routeMatrixLeftTemp{34}{h}(2);
                                    routeMatrixLeftTemp{34}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{34};
                                car{i}{6} = 34;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{27})
                                    temp = -routeMatrixLeftTemp{27}{h}(1);
                                    routeMatrixLeftTemp{27}{h}(1) = routeMatrixLeftTemp{27}{h}(2);
                                    routeMatrixLeftTemp{27}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{27};
                                car{i}{6} = 27;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, slane2{k}(1)) && isequal(car{i}{2}.YData, slane2{k}(2)) && (isequal(car{i}{5},N2) || isequal(car{i}{5},N3) || isequal(car{i}{5},N4))) %kozepso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane1{k+1}(1)) && isequal(car{y}{2}.YData, slane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{27})
                                    temp = -routeMatrixLeftTemp{27}{h}(1);
                                    routeMatrixLeftTemp{27}{h}(1) = routeMatrixLeftTemp{27}{h}(2);
                                    routeMatrixLeftTemp{27}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{27};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{27};
                                car{i}{6} = 27;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, slane2{k+1}(1)) && isequal(car{y}{2}.YData, slane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n2-n
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{34})
                                    temp = -routeMatrixLeftTemp{34}{h}(1);
                                    routeMatrixLeftTemp{34}{h}(1) = routeMatrixLeftTemp{34}{h}(2);
                                    routeMatrixLeftTemp{34}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{34};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{34};
                                car{i}{6} = 34;
                                break;
                            end
                        end
                    end
                    %%%%%%%%%%%%%%%%%%%%
                elseif(isequal(car{i}{2}.XData, elane1{k}(1)) && isequal(car{i}{2}.YData, elane1{k}(2)) && ( isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %megvizsgaljuk, hogy az adott savon van e es balra akar e menni
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %elore menne es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n2-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n2-re
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{48})
                                    temp = -routeMatrixLeftTemp{48}{h}(1);
                                    routeMatrixLeftTemp{48}{h}(1) = routeMatrixLeftTemp{48}{h}(2);
                                    routeMatrixLeftTemp{48}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{48};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{48};
                                car{i}{6} = 48;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %savot valtana es kovi pozija foglalt
                            canchange = 0;
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re kell vizsgalni)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %tartjuk n1-en
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{41})
                                    temp = -routeMatrixLeftTemp{41}{h}(1);
                                    routeMatrixLeftTemp{41}{h}(1) = routeMatrixLeftTemp{41}{h}(2);
                                    routeMatrixLeftTemp{41}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{41};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{41};
                                car{i}{6} = 41;
                                break;
                            end
                        end
                    end
                elseif(isequal(car{i}{2}.XData, elane2{k}(1)) && isequal(car{i}{2}.YData, elane2{k}(2)) && (isequal(car{i}{5},S3) || isequal(car{i}{5},S4))) %belso sav
                    for j = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi poziciojaban van e valaki
                        if((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20)) %elore menne es kovi pozija foglalt
                            canchange = 0; % elore inicializalas
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane1{k+1}(1)) && isequal(car{y}{2}.YData, elane1{k+1}(2))) %kovi pozija mellett levo pozi is foglalt(n1-re vizsgalat)
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            if(canchange == 1) %atrakjuk n1-ra
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{41})
                                    temp = -routeMatrixLeftTemp{41}{h}(1);
                                    routeMatrixLeftTemp{41}{h}(1) = routeMatrixLeftTemp{41}{h}(2);
                                    routeMatrixLeftTemp{41}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeftTemp{41};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{41};
                                car{i}{6} = 41;
                                break;
                            end
                        elseif((i ~= j) && isequal(car{i}{1}{car{i}{3} + 1}(1), car{j}{2}.XData) && isequal(car{i}{1}{car{i}{3} + 1}(2), car{j}{2}.YData) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60)) %savot valtana es kovi pozija foglalt
                            canchange = 0; % elore inicializalas
                            for y = 1:carnum %megvizsgaljuk, hogy a kivalasztott auto kovi pozicioja melleti poziba van e valaki
                                if((i ~= y) && isequal(car{y}{2}.XData, elane2{k+1}(1)) && isequal(car{y}{2}.YData, elane2{k+1}(2))) %kovi pozija mellett levo pozi is foglalt
                                    %nem valt savot
                                    canchange = 0;
                                    break;
                                else
                                    canchange = 1;
                                end
                            end
                            %valtunk savot ha lehet es break a j-s ciklusbol
                            if(canchange == 1) %atrakjuk n2-ra
                                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                                for h = 1:length(routeMatrixLeftTemp{48})
                                    temp = -routeMatrixLeftTemp{48}{h}(1);
                                    routeMatrixLeftTemp{48}{h}(1) = routeMatrixLeftTemp{48}{h}(2);
                                    routeMatrixLeftTemp{48}{h}(2) = temp;
                                end
                                car{i}{1} = routeMatrixLeft{48};
                                car{i}{4} = length(car{i}{1});
                                car{i}{5} = endgoalsNL{48};
                                car{i}{6} = 48;
                                break;
                            end
                        end
                    end
                end
            end
        end
end

end