   h0=0.01;
   edl=10;
   ed2=10;
   hh(edl)=(1/2)^(ed2)*h0;
   cal{edl}=ttwodi(hh(edl));
   %errlog(edl)=1;
   for ll=1:(edl-1)
       ll
       hh(ll)=(1/2)^(ll)*h0;
       cal{ll}=ttwodi(hh(ll));
       err(ll)=norm((cal{ll}-cal{edl}))
       %err(ll)=norm((cal{ll}-cal{edl}),2)
       errlog(ll)=log(err(ll));
   end
   loghh=log(hh);
   loghh(edl)=[];
   plot(loghh,errlog);
%plot(hh,err);
   %legend('对h的')
   xdraw=-12:0.1:-5;
   ydraw=2.*xdraw;
   hold on 
   plot(xdraw,ydraw)
   legend('对h的','参考线')   

function cal=ttwodi(h)
   %x0=0.5;
 %  syms fx;
%   f=@(fx)fx.*(1-fx);
   h;
   ed=3;
   st=1
 %  t=st:h:ed;
   c=fix((ed-st)/h); 
   x{1}=[1;1]
   for i=1:c
       x{i+1}=getx(x{i},h);
   end;
   cal=x{c+1};
   %xx=1./(1+exp(-t));
   %err=abs(x(c+1)-xx(c+1))
   
 %    plot(t,x)
%    xx=1./(1+exp(-t));
%    hold on
%    plot(t,xx)

end
function xx=getx(xk0,h)
   xk0;
   x1=xk0+h.*f(xk0);
   error=1;
   xk=x1;
   while (error>10^(-15))
       xkk=xk;
       xk=xk0+h*f((xk0+xk)./2);
       error=norm(xk-xkk);
   end;
   xx=xk;
end
function y=f(x)
   x;
   y(1,1)=x(1,1)+x(2,1);
   y(2,1)=x(2,1);
end



      