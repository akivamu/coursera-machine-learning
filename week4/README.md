# Neural network

For non-linear hypothesis, number of features are too big, calculation is slow.  
=> Neural network: the idea to split into layers, mimic brain.


## Model represention

Simplified model representation with 1 hidden layer:  
![](model-1-hidden-layer.png)  
Here we see 3 layers:  
  - Layer 1: input nodes  
  - Layer 2: hidden layer  
  - Layer 3: output  

![](layer-denote.png)  

Detail activations:  
![](activation-detail.png)  
First 3 rows describe layer 2.  
4th rows describe layer 3 (our ouput).  

To transform from layer j to layer j+1, the parameter (weight) matrix should be:  
![](parameter-dimension.png)  
s<sub>j+1</sub> rows and s<sub>j</sub> + 1 columns  

## Vectorization

Generalize by `z`:  
![](vectorization-activation.png)  

Input layer `x` can be seemed as layer 1, denoted by a<sup>1</sup>  
![](input-activation.png)  

Then we got final hypothesis  
![](hypothesis.png)  