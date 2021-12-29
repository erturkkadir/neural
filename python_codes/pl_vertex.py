from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection


P1 = [0,0,0]
P2 = [0,1,0]
P3 = [1,0,1]
P4 = [0,1,1]
P5 = [1,1,1]
P6 = [1,1,0]
P7 = [1,0,0]
P8 = [0,0,1]


fig = plt.figure()
ax = fig.add_subplot(projection='3d')
vertices = [zip(P1, P2, P3, P4, P5, P6, P7, P8)]
ax.add_collection3d(Poly3DCollection(vertices), facecolor='w', alpha=0.5)
plt.show()