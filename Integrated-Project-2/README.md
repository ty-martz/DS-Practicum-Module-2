# Integrated Project 2
------

## Task Statement:
- Prepare a prototype of a machine learning model for Zyfra. The company develops efficiency solutions for heavy industry.
- The model should predict the amount of gold recovered from gold ore. You have the data on extraction and purification.
- The model will help to optimize the production and eliminate unprofitable parameters.
- You need to:
  - Prepare the data;
  - Perform data analysis;
  - Develop and train a model.

## Data description:
#### Technological process:
- Rougher feed — raw material
- Rougher additions (or reagent additions) — flotation reagents: Xanthate, Sulphate, Depressant
  - Xanthate — promoter or flotation activator;
  - Sulphate — sodium sulphide for this particular process;
  - Depressant — sodium silicate.
- Rougher process — flotation
- Rougher tails — product residues
- Float banks — flotation unit
- Cleaner process — purification
- Rougher Au — rougher gold concentrate
- Final Au — final gold concentrate
#### Parameters of stages:
- air amount — volume of air
- fluid levels
- feed size — feed particle size
- feed rate

## Recovery Calculation:
- Recovery = ((C x (F - T)) / (F x (C - T))) x 100%
- Where:
  - C = share of gold in the concentrate right after flotation (for finding the rougher concentrate recovery)/after purification (for finding the final concentrate recovery)
  - F = share of gold in the feed before flotation (for finding the rougher concentrate recovery)/in the concentrate right after flotation (for finding the final concentrate recovery)
  - T = share of gold in the rougher tails right after flotation (for finding the rougher concentrate recovery)/after purification (for finding the final concentrate recovery)
- To predict the coefficient, you need to find the share of gold in the concentrate and the tails. Note that both final and rougher concentrates matter.

## Evaluation Metric:
- sMAPE = symmetric Mean Absolute Percentage Error
- ![alt text](https://pictures.s3.yandex.net/resources/smape_1576238825_1589899257.jpg)
- Denotation:
  - y<sub>i</sub> = Value of target for the observation with the i index in the sample used to measure quality.
  - y(hat)<sub>i</sub> = Value of prediction for the observation with the i index, for example, in the test sample.
  - N = Number of observations in the sample.
- We need to predict two values:
  - rougher concentrate recovery rougher.output.recovery
  - final concentrate recovery final.output.recovery
  
- Final sMAPE = 25% x sMAPE(rougher) + 75% x sMAPE(final)

# Project instructions
------
- 1 Prepare the data
  - 1.1. Open the files and look into the data.
  - 1.2. Check that recovery is calculated correctly. Using the training set, calculate recovery for the rougher.output.recovery feature. Find the MAE between your calculations and the feature values. Provide findings.
  - 1.3. Analyze the features not available in the test set. What are these parameters? What is their type?
  - 1.4. Perform data preprocessing.
- 2 Analyze the data
  - 2.1. Take note of how the concentrations of metals (Au, Ag, Pb) change depending on the purification stage.
  - 2.2. Compare the feed particle size distributions in the training set and in the test set. If the distributions vary significantly, the model evaluation will be incorrect.
  - 2.3. Consider the total concentrations of all substances at different stages: raw feed, rougher concentrate, and final concentrate. Do you notice any abnormal values in the total distribution? If you do, is it worth removing such values from both samples? Describe the findings and eliminate anomalies.
- 3 Build the model
  - 3.1. Write a function to calculate the final sMAPE value.
  - 3.2. Train different models. Evaluate them using cross-validation. Pick the best model and test it using the test sample. Provide findings.

  
