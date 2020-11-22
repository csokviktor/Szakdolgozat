function checkForTrafficJam()
global car;
global carnum;

global lampaciklusnext;
global lampaciklusnexttemp;
global lampaciklusaktualis;

global intelligent;

global cycleVerificationCntr;

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

global jamBoolN;
global jamBoolW;
global jamBoolS;
global jamBoolE;

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

jamN = zeros(1,6);
jamW = zeros(1,6);
jamS = zeros(1,6);
jamE = zeros(1,6);


nStraightCntr = 0;
nLeftCntr = 0;
nOtherCntr = 0;

wStraightCntr = 0;
wLeftCntr = 0;
wOtherCntr = 0;

sStraightCntr = 0;
sLeftCntr = 0;
sOtherCntr = 0;

eStraightCntr = 0;
eLeftCntr = 0;
eOtherCntr = 0;

%% torlodas letezesenek vizsgalata
for o = 1:carnum
    %északi oldal
    if(isequal(car{o}{2}.XData, nlane1{3}(1)) && isequal(car{o}{2}.YData, nlane1{3}(2)))
        jamN(1) = 1;
    elseif(isequal(car{o}{2}.XData, nlane1{4}(1)) && isequal(car{o}{2}.YData, nlane1{4}(2)) && isequal(car{o}{7},0))
        jamN(2) = 1;
    elseif(isequal(car{o}{2}.XData, nlane2{3}(1)) && isequal(car{o}{2}.YData, nlane2{3}(2))...
            &&  (~isequal(car{o}{5}, N1) && ~isequal(car{o}{5}, N2) && ~isequal(car{o}{5}, N3) && ~isequal(car{o}{5}, N4)))
        jamN(3) = 1;
    elseif(isequal(car{o}{2}.XData, nlane2{4}(1)) && isequal(car{o}{2}.YData, nlane2{4}(2)) && isequal(car{o}{7},0)...
            &&  (~isequal(car{o}{5}, N1) && ~isequal(car{o}{5}, N2) && ~isequal(car{o}{5}, N3) && ~isequal(car{o}{5}, N4)))
        jamN(4) = 1;
    elseif(isequal(car{o}{2}.XData, nlane3{3}(1)) && isequal(car{o}{2}.YData, nlane3{3}(2))...
            &&  (~isequal(car{o}{5}, N1) && ~isequal(car{o}{5}, N2) && ~isequal(car{o}{5}, N3) && ~isequal(car{o}{5}, N4)))
        jamN(5) = 1;
    elseif(isequal(car{o}{2}.XData, nlane3{4}(1)) && isequal(car{o}{2}.YData, nlane3{4}(2)) && isequal(car{o}{7},0)...
            &&  (~isequal(car{o}{5}, N1) && ~isequal(car{o}{5}, N2) && ~isequal(car{o}{5}, N3) && ~isequal(car{o}{5}, N4)))
        jamN(6) = 1;
        
        %nyugati oldal
    elseif(isequal(car{o}{2}.XData, wlane1{3}(1)) && isequal(car{o}{2}.YData, wlane1{3}(2)))
        jamW(1) = 1;
    elseif(isequal(car{o}{2}.XData, wlane1{4}(1)) && isequal(car{o}{2}.YData, wlane1{4}(2)) && isequal(car{o}{7},0))
        jamW(2) = 1;
    elseif(isequal(car{o}{2}.XData, wlane2{3}(1)) && isequal(car{o}{2}.YData, wlane2{3}(2))...
            &&  (~isequal(car{o}{5}, W1) && ~isequal(car{o}{5}, W2) && ~isequal(car{o}{5}, W3) && ~isequal(car{o}{5}, W4)))
        jamW(3) = 1;
    elseif(isequal(car{o}{2}.XData, wlane2{4}(1)) && isequal(car{o}{2}.YData, wlane2{4}(2)) && isequal(car{o}{7},0)...
            &&  (~isequal(car{o}{5}, W1) && ~isequal(car{o}{5}, W2) && ~isequal(car{o}{5}, W3) && ~isequal(car{o}{5}, W4)))
        jamW(4) = 1;
    elseif(isequal(car{o}{2}.XData, wlane3{3}(1)) && isequal(car{o}{2}.YData, wlane3{3}(2))...
            &&  (~isequal(car{o}{5}, W1) && ~isequal(car{o}{5}, W2) && ~isequal(car{o}{5}, W3) && ~isequal(car{o}{5}, W4)))
        jamW(5) = 1;
    elseif(isequal(car{o}{2}.XData, wlane3{4}(1)) && isequal(car{o}{2}.YData, wlane3{4}(2)) && isequal(car{o}{7},0)...
            &&  (~isequal(car{o}{5}, W1) && ~isequal(car{o}{5}, W2) && ~isequal(car{o}{5}, W3) && ~isequal(car{o}{5}, W4)))
        jamW(6) = 1;
        
        %déli oldal
    elseif(isequal(car{o}{2}.XData, slane1{3}(1)) && isequal(car{o}{2}.YData, slane1{3}(2)))
        jamS(1) = 1;
    elseif(isequal(car{o}{2}.XData, slane1{4}(1)) && isequal(car{o}{2}.YData, slane1{4}(2)) && isequal(car{o}{7},0))
        jamS(2) = 1;
    elseif(isequal(car{o}{2}.XData, slane2{3}(1)) && isequal(car{o}{2}.YData, slane2{3}(2))...
            &&  (~isequal(car{o}{5}, S1) && ~isequal(car{o}{5}, S2) && ~isequal(car{o}{5}, S3) && ~isequal(car{o}{5}, S4)))
        jamS(3) = 1;
    elseif(isequal(car{o}{2}.XData, slane2{4}(1)) && isequal(car{o}{2}.YData, slane2{4}(2)) && isequal(car{o}{7},0)...
            &&  (~isequal(car{o}{5}, S1) && ~isequal(car{o}{5}, S2) && ~isequal(car{o}{5}, S3) && ~isequal(car{o}{5}, S4)))
        jamS(4) = 1;
    elseif(isequal(car{o}{2}.XData, slane3{3}(1)) && isequal(car{o}{2}.YData, slane3{3}(2))...
            &&  (~isequal(car{o}{5}, S1) && ~isequal(car{o}{5}, S2) && ~isequal(car{o}{5}, S3) && ~isequal(car{o}{5}, S4)))
        jamS(5) = 1;
    elseif(isequal(car{o}{2}.XData, slane3{4}(1)) && isequal(car{o}{2}.YData, slane3{4}(2)) && isequal(car{o}{7},0)...
            &&  (~isequal(car{o}{5}, S1) && ~isequal(car{o}{5}, S2) && ~isequal(car{o}{5}, S3) && ~isequal(car{o}{5}, S4)))
        jamS(6) = 1;
        
        %keleti oldal
    elseif(isequal(car{o}{2}.XData, elane1{3}(1)) && isequal(car{o}{2}.YData, elane1{3}(2)))
        jamE(1) = 1;
    elseif(isequal(car{o}{2}.XData, elane1{4}(1)) && isequal(car{o}{2}.YData, elane1{4}(2)) && isequal(car{o}{7},0))
        jamE(2) = 1;
    elseif(isequal(car{o}{2}.XData, elane2{3}(1)) && isequal(car{o}{2}.YData, elane2{3}(2))...
            &&  (~isequal(car{o}{5}, E1) && ~isequal(car{o}{5}, E2) && ~isequal(car{o}{5}, E3) && ~isequal(car{o}{5}, E4)))
        jamE(3) = 1;
    elseif(isequal(car{o}{2}.XData, elane2{4}(1)) && isequal(car{o}{2}.YData, elane2{4}(2)) && isequal(car{o}{7},0)...
            &&  (~isequal(car{o}{5}, E1) && ~isequal(car{o}{5}, E2) && ~isequal(car{o}{5}, E3) && ~isequal(car{o}{5}, E4)))
        jamE(4) = 1;
    elseif(isequal(car{o}{2}.XData, elane3{3}(1)) && isequal(car{o}{2}.YData, elane3{3}(2))...
            &&  (~isequal(car{o}{5}, E1) && ~isequal(car{o}{5}, E2) && ~isequal(car{o}{5}, E3) && ~isequal(car{o}{5}, E4)))
        jamE(5) = 1;
    elseif(isequal(car{o}{2}.XData, elane3{4}(1)) && isequal(car{o}{2}.YData, elane3{4}(2)) && isequal(car{o}{7},0)...
            &&  (~isequal(car{o}{5}, E1) && ~isequal(car{o}{5}, E2) && ~isequal(car{o}{5}, E3) && ~isequal(car{o}{5}, E4)))
        jamE(6) = 1;
    end
end



%% torlodas okanak vizsgalata, megszamoljuk h ki merre akar menni

%Eszaki oldal
if((jamN(1) == 1 && jamN(2) == 1)...
    || (jamN(3) == 1 && jamN(4) == 1)...
    || (jamN(5) == 1 && jamN(6) == 1))
    for t = 1:carnum
        for r = 1:11
            if((isequal(car{t}{2}.XData, nlane1{r}(1)) && isequal(car{t}{2}.YData, nlane1{r}(2)))...
                    || (isequal(car{t}{2}.XData, nlane2{r}(1)) && isequal(car{t}{2}.YData, nlane2{r}(2)))...
                    || (isequal(car{t}{2}.XData, nlane3{r}(1)) && isequal(car{t}{2}.YData, nlane3{r}(2)))...
                    && (~isequal(car{o}{5}, N1) && ~isequal(car{o}{5}, N2) && ~isequal(car{o}{5}, N3) && ~isequal(car{o}{5}, N4)))
                if(isequal(car{t}{5}, S2) || isequal(car{t}{5}, S3) || isequal(car{t}{5}, S4))
                    nStraightCntr = nStraightCntr + 1;
                elseif(isequal(car{t}{5}, E2) || isequal(car{t}{5}, E3) || isequal(car{t}{5}, E4))
                    nLeftCntr = nLeftCntr + 1;
                else
                    nOtherCntr = nOtherCntr + 1;
                end
            end
        end
    end
    jamBoolN = 1;
else
    jamBoolN = 0;
end

%Nyugati oldal
if((jamW(1) == 1 && jamW(2) == 1)...
    || (jamW(3) == 1 && jamW(4) == 1)...
    || (jamW(5) == 1 && jamW(6) == 1))
    for t = 1:carnum
        for r = 1:11
            if((isequal(car{t}{2}.XData, wlane1{r}(1)) && isequal(car{t}{2}.YData, wlane1{r}(2)))...
                    || (isequal(car{t}{2}.XData, wlane2{r}(1)) && isequal(car{t}{2}.YData, wlane2{r}(2)))...
                    || (isequal(car{t}{2}.XData, wlane3{r}(1)) && isequal(car{t}{2}.YData, wlane3{r}(2)))...
                    && (~isequal(car{o}{5}, W1) && ~isequal(car{o}{5}, W2) && ~isequal(car{o}{5}, W3) && ~isequal(car{o}{5}, W4)))
                if(isequal(car{t}{5}, E2) || isequal(car{t}{5}, E3) || isequal(car{t}{5}, E4))
                    wStraightCntr = wStraightCntr + 1;
                elseif(isequal(car{t}{5}, N2) || isequal(car{t}{5}, N3) || isequal(car{t}{5}, N4))
                    wLeftCntr = wLeftCntr + 1;
                else
                    wOtherCntr = wOtherCntr + 1;
                end
            end
        end
    end
    jamBoolW = 1;
else
    jamBoolW = 0;
end

%Deli oldal
if((jamS(1) == 1 && jamS(2) == 1)...
    || (jamS(3) == 1 && jamS(4) == 1)...
    || (jamS(5) == 1 && jamS(6) == 1))
    for t = 1:carnum
        for r = 1:11
            if((isequal(car{t}{2}.XData, slane1{r}(1)) && isequal(car{t}{2}.YData, slane1{r}(2)))...
                    || (isequal(car{t}{2}.XData, slane2{r}(1)) && isequal(car{t}{2}.YData, slane2{r}(2)))...
                    || (isequal(car{t}{2}.XData, slane3{r}(1)) && isequal(car{t}{2}.YData, slane3{r}(2)))...
                    && (~isequal(car{o}{5}, S1) && ~isequal(car{o}{5}, S2) && ~isequal(car{o}{5}, S3) && ~isequal(car{o}{5}, S4)))
                if(isequal(car{t}{5}, N2) || isequal(car{t}{5}, N3) || isequal(car{t}{5}, N4))
                    sStraightCntr = sStraightCntr + 1;
                elseif(isequal(car{t}{5}, W2) || isequal(car{t}{5}, W3) || isequal(car{t}{5}, W4))
                    sLeftCntr = sLeftCntr + 1;
                else
                    sOtherCntr = sOtherCntr + 1;
                end
            end
        end
    end
    jamBoolS = 1;
else
    jamBoolS = 0;
end

%Keltei oldal
if((jamE(1) == 1 && jamE(2) == 1)...
    || (jamE(3) == 1 && jamE(4) == 1)...
    || (jamE(5) == 1 && jamE(6) == 1))
    for t = 1:carnum
        for r = 1:11
            if((isequal(car{t}{2}.XData, elane1{r}(1)) && isequal(car{t}{2}.YData, elane1{r}(2)))...
                    || (isequal(car{t}{2}.XData, elane2{r}(1)) && isequal(car{t}{2}.YData, elane2{r}(2)))...
                    || (isequal(car{t}{2}.XData, elane3{r}(1)) && isequal(car{t}{2}.YData, elane3{r}(2)))...
                    && (~isequal(car{o}{5}, E1) && ~isequal(car{o}{5}, E2) && ~isequal(car{o}{5}, E3) && ~isequal(car{o}{5}, E4)))
                if(isequal(car{t}{5}, W2) || isequal(car{t}{5}, W3) || isequal(car{t}{5}, W4))
                    eStraightCntr = eStraightCntr + 1;
                elseif(isequal(car{t}{5}, S2) || isequal(car{t}{5}, S3) || isequal(car{t}{5}, S4))
                    eLeftCntr = eLeftCntr + 1;
                else
                    eOtherCntr = eOtherCntr + 1;
                end
            end
        end
    end
    jamBoolE = 1;
else
    jamBoolE = 0;
end


%% Eldontjuk milyen ciklus kovetkezzen ha meg nincs kivalasztva uj
if(intelligent == 1)
    if(lampaciklusnext == lampaciklusaktualis)
        if((jamBoolN == 1) || (jamBoolW == 1) || (jamBoolS == 1) || (jamBoolE == 1))
            nCarNum = nOtherCntr + nStraightCntr + nLeftCntr;
            wCarNum = wOtherCntr + wStraightCntr + wLeftCntr;
            sCarNum = sOtherCntr + sStraightCntr + sLeftCntr;
            eCarNum = eOtherCntr + eStraightCntr + eLeftCntr;
        end
        
        
        %North
        if((jamBoolN == 1) && (jamBoolW == 0) && (jamBoolS == 0) && (jamBoolE == 0))
            decideNextCycleN()
        elseif((jamBoolN == 1) && (jamBoolW == 1) && (jamBoolS == 0) && (jamBoolE == 0))
            if(nCarNum > wCarNum + 4)
                decideNextCycleN()
            elseif(wCarNum > nCarNum + 4)
                decideNextCycleW()
            else
                lampaciklusnext = lampaciklusaktualis;
            end
        elseif((jamBoolN == 1) && (jamBoolW == 0) && (jamBoolS == 1) && (jamBoolE == 0))
            if(nCarNum > sCarNum + 4)
                decideNextCycleN()
            elseif(sCarNum > nCarNum + 4)
                decideNextCycleS()
            else
                lampaciklusnext = lampaciklusaktualis;
            end
        elseif((jamBoolN == 1) && (jamBoolW == 0) && (jamBoolS == 0) && (jamBoolE == 1))
            if(nCarNum > eCarNum + 4)
                decideNextCycleN()
            elseif(eCarNum > nCarNum + 4)
                decideNextCycleE()
            else
                lampaciklusnext = lampaciklusaktualis;
            end
            
            
            %West
        elseif((jamBoolN == 0) && (jamBoolW == 1) && (jamBoolS == 0) && (jamBoolE == 0))
            decideNextCycleW()
        elseif((jamBoolN == 1) && (jamBoolW == 1) && (jamBoolS == 0) && (jamBoolE == 0))
            if(wCarNum > nCarNum + 4)
                decideNextCycleW()
            elseif(nCarNum > wCarNum + 4)
                decideNextCycleN()
            else
                lampaciklusnext = lampaciklusaktualis;
            end
        elseif((jamBoolN == 0) && (jamBoolW == 1) && (jamBoolS == 1) && (jamBoolE == 0))
            if(wCarNum > sCarNum + 4)
                decideNextCycleW()
            elseif(sCarNum > wCarNum + 4)
                decideNextCycleS()
            else
                lampaciklusnext = lampaciklusaktualis;
            end
        elseif((jamBoolN == 0) && (jamBoolW == 1) && (jamBoolS == 0) && (jamBoolE == 1))
            if(wCarNum > eCarNum + 4)
                decideNextCycleW()
            elseif(eCarNum > wCarNum + 4)
                decideNextCycleE()
            else
                lampaciklusnext = lampaciklusaktualis;
            end
            
            
            %South
        elseif((jamBoolN == 0) && (jamBoolW == 0) && (jamBoolS == 1) && (jamBoolE == 0))
            decideNextCycleS()
        elseif((jamBoolN == 1) && (jamBoolW == 0) && (jamBoolS == 1) && (jamBoolE == 0))
            if(sCarNum > nCarNum + 4)
                decideNextCycleS()
            elseif(nCarNum > sCarNum + 4)
                decideNextCycleN()
            else
                lampaciklusnext = lampaciklusaktualis;
            end
        elseif((jamBoolN == 0) && (jamBoolW == 1) && (jamBoolS == 1) && (jamBoolE == 0))
            if(sCarNum > wCarNum + 4)
                decideNextCycleS()
            elseif(wCarNum > sCarNum + 4)
                decideNextCycleW()
            else
                lampaciklusnext = lampaciklusaktualis;
            end
        elseif((jamBoolN == 0) && (jamBoolW == 0) && (jamBoolS == 1) && (jamBoolE == 1))
            if(sCarNum > eCarNum + 4)
                decideNextCycleS()
            elseif(eCarNum > sCarNum + 4)
                decideNextCycleE()
            else
                lampaciklusnext = lampaciklusaktualis;
            end
            
            
            %East
        elseif((jamBoolN == 0) && (jamBoolW == 0) && (jamBoolS == 0) && (jamBoolE == 1))
            decideNextCycleE()
        elseif((jamBoolN == 1) && (jamBoolW == 0) && (jamBoolS == 0) && (jamBoolE == 1))
            if(eCarNum > nCarNum + 4)
                decideNextCycleE()
            elseif(nCarNum > eCarNum + 4)
                decideNextCycleN()
            else
                lampaciklusnext = lampaciklusaktualis;
            end
        elseif((jamBoolN == 0) && (jamBoolW == 1) && (jamBoolS == 0) && (jamBoolE == 1))
            if(eCarNum > wCarNum + 4)
                decideNextCycleE()
            elseif(wCarNum > eCarNum + 4)
                decideNextCycleW()
            else
                lampaciklusnext = lampaciklusaktualis;
            end
        elseif((jamBoolN == 0) && (jamBoolW == 0) && (jamBoolS == 1) && (jamBoolE == 1))
            if(eCarNum > sCarNum + 4)
                decideNextCycleE()
            elseif(sCarNum > eCarNum + 4)
                decideNextCycleS()
            else
                lampaciklusnext = lampaciklusaktualis;
            end
            
        else
            if((lampaciklusnexttemp(1) == 0))
                lampaciklusnexttemp(1) = 1;
            elseif(cycleVerificationCntr == 8)
                lampaciklusnexttemp(2) = 1;
            end
        end
        
        if(lampaciklusnexttemp(1) == lampaciklusaktualis)
            lampaciklusnexttemp(1) = 0;
        else
            valami = 1;
        end
    end
    
    
    
    
    %% Verifikalas uj ciklus engedelyezesehez ha valtozik a tipus
    %lampaciklusnexttemp = [fix, valtozo]
    %uj otlet lampaciklusnexttemp = [elozo, mostani]
    %kivalaszt elozot, var x mennyiseget kovi kivalasztasahoz, ha a ketto
    %egyezik akkor mehet kovi ciklus engedelyezese
    
    if(lampaciklusnexttemp(1) ~= 0)
        if((cycleVerificationCntr == 8) && (lampaciklusnexttemp(1) == lampaciklusnexttemp(2))) %enged uj ciklus és nulláz
            lampaciklusnext = lampaciklusnexttemp(1);
            lampaciklusnexttemp = [0 0];
            cycleVerificationCntr = 0;
        elseif((cycleVerificationCntr == 8) && (lampaciklusnexttemp(1) ~= lampaciklusnexttemp(2))) %csak nullaz
            lampaciklusnexttemp = [0 0];
            cycleVerificationCntr = 0;
        end
        %cycleVerificationCntr = cycleVerificationCntr + 1;
    end
end

%     if(lampaciklusnexttemp(1) == lampaciklusnexttemp(2))
%         cycleVerificationCntr = cycleVerificationCntr + 1;
%         if(cycleVerificationCntr == 10)
%             lampaciklusnext = lampaciklusnexttemp(1);
%             lampaciklusnexttemp = [0 0];
%             cycleVerificationCntr = 0;
%         end
%     else
%         lampaciklusnexttemp = [0 0];
%         cycleVerificationCntr = 0;
%     end




% if(lampaciklusnexttemp(1) == 0)
%     lampaciklusnexttemp(1) = 2;
%     lampaciklusnexttemp(2) = 2;
% else
%     lampaciklusnexttemp(2) = 2;
% end


%% Global fuggvenyek
    function decideNextCycleN()
        if(nStraightCntr > nLeftCntr + 2)
            if((lampaciklusnexttemp(1) == 0))
                lampaciklusnexttemp(1) = 2;
            elseif(cycleVerificationCntr == 8)
                lampaciklusnexttemp(2) = 2;
            end
        elseif(nLeftCntr > nStraightCntr + 3)
            if((lampaciklusnexttemp(1) == 0))
                lampaciklusnexttemp(1) = 3;
            elseif(cycleVerificationCntr == 8)
                lampaciklusnexttemp(2) = 3;
            end
        else
            lampaciklusnext = lampaciklusaktualis;
        end
    end

    function decideNextCycleW()
        if(wStraightCntr > wLeftCntr + 2)
            if((lampaciklusnexttemp(1) == 0))
                lampaciklusnexttemp(1) = 4;
            elseif(cycleVerificationCntr == 8)
                lampaciklusnexttemp(2) = 4;
            end
        elseif(wLeftCntr > wStraightCntr + 3)
            if((lampaciklusnexttemp(1) == 0))
                lampaciklusnexttemp(1) = 5;
            elseif(cycleVerificationCntr == 8)
                lampaciklusnexttemp(2) = 5;
            end
        else
            lampaciklusnext = lampaciklusaktualis;
        end
    end

    function decideNextCycleS()
        if(sStraightCntr > sLeftCntr + 2)
            if((lampaciklusnexttemp(1) == 0))
                lampaciklusnexttemp(1) = 6;
            elseif(cycleVerificationCntr == 8)
                lampaciklusnexttemp(2) = 6;
            end
        elseif(sLeftCntr > sStraightCntr + 3)
            if((lampaciklusnexttemp(1) == 0))
                lampaciklusnexttemp(1) = 7;
            elseif(cycleVerificationCntr == 8)
                lampaciklusnexttemp(2) = 7;
            end
        else
            lampaciklusnext = lampaciklusaktualis;
        end
    end

    function decideNextCycleE()
        if(eStraightCntr > eLeftCntr + 2)
            if((lampaciklusnexttemp(1) == 0))
                lampaciklusnexttemp(1) = 8;
            elseif(cycleVerificationCntr == 8)
                lampaciklusnexttemp(2) = 8;
            end
        elseif(eLeftCntr > eStraightCntr + 3)
            if((lampaciklusnexttemp(1) == 0))
                lampaciklusnexttemp(1) = 9;
            elseif(cycleVerificationCntr == 8)
                lampaciklusnexttemp(2) = 9;
            end
        else
            lampaciklusnext = lampaciklusaktualis;
        end
    end




end