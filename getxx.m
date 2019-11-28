function xx=getx(xk0,h,f)
   x1=xk0+h*f(xk0);
   error=1;
   while (error>10^(-10))
       xk=xk0+h*f((xk0+xk)/2);
   end;
   xx=xk