function checkSurrounding(actcar)
global car;
global carnum;

for i = 1:carnum
    if(actcar ~= i && (length(car{actcar}{1}) > car{actcar}{3}) && car{actcar}{7} ~= 0 && (length(car{i}{1}) > car{i}{3})) %sajat magara ne vizsgaljuk meg, es akkor sem ha az utolso pozicioban van
        
        %ellenorzi, hogy a kovetkezo pozicio ures e
        if(isequal(car{actcar}{1}{car{actcar}{3}+1}(1), car{i}{2}.XData) && isequal(car{actcar}{1}{car{actcar}{3}+1}(2), car{i}{2}.YData) && isequal(car{i}{8}, 0))
            car{actcar}{7} = 0; %nem ures, ha ures akkor nezi a kovetkezo esetet
            
        
            
        %ellenorzi a kozlekedesi szabalyokat(6 szabaly) (actcar lesz a kijjebb levo mindig)
        
        %N1-N2-N3 savokra
        %1
        elseif(isequal(car{actcar}{2}.XData, -60) && isequal(car{i}{2}.XData, -20) && isequal(car{actcar}{2}.YData, car{i}{2}.YData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), -20) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), car{i}{1}{car{i}{3} + 1}(2))) % hova mennek
            car{i}{7} = 0;
        %2
        elseif(isequal(car{actcar}{2}.XData, -60) && isequal(car{i}{2}.XData, -20) && isequal(car{actcar}{2}.YData, car{i}{2}.YData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), -20) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), car{i}{1}{car{i}{3} + 1}(2)))
            car{i}{7} = 0;
        %3
        elseif(isequal(car{actcar}{2}.XData, -60) && isequal(car{i}{2}.XData, -20) && isequal(car{actcar}{2}.YData, car{i}{2}.YData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), -60) && isequal(car{i}{1}{car{i}{3} + 1}(1), -60) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), car{i}{1}{car{i}{3} + 1}(2)))
            car{actcar}{7} = 0;
        %4
        elseif(isequal(car{actcar}{2}.XData, -20) && isequal(car{i}{2}.XData, 20) && isequal(car{actcar}{2}.YData, car{i}{2}.YData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), 20) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), car{i}{1}{car{i}{3} + 1}(2)))
            car{actcar}{7} = 0;
        %5
        elseif(isequal(car{actcar}{2}.XData, -20) && isequal(car{i}{2}.XData, 20) && isequal(car{actcar}{2}.YData, car{i}{2}.YData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), 20) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), car{i}{1}{car{i}{3} + 1}(2)))
            car{i}{7} = 0;
        %6
        elseif(isequal(car{actcar}{2}.XData, -20) && isequal(car{i}{2}.XData, 20) && isequal(car{actcar}{2}.YData, car{i}{2}.YData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), -20) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), car{i}{1}{car{i}{3} + 1}(2)))
            car{i}{7} = 0;
        
            
        % W1-W2-W3 savokra
        %1
        elseif(isequal(car{actcar}{2}.YData, -60) && isequal(car{i}{2}.YData, -20) && isequal(car{actcar}{2}.XData, car{i}{2}.XData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), -20) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), car{i}{1}{car{i}{3} + 1}(1))) % hova mennek
            car{i}{7} = 0;
        %2
        elseif(isequal(car{actcar}{2}.YData, -60) && isequal(car{i}{2}.YData, -20) && isequal(car{actcar}{2}.XData, car{i}{2}.XData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), -20) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), car{i}{1}{car{i}{3} + 1}(1)))
            car{i}{7} = 0;
        %3
        elseif(isequal(car{actcar}{2}.YData, -60) && isequal(car{i}{2}.YData, -20) && isequal(car{actcar}{2}.XData, car{i}{2}.XData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), -60) && isequal(car{i}{1}{car{i}{3} + 1}(2), -60) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), car{i}{1}{car{i}{3} + 1}(1)))
            car{actcar}{7} = 0;
        %4
        elseif(isequal(car{actcar}{2}.YData, -20) && isequal(car{i}{2}.YData, 20) && isequal(car{actcar}{2}.XData, car{i}{2}.XData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), 20) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), car{i}{1}{car{i}{3} + 1}(1)))
            car{actcar}{7} = 0;
        %5
        elseif(isequal(car{actcar}{2}.YData, -20) && isequal(car{i}{2}.YData, 20) && isequal(car{actcar}{2}.XData, car{i}{2}.XData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), 20) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), car{i}{1}{car{i}{3} + 1}(1)))
            car{i}{7} = 0;
        %6
        elseif(isequal(car{actcar}{2}.YData, -20) && isequal(car{i}{2}.YData, 20) && isequal(car{actcar}{2}.XData, car{i}{2}.XData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), -20) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), car{i}{1}{car{i}{3} + 1}(1)))
            car{i}{7} = 0;
        
            
        % S1-S2-S3 savokra
        %1
        elseif(isequal(car{actcar}{2}.XData, 60) && isequal(car{i}{2}.XData, 20) && isequal(car{actcar}{2}.YData, car{i}{2}.YData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), 20) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), car{i}{1}{car{i}{3} + 1}(2))) % hova mennek
            car{i}{7} = 0;
        %2
        elseif(isequal(car{actcar}{2}.XData, 60) && isequal(car{i}{2}.XData, 20) && isequal(car{actcar}{2}.YData, car{i}{2}.YData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), 20) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), car{i}{1}{car{i}{3} + 1}(2)))
            car{i}{7} = 0;
        %3
        elseif(isequal(car{actcar}{2}.XData, 60) && isequal(car{i}{2}.XData, 20) && isequal(car{actcar}{2}.YData, car{i}{2}.YData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), 60) && isequal(car{i}{1}{car{i}{3} + 1}(1), 60) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), car{i}{1}{car{i}{3} + 1}(2)))
            car{actcar}{7} = 0;
        %4
        elseif(isequal(car{actcar}{2}.XData, 20) && isequal(car{i}{2}.XData, -20) && isequal(car{actcar}{2}.YData, car{i}{2}.YData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), -20) && isequal(car{i}{1}{car{i}{3} + 1}(1), -20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), car{i}{1}{car{i}{3} + 1}(2)))
            car{actcar}{7} = 0;
        %5
        elseif(isequal(car{actcar}{2}.XData, 20) && isequal(car{i}{2}.XData, -20) && isequal(car{actcar}{2}.YData, car{i}{2}.YData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), -20) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), car{i}{1}{car{i}{3} + 1}(2)))
            car{i}{7} = 0;
        %6
        elseif(isequal(car{actcar}{2}.XData, 20) && isequal(car{i}{2}.XData, -20) && isequal(car{actcar}{2}.YData, car{i}{2}.YData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), 20) && isequal(car{i}{1}{car{i}{3} + 1}(1), 20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), car{i}{1}{car{i}{3} + 1}(2)))
            car{i}{7} = 0;
            
            
        % E1-E2-E3 savokra
        %1
        elseif(isequal(car{actcar}{2}.YData, 60) && isequal(car{i}{2}.YData, 20) && isequal(car{actcar}{2}.XData, car{i}{2}.XData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), 20) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), car{i}{1}{car{i}{3} + 1}(1))) % hova mennek
            car{i}{7} = 0;
        %2
        elseif(isequal(car{actcar}{2}.YData, 60) && isequal(car{i}{2}.YData, 20) && isequal(car{actcar}{2}.XData, car{i}{2}.XData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), 20) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), car{i}{1}{car{i}{3} + 1}(1)))
            car{i}{7} = 0;
        %3
        elseif(isequal(car{actcar}{2}.YData, 60) && isequal(car{i}{2}.YData, 20) && isequal(car{actcar}{2}.XData, car{i}{2}.XData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), 60) && isequal(car{i}{1}{car{i}{3} + 1}(2), 60) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), car{i}{1}{car{i}{3} + 1}(1)))
            car{actcar}{7} = 0;
        %4
        elseif(isequal(car{actcar}{2}.YData, 20) && isequal(car{i}{2}.YData, -20) && isequal(car{actcar}{2}.XData, car{i}{2}.XData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), -20) && isequal(car{i}{1}{car{i}{3} + 1}(2), -20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), car{i}{1}{car{i}{3} + 1}(1)))
            car{actcar}{7} = 0;
        %5
        elseif(isequal(car{actcar}{2}.YData, 20) && isequal(car{i}{2}.YData, -20) && isequal(car{actcar}{2}.XData, car{i}{2}.XData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), -20) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), car{i}{1}{car{i}{3} + 1}(1)))
            car{i}{7} = 0;
        %6
        elseif(isequal(car{actcar}{2}.YData, 20) && isequal(car{i}{2}.YData, -20) && isequal(car{actcar}{2}.XData, car{i}{2}.XData)... % egymas mellett vannak e
                && isequal(car{actcar}{1}{car{actcar}{3} + 1}(2), 20) && isequal(car{i}{1}{car{i}{3} + 1}(2), 20) && isequal(car{actcar}{1}{car{actcar}{3} + 1}(1), car{i}{1}{car{i}{3} + 1}(1)))
            car{i}{7} = 0;
        end 
        
    end
end

end