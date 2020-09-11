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
end
end