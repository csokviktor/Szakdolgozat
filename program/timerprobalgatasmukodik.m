
t = timer('ExecutionMode', 'fixedRate', 'Period', 1);
t.TimerFcn = @(myTimerObj, thisEvent)valami();

global b;
b=1;
global c;
c = plot(10,10,'s');
a=1;
start(t);

while(a<10)
    a=a+1;
    pause(1);
end
stop(t);
delete(t);


function valami()
global b;
global c;
c.XData = c.XData + 10;
c.YData = c.YData + 10;
b=b+1;
end