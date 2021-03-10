# Looking for Suspicious Transactions

![Credit card fraudster](Images/credit_card_fraudster.jpg)

*[Credit Card Fraudster by Richard Patterson](https://www.flickr.com/photos/136770128@N07/42252105582/) | [Creative Commons Licensed](https://creativecommons.org/licenses/by/2.0/)*

## Background

Fraud is everywhere these days—whether you are a small taco shop or a large international business. While there are emerging technologies that employ machine learning and artificial intelligence to detect fraud, many instances of fraud detection still require strong data analytics to find abnormal charges.

In this project, I applied my SQL skills to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

I wanted to accomplish three main tasks:

1. [Data Modeling](#Data-Modeling):
Define a database model to store the credit card transactions data and create a new PostgreSQL database using your model.

2. [Data Engineering](#Data-Engineering): Create a database schema on PostgreSQL and populate your database from the CSV files.

3. [Data Analysis](#Data-Analysis): Analyze the data to identify possible fraudulent transactions.

---

## Files

* [card_holder.csv](Data/card_holder.csv)
* [credit_card.csv](Data/credit_card.csv)
* [merchant_category.csv](Data/merchant_category.csv)
* [merchant.csv](Data/merchant.csv)
* [transaction.csv](Data/transaction.csv)


### Data Modeling

Create an entity relationship diagram (ERD) by inspecting the provided CSV files.

**Note:** For the `credit_card` table, the `card` column should be a VARCHAR(20) datatype rather than an INT.

Part of the challenge here was to figure out how many tables I should create, as well as what kind of relationships I needed to define among the tables.

I used [Quick Database Diagrams](https://app.quickdatabasediagrams.com/#/) to create my model.

### Data Engineering

Using my database model as a blueprint, I created a database schema for each of my tables and relationships. Always Remember to specify data types, primary keys, foreign keys, and any other constraints you defined.

After creating the database schema, import the data from the corresponding CSV files.

### Data Analysis

Now that my data was prepared within the database, it's finally time to identify fraudulent transactions using SQL and Pandas DataFrames. In this part of the project, I analyzed the data and then created a report within a Jupyter Notebook file to present my findings. My report tried to answer the following questions:

* How can I isolate (or group) the transactions of each cardholder?

* Consider the time period 7:00 a.m. to 9:00 a.m.

  * What are the 100 highest transactions during this time period?

  * Did I see any fraudulent or anomalous transactions?
  
  * If I answered yes to the previous question, I tried to explain why I thought there might be fraudulent transactions during this time frame.

* Some fraudsters hack a credit card by making several small payments (generally less than $2.00), which are typically ignored by cardholders. I counted the transactions that are less than $2.00 per cardholder. Was there any evidence to suggest that a credit card has been hacked? 

* What are the top five merchants prone to being hacked using small transactions?

* Once I had a query that can be reused, I created a view for each of the previous queries.

I created a report for fraudulent transactions of some top customers of the firm. To achieve this task, I performed a visual data analysis of fraudulent transactions using Pandas, Plotly Express, hvPlot, and SQLAlchemy to create the visualizations.

* I verified if there were any fraudulent transactions in the history of two of the most important customers of the firm. For privacy reasons, you only know that their cardholders' IDs are 18 and 2.

  * Using hvPlot, I created a line plot representing the time series of transactions over the course of the year for each cardholder. In order to compare the patterns of both cardholders, I also created a line plot containing both lines.

  * What difference did I observe between the consumption patterns? Does the difference suggest a fraudulent transaction?

* The CEO of the firm's biggest customer suspects that someone has used her corporate credit card without authorization in the first quarter of 2018 to pay for several expensive restaurant bills. I was also asked to find any anomalous transactions during that period.

  * Using Plotly Express, I created a series of six box plots, one for each month, in order to identify how many outliers there are per month for cardholder ID 25.

  * Did I notice any anomalies? I tried to describe my observations and conclusions.

## An Additional Exercise.... 

Another approach to identify fraudulent transactions is to look for outliers in the data. Standard deviation or quartiles are often used to detect outliers.

Read the following articles on outliers detection, and then you can try to  code a function using Python to identify anomalies for any cardholder.

* [How to Calculate Outliers](https://www.wikihow.com/Calculate-Outliers)

* [Removing Outliers Using Standard Deviation in Python](https://www.kdnuggets.com/2017/02/removing-outliers-standard-deviation-python.html)

* [How to Use Statistics to Identify Outliers in Data](https://machinelearningmastery.com/how-to-use-statistics-to-identify-outliers-in-data/)


For comparing time and dates, take a look at the [date/time functions and operators](https://www.postgresql.org/docs/8.0/functions-datetime.html) in the PostgreSQL documentation.
