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
          "case nr_type when 'hidden' then '*' when 'input' then 'o' when 'output' then 'v' end as nr_type1, " \
          "sqrt(nr_outr * nr_outr + nr_outi * nr_outi) as nr_type2 " \
          "FROM neuron WHERE nr_status = 1"
    myCursor.execute(sql)
    t_data = np.array(myCursor.fetchall())
    n_recs = myCursor.rowcount
    if n_recs > 0:
        x1 = t_data[:, 0].astype('int64')
        y1 = t_data[:, 1].astype('int64')
        z1 = t_data[:, 2].astype('int64')
        a1 = t_data[:, 3].tolist()
        c1 = t_data[:, 4].astype('float64')
    else:
        x1 = []
        y1 = []
        z1 = []
        a1 = []
        c1 = []
        x1.append(0)
        y1.append(0)
        z1.append(0)
        a1.append('*')
        c1.append('r')

    return x1, y1, z1, a1, c1, n_recs


def forward():
    args = [0]
    myCursor.callproc('forward', args)


def update_graph(num=None):
    x2, y2, z2, a2, c2, n_rec = get_data()
    graph._offsets3d = (x2, y2, z2)
    plt.title('Time Step , ' + str(num) + " n rec " + str(n_rec))
    forward()


fig = plt.figure()
ax = fig.add_subplot(projection='3d')
ax.axes.set_xlim3d(left=0, right=39)
ax.axes.set_ylim3d(bottom=0, top=39)
ax.axes.set_zlim3d(bottom=0, top=39)

x, y, z, a, c, n_rec = get_data()
graph = ax.scatter(x, y, z, c=c)
# ax.view_init(30, 0)
for i in range(0, 360):

    plt.cla()
    plt.title('Time Step , ' + str(i) + " n rec " + str(n_rec))
    forward()
    x, y, z, a, c, n_rec = get_data()
    ax.scatter(x, y, z, c=c)
    ax.set_zlim(0, 40)
    ax.set_ylim(0, 40)
    ax.set_xlim(0, 40)
    plt.draw()
    plt.pause(1)

