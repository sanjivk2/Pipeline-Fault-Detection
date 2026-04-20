function [f] = abc_fitness(eB,oB )
%ABC_FITNESS Summary of this function goes here
%   Detailed explanation goes here
f=0;
f1=1/((eB(1)+eB(2)));
f2=1/(oB(1)+oB(2));
f3=f2-((1/(oB(1)+oB(2))))*.40;
if f1<f3
   f=1; 
end

end

