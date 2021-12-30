import mysql.connector
import numpy as np
import matplotlib.pyplot as plt


myDB = mysql.connector.connect(
  host="192.168.1.166",
  user="kadir",
  password="kadir_erturk",
  database="neural"
)
myCursor = myDB.cursor()


def get_data():
    sql = "SELECT we_fromx, we_fromy, we_fromz, we_tox, we_toy, we_toz, " \
          "we_real, we_imag, " \
          "case we_fromx when 0 then 'r' else '0.9' end as color " \
          "FROM weight WHERE 1"
    num_rows = myCursor.execute(sql)
    records = np.array(myCursor.fetchall())
    return records


def plot_it(np_data):
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    x1 = np_data[:, 0].astype('float64')
    x2 = np_data[:, 3].astype('float64')
    y1 = np_data[:, 1].astype('float64')
    y2 = np_data[:, 4].astype('float64')
    z1 = np_data[:, 2].astype('float64')
    z2 = np_data[:, 5].astype('float64')
    cl = np_data[:, 8]

    for i in range(len(x1)):
        ax.plot([x1[i], x2[i]], [y1[i], y2[i]], zs=[z1[i], z2[i]], color=cl[i])

    ax.set_xlabel('X ')
    ax.set_ylabel('Y ')
    ax.set_zlabel('Z ')

    plt.show()


np_data = get_data() # This i numpy array to plot
myDB.close()
plot_it(np_data)

