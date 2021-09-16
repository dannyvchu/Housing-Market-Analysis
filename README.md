# Housing Market Analysis

Team Member Roles:

GitHub(Square): Danny

Machine Learning(Triangle): Danny Linear Regression, Random Forest, XGBoosting

Database(Circle): Katelyn

Dashboard: Robert, Carlos Storyboard on Google Slides

Technologies(X): PostgreSQL, Python, Tableau, Google Slides

## Segment 1: 
Topic: Predict Housing Data 
Reason: Recently there has been a large explosion in the current housing market across the US, especially with Austin being ranked one of the top housing markets in the US. 
Data Source: Kaggle, Austin Housing Jan 2018 - Jan 2021 
Questions: For House Sellers and House Buyers - Is the house I'm selling/buying at a 'good' price for the current market?

Important Features


## Segment 2:

Google Slides: https://docs.google.com/presentation/d/1cHTK7ICnjErINvytlLyeinshPlcZuPRem8DGJiTisXk/edit?usp=sharing

Project Outline:

Machine Learning: 
1. Preliminary data pre-processing steps and features selection is include in cleaning data notebook ([CleaningData](notebook/CleaningData.ipynb)) and google slides. 
2. Training/splitting data
3. Model choice

Database:
1. Cleaning data file pushes cleaned tables into pgAdmin ([CleaningData](notebook/CleaningData.ipynb))
2. Joined tables are then pulled out of pgAdmin ([PullFromPGAdmin](notebook/PullFromPGAdmin.ipynb))
3. Database has 7 tables from the original data
4. Joins are used to add zip code based prices to the cleaned data set, this adds an additional 4 tables.
5. SQLAlchemy is used for connecting pgAdmin in the jupyter notebook files
6. ERD ![ERD_cleanedzip](SQL/ERD_cleanedzip.PNG)

Dashboard: 
1. Storyboard is included in Google Slides linked above
2. Tableau will be the main tool used for the dashboard
3. Interactive elements include pop-up tags in Tableau, and filtering options



