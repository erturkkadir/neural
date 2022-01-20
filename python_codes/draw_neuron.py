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


def get_data():
    sql = "SELECT nr_x, nr_y, nr_z, " \
          "case nr_type when 'hidden' then '*' when 'input' then 'o' when 'output' then 'v' end as nr_type, " \
          "case nr_type when 'hidden' then 'b' when 'input' then 'r' when 'output' then 'g' end as nr_type " \
          "FROM neuron WHERE nr_status = 1"
    num_rows = myCursor.execute(sql)
    records = np.array(myCursor.fetchall())
    return records


def plot_it(np_data):
    fig = plt.figure()
    ax = fig.add_subplot(projection='3d')
    x = np_data[:, 0].astype('float64')
    y = np_data[:, 1].astype('float64')
    z = np_data[:, 2].astype('float64')
    l = np_data[:, 3].tolist()
    c = np_data[:, 4].tolist()

    ax.scatter(x, y, z, color=c)

    ax.set_xlabel('X ')
    ax.set_ylabel('Y ')
    ax.set_zlabel('Z ')


def forward():
    args = [0]
    myCursor.callproc('forward', args)


for x in range(30):
    np_data = get_data()  # This i numpy array to plot
    plot_it(np_data)
    # plt.show()
    fname = "./im" + str(x) + ".jpg"
    plt.title("t = " + str(x))
    plt.show()
    plt.savefig(fname)
    forward()
# animator = ani.FuncAnimation(fig, get_data(), interval=100)
myDB.close()
