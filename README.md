# ClassicalAndCommunityAwareCentralityAnalysis

This repository contains the codes of the simulation for the article: Rajeh, S., Savonnet, M., Leclercq, E. et al. _Characterizing the interactions between classical and community-aware centrality measures in complex networks._ Sci Rep 11, 10088 (2021). https://doi.org/10.1038/s41598-021-89549-x

Comments and questions are welcome, contact: `stephany.rajeh(at)u-bourgogne.fr`

The sources of datasets used in the study are available within the article.

## CentralityCalculationAndFurtherProcessing
1. Calculates the classical and community-aware centrality for a given network. 
2. Computes the correlation for all possible combinations between classical and community-aware centrality measures are then represent them in a heatmap.

___Note:___ Classical measures are already written with `networkx` in Python and `centiserve` in R while community-aware centrality measures are written for the study of this paper.

## NetworkTopologyCharacteristicsExtraction
1. Extracts macroscopic features for a given network
2. Extracts mesoscopic features for a given network

___Note:___ Code for macroscopic features is already written with `networkx` in Python while code for mesoscopic features are written for the study of this paper.

## Linear Regression 
1. Code for performing linear regression using ordinary least squares (in Python)
2. Code for performing linear regression using weighted least squares (in R)

___Note:___ Linear regression concering the _Degree Distribution Exponent_ is calculated excluding the Football network, in a separate folder.
