function out = N_0(x)
%N_0 Function from slide 17 of Non-linear Control Lecture slides
%   Also found in Analogue and Digital Control (Nguyen) lecture notes, 
%   page 163/175. Used for non-linear analysis of control systems. 
if size(x) == [1,1]
    out = (2/pi)*(asin(1/x)+(1/x)*cos(asin(1/x)));
else
    out = (2/pi).*(asin(1./x)+(1./x).*cos(asin(1./x)));
end
