close all

numHdelay =[-0.007544042047471,2.595302569095177e-06,1.832213521767919e-11,1.014317004982000e-16];
denumHdelay = [1,2.503020156799391e-06,3.859257580372251e-11,1.000663440597923e-17];
Hdelay = tf(numHdelay,denumHdelay,'InputDelay',7860)
P = pole(Hdelay);
Z = zero(Hdelay);
Z(1) = [];
Hadj = zpk(Z,P,1);
Dad = dcgain(Hadj);
D = dcgain(Hdelay);
Hadj = zpk(Z,P,D/Dad);
[numAdjdelay, denAdjdelay] = tfdata(Hadj);
Hadj = tf(numAdjdelay,denAdjdelay,'InputDelay',7860);

%Ziegler Nicholas method
K = 74.3;

figure(1)
bode(Hadj) %--> gm = 37.4dB --> 74.13 in amplitude --> trial and error Kcr = 74.3 (randstable) with Pcr = 0.03e06
hold on
bode(Hadj*K)
title("bode with K = 74.3")
grid on
hold off

figure(2)
step(feedback(Hadj*K,1))
title("Closed loop step with K = 74,3")
legend("H closed loop")
xlabel("Timeq")
ylabel("Temperature [°C]")
grid on

%ziegler nicholas --> alot of overshoot and controller sends values bigger
%than 40 --> not possible --> saturation
Kcr = 74.3;
Pcr = 0.03e06;
Kp = 0.45*Kcr
Ti = 1/1.2*Pcr
Ki = Kp/Ti;
Czieg = pid(Kp,Ki)

figure(3)
step(feedback(Hadj*Czieg,1))
legend("Fruit temperature")
title("Response Closed loop PI Ziegler-Nicholas")
xlabel("Time")
ylabel("Temperature [°C]")
grid on

figure(4) 
step(Czieg/(1+Czieg*Hadj))
legend("Set temperature")
title("Controller output PI Ziegler-Nicholas")
xlabel("Time")
ylabel("Temperature [°C]")
grid on