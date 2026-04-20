clc;
clear all;
close all;
load sanjeevdata
% performing clustering %
[idx,cent]=kmeans(dataall,4) ; % dividing the data into four centroids ;
selected_records=[];
sr=0;
%total
total_hives=4;
figure(1);
for i=1:total_hives
   hive_class=i;
   f=find(idx==hive_class);
   plot3(dataall(f,1),dataall(f,2),dataall(f,3),'x');
   hold on
   plot3(cent(i,1),cent(i,2),cent(i,3),'o');
   
   xlabel('Temprature');
   ylabel('Strain');
   zlabel('Bending');
legend('C1','Cent1','C2','Cent2','C3','Cent 3','C4','Cent4')    
employed_bees=dataall(f,:);
for kd=1:numel(f)
selection_percentage=10;
food_current_employed=employed_bees(kd,:);
onlookers=round((numel(f)*selection_percentage)/100);
if onlookers==1
   onlookers=5; 
end
Levy_flight=10;
Levy_flight_decision=zeros(1,Levy_flight);
for jj=1:Levy_flight
onlooker_bees=round(rand(1,onlookers)*numel(f));
if jj==1
food_submitted_to_onlooker=food_current_employed;
else
    ft2=dataall(onlooker_bees(1)+1,1:3);
    food_submitted_to_onlooker=sqrt((food_current_employed.*ft2));
end

fitness_value=0;

fitness_value=abc_fitness(food_submitted_to_onlooker,sqrt(dataall(onlooker_bees(2)+1,1:3)));
if fitness_value==1
    
Levy_flight_decision(jj)=1;    
end
end
f1=find(Levy_flight_decision==1);
if numel(f1)>=Levy_flight/2
    try
     sr=sr+1;
    selected_records(sr)=f(kd);
    selected_index(sr)=idx(f(kd));
    selected_data(sr,1:3)=dataall(f(kd),1:3);
  
    catch
    end
end
end
end
figure(2)

for i=1:total_hives
fx1=find(selected_index==i);
    plot3(selected_data(fx1,1),selected_data(fx1,2),selected_data(fx1,3),'x');
   hold on
   plot3(cent(i,1),cent(i,2),cent(i,3),'o');
   
   xlabel('Temprature');
   ylabel('Strain');
   zlabel('Bending');
legend('C1','Cent1','C2','Cent2','C3','Cent 3','C4','Cent4')    
%plot(

end
title('Updated by ABC');
%legend('C1','Cent1','C2','Cent2','C3','Cent 3','C4','Cent4')