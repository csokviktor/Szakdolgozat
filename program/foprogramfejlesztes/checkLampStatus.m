function checkLampStatus()
global car;
global light;
global lampStop;
global carnum;

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

for cars = 1:carnum
    if(car{cars}{8} == 0)
        if(car{cars}{3} == 11)
            for lamps = 1:12
                if(car{cars}{2}.XData == lampStop{lamps}(1) && car{cars}{2}.YData == lampStop{lamps}(2)) % ha a lampa elott vagyunk
                    switch lamps
                        case 1 %N1
                            if((car{cars}{5} == W4 || car{cars}{5} == W3) && (light{1}{5} == X4 || light{1}{5} == X6 || light{1}{5} == X8))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == S4 || car{cars}{5} == S3 || car{cars}{5} == S2) && (light{1}{5} == X3 || light{1}{5} == X6 || light{1}{5} == X8))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == E4 || car{cars}{5} == E3) && (light{1}{5} == X8))
                                %car{cars}{7} = 1;
                            elseif(isequal(car{cars}{1}{car{cars}{3}+1}(1), -20) && isequal(car{cars}{1}{car{cars}{3}+1}(2), 60) && (light{1}{5} == X3 || light{1}{5} == X6 || light{1}{5} == X7 || light{1}{5} == X8)) %ciklusvaltasnal fel tudja venni a kovetkezo poziciojat, csak bizonyos lampak eseten mehetnek
                                %car{cars}{7} = 1;
                            else
                                car{cars}{7} = 0;
                            end
                            
                        case 2 %N2
                            if((car{cars}{5} == S4 || car{cars}{5} == S3 || car{cars}{5} == S2) && (light{2}{5} == X3 || light{2}{5} == X7))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == E4 || car{cars}{5} == E3) && (light{2}{5} == X5 || light{2}{5} == X7))
                                %car{cars}{7} = 1;
                            elseif(isequal(car{cars}{1}{car{cars}{3}+1}(1), -60) && isequal(car{cars}{1}{car{cars}{3}+1}(2), 60) && (light{2}{5} == X5)) %ciklusvaltasnal fel tudja venni a kovetkezo poziciojat, csak bizonyos lampaknal lephet.
                                %car{cars}{7} = 1;
                            elseif(isequal(car{cars}{1}{car{cars}{3}+1}(1), 20) && isequal(car{cars}{1}{car{cars}{3}+1}(2), 60) && (light{2}{5} == X5 || light{2}{5} == X3))
                                %car{cars}{7} = 1;
                            else
                                car{cars}{7} = 0;
                            end
                            
                        case 3 %N3
                            if((car{cars}{5} == S4 || car{cars}{5} == S3 || car{cars}{5} == S2) && (light{3}{5} == X7))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == E4 || car{cars}{5} == E3) && (light{3}{5} == X5 || light{3}{5} == X7))
                                %car{cars}{7} = 1;
                            else
                                car{cars}{7} = 0;
                            end
                            
                        case 4 %W1
                            if((car{cars}{5} == S4 || car{cars}{5} == S3) && (light{lamps}{5} == X4 || light{4}{5} == X6 || light{4}{5} == X8))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == E4 || car{cars}{5} == E3 || car{cars}{5} == E2) && (light{4}{5} == X3 || light{4}{5} == X6 || light{4}{5} == X8))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == N4 || car{cars}{5} == N3) && (light{4}{5} == X8))
                                %car{cars}{7} = 1;
                            elseif(isequal(car{cars}{1}{car{cars}{3}+1}(1), -60) && isequal(car{cars}{1}{car{cars}{3}+1}(2), -20) && (light{4}{5} == X3 || light{4}{5} == X6 || light{4}{5} == X7 || light{4}{5} == X8)) %ciklusvaltasnal fel tudja venni a kovetkezo poziciojat
                                %car{cars}{7} = 1;
                            else
                                car{cars}{7} = 0;
                            end
                            
                        case 5 %W2
                            if((car{cars}{5} == E4 || car{cars}{5} == E3 || car{cars}{5} == E2) && (light{5}{5} == X3 || light{5}{5} == X7))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == N4 || car{cars}{5} == N3) && (light{5}{5} == X5 || light{5}{5} == X7))
                                %car{cars}{7} = 1;
                            elseif(isequal(car{cars}{1}{car{cars}{3}+1}(1), -60) && isequal(car{cars}{1}{car{cars}{3}+1}(2), -60) && (light{5}{5} == X5))
                                %car{cars}{7} = 1;
                            elseif(isequal(car{cars}{1}{car{cars}{3}+1}(1), -60) && isequal(car{cars}{1}{car{cars}{3}+1}(2), 20) && (light{5}{5} == X5 || light{5}{5} == X3))
                                %car{cars}{7} = 1;
                            else
                                car{cars}{7} = 0;
                            end
                            
                        case 6 %W3
                            if((car{cars}{5} == E4 || car{cars}{5} == E3 || car{cars}{5} == E2) && (light{6}{5} == X7))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == N4 || car{cars}{5} == N3) && (light{6}{5} == X5 || light{6}{5} == X7))
                                %car{cars}{7} = 1;
                            else
                                car{cars}{7} = 0;
                            end
                            
                        case 7 %S1
                            if((car{cars}{5} == E4 || car{cars}{5} == E3) && (light{7}{5} == X4 || light{7}{5} == X6 || light{7}{5} == X8))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == N4 || car{cars}{5} == N3 || car{cars}{5} == N2) && (light{7}{5} == X3 || light{7}{5} == X6 || light{7}{5} == X8))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == W4 || car{cars}{5} == W3) && (light{7}{5} == X8))
                                %car{cars}{7} = 1;
                            elseif(isequal(car{cars}{1}{car{cars}{3}+1}(1), 20) && isequal(car{cars}{1}{car{cars}{3}+1}(2), -60) && (light{7}{5} == X3 || light{7}{5} == X6 || light{7}{5} == X7 || light{7}{5} == X8)) %ciklusvaltasnal fel tudja venni a kovetkezo poziciojat
                                %car{cars}{7} = 1;
                            else
                                car{cars}{7} = 0;
                            end
                            
                        case 8 %S2
                            if((car{cars}{5} == N4 || car{cars}{5} == N3 || car{cars}{5} == N2) && (light{8}{5} == X3 || light{8}{5} == X7))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == W4 || car{cars}{5} == W3) && (light{8}{5} == X5 || light{8}{5} == X7))
                                %car{cars}{7} = 1;
                            elseif(isequal(car{cars}{1}{car{cars}{3}+1}(1), 60) && isequal(car{cars}{1}{car{cars}{3}+1}(2), -60) && (light{8}{5} == X5))
                                %car{cars}{7} = 1;
                            elseif(isequal(car{cars}{1}{car{cars}{3}+1}(1), -20) && isequal(car{cars}{1}{car{cars}{3}+1}(2), -60) && (light{8}{5} == X5 || light{8}{5} == X3))
                                %car{cars}{7} = 1;
                            else
                                car{cars}{7} = 0;
                            end
                            
                        case 9 %S3
                            if((car{cars}{5} == N4 || car{cars}{5} == N3 || car{cars}{5} == N2) && (light{9}{5} == X7))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == W4 || car{cars}{5} == W3) && (light{9}{5} == X5 || light{9}{5} == X7))
                                %car{cars}{7} = 1;
                            else
                                car{cars}{7} = 0;
                            end
                            
                        case 10 %E1
                            if((car{cars}{5} == N4 || car{cars}{5} == N3) && (light{10}{5} == X4 || light{10}{5} == X6 || light{10}{5} == X8))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == W4 || car{cars}{5} == W3 || car{cars}{5} == W2) && (light{10}{5} == X3 || light{10}{5} == X6 || light{10}{5} == X8))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == S4 || car{cars}{5} == S3) && (light{10}{5} == X8))
                                %car{cars}{7} = 1;
                            elseif(isequal(car{cars}{1}{car{cars}{3}+1}(1), 60) && isequal(car{cars}{1}{car{cars}{3}+1}(2), 20) && (light{10}{5} == X3 || light{10}{5} == X6 || light{10}{5} == X7 || light{10}{5} == X8)) %ciklusvaltasnal fel tudja venni a kovetkezo poziciojat
                                %car{cars}{7} = 1;
                            else
                                car{cars}{7} = 0;
                            end
                            
                        case 11 %E2
                            if((car{cars}{5} == W4 || car{cars}{5} == W3 || car{cars}{5} == W2) && (light{11}{5} == X3 || light{11}{5} == X7))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == S4 || car{cars}{5} == S3) && (light{11}{5} == X5 || light{11}{5} == X7))
                                %car{cars}{7} = 1;
                            elseif(isequal(car{cars}{1}{car{cars}{3}+1}(1), 60) && isequal(car{cars}{1}{car{cars}{3}+1}(2), 60) && (light{11}{5} == X5))
                                %car{cars}{7} = 1;
                            elseif(isequal(car{cars}{1}{car{cars}{3}+1}(1), 60) && isequal(car{cars}{1}{car{cars}{3}+1}(2), -20) && (light{11}{5} == X5 || light{11}{5} == X3))
                                %car{cars}{7} = 1;
                            else
                                car{cars}{7} = 0;
                            end
                            
                        case 12 %E3
                            if((car{cars}{5} == W4 || car{cars}{5} == W3 || car{cars}{5} == W2) && (light{12}{5} == X7))
                                %car{cars}{7} = 1;
                            elseif((car{cars}{5} == S4 || car{cars}{5} == S3) && (light{12}{5} == X5 || light{12}{5} == X7))
                                %car{cars}{7} = 1;
                            else
                                car{cars}{7} = 0;
                            end
                            
                    end
                    break; %csak egy lampa elott lehetunk szoval a tobbire mar nem kell vizsgalni
                end
            end
        end
    end
end


end