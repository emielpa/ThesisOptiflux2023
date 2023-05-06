close all

%Reading the data
output5 = xlsread('step 5-23 model.xlsx', "Blad1",'B2342:B25357'); %2342
input5 = xlsread('step 5-23 model.xlsx',"Blad1",'C2342:C25357');
output12DCA = xlsread('step 12 model - DCA.xlsx', "Stijgen",'B1110:B28152');
input12DCA = xlsread('step 12 model - DCA.xlsx',"Stijgen",'C1110:C28152');

Wn = 0.000324; %Cut off frequency
[numBut,denBut] = butter(1,Wn);
Hbut = tf(numBut,denBut);
But5 = filter(numBut,denBut,output5, output5(1));
But12DCA = filter(numBut,denBut,output12DCA, output12DCA(1));


% Transfer function, estimated with system identification
numHdelay =[-0.007544042047471,2.595302569095177e-06,1.832213521767919e-11,1.014317004982000e-16];
denumHdelay = [1,2.503020156799391e-06,3.859257580372251e-11,1.000663440597923e-17];
Hdelay = tf(numHdelay,denumHdelay,'InputDelay',7860)

data12 = iddata(But12DCA,input12DCA,60); 
data5 = iddata(But5,input5,60);

%MExcluding the minimum phase pole
P = pole(Hdelay);
Z = zero(Hdelay);
Z(1) = [];
Hadj = zpk(Z,P,1); %Adjusting the DCgain
Dad = dcgain(Hadj);
D = dcgain(Hdelay);
Hadj = zpk(Z,P,D/Dad);
[numAdjZdelay, denAdjZdelay] = tfdata(Hadj);
Hadj = tf(numAdjZdelay,denAdjZdelay,'InputDelay',7860);

%Checking if both transferfunctions give the same repons, to the same input
figure(1)
t = linspace(0,2e6,length(input12DCA));
plot(t,output12DCA)
hold on
plot(t,input12DCA)
hold on
plot(t,lsim(Hadj, input12DCA+1,t)+output12DCA(1)) %We modelled deltaT, so we have to remove the offset on Tset aswell
hold on
plot(t,lsim(Hdelay, input12DCA+1,t)+output12DCA(1))
legend("Fruit temperature 16/12", "Set temperature 16/12","H", "H RHP")
grid on
title("Response of transferfunctions to input 16/12/2022 - 09/01/2023")
xlabel("Time [min]")
ylabel("Temperature [°C]")
hold off

figure(2)
pzmap(Hdelay)
hold on
pzmap(Hadj)
legend("H RHP", "H")
grid on
hold off

figure(3)
step(Hdelay)
hold on
step(Hadj)
legend("H RHP", "H")
grid on
hold off

figure(4)
bode(Hdelay)
hold on
bode(Hadj)
grid on
legend("H RHP", "H")
hold off

%Checking if we need a filter for the I action
n = 2;
butIntLijst = [];
ruwIntLijst = [];
butInt = 0;
ruwInt = 0;
while n ~= length(output12DCA)
    butvalue = (((But12DCA(n)+1)+(But12DCA(n-1)+1))/2)*1;
    ruwvalue = (((output12DCA(n)+1)+(output12DCA(n-1)+1))/2)*1;
    butInt = butInt + butvalue;
    ruwInt = ruwInt +ruwvalue;
    butIntLijst = [butIntLijst butInt];
    ruwIntLijst = [ruwIntLijst ruwInt];
    n = n+1;
end

figure(5)
plot(ruwIntLijst)
hold on
plot(butIntLijst)
grid()
legend("Raw integral", "Filterd integral")
title("16/12/2022 - 09/01/2023 integral of raw signal vs filtered signal")
ylabel("Integral")
xlabel("Time[min]")
hold off
DifferenceBetweenIntegral = ((butIntLijst(end)-ruwIntLijst(end))/butIntLijst(end))*100







