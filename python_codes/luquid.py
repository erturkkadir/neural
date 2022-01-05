# https://colab.research.google.com/drive/1IvVXVSC7zZPo5w-PfL3mk1MC3PIPw7Vs?usp=sharing#scrollTo=5RPJRM1IxHVY
# https://github.com/mlech26l/keras-ncp/blob/master/reproducibility/README.md

import numpy as np
import os
from tensorflow import keras
from kerasncp import wirings
from kerasncp.tf import LTCCell
import matplotlib.pyplot as plt
import seaborn as sns


N = 48  # Length of the time-series # Input feature is a sine and a cosine wave
data_x = np.stack(
    [np.sin(np.linspace(0, 3 * np.pi, N)), np.cos(np.linspace(0, 3 * np.pi, N))], axis=1
)
data_x = np.expand_dims(data_x, axis=0).astype(np.float32)  # Add batch dimension # Target output is a sine with double the frequency of the input signal
data_y = np.cos(np.linspace(0, 6 * np.pi, N)).reshape([1, N, 1]).astype(np.float32)
print("data_x.shape: ", str(data_x.shape))
print("data_y.shape: ", str(data_y.shape))

# Let's visualize the training data
sns.set()
plt.figure(figsize=(18, 16))
plt.plot(data_x[0, :, 0], label="Input feature 1")
plt.plot(data_x[0, :, 1], label="Input feature 2")
plt.plot(data_y[0, :, 0], label="Target output")
plt.ylim((-1, 1))
plt.title("Training data")
plt.legend(loc="upper right")
plt.show()


fc_wiring = wirings.FullyConnected(8, 1)  # 8 units, 1 of which is a motor neuron
ltc_cell = LTCCell(fc_wiring)

model = keras.models.Sequential(
    [
        keras.layers.InputLayer(input_shape=(None, 2)),
        keras.layers.RNN(ltc_cell, return_sequences=True),
    ]
)
model.compile(
    optimizer=keras.optimizers.Adam(0.01), loss='mean_squared_error'
)

model.summary()

sns.set_style("white")
plt.figure(figsize=(6, 4))
legend_handles = ltc_cell.draw_graph(draw_labels=True)
plt.legend(handles=legend_handles, loc="upper center", bbox_to_anchor=(1, 1))
sns.despine(left=True, bottom=True)
plt.tight_layout()
plt.show()

hist = model.fit(x=data_x, y=data_y, batch_size=1, epochs=400,verbose=1)

sns.set()
plt.figure(figsize=(16, 14))
plt.plot(hist.history["loss"], label="Training loss")
plt.legend(loc="upper right")
plt.xlabel("Training steps")
plt.show()

# How does the trained model now fit to the sinusoidal function?
prediction = model(data_x).numpy()
plt.figure(figsize=(16, 14))
plt.plot(data_y[0, :, 0], label="Target output")
plt.plot(prediction[0, :, 0], label="LTC output",linestyle="dashed")
plt.ylim((-1, 1))
plt.legend(loc="upper right")
plt.title("After training")
plt.show()
dx = np.array([[
    [-0.99498, -0.1],
    [-0.99498,  0.1],
    [-0.95510, 0.29628]

]])
pr = model(dx).numpy()
print("Result : " + pr)   # 0.10010




