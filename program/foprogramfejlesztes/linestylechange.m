function linestylechange(lampaciklus)
global n1;
global n2;
global n3;
global w1;
global w2;
global w3;
global s1;
global s2;
global s3;
global e1;
global e2;
global e3;

global n1s;
global n2s;
global n3s;
global w1s;
global w2s;
global w3s;
global s1s;
global s2s;
global s3s;
global e1s;
global e2s;
global e3s;

global lampaciklusaktualis;
global lightsmall;

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

ControllerMatrixSmallLamps = {X6 X7 X10 X6 X7 X10 X6 X7 X10 X6 X7 X10;... %alap ciklus
    X6 X3 X7 X6 X7 X10 X8 X10 X10 X6 X7 X10;... %elore ciklus
    X8 X5 X10 X6 X7 X10 X6 X7 X10 X6 X7 X10;... %balra ciklus
    };

switch lampaciklus
    case 1 %Nincs torlodas
        n1.LineStyle = '--';
        n2.LineStyle = '-';
        n3.LineStyle = '--';
        
        w1.LineStyle = '--';
        w2.LineStyle = '-';
        w3.LineStyle = '--';
        
        s1.LineStyle = '--';
        s2.LineStyle = '-';
        s3.LineStyle = '--';
        
        e1.LineStyle = '--';
        e2.LineStyle = '-';
        e3.LineStyle = '--';
        
        n1s.LineStyle = '--';
        n2s.LineStyle = '-';
        n3s.LineStyle = '--';
        
        w1s.LineStyle = '--';
        w2s.LineStyle = '-';
        w3s.LineStyle = '--';
        
        s1s.LineStyle = '--';
        s2s.LineStyle = '-';
        s3s.LineStyle = '--';
        
        e1s.LineStyle = '--';
        e2s.LineStyle = '-';
        e3s.LineStyle = '--';
    case 2 %N-rol elore miatt, 0 shift
        n1.LineStyle = '--';
        n2.LineStyle = '--';
        n3.LineStyle = '-';
        
        w1.LineStyle = '--';
        w2.LineStyle = '-';
        w3.LineStyle = '--';
        
        s1.LineStyle = '--';
        s2.LineStyle = '--';
        s3.LineStyle = '-';
        
        e1.LineStyle = '--';
        e2.LineStyle = '-';
        e3.LineStyle = '--';
        
        n1s.LineStyle = '--';
        n2s.LineStyle = '--';
        n3s.LineStyle = '-';
        
        w1s.LineStyle = '--';
        w2s.LineStyle = '-';
        w3s.LineStyle = '--';
        
        s1s.LineStyle = '--';
        s2s.LineStyle = '--';
        s3s.LineStyle = '-';
        
        e1s.LineStyle = '--';
        e2s.LineStyle = '-';
        e3s.LineStyle = '--';
    case 3 %N-rol balra miatt, 0 shift
        n1.LineStyle = '--';
        n2.LineStyle = '-';
        n3.LineStyle = '--';
        
        w1.LineStyle = '--';
        w2.LineStyle = '-';
        w3.LineStyle = '--';
        
        s1.LineStyle = '--';
        s2.LineStyle = '-';
        s3.LineStyle = '--';
        
        e1.LineStyle = '--';
        e2.LineStyle = '-';
        e3.LineStyle = '--';
        
        n1s.LineStyle = '--';
        n2s.LineStyle = '-';
        n3s.LineStyle = '--';
        
        w1s.LineStyle = '--';
        w2s.LineStyle = '-';
        w3s.LineStyle = '--';
        
        s1s.LineStyle = '--';
        s2s.LineStyle = '-';
        s3s.LineStyle = '--';
        
        e1s.LineStyle = '--';
        e2s.LineStyle = '-';
        e3s.LineStyle = '--';
    case 4 %W-rol elore miatt, 3 shift
        n1.LineStyle = '--';
        n2.LineStyle = '-';
        n3.LineStyle = '--';
        
        w1.LineStyle = '-';
        w2.LineStyle = '--';
        w3.LineStyle = '--';
        
        s1.LineStyle = '--';
        s2.LineStyle = '-';
        s3.LineStyle = '--';
        
        e1.LineStyle = '-';
        e2.LineStyle = '--';
        e3.LineStyle = '--';
        
        n1s.LineStyle = '--';
        n2s.LineStyle = '-';
        n3s.LineStyle = '--';
        
        w1s.LineStyle = '-';
        w2s.LineStyle = '--';
        w3s.LineStyle = '--';
        
        s1s.LineStyle = '--';
        s2s.LineStyle = '-';
        s3s.LineStyle = '--';
        
        e1s.LineStyle = '-';
        e2s.LineStyle = '--';
        e3s.LineStyle = '--';
    case 5 %W-rol balra miatt, 3 shift
        n1.LineStyle = '--';
        n2.LineStyle = '-';
        n3.LineStyle = '--';
        
        w1.LineStyle = '--';
        w2.LineStyle = '-';
        w3.LineStyle = '--';
        
        s1.LineStyle = '--';
        s2.LineStyle = '-';
        s3.LineStyle = '--';
        
        e1.LineStyle = '--';
        e2.LineStyle = '-';
        e3.LineStyle = '--';
        
        n1s.LineStyle = '--';
        n2s.LineStyle = '-';
        n3s.LineStyle = '--';
        
        w1s.LineStyle = '--';
        w2s.LineStyle = '-';
        w3s.LineStyle = '--';
        
        s1s.LineStyle = '--';
        s2s.LineStyle = '-';
        s3s.LineStyle = '--';
        
        e1s.LineStyle = '--';
        e2s.LineStyle = '-';
        e3s.LineStyle = '--';
    case 6 %S-rol elore miatt, 6 shift
        n1.LineStyle = '-';
        n2.LineStyle = '--';
        n3.LineStyle = '--';
        
        w1.LineStyle = '--';
        w2.LineStyle = '-';
        w3.LineStyle = '--';
        
        s1.LineStyle = '-';
        s2.LineStyle = '--';
        s3.LineStyle = '--';
        
        e1.LineStyle = '--';
        e2.LineStyle = '-';
        e3.LineStyle = '--';
        
        n1s.LineStyle = '-';
        n2s.LineStyle = '--';
        n3s.LineStyle = '--';
        
        w1s.LineStyle = '--';
        w2s.LineStyle = '-';
        w3s.LineStyle = '--';
        
        s1s.LineStyle = '-';
        s2s.LineStyle = '--';
        s3s.LineStyle = '--';
        
        e1s.LineStyle = '--';
        e2s.LineStyle = '-';
        e3s.LineStyle = '--';
    case 7 %S-rol balra miatt, 6 shift
        n1.LineStyle = '--';
        n2.LineStyle = '-';
        n3.LineStyle = '--';
        
        w1.LineStyle = '--';
        w2.LineStyle = '-';
        w3.LineStyle = '--';
        
        s1.LineStyle = '--';
        s2.LineStyle = '-';
        s3.LineStyle = '--';
        
        e1.LineStyle = '--';
        e2.LineStyle = '-';
        e3.LineStyle = '--';
        
        n1s.LineStyle = '--';
        n2s.LineStyle = '-';
        n3s.LineStyle = '--';
        
        w1s.LineStyle = '--';
        w2s.LineStyle = '-';
        w3s.LineStyle = '--';
        
        s1s.LineStyle = '--';
        s2s.LineStyle = '-';
        s3s.LineStyle = '--';
        
        e1s.LineStyle = '--';
        e2s.LineStyle = '-';
        e3s.LineStyle = '--';
    case 8 %E-rol elore miatt, 9 shift
        n1.LineStyle = '--';
        n2.LineStyle = '-';
        n3.LineStyle = '--';
        
        w1.LineStyle = '--';
        w2.LineStyle = '--';
        w3.LineStyle = '-';
        
        s1.LineStyle = '--';
        s2.LineStyle = '-';
        s3.LineStyle = '--';
        
        e1.LineStyle = '--';
        e2.LineStyle = '--';
        e3.LineStyle = '-';
        
        n1s.LineStyle = '--';
        n2s.LineStyle = '-';
        n3s.LineStyle = '--';
        
        w1s.LineStyle = '--';
        w2s.LineStyle = '--';
        w3s.LineStyle = '-';
        
        s1s.LineStyle = '--';
        s2s.LineStyle = '-';
        s3s.LineStyle = '--';
        
        e1s.LineStyle = '--';
        e2s.LineStyle = '--';
        e3s.LineStyle = '-';
    case 9 %E-rol balra miatt, 9 shift
        n1.LineStyle = '--';
        n2.LineStyle = '-';
        n3.LineStyle = '--';
        
        w1.LineStyle = '--';
        w2.LineStyle = '-';
        w3.LineStyle = '--';
        
        s1.LineStyle = '--';
        s2.LineStyle = '-';
        s3.LineStyle = '--';
        
        e1.LineStyle = '--';
        e2.LineStyle = '-';
        e3.LineStyle = '--';
        
        n1s.LineStyle = '--';
        n2s.LineStyle = '-';
        n3s.LineStyle = '--';
        
        w1s.LineStyle = '--';
        w2s.LineStyle = '-';
        w3s.LineStyle = '--';
        
        s1s.LineStyle = '--';
        s2s.LineStyle = '-';
        s3s.LineStyle = '--';
        
        e1s.LineStyle = '--';
        e2s.LineStyle = '-';
        e3s.LineStyle = '--';
end

switch lampaciklusaktualis
    case 1 %Nincs torlodas
        row = 1;
        TM = ControllerMatrixSmallLamps;
    case 2 %N-rol elore miatt, 0 shift
        row = 2;
        TM = ControllerMatrixSmallLamps;
    case 3 %N-rol balra miatt, 0 shift
        row = 3;
        TM = ControllerMatrixSmallLamps;
    case 4 %W-rol elore miatt, 3 shift
        row = 2;
        TM = circshift(ControllerMatrixSmallLamps,3,2);
    case 5 %W-rol balra miatt, 3 shift
        row = 3;
        TM = circshift(ControllerMatrixSmallLamps,3,2);
    case 6 %S-rol elore miatt, 6 shift
        row = 2;
        TM = circshift(ControllerMatrixSmallLamps,6,2);
    case 7 %S-rol balra miatt, 6 shift
        row = 3;
        TM = circshift(ControllerMatrixSmallLamps,6,2);
    case 8 %E-rol elore miatt, 9 shift
        row = 2;
        TM = circshift(ControllerMatrixSmallLamps,9,2);
    case 9 %E-rol balra miatt, 9 shift
        row = 3;
        TM = circshift(ControllerMatrixSmallLamps,9,2);
end

for i=1:12 %12 lampara beallitjuk hogy mit kell mutassanak
    if(TM(row,i) == X3) %elore
        lightsmall{i}{1}.MarkerEdgeColor = 'white';
        lightsmall{i}{1}.MarkerFaceColor = 'white';
        lightsmall{i}{1}.Marker = 's';
        
        lightsmall{i}{2}.MarkerEdgeColor = 'white';
        lightsmall{i}{2}.MarkerFaceColor = 'white';
        lightsmall{i}{2}.Marker = 's';
        
        lightsmall{i}{3}.MarkerEdgeColor = 'black';
        lightsmall{i}{3}.MarkerFaceColor = 'black';
        if((i == 1) || (i == 2) || (i == 3))
            lightsmall{i}{3}.Marker = 'v';
        elseif((i == 4) || (i == 5) || (i == 6))
            lightsmall{i}{3}.Marker = '>';
        elseif((i == 7) || (i == 8) || (i == 9))
            lightsmall{i}{3}.Marker = '^';
        elseif((i == 10) || (i == 11) || (i == 12))
            lightsmall{i}{3}.Marker = '<';
        end
        
        lightsmall{i}{4}.MarkerEdgeColor = 'white';
        lightsmall{i}{4}.MarkerFaceColor = 'white';
        lightsmall{i}{4}.Marker = 's';
        
        lightsmall{i}{5} = X3;
    elseif(TM(row,i) == X5) %balra
        lightsmall{i}{1}.MarkerEdgeColor = 'white';
        lightsmall{i}{1}.MarkerFaceColor = 'white';
        lightsmall{i}{1}.Marker = 's';
        
        lightsmall{i}{2}.MarkerEdgeColor = 'black';
        lightsmall{i}{2}.MarkerFaceColor = 'black';
        if((i == 1) || (i == 2) || (i == 3))
            lightsmall{i}{2}.Marker = '>';
        elseif((i == 4) || (i == 5) || (i == 6))
            lightsmall{i}{2}.Marker = '^';
        elseif((i == 7) || (i == 8) || (i == 9))
            lightsmall{i}{2}.Marker = '<';
        elseif((i == 10) || (i == 11) || (i == 12))
            lightsmall{i}{2}.Marker = 'v';
        end
        
        lightsmall{i}{3}.MarkerEdgeColor = 'white';
        lightsmall{i}{3}.MarkerFaceColor = 'white';
        lightsmall{i}{3}.Marker = 's';
        
        lightsmall{i}{4}.MarkerEdgeColor = 'white';
        lightsmall{i}{4}.MarkerFaceColor = 'white';
        lightsmall{i}{4}.Marker = 's';
        
        lightsmall{i}{5} = X5;
        
    elseif(TM(row,i) == X6) %elore es jobbra
        lightsmall{i}{1}.MarkerEdgeColor = 'white';
        lightsmall{i}{1}.MarkerFaceColor = 'white';
        lightsmall{i}{1}.Marker = 's';
        
        lightsmall{i}{2}.MarkerEdgeColor = 'white';
        lightsmall{i}{2}.MarkerFaceColor = 'white';
        lightsmall{i}{2}.Marker = 's';
        
        lightsmall{i}{3}.MarkerEdgeColor = 'black';
        lightsmall{i}{3}.MarkerFaceColor = 'black';
        if((i == 1) || (i == 2) || (i == 3))
            lightsmall{i}{3}.Marker = 'v';
        elseif((i == 4) || (i == 5) || (i == 6))
            lightsmall{i}{3}.Marker = '>';
        elseif((i == 7) || (i == 8) || (i == 9))
            lightsmall{i}{3}.Marker = '^';
        elseif((i == 10) || (i == 11) || (i == 12))
            lightsmall{i}{3}.Marker = '<';
        end
        
        lightsmall{i}{4}.MarkerEdgeColor = 'black';
        lightsmall{i}{4}.MarkerFaceColor = 'black';
        if((i == 1) || (i == 2) || (i == 3))
            lightsmall{i}{4}.Marker = '<';
        elseif((i == 4) || (i == 5) || (i == 6))
            lightsmall{i}{4}.Marker = 'v';
        elseif((i == 7) || (i == 8) || (i == 9))
            lightsmall{i}{4}.Marker = '>';
        elseif((i == 10) || (i == 11) || (i == 12))
            lightsmall{i}{4}.Marker = '^';
        end
        
        lightsmall{i}{5} = X6;
        
    elseif(TM(row,i) == X7) %elore es balra
        lightsmall{i}{1}.MarkerEdgeColor = 'white';
        lightsmall{i}{1}.MarkerFaceColor = 'white';
        lightsmall{i}{1}.Marker = 's';
        
        lightsmall{i}{2}.MarkerEdgeColor = 'black';
        lightsmall{i}{2}.MarkerFaceColor = 'black';
        if((i == 1) || (i == 2) || (i == 3))
            lightsmall{i}{2}.Marker = '>';
        elseif((i == 4) || (i == 5) || (i == 6))
            lightsmall{i}{2}.Marker = '^';
        elseif((i == 7) || (i == 8) || (i == 9))
            lightsmall{i}{2}.Marker = '<';
        elseif((i == 10) || (i == 11) || (i == 12))
            lightsmall{i}{2}.Marker = 'v';
        end
        
        lightsmall{i}{3}.MarkerEdgeColor = 'black';
        lightsmall{i}{3}.MarkerFaceColor = 'black';
        if((i == 1) || (i == 2) || (i == 3))
            lightsmall{i}{3}.Marker = 'v';
        elseif((i == 4) || (i == 5) || (i == 6))
            lightsmall{i}{3}.Marker = '>';
        elseif((i == 7) || (i == 8) || (i == 9))
            lightsmall{i}{3}.Marker = '^';
        elseif((i == 10) || (i == 11) || (i == 12))
            lightsmall{i}{3}.Marker = '<';
        end
        
        lightsmall{i}{4}.MarkerEdgeColor = 'white';
        lightsmall{i}{4}.MarkerFaceColor = 'white';
        lightsmall{i}{4}.Marker = 's';
        
        lightsmall{i}{5} = X7;
    elseif(TM(row,i) == X8) %elore es jobbra es balra
        lightsmall{i}{1}.MarkerEdgeColor = 'white';
        lightsmall{i}{1}.MarkerFaceColor = 'white';
        lightsmall{i}{1}.Marker = 's';
        
        lightsmall{i}{2}.MarkerEdgeColor = 'black';
        lightsmall{i}{2}.MarkerFaceColor = 'black';
        if((i == 1) || (i == 2) || (i == 3))
            lightsmall{i}{2}.Marker = '>';
        elseif((i == 4) || (i == 5) || (i == 6))
            lightsmall{i}{2}.Marker = '^';
        elseif((i == 7) || (i == 8) || (i == 9))
            lightsmall{i}{2}.Marker = '<';
        elseif((i == 10) || (i == 11) || (i == 12))
            lightsmall{i}{2}.Marker = 'v';
        end
        
        lightsmall{i}{3}.MarkerEdgeColor = 'black';
        lightsmall{i}{3}.MarkerFaceColor = 'black';
        if((i == 1) || (i == 2) || (i == 3))
            lightsmall{i}{3}.Marker = 'v';
        elseif((i == 4) || (i == 5) || (i == 6))
            lightsmall{i}{3}.Marker = '>';
        elseif((i == 7) || (i == 8) || (i == 9))
            lightsmall{i}{3}.Marker = '^';
        elseif((i == 10) || (i == 11) || (i == 12))
            lightsmall{i}{3}.Marker = '<';
        end
        
        lightsmall{i}{4}.MarkerEdgeColor = 'black';
        lightsmall{i}{4}.MarkerFaceColor = 'black';
        if((i == 1) || (i == 2) || (i == 3))
            lightsmall{i}{4}.Marker = '<';
        elseif((i == 4) || (i == 5) || (i == 6))
            lightsmall{i}{4}.Marker = 'v';
        elseif((i == 7) || (i == 8) || (i == 9))
            lightsmall{i}{4}.Marker = '>';
        elseif((i == 10) || (i == 11) || (i == 12))
            lightsmall{i}{4}.Marker = '^';
        end
        
        lightsmall{i}{5} = X8;
    elseif(TM(row,i) == X10) %off
        lightsmall{i}{1}.MarkerEdgeColor = 'white';
        lightsmall{i}{1}.MarkerFaceColor = 'white';
        lightsmall{i}{1}.Marker = 's';
        
        lightsmall{i}{2}.MarkerEdgeColor = 'white';
        lightsmall{i}{2}.MarkerFaceColor = 'white';
        lightsmall{i}{2}.Marker = 's';
        
        lightsmall{i}{3}.MarkerEdgeColor = 'white';
        lightsmall{i}{3}.MarkerFaceColor = 'white';
        lightsmall{i}{3}.Marker = 's';
        
        lightsmall{i}{4}.MarkerEdgeColor = 'white';
        lightsmall{i}{4}.MarkerFaceColor = 'white';
        lightsmall{i}{4}.Marker = 's';
        
        lightsmall{i}{5} = X10;
        
    end
end


end