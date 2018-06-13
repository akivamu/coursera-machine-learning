# Week 6 - Advice for Applying Machine Learning

## Finding a Hypothesis

When building model, some choices:

- Getting more training examples
- Trying smaller sets of features
- Trying additional features
- Trying polynomial features
- Increasing or decreasing λ

## Evaluating a Hypothesis

The idea is split training dataset into: training set AND test set:

- Training set is used for training, to find a model.
- Test set is used for evaluating that model.

Compare the error in test set and training set, we can see if the model is overfiting, underfitting or just right.

### For deciding polynomial degree

We can further split training dataset into 3 sets:

- Training set: to train difference degree models
- Validation set: to choose best degree
- Test set: to evaluate

## Bias - Variance

### High Bias: Underfitting

`J_training` is high  
`J_validation` is high  

### High Variance: Overfitting

`J_training` is low (best fit to training set)  
`J_validation` is high (bad fit to new input)  

### Add regularization

Large `lamdba` (more regularization) -> High bias - Underfitting  
Small `lamdba` (less regularization) -> High variance - Overfitting  

## Troubleshooting

To fix High bias:

- Add more features
- Higher polynomial degree
- Lower `lambda`

To fix High variance:

- Remove some features
- Lower polynomial degree or Add more training data
- Higher `lambda`

## Screwed classes

A class that is rare. Like 1 person has cancer over 100 persons.

So a model with constant output `h(x) = 0` will result 99% accurary. Use evaluating method as before will result very small error, which is not true.

We need to a better way to evaluate: Precision/Recall.

Precision: For all predictions of `h = 1`, how many of that is correct?  
Recall: For all examples of `y = 1`, how many of that is predicted correct?  

### Tradeoff

Higher Precision, Lower Recall  

Higher Precision: increase threshold to detect as 1.  
=> Avoid too much false predict as 1.

Higher Recall: lower threshold to detect as 0.  
=> Avoid too much missing predict as 1.

### Choosing Precision/Recall

F1 score: `2 * PR / (P + R)`
