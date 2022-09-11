<img align="right" src="./images/logo.png">


Lab 12. Advanced Analytics with Tableau
----------------------------------------------------



This chapter will cover the following topics:
-   Running segmentation analysis
-   Discovering the latent structure of the dataset
-   Extracting the structure beneath discrete variables
-   Data mining with tree-based models
-   Identifying anomalies in data



Technical requirements 
-----------------------------------------

To follow the recipes from this lab, you\'ll need to have Tableau
2020.1 installed. You will also need to have R installed, as well as the
`Rserve` library. To install the `Rserve` library,
open a new R script by navigating to **`File `**\| **`New script`**:


![](./images/ba1a606e-51bb-4462-8f57-9be4ba50cde4.png)
Run the following code: 


```
install.packages('Rserve',repos='http://cran.us.r-project.org')
```
You can run the code by selecting it and clicking the **`Run `**button 


![](./images/19e7f2e9-c369-4a44-ab0c-ddf150c78459.png)
or by pressing [*Ctrl*] + [*R*] on your keyboard.



Introduction 
-------------------------------

In this lab, you\'ll learn how to utilize joined capabilities of
Tableau and R in order to perform some more advanced analytical tasks.
This will enable us to dive below the surface and to discover hidden
underlying patterns in our data. We\'ll learn how to identify and
interpret latent dimensions of our dataset, to group similar cases, and
to detect and interpret unusual cases and anomalies in data.  


> [*\"Hiding within those mounds of data is knowledge that could change
> the life of a patient, or change the world.\"                        
>                                                                      
>                                                                      
>                          --Atul Butte*]



Running segmentation analysis 
------------------------------------------------

Cluster analysis is one of the most popular
data analysis techniques. It allows us to
find patterns or segments in our data, which we can then interpret in
order to gain a more in-depth understanding of its underlying structure.
Tableau has a built-in clustering functionality, which means we\'ll not
be using R in this recipe---we\'ll perform the entire analysis through
Tableau only.



#### Getting ready

In this recipe, we\'ll be using the `mtcars.csv` dataset. It
contains characteristics of various car models, such as the
number of horsepowers, number of cylinders, miles per gallon, and so on.
Before we dive into the recipe, make sure you have the dataset saved to
your device and open Tableau and connect to it.


#### How to do it...


1.  After connecting to the `mtcars.csv` dataset, open a new
    blank worksheet.
2.  Drag and drop **`Qsec`** from **`Measures`** into
    the **`Rows`** shelf.
3.  Drag and drop **`Mpg`** from **`Measures`** into
    the **`Columns`** shelf.
4.  In the main menu toolbar, navigate
    to **`Analysis`** and, in the drop-down menu,
    deselect **`Aggregate Measures`**:

![](./images/9be63081-1e3d-411b-9a9f-d51fe4ed6260.png)
5.  We\'ve now produced a scatter plot of the car models. Let\'s add the
    clusters! In the **`Data`** pane, navigate to **`Analytics`**:

![](./images/3451a194-2463-43fc-9bdb-fbdb122e9b11.png)

6.  Drag and drop **`Cluster`** from **`Model`** into the view we have created:

![](./images/a3bffc8c-31ed-47d9-b7f6-caf44866459e.png)

7.  A dimension, **`Clusters`**, has been created and placed
    onto **`Color`** in the **`Marks`** card:

![](./images/dadb964b-58e6-4011-932a-776c29c650e0.png)

8.  In the **`Clusters`** window that opened, we can see two measures
    that we previously placed into the scatter plot. Navigate back to
    the **`Data`** pane and, under **`Measures`**, select the remaining
    measures (**`Am`** through **`Wt`**), by clicking on
    them while holding
    the [*Ctrl*] key on your keyboard:

![](./images/8d3d2cfc-dcfa-442b-adb8-f0830c685221.png)
9.  Drag and drop all of the selected measures into
    the **`Clusters`** window, under **`Variables`**:

![](./images/8efa15c5-60a8-40e6-853a-b288f4cebe3b.png)

10. Click on **`X`** to close
    the **`Clusters`** window.
11. Drag and drop **`Model`** from **`Dimensions`** onto **`Label`** in
    the **`Marks`** card:



### How it works\...



Cluster analysis works by grouping cases (in our example, car models)
into clusters based on a complex underlying pattern of scores on
multiple measures. When setting up the cluster analysis, we entered all
of the measures we wanted the cluster based on into
the **`Clusters`** window, and Tableau automatically detected the
optimal number of clusters. There are many clustering algorithms---the
one implemented in Tableau is called k-means.

 

But this is just the beginning of the analysis. The next step is to
interpret the clusters. We can use the **`Describe Clusters`** function
to aid the interpretation. We\'ll access it by right-clicking on
the **`Clusters`** pill in the **`Marks`** card and
selecting **`Describe Clusters`** from the drop-down menu, as
shown in the following screenshot:


![](./images/2640430e-fb7b-4c47-a005-62f135277c9c.png)
This will launch the **`Describe Clusters`** window.
Under **`Summary`**, we can see what variables entered into the cluster
analysis, as well as **`Summary Diagnostics`**, which includes the
description of the model itself, as well as that of the individual
clusters. The **`Summary`** tab is shown in
the following screenshot:


![](./images/187bcf3a-751e-4ac9-bb97-35daa2a10ff5.png)
 

If we navigate to the **`Models`** tab, we\'ll see the results of the
**`Analysis of Variance,`** showing us which variables actually
differentiate the clusters. The **`Models`** tab is shown in the following screenshot:


![](./images/cecd5df6-f91e-4b68-a90c-e786213adf4b.png)
In in the preceding screenshot, we can see that all of the variables,
except for **`Sum of Vs`** and **`Sum of Gear`**, are significant by
looking at their associated values in the **`p-value`** column.
A **`p-value`** that is less than or equal to 0.05 is usually considered
significant. To gain more insight into how these variables differentiate
the clusters, we can compare the values of different variables for each
of the clusters in the **`Summary`** tab,
under **`Summary Diagnostics`**. We can also create new scatterplots by
placing various measures into the **`Rows`** and **`Columns`** shelves,
so we can gain a better sense of how the clusters are distributed.

### There\'s more\...



In the following example, we\'ll let the Tableau clustering algorithm
automatically determine the number of clusters---in this case, two.
However, it\'s also possible, and sometimes desirable, to set the number
of clusters ourselves. Let\'s change the number of
clusters by performing the following steps:


1.  Right-click on the **`Clusters`** pill in the **`Marks`** card.
2.  From the drop-down menu, select **`Edit clusters...`**:

![](./images/aad799a8-93dc-41d2-bdd4-12a2a3f00d28.png)
This will launch the **`Clusters`** window that we already encountered
when we were creating the initial clusters.


3.  Under **`Number of Clusters`**, type in the desired number of
    clusters. This time, let\'s go with `3`:

![](./images/0c1f9a29-123e-47f0-b68c-01c6e2f0ecc0.png)

4.  Click on **`X`** to close the **`Clusters`** window. We\'ve now
    created a three-cluster solution:

![](./images/6bc2faa1-d56b-498a-bc2c-02cabc45992f.png)


**Note**

Always be careful with setting the number of clusters and don\'t
increase it unless you have a good reason to do so. Simpler solutions
are usually better!



Discovering the latent structure of the dataset 
------------------------------------------------------------------

When dealing with complex topics, we usually
end up with a dataset with a large number of variables. To find meaning
in this kind of dataset is typically a tricky task. Luckily, there are
some analytical techniques that can help us. One of those
techniques is [**principal component
analysis**] ([**PCA**]), which is a data reduction
technique. Mathematical transformation in this analysis enables us to
derive the most informative dimensions of our dataset. The mathematics
underlying the analysis [**singular value decomposition**]
([**SVD**]) is somewhat complex, so
we won\'t go into too much detail in this recipe. The basics of PCA can
be described like this: you start with a dataset with many variables,
then you simplify that dataset by turning your original variables into a
smaller number of [**principal components**] in a way that
guarantees that you\'ll preserve as much information as possible. Those
components can be used for further analysis as well and provide insight
into the underlying structure of our data, helping us make sense of our
data and see the forest among the trees.



#### Getting ready

The dataset that we\'re going to use for this recipe comes from a
psychological survey. A group of people was assessed using a
psychological test. The result of the assessment is psychological
profile composed of numerical scores representing following personality
traits: anxiety, hostility, self-consciousness, assertiveness, sensation
seeking, positive emotions, aesthetics, ideas, values, fairness,
altruism, gentleness, competency, achievement, and discipline. Since
simultaneously interpreting the results on various variables is a
difficult task, we want to reduce the number of variables, but in a way
that preserves the most information from the original dataset.

**Note**

For that task, we\'ll use the `prcomp` function that\'s
built-in R.



#### How to do it...


1.  Launch R and open a new script by selecting **`File`** and then
    **`New script`**.
2.  In the **`R Editor`** window, enter the following code and make sure
    to replace all of the file paths with the paths leading to the
    appropriate locations on your device. After pasting the paths, make
    sure to replace the backslashes with
    double backslashes, as seen in the following code:

```
pt <-read.table ("C:\\Users\\Slaven\\Desktop\\personality_ traits.csv", header=T, sep=",")
pt.pc <- prcomp(pt, scale = TRUE)
X1 <- pt.pc$x [, 1]
X2 <- pt.pc$x [, 2]
X3 <- pt.pc$x [, 3]
X4 <- pt.pc$x [, 4]
X5 <- pt.pc$x [, 5]
scores <- cbind(pt, X1, X2, X3, X4, X5) 
colnames(scores)[17] <- "X1"
colnames(scores)[18] <- "X2"
colnames(scores)[19] <- "X3"
colnames(scores)[20] <- "X4"
colnames(scores)[21] <- "X5"
write.csv (scores, "C:\\Users\\Slaven\\Desktop\\scores.csv")
loadings <- as.data.frame(pt.pc$rotation)
loadings <- loadings[2:16, 1:5]
loadings$trait <- row.names(loadings)
rownames(loadings) <- c()
path <-matrix(1,15,1)
up <- cbind(loadings,path)
zero <-matrix(0, 15, 6)
trait <- as.data.frame(loadings [,6])
down <-cbind (zero, trait)
colnames(down) <- c("PC1","PC2","PC3","PC4","PC5", "path", "trait")
pt.loadings <- rbind(up, down)
write.csv (pt.loadings, "C:\\Users\\Slaven\\Desktop\\pt.loadings.csv")
```

3.  Select the entire code and click the **`Run`** icon 
    
    ![](./images/19e7f2e9-c369-4a44-ab0c-ddf150c78459.png)
         . Alternatively, use [*Ctrl*]+[*R*] to run
    the code.
4.  Two files have now been created at the location you specified:
    `pt.loadings.csv` and `scores.csv`. We\'ll now
    use them to create a visualization in Tableau. Launch Tableau.
5.  From the **`Connect`** pane, select **`Text file`** and navigate to
    either of the files you have created---`pt.loadings.csv`
    or `scores.csv`. Select it and click **`Open`**.
6.  In the **`Data Source`** page, remove the file you\'ve connected to by right-clicking on it and
    selecting **`Remove`** from the drop-down menu:

![](./images/251561ec-1fec-4d98-99ee-59866694353e.png)

7.  From the **`Files`** pane, drag and drop **`New Union`** into the
    whitespace. The **`Union`** window will open.
8.  Drag and drop `scores.csv` and `pt.loadings.csv`
    from the **`Files`** pane into the **`Union`** window, one by one.
    Click on **`Apply`**, and then click on **`OK`** to exit the window:

![](./images/5451eac4-3559-401e-b85f-71658eb6cd51.png)

9.  Navigate to **`Sheet 1`**.
10. Drag and drop **`X1`** from **`Measures`** into the **`Columns`**
    shelf.
11. Drag and drop **`X2`** from **`Measures`** into the **`Rows`**
    shelf.
12. Drag and drop **`PC1`** from **`Measures`**into the **`Columns`** shelf, to the right of the
    **`SUM(X1)`** pill.
13. Drag and drop **`PC2`** from **`Measures`** into the **`Rows`**
    shelf, to the right of the **`SUM(X2)`** pill:

![](./images/1bfdf4d3-4c36-438d-b222-fe9ef03089b7.png)
14. In the **`Marks`** card, click on the second **`SUM(PC1)`** chart in
    order to expand it:

![](./images/fb43bd78-c26c-4b7a-aa15-da2d93f03e53.png)

15. Click on the **`Automatic`** drop-down menu and change the mark type
    to **`Line`**.
16. Drag and drop **`path`** from **`Measures`** onto **`Path`** in the
    **`Marks`** card.
17. Drag and drop **`trait`** from **`Dimensions`** onto **`Label`** in
    the **`Marks`** card:

![](./images/bfd1d7cc-2fb7-46de-8113-698e80dabc33.png)

18. In the main menu toolbar, navigate to
    **`Analysis`** and, from the drop-down menu, deselect
    **`Aggregate Measures`**:

![](./images/77c4fb3e-40eb-4578-88d5-f501ea11a069.png)

19. Right-click on the **`PC1`** pill in the
    **`Columns`**shelf and select
    **`Dual Axis`** from the drop-down menu:

![](./images/521fed64-da3d-4250-bcef-149ac62ba246.png)
20. Right-click on the **`PC2`** in the **`Rows`**shelf and select **`Dual Axis`** from the drop-down menu.
    We\'ve finished our PCA and created a chart to visualizeit:

![](./images/312d10ad-2bcb-498c-adee-61cc531bc489.png)


**Note**

In order to make the chart more appealing and easier to read, you can
adjust the formatting in a way that emphasizes the most important
elements. In the preceding screenshot, we\'ve increased the label font
and made it bold, while at the same time changing the color of circles
from orange to gray and decreasing opacity. Feel free to explore the
formatting options that work best for you!
### How it works\...



We\'ve just performed a PCA and created a plot showing data points in a
swarm and our original personality dimensions as lines radiating from
the center of the chart. Values on [*x*] and
[*y*]-axes are actually the first and the second principal
components, respectively. By definition, the first two components
explain the largest proportion of variability in the original data,
which is why we use them in our chart. Points represent individual
people (cases) from our original data file but, instead of showing
scores on the different personality traits, we\'re charting the scores
on the first two principal components. Through our R script, we wrote a
new file, `scores.csv`, where we recorded the scores of
individuals on each of the principal
components. We saved those values (scores on principal components) as
measures: X1, X2, and so on. On the other hand, the lines represent our
original dimensions---personality traits. In the chart, we\'re showing
their loadings on, or correlations with, the first two principal
components. Those values are also saved as measures: PC1, PC2, and so
on. We used them to interpret our principal components---the higher the
loading, the more important that original dimension is for defining the
principal component. We created this part of the chart using the
`pt.loadings.csv` dataset, where we recorded loading of each
trait on each of the principal components.

Based on the length and direction of lines, we can conclude that the
first principal component, which carries the most information,
differentiates people based on their emotional stability, ranging from
emotionally stable (on the left-hand side), characterized by high
**`Discipline`**, **`Competency`**, and **`Achievement`**, to
emotionally unstable (on the right-hand side), characterized by high
**`Self-consciousness`**, **`Anxiety`**, and **`Hostility`**.

The second principal component, which is shown on the
[*y*]-axis, is defined by **`Fairness`**, **`Gentleness`**,
and **`Altruism`** on one side, and **`Sensation-seeking`** and
**`Assertiveness`** on the other side. This dimensions can be
interpreted as speaking about cooperativeness versus competitiveness.



**Note**

Always be mindful of the fact that interpretation of the components goes
beyond interpreting the data at hand and relies heavily on
domain-specific knowledge about the topic of research.



#### There\'s more...



Visualizing the first and the second principal component is the usual
way to go since these two components carry the most information.
However, sometimes we might wish to see the third, fourth, and so on,
principal component.



**Note**

A handy way to allow for this is to create a parameter that would enable
users to switch between principal components they wish to see in the
plot.





Extracting the structure beneath discrete variables 
----------------------------------------------------------------------

This recipe will guide you through the process of performing and visualizing the results of correspondence
analysis. Correspondence analysis is a data reduction technique
frequently used in brand image studies, but also in other types of
research, because it allows us to neatly map brands on a map formed by
brand attributes.



#### Getting ready

In this recipe, we\'ll use `telco_image.csv`, a dataset coming
from a market research survey. Cell phone users were asked to rate the
three biggest mobile network providers in their country on a list of
attributes. For each attribute, they chose one brand they felt best fit
that description. Before we begin, make sure you\'ve saved the
`telco_image.csv` dataset to your device.


#### How to do it...


1.  Launch R, and open a new script by selecting **`File`** and then
    **`New script`**.
2.  In the **`R Editor`** window, enter the following code. Make sure to
    replace all of the file paths with the paths leading to the
    appropriate locations on your device. After pasting the paths, make
    sure to replace the backslashes with double backslashes, as seen in
    the following code block:

```
install.packages('ca',repos='http://cran.us.r-project.org')
library(ca)
df <- read.table("C:\\Users\\Slaven\\Desktop\\telco_image.csv", header=T, sep=",")
n <-ncol(df)
blank <-matrix(NA, 1 ,n)
blank$brands <- c(colnames(df))
brands <- as.data.frame(blank$brands[-1])
names(brands) <- "labels"
labels <-df [ ,1]
labels <- as.data.frame(labels)
labels.df <- rbind(labels,brands)
type1 <-as.data.frame(rep("Brand", nrow(brands)))
names(type1) <- "Type"
type2 <-as.data.frame(rep("Feature", nrow(labels)))
names(type2) <- "Type"
type.df <- rbind(type2, type1)
num.df<- df[,-1]
c<-ca(num.df)
X <-append(c$rowcoord[,1],c$colcoord[,1], )
Y <-append(c$rowcoord[,2],c$colcoord[,2], )
axes <- data.frame(cbind(X,Y))
fin.data <- cbind(axes,type.df,labels.df)
write.csv(fin.data, "C:\\Users\\Slaven\\Desktop\\CA_input_data.csv")
```

3.  Select the entire code and click on the **`Run`** icon
    
    ![](./images/19e7f2e9-c369-4a44-ab0c-ddf150c78459.png)
        . Alternatively, use [*Ctrl *]+ [*R*] to run
    the code.
4.  A new file, `CA_input_data.csv`, has now been created at
    the location you specified. We\'ll now use it to create a
    visualization in Tableau. Launch Tableau.

5.  From the **`Connect`** pane, select **`Text file`** and navigate to
    `CA_input_data.csv`, then select it and click
    on **`Open`**.
6.  Navigate to **`Sheet 1`**.
7.  Drag and drop **`X`** from **`Measures`** into the **`Columns`**
    shelf.
8.  Drag and drop **`Y`** from **`Measures`** into the **`Rows`** shelf.
9.  Drag and drop **`Labels`**from**`Dimensions`** onto **`Label`** in the **`Marks`**
    card.
10. Drag and drop **`Type`** from **`Dimensions`** onto **`Color`** in
    the **`Marks`** card.
11. Drag and drop **`Type`** from **`Dimensions`** onto **`Shape`** in
    the **`Marks`**card:

![](./images/8807029b-4534-4b52-8b71-07b4f589e631.png)
12. Click on the **`Shape`** button in the **`Marks`** card:

![](./images/57390353-6687-4092-a853-c72c38543895.png)

13. Assign the shapes you like to the brand and feature by clicking on
    the desired value (**`Brand`** or **`Feature`**) under
    **`Select Data Item`**, and choosing the desired shape from the
    **`Select Shape Palette`** drop-down menu. Let\'s
    choose the shapes shown in the following
    screenshot:

![](./images/72384ed2-013e-420e-b192-fd35710ff1f1.png)
14. When you are done with choosing the shapes, click on **`OK`** to
    exit the **`Edit Shape [Type]`** window. Our correspondence analysis
    is done:

![](./images/6be4db3f-2e90-4dfd-9c2a-fe2640ec6de3.png)



### How it works\...



Correspondence analysis works similarly to PCA, which we covered in the
first recipe, Discovering latent structure of the dataset, of this
lab. It reduces the number of dimensions that differentiate our
cases (in this example, brands) so we have a clearer overview of how each of the brands is positioned. On the
[*x*] and [*y*] axes, we plotted the first two
dimensions extracted by correspondence analysis, which have the same
function as the first two principal components in the principal
components analysis.

 

Both the brands and the attributes describing them are plotted in the
space created by the first two dimensions. We interpret the results, or
read the map, by looking at the spatial relationship of attributes and
brands. In our example, we see that **`Brand.B`** is perceived as
**`High-Tech`** and **`Innovative`**, offering **`Fast Internet`** and a
good choice of smartphones. On the other hand, it\'s on the opposite
side of the spectrum from the attributes **`Affordable`**,
**`Values Loyal Customers`**, and **`Clear offer`**, which are more
representative of **`Brand.A`** and **`Brand.C`**. Additionally,
**`Brand.A`** is also seen as **`Trustworthy`** and having professional
staff, while **`Brand.C`** has an image of a **`Youthful`** and
**`Fair`** brand that is a strong market influencer. Overall, the map
helps us form a well-rounded image of how customers perceive each of the
brands.


### There\'s more\...



Just as with the PCA, we can also use the positions of attributes on the
plot to interpret the dimensions created by them. In our example, the
[*y*]axis could be interpreted as
ranging from affordable/simple offer to high-tech/innovative, while the
[*x*] axis could be interpreted as being
trustworthy/friendly/transparent on one pole, and youthful on the other.



Data mining with tree-based models 
-----------------------------------------------------

Classification of cases in groups is one of the most
important tasks in data mining and analytics.
In the previous recipe,


> Clustering
, we made clusters of similar cases based on
measures by letting Tableau discover groups and patterns in the data.
However, there are also situations where we already have a dimension
labeling certain groups in our data, and we want to create a model that
will predict group membership using other fields in our dataset. For
this task, we can use a tree-based model. By the end of this lab,
you\'ll have built a decision tree using a classification algorithm,
while retaining a focus on a real-life business question.

#### Getting ready

In this recipe, we\'ll be using the `new_or_used_car.csv`
dataset. It contains data on people planning to buy a car in the next 12
months. We have some demographic data on them, such as age, gender, and
income, and some data about the car they\'re currently driving---whether
it was bought as new or used and its date of manufacture. Finally, we
have a dimension, `Future Purchase`, which lets us know
whether they\'re planning to buy a new or used car.

Before we dive into the recipe, please make sure you have the
`new_or_used_car.csv` dataset saved to your device.


#### How to do it...


1.  Launch R and open a new script by selecting **`File`** and then
    **`New script`**.
2.  In the **`R Editor`** window, enter the following code. Make sure to
    replace all of the file paths with the paths leading to the
    appropriate locations on your device. After pasting the paths, make
    sure to replace the backslashes with
    double backslashes, as in the following
    code block:

```
install.packages('rpart',repos='http://cran.us.r-project.org')
library(rpart)
cars <- read.table("C:\\!Slaven\\6 KNJIGA\\4 Advanced analytics\\4 decision tree\\new_or_used_car.csv", header=T, sep=",")
fit <- rpart(FuturePurchase ~ Age + Gender + Education + FamilyStatus + CurrentCar + AgeOfCurrentCar + MunicipalityType, method="class", data=cars)
plot(fit, uniform=TRUE, main="Classification of new cars buyers")
text(fit, all=TRUE, cex=.8)
```

3.  Run the entire block of code by selecting it clicking the **`Run`**
    button
    
    ![](./images/19e7f2e9-c369-4a44-ab0c-ddf150c78459.png)
        or by pressing [*Ctrl*] + [*R*] on your
    keyboard.
4.  In order to make the connection with Tableau possible, call the
    `Rserve` library by running the following code:

```
library(Rserve)
Rserve()
```

5.  Open Tableau and connect to the `new_or_used_car.csv`
    dataset.
6.  In the main menu toolbar, navigate to **`Help`** and, from the
    drop-down menu, select **`Settings and Performance`**. From the
    additional drop-down menu that will open, select
    **`Manage External Service Connection`**\...:

![](data:image/png;base64,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)

7.  In the **`Server`** field, enter `localhost`.
8.  In the **`Port`** field, enter `6311`.
9.  Click on the **`Test Connection`** button:

![](data:image/png;base64,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)

10. After receiving the message that you\'re
    successfully connected to the `RServe` service, click
    on **`OK`** to exit the notification, and then click
    on **`OK`**again to exit the
    **`External Service Connection`** window:

![](data:image/png;base64,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3DfygCZtK3poOFTqsSiUQ1U9rC5GrCofWLh2+Pin5a9iX4YMq147+hOgkaoexXceuR6V9PGl3k5dRnqTyeIiyV/i3w4f//CHHuS5tDnrTQY9BnvtM0W6uGg06qHrSKxUCUJnulnpWVaIobi4HFD1ios0Iqd9EdIGFqJhvnufnowD05AO669Kbb64hEa5ZJBQ0aNIHiM9yulD9oayjZON3ttigGRl3deFg21IT+peT2/8emgT9BBh7OK8raUXaRT0sH5s3yg7zjnbh8pp395CrwqhmP3nZGuaXBRnu7f77zAwi1pOCNOdt4rDKtfGXsLoixwECRU9Rl+YFnpsw1enunWEnUhZj1HySPR44a9OC2xjCjuQsh6j5JHosQ3pA3YoJT2S5JGy9fQBO5SSHknyKEH6GFdSPUrJI1lcSB9jS6pHKXmkepA+xpVEj5adh0L6GFMSPdp2HgrpYzwZ6bFy8crvrVy5SPoYR0Z6LFx0IX2MI+nWFKACeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADeoADenSHE9tF7E9Aj+4QJ3frxP4E9OgOJ05sbAfo0U3QAxzQAxzQAxzQAxx8PeazLJvZuH7o0cZv2ekYawQ9uomrx/ybjzYevDsjelzf/32MNYMe3cTT48F76sT1Q9cOXXuGHejRUTw9dFERST7+9dVn2YEeHWVTeuw/JquMC3p0k80tLo/mvwihNtCjm2xya/rfhzMx1gx6dBNXD/tge9oWGbEkxhpBj27i67Fp0KOboAc4oAc4oAc4xP/rtXVifwJ6dIc4uVsn9iegBzigBzigBzigBzigBzigBzigBzigBzigBzigB7QyHP4P8ItfWbIeyT0AAAAASUVORK5CYII=)

11. Open a new sheet.
12. Drag and drop **`Future Purchase`** from **`Dimensions`** into the
    **`Columns`** shelf.
13. Drag and drop **`Id`** from **`Dimensions`** onto **`Tooltip`** in
    the **`Marks`** card.
14. In the main menu toolbar, navigate to **`Analysis`** and, from the
    drop-down menu, select **`Create Calculated Field...`**.
15. Rename the new calculated field to 
    
    > **`Prediction`**
        and enter the following code block:

```
SCRIPT_STR
('library(rpart);
fit = rpart(FuturePurchase ~ Age + Gender + Education + FamilyStatus + CurrentCar + AgeOfCurrentCar + MunicipalityType,
method="class",
data.frame(FuturePurchase = .arg1,
Age =.arg2,
Gender =.arg3,
Education =.arg4,
FamilyStatus =.arg5,
CurrentCar =.arg6,
AgeOfCurrentCar =.arg7,
MunicipalityType=.arg8));
io<-predict(fit, type = "prob");colnames(io)[apply(io,1,which.max)]',
ATTR([Future Purchase]),
AVG([Age]),
ATTR([Gender]),
ATTR([Education]),
ATTR([Family Status]),
ATTR([Current Car]),
AVG([Age Of Current Car]),
ATTR([Municipality Type]))
```

16. Click **`OK`** to exit the calculated field window.
17. Drag and drop**`Predictions`**from**`Measures`** onto **`Color`** in the **`Marks`** card.
18. In main menu toolbar, go to **`Analysis`** and
    deselect **`Aggregate Measures`**.
19. In the drop-down menu, change **`Standard`** to **`Entire Vie``w`**:

![](data:image/png;base64,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)
 

In the following screenshot, we can see that we finished our chart
showing the actual and predicted classification of customers:


![](./images/84b1cbc8-ab11-465d-be0e-f943afc47333.png)



### How it works\...



Decision trees utilize the approach of repetitively dividing cases into
smaller, more homogeneous groups. Finally, we end up with a
classification tree which can be effectively visualized and easily
interpreted. In our example, we\'re trying to answer the
question based on the data we have. The
question that arises is: can we effectively predict who\'s going to buy
a new car and who\'s going to buy a used car?
As it turns out, we can. We\'ve created a predictive model using the
previous R script, and we recorded the predicted values for each case in
the new field called **`Prediction`**. We\'ve then created a
visualization comparing the actual values of the **`Future Purchase`**
dimension and the values we predicted. We can clearly see that, although
there are some misclassifications, our model performs pretty well!



### There\'s more

After having developed your model, you can save it as the
`.rda` file at your computer and reuse it with a new dataset.
Let\'s say you receive some more data about consumers, and you want to
see how many of them you can expect to go for a new car---you can just
feed that data into the model you\'ve already developed and get an
estimate.


Identifying anomalies in data 
------------------------------------------------

When analyzing data we\'ll frequently encounter unusual cases, outliers, and anomalies. Those cases are
different from the majority and they don\'t match the pattern that the
rest of the cases fit in. Sometimes, we might want to identify them in
order to remove them from the analysis,
because they can skew our results. In other cases, we might be
interested in analyzing them. Either way, it\'s very important to know
how to deal with them properly. In *Forecasting with Tableau*, the *Forecasting on a dataset
with outliers* recipe taught up how to deal with outliers on
one dimension, which is relatively simple. But when we have more than
one dimension, things get much more complicated. In this recipe, we\'ll
learn how to deal with multidimensional outliers.

#### Getting ready

In our recipe, we\'ll use a dataset from a health study of blood
pressure, `age_and_blood_pressure.csv`. It contains
information on the age of participants and their blood pressure. Before
we begin, make sure you have the dataset saved to your device.


#### How to do it...


1.  Start R, open a new script and run the following code block:

```
install.packages('mvoutlier',repos='http://cran.us.r-project.org')
library(Rserve)
Rserve()
```

2.  Open Tableau and connect to
    the `age_and_blood_pressure.csv` file.
3.  In the main menu toolbar, navigate to **`Help`** and, from the
    drop-down menu, select **`Settings and Performance`**. From the
    additional drop-down menu that will open,
    choose **`Manage External Service Connection...`**.
4.  In the **`Server`** field, enter `localhost`.
5.  In the **`Port`** field, enter `6311`.
6.  Click on the **`Test Connection`** button.
7.  After receiving a message that you\'re successfully connected to
    the `RServe` service, click on **`OK`** to close the
    notification, and then click on **`OK`** again to exit the
    **`External Service Connection`** window.
8.  Drag and drop **`Age`** from **`Measures`** into the **`Columns`**
    shelf.
9.  Drag and drop **`Blood Pressure`** from **`Measures`** into the
    **`Rows`** shelf.
10. In the main menu toolbar, navigate to **`Analysis`** and, from
    the drop-down menu, select **`Create Calculated Field...`**.
11. Rename the new calculated field `Outliers` and enter the
    following code:

```
IF SCRIPT_REAL("library(mvoutlier);sign2(cbind(.arg1, .arg2))$wfinal01", AVG([Age]), AVG([Blood Pressure])) == 0 THEN "Outlier" ELSE "OK" END
```
 

 

 

12. In the main menu toolbar, navigate to **`Analysis`** and, in the
    drop-down menu, deselect **`Aggregate Measures`**. 
13. Drag and drop **`Outliers`** from **`Measures`** onto **`Color`** in
    the **`Marks`** card. Our chart clearly shows the multidimensional
    outliers now, as shown in the following screenshot:

![](./images/b41cae9d-dd75-4f98-8bfd-2c9cbcefdb9f.png)



### How it works\...



In this recipe, we created a scatter plot showing the multidimensional
outliers. We did this because, sometimes, we can\'t simply isolate
outliers on each dimension. Multivariate outliers are defined by their
position on more than one variable, so it is important to observe them
simultaneously. Certain cases don\'t have to be outliers on any one of
the dimensions considered separately but are outliers if we observe
their pattern of values on multiple dimensions.

 

In our example, we\'ve flagged two people
with a respectiveblood pressure of 150 and
155 as outliers, circled in the following screenshot:


![](./images/7cac3132-eb6a-4486-9bed-41d59b4919cf.png)
However, these values of **`Blood pressure`** do not make them
extreme---there are some subjects with much higher blood pressure. With
reference to the preceding screenshot, we can see that other subjects
who have blood pressure this high are also considerably older than the
ones we marked---they are in their forties, or older, while our two
flagged cases are in their early twenties! We can see that their peers
have much lower blood pressure. So, while neither the values of
**`Blood pressure`** nor the values of **`Age`** taken in isolation make
this two cases extreme, when considered together, we see that these two
subjects are unusual because they have unusually high blood pressure for
their age. The opposite is true for other flagged cases---they are
flagged because they have unusually low blood pressure for their (older)
age. So, had we done a simple, one-dimensional, outlier analysis, we
would have never detected these unusual cases.

 

### There\'s more\...



To keep our example clear and illustrative, we used a two-dimensional
dataset (and two-dimensional outliers). However, you\'ll usually deal
with datasets that have more than two dimensions. Nevertheless, the
general approach you\'ll use to detect the multidimensional outliers
will be the same. You can use the same syntax as the one we\'ve used in
this example, but simply add as
many arguments as needed. The script will run
in the same manner and detect the outliers.

However, when operating with more than two dimensions, you won\'t be
able to visualize the multidimensional outliers on a scatter plot as
easily, since the pattern of values that makes them extreme is spread across various dimensions. If you
wish to represent them visually, you can check out the
`uniplot` function
(<https://www.rdocumentation.org/packages/mvoutlier/versions/2.0.9/topics/uni.plot>)
from the `mvoutlier` package in R, which allows you to unfold
the pattern of values into a series of unidimensional projections.
Although it isn\'t as neat as Tableau visualizations, it\'ll provide
some insight on how the outlier values can be interpreted. 

