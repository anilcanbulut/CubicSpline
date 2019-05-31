function out = CubicSpline(value,time,number_of_data)
%value is X or Y variables
% x = [0 1 1.5 2 3 5 6 8 10];
% time = [0 5 7 10 15 20 25 30 35];
% Assume that second derivative of first and last splines are equal to zero

hh = zeros();
aa = zeros();
bb = zeros();
hh(1) = time(2)-time(1);

for i = 2:length(time)-2
    hh(i)=(time(i+1)-time(i));
end
hh(i+1) = time(number_of_data)-time(number_of_data-1);
aa(1) = 2*(hh(2)+hh(1));

for i = 2:length(time)-2
    aa(i) = 2*(hh(i+1)+hh(i));
end

for i = 1:length(time)-2
    bb(i) = 6*((value(i+2)-value(i+1))/(time(i+2)-time(i+1))-(value(i+1)-value(i))/(time(i+1)-time(i)));
end

matrix1 = zeros(number_of_data-2,number_of_data-2);

for i = 1:(number_of_data-2)
    for j = 1:(number_of_data-2)
        if(i==j)
            matrix1(i,j) = aa(i);
            if(i==(number_of_data-2))
                break;
            end
            
            matrix1(i+1,j) = hh(i+1);
            matrix1(i,j+1) = hh(i+1);
        end
        
    end
end

DDspline = zeros((number_of_data),1);
DDspline(1) = 0;
DDspline(number_of_data-2) = 0;
result = inv(matrix1)*bb';

for i = 1:(number_of_data-2)
    DDspline(i+1)=result(i);
end

splines = cell(number_of_data-1,1);
syms x;

for i = 1:(number_of_data-1)
  splines{i,1} = ((DDspline(i)*(time(i+1)-time(i)).^3)/(6*(time(i+1)-time(i))) + (DDspline(i+1)*(x-time(i)).^3)/(6*(time(i+1)-time(i))) + ((value(i)/(time(i+1)-time(i)) - (DDspline(i)*(time(i+1)-time(i)))/6))*(time(i+1)-x) + ((value(i+1)/(time(i+1)-time(i)) - (DDspline(i+1)*(time(i+1)-time(i)))/6))*(x-time(i)));                
end    

% string = char(splines{3,1});
% string
for i = 1:(number_of_data-1)
    splines{i,1}
end


