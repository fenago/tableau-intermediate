
<img align="right" src="./images/logo.png">



Lab 8. Forecasting with Tableau
--------------------------------


 In this lab, we will cover the following recipes:
-   Basic forecasting and statistical inference
-   Forecasting on a dataset with outliers



Technical requirements 
-----------------------------------------

To follow the recipes from this lab, you will need to have Tableau
2020.1 installed.

In the following recipes, we will be using
the `hormonal_response_to_excercise.csv` and
`stock_prices.csv` datasets, which you can download from the
following URLs:
-   [https://github.com/SlavenRB/Forecasting-with-Tableau/blob/master/hormonal\_response\_to\_excercise.csv](https://github.com/SlavenRB/Forecasting-with-Tableau/blob/master/hormonal_response_to_excercise.csv.)
-   <https://github.com/SlavenRB/Forecasting-with-Tableau/blob/master/stock-prices.txt>
Please make sure you have a local copy of the dataset saved to your
device before we begin.



Basic forecasting and statistical inference 
--------------------------------------------------------------

The aim of this recipe is to introduce a basic forecasting method that
relies on linear regression. We are going to use a built-in Tableau
facility for linear regression. Simply put, regression analysis helps us
discover predictors of a variable that we are interested in. We model
the relationship between potential predictors and our variable of
interest. Once we establish the model of the
relationship between predictors and our
variable, we can use it for further predictions.

To perform for casting, we will use
the `hormonal_response_to_excercise.csv` dataset. This dataset
comes from a health behavior study that aimed to explore the factors
influencing cortisol response while exerting the maximal, peak effort
during physical exercise (the `Cortmax` variable in our
dataset).

Our first task is to explore how effectively we can predict the level of
cortisol response in the point of maximal effort during physical
exercise, based on the cortisol level at rest (the `Cortrest`
variable). So, in this example, our variable of interest (variable we
are trying to predict) is `Cortmax` (cortisol level during
maximal effort), while our predictor variable (the one that we are using
to make a prediction) is `Cortrest` (cortisol level during
rest). We will try to model the relationship between these two
variables.



#### Getting ready

To perform the steps outlined In this lab, you will need to connect
to the `hormonal_response_to_excercise.csv` dataset.

#### How to do it...


1.  Open a blank worksheet and drag and drop **`Cortmax`** from
    **`Measures`** into the **`Columns`** shelf.
2.  Drag and drop **`Cortrest`** from **`Measures`** to the **`Rows`**
    shelf.
3.  In the main menu toolbar, navigate to
    **`Analysis`**and in the drop-down menu
    deselect **`Aggregate Measures`**:

![](./images/ef716d49-da85-4e38-a8c3-756bdae587cb.png)

4.  In the main menu toolbar, navigate to
    **`Analysis`**and in the drop-down menu,
    under **`Trend Lines`**, select **`Show Trend Lines`**:

![](./images/38415826-ad53-4afb-b9b2-eeac240bd472.png)

5.  Once again, navigate to **`Trend Lines`**under**`Analysis`** in the main menu toolbar, and select **`Describe Trend Model...`**:

![](./images/cf0d0da2-77c6-4695-a57e-28689ff1c7b1.png)
The following is the output:


![](./images/5fbf9e5e-1c7d-48a0-92ff-57ea3800738d.png)
In the following screenshot, we can see that we have successfully modeled the
relationship between these two variables:


![](./images/328ce65c-ac55-44af-aeef-586391fdf8ed.png)



### How it works\...



We have created a regression model. Now, we are going to interpret the
results, which tell us how successful our model is. But first, we need
to get familiar with some basic statistics. In the broadest terms, the
aim of each model is to represent real-life phenomena. All models differ
in accuracy, or how well they depict reality. In statistics, we call the
accuracy of the model its fit. The fit of a model is better if the
difference between real data (that we measured) and predicted data
(based on our model) is smaller.

 

We tried to predict cortisol level during maximum effort based on
cortisol level during rest. Actual data points are represented with the
circles, and the predictions that we made based on our model are
vertically projected on the line (shown in the previous screenshot). As
you can see, some circles lie almost on the line, some are above, and
some are below the line. But the line is positioned so that these
differences are minimized. If we want to estimate how good our model is,
we should estimate the size of these differences. But, since the
differences have both positive and negative values (some points are
above and some are below the line), we can not just simply sum it up
because they would cancel out. That\'s why we first need to square each
difference and then sum it up. The result is [**sum squared
error**] ([**SSE**])---that is a measure of our
model\'s error, or how much it deviates from actual data. In order to
estimate the goodness of our model\'s fit, we need to compare the size
of that deviation with a benchmark. The most commonly used
benchmark is the simple average of
[*y*] value or the flat, horizontal line. Comparison of our
model and baseline gives us R-squared. The bigger the R-squared is, the
smaller the probability that we obtained it by chance. The
conventionally accepted threshold of the probability is 0.05 and is
denoted by the p-value (significance) in our output. If our p-value is
smaller than the threshold, we can conclude that we have enough evidence
to believe that our model is good enough. In our case, the p-value is much smaller
than the mentioned threshold, so we can assume that the cortisol level
during the maximum effort can be reasonably well predicted based on the
cortisol level at rest. We can conclude that we have created a
successful model of the relationship between these two variables. 


#### There\'s more...



The regression that we presented in this example is linear because we
assumed that the relationship between our variables was linear -- an
assumption that turned out to be correct. However, other types of models
are also available in Tableau. They can be accessed by navigating to
**`Analysis`** \| **`Trend Lines`** \| **`Edit Trend Lines...`**. In the
**`Trend Lines Options`** window, we can choose other models such as
**`Logarithmic`**, **`Exponential`**, **`Power`**, or **`Polynomial`**.
A good way to choose the model is to first plot the data and visually
inspect it.



Forecasting on a dataset with outliers 
---------------------------------------------------------

In this lab, we are going to learn how to deal with outliers.
Outliers are data points that are very unusual, atypical, and deviate
from the trend present in the majority of the
dataset. Outliers can be dangerous if not dealt with appropriately
because they can significantly skew the results of an analysis. In this
recipe, we will explore ways of detecting outliers in Tableau. We are
going to perform a regression analysis and see how the regression line
is affected by these cases.



#### Getting ready

For this recipe, we need
the `hormonal_response_to_excercise.csv` dataset. We are going
to use the `Achtp` and `Achtmax` variables. The
`Achtp` variable is the level of adrenocorticotropic hormone
at the beginning of the test, while `Achtmax` is the level of
adrenocorticotropic hormone at the maximum effort during physical
exertion.


#### How to do it...


1.  Drag and drop **`Achtp`** from **`Measures`** into the **`Columns`**
    shelf.
2.  Drag and drop **`Achtmax`** from **`Measures`** into the **`Rows`**
    shelf.
3.  In the main menu toolbar, in the **`Analysis`** drop-down menu,
    deselect **`Aggregate Measures`**.
4.  In the main menu toolbar, in the**`Analysis`** drop-down menu, navigate to
    **`Trend Lines`** \| **`Show Trend Lines`**:

![](./images/3a192da1-3d3d-498a-a03c-8366679a4cbe.png)

5.  Rename the sheet to `Outliers included`.
6.  In the main menu navigate to **`Analysis`** \|
    **`Create Calculated Field...`**.
7.  Rename the calculated field from**`Calculation 1`** to `Average`, and in the
    formula space, type the following expression:

```
WINDOW_AVG(SUM([Achtmax]))
```
The calculation field shows the preceding expression in the following
screenshot:    


![](data:image/png;base64,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)

8.  Click on **`OK`** to save and exit the calculated field editor
    window.
9.  Repeat [*step 7*] to create another calculated field.
    Name the field `Lower` and in the formula space type the
    following expression:

```
  [Average] - 2.5*WINDOW_STDEV(SUM([Achtmax]))
```

10. Save and exit by clicking **`OK`**.
11. Repeat [*step 7*] to create yet another calculated field.
    Name the field `Upper` and in the formula space, type the
    following expression:

```
[Average] + 2.5*WINDOW_STDEV(SUM([Achtmax]))
```


12. Save and exit by clicking on **`OK`**.
13. Repeat [*step 7*] one last time to create our final
    calculated field. Name this field `Outliers` and in the
    formula space, type the following expression:

```
SUM([Achtmax])> [Upper] or SUM([Achtmax]) < [Lower]
```

14. Save and exit by clicking on **`OK`**.
15. Right-click on the **`Outliers included`**sheet tab at the bottom of the workspace and select
    **`Duplicate`** as seen in the following screenshot:

![](data:image/png;base64,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)

16. This will create an identical sheet named
    **`Outliers included (2)`**. Rename this
    sheet `Outliers excluded`.
 

17. Drag and drop **`Outliers`** from **`Measures`** to **`Color`** in
    the **`Marks`** card:

![](./images/6272bbdd-3f44-483f-acbe-2491453edfe0.png)

18. In the main menu toolbar, navigate to **`Dashboard`** \|
    **`New Dashboard`**.
19. Drag and drop **`Outliers included`**sheet from the **`Sheets`** section of the **`Dashboard`**
    pane into the canvas.
20. Drag and drop the **`Outliers excluded`** sheet from the
    **`Sheets`** section of the **`Dashboard`** pane into the canvas, to
    the right of the **`Outliers included`**sheet in the chart:

![](./images/dffeb994-1cb2-4f55-bcc6-ea7e92400595.png)

### How it works\...



In this lab, we learned how to detect outliers. Outliers are extreme
values that stand out from the other values in the sample. In order to
detect outliers, we relied on a commonly used conventional
rule---outliers are all values that deviate from the mean more than
+/-2.5 standard deviations, which excludes around 1% of our sample.

In this example, we are able to see how outliers can influence
statistical models. We can see that the model that includes outliers has
a much steeper slope than the model that excludes outliers, meaning that
they have pulled our linear model away from the
majority of data, giving us skewed results.
When interpreting results, we have to pay special attention to this
(so-called leverage) effect. Otherwise, we risk declaring a statistical
effect significant even when it does not actually exist.   
