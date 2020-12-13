## Changelog

### v4

#### 4.0

* Max_train_samples_per_class = 1500

#### 4.1

* shuffle csv before downsampling to h5
* take same crops for inference
* Less jittering while augmentation
* Max_train_samples_per_class = 1000
* Seed numpy before generation of h5

#### 4.2

* Max_train_samples_per_class = 500

#### 4.1+ (imbalanced test set)

* allow multiple events per minute

## Results ​

SoccerNet mAP: **67,8**

----

**Batch Size**: 32
**Loss**: CrossEntropyLoss

### C3D

Dataset: sac_train_16x112x112_3fps_v2.1.hdf5
class weights: True
Optimzer: SDG
Learning Rate: 0.005
Standardized: False

```
Epoch 1/3
110/110 [==============================] - 1520s 14s/step - loss: 2931.2551 - categorical_accuracy: 0.1869 - val_loss: 4.8348 - val_categorical_accuracy: 0.3080
```

Checkpoints: `c3d_checkpoint_best.h5`

### R2+1D-18

Dataset: sac_train_16x112x112_3fps_v2.1.hdf5
class weights: False
Optimizer: Adam
Learning Rate: 0.0004 (Best)
Standardized: True

```
Epoch: 0, Training Loss: 0.06, Validation Loss: 0.05, accuracy = 0.41
Epoch: 1, Training Loss: 0.05, Validation Loss: 0.05, accuracy = 0.45
Epoch: 2, Training Loss: 0.05, Validation Loss: 0.05, accuracy = 0.51
```

Checkpoints `r2+1d_3fps.pt`

----

Dataset: sac_train_16x112x112_4fps_v2.1.hdf5
Learning Rate: 0.0005 (Best)

```
Epoch: 0, Training Loss: 0.15, Validation Loss: 0.10, accuracy = 0.05
Epoch: 1, Training Loss: 0.12, Validation Loss: 0.09, accuracy = 0.08
```

----

Dataset: sac_train_16x112x112_2fps_v2.1.hdf5
Learning Rate: 0.0001 (Best)

```
Epoch: 0, Training Loss: 0.09, Validation Loss: 0.09, accuracy = 0.10
Epoch: 1, Training Loss: 0.09, Validation Loss: 0.09, accuracy = 0.10
```

----



### SoccerNet-3

Dataset: soccer_net_3_v4_32x112x112_10fps_v4

Learning Rate: 0.001

```
Epoch 005: | Train Loss: 0.33475 | Val Loss: 0.27283 | Train Acc: 100.000| Val Acc: 100.000 | Val: 88.38951310861424% correct

Test epoch: | Test Loss: 0.25443 | Test Loss: 0.25443 | Test 86.21794871794872% correct
mAP: 91% (original Paper is )
```



### SoccerNet-4 (light)

Dataset: soccer_net_4_v4.1_32x112x112_10fps **75,62% Accuracy (81,77% mAP)**

Duration: 3

Model: R2+1D

LR: 0.0014

```
Training Results - Epoch: 1  Avg accuracy: 59.50 Avg loss: 0.84
Validation Results - Epoch: 1  Avg accuracy: 59.53 Avg loss: 0.84
Epoch [2/5]: [250/250] 100%
, batch loss=0.977 [10:34<00:00]

Training Results - Epoch: 2  Avg accuracy: 76.53 Avg loss: 0.83
Validation Results - Epoch: 2  Avg accuracy: 76.50 Avg loss: 0.83
Epoch [3/5]: [250/250] 100%
, batch loss=0.689 [10:33<00:00]

Training Results - Epoch: 3  Avg accuracy: 74.90 Avg loss: 0.79
Validation Results - Epoch: 3  Avg accuracy: 74.02 Avg loss: 0.80
Epoch [4/5]: [250/250] 100%
, batch loss=1.09 [10:33<00:00]

Training Results - Epoch: 4  Avg accuracy: 72.78 Avg loss: 0.76
Validation Results - Epoch: 4  Avg accuracy: 71.70 Avg loss: 0.77
Epoch [5/5]: [250/250] 100%
, batch loss=0.829 [10:32<00:00]

Training Results - Epoch: 5  Avg accuracy: 78.45 Avg loss: 0.76
Validation Results - Epoch: 5  Avg accuracy: 77.63 Avg loss: 0.77
Test Results - Avg accuracy: 75.62 Avg loss: 0.80  mAP: 0.76
```

Dataset: soccer_net_4_v4.1_16x112x112_5fps: **73,52% Accuracy (75,69% mAP)**

Duration 3sec

Model: R2+1D

LR: 0.01 (:warning: **too high**)

```
Training Results - Epoch: 1  Avg accuracy: 73.75 Avg loss: 0.69
Validation Results - Epoch: 1  Avg accuracy: 74.02 Avg loss: 0.70
Epoch [2/5]: [250/250] 100%
, batch loss=1.15 [22:05<00:00]

Training Results - Epoch: 2  Avg accuracy: 76.22 Avg loss: 0.62
Validation Results - Epoch: 2  Avg accuracy: 75.15 Avg loss: 0.63
Epoch [3/5]: [250/250] 100%
, batch loss=0.902 [22:05<00:00]

Training Results - Epoch: 3  Avg accuracy: 78.40 Avg loss: 0.59
Validation Results - Epoch: 3  Avg accuracy: 77.48 Avg loss: 0.61
Epoch [4/5]: [250/250] 100%
, batch loss=0.698 [22:05<00:00]

Training Results - Epoch: 4  Avg accuracy: 79.35 Avg loss: 0.56
Validation Results - Epoch: 4  Avg accuracy: 78.30 Avg loss: 0.58
Epoch [5/5]: [250/250] 100%
, batch loss=1.2 [22:06<00:00]

Training Results - Epoch: 5  Avg accuracy: 76.90 Avg loss: 0.57
Validation Results - Epoch: 5  Avg accuracy: 75.00 Avg loss: 0.60
Test Results - Avg accuracy: 73.52 Avg loss: 0.67  mAP: 0.75
```

Dataset: soccer_net_4_v4.1_32x112x112_7fps: **70,5% (86,36 mAP)**

Duration: 4,6sec

Model: R2+1D

LR: 0.08762717540258178

```
Training Results - Epoch: 1  Avg accuracy: 68.33 Avg loss: 0.79
Validation Results - Epoch: 1  Avg accuracy: 68.84 Avg loss: 0.79

Training Results - Epoch: 2  Avg accuracy: 69.15 Avg loss: 0.75
Validation Results - Epoch: 2  Avg accuracy: 69.14 Avg loss: 0.76

Training Results - Epoch: 3  Avg accuracy: 76.10 Avg loss: 0.86
Validation Results - Epoch: 3  Avg accuracy: 75.83 Avg loss: 0.86

Training Results - Epoch: 4  Avg accuracy: 75.45 Avg loss: 0.80
Validation Results - Epoch: 4  Avg accuracy: 75.53 Avg loss: 0.81

Training Results - Epoch: 5  Avg accuracy: 73.00 Avg loss: 0.91
Validation Results - Epoch: 5  Avg accuracy: 71.02 Avg loss: 0.91

Test Results - Avg accuracy: 70.50 Avg loss: 0.94  mAP: 0.77

```

Dataset: soccer_net_4_v4.1_32x112x112_10fps

Model: R2+1D**-34**

LR=0.003

```
Training Results - Epoch 0: Avg Acc: 69,76, Avg Loss: 0.83 (Validation: {'accuracy': [66.96], 'loss': [0.87]})
Training Results - Epoch: 1  Avg accuracy: 70.15 Avg loss: 0.76
Training Results - Epoch: 1  Avg accuracy: 63.05 Avg loss: 0.86
Validation Results - Epoch: 1  Avg accuracy: 59.23 Avg loss: 0.92

Training Results - Epoch: 2  Avg accuracy: 65.22 Avg loss: 0.93
Validation Results - Epoch: 2  Avg accuracy: 61.41 Avg loss: 0.98

Training Results - Epoch: 3  Avg accuracy: 73.80 Avg loss: 0.75
Validation Results - Epoch: 3  Avg accuracy: 69.67 Avg loss: 0.82

Test Results - Avg accuracy: 69.64 Avg loss: 0.82  mAP: 0.70

Training Results - Epoch: 1  Avg accuracy: 67.42 Avg loss: 0.80


```

Dataset: soccer_net_4_v4.1_64x112x112_20fps

Model: R2+1D-34 (Layer 4 unfreezed)

LR=0.001

```
Epoch [1/10]: [125/125] 100%
, batch loss=0.713 [10:31<00:00]

Training Results - Epoch: 1  Avg accuracy: 65.00 Avg loss: 0.78
Validation Results - Epoch: 1  Avg accuracy: 64.91 Avg loss: 0.77
Epoch [2/10]: [125/125] 100%
, batch loss=1.05 [10:00<00:00]

Training Results - Epoch: 2  Avg accuracy: 62.85 Avg loss: 0.86
Validation Results - Epoch: 2  Avg accuracy: 62.20 Avg loss: 0.85
Epoch [3/10]: [125/125] 100%
, batch loss=0.895 [10:00<00:00]

Training Results - Epoch: 3  Avg accuracy: 62.85 Avg loss: 0.76
Validation Results - Epoch: 3  Avg accuracy: 61.90 Avg loss: 0.77
Epoch [4/10]: [125/125] 100%
, batch loss=1.06 [10:00<00:00]

Training Results - Epoch: 4  Avg accuracy: 72.85 Avg loss: 0.70
Validation Results - Epoch: 4  Avg accuracy: 73.19 Avg loss: 0.72
Epoch [5/10]: [125/125] 100%
, batch loss=1.13 [10:01<00:00]

Training Results - Epoch: 5  Avg accuracy: 72.80 Avg loss: 0.71
Validation Results - Epoch: 5  Avg accuracy: 68.37 Avg loss: 0.75
Epoch [6/10]: [125/125] 100%
, batch loss=0.933 [10:01<00:00]

Training Results - Epoch: 6  Avg accuracy: 84.45 Avg loss: 0.55
Validation Results - Epoch: 6  Avg accuracy: 82.53 Avg loss: 0.58
Epoch [7/10]: [125/125] 100%
, batch loss=0.667 [10:00<00:00]

Training Results - Epoch: 7  Avg accuracy: 86.60 Avg loss: 0.51
Validation Results - Epoch: 7  Avg accuracy: 85.84 Avg loss: 0.53
Epoch [8/10]: [125/125] 100%
, batch loss=1.2 [10:01<00:00]

Training Results - Epoch: 8  Avg accuracy: 80.90 Avg loss: 0.55
Validation Results - Epoch: 8  Avg accuracy: 79.52 Avg loss: 0.63
Epoch [9/10]: [125/125] 100%
, batch loss=0.737 [10:01<00:00]

Training Results - Epoch: 9  Avg accuracy: 89.45 Avg loss: 0.41
Validation Results - Epoch: 9  Avg accuracy: 86.45 Avg loss: 0.46
Epoch [10/10]: [125/125] 100%
, batch loss=0.405 [10:01<00:00]

Training Results - Epoch: 10  Avg accuracy: 88.85 Avg loss: 0.46
Validation Results - Epoch: 10  Avg accuracy: 85.84 Avg loss: 0.50
Test Results - Avg accuracy: 81.48 Avg loss: 0.59  mAP: 0.83
tensor([0.6601, 0.8294, 0.9364, 0.8814], dtype=torch.float64)
```



Ip-CSN, 70%

lr = 0.003

```
Training Results - Epoch: 1  Avg accuracy: 66.65 Avg loss: 0.92
Validation Results - Epoch: 1  Avg accuracy: 65.66 Avg loss: 0.91
Epoch [2/5]: [500/500] 100%
, batch loss=3.36 [1:03:00<00:00]

Training Results - Epoch: 2  Avg accuracy: 54.15 Avg loss: 1.27
Validation Results - Epoch: 2  Avg accuracy: 56.02 Avg loss: 1.20
Epoch [3/5]: [500/500] 100%
, batch loss=1.01 [1:02:59<00:00]

Training Results - Epoch: 3  Avg accuracy: 68.95 Avg loss: 0.90
Validation Results - Epoch: 3  Avg accuracy: 71.08 Avg loss: 0.85
Epoch [4/5]: [500/500] 100%
, batch loss=1.44 [1:02:59<00:00]

Training Results - Epoch: 4  Avg accuracy: 61.75 Avg loss: 1.09
Validation Results - Epoch: 4  Avg accuracy: 62.50 Avg loss: 0.96
Epoch [5/5]: [500/500] 100%
, batch loss=2.46 [1:02:59<00:00]

Training Results - Epoch: 5  Avg accuracy: 73.55 Avg loss: 0.80
Validation Results - Epoch: 5  Avg accuracy: 70.03 Avg loss: 0.77
Test Results - Avg accuracy: 70.33 Avg loss: 0.79  mAP: 0.71
tensor([0.6533, 0.6020, 0.7670, 0.8304], dtype=torch.float64)
```



SlowFast-50

lr = 0.002

Best Val Acc: 77%

```
Training Results - Epoch: 1  Avg accuracy: 67.10 Avg loss: 0.85
Validation Results - Epoch: 1  Avg accuracy: 64.46 Avg loss: 0.93
Epoch [2/15]: [125/125] 100%
, batch loss=0.799 [22:05<00:00]

Training Results - Epoch: 2  Avg accuracy: 72.80 Avg loss: 0.76
Validation Results - Epoch: 2  Avg accuracy: 70.03 Avg loss: 0.82
Epoch [3/15]: [125/125] 100%
, batch loss=0.87 [22:08<00:00]

Training Results - Epoch: 3  Avg accuracy: 73.75 Avg loss: 0.65
Validation Results - Epoch: 3  Avg accuracy: 68.52 Avg loss: 0.73
Epoch [4/15]: [125/125] 100%
, batch loss=0.506 [22:07<00:00]

Training Results - Epoch: 4  Avg accuracy: 76.65 Avg loss: 0.64
Validation Results - Epoch: 4  Avg accuracy: 72.14 Avg loss: 0.73
Epoch [5/15]: [125/125] 100%
, batch loss=1.17 [22:08<00:00]

Training Results - Epoch: 5  Avg accuracy: 78.75 Avg loss: 0.57
Validation Results - Epoch: 5  Avg accuracy: 74.10 Avg loss: 0.65
Epoch [6/15]: [125/125] 100%
, batch loss=0.629 [22:02<00:00]

Training Results - Epoch: 6  Avg accuracy: 79.25 Avg loss: 0.54
Validation Results - Epoch: 6  Avg accuracy: 74.70 Avg loss: 0.65
Epoch [7/15]: [125/125] 100%
, batch loss=1.09 [22:01<00:00]

Training Results - Epoch: 7  Avg accuracy: 81.05 Avg loss: 0.50
Validation Results - Epoch: 7  Avg accuracy: 77.11 Avg loss: 0.61
Epoch [8/15]: [125/125] 100%
, batch loss=1.07 [21:58<00:00]

Training Results - Epoch: 8  Avg accuracy: 78.20 Avg loss: 0.60
Validation Results - Epoch: 8  Avg accuracy: 73.49 Avg loss: 0.70
Epoch [9/15]: [125/125] 100%
, batch loss=0.888 [21:58<00:00]

Training Results - Epoch: 9  Avg accuracy: 81.30 Avg loss: 0.55
Validation Results - Epoch: 9  Avg accuracy: 74.85 Avg loss: 0.77
Epoch [10/15]: [125/125] 100%
, batch loss=0.664 [21:58<00:00]

Training Results - Epoch: 10  Avg accuracy: 83.25 Avg loss: 0.46
Validation Results - Epoch: 10  Avg accuracy: 75.15 Avg loss: 0.64
Epoch [11/15]: [125/125] 100%
, batch loss=0.33 [21:49<00:00]

Training Results - Epoch: 11  Avg accuracy: 84.20 Avg loss: 0.41
Validation Results - Epoch: 11  Avg accuracy: 75.60 Avg loss: 0.63
Epoch [12/15]: [125/125] 100%
, batch loss=0.701 [21:30<00:00]

Training Results - Epoch: 12  Avg accuracy: 73.85 Avg loss: 0.73
Validation Results - Epoch: 12  Avg accuracy: 66.27 Avg loss: 1.03
Test Results - Avg accuracy: 67.47 Avg loss: 1.05  mAP: 0.73
tensor([0.6522, 0.8375, 0.9179, 0.5294], dtype=torch.float64)
```



