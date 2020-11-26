%descrete plot for results
results = readmatrix("C:\Users\csokviktor\Desktop\excelekazábrákhoz\balraciklushossz.xlsx");
northCars = results(1:end, 1);
westCars = results(1:end, 2);
southCars = results(1:end, 3);
eastCars = results(1:end, 4);
greenDirection = results(1:end, 5);
cycleType = results(1:end, 6);
overloadType = results(1:end, 7);

f = figure('position',[100,100,1300,600]);
title("Dynamics of the cars in the lanes", "FontSize", 14)
ylim([0 25])
hold on
stairs(northCars, 'LineWidth', 2);
hold on
stairs(westCars, 'LineWidth', 2);
hold on
stairs(southCars, 'LineWidth', 2);
hold on
stairs(eastCars, 'LineWidth', 2);
hold on
stairs(greenDirection, 'LineWidth', 2);
hold on
stairs(cycleType, 'LineWidth', 2);
hold on
legend("North car number", "West car number", "South car number", "East car number",...
    "Green direction", "Cycle type");
hold on
axes = gca;
axes.YGrid = "on";
axes.YMinorGrid = "on";
axes.YMinorTick = "on";
axes.XGrid = "on";
hold off
