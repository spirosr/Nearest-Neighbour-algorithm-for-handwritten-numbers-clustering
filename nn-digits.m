load digits.mat

x=learn.P;
xcat=learn.T;

y=test.P;
ycat=test.T;

k=21;

min=ones(k,size(ycat,2));
category = ones(size(ycat));
tempcat = ones(k,size(ycat,2));
N=size(y,2);

for j=1:N

    
    
min(:,j) = 64;
category(j) = 0;

    for i = 1:3823
         distance = 64 - sum(x(:,i) == y(:,j));
         [m,index]=max(min(:,j));
        if  distance < min(index,j)
            min(index,j)=distance;
            tempcat(index,j) = xcat(i);
        end
    end
    category(j) = mode(tempcat(:,j));
end

success = 100*(sum(ycat == category ))/N
