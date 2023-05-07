import matplotlib.pyplot as plt

frequentie = [50,40,30,20]
savings36 = [0,1592, 2345,3235]
savings45 = [0, 1949, 2871,3960]
savings27 = [0,1235, 1820,2511]

costOneDrivePerFan = 6757.686
costMultipleFansPerDrive = 5074.914 
costDriveInstalled = 292
optiFluxSubs = [200,300,400,500,600,700,800,900,1000]

pbOneDrive3640 = []
pbMultipleFan3640 = []
pbInstalled3640 = []

pbOneDrive4540 = []
pbMultipleFan4540 = []
pbInstalled4540 = []

pbOneDrive2740 = []
pbMultipleFan2740 = []
pbInstalled2740 = []

pbOneDrive3630 = []
pbMultipleFan3630 = []
pbInstalled3630 = []

pbOneDrive4530 = []
pbMultipleFan4530 = []
pbInstalled4530 = []

pbOneDrive2730 = []
pbMultipleFan2730 = []
pbInstalled2730 = []

pbOneDrive3620 = []
pbMultipleFan3620 = []
pbInstalled3620 = []

pbOneDrive4520 = []
pbMultipleFan4520 = []
pbInstalled4520 = []

pbOneDrive2720 = []
pbMultipleFan2720 = []
pbInstalled2720 = []

for i in optiFluxSubs:
        #40Hz
        pbOneDrive3640.append(costOneDrivePerFan/(savings36[1]-i))
        pbMultipleFan3640.append(costMultipleFansPerDrive/(savings36[1]-i))
        pbInstalled3640.append(costDriveInstalled/(savings36[1]-i))
        
        pbOneDrive4540.append(costOneDrivePerFan/(savings45[1]-i))
        pbMultipleFan4540.append(costMultipleFansPerDrive/(savings45[1]-i))
        pbInstalled4540.append(costDriveInstalled/(savings45[1]-i))
        
        pbOneDrive2740.append(costOneDrivePerFan/(savings27[1]-i))
        pbMultipleFan2740.append(costMultipleFansPerDrive/(savings27[1]-i))
        pbInstalled2740.append(costDriveInstalled/(savings27[1]-i))
        
        #30Hz
        pbOneDrive3630.append(costOneDrivePerFan/(savings36[2]-i))
        pbMultipleFan3630.append(costMultipleFansPerDrive/(savings36[2]-i))
        pbInstalled3630.append(costDriveInstalled/(savings36[2]-i))
        
        pbOneDrive4530.append(costOneDrivePerFan/(savings45[2]-i))
        pbMultipleFan4530.append(costMultipleFansPerDrive/(savings45[2]-i))
        pbInstalled4530.append(costDriveInstalled/(savings45[2]-i))
        
        pbOneDrive2730.append(costOneDrivePerFan/(savings27[2]-i))
        pbMultipleFan2730.append(costMultipleFansPerDrive/(savings27[2]-i))
        pbInstalled2730.append(costDriveInstalled/(savings27[2]-i))
        
        #20Hz
        pbOneDrive3620.append(costOneDrivePerFan/(savings36[3]-i))
        pbMultipleFan3620.append(costMultipleFansPerDrive/(savings36[3]-i))
        pbInstalled3620.append(costDriveInstalled/(savings36[3]-i))
        
        pbOneDrive4520.append(costOneDrivePerFan/(savings45[3]-i))
        pbMultipleFan4520.append(costMultipleFansPerDrive/(savings45[3]-i))
        pbInstalled4520.append(costDriveInstalled/(savings45[3]-i))
        
        pbOneDrive2720.append(costOneDrivePerFan/(savings27[3]-i))
        pbMultipleFan2720.append(costMultipleFansPerDrive/(savings27[3]-i))
        pbInstalled2720.append(costDriveInstalled/(savings27[3]-i))
        
plt.figure(1)
plt.title("Payback period with respect to subscription price at 40Hz")
plt.xlabel("Yearly subscription per cold store [€]")
plt.ylabel("Payback period [years]")
plt.plot(optiFluxSubs,pbOneDrive2740, label = "1 fan/1 drive 0,27 €/kWh", color = "blue", linestyle = "solid")
plt.plot(optiFluxSubs,pbOneDrive3640, label = "1 fan/1 drive 0,36 €/kWh", color = "blue", linestyle = "dotted")
plt.plot(optiFluxSubs,pbOneDrive4540, label = "1 fan/1 drive 0,45 €/kWh", color = "blue", linestyle = "dashed")

plt.plot(optiFluxSubs,pbMultipleFan2740, label = "2 fans/1 drive 0,27 €/kWh", color = "orange", linestyle = "solid")
plt.plot(optiFluxSubs,pbMultipleFan3640, label = "2 fans/1 drive 0,36 €/kWh", color = "orange", linestyle = "dotted")
plt.plot(optiFluxSubs,pbMultipleFan4540, label = "2 fans/1 drive 0,45 €/kWh", color = "orange", linestyle = "dashed")

plt.plot(optiFluxSubs,pbInstalled2740, label = "Drive installed 0,27 €/kWh", color = "red", linestyle = "solid")
plt.plot(optiFluxSubs,pbInstalled3640, label = "Drive installed 0,36 €/kWh", color = "red", linestyle = "dotted")
plt.plot(optiFluxSubs,pbInstalled4540, label = "Drive installed 0,45 €/kWh", color = "red", linestyle = "dashed")
plt.grid()
plt.legend()

plt.figure(2)
plt.title("Payback period with respect to subscription price 30Hz")
plt.xlabel("Yearly subscription per cold store [€]")
plt.ylabel("Payback period [years]")
plt.plot(optiFluxSubs,pbOneDrive2730, label = "One drive 0,27 €/kWh", color = "blue", linestyle = "solid")
plt.plot(optiFluxSubs,pbOneDrive3630, label = "One drive 0,36 €/kWh", color = "blue", linestyle = "dotted")
plt.plot(optiFluxSubs,pbOneDrive4530, label = "One drive 0,45 €/kWh", color = "blue", linestyle = "dashed")

plt.plot(optiFluxSubs,pbMultipleFan2730, label = "Multiple fans per drive 0,27 €/kWh", color = "orange", linestyle = "solid")
plt.plot(optiFluxSubs,pbMultipleFan3630, label = "Multiple fans 0,36 €/kWh", color = "orange", linestyle = "dotted")
plt.plot(optiFluxSubs,pbMultipleFan4530, label = "Multiple fans 0,45 €/kWh", color = "orange", linestyle = "dashed")

plt.plot(optiFluxSubs,pbInstalled2730, label = "Drive Installed 0,27 €/kWh", color = "red", linestyle = "solid")
plt.plot(optiFluxSubs,pbInstalled3630, label = "Drive Installed 0,36 €/kWh", color = "red", linestyle = "dotted")
plt.plot(optiFluxSubs,pbInstalled4530, label = "Drive Installed 0,45 €/kWh", color = "red", linestyle = "dashed")
plt.grid()
plt.legend()

plt.figure(3)
plt.title("Payback period with respect to subscription price 20Hz")
plt.xlabel("Yearly subscription per cold store [€]")
plt.ylabel("Payback period [years]")
plt.plot(optiFluxSubs,pbOneDrive2720, label = "One drive 0,27 €/kWh", color = "blue", linestyle = "solid")
plt.plot(optiFluxSubs,pbOneDrive3620, label = "One drive 0,36 €/kWh", color = "blue", linestyle = "dotted")
plt.plot(optiFluxSubs,pbOneDrive4520, label = "One drive 0,45 €/kWh", color = "blue", linestyle = "dashed")

plt.plot(optiFluxSubs,pbMultipleFan2720, label = "Multiple fans per drive 0,27 €/kWh", color = "orange", linestyle = "solid")
plt.plot(optiFluxSubs,pbMultipleFan3620, label = "Multiple fans 0,36 €/kWh", color = "orange", linestyle = "dotted")
plt.plot(optiFluxSubs,pbMultipleFan4520, label = "Multiple fans 0,45 €/kWh", color = "orange", linestyle = "dashed")

plt.plot(optiFluxSubs,pbInstalled2720, label = "Drive Installed 0,27 €/kWh", color = "red", linestyle = "solid")
plt.plot(optiFluxSubs,pbInstalled3620, label = "Drive Installed 0,36 €/kWh", color = "red", linestyle = "dotted")
plt.plot(optiFluxSubs,pbInstalled4520, label = "Drive Installed 0,45 €/kWh", color = "red", linestyle = "dashed")
plt.grid()
plt.legend()

plt.show()


