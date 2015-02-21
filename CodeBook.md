## Description of Variables

 xtrain ,  ytrain ,  xtest ,  ytest ,  subjecttrain  and  subjectest  are the raw datasets.
 XCombined, YCombined, and SubjectData combine the respective tables above.
 features  contains the titles for the column names in the XCombined table and is applied to XCombined and filtered to mean and standard dev variables.
 SubjectData and Activity are then aligned with the main dataset to form the TidyData dataset
 Averages contains the average of the TidyData by Subject and Activity.