function check2x2()
global lampaciklusaktualis;
global lampaciklusnext;
global car;
global carnum;
global allow2x2;

allow2x2 = 0;
breakbool1 = 0;
bkreakbool2 = 0;
breakbool3 = 0;
breakbool4 = 0;

% 2x2 elosztas ellenorzesehez
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

if((lampaciklusaktualis == 2 && lampaciklusnext == 1) || (lampaciklusaktualis == 2 && lampaciklusnext == 3) || (lampaciklusaktualis == 2 && lampaciklusnext == 5) ...
        || (lampaciklusaktualis == 2 && lampaciklusnext == 7) || (lampaciklusaktualis == 2 && lampaciklusnext == 9))
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && isequal(car{p}{2}.XData, s2n3pos{r}(1)) && isequal(car{p}{2}.YData, s2n3pos{r}(2)))
                breakbool1 = 1;
                break
            end
        end
        if(breakbool1 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow2x2 = 0;
            break;
        else %ha nem volt ott auto akkor oldjuk a tiltast
            allow2x2 = 1;
        end
    end
elseif((lampaciklusaktualis == 4 && lampaciklusnext == 1) || (lampaciklusaktualis == 4 && lampaciklusnext == 3) || (lampaciklusaktualis == 4 && lampaciklusnext == 5) ...
        || (lampaciklusaktualis == 4 && lampaciklusnext == 7) || (lampaciklusaktualis == 4 && lampaciklusnext == 9))
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && isequal(car{p}{2}.XData, e2w3pos{r}(1)) && isequal(car{p}{2}.YData, e2w3pos{r}(2)))
                breakbool2 = 1;
                break
            end
        end
        if(breakbool2 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow2x2 = 0;
            break;
        else %ha nem volt ott auto akkor oldjuk a tiltast
            allow2x2 = 1;
        end
    end
elseif((lampaciklusaktualis == 6 && lampaciklusnext == 1) || (lampaciklusaktualis == 6 && lampaciklusnext == 3) || (lampaciklusaktualis == 6 && lampaciklusnext == 5) ...
        || (lampaciklusaktualis == 6 && lampaciklusnext == 7) || (lampaciklusaktualis == 6 && lampaciklusnext == 9))
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && isequal(car{p}{2}.XData, n2s3pos{r}(1)) && isequal(car{p}{2}.YData, n2s3pos{r}(2)))
                breakbool3 = 1;
                break
            end
        end
        if(breakbool3 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow2x2 = 0;
            break;
        else %ha nem volt ott auto akkor oldjuk a tiltast
            allow2x2 = 1;
        end
    end
elseif((lampaciklusaktualis == 8 && lampaciklusnext == 1) || (lampaciklusaktualis == 8 && lampaciklusnext == 3) || (lampaciklusaktualis == 8 && lampaciklusnext == 5) ...
        || (lampaciklusaktualis == 8 && lampaciklusnext == 7) || (lampaciklusaktualis == 8 && lampaciklusnext == 9))
    for p = 1:carnum
        for r = 1:26
            if(car{p}{8} == 0 && isequal(car{p}{2}.XData, w2e3pos{r}(1)) && isequal(car{p}{2}.YData, w2e3pos{r}(2)))
                breakbool4 = 1;
                break
            end
        end
        if(breakbool4 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
            allow2x2 = 0;
            break;
        else %ha nem volt ott auto akkor oldjuk a tiltast
            allow2x2 = 1;
        end
    end
else
    allow2x2 = 1;
end
end