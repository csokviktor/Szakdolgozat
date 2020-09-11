function mytemps
f = figure;
c = uicontrol(f,'Style','popupmenu');
c.Position = [20 75 60 20];
c.String = {'Lampaciklus 1','Lampaciklus 2','Lampaciklus 3','Lampaciklus 4','Lampaciklus 5','Lampaciklus 6','Lampaciklus 7','Lampaciklus 8','Lampaciklus 9'};
c.Callback = @selection;
global a;
global val;
a=1;
while(1)
    a=a+1;
    pause(1);
end


    function selection(src,event)
        val = c.Value;
        disp(['Selection: ' val]);
    end
end
