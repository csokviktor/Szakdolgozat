function changeRoute()
global car;
global routeMatrixBase;
global routeMatrixLeft;
global routeMatrixStraight;
global endgoalsNL;
global endgoalsFT2;
global endgoalsFT4;
global endgoalsFT6;
global endgoalsFT8;
global carnum;
global lampaciklusaktualis;


for k = 1:carnum
    if(car{k}{3} <= 11) %csak akkor frissitjuk az utvonalat ha meg nem erte el a lampat mert csak igy logikus utana mar nincs ertelme
        switch lampaciklusaktualis
            case 1 %Nincs torlodas
                car{k}{1} = routeMatrixBase{car{k}{6}};
                car{k}{4} = length(car{k}{1});
                car{k}{5} = endgoalsNL{car{k}{6}};
                
            case 2 %N-rol elore miatt
                car{k}{1} = routeMatrixStraight{car{k}{6}};
                car{k}{4} = length(car{k}{1});
                car{k}{5} = endgoalsFT2{car{k}{6}};
                
            case 3 %N-rol balra miatt
                car{k}{1} = routeMatrixLeft{car{k}{6}};
                car{k}{4} = length(car{k}{1});
                car{k}{5} = endgoalsNL{car{k}{6}};
                
            case 4 %W-rol elore miatt, forgatassal
                routeMatrixStraightTemp = circshift(routeMatrixStraight,12,1);
                for i = 1:length(routeMatrixStraightTemp{car{k}{6}})
                    temp = routeMatrixStraightTemp{car{k}{6}}{i}(1);
                    routeMatrixStraightTemp{car{k}{6}}{i}(1) = -routeMatrixStraightTemp{car{k}{6}}{i}(2);
                    routeMatrixStraightTemp{car{k}{6}}{i}(2) = temp;
                end
                car{k}{1} = routeMatrixStraightTemp{car{k}{6}};
                car{k}{4} = length(car{k}{1});
                car{k}{5} = endgoalsFT4{car{k}{6}};
                
            case 5 %W-rol balra miatt, forgatas
                routeMatrixLeftTemp = circshift(routeMatrixLeft,12,1);
                for i = 1:length(routeMatrixLeftTemp{car{k}{6}})
                    temp = routeMatrixLeftTemp{car{k}{6}}{i}(1);
                    routeMatrixLeftTemp{car{k}{6}}{i}(1) = -routeMatrixLeftTemp{car{k}{6}}{i}(2);
                    routeMatrixLeftTemp{car{k}{6}}{i}(2) = temp;
                end
                car{k}{1} = routeMatrixLeftTemp{car{k}{6}};
                car{k}{4} = length(car{k}{1});
                car{k}{5} = endgoalsNL{car{k}{6}};
                
            case 6 %S-rol elore miatt
                routeMatrixStraightTemp = circshift(routeMatrixStraight,24,1);
                for i = 1:length(routeMatrixStraightTemp{car{k}{6}})
                    routeMatrixStraightTemp{car{k}{6}}{i}(1) = -routeMatrixStraightTemp{car{k}{6}}{i}(1);
                    routeMatrixStraightTemp{car{k}{6}}{i}(2) = -routeMatrixStraightTemp{car{k}{6}}{i}(2);
                end
                car{k}{1} = routeMatrixStraightTemp{car{k}{6}};
                car{k}{4} = length(car{k}{1});
                car{k}{5} = endgoalsFT6{car{k}{6}};
                
            case 7 %S-rol balra miatt, forgatas
                routeMatrixLeftTemp = circshift(routeMatrixLeft,24,1);
                for i = 1:length(routeMatrixLeftTemp{car{k}{6}})
                    routeMatrixLeftTemp{car{k}{6}}{i}(1) = -routeMatrixLeftTemp{car{k}{6}}{i}(1);
                    routeMatrixLeftTemp{car{k}{6}}{i}(2) = -routeMatrixLeftTemp{car{k}{6}}{i}(2);
                end
                car{k}{1} = routeMatrixLeftTemp{car{k}{6}};
                car{k}{4} = length(car{k}{1});
                car{k}{5} = endgoalsNL{car{k}{6}};
                
            case 8 %E-rol elore miatt
                routeMatrixStraightTemp = circshift(routeMatrixStraight,36,1);
                for i = 1:length(routeMatrixStraightTemp{car{k}{6}})
                    temp = -routeMatrixStraightTemp{car{k}{6}}{i}(1);
                    routeMatrixStraightTemp{car{k}{6}}{i}(1) = routeMatrixStraightTemp{car{k}{6}}{i}(2);
                    routeMatrixStraightTemp{car{k}{6}}{i}(2) = temp;
                end
                car{k}{1} = routeMatrixStraightTemp{car{k}{6}};
                car{k}{4} = length(car{k}{1});
                car{k}{5} = endgoalsFT8{car{k}{6}};
                
            case 9 %E-rol balra miatt, forgatas
                routeMatrixLeftTemp = circshift(routeMatrixLeft,36,1);
                for i = 1:length(routeMatrixLeftTemp{car{k}{6}})
                    temp = -routeMatrixLeftTemp{car{k}{6}}{i}(1);
                    routeMatrixLeftTemp{car{k}{6}}{i}(1) = routeMatrixLeftTemp{car{k}{6}}{i}(2);
                    routeMatrixLeftTemp{car{k}{6}}{i}(2) = temp;
                end
                car{k}{1} = routeMatrixLeftTemp{car{k}{6}};
                car{k}{4} = length(car{k}{1});
                car{k}{5} = endgoalsNL{car{k}{6}};
        end
    end
end
end