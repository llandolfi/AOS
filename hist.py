import matplotlib
import matplotlib.pyplot as plt
import numpy as np
from numpy import genfromtxt
import sys


def dividelatencies(latencies, events):

	retdict = {}
	old = 0
	new = 1

	for i in range(1,len(events)):
			while latencies[new,1] > latencies[old,1]:
				new = new + 1
			else:
				retdict[events[i][0]] = new
				old = new
				new = new +1

	return retdict

def iter2time(period, iteration):
	#time = iteration / period/1000000
	time = iteration * period/1000000.0

	return time

def time2iter(period, time):
	pseconds = float(1000000)/period
	return time * pseconds



if __name__ == "__main__": 

	if sys.argv[1] == None:
		print("Specify input file")
		exit(-1)

	if sys.argv[2] == None:
		print("Specify events file")
		exit(-1)

	latencies = genfromtxt(sys.argv[1], delimiter=':')

	period = 100.0

	if sys.argv[3] != None:
		period = float(sys.argv[3])

	with open(sys.argv[2]) as fe:
		content = fe.readlines()
	events = [x.strip().split() for x in content]

	#print events
	start_epoch = int(events[0][1])
	events[0][1] = '0'

	#t = np.arange(0.1,latencies.shape[0]/10,0.1)
	x = np.arange(0,latencies.shape[0],1)
	t = [iter2time(float(period),float(e)) for e in x]

	s = latencies[:,2]

	ptext = max(s)/1.5


	for i,key in enumerate(events):
		print key
		if i < len(events)-1:
			cur_lat = s[int(time2iter(period,int(key[1]))):int(time2iter(period,int(events[i+1][1])))]
			#print cur_lat
			c_max = cur_lat.max()
			c_min = cur_lat.min()
			c_avg = np.average(cur_lat)
			c_dev = np.std(cur_lat)

			print c_max, c_avg, c_dev
		else:
			cur_lat = s[int(time2iter(period,int(key[1]))):s.shape[0]]
			#print cur_lat
			c_max = cur_lat.max()
			c_min = cur_lat.min()
			c_avg = np.average(cur_lat)
			c_dev = np.std(cur_lat)

			print c_max, c_avg, c_dev

