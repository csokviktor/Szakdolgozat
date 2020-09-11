function changeRouteDeploy()
global car;
global lampaciklusaktualis;
global lampaciklusnext;
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

%ujonnan hozaadott autok utvonalat frissiti a kovetkezo ciklusnak megfeleloen
%% 2x2 - 2x2 kozotti valtasok (minden ujat frissitunk a kovetkezo szerint)
if((lampaciklusaktualis == 1 && lampaciklusnext == 3) || (lampaciklusaktualis == 1 && lampaciklusnext == 5) || (lampaciklusaktualis == 1 && lampaciklusnext == 7)...
        || (lampaciklusaktualis == 1 && lampaciklusnext == 9) || (lampaciklusaktualis == 3 && lampaciklusnext == 1) || (lampaciklusaktualis == 3 && lampaciklusnext == 5)...
        || (lampaciklusaktualis == 3 && lampaciklusnext == 7) || (lampaciklusaktualis == 3 && lampaciklusnext == 9) || (lampaciklusaktualis == 5 && lampaciklusnext == 1)...
        || (lampaciklusaktualis == 5 && lampaciklusnext == 3) || (lampaciklusaktualis == 5 && lampaciklusnext == 7) || (lampaciklusaktualis == 5 && lampaciklusnext == 9)...
        || (lampaciklusaktualis == 7 && lampaciklusnext == 1) || (lampaciklusaktualis == 7 && lampaciklusnext == 3) || (lampaciklusaktualis == 7 && lampaciklusnext == 5)...
        || (lampaciklusaktualis == 7 && lampaciklusnext == 9) || (lampaciklusaktualis == 9 && lampaciklusnext == 1) || (lampaciklusaktualis == 9 && lampaciklusnext == 3)...
        || (lampaciklusaktualis == 9 && lampaciklusnext == 5) || (lampaciklusaktualis == 9 && lampaciklusnext == 7))
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, -60) && isequal(car{k}{2}.YData, 600)) || (isequal(car{k}{2}.XData, -20) && isequal(car{k}{2}.YData, 600))...
                || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60)) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20))...
                || (isequal(car{k}{2}.XData, 60) && isequal(car{k}{2}.YData, -600)) || (isequal(car{k}{2}.XData, 20) && isequal(car{k}{2}.YData, -600))...
                || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)))
            changeRoute2(lampaciklusnext,k);
        end
    end
end


%% 3x1 - 2x2 kozotti valtasok
% 2x2-bol 3x1-be
if((lampaciklusaktualis == 1 && lampaciklusnext == 2) || (lampaciklusaktualis == 5 && lampaciklusnext == 2) || (lampaciklusaktualis == 7 && lampaciklusnext == 2) ...
        || (lampaciklusaktualis == 9 && lampaciklusnext == 2)) %W-t S-t E-t frissitem
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60) && (isequal(car{k}{5},N3) || isequal(car{k}{5},N4))) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20) && (isequal(car{k}{5},N3) || isequal(car{k}{5},N4)))...
                || (isequal(car{k}{2}.XData, 60) && isequal(car{k}{2}.YData, -600)) || (isequal(car{k}{2}.XData, 20) && isequal(car{k}{2}.YData, -600))...
                || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60) && (isequal(car{k}{5},N3) || isequal(car{k}{5},N4))) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20) && (isequal(car{k}{5},N3) || isequal(car{k}{5},N4))))
            changeRoute2(lampaciklusnext,k);
        end
    end
elseif((lampaciklusaktualis == 1 && lampaciklusnext == 4) || (lampaciklusaktualis == 3 && lampaciklusnext == 4) || (lampaciklusaktualis == 7 && lampaciklusnext == 4) ...
        || (lampaciklusaktualis == 9 && lampaciklusnext == 4)) %N-t S-t E-t frissitem
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, -60) && isequal(car{k}{2}.YData, 600) && (isequal(car{k}{5},W3) || isequal(car{k}{5},W4))) || (isequal(car{k}{2}.XData, -20) && isequal(car{k}{2}.YData, 600) && (isequal(car{k}{5},W3) || isequal(car{k}{5},W4)))...
                || (isequal(car{k}{2}.XData, 60) && isequal(car{k}{2}.YData, -600) && (isequal(car{k}{5},W3) || isequal(car{k}{5},W4))) || (isequal(car{k}{2}.XData, 20) && isequal(car{k}{2}.YData, -600) && (isequal(car{k}{5},W3) || isequal(car{k}{5},W4)))...
                || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)))
            changeRoute2(lampaciklusnext,k);
        end
    end
elseif((lampaciklusaktualis == 1 && lampaciklusnext == 6) || (lampaciklusaktualis == 3 && lampaciklusnext == 6) || (lampaciklusaktualis == 5 && lampaciklusnext == 6) ...
        || (lampaciklusaktualis == 9 && lampaciklusnext == 6)) %N-t W-t E-tfrissitem
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, -60) && isequal(car{k}{2}.YData, 600)) || (isequal(car{k}{2}.XData, -20) && isequal(car{k}{2}.YData, 600))...
                || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60) && (isequal(car{k}{5},S3) || isequal(car{k}{5},S4))) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20) && (isequal(car{k}{5},S3) || isequal(car{k}{5},S4)))...
                || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60) && (isequal(car{k}{5},S3) || isequal(car{k}{5},S4))) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)) && (isequal(car{k}{5},S3) || isequal(car{k}{5},S4)))
            changeRoute2(lampaciklusnext,k);
        end
    end
elseif((lampaciklusaktualis == 1 && lampaciklusnext == 8) || (lampaciklusaktualis == 3 && lampaciklusnext == 8) || (lampaciklusaktualis == 5 && lampaciklusnext == 8) ...
        || (lampaciklusaktualis == 7 && lampaciklusnext == 8)) %N-t W-t S-t frissitem
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, -60) && isequal(car{k}{2}.YData, 600) && (isequal(car{k}{5},E3) || isequal(car{k}{5},E4))) || (isequal(car{k}{2}.XData, -20) && isequal(car{k}{2}.YData, 600) && (isequal(car{k}{5},E3) || isequal(car{k}{5},E4)))...
                || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60)) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20))...
                || (isequal(car{k}{2}.XData, 60) && isequal(car{k}{2}.YData, -600) && (isequal(car{k}{5},E3) || isequal(car{k}{5},E4))) || (isequal(car{k}{2}.XData, 20) && isequal(car{k}{2}.YData, -600) && (isequal(car{k}{5},E3) || isequal(car{k}{5},E4))))
            changeRoute2(lampaciklusnext,k);
        end
    end


    
    
    
% 3x1-bol 3x1-be
elseif(lampaciklusaktualis == 2 && lampaciklusnext == 4)
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, -60) && isequal(car{k}{2}.YData, 600)) || (isequal(car{k}{2}.XData, -20) && isequal(car{k}{2}.YData, 600))...
                || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)))
            changeRoute2(lampaciklusnext,k);
        end
    end
elseif(lampaciklusaktualis == 2 && lampaciklusnext == 8)
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, -60) && isequal(car{k}{2}.YData, 600)) || (isequal(car{k}{2}.XData, -20) && isequal(car{k}{2}.YData, 600))...
                || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60)) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20)))
            changeRoute2(lampaciklusnext,k);
        end
    end
elseif(lampaciklusaktualis == 4 && lampaciklusnext == 2)
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60)) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20))...
                || (isequal(car{k}{2}.XData, 60) && isequal(car{k}{2}.YData, -600)) || (isequal(car{k}{2}.XData, 20) && isequal(car{k}{2}.YData, -600)))
            changeRoute2(lampaciklusnext,k);
        end
    end
elseif(lampaciklusaktualis == 4 && lampaciklusnext == 6)
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, -60) && isequal(car{k}{2}.YData, 600)) || (isequal(car{k}{2}.XData, -20) && isequal(car{k}{2}.YData, 600))...
                || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60)) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20)))
            changeRoute2(lampaciklusnext,k);
        end
    end
elseif(lampaciklusaktualis == 6 && lampaciklusnext == 4)
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, 60) && isequal(car{k}{2}.YData, -600)) || (isequal(car{k}{2}.XData, 20) && isequal(car{k}{2}.YData, -600))...
                || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)))
            changeRoute2(lampaciklusnext,k);
        end
    end
elseif(lampaciklusaktualis == 6 && lampaciklusnext == 8)
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60)) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20))...
                || (isequal(car{k}{2}.XData, 60) && isequal(car{k}{2}.YData, -600)) || (isequal(car{k}{2}.XData, 20) && isequal(car{k}{2}.YData, -600)))
            changeRoute2(lampaciklusnext,k);
        end
    end
elseif(lampaciklusaktualis == 8 && lampaciklusnext == 2)
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, 60) && isequal(car{k}{2}.YData, -600)) || (isequal(car{k}{2}.XData, 20) && isequal(car{k}{2}.YData, -600))...
                || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)))
            changeRoute2(lampaciklusnext,k);
        end
    end
elseif(lampaciklusaktualis == 8 && lampaciklusnext == 6)
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, -60) && isequal(car{k}{2}.YData, 600)) || (isequal(car{k}{2}.XData, -20) && isequal(car{k}{2}.YData, 600))...
                || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)))
            changeRoute2(lampaciklusnext,k);
        end
    end

    
% 3x1-bol 2x2-be
elseif((lampaciklusaktualis == 2 && lampaciklusnext == 1) || (lampaciklusaktualis == 2 && lampaciklusnext == 3) || (lampaciklusaktualis == 2 && lampaciklusnext == 5) ...
        || (lampaciklusaktualis == 2 && lampaciklusnext == 7) || (lampaciklusaktualis == 2 && lampaciklusnext == 9))
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, -60) && isequal(car{k}{2}.YData, 600)) || (isequal(car{k}{2}.XData, -20) && isequal(car{k}{2}.YData, 600)))
            changeRoute2(lampaciklusnext,k);
        end
    end
elseif((lampaciklusaktualis == 4 && lampaciklusnext == 1) || (lampaciklusaktualis == 4 && lampaciklusnext == 3) || (lampaciklusaktualis == 4 && lampaciklusnext == 5) ...
        || (lampaciklusaktualis == 4 && lampaciklusnext == 7) || (lampaciklusaktualis == 4 && lampaciklusnext == 9))
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60)) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20)))
            changeRoute2(lampaciklusnext,k);
        end
    end
elseif((lampaciklusaktualis == 6 && lampaciklusnext == 1) || (lampaciklusaktualis == 6 && lampaciklusnext == 3) || (lampaciklusaktualis == 6 && lampaciklusnext == 5) ...
        || (lampaciklusaktualis == 6 && lampaciklusnext == 7) || (lampaciklusaktualis == 6 && lampaciklusnext == 9))
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, 60) && isequal(car{k}{2}.YData, -600)) || (isequal(car{k}{2}.XData, 20) && isequal(car{k}{2}.YData, -600)))
            changeRoute2(lampaciklusnext,k);
        end
    end
elseif((lampaciklusaktualis == 8 && lampaciklusnext == 1) || (lampaciklusaktualis == 8 && lampaciklusnext == 3) || (lampaciklusaktualis == 8 && lampaciklusnext == 5) ...
        || (lampaciklusaktualis == 8 && lampaciklusnext == 7) || (lampaciklusaktualis == 8 && lampaciklusnext == 9))
    for k = 1:carnum
        if((isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)))
            changeRoute2(lampaciklusnext,k);
        end
    end

end

end