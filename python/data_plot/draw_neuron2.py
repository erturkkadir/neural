import plotly.express as px
import mysql.connector
import numpy as np
import pandas as pd
import plotly.io as pio

png_renderer = pio.renderers["browser"]


# https://plotly.com/python/3d-scatter-plots/

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
          "case nr_type when 'hidden' then 'r' when 'input' then 'g' when 'output' then 'b' end as nr_type2 " \
          "FROM neuron WHERE nr_status = 1"
    myCursor.execute(sql)
    t_data = np.array(myCursor.fetchall())
    n_recs = myCursor.rowcount
    if n_recs > 0:
        x1 = t_data[:, 0].astype('int64')
        y1 = t_data[:, 1].astype('int64')
        z1 = t_data[:, 2].astype('int64')
        a1 = t_data[:, 3].tolist()
        c1 = t_data[:, 4].tolist()
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



# df = px.data.iris()

x, y, z, a, c, n_recs = get_data()
df = pd.DataFrame()
df['x_axis'] = pd.Series(x)
df['y_axis'] = pd.Series(y)
df['z_axis'] = pd.Series(z)
df['color'] = pd.Series(c)

fig = px.scatter_3d(df, x='x_axis', y='y_axis', z='z_axis', color='color')
fig.show(renderer="png", width=800, height=300)

