   h0=0.01;
   edl=11;
   for ll=1:edl
       ll
       hh(ll)=(1/2)^ll*h0;
       err(ll)=onedi(hh(ll));
       errlog(ll)=log(err(ll));
   end
   loghh=log(hh);
   plot(loghh,errlog);
%plot(hh,err);
   %legend('对h的')
   xdraw=-12:0.1:-5;
   ydraw=2.*xdraw-5.5;
   hold on 
   plot(xdraw,ydraw)
   legend('对h的','参考线')
   
       
   

function err=onedi(h)
   %x0=0.5;
   syms fx;
   f=@(fx)fx.*(1-fx);
   h;
   ed=4;
   st=0
   t=st:h:ed;
   c=(ed-st)/h; 
   x(1)=0.5
   for i=1:c
       x(i+1)=getx(x(i),h,f);
   end;
   xx=1./(1+exp(-t));
   err=abs(x(c+1)-xx(c+1))
   
 %    plot(t,x)
%    xx=1./(1+exp(-t));
%    hold on
%    plot(t,xx)

end
function xx=getx(xk0,h,f)
   x1=xk0+h*f(xk0);
   error=1;
   xk=x1;
   while (error>10^(-10))
       xkk=xk;
       xk=xk0+h*f((xk0+xk)/2);
       error=abs(xk-xkk);
   end;
   xx=xk;
end



      