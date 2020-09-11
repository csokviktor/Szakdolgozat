x = datasample([1 2 3 4 5 6 7 8 9 10], 520000, 'Weights',[0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.2]);
szar  = cell(1,2);
for i = 1:length(x)
    if(x(i) == 5)
        szar{1} = 1;
        szar{2} = i;
        break;
    end
end