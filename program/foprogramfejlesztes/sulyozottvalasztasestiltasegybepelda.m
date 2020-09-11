valamitime1 = tic;
x = datasample([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48], 10000000, 'Weights',[2 2 11 11 11 11 0 0 0 0 0 0 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 0 0 0 0 0 0 2 2 2 2 2 2 2 2 2 2 2 2]);

cntr1 = 0;
cntr2 = 0;
cntr3 = 0;
cntr4 = 0;
cntr5 = 0;
cntr6 = 0;
cntr7 = 0;
cntr8 = 0;
cntr9 = 0;
cntr10 = 0;
cntr11 = 0;
cntr12 = 0;
cntr13 = 0;
cntr14 = 0;
cntr15 = 0;
cntr16 = 0;
cntr17 = 0;
cntr18 = 0;
cntr19 = 0;
cntr20 = 0;
cntr21 = 0;
cntr22 = 0;
cntr23 = 0;
cntr24 = 0;
cntr25 = 0;
cntr26 = 0;
cntr27 = 0;
cntr28 = 0;
cntr29 = 0;
cntr30 = 0;
cntr31 = 0;
cntr32 = 0;
cntr33 = 0;
cntr34 = 0;
cntr35 = 0;
cntr36 = 0;
cntr37 = 0;
cntr38 = 0;
cntr39 = 0;
cntr40 = 0;
cntr41 = 0;
cntr42 = 0;
cntr43 = 0;
cntr44 = 0;
cntr45 = 0;
cntr46 = 0;
cntr47 = 0;
cntr48 = 0;
valamitime2 = 0;

for i = 1:length(x)
    tic
    if(x(i) == 1)
        cntr1 = cntr1 + 1;
    end
    if(x(i) == 2)
        cntr2 = cntr2 + 1;
    end
    if(x(i) == 3)
        cntr3 = cntr3 + 1;
    end
    if(x(i) == 4)
        cntr4 = cntr4 + 1;
    end
    if(x(i) == 5)
        cntr5 = cntr5 + 1;
    end
    if(x(i) == 6)
        cntr6 = cntr6 + 1;
    end
    if(x(i) == 7)
        cntr7 = cntr7 + 1;
    end
    if(x(i) == 8)
        cntr8 = cntr8 + 1;
    end
    if(x(i) == 9)
        cntr9 = cntr9 + 1;
    end
    if(x(i) == 10)
        cntr10 = cntr10 + 1;
    end
    if(x(i) == 11)
        cntr11 = cntr11 + 1;
    end
    if(x(i) == 12)
        cntr12 = cntr12 + 1;
    end
    if(x(i) == 13)
        cntr13 = cntr13 + 1;
    end
    if(x(i) == 14)
        cntr14 = cntr14 + 1;
    end
    if(x(i) == 15)
        cntr15 = cntr15 + 1;
    end
    if(x(i) == 16)
        cntr16 = cntr16 + 1;
    end
    if(x(i) == 17)
        cntr17 = cntr17 + 1;
    end
    if(x(i) == 18)
        cntr18 = cntr18 + 1;
    end
    if(x(i) == 19)
        cntr19 = cntr19 + 1;
    end
    if(x(i) == 20)
        cntr20 = cntr20 + 1;
    end
    if(x(i) == 21)
        cntr21 = cntr21 + 1;
    end
    if(x(i) == 22)
        cntr22 = cntr22 + 1;
    end
    if(x(i) == 23)
        cntr23 = cntr23 + 1;
    end
    if(x(i) == 4)
        cntr24 = cntr24 + 1;
    end
    if(x(i) == 5)
        cntr25 = cntr25 + 1;
    end
    if(x(i) == 26)
        cntr26 = cntr26 + 1;
    end
    if(x(i) == 27)
        cntr27 = cntr27 + 1;
    end
    if(x(i) == 28)
        cntr28 = cntr28 + 1;
    end
    if(x(i) == 29)
        cntr29 = cntr29 + 1;
    end
    if(x(i) == 30)
        cntr30 = cntr30 + 1;
    end
    if(x(i) == 31)
        cntr31 = cntr31 + 1;
    end
    if(x(i) == 32)
        cntr32 = cntr32 + 1;
    end
    if(x(i) == 33)
        cntr33 = cntr33 + 1;
    end
    if(x(i) == 34)
        cntr34 = cntr34 + 1;
    end
    if(x(i) == 35)
        cntr35 = cntr35 + 1;
    end
    if(x(i) == 36)
        cntr36 = cntr36 + 1;
    end
    if(x(i) == 37)
        cntr37 = cntr37 + 1;
    end
    if(x(i) == 38)
        cntr38 = cntr38 + 1;
    end
    if(x(i) == 39)
        cntr39 = cntr39 + 1;
    end
    if(x(i) == 40)
        cntr40 = cntr40 + 1;
    end
    if(x(i) == 41)
        cntr41 = cntr41 + 1;
    end
    if(x(i) == 42)
        cntr42 = cntr42 + 1;
    end
    if(x(i) == 43)
        cntr43 = cntr43 + 1;
    end
    if(x(i) == 44)
        cntr44 = cntr44 + 1;
    end
    if(x(i) == 45)
        cntr45 = cntr45 + 1;
    end
    if(x(i) == 46)
        cntr46 = cntr46 + 1;
    end
    if(x(i) == 47)
        cntr47 = cntr47 + 1;
    end
    if(x(i) == 48)
        cntr48 = cntr48 + 1;
    end
    valamitime2 = valamitime2 + toc;
end
elapsedtime = toc(valamitime1);
% random = datasample([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48], 1, 'Weights',[2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2]);

%eszaki terheles

%nyufati terheles

%deli terheles

%keleti terheles





