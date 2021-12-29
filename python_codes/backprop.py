# https://colab.research.google.com/drive/1casyYUSZQ1xCIoBlDVeAaJz0NvIbTUc2#scrollTo=q5bYsrKHWF8K
# https://www.youtube.com/watch?v=7qYtIveJ6hU
# Back propagation algorithm python example code

import numpy as np

x_data = np.array(([0.2, 0.9], [0.1, 0.5], [0.3, 0.6]), dtype=float)
y_data = np.array(([0.92, 0.92], [0.86, 0.86], [0.89, 0.15]), dtype=float)


class NeuralNetwork(object):

    def __init__(self):
        # parameters
        self.inputSize = 2
        self.hiddenSize = 3
        self.outputSize = 2

        # weights
        # self.w1 = np.random.randn(self.inputSize, self.hiddenSize)  # (2x3) weight matrix from input to hidden layer
        # self.w2 = np.random.randn(self.hiddenSize, self.outputSize)  # (3x2) weight matrix from hidden to output layer
        self.w1 = np.array([[0.1, 0.1, 0.1], [0.2, 0.2, 0.2]])
        self.w2 = np.array([[0.3, 0.3], [0.2, 0.2], [0.3, 0.3]])
        print(" ")

    def feed_forward(self, x):
        # forward propagation through the network
        self.z1_inp = np.dot(x, self.w1)  # dot product of X (input) and first set of weights (3x2)
        self.z1_out = self.sigmoid(self.z1_inp)  # activation function
        self.z2_inp = np.dot(self.z1_out, self.w2)  # dot product of hidden layer (z2) and second set of weights (3x1)
        z2_out = self.sigmoid(self.z2_inp)
        return z2_out

    def sigmoid(self, s, deriv=False):
        if (deriv == True):
            return s * (1 - s)
        return 1 / (1 + np.exp(-s))

    def backward(self, x, y, z2_out):
        # backward propagate through the network
        self.z2_error = y - z2_out  # error in output
        self.z2_delta = self.z2_error * self.sigmoid(z2_out, deriv=True)

        self.z1_error = self.z2_delta.dot(self.w2.T)
        self.z1_delta = self.z1_error * self.sigmoid(self.z1_out, deriv=True)

        self.w1 += x.T.dot(self.z1_delta)  # adjusting first set (input -> hidden) weights
        self.w2 += self.z1_out.T.dot(self.z2_delta)  # adjusting second set (hidden -> output) weights

    def train(self, x, y):
        z2_out = self.feed_forward(x)
        self.backward(x, y, z2_out)


NN = NeuralNetwork()

for i in range(200000):  # trains the NN 1000 times

    if (i % 100 == 0):
        print("Loss: " + str(np.mean(np.square(y_data - NN.feed_forward(x_data)))))
    NN.train(x_data, y_data)

print("Input: " + str(x_data))
print("Actual Output: " + str(y_data))
print("Loss: " + str(np.mean(np.square(y_data - NN.feed_forward(x_data)))))
print("\n")
print("Predicted Output: " + str(NN.feed_forward(x_data)))
