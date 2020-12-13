## Soccer

* [Goal!! Event detection in sports video](https://www.researchgate.net/publication/313228631_Goal_Event_detection_in_sports_video): 7, 22, 130, 2017 (2Stream-CNN with real + optical flow, Autoencoder -> Binary Classifier)
* [Football Action Recognition Using Hierarchical LSTM](https://www.researchgate.net/publication/319285259_Football_Action_Recognition_Using_Hierarchical_LSTM): 18Cit, 46Ref, 66Read, 2017 -> extrem kleines Datenset
* [Slicing and dicing soccer: automatic detection of complex events from spatio-temporal data](https://arxiv.org/pdf/2004.04147.pdf), multi-stage, 2020 -> mit generierte (animierten) Videodaten

## Action-Classification

* MiCT: Mixed 3D/2D Convolutional Tube for Human Action Recognition by Microsoft
* Large-scale weakly-supervised pre-training for video action recognition by FB

##### Pooling on 2D-CNN Features

* [A Discriminative CNN Video Representation for Event Detection](https://arxiv.org/pdf/1411.4006.pdf), 2014

##### LSTM on 2D-CNN Features

* [Two Stream LSTM : A Deep Fusion Framework for Human Action Recognition](https://www.researchgate.net/publication/315877962_Two_Stream_LSTM_A_Deep_Fusion_Framework_for_Human_Action_Recognition): 37Cit, 38REF, 400 REAd, 2017 ( hierarchical multi stream fusion)

* [Temporal Action Localization using Long Short-Term Dependency](https://deepai.org/publication/temporal-action-localization-using-long-short-term-dependency), 2019 by DeepAI :fire:

* [Unsupervised Learning of Video Representations using LSTMs](https://arxiv.org/pdf/1502.04681.pdf), 2015

* [Classification of Puck Possession Events in Ice Hockey](https://ieeexplore.ieee.org/document/8014758): 3REr, 180 Read, 2017 (Group activity recognitons, uses convnets for frame + for each player, combined in LSTM)

* Exploiting feature and class relationships in video categorization with regularized deep neural networks, *2017*

* Unsupervised learning of video representations using LSTM, 2016

* Video lstm convolves, attends and flows for action recognition, 2018


##### Factorized

* Mixed 3d/2d convolutional tube for human action recognition, 2018

##### Other Approaches

* Temporal Action Localization in Untrimmed Videos via Multi-stage CNNs
* A key volume mining deep framework for action recognition, 2016 :fire:
* Deep residual learning for image recognition
* Network in network
* Spatiotemporal residual networks for video action recognition :fire: :fire:, 2016 3DConv
* Eco: Efficient convo- lutional network for online video understanding, 2018
* ARTNet: decouples spatial and temporal modeling into two parallel branches.
* Can spatiotemporal 3d cnns retrace the history of 2d cnns and imagenet? -> 3D ResNext
* Action Recognition with Trajectory-Pooled Deep-Convolutional Descriptors
* Very deep convolutional networks for large-scale image recognition :fire:, backbone of SlowFAST
* Going deeper with convolutions :fire:, backbone of SlowFast
* Deep residual learning for image recognition :fire:, backbone of slowest, ResNet-50/101

##### More on 2stream

* [Spatiotemporal Residual Networks for Video Action Recognition](https://arxiv.org/abs/1611.02155), 2016 Feichtenhofer
* 2Stream with ResNet
* Unsu- pervised learning of video representations using lstms., ***2017***, Autoencoder
* MARS: Motion-Augmented RGB Stream for Action Recognition
* ASSEMBLENET: SEARCHING FOR MULTI-STREAM NEURAL CONNECTIVITY IN VIDEO ARCHITECTURES, 2019 by Google :fire:

##### Dynamic Image Networks

* [Dynamic Image Networks for Action Recognition](https://ieeexplore.ieee.org/document/7780700), 2016

Loss Functions

* [A Context-Aware Loss Function for Action Spotting in Soccer Videos](https://www.researchgate.net/publication/337729951_A_Context-Aware_Loss_Function_for_Action_Spotting_in_Soccer_Videos) 63 REf, 66 Read, 2019 (improving SoccerNet, ActivityNet)

#### Fine Tuning

* [Towards Good Practices for Very Deep Two-Stream ConvNets](https://arxiv.org/pdf/1507.02159.pdf), 2015

### Books

* [Hundret Page Machine Learning Book](https://webreader.mytolino.com/library/index.html#/epub?id=bosh_10_3027720919078975652532691340)
* [Deep Learning by Ian Goodfellow](https://www.goodreads.com/author/show/15182060.Ian_Goodfellow)
* [Grokking Deep Learning by Andrew W. Trask](https://www.goodreads.com/book/show/31565758-grokking-deep-learning?ac=1&from_search=true&qid=n2PW92xZd6&rank=1)
* [Hands-On Machine Learning with Scikit-Learn, Keras, and Tensorflow: Concepts, Tools, and Techniques to Build Intelligent Systems by Aurélien Géron](https://www.goodreads.com/book/show/40363665-hands-on-machine-learning-with-scikit-learn-keras-and-tensorflow?ac=1&from_search=true&qid=ARa3WXhwmI&rank=2)
* [Machine Learning by Tom M. Mitchell](https://www.goodreads.com/book/show/213030.Machine_Learning?from_search=true&qid=rcx9w3TvuH&rank=1)

## Temporal Action Localization (Rücktransformation)

* On ActivityNet: https://paperswithcode.com/sota/temporal-action-localization-on-activitynet
* On THUMOS: https://paperswithcode.com/paper/bmn-boundary-matching-network-for-temporal
* MultiTHUMOS
* AVA* (auch mit bounding boxes)
* R-C3D: Region Convolutional 3D Network for Temporal Activity Detection
* Overview: https://github.com/jinwchoi/awesome-action-recognition 
* Action search: Spotting actions in videos and its application to tem- poral action localization., 2018
* Adaframe: Adaptive frame selection for fast video recog- nition., 2018
* Efficient video classification using fewer frames., 2019
* Rethinking the Faster R-CNN Architecture for Temporal Action Localization”, CVPR 2018 -> Vorschläge, dann Clip predic Zion

### Markierung

* <span style="color: yellow">Highlight</span>

* <span style="color: green">Citation</span>

* <span style="color: red">???</span>

* <span style="color: blue">Known Sources</span>

* <span style="color: violet">Todo</span>
