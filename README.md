# CubicSpline
Cubic Spline Function in MATLAB

You can use this function to create a cubic spline graph. It works in all dimensions, but it needs some improvements because you may face with discontinuities in the resulting graph. 

For the parameters, there are 3 of them. First one is "value". You need to create an array which stores the output data points that you want to fit. Second one is "time". It's basically the time variable, but you can use some other variable instead of it. Third and last one is "number_of_data": It tells you how many data points that you have in order to create this graph. Thats is for using this function, enjoy it!



# QUICK OVERVİEW ABOUT ALGORITHM BEHIND IT
When I build this code, I have used the algorithm that is given in the course which is:

![](CubicSpline.png)

The equation above is used for calculating (n-1) number of splines. In the code, I’ve followed the steps as in the formula and put them in a matrix and finally found the splines.

Note: a(i) = 2*(h(i+1)+h(i)),   h(i) = time(i+1)-time(i)
