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
    sql = "SELECT nr_x, nr_y, nr_z, " \
          "case nr_type when 'hidden' then '*' when 'input' then 'o' when 'output' then 'v' end as nr_type, " \
          "case nr_type when 'hidden' then 'b' when 'input' then '0.8' when 'output' then '0.8' end as nr_type " \
          "FROM neuron WHERE 1"
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

    plt.show()


np_data = get_data() # This i numpy array to plot
myDB.close()
plot_it(np_data)

