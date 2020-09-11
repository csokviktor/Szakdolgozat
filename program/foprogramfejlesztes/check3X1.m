function check3X1()
global lampaciklusaktualis;
global lampaciklusnext;
global car;
global carnum;
global allow2;
global allow4;
global allow6;
global allow8;


allow2 = 0;
allow4 = 0;
allow6 = 0;
allow8 = 0;
breakbool2 = 0;
breakbool3 = 0;
breakbool4 = 0;
breakbool5 = 0;
breakbool6 = 0;
breakbool7 = 0;
breakbool8 = 0;
breakbool9 = 0;
breakbool10 = 0;
breakbool11 = 0;
breakbool12 = 0;
breakbool13 = 0;


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


if((lampaciklusaktualis == 1 && lampaciklusnext == 2) || (lampaciklusaktualis == 5 && lampaciklusnext == 2) || (lampaciklusaktualis == 7 && lampaciklusnext == 2) ...
        || (lampaciklusaktualis == 9 && lampaciklusnext == 2))
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && isequal(car{p}{2}.XData, s2n3pos{r}(1)) && isequal(car{p}{2}.YData, s2n3pos{r}(2)))
                breakbool2 = 1;
                break
            end
        end
        if(breakbool2 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow2 = 0;
            break;
        else %ha nem volt ott auto akkor oldjuk a tiltast
            allow2 = 1;
        end
    end
elseif((lampaciklusaktualis == 1 && lampaciklusnext == 4) || (lampaciklusaktualis == 3 && lampaciklusnext == 4) || (lampaciklusaktualis == 7 && lampaciklusnext == 4) ...
        || (lampaciklusaktualis == 9 && lampaciklusnext == 4))
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && isequal(car{p}{2}.XData, e2w3pos{r}(1)) && isequal(car{p}{2}.YData, e2w3pos{r}(2)))
                breakbool3 = 1;
                break
            end
        end
        if(breakbool3 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow4 = 0;
            break;
        else
            allow4 = 1;
        end
    end
elseif((lampaciklusaktualis == 1 && lampaciklusnext == 6) || (lampaciklusaktualis == 3 && lampaciklusnext == 6) || (lampaciklusaktualis == 5 && lampaciklusnext == 6) ...
        || (lampaciklusaktualis == 9 && lampaciklusnext == 6))
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && isequal(car{p}{2}.XData, n2s3pos{r}(1)) && isequal(car{p}{2}.YData, n2s3pos{r}(2)))
                breakbool4 = 1;
                break
            end
        end
        if(breakbool4 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow6 = 0;
            break
        else
            allow6 = 1;
        end
    end
elseif((lampaciklusaktualis == 1 && lampaciklusnext == 8) || (lampaciklusaktualis == 3 && lampaciklusnext == 8) || (lampaciklusaktualis == 5 && lampaciklusnext == 8) ...
        || (lampaciklusaktualis == 7 && lampaciklusnext == 8))
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && isequal(car{p}{2}.XData, w2e3pos{r}(1)) && isequal(car{p}{2}.YData, w2e3pos{r}(2)))
                breakbool5 = 1;
                break
            end
        end
        if(breakbool5 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow8 = 0;
            break
        else
            allow8 = 1;
        end
    end
    
elseif(lampaciklusaktualis == 2 && lampaciklusnext == 4)
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && ((isequal(car{p}{2}.XData, s2n3pos{r}(1)) && isequal(car{p}{2}.YData, s2n3pos{r}(2)) && (car{p}{3} < 19) ) || (isequal(car{p}{2}.XData, e2w3pos{r}(1)) && isequal(car{p}{2}.YData, e2w3pos{r}(2)) && (car{p}{3} < 21))))
                breakbool6 = 1;
                break
            end
        end
        if(breakbool6 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow4 = 0;
            break
        else
            allow4 = 1;
        end
    end
    
elseif(lampaciklusaktualis == 2 && lampaciklusnext == 8)
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && ((isequal(car{p}{2}.XData, s2n3pos{r}(1)) && isequal(car{p}{2}.YData, s2n3pos{r}(2))) || (isequal(car{p}{2}.XData, w2e3pos{r}(1)) && isequal(car{p}{2}.YData, w2e3pos{r}(2)))))
                breakbool7 = 1;
                break
            end
        end
        if(breakbool7 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow8 = 0;
            break
        else
            allow8 = 1;
        end
    end
    
elseif(lampaciklusaktualis == 4 && lampaciklusnext == 2)
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && ((isequal(car{p}{2}.XData, s2n3pos{r}(1)) && isequal(car{p}{2}.YData, s2n3pos{r}(2))) || (isequal(car{p}{2}.XData, e2w3pos{r}(1)) && isequal(car{p}{2}.YData, e2w3pos{r}(2)))))
                breakbool8 = 1;
                break
            end
        end
        if(breakbool8 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow2 = 0;
            break
        else
            allow2 = 1;
        end
    end

elseif(lampaciklusaktualis == 4 && lampaciklusnext == 6)
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && ((isequal(car{p}{2}.XData, n2s3pos{r}(1)) && isequal(car{p}{2}.YData, n2s3pos{r}(2))) || (isequal(car{p}{2}.XData, e2w3pos{r}(1)) && isequal(car{p}{2}.YData, e2w3pos{r}(2)))))
                breakbool9 = 1;
                break
            end
        end
        if(breakbool9 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow6 = 0;
            break
        else
            allow6 = 1;
        end
    end

elseif(lampaciklusaktualis == 6 && lampaciklusnext == 4)
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && ((isequal(car{p}{2}.XData, n2s3pos{r}(1)) && isequal(car{p}{2}.YData, n2s3pos{r}(2))) || (isequal(car{p}{2}.XData, e2w3pos{r}(1)) && isequal(car{p}{2}.YData, e2w3pos{r}(2)))))
                breakbool10 = 1;
                break
            end
        end
        if(breakbool10 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow4 = 0;
            break
        else
            allow4 = 1;
        end
    end

elseif(lampaciklusaktualis == 6 && lampaciklusnext == 8)
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && ((isequal(car{p}{2}.XData, n2s3pos{r}(1)) && isequal(car{p}{2}.YData, n2s3pos{r}(2))) || (isequal(car{p}{2}.XData, w2e3pos{r}(1)) && isequal(car{p}{2}.YData, w2e3pos{r}(2)))))
                breakbool11 = 1;
                break
            end
        end
        if(breakbool11 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow8 = 0;
            break
        else
            allow8 = 1;
        end
    end

elseif(lampaciklusaktualis == 8 && lampaciklusnext == 2)
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && ((isequal(car{p}{2}.XData, s2n3pos{r}(1)) && isequal(car{p}{2}.YData, s2n3pos{r}(2))) || (isequal(car{p}{2}.XData, w2e3pos{r}(1)) && isequal(car{p}{2}.YData, w2e3pos{r}(2)))))
                breakbool12 = 1;
                break
            end
        end
        if(breakbool12 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow2 = 0;
            break
        else
            allow2 = 1;
        end
    end

elseif(lampaciklusaktualis == 8 && lampaciklusnext == 6)
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && ((isequal(car{p}{2}.XData, n2s3pos{r}(1)) && isequal(car{p}{2}.YData, n2s3pos{r}(2))) || (isequal(car{p}{2}.XData, w2e3pos{r}(1)) && isequal(car{p}{2}.YData, w2e3pos{r}(2)))))
                breakbool13 = 1;
                break
            end
        end
        if(breakbool13 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow6 = 0;
            break
        else
            allow6 = 1;
        end
    end

end
end