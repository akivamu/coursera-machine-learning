import math
import numpy
import random

def gen_circle_dataset(total_samples, outter_circle_r, outter_circle_var, inner_circle_r, fill_inner_circle = True):
    dataset = []
    for degree in range(0,360):
        x = outter_circle_r * math.cos(degree) + random.uniform(-outter_circle_var, outter_circle_var)/2
        y = outter_circle_r * math.sin(degree) + random.uniform(-outter_circle_var, outter_circle_var)/2
        dataset.append([x,y,1])

    for degree in range(0,360):
        x = inner_circle_r * math.cos(degree) + random.uniform(-outter_circle_var, outter_circle_var)/2
        y = inner_circle_r * math.sin(degree) + random.uniform(-outter_circle_var, outter_circle_var)/2
        dataset.append([x,y,0])

    return numpy.array(dataset)

dataset = gen_circle_dataset(100, 6, 1, 2)
output_file = open('circle.txt', 'w')
for x, y, label in dataset:
    print x,",",y,",",label
    output_file.write("%f,%f,%d\n" % (x,y,label))

import matplotlib.pyplot as plt
plt.figure()
plt.subplot(1, 1, 1)
plt.scatter(dataset[:,0], dataset[:,1])
plt.show()




