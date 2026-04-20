clc;
clear all;
close all;
dataall=[];
for i=1:300
    dataall(i,1)=20*rand;
    dataall(i,2)=20*rand;
    dataall(i,3)=20*rand;
end


for i=301:700
    dataall(i,1)=30*rand;
    dataall(i,2)=30*rand;
    dataall(i,3)=30*rand;
end


for i=701:1000
    dataall(i,1)=50*rand;
    dataall(i,2)=50*rand;
    dataall(i,3)=50*rand;
end

for i=1001:2000
    dataall(i,1)=70*rand;
    dataall(i,2)=70*rand;
    dataall(i,3)=70*rand;
end

save('sanjeevdata','dataall');