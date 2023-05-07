import matplotlib.pyplot as plt

frequentie = [50,45,40,35,30,25,20,15,10]
savings36 = [0,606,1592,2249,2345,2886,3235,3475,3867]
savings45 = [0, 742, 1949, 2753, 2871, 3533, 3960, 4254, 4733]
savings54 = [0,878,2305,3257,3396,4179,4685,5032,5600]
savings27 = [0, 470, 1235,1746,1820,2240,2511,2697,3001]

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

