#Kindly follow the below steps to draft the Project Report :
# 1. Project Report has to be created in a "single" word document/ PPT / PDF
# 2. Business Scenario
# 3. Expectation /Goals / Objectives
# 4. R Code (Process/Approach)
# 5. R execution Output Screenshots and interpretation
# 6. Results/conclusions

#Prefer Presentation
#section 1: Explain business scenario
#section 2: List down objectives
#Section 3: Summarize Data availabiltiy
#Section 4: Data Exploration/Data Mining Summary>>Answers to obj
#Section 5: Summarize any additional data fields introduced
#Section 6: Statistical algorithm execution
#--Execute every 2/3 lines and highlight the reading of those outputs
#section6: Create summary of models (in case multiple models are built)
#section 7: Result: recall each of the objective and mention conclusion

install.packages("fastDummies")
library(fastDummies)

results = fastDummies::dummy_cols(mtcars,select_columns = "am")
View(results)