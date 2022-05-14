#!/usr/bin/env python
# coding: utf-8

# # SF Salaries Exercise 
# 
# Welcome to a quick exercise for you to practice your pandas skills! We will be using the [SF Salaries Dataset](https://www.kaggle.com/kaggle/sf-salaries) from Kaggle! Just follow along and complete the tasks outlined in bold below. The tasks will get harder and harder as you go along.

# ** Import pandas as pd.**

# In[13]:


import pandas as pd
import numpy as np


# ** Read Salaries.csv as a dataframe called sal.**

# In[14]:

salaries = pd.read_csv('Salaries.csv')
salaries

pd.set_option('display.max_columns', None)
pd.set_option('display.max_rows', None)
pd.set_option('display.expand_frame_repr', False)

# ** Check the head of the DataFrame. **

# In[10]:


salaries.head()


# ** Use the .info() method to find out how many entries there are.**

# In[4]:


salaries.info()


# **What is the average BasePay ?**

# In[11]:


salaries['BasePay'].mean()


# ** What is the highest amount of OvertimePay in the dataset ? **

# In[12]:


salaries['BasePay'].max()


# ** What is the job title of  JOSEPH DRISCOLL ? Note: Use all caps, otherwise you may get an answer that doesn't match up (there is also a lowercase Joseph Driscoll). **

# In[9]:


jd_title = salaries['JobTitle'][salaries['EmployeeName'] == 'JOSEPH DRISCOLL']
jd_title


# ** How much does JOSEPH DRISCOLL make (including benefits)? **

# In[11]:


#find TotalPayBenefits where EmployeeName = JOSEPH DRISCOLL
jd_pay = salaries['TotalPayBenefits'][salaries['EmployeeName'] == 'JOSEPH DRISCOLL']
jd_pay


# ** What is the name of highest paid person (including benefits)?**

# In[28]:


max_pay = salaries['TotalPayBenefits'].max()
max_pay
highest_paid = salaries['EmployeeName'][salaries['TotalPayBenefits'] == max_pay]
highest_paid


# ** What is the name of lowest paid person (including benefits)? Do you notice something strange about how much he or she is paid?**

# In[35]:


min_pay = salaries['TotalPayBenefits'].min()
min_pay
min_paid = salaries[['EmployeeName','TotalPayBenefits']][salaries['TotalPayBenefits'] == min_pay]
min_paid


# ** What was the average (mean) BasePay of all employees per year? (2011-2014) ? **

# In[16]:
#salaries['BasePay'].mean()[(salaries['Year'] >= "2001") & [(salaries['Year'] <= "2014")]]
resDF = salaries['BasePay'][salaries['Year'] >= 2001 & (salaries['Year'] <= 2014)]
resDF.mean()





# ** How many unique job titles are there? **

# In[17]:

salaries['JobTitle'].unique()
salaries['JobTitle'].value_counts()


# ** What are the top 5 most common jobs? **

# In[18]:





# ** How many Job Titles were represented by only one person in 2013? (e.g. Job Titles with only one occurence in 2013?) **

# In[19]:





# ** How many people have the word Chief in their job title? (This is pretty tricky) **

# In[20]:





# In[21]:





# ** Bonus: Is there a correlation between length of the Job Title string and Salary? **

# In[22]:





# In[23]:





# # Great Job!
