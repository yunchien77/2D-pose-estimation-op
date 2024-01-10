## Using human posture recognition to perform spastic pendulum test analysis on images of stroke patients
Use the body 25 package in ```openpose``` to detect key points of the human body, and calculate the swing angle of the knee joint through the pendulum test to estimate the degree of spasticity.

This is a schematic diagram of key points detected by the ```body 25``` model.

![Imgur](https://i.imgur.com/RK42RdJ.png)

We use colab to build the openpose environment. Due to version changes, models may be missed. You need to put the package into the corresponding folder by yourself.

folder_path: ```openpose -> model -> pose -> body_25 -> pose_iter_584000.caffemodel```

If ```pose_iter_584000.caffemodel``` already exists in the folder, you need to remove it and update it to the correct file.

> you can arrive [kaggle_url](https://www.kaggle.com/datasets/changethetuneman/openpose-model/?select=pose_iter_116000.caffemodel) to download the model file.
