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


def get_data(step):
    sql = "SELECT x1, y1, z1, x2, y2, z2, " \
          "case nr_type when 'input' then 'g'   when 'output' then 'y'   else '0.7' end as l_color," \
          "case nr_type when 'input' then '0.2' when 'output' then '0.6' else '0.1' end as width," \
          "case nr_type when 'input' then 'b'   when 'output' then 'g'   else '0.5' end as n_color " \
          "FROM route WHERE step="+str(step)
    num_rows = myCursor.execute(sql)
    records = np.array(myCursor.fetchall())
    return records


def plot_it(np_data):
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    x1 = np_data[:, 0].astype('float64')
    y1 = np_data[:, 1].astype('float64')
    z1 = np_data[:, 2].astype('float64')
    x2 = np_data[:, 3].astype('float64')
    y2 = np_data[:, 4].astype('float64')
    z2 = np_data[:, 5].astype('float64')
    cl = np_data[:, 6].tolist()
    wd = np_data[:, 7].tolist()
    cn = np_data[:, 8].tolist()
    # xn = np_data[:, 11].astype('float64')
    # yn = np_data[:, 12].astype('float64')
    # zn = np_data[:, 13].astype('float64')

    for i in range(len(x1)):
        ax.plot([x1[i], x2[i]], [y1[i], y2[i]], zs=[z1[i], z2[i]], color=cl[i], linewidth=wd[i])
    ax.scatter(x2, y2, z2, color=cn)

    # ax.plot([x1, x2], [y1, y2], zs=[z1, z2], color='g')

    ax.set_xlabel('X ')
    ax.set_ylabel('Y ')
    ax.set_zlabel('Z ')

    # mng = plt.get_current_fig_manager()
    # mng.full_screen_toggle()

    # mng = plt.get_current_fig_manager()
    # mng.resize(*mng.window.maxsize())


np_data = get_data(4)  # This i numpy array to plot
plot_it(np_data)
plt.show()
myDB.close()

