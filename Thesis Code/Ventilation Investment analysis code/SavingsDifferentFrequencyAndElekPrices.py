import matplotlib.pyplot as plt
import numpy as np
frequentie = [50,45,40,35,30,25,20,15,10]
savings36 = np.array([0,533.70,1387.42,1989.41,2120.62,2600.03,2931.78,3181.75,3528.68])
savings45 = (savings36/0.36)*0.45
savings54 = (savings36/0.36)*0.54
savings27 = (savings36/0.36)*0.27

graph, (plot2) = plt.subplots(1, 1)
plot2.plot(frequentie, savings27, label = "0,27 €/kWh")
plot2.plot(frequentie, savings36, label = "0,36 €/kWh")
plot2.plot(frequentie, savings45, label = "0,45 €/kWh")
plot2.plot(frequentie, savings54, label = "0,54 €/kWh")
plot2.set_title("Yearly savings with variable frequency and different electricity prices")
plot2.invert_xaxis()
plot2.set_xlabel("Frequency [Hz]")
plot2.set_ylabel("Yearly savings [€]")

 
# display the graph
graph.tight_layout()
plt.grid()
plt.legend()
plt.show()
