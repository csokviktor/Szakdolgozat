function lightCalc = changeLight(transMatrix, row, light)
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

for i=1:12 %12 lampara beallitjuk hogy mit kell mutassanak
    if(transMatrix(row,i) == X1) %piros
        light{i}{1}.MarkerEdgeColor = 'white';
        light{i}{1}.MarkerFaceColor = 'white';
        light{i}{1}.Marker = 's';
        
        light{i}{2}.MarkerEdgeColor = 'white';
        light{i}{2}.MarkerFaceColor = 'white';
        light{i}{2}.Marker = 's';
        
        light{i}{3}.MarkerEdgeColor = 'red';
        light{i}{3}.MarkerFaceColor = 'red';
        light{i}{3}.Marker = 's';
        
        light{i}{4}.MarkerEdgeColor = 'white';
        light{i}{4}.MarkerFaceColor = 'white';
        light{i}{4}.Marker = 's';
        
        light{i}{5} = X1;
        
    elseif(transMatrix(row,i) == X2) %sarga
        light{i}{1}.MarkerEdgeColor = 'yellow';
        light{i}{1}.MarkerFaceColor = 'yellow';
        light{i}{1}.Marker = 's';
        
        light{i}{2}.MarkerEdgeColor = 'white';
        light{i}{2}.MarkerFaceColor = 'white';
        light{i}{2}.Marker = 's';
        
        light{i}{3}.MarkerEdgeColor = 'white';
        light{i}{3}.MarkerFaceColor = 'white';
        light{i}{3}.Marker = 's';
        
        light{i}{4}.MarkerEdgeColor = 'white';
        light{i}{4}.MarkerFaceColor = 'white';
        light{i}{4}.Marker = 's';
        
        light{i}{5} = X2;
        
        
    elseif(transMatrix(row,i) == X3) %elore
        light{i}{1}.MarkerEdgeColor = 'white';
        light{i}{1}.MarkerFaceColor = 'white';
        light{i}{1}.Marker = 's';
        
        light{i}{2}.MarkerEdgeColor = 'white';
        light{i}{2}.MarkerFaceColor = 'white';
        light{i}{2}.Marker = 's';
        
        light{i}{3}.MarkerEdgeColor = 'green';
        light{i}{3}.MarkerFaceColor = 'green';
        if((i == 1) || (i == 2) || (i == 3))
            light{i}{3}.Marker = 'v';
        elseif((i == 4) || (i == 5) || (i == 6))
            light{i}{3}.Marker = '>';
        elseif((i == 7) || (i == 8) || (i == 9))
            light{i}{3}.Marker = '^';
        elseif((i == 10) || (i == 11) || (i == 12))
            light{i}{3}.Marker = '<';
        end
        
        light{i}{4}.MarkerEdgeColor = 'white';
        light{i}{4}.MarkerFaceColor = 'white';
        light{i}{4}.Marker = 's';
        
        light{i}{5} = X3;
        
        
    elseif(transMatrix(row,i) == X4) %jobbra
        light{i}{1}.MarkerEdgeColor = 'white';
        light{i}{1}.MarkerFaceColor = 'white';
        light{i}{1}.Marker = 's';
        
        light{i}{2}.MarkerEdgeColor = 'white';
        light{i}{2}.MarkerFaceColor = 'white';
        light{i}{2}.Marker = 's';
        
        light{i}{3}.MarkerEdgeColor = 'white';
        light{i}{3}.MarkerFaceColor = 'white';
        light{i}{3}.Marker = 's';
        
        light{i}{4}.MarkerEdgeColor = 'green';
        light{i}{4}.MarkerFaceColor = 'green';
        if((i == 1) || (i == 2) || (i == 3))
            light{i}{4}.Marker = '<';
        elseif((i == 4) || (i == 5) || (i == 6))
            light{i}{4}.Marker = 'v';
        elseif((i == 7) || (i == 8) || (i == 9))
            light{i}{4}.Marker = '>';
        elseif((i == 10) || (i == 11) || (i == 12))
            light{i}{4}.Marker = '^';
        end
        
        light{i}{5} = X4;
        
    elseif(transMatrix(row,i) == X5) %balra
        light{i}{1}.MarkerEdgeColor = 'white';
        light{i}{1}.MarkerFaceColor = 'white';
        light{i}{1}.Marker = 's';
        
        light{i}{2}.MarkerEdgeColor = 'green';
        light{i}{2}.MarkerFaceColor = 'green';
        if((i == 1) || (i == 2) || (i == 3))
            light{i}{2}.Marker = '>';
        elseif((i == 4) || (i == 5) || (i == 6))
            light{i}{2}.Marker = '^';
        elseif((i == 7) || (i == 8) || (i == 9))
            light{i}{2}.Marker = '<';
        elseif((i == 10) || (i == 11) || (i == 12))
            light{i}{2}.Marker = 'v';
        end
        
        light{i}{3}.MarkerEdgeColor = 'white';
        light{i}{3}.MarkerFaceColor = 'white';
        light{i}{3}.Marker = 's';
        
        light{i}{4}.MarkerEdgeColor = 'white';
        light{i}{4}.MarkerFaceColor = 'white';
        light{i}{4}.Marker = 's';
        
        light{i}{5} = X5;
        
    elseif(transMatrix(row,i) == X6) %elore es jobbra
        light{i}{1}.MarkerEdgeColor = 'white';
        light{i}{1}.MarkerFaceColor = 'white';
        light{i}{1}.Marker = 's';
        
        light{i}{2}.MarkerEdgeColor = 'white';
        light{i}{2}.MarkerFaceColor = 'white';
        light{i}{2}.Marker = 's';
        
        light{i}{3}.MarkerEdgeColor = 'green';
        light{i}{3}.MarkerFaceColor = 'green';
        if((i == 1) || (i == 2) || (i == 3))
            light{i}{3}.Marker = 'v';
        elseif((i == 4) || (i == 5) || (i == 6))
            light{i}{3}.Marker = '>';
        elseif((i == 7) || (i == 8) || (i == 9))
            light{i}{3}.Marker = '^';
        elseif((i == 10) || (i == 11) || (i == 12))
            light{i}{3}.Marker = '<';
        end
        
        light{i}{4}.MarkerEdgeColor = 'green';
        light{i}{4}.MarkerFaceColor = 'green';
        if((i == 1) || (i == 2) || (i == 3))
            light{i}{4}.Marker = '<';
        elseif((i == 4) || (i == 5) || (i == 6))
            light{i}{4}.Marker = 'v';
        elseif((i == 7) || (i == 8) || (i == 9))
            light{i}{4}.Marker = '>';
        elseif((i == 10) || (i == 11) || (i == 12))
            light{i}{4}.Marker = '^';
        end
        
        light{i}{5} = X6;
        
    elseif(transMatrix(row,i) == X7) %elore es balra
        light{i}{1}.MarkerEdgeColor = 'white';
        light{i}{1}.MarkerFaceColor = 'white';
        light{i}{1}.Marker = 's';
        
        light{i}{2}.MarkerEdgeColor = 'green';
        light{i}{2}.MarkerFaceColor = 'green';
        if((i == 1) || (i == 2) || (i == 3))
            light{i}{2}.Marker = '>';
        elseif((i == 4) || (i == 5) || (i == 6))
            light{i}{2}.Marker = '^';
        elseif((i == 7) || (i == 8) || (i == 9))
            light{i}{2}.Marker = '<';
        elseif((i == 10) || (i == 11) || (i == 12))
            light{i}{2}.Marker = 'v';
        end
        
        light{i}{3}.MarkerEdgeColor = 'green';
        light{i}{3}.MarkerFaceColor = 'green';
        if((i == 1) || (i == 2) || (i == 3))
            light{i}{3}.Marker = 'v';
        elseif((i == 4) || (i == 5) || (i == 6))
            light{i}{3}.Marker = '>';
        elseif((i == 7) || (i == 8) || (i == 9))
            light{i}{3}.Marker = '^';
        elseif((i == 10) || (i == 11) || (i == 12))
            light{i}{3}.Marker = '<';
        end
        
        light{i}{4}.MarkerEdgeColor = 'white';
        light{i}{4}.MarkerFaceColor = 'white';
        light{i}{4}.Marker = 's';
        
        light{i}{5} = X7;
        
    elseif(transMatrix(row,i) == X8) %elore es jobbra es balra
        light{i}{1}.MarkerEdgeColor = 'white';
        light{i}{1}.MarkerFaceColor = 'white';
        light{i}{1}.Marker = 's';
        
        light{i}{2}.MarkerEdgeColor = 'green';
        light{i}{2}.MarkerFaceColor = 'green';
        if((i == 1) || (i == 2) || (i == 3))
            light{i}{2}.Marker = '>';
        elseif((i == 4) || (i == 5) || (i == 6))
            light{i}{2}.Marker = '^';
        elseif((i == 7) || (i == 8) || (i == 9))
            light{i}{2}.Marker = '<';
        elseif((i == 10) || (i == 11) || (i == 12))
            light{i}{2}.Marker = 'v';
        end
        
        light{i}{3}.MarkerEdgeColor = 'green';
        light{i}{3}.MarkerFaceColor = 'green';
        if((i == 1) || (i == 2) || (i == 3))
            light{i}{3}.Marker = 'v';
        elseif((i == 4) || (i == 5) || (i == 6))
            light{i}{3}.Marker = '>';
        elseif((i == 7) || (i == 8) || (i == 9))
            light{i}{3}.Marker = '^';
        elseif((i == 10) || (i == 11) || (i == 12))
            light{i}{3}.Marker = '<';
        end
        
        light{i}{4}.MarkerEdgeColor = 'green';
        light{i}{4}.MarkerFaceColor = 'green';
        if((i == 1) || (i == 2) || (i == 3))
            light{i}{4}.Marker = '<';
        elseif((i == 4) || (i == 5) || (i == 6))
            light{i}{4}.Marker = 'v';
        elseif((i == 7) || (i == 8) || (i == 9))
            light{i}{4}.Marker = '>';
        elseif((i == 10) || (i == 11) || (i == 12))
            light{i}{4}.Marker = '^';
        end
        
        light{i}{5} = X8;
        
    elseif(transMatrix(row,i) == X9) %piros sarga
        light{i}{1}.MarkerEdgeColor = 'yellow';
        light{i}{1}.MarkerFaceColor = 'yellow';
        light{i}{1}.Marker = 's';
        
        light{i}{2}.MarkerEdgeColor = 'white';
        light{i}{2}.MarkerFaceColor = 'white';
        light{i}{2}.Marker = 's';
        
        light{i}{3}.MarkerEdgeColor = 'red';
        light{i}{3}.MarkerFaceColor = 'red';
        light{i}{3}.Marker = 's';
        
        light{i}{4}.MarkerEdgeColor = 'white';
        light{i}{4}.MarkerFaceColor = 'white';
        light{i}{4}.Marker = 's';
        
        light{i}{5} = X9;
        
    elseif(transMatrix(row,i) == X10) %off
        light{i}{1}.MarkerEdgeColor = 'white';
        light{i}{1}.MarkerFaceColor = 'white';
        light{i}{1}.Marker = 's';
        
        light{i}{2}.MarkerEdgeColor = 'white';
        light{i}{2}.MarkerFaceColor = 'white';
        light{i}{2}.Marker = 's';
        
        light{i}{3}.MarkerEdgeColor = 'white';
        light{i}{3}.MarkerFaceColor = 'white';
        light{i}{3}.Marker = 's';
        
        light{i}{4}.MarkerEdgeColor = 'white';
        light{i}{4}.MarkerFaceColor = 'white';
        light{i}{4}.Marker = 's';
        
        light{i}{5} = X10;
        
    end
end

lightCalc = light;

end