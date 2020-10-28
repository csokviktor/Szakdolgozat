function changeMainLampCycleLength()
global car;
global carnum;

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

global row;
global lampChange;

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

nLaneCntrFar = 0;
nLaneCntrClose = 0;

wLaneCntrFar = 0;
wLaneCntrClose = 0;

sLaneCntrFar = 0;
sLaneCntrClose = 0;

eLaneCntrFar = 0;
eLaneCntrClose = 0;

for i = 1:carnum
    % Far matrix
    for o = 1:8
        if((isequal(car{i}{2}.XData, nlane1{o}(1)) && isequal(car{i}{2}.YData, nlane1{o}(2)))...
                ||  (isequal(car{i}{2}.XData, nlane2{o}(1)) && isequal(car{i}{2}.YData, nlane2{o}(2)))...
                ||  (isequal(car{i}{2}.XData, nlane3{o}(1)) && isequal(car{i}{2}.YData, nlane3{o}(2)))...
                &&  (~isequal(car{i}{5}, N1) && ~isequal(car{i}{5}, N2) && ~isequal(car{i}{5}, N3) && ~isequal(car{i}{5}, N4)))
            nLaneCntrFar = nLaneCntrFar + 1;
            
        elseif((isequal(car{i}{2}.XData, wlane1{o}(1)) && isequal(car{i}{2}.YData, wlane1{o}(2)))...
                ||  (isequal(car{i}{2}.XData, wlane2{o}(1)) && isequal(car{i}{2}.YData, wlane2{o}(2)))...
                ||  (isequal(car{i}{2}.XData, wlane3{o}(1)) && isequal(car{i}{2}.YData, wlane3{o}(2)))...
                &&  (~isequal(car{i}{5}, W1) && ~isequal(car{i}{5}, W2) && ~isequal(car{i}{5}, W3) && ~isequal(car{i}{5}, W4)))
            wLaneCntrFar = wLaneCntrFar + 1;
            
        elseif((isequal(car{i}{2}.XData, slane1{o}(1)) && isequal(car{i}{2}.YData, slane1{o}(2)))...
                ||  (isequal(car{i}{2}.XData, slane2{o}(1)) && isequal(car{i}{2}.YData, slane2{o}(2)))...
                ||  (isequal(car{i}{2}.XData, slane3{o}(1)) && isequal(car{i}{2}.YData, slane3{o}(2)))...
                &&  (~isequal(car{i}{5}, S1) && ~isequal(car{i}{5}, S2) && ~isequal(car{i}{5}, S3) && ~isequal(car{i}{5}, S4)))
            sLaneCntrFar = sLaneCntrFar + 1;
            
        elseif((isequal(car{i}{2}.XData, elane1{o}(1)) && isequal(car{i}{2}.YData, elane1{o}(2)))...
                ||  (isequal(car{i}{2}.XData, elane2{o}(1)) && isequal(car{i}{2}.YData, elane2{o}(2)))...
                ||  (isequal(car{i}{2}.XData, elane3{o}(1)) && isequal(car{i}{2}.YData, elane3{o}(2)))...
                &&  (~isequal(car{i}{5}, E1) && ~isequal(car{i}{5}, E2) && ~isequal(car{i}{5}, E3) && ~isequal(car{i}{5}, E4)))
            eLaneCntrFar = eLaneCntrFar + 1;
        end
    end
    
    % Close matrix
    for u = 9:11
        if((isequal(car{i}{2}.XData, nlane1{u}(1)) && isequal(car{i}{2}.YData, nlane1{u}(2)))...
                ||  (isequal(car{i}{2}.XData, nlane2{u}(1)) && isequal(car{i}{2}.YData, nlane2{u}(2)))...
                ||  (isequal(car{i}{2}.XData, nlane3{u}(1)) && isequal(car{i}{2}.YData, nlane3{u}(2)))...
                &&  (~isequal(car{i}{5}, N1) && ~isequal(car{i}{5}, N2) && ~isequal(car{i}{5}, N3) && ~isequal(car{i}{5}, N4)))
            nLaneCntrClose = nLaneCntrClose + 1;
            
        elseif((isequal(car{i}{2}.XData, wlane1{u}(1)) && isequal(car{i}{2}.YData, wlane1{u}(2)))...
                ||  (isequal(car{i}{2}.XData, wlane2{u}(1)) && isequal(car{i}{2}.YData, wlane2{u}(2)))...
                ||  (isequal(car{i}{2}.XData, wlane3{u}(1)) && isequal(car{i}{2}.YData, wlane3{u}(2)))...
                &&  (~isequal(car{i}{5}, W1) && ~isequal(car{i}{5}, W2) && ~isequal(car{i}{5}, W3) && ~isequal(car{i}{5}, W4)))
            wLaneCntrClose = wLaneCntrClose + 1;
            
        elseif((isequal(car{i}{2}.XData, slane1{u}(1)) && isequal(car{i}{2}.YData, slane1{u}(2)))...
                ||  (isequal(car{i}{2}.XData, slane2{u}(1)) && isequal(car{i}{2}.YData, slane2{u}(2)))...
                ||  (isequal(car{i}{2}.XData, slane3{u}(1)) && isequal(car{i}{2}.YData, slane3{u}(2)))...
                &&  (~isequal(car{i}{5}, S1) && ~isequal(car{i}{5}, S2) && ~isequal(car{i}{5}, S3) && ~isequal(car{i}{5}, S4)))
            sLaneCntrClose = sLaneCntrClose + 1;
            
        elseif((isequal(car{i}{2}.XData, elane1{u}(1)) && isequal(car{i}{2}.YData, elane1{u}(2)))...
                ||  (isequal(car{i}{2}.XData, elane2{u}(1)) && isequal(car{i}{2}.YData, elane2{u}(2)))...
                ||  (isequal(car{i}{2}.XData, elane3{u}(1)) && isequal(car{i}{2}.YData, elane3{u}(2)))...
                &&  (~isequal(car{i}{5}, E1) && ~isequal(car{i}{5}, E2) && ~isequal(car{i}{5}, E3) && ~isequal(car{i}{5}, E4)))
            eLaneCntrClose = eLaneCntrClose + 1;
        end
    end
end

%North
if(row == 1 || row == 9 || row == 17)
    if(nLaneCntrClose <= 3)
        lampChange = 2;
    elseif(jamBoolN == 1)
        lampChange = 10;
    elseif((nLaneCntrClose >= 4) && (nLaneCntrClose <= 6))
        lampChange = 6;
    else %meg egy 8-os kene hogy ha sokan vannak de meg nincs torlodas
        lampChange = 6;
    end
%West
elseif(row == 3 || row == 11 || row == 19)
    if(wLaneCntrClose <= 3)
        lampChange = 2;
    elseif(jamBoolW == 1)
        lampChange = 10;
    elseif((wLaneCntrClose >= 4) && (wLaneCntrClose <= 6))
        lampChange = 6;
    else
        lampChange = 6;
    end
%South
elseif(row == 5 || row == 13 || row == 21)
    if(sLaneCntrClose <= 3)
        lampChange = 2;
    elseif(jamBoolS == 1)
        lampChange = 10;
    elseif((sLaneCntrClose >= 4) && (sLaneCntrClose <= 6))
        lampChange = 6;
    else
        lampChange = 6;
    end
%East
elseif(row == 7 || row == 15 || row == 23)
    if(eLaneCntrClose <= 3)
        lampChange = 2;
    elseif(jamBoolE == 1)
        lampChange = 10;    
    elseif((eLaneCntrClose >= 4) && (eLaneCntrClose <= 6))
        lampChange = 6;
    else
        lampChange = 6;
    end
end


end