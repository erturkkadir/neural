import time

import matplotlib
import mysql.connector
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as ani

myDB = mysql.connector.connect(
    host="192.168.1.166",
    user="kadir",
    password="kadir_erturk",
    database="neural"
)
myCursor = myDB.cursor()

ts = 0


def get_data():
    sql = "SELECT nr_x, nr_y, nr_z, " \
          "case nr_type when 'hidden' then '*' when 'input' then 'o' when 'output' then 'v' end as nr_type, " \
          "case nr_type when 'hidden' then 'b' when 'input' then 'r' when 'output' then 'g' end as nr_type " \
          "FROM neuron WHERE nr_status = 1"
    myCursor.execute(sql)
    t_data = np.array(myCursor.fetchall())
    x1 = t_data[:, 0].astype('float64')
    y1 = t_data[:, 1].astype('float64')
    z1 = t_data[:, 2].astype('float64')
    a1 = t_data[:, 3].tolist()
    c1 = t_data[:, 4].tolist()
    return x1, y1, z1, a1, c1


def forward():
    args = [0]
    myCursor.callproc('forward', args)


def update_graph(ts=None):
    ts = ts +1
    x, y, z, a, c = get_data()
    graph._offsets3d = (x, y, z)
    plt.title("Time step : " + str(ts))
    forward()


fig = plt.figure()
ax = fig.add_subplot(projection='3d')
ax.axes.set_xlim3d(left=0, right=11)
ax.axes.set_ylim3d(bottom=0, top=11)
ax.axes.set_zlim3d(bottom=0, top=11)
x, y, z, a, c = get_data()
graph = ax.scatter(x, y, z)
time.sleep(7)
ani = matplotlib.animation.FuncAnimation(fig, update_graph, 20, interval=600, blit=False)
plt.show()
ani.save("progress.mp4")


