function randomfgvek()
% if(lampaciklusaktualis == 1 && lampaciklusnext == 3)
%     for k = 1:carnum
%         if((isequal(car{k}{2}.XData, -60) && isequal(car{k}{2}.YData, 600)) || (isequal(car{k}{2}.XData, -20) && isequal(car{k}{2}.YData, 600)))
%             changeRoute2(lampaciklusnext,k);
%         end
%     end
% elseif(lampaciklusaktualis == 1 && lampaciklusnext == 5)
%     for k = 1:carnum
%         if((isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60)) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20)))
%             changeRoute2(lampaciklusnext,k);
%         end
%     end
% elseif(lampaciklusaktualis == 1 && lampaciklusnext == 7)
%     for k = 1:carnum
%         if((isequal(car{k}{2}.XData, 60) && isequal(car{k}{2}.YData, -600)) || (isequal(car{k}{2}.XData, 20) && isequal(car{k}{2}.YData, -600)))
%             changeRoute2(lampaciklusnext,k);
%         end
%     end
% elseif(lampaciklusaktualis == 1 && lampaciklusnext == 9)
%     for k = 1:carnum
%         if((isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)))
%             changeRoute2(lampaciklusnext,k);
%         end
%     end
% 
% elseif(lampaciklusaktualis == 3 && lampaciklusnext == 1)
%     for k = 1:carnum
%         if((isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)))
%             changeRoute2(lampaciklusnext,k);
%         end
%     end
% elseif(lampaciklusaktualis == 3 && lampaciklusnext == 5)
%     for k = 1:carnum
%         if((isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)) ...
%             || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60)) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20)))
%             changeRoute2(lampaciklusnext,k);
%         end
%     end
% elseif(lampaciklusaktualis == 3 && lampaciklusnext == 7)
%     for k = 1:carnum
%         if((isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)) ...
%             || (isequal(car{k}{2}.XData, 60) && isequal(car{k}{2}.YData, -600)) || (isequal(car{k}{2}.XData, 20) && isequal(car{k}{2}.YData, -600)))
%             changeRoute2(lampaciklusnext,k);
%         end
%     end
% elseif(lampaciklusaktualis == 3 && lampaciklusnext == 9)
%     for k = 1:carnum
%         if((isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)) ...
%             || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)))
%             changeRoute2(lampaciklusnext,k);
%         end
%     end
% 
% elseif(lampaciklusaktualis == 5 && lampaciklusnext == 1)
%     for k = 1:carnum
%         if((isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60)) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20)) ...
%             || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)))
%             changeRoute2(lampaciklusnext,k);
%         end
%     end
% elseif(lampaciklusaktualis == 5 && lampaciklusnext == 3)
%     for k = 1:carnum
%         if((isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60)) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20)) ...
%             || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)))
%             changeRoute2(lampaciklusnext,k);
%         end
%     end
% elseif(lampaciklusaktualis == 5 && lampaciklusnext == 7)
%     for k = 1:carnum
%         if((isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60)) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20)) ...
%             || (isequal(car{k}{2}.XData, 60) && isequal(car{k}{2}.YData, -600)) || (isequal(car{k}{2}.XData, 20) && isequal(car{k}{2}.YData, -600)))
%             changeRoute2(lampaciklusnext,k);
%         end
%     end
% elseif(lampaciklusaktualis == 5 && lampaciklusnext == 9)
%     for k = 1:carnum
%         if((isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -60)) || (isequal(car{k}{2}.XData, -600) && isequal(car{k}{2}.YData, -20)) ...
%             || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 60)) || (isequal(car{k}{2}.XData, 600) && isequal(car{k}{2}.YData, 20)))
%             changeRoute2(lampaciklusnext,k);
%         end
%     end
% end





% switch lampaciklusnext
%     case 2
%         for p = 1:carnum
%             for r = 1:26
%                 if(isequal(car{p}{2}.XData, s2n3pos{r}(1)) && isequal(car{p}{2}.YData, s2n3pos{r}(2)) && car{p}{8} ~= 0)
%                     blocks2 = 1;
%                     breakbool2 = 1;
%                     break
%                 end
%             end
%             if(breakbool2 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
%                 breakbool2 = 0;
%                 break;
%             else %ha nem volt ott auto akkor oldjuk a tiltast
%                 blocks2 = 0;
%             end
%         end
%     case 4
%         for p = 1:carnum
%             for r = 1:26
%                 if(isequal(car{p}{2}.XData, e2w3pos{r}(1)) && isequal(car{p}{2}.YData, e2w3pos{r}(2)) && car{p}{8} ~= 0)
%                     blocke2 = 1;
%                     breakbool3 = 1;
%                     break
%                 end
%             end
%             if(breakbool3 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
%                 breakbool3 = 0;
%                 break;
%             else
%                 blocke2 = 0;
%             end
%         end
%     case 6
%         for p = 1:carnum
%             for r = 1:26
%                 if(isequal(car{p}{2}.XData, n2s3pos{r}(1)) && isequal(car{p}{2}.YData, n2s3pos{r}(2)) && car{p}{8} ~= 0)
%                     blockn2 = 1;
%                     breakbool4 = 1;
%                     break
%                 end
%             end
%             if(breakbool4 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
%                 breakbool4 = 0;
%                 break
%             else
%                 blockn2 = 0;
%             end
%         end
%     case 8
%         for p = 1:carnum
%             for r = 1:26
%                 if(isequal(car{p}{2}.XData, w2e3pos{r}(1)) && isequal(car{p}{2}.YData, w2e3pos{r}(2)) && car{p}{8} ~= 0)
%                     blockw2 = 1;
%                     breakbool5 = 1;
%                     break
%                 end
%             end
%             if(breakbool5 == 1) %ne fusson le az osszes auton ha mar talalt egyet aki savba van
%                 breakbool5 = 0;
%                 break
%             else
%                 blockw2 = 0;
%             end
%         end
% end

end