# Housing Market Analysis

Team Members: Danny, Katelyn, Robert

## Project Outline

The purpose of this project is to use machine learning to help predict housing prices. For this analysis we used a dataset from Kaggle which is data from Jan2018-Jan2021 of Austin area housing prices. We did a preliminary analysis to determine which features were most related to the housing price. This included running a correlation matrix and feature importance. Once the dataset was cleaned and reduced to only include the most relevant features, we also calculated data of average price by zipcode and year. This was joined to the data in SQL. Finally, the cleaned data was analyzed using xgboost machine learning method.

A presentation of the project is found here: https://docs.google.com/presentation/d/1cHTK7ICnjErINvytlLyeinshPlcZuPRem8DGJiTisXk/edit?usp=sharing


## Data Preprocessing: 
1. Data pre-processing: In order to clean the data, some text heavy fields were removed such as the address and description. The remaining fields were updated so they were all numberic. Boolean values were converted to 0/1 and get dummies was used to convert other text fields to numberic. This is all included in the cleaning data notebook ([CleaningData](notebook/CleaningData.ipynb)) and google slides. 
2. Feature selection: Some features were eliminated since only a handful of houses had them. After this preliminary cleaning, we used correlation matrix to pick the 5 features with most positive, and 5 features with the most negative correlation to price. An initial xgboost analysis was run with the full data set, and we pulled some of the top features based on feature importance. This is all included in the cleaning data notebook ([CleaningData](notebook/CleaningData.ipynb)) and google slides. 


## Machine Learning:
Model choice: Linear regression (MAE: 163365.73), Random Forest (MAE: 95794.09), and xgboost (MAE: 91,495.53) were the three models tested in this analysis. xgboost had the highest accuracy score of the models tested. See Google slides for additional details.

Changes of model choice: xgboost was the final method selected.

### Why Choose XGBoost:
XGBoost, or eXtreme Gradient Boosted trees, is one of the most powerful machine learning algorithms out there today. Many kaggle competitions nowadays are won using XGBoost. It is very accurate and fast compared to most other machine learning models.For prediction problems, neural networks tend to outperform most algorithms involving unstructured data. However, when it comes to structured data, decision tree algorithms like XGBoost will often times work faster and better. XGBoost takes the boosting ensemble framework and adds many new features that make it an extremely powerful algorithm.
#### XGBoost Features:
* Regularization: Prevents overfitting (Uses LASSO L1 and Ridge L2 regularization)
* Null Values: Will automatically figure out how to handle null values.
* Parallelization: Computationally efficient by use all the cores on your CPU or a cluster of computers It can also run different parts of the algorithm at the same time. This makes XGBoost one of the fastest machine learning algorithms out there.
* Cross-validation: Built in cross validation. XGBoost can evaluate the performance at each iteration of training and can find the optimal amount of iterations by stop the algorithm early if the performance isn’t improving.
* Tree pruning: Normal decision tree algorithms will stop branching once the performance stops improving, where XGBoost will build a very deep tree, then “prune” the tree backwards, resulting in deeper, but more optimized tree.

1. Once we load in the the data into our initial model, we'll need to prepare the data so that the algorithm can read it properly. We first drop any date columns (xgboost can't take in datetime formatted values), as well any zpid column, as it is just a placeholder id for each house.
2. Next, we'll separate ouf data into our features and target variables. The 'latestPrice' column will be our target, and every other column will be our features.
3. Training/splitting data: Two methods were investigated for training the data. One is to use the built in random splitting features. The second method was first splitting the data by year, then training for one year, and testing on the subsequent year. Using one year to train for the next decreased accuracy scores, so we used the built in random splitting feaure for training.
4. Once the split is done, features data will be loaded into a training and test data matrix, or dmatrix, as XGBoost requires the data to be in that specific format.
5. A baseline Mean Absolute Error (MAE) is calculated from the testing data to give us a baseline to compare our final MAE after we finish fine tuning all of our hyperparameters. (images/baseline_MAE.png)
6. Then, we will create a dictionary of our hyperparameters we will be optimizing for, as we will be necessary for using GridSearch to automate this process.
7. Taking advantage of XGBoost's built in cross validation, we will place in our initial parameters, and run the algorithm to find the optimal amount of iterations to minimize our MAE. We can set our "early_stopping_rounds" to 10, which if the algorithm's MAE does not improve after 10 iterations, it will stop the process.
8. Once our optimal hyperparameters are found, we will update our parameters dictionary with the optimal values, and continue this proccess until all of our hyperparameters have been optimized. (images/params_dict.PNG)
9. We will run our model one final time with the optimal hyperparameter values, and save the model if it is needed to be used again in the future.
10. Finally we will look at a few different metrics to test the accuracy of our model: R squared and adjusted R squaredm, root mean squared error, and root mean squared log error, and finally mean absolute error. (images/metrics.PNG) From top to bottom: R Squared/adjusted R squared, MSE/RMSE/RMSLE, and MAE.
11. Our R squared and Root Mean Errors seem to imply a fairly accurate and robust model. However our final MAE of 91,495.53 is significant, and may make this model unusable for real life applications.
12. Splitting the data by year did not really increase the accuracy score compared to all the data combined.
13. Current accuracy score: 
* 2018: Mean absolute error of 92,070 ([xgboost_optimization_2018](notebook/xgboost_optimization_2018.ipynb))
* 2019: Mean absolute error of 88,289 ([xgboost_optimization_2019](notebook/xgboost_optimization_2019.ipynb))
* 2020: Mean absolute error of 104,758 ([xgboost_optimization_2020](notebook/xgboost_optimization_2020.ipynb))

## Database:
1. Cleaning data file pushes cleaned tables into pgAdmin ([CleaningData](notebook/CleaningData.ipynb))
2. Joined tables are then pulled out of pgAdmin ([PullFromPGAdmin](notebook/PullFromPGAdmin.ipynb))
3. Database has 7 tables from the original data
4. Joins are used to add zip code based prices to the cleaned data set, this adds an additional 4 tables. ([AustinHousing_Joins](SQL/AustinHousing_Joins.sql)) 
5. SQLAlchemy is used for connecting pgAdmin in the jupyter notebook files
6. ERD ![ERD_cleanedzip](SQL/ERD_cleanedzip.PNG)

## Dashboard: 
The Tableau Dashboard is available here: 
https://public.tableau.com/shared/WZQN84F3C?:display_count=n&:origin=viz_share_link
https://public.tableau.com/app/profile/danny.chu5937/viz/AustinHousingPriceAnalysis/Dashboard1

1. The two images below show a map of the original housing price data and basic pricing information.

![init_housing_map](images/init_housing_map.PNG)

![init_housing_stats](images/init_housing_stats.PNG)

2. The image below shows the data calculated in the analysis. Pricing by zipcode and year

![zip_basics](images/zip_basics.PNG)

3. In Tableau, the map include pop-up details of the address and home description. The other charts allow filtering. 

## Further Work:
1. Housing market data appears to be highly monetized. 
Also, many of the APIs we looked at were geared towards real estate agents and required a connection to their MLS service. 
We tried getting data from Zillow. They sent a nice email indicating they only share data with companies that have contracted with them.  They did offer a link to some datasets they provide to academics that contained aggregate data (for instance, total sales per month for a given metroplex). 
Datasets grouped at the neighborhood level (rather than or addition to zip code) might provide an opportunity for greater accuracy. 
Perhaps we could partner with some real estate company. They might share data within a confidentiality agreement in hopes that they could profit from the results. 
2. We only engaged in a cursory look at other ML algorithms.  Perhaps a more comprehensive investigation of neural networks would prove fruitful. 
3. Another possibility would be to find corresponding metroplex datasets for information that is less monetized (i.e. free). Crime data, for instance, might be available for this purpose.


