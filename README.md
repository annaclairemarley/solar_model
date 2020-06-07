# Solar Model

## Table of Contents
* [Usage](#usage)
  * [Energy Generation](#energy-generation)
  * [Land Suitability](#land-suitability)
  * [Economics](#economics)
  * [Final scores](#final-scores)

# Usage

This model creates a projected solar suitability score for each county in California given solar energy generation, land suitability, and economic factors.

<code>data_cleaning.Rmd</code>: Cleans raw data used for model inputs

<code>model.Rmd</code>: Intakes cleaned data created in <code>data_cleaning.Rmd</code> and stored in  <code>generated_files</code> and produces final suitability score

<code>solar_radiation_SA.Rmd</code>: Conducts a sensitivity analysis on the parameters used in the solar energy output submodel

<code>report.pdf</code>: Final writeup of results

<code>Functions/</code>: Folder of functions used in this model. Includes both data cleaning and model functions

<code>Images</code>: Graphs and maps generated in this model

<code>Scrath_Rmds</code>: Scratch code used to initially create this model. Not necessary to actually run model


## Energy Generation

## Land Suitability
[USGS data](https://www.usgs.gov/centers/wgsc/science/california-land-change-projections?qt-science_center_objects=0#qt-science_center_objects)

## Economics

## Final scores
<img src="Images/best_counties_2020.png" width="300px">
