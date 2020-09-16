 function checkForTrafficJam()
global car;
global carnum;

global lampaciklusnext;
global lampaciklusaktualis;

global nlane1;
global nlane2;
global wlane1;
global wlane2;
global slane1;
global slane2;
global elane1;
global elane2;

jamN = zeros(1,7);
jamW = zeros(1,7);
jamS = zeros(1,7);
jamE = zeros(1,7);


nStraightCntr = 0;
nLeftCntr = 0;
wStraightCntr = 0;
wLeftCntr = 0;
sStraightCntr = 0;
sLeftCntr = 0;
eStraightCntr = 0;
eLeftCntr = 0;

%autok poziciojanak vizsgalata
for o = 1:carnum 
        %északi oldal
    if(isequal(car{o}{2}.XData, nlane1{3}(1)) && isequal(car{o}{2}.XData,nlane1{3}(2)))
        jamN(2) = 1;
    elseif(isequal(car{o}{2}.XData, nlane1{4}(1)) && isequal(car{o}{2}.XData,nlane1{4}(2)) && isequal(car{o}{7},0))
        jamN(3) = 1;
    elseif(isequal(car{o}{2}.XData, nlane2{4}(1)) && isequal(car{o}{2}.XData,nlane2{4}(2)) && isequal(car{o}{7},0))
        jamN(4) = 1;
    elseif(isequal(car{o}{2}.XData, nlane2{3}(1)) && isequal(car{o}{2}.XData,nlane2{3}(2)))
        jamN(5) = 1;
    elseif(isequal(car{o}{2}.XData, nlane2{4}(1)) && isequal(car{o}{2}.XData,nlane2{4}(2)) && isequal(car{o}{7},0))
        jamN(6) = 1;
    elseif(isequal(car{o}{2}.XData, nlane1{4}(1)) && isequal(car{o}{2}.XData,nlane1{3}(4)) && isequal(car{o}{7},0))
        jamN(7) = 1;
    
        %nyugati oldal
    elseif(isequal(car{o}{2}.XData, wlane1{3}(1)) && isequal(car{o}{2}.XData,wlane1{3}(2)))
        jamW(2) = 1;
    elseif(isequal(car{o}{2}.XData, wlane1{4}(1)) && isequal(car{o}{2}.XData,wlane1{4}(2)) && isequal(car{o}{7},0))
        jamW(3) = 1;
    elseif(isequal(car{o}{2}.XData, wlane2{4}(1)) && isequal(car{o}{2}.XData,wlane2{4}(2)) && isequal(car{o}{7},0))
        jamW(4) = 1;
    elseif(isequal(car{o}{2}.XData, wlane2{3}(1)) && isequal(car{o}{2}.XData,wlane2{3}(2)))
        jamW(5) = 1;
    elseif(isequal(car{o}{2}.XData, wlane2{4}(1)) && isequal(car{o}{2}.XData,wlane2{4}(2)) && isequal(car{o}{7},0))
        jamW(6) = 1;
    elseif(isequal(car{o}{2}.XData, wlane1{4}(1)) && isequal(car{o}{2}.XData,wlane1{3}(4)) && isequal(car{o}{7},0))
        jamW(7) = 1;
    
        %déli oldal
    elseif(isequal(car{o}{2}.XData, slane1{3}(1)) && isequal(car{o}{2}.XData,slane1{3}(2)))
        jamS(2) = 1;
    elseif(isequal(car{o}{2}.XData, slane1{4}(1)) && isequal(car{o}{2}.XData,slane1{4}(2)) && isequal(car{o}{7},0))
        jamS(3) = 1;
    elseif(isequal(car{o}{2}.XData, slane2{4}(1)) && isequal(car{o}{2}.XData,slane2{4}(2)) && isequal(car{o}{7},0))
        jamS(4) = 1;
    elseif(isequal(car{o}{2}.XData, slane2{3}(1)) && isequal(car{o}{2}.XData,slane2{3}(2)))
        jamS(5) = 1;
    elseif(isequal(car{o}{2}.XData, slane2{4}(1)) && isequal(car{o}{2}.XData,slane2{4}(2)) && isequal(car{o}{7},0))
        jamS(6) = 1;
    elseif(isequal(car{o}{2}.XData, slane1{4}(1)) && isequal(car{o}{2}.XData,slane1{3}(4)) && isequal(car{o}{7},0))
        jamS(7) = 1;
        
        %keleti oldal
    elseif(isequal(car{o}{2}.XData, elane1{3}(1)) && isequal(car{o}{2}.XData,elane1{3}(2)))
        jamE(2) = 1;
    elseif(isequal(car{o}{2}.XData, elane1{4}(1)) && isequal(car{o}{2}.XData,elane1{4}(2)) && isequal(car{o}{7},0))
        jamE(3) = 1;
    elseif(isequal(car{o}{2}.XData, elane2{4}(1)) && isequal(car{o}{2}.XData,elane2{4}(2)) && isequal(car{o}{7},0))
        jamE(4) = 1;
    elseif(isequal(car{o}{2}.XData, elane2{3}(1)) && isequal(car{o}{2}.XData,elane2{3}(2)))
        jamE(5) = 1;
    elseif(isequal(car{o}{2}.XData, elane2{4}(1)) && isequal(car{o}{2}.XData,elane2{4}(2)) && isequal(car{o}{7},0))
        jamE(6) = 1;
    elseif(isequal(car{o}{2}.XData, elane1{4}(1)) && isequal(car{o}{2}.XData,elane1{3}(4)) && isequal(car{o}{7},0))
        jamE(7) = 1;
    end
end

%torlodas vizsgalata
    %Eszaki oldal
if((jamN(2) == 1 && jamN(3) == 1 && jamN(4) == 1) || (jamN(5) == 1 && jamN(6) == 1 && jamN(7) == 1) || (jamN(2) == 1 && jamN(3) == 1 && jamN(4) == 1 && jamN(5) == 1 && jamN(6) == 1 && jamN(7) == 1))
    for t = 1:carnum
        for r = 1:11
            
        end
    end
end





end