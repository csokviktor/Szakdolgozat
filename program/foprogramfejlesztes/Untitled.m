% num = 100;
% valami = cell(1,num);
% for p = 1:num
%     valami{p} = cell(1,8);
% end
% 
% for i=1:num
%     valami{i}{1} = i;
% end
% i = 0;
% 
% for u=1:num
%     if(valami{u}{1} ~= 5)
%         i = i + 1;
%         valamitemp{i} = valami{u};
%     end
% end
% 
% valami = valamitemp;
% num = i;
tic
x = 1;
for i = 1:10000000000
    x = valami(x);
end
elapsedtime = toc;