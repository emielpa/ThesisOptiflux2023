close all

%Reading the data
output5 = xlsread('step 5-23 model.xlsx', "Blad1",'B2342:B25357'); %2342
input5 = xlsread('step 5-23 model.xlsx',"Blad1",'C2342:C25357');
output12 = xlsread('step 12 model.xlsx', "Stijgen",'B1110:B35192'); %1110, 35192
input12 = xlsread('step 12 model.xlsx',"Stijgen",'C1110:C35192');
%Reading the data minus the DCA jumps
output12DCA = xlsread('step 12 model - DCA.xlsx', "Stijgen",'B1110:B28152');
input12DCA = xlsread('step 12 model - DCA.xlsx',"Stijgen",'C1110:C28152');

%Moving Avearge
MA1 = 15;
MA2 = 60;
output5MA15 = movmean(output5,[MA1 0], "Endpoints","discard");
output5MA60= movmean(output5,[MA2 0], "Endpoints","discard");
output12MA15 = movmean(output12,[MA1 0],"Endpoints","discard");
output12MA60 = movmean(output12,[MA2 0],"Endpoints","discard");
output12MA15DCA = movmean(output12DCA,[MA1 0],"Endpoints","discard");
output12MA60DCA = movmean(output12DCA,[MA2 0],"Endpoints","discard");

%Moving up the moving avearage
teller = 0;
 while teller < MA1
     teller = teller + 1;
     output5MA15 = [output5MA15(1); output5MA15];
     output12MA15 = [output12MA15(1); output12MA15];
     output12MA15DCA = [output12MA15DCA(1); output12MA15DCA];
 end
teller = 0;
  while teller < MA2;
     teller = teller + 1;
     output5MA60 = [output5MA60(1); output5MA60];
     output12MA60 = [output12MA60(1); output12MA60];
     output12MA60DCA = [output12MA60DCA(1); output12MA60DCA];
  end

%Removing the offset we are modelling deltaT/deltaS
output5MA60off = output5MA60-output5MA60(1);
output12MA60off = output12MA60-output12MA60(1);
output12MA60offDCA = output12MA60DCA-output12MA60DCA(1);

input5off = input5-input5(1);
input12off = input12-input12(1);
input12offDCA = input12DCA-input12DCA(1);

%Determining the cutoff frequency for the butter filter
Fs = 1/60;
Y = fft(output5);
L = length(output5);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

figure(1)
plot(f,P1) 
title("FFT analysis of 6/10/2022 - 23/10/2022")
xlabel("f (Hz)")
ylabel("Power")

%Butter filter
Wn = 0.000324;
[numBut,denBut] = butter(1,Wn);
Hbut = tf(numBut,denBut);
But5 = filter(numBut,denBut,output5, output5(1));
But12DCA = filter(numBut,denBut,output12DCA, output12DCA(1));

%output 5
figure(2)
plot(output5)
hold on
plot(output5MA15)
hold on
plot(output5MA60)
hold on
plot(input5)
%plot(But5)
title("6/10/2022 - 23/10/2022 with moving average")
xlabel("Time [minutes]")
ylabel("Temperature [°C]")
hold off
legend("Fruit temperature","MA 15","MA 60", "Set temperature")

%output5 without offset
output5off60 = output5MA60(1);
figure(3)
plot(output5MA60)
hold on
plot(output5MA60-output5off60)
hold on
plot(input5)
hold on
plot(input5-input5(1))
hold on
plot(But5-But5(1))
legend("out normale", "out-offset","in normale", "in-offset","Butt out - offset")
title("output5 MA's offset")
hold off

%output 12
figure(4)
plot(output12)
hold on
plot(output12MA15)
hold on
plot(output12MA60)
hold on
plot(input12)
%plot(But12DCA)
title("16/12/2022 - 09/01/2023 with moving average")
xlabel("Time [minutes]")
ylabel("Temperature [°C]")
legend("Fruit temperature","MA 15","MA 60", "Set temperature")
hold off

%output 12 without
output12off60 = output12MA60(1);
figure(5)
plot(output12MA60)
hold on
plot(output12MA60-output12off60)
hold on
plot(input12)
hold on
plot(input12-input12(1))
hold on
plot(But12DCA-But12DCA(12))
legend("out normale", "out-offset","in normale", "in-offset", "Butt - offset")
title("output12 MA's offset")
hold off

%12 without DCA jumps
figure(6)
plot(output12MA60)
hold on
plot(output12MA60DCA)
hold on
plot(output12MA60off)
hold on
plot(output12MA60offDCA)
legend("12", "12DCA", "12off", "12DCAoff")
title("Met DCA weggenomen")
hold off

But5 = But5 - But5(1);
input5(end) = [];

But12DCA = But12DCA - But12DCA(1);
input12off(end) = [];

%Result of system identification
numHdelay =[-0.007544042047471,2.595302569095177e-06,1.832213521767919e-11,1.014317004982000e-16];
denumHdelay = [1,2.503020156799391e-06,3.859257580372251e-11,1.000663440597923e-17];
Hdelay = tf(numHdelay,denumHdelay,'InputDelay',7860)
%Time delay of 7860s = 2u11min --> seems okay

figure(7)
plot(output5)
hold on
plot(input5)
hold off
grid on
title("Fruit- and set temperature of 6/10/2022 - 23/10/2022")
xlabel("Time [minutes]")
ylabel("Temperature [°C]")
legend("Fruit temperature", "Set temperature")

figure(8)
plot(output12)
hold on
plot(input12)
hold off
grid on
title("Fruit- and set temperature of 16/12/2022 - 09/01/2023")
xlabel("Time [minutes]")
ylabel("Temperature [°C]")
legend("Fruit temperature", "Set temperature")

figure(9)
plot(output12DCA)
hold on
plot(output12MA15DCA)
hold on
plot(output12MA60DCA)
hold on
plot(input12DCA)
legend("Fruit temperature DCA removed", "MA 15 DCA removed", "MA 60 DCA removed", "Set temperature")
title("16/12/2022 - 09/01/2023 with DCA removed")
xlabel("Time [minutes]")
ylabel("Temperature [°C]")
hold off

