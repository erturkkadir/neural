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
    sql = "SELECT * from weight "

          # "and n.nr_x=3 and n.nr_y=3 and n.nr_z=3"
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
    cl = np_data[:, 8].tolist()
    wd = np_data[:, 9].tolist()
    cn = np_data[:, 10].tolist()
    xn = np_data[:, 11].astype('float64')
    yn = np_data[:, 12].astype('float64')
    zn = np_data[:, 13].astype('float64')

    for i in range(len(x1)):
        ax.plot([x1[i], x2[i]], [y1[i], y2[i]], zs=[z1[i], z2[i]], color=cl[i], linewidth=wd[i])
    ax.scatter(xn, yn, zn, color=cn)
    # ax.plot([x1, x2], [y1, y2], zs=[z1, z2], color='g')

    ax.set_xlabel('X ')
    ax.set_ylabel('Y ')
    ax.set_zlabel('Z ')

    # mng = plt.get_current_fig_manager()
    # mng.full_screen_toggle()

    plt.show()
    # mng = plt.get_current_fig_manager()
    # mng.resize(*mng.window.maxsize())


np_data = get_data()  # This i numpy array to plot
myDB.close()
plot_it(np_data)
