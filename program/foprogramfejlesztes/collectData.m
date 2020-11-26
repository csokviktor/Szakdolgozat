function resultMatrixOut = collectData(resultMatrixIn, car, carnum, lampaciklusaktualis, light, lampaciklusnext)
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

global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

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

nLaneCarNum = 0;
wLaneCarNum = 0;
sLaneCarNum = 0;
eLaneCarNum = 0;

greenDirection = 0;

overloadType = 0;

%count the cars
for i = 1:carnum
    for j = 1:11
        if((isequal(car{i}{2}.XData, nlane1{j}(1)) && isequal(car{i}{2}.YData, nlane1{j}(2)))...
                || (isequal(car{i}{2}.XData, nlane2{j}(1)) && isequal(car{i}{2}.YData, nlane2{j}(2)))...
                || (isequal(car{i}{2}.XData, nlane3{j}(1)) && isequal(car{i}{2}.YData, nlane3{j}(2)))...
                &&  (~isequal(car{i}{5}, N1) && ~isequal(car{i}{5}, N2) && ~isequal(car{i}{5}, N3) && ~isequal(car{i}{5}, N4)))
            nLaneCarNum = nLaneCarNum + 1;
        elseif((isequal(car{i}{2}.XData, wlane1{j}(1)) && isequal(car{i}{2}.YData, wlane1{j}(2)))...
                || (isequal(car{i}{2}.XData, wlane2{j}(1)) && isequal(car{i}{2}.YData, wlane2{j}(2)))...
                || (isequal(car{i}{2}.XData, wlane3{j}(1)) && isequal(car{i}{2}.YData, wlane3{j}(2)))...
                &&  (~isequal(car{i}{5}, W1) && ~isequal(car{i}{5}, W2) && ~isequal(car{i}{5}, W3) && ~isequal(car{i}{5}, W4)))
            wLaneCarNum = wLaneCarNum + 1;
        elseif((isequal(car{i}{2}.XData, slane1{j}(1)) && isequal(car{i}{2}.YData, slane1{j}(2)))...
                || (isequal(car{i}{2}.XData, slane2{j}(1)) && isequal(car{i}{2}.YData, slane2{j}(2)))...
                || (isequal(car{i}{2}.XData, slane3{j}(1)) && isequal(car{i}{2}.YData, slane3{j}(2)))...
                &&  (~isequal(car{i}{5}, S1) && ~isequal(car{i}{5}, S2) && ~isequal(car{i}{5}, S3) && ~isequal(car{i}{5}, S4)))
            sLaneCarNum = sLaneCarNum + 1;
        elseif((isequal(car{i}{2}.XData, elane1{j}(1)) && isequal(car{i}{2}.YData, elane1{j}(2)))...
                || (isequal(car{i}{2}.XData, elane2{j}(1)) && isequal(car{i}{2}.YData, elane2{j}(2)))...
                || (isequal(car{i}{2}.XData, elane3{j}(1)) && isequal(car{i}{2}.YData, elane3{j}(2)))...
                &&  (~isequal(car{i}{5}, E1) && ~isequal(car{i}{5}, E2) && ~isequal(car{i}{5}, E3) && ~isequal(car{i}{5}, E4)))
            eLaneCarNum = eLaneCarNum + 1;
        end
    end
end


if(light{1}{5} == X6 || light{1}{5} == X8)
    greenDirection = 1;
elseif(light{4}{5} == X6 || light{4}{5} == X8)
    greenDirection = 2;
elseif(light{7}{5} == X6 || light{7}{5} == X8)
    greenDirection = 3;
elseif(light{10}{5} == X6 || light{10}{5} == X8)
    greenDirection = 4;
end


if(nooverload == 1)
    overloadType = 0;
elseif(overloadNTS)
    overloadType = 1;
elseif(overloadNTE)
    overloadType = 2;
elseif(overloadWTE)
    overloadType = 3;
elseif(overloadWTN)
    overloadType = 4;
elseif(overloadSTN)
    overloadType = 5;
elseif(overloadSTW)
    overloadType = 6;
elseif(overloadETW)
    overloadType = 7;
elseif(overloadETS)
    overloadType = 8;
end


%create the next line of the result matrix
temp = [nLaneCarNum, wLaneCarNum, sLaneCarNum, eLaneCarNum, greenDirection, lampaciklusaktualis, overloadType, lampaciklusnext];
resultMatrixOut = [resultMatrixIn;temp];
end