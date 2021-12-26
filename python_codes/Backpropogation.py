# https://colab.research.google.com/drive/1casyYUSZQ1xCIoBlDVeAaJz0NvIbTUc2#scrollTo=q5bYsrKHWF8K
# https://www.youtube.com/watch?v=7qYtIveJ6hU

import numpy as np

x = np.array(([2, 9], [1,5], [3,6]), dtype=float)
y = np.array(([92], [86], [89]), dtype=float) 
x = x / np.amax(X, axis=0)
y = y/100


class NeuralNetwork():
  def __init__(self):
      self.inputSize = 2
      self.outputSize = 1
      self.hiddenSize = 3;
      self.w1 = np.random.randn(self.inputSize, self.hiddenSize)      # 3x2 input to hidden layer
      self.w2 = np.random.randn(self.hiddenSize, self.outputSize)   # 1x3 input to hidden layer

  def feedForward(self, x):
    self.z = np.dot(X, self.w1)
    self.z2 = self.sigmoid(self.z)
    self.z3 = np.dot(self.z2, self.w2)
    output = self.sigmoid(self.z3)
    return output

  def sigmoid(self, s, derive=False):
    if(derive == True):
      return s * (1-s) 
    return 1/(1+np.exp(-s))  

  def backward(self, x, y, output):
    self.output_error = y - output    
    self.output_delta = self.output_error * self.sigmoid(output, derive=True)

    self.z2_error = self.output_delta.dot(self.w2.T) # z2 error how much our hidden layer weights contribute to output error 
    self.z2_delta = self.z2_error * self.sigmoid(self.z2, derive=True) # apply derive of sigmoid to z2 error

    self.w1 += x.T.dot(self.z2_delta) # adjusting first set (input --> hidden) layer weights
    self.w2 += self.z2.T.dot(self.output_delta)  # adjusting second set (hidden --> output) layer weights

  def train(self, x, y):
    output = self.feedForward(x)
    self.backward (x, y, output)
	
	
	
NN = NeuralNetwork()

for i in range(1000): # train the network 1000 times
  NN.train(x,y)

print("Predicted :" + str(NN.feedForward(x)))	