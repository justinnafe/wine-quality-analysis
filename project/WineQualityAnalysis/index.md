---
title       : White Wine Quality
subtitle    : Prediction of quality based on physiochemical features
author      : Justin Nafe
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

1. Predict quality of white wine based on physicochemical features.
2. Random Forest algorithm for the prediction.
3. Accuracy for the measure of success.

--- 

## Benifits

1. Algorithmically determine quality of wine.
2. Limit human interaction in determining quality of wine.
  * For example, winemakers could reduce the number of times humans are used to determine quality of wine, stop production of poor wine, and/or taste test only the wines that predict high quality.

--- 

## Accuracy and Precision



1. Predicting using the top 4 features (the top 4 features were determined by having the most predictability out of the 11 features. Please review wineQualityAnalysis.Rmd for how these were derived), accuracy was 0.6615542
2. Predicting using all 11 features, accuracy was 0.7034765

---

## References

P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis. 
Modeling wine preferences by data mining from physicochemical properties. In Decision Support Systems, Elsevier, 47(4):547-553, 2009

