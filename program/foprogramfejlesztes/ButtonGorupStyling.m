% %lampaciklus kezi allitasahoz
% f1 = uifigure;
% bg1 = uibuttongroup(f1,'Position',[150 150 300 300]);
% tb1 = uibutton(bg1,'Position',[100 225 140 22],'Text','One','ButtonPushedFcn', @(tb1,event) one());
% tb2 = uibutton(bg1,'Position',[100 200 140 22],'Text','Two','ButtonPushedFcn', @(tb2,event) two());
% tb3 = uibutton(bg1,'Position',[100 175 140 22],'Text','Three','ButtonPushedFcn', @(tb3,event) three());
% tb4 = uibutton(bg1,'Position',[100 150 140 22],'Text','Four','ButtonPushedFcn', @(tb4,event) four());
% tb5 = uibutton(bg1,'Position',[100 125 140 22],'Text','Five','ButtonPushedFcn', @(tb5,event) five());
% tb6 = uibutton(bg1,'Position',[100 100 140 22],'Text','Six','ButtonPushedFcn', @(tb6,event) six());
% tb7 = uibutton(bg1,'Position',[100 75 140 22],'Text','Seven','ButtonPushedFcn', @(tb7,event) seven());
% tb8 = uibutton(bg1,'Position',[100 50 140 22],'Text','Eight','ButtonPushedFcn', @(tb8,event) eight());
% tb9 = uibutton(bg1,'Position',[100 25 140 22],'Text','Nine','ButtonPushedFcn', @(tb9,event) nine());
% 
% %terheles allitasahoz
% f2 = uifigure;
% bg2 = uibuttongroup(f2,'Position',[150 150 300 300]);
% pb1 = uibutton(bg2,'Position',[100 225 140 22],'Text','Overload N To S','ButtonPushedFcn', @(pb1,event) olNTS());
% pb2 = uibutton(bg2,'Position',[100 200 140 22],'Text','Overload N To E','ButtonPushedFcn', @(pb2,event) olNTE());
% pb3 = uibutton(bg2,'Position',[100 175 140 22],'Text','Overload W To E','ButtonPushedFcn', @(pb3,event) olWTE());
% pb4 = uibutton(bg2,'Position',[100 150 140 22],'Text','Overload W To N','ButtonPushedFcn', @(pb4,event) olWTN());
% pb5 = uibutton(bg2,'Position',[100 125 140 22],'Text','Overload S To N','ButtonPushedFcn', @(pb5,event) olSTN());
% pb6 = uibutton(bg2,'Position',[100 100 140 22],'Text','Overload S To W','ButtonPushedFcn', @(pb6,event) olSTW());
% pb7 = uibutton(bg2,'Position',[100 75 140 22],'Text','Overload E To W','ButtonPushedFcn', @(pb7,event) olETW());
% pb8 = uibutton(bg2,'Position',[100 50 140 22],'Text','Overload E To S','ButtonPushedFcn', @(pb8,event) olETS());
% pb9 = uibutton(bg2,'Position',[100 25 140 22],'Text','No Overload','ButtonPushedFcn', @(pb9,event) nool());
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;
global lampaciklusnext;
f = uifigure('Name', 'Control Buttons');
bg = uibuttongroup(f,'Position',[0 0 565 425]);
%lampaciklus kezi allitasahoz
lbl1 = uilabel(bg, 'Position', [50 350 140 22], 'Text', 'Cycle type selector', 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
pb1 = uibutton(bg,'Position',[50 320 140 22],'Text','One','ButtonPushedFcn', @(pb1,event) one());
pb2 = uibutton(bg,'Position',[50 290 140 22],'Text','Two','ButtonPushedFcn', @(pb2,event) two());
pb3 = uibutton(bg,'Position',[50 260 140 22],'Text','Three','ButtonPushedFcn', @(pb3,event) three());
pb4 = uibutton(bg,'Position',[50 230 140 22],'Text','Four','ButtonPushedFcn', @(pb4,event) four());
pb5 = uibutton(bg,'Position',[50 200 140 22],'Text','Five','ButtonPushedFcn', @(pb5,event) five());
pb6 = uibutton(bg,'Position',[50 170 140 22],'Text','Six','ButtonPushedFcn', @(pb6,event) six());
pb7 = uibutton(bg,'Position',[50 140 140 22],'Text','Seven','ButtonPushedFcn', @(pb7,event) seven());
pb8 = uibutton(bg,'Position',[50 110 140 22],'Text','Eight','ButtonPushedFcn', @(pb8,event) eight());
pb9 = uibutton(bg,'Position',[50 80 140 22],'Text','Nine','ButtonPushedFcn', @(pb9,event) nine());

%terheles allitasahoz
lbl2 = uilabel(bg, 'Position', [350 350 140 22], 'Text', 'Overload type selector', 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
pb10 = uibutton(bg,'Position',[350 320 140 22],'Text','Overload N To S','ButtonPushedFcn', @(pb10,event) olNTS());
pb11 = uibutton(bg,'Position',[350 290 140 22],'Text','Overload N To E','ButtonPushedFcn', @(pb11,event) olNTE());
pb12 = uibutton(bg,'Position',[350 260 140 22],'Text','Overload W To E','ButtonPushedFcn', @(pb12,event) olWTE());
pb13 = uibutton(bg,'Position',[350 230 140 22],'Text','Overload W To N','ButtonPushedFcn', @(pb13,event) olWTN());
pb14 = uibutton(bg,'Position',[350 200 140 22],'Text','Overload S To N','ButtonPushedFcn', @(pb14,event) olSTN());
pb15 = uibutton(bg,'Position',[350 170 140 22],'Text','Overload S To W','ButtonPushedFcn', @(pb15,event) olSTW());
pb16 = uibutton(bg,'Position',[350 140 140 22],'Text','Overload E To W','ButtonPushedFcn', @(pb16,event) olETW());
pb17 = uibutton(bg,'Position',[350 110 140 22],'Text','Overload E To S','ButtonPushedFcn', @(pb17,event) olETS());
pb18 = uibutton(bg,'Position',[350 80 140 22],'Text','No Overload','ButtonPushedFcn', @(pb18,event) nool());

lbl3 = uilabel(bg, 'Position', [50 50 140 22], 'Text', 'Overload type selector', 'HorizontalAlignment', 'center', 'FontWeight', 'bold');

while(1)
    x = 1;
    lbl3.Text = int2str(lampaciklusnext);
    pause(0.1)
end


%lampaciklusok valtasa kezileg
function one()
global lampaciklusnext;
lampaciklusnext = 1;
end
function two()
global lampaciklusnext;
lampaciklusnext = 2;
end
function three()
global lampaciklusnext;
lampaciklusnext = 3;
end
function four()
global lampaciklusnext;
lampaciklusnext = 4;
end
function five()
global lampaciklusnext;
lampaciklusnext = 5;
end
function six()
global lampaciklusnext;
lampaciklusnext = 6;
end
function seven()
global lampaciklusnext;
lampaciklusnext = 7;
end
function eight()
global lampaciklusnext;
lampaciklusnext = 8;
end
function nine()
global lampaciklusnext;
lampaciklusnext = 9;
end

%tulterheles kezelese
function olNTS()
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 1;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 0;
nooverload = 0;
end
function olNTE()
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 1;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 0;
nooverload = 0;
end
function olWTE()
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 1;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 0;
nooverload = 0;
end
function olWTN()
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 1;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 0;
nooverload = 0;
end
function olSTN()
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 1;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 0;
nooverload = 0;
end
function olSTW()
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 1;
overloadETW = 0;
overloadETS = 0;
nooverload = 0;
end
function olETW()
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 1;
overloadETS = 0;
nooverload = 0;
end
function olETS()
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 1;
nooverload = 0;
end
function nool()
global overloadNTS;
global overloadNTE;
global overloadWTE;
global overloadWTN;
global overloadSTN;
global overloadSTW;
global overloadETW;
global overloadETS;
global nooverload;

overloadNTS = 0;
overloadNTE = 0;
overloadWTE = 0;
overloadWTN = 0;
overloadSTN = 0;
overloadSTW = 0;
overloadETW = 0;
overloadETS = 0;
nooverload = 1;
end