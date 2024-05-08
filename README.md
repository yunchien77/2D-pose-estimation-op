# Using human posture recognition to perform spastic pendulum test analysis on images of stroke patients
Use the body 25 package in [**OpenPose**](https://github.com/CMU-Perceptual-Computing-Lab/openpose) to detect key points of the human body, and calculate the swing angle of the knee joint through the pendulum test to estimate the degree of spasticity.

## Content
1. [Background](#background)
2. [Model](#model)
3. [Built Environment](#built-environment)

## Background
- **Pain Point**: Stroke is a common neurological disease and one of the leading causes of death worldwide. Muscle spasms are one of the sequelae of stroke, and the extent of the condition can be quantified by performing a pendulum test.

- **Clinical Need**: Traditional rehabilitation monitoring methods rely on observations by medical professionals and self-reporting by patients.

    → Subject to subjectivity and discontinuity in monitoring

- **Goal**: Develop a real-time spasticity pendulum testing system to understand the recovery progress of stroke patients through real-time analysis of spasticity postures.

## Model
This is a schematic diagram of key points detected by the ```body 25``` model.

<img src= "https://i.imgur.com/RK42RdJ.png" width="18%">

## Built Environment
We use  ```Colab``` to build the openpose environment. Due to version changes, models may be missed. You need to put the package into the corresponding folder by yourself.

folder_path: ```openpose -> model -> pose -> body_25 -> pose_iter_584000.caffemodel```

If ```pose_iter_584000.caffemodel``` already exists in the folder, you need to remove it and update it to the correct file.

> you can arrive [kaggle_url](https://www.kaggle.com/datasets/changethetuneman/openpose-model/?select=pose_iter_116000.caffemodel) to download the model file.
