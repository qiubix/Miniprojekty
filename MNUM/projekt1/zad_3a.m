function x = zad_3(wer)
if (wer==0),
  A=[14, -1, -3, 5; 1, -7, -4, -1; 2, -4, -12, -1; 1, -1, 6, -16];
  b=[1;0;-10;-2];
else
  C=data12(4,wer)
  A=C(1:4,1:4);
  b=C(:,5);
end
y=[0 0 0 0]
for k = 1:4
    for i=1:4
        s=b(i);
        for j =1:i-1
            s=s-A(i,j)*y(j);
        end
        for j = i+1:n
            s=s-A(i,j)*y(j);
        end
        x(i)=s/A(i,i);
        x(i)=x(k);
    end
    y = x'
end
return
