\---

date: 2026-07-14

project: AI-in-Healthcare 

status: Completed

tags: `#AI-in-Healthcare`
\---



\# Objective

\- 



\## Key Notes / Progress

\- 



\## Action Items

\- \[ ] 



\## References / Links

\-

# Course 2 : Module 4: Clinical Data : Creating analysis ready datasets from patient timelines

**Sources:** 18 | **Exported:** July 14, 2026

---

## 1. Constructing new features.mp4

### Summary

The text explains that **feature engineering** is the process of refining raw data into more effective variables by applying mathematical operations or logical transformations. This technique often involves converting complex clinical timelines into a **patient feature matrix**, where specific calculations like body mass index or **binary indicators** replace noisy, original data points. By simplifying counts into presence-absence markers, practitioners can create inputs that are far more **robust to outliers** and less prone to misinterpreting administrative artifacts as clinical severity. Ultimately, the source argues that **simple models with well-engineered features** frequently outperform complex algorithms, particularly when working with the nuances of healthcare information.

**Keywords:** Feature engineering, Patient feature matrix, Data transformations, Clinical data modeling, Binary indicators

### Content

As we convert a patient timeline view of the data into a patient feature matrix where a given patient is a row and each column is a feature, we can also perform simple operations on the source data to create new features. For example, by applying a simple formula to height and weight, we can calculate the body mass index. Such construction of new features is called feature engineering. Constructed features are transformations of the original features or their combinations. Simple models with well-gineered features can perform better than fancy models with the original features. This is especially true with clinical data. Let us look at a simple example of feature engineering. Instead of using a count, convert the count into a binary variable that marks where the count is greater than one. While counts are more informative, the binary indicators are more robust to outliers. For example, does making the distinction between seeing two codes for a procedure versus just a presence absence matter. Does two mentions indicate disease severity or does it simply reflect a billing need? If we're not sure, then it is better to do this simple feature engineering.

---

## 2. Dealing with missing values.mp4

### Summary

Instead of discarding incomplete data, researchers can use **imputation** to estimate and fill in absent information based on existing patterns. While **column mean imputation** simply substitutes a missing entry with the average of other patients, more sophisticated techniques utilize **correlations between different features** of the same individual for greater accuracy. For example, **K-nearest neighbors** identifies similar subjects to predict values, whereas **multiple imputation** generates various data versions to account for **statistical uncertainty**. Ultimately, these strategies aim to preserve the integrity of a dataset by making **informed guesses** rather than losing valuable observations.

**Keywords:** Missing value imputation, Column mean imputation, Feature correlations, K nearest neighbors, Multiple imputation

### Content

Let us look at what we can do instead of just removing missing values. One widely used method is to imputee the missing values. Imputation is a kind of prediction that fills in the missing values based on other information in the data set. A simple imputation method called column mean imputation. Replaces the missing value with the mean or the average of the known values in the same column. This assumes that the variables values in the other rows of that column have information about about the missing value which is often not true in medicine. What is the reason to expect that the lab test results of other patients have information about the value of my lab test result? We can use values in other columns of the same patient to improve the imputation procedure. This usually is better than column imputation which considers only values in one column at a time. Here we're now using expected correlations amongst the different features of the same patient to infer the value of the missing feature. For example, knowing the age and weight can allow us to take a guess for someone's height. A procedure called K nearest neighbors imputation fills in the missing values by looking for patients who are similar to the current patient on the basis of other features and then uses those known values to impute the missing one. A modern method called multiple imputation repeatedly invokes imputation to create multiple versions of the data which can be analyzed to provide an Estimate of the vadian or imprecision of the imputed values.

---

## 3. Dealing with too many features.mp4

### Summary

While including extensive data often enhances research, this source outlines why researchers must selectively filter or consolidate information to improve **computational efficiency and model accuracy**. Practitioners should discard **uninformative or redundant variables**, such as constant values or data with high "missingness," to protect **patient privacy** and prevent technical errors caused by highly correlated inputs. To refine the remaining data, one can use **domain-driven aggregation** to group specific details into broader categories or apply **mathematical transformations** like PCA to simplify complex patterns. Ultimately, the goal is to balance the **interpretability of clinical features** with the technical demands of the chosen analysis method to ensure results remain both meaningful and manageable.

**Keywords:** Feature selection, Data redundancy, Patient privacy, Feature aggregation, Knowledge graphs

### Content

We've already discussed that it's often good to use all the features you have. However, there are some exceptions. Here are some reasons you might not want to use all the features that you have. Depending on the data set used, there could be features for each patient which might be useless, such as how many times the record was accessed. Missingness, a feature might be missing for most patients, or sparsity, where a large number of features are missing for a given patient. Redundancy is another reason. Feature one might be high correlated with feature 2 and some analyses do not work well when features are highly correlated. Speed of analysis is also a consideration. Large number of features can slow down the analysis. Depending on the computing resources you have, this could be the dominant constraint. Finally, privacy. Saving more features increases the chance of violating patient privacy. The more you know about a patient, the easier it is to identify them. So, which features should you remove? If a feature is constant, and has the same value for all the patients, then it cannot contribute to your analysis and can be removed. Similarly, a feature that is nearly constant over time might also be a good candidate for removal. If a feature is missing for most patients, then it'll be quite tricky to infer the missing values for so many cases. So, such low prevalence features are also good candidates for removal. Another way to reduce features is to combine features using domain knowledge for a given search question, a feature may make distinctions that are too fine grained for the analysis, such as having specific brand names of drugs rather than the category of the drug. Here we could group drugs by their class, such as non-steroidal anti-inflammatory drugs or NSAIDES. We can also aggregate diseases by their categories. A benefit of such aggregation is that it may remove some idiosyncrasies of how individual sites code features, making cross-sight comparisons easier. Here the aggregation step requires accurate representations of domain knowledge in the form of a knowledge graph which we'll discuss in detail later in this discussion. It is also possible to use mathematical operations to detect and use patterns inherent in the data. Many of these methods such as principal component analysis or PCA use linear algebra. The benefits of using such techniques is that they're domain independent and do not hinge on having specific medical knowledge. The main drawback of mathematically combining existing features is that it makes his derived feature difficult to interpret. The new derived feature set may enable accurate predictions, but the features that contribute to the prediction may not have understandable clinical interpretation. When you're considering reducing the number of features, think about whether the distinctions reflected in a feature are relevant to your question. For example, is Distinguishing the brand name of a drug necessary or does the class of the drug suffice? The more flexible the model you're using in the later analysis stage, the less benefit aggregation will provide. Regressions will benefit more than gradient boosted trees, for example. Reducing the required computational resources provides benefit independent of the choice of the model. So, it is still worthwhile to consider performing aggregation with knowledge graphs that encode prior medical knowledge.

---

## 4. Defining the unit of analysis.mp4

### Summary

Before organizing data for a study, a researcher must first establish the **unit of observation and analysis**, which determines what a single row in a dataset represents. While clinical research traditionally focuses on the **individual patient** as the core entity, other frameworks might prioritize **specific relationships**, such as the intersection between a medication and a diagnosis. This foundational decision dictates the **structure of the data frame**, ensuring that every column properly captures the **distinct features** relevant to that chosen unit. By defining this primary object of study first, investigators can more effectively identify and **extract the necessary variables** from complex records.

**Keywords:** Unit of analysis, Clinical studies, Data frame structure, Feature extraction, Unit of observation

### Content

In clinical studies, the unit of observation and analysis is almost always the patient. So, we want to create a data frame where each row contains all the data for a single patient. Each column contains a different feature. However, there are certainly other possibilities. For example, if we're concerned with the question of what medications are being used off label to treat what diseases, we would use the drug disease pair as the rows with features in the column corresponding to the number of times the drug and disease are co-mentioned, the fraction of times the drug is mentioned right after the diagnosis, etc. in patient records. Once we've decided the unit of observation and analysis, we turn to determining which features to extract from the data.

---

## 5. Examples of features creation.mp4

### Summary

This text explores how specialized data can be transformed into **engineered features** to improve predictive modeling in healthcare. By synthesizing raw medical records into **clinical scoring systems**, such as body mass index or comorbidity indices, researchers can better quantify a patient's **overall disease burden** and illness severity. The author also highlights the value of **proxy features** and keyword extraction to infer missing details like socioeconomic status or lifestyle habits. Ultimately, the passage emphasizes that integrating **clinical intuition**—such as calculating the healing rate of a wound—allows for more accurate risk assessments and more efficient **allocation of medical resources**.

**Keywords:** Clinical scoring systems, Co-morbidity burden, Socioeconomic status proxies, Inferred medical conditions, Clinical feature engineering

### Content

Now, let's talk about some examples of engineered features. Clinical scoring systems, which are simple formulas that combine values found in the EMR, are great examples of engineered features. They're easily computed by clinicians and are typically employed to estimate the severity of a patient's condition. We can use these to construct our new features. The body mass index is a relatively simple example of a scoring system that allows us to estimate the severity of how over under weight someone is. Other scoring systems quantify the overall burden of multiple diseases, often called the coorbidity burden. They're typically used to account for overall patient illness in analyses and avoid comparing sick people to healthy people. Examples are the Charleston coorbidity index and the elixhauser coorbidity index. Among other examples, you can create proxy features for a patient's socioeconomic status from their zip code. and the number of EMR records they have scale perhaps by measure of their overall health as discussed above. You can infer unrecorded conditions such as smoking status by looking at the presence of keywords in the text such as cigarette. In other cases, you could look for specific combinations of drugs and procedures. You can also use clinical knowledge to guide feature engineering. For example, in a wound healing project, we needed to predict whose wound is at risk. for not healing within 3 months. Accurate predictions would allow better allocation of clinical resources. So we created a new feature called growth rate defined as the change in wound size per unit time. This feature captured the clinical intuition that wounds with very slow rates of healing are probably the highest risk of not healing. This feature significantly improved the ability to identify the wounds that were not going to heal in 3 months.

---

## 6. How to choose which knowledge graph to use.mp4

### Summary

To effectively leverage medical knowledge graphs in data mining, researchers must employ a structured framework to evaluate their **conceptual scope, linguistic variety, and external connectivity**. This process involves examining how entities are classified, identifying the range of synonyms provided, and determining how well the graph integrates with other standardized databases. Beyond theoretical assessment, practical utility can be measured by **mapping graph terms against clinical records** to gauge coverage and filter out irrelevant data. Ultimately, these curated resources serve as **essential tools for feature engineering**, provided that practitioners stay current with frequent updates and comprehensive systems like the UMLS.

**Keywords:** Knowledge graph evaluation, Clinical data mining, Entity relationships, Medical terminology coverage, UMLS updates

### Content

Given the number of alternative knowledge graphs available for an entity of interest, for example, ICD for diseases, it is necessary to have a framework to evaluate a knowledge graph for use in your clinical data mining. I encourage you to ask the following questions. First, what are the entities that the knowledge graph has and what is the basis of classification? What is the meaning of the relationships in the graph? Second, what words are used to Name the entities in the graph. Are there synonyms or alternative names and spellings? Third, is the knowledge graph mapped to other knowledge graphs? How connected a knowledge graph is with other knowledge graphs is a very useful property. Aside from these three principled questions, there are some practical approaches for assessing the utility of a knowledge graph. For example, given data from an EMR, you can count the number of terms from each knowledge graph that are mentioned in the textual documents in the medical record. This will give you a sense of the coverage of the knowledge graph for your corpus. In addition, if the knowledge graph is too big with millions of terms, you can use these counts of term occurrences to help decide which terms you want to keep. Knowledge graphs are also periodically updated. For example, the National Library of Medicine releases updates to the UMLS four times a year. In summary, knowledge graphs are large, highly curated collections of medical entities, alternative names of those entities, and the relationships between them. They're an extremely important source of medical knowledge for creating features and for processing clinical text, which we'll discuss later. If you're engaged in clinical data mining and have not yet accessed the unified medical language system or UMLS, then look it up right away.

---

## 7. How to create features from structured sources.mp4

### Summary

While medical information exists in many forms, this source focuses on the **utilization of structured healthcare data** typically housed in relational databases. To make this information actionable, analysts must **extract and integrate data** from various tables using tools like SQL and common programming languages. The process requires a series of **refining steps**, including managing missing values, standardizing variables, and merging disparate records through unique identifiers. Ultimately, the objective is to **transform raw tabular information** into a clean, reshaped format suitable for advanced feature engineering and statistical analysis.

**Keywords:** Structured healthcare data, Database querying, SQL, Feature engineering, Missing data management

### Content

Healthcare data can be structured as in have a consistent organization in the form of a table with rows and columns or can be unstructured such as clinical text, images, and signals. The most commonly available data in healthcare are drawn from structured sources such as tables and databases. The main steps in using such data are accessing the structured data, standardizing features, dealing with too many features if that's a problem, dealing with missing data, and perhaps constructing new features. Structured data generally reside in database tables. Databases are queried using SQL or structured query language and the results can be loaded into R, Python or other programming languages for analysis. Data in different tables may be linked using a database operation called a join which aligns all the data using a unique identifier. The data may need to be reshaped into a usable format. We won't be explaining the mechanics of accessing structured data because most of you will be familiar how to access structured data in tabular form.

---

## 8. Intro to Clinical Data Study Guide - M4.pdf

### Summary

This study guide outlines the process of transforming disorganized medical records into a structured **patient-feature matrix** suitable for machine learning and clinical analysis. The text details essential preprocessing steps such as **standardizing data scales**, managing **missing values** through various **imputation** techniques, and the strategic removal of features to protect **patient privacy** or improve computational speed. A significant portion of the material focuses on **feature engineering**, where raw data is creatively combined—often using **clinical scoring systems**—to reveal deeper health insights. Finally, the guide introduces **knowledge graphs** as vital tools that provide a standardized medical vocabulary, helping researchers link diverse data sources by defining the **hierarchical relationships** and synonyms of complex medical entities.

**Keywords:** Patient-feature matrix, Feature engineering, Missing data imputation, Knowledge graphs, Data standardization

### Content

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQGxxv_R8cZyH52XuwFCrtZ1O5C-hWQCgweJXGrTWU686tNSjvfCIJoyu0-OeIDbCfvgSFvg6QFzUIpSd7I3ISIiyZhuxHpZP6SyWevOKZrEZmg3DZx-8AapDJXLrO6DN6vRPUIa6g=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQF28-rTKdaRRb2VflYibvWTZyzBz3CcL3HTcHy4fwC_JaIppn128_FsxuMLf6hgzRv2gbSW-AGIPHdPWUsL7ORiijSzkr4a_Vv-ZYRtuTL2QOzNPNp6rZPloS7LMuwjrsoVWAWhFg=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQEqWjXlYEJfd3HZ7254Egv-JgkS_PMS8ZU90JETUm2pphCIQUhDjKw5hATo29ZM-GrIuvPqpLYw4ceF9pHtW6CjAMWjVRmceGUmZrbCoQZtqTy6bM9n5UgwqibQYROj0WkxScWk6g=w1280-h563-v0)

 Copyright © Stanford University INTRO TO CLINICAL DATA STUDY GUIDE MODULE 4 – CREATING ANALYSIS READY DATASETS FROM PATIENT TIMELINES LEARNING OBJECTIVES 1. Identify the key steps in converting messy clinical data into the tabular shape used in machine learning 2. List some factors that guide the decision to include or exclude a feature 3. Describe what is meant by missing data and explain ways to address it 4. Describe the goal of feature engineering 5. Define what a knowledge graph is, and give an example of one 6. Explain how a knowledge graph can help in analyzing clinical data CREATING FEATURES TO ANALYZE In this conversation, we'll dive into the construction of a patient-feature matrix that is the foundation for all subsequent analyses. The patient-feature matrix contains data about patients in a tabular format. The data for a given patient occupies a single row. Each column is a different measurement or feature. [Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQEE8jXupEbI4n9vWwItHw9fRjEXGXSwZ8on68kKDwrqXBZNIoUBD6Leuxj1R66LckSTS2DrnBt7s-918fTqHL4EvqmKUzvNgEElBWI8jCptDCkT3lCGoTPbPBd8dsstxICq75GzwA=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQE8HI87U-8unNyl1stjOlQdzdVqsng5PeOSRjpBkpsywUtN-TNPTCS4ZGwenpBEc3hEuHrzr9cALUF_teaoq-rNuwhlX5g8LITJhLbAImHncizLn15zawDdaSKz_CKti4JWiYkB1g=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQGQ1p-HFiXEyG3EHAE3-87hmmYIy7yxQgpeUmk6y1y4b5I7_ZZuyrXrBf612gKG2qrBBF1ymf-8elxys0-g8A-_casXHGJEHJLEwG_Uvegz4U6mrotm_RNh7VdA34LFThJASk6g=w1280-h561-v0)

 Copyright © Stanford University In clinical studies, the unit of observation and analysis is almost always the patient. In the data frame, each row contains all the data for a single patient. Each column contains a different feature. Once we have decided the unit of observation, and analysis, we turn to determining which features to extract for the data. It is best to start with all the features. If there are constraints on computing resources, then you may need to remove features to reduce the size of the dataset. Some modern machine learning methods can automatically remove those features that contribute the least to the accuracy of the model. Important: You may need to remove some sensitive features for patient privacy. We can use subtle information implicit in the data to help us craft features. Metadata, data that refers to other data, can be quite informative. Example: We need to determine who is a diabetic. Ideally we would look at the results of a test such as the HbA1C. However, we can also use the counts of orders of laboratory tests that have something to do with measuring glucose instead of the actual results of those tests. So, we used the metadata -- the number of times a test related to measuring glucose is ordered -- and some prior knowledge that diabetes mellitus is a disease where glucose levels get messed up to craft a feature (percentage of tests that are about glucose) which informs us whether someone is a diabetic or not. Usually such features are created, or engineered, by using some prior knowledge. It is also possible to learn such features via computation. Healthcare data can be structured or can be unstructured. [Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQHArEpbYjQZG-GkN-3tsddhXGbMZXy8Q5Hg-vTjiTYCbd9996PcSTd4gLHWtDrU_f1ZwnY_KO6OVkwEvuAIiUPaHp_XMd_Z552txRQ86Cpi9HDGS45y9CaKQHf8mt37WMfZFp1Jkg=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQHHePf92BrH_RkIyWzzqcsdHmwPKp8_-WiGNRvuq3VVeGbwTtNvkwyUjeCxz3Qv1Cs6buv7dsYCFus_OJohSo5kGrSAxRiuWhKLakD4J4faK5RPOCl9B4BUzvYn3ppR-I2UoEioZw=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQFl0DzJ4tNZ2Vaio8VWNAe2Pz8JoQ5UVvDcbrLh2lAGWXYQQWNJeeiKuWxHPHgIow1DMhrnDtjNaI73LYzaFOivOf-rVV8r_9tG4UdwhRekvbOIXVTsze8dDgjtver8haWDkRAXjw=w1280-h539-v0)

 Copyright © Stanford University Making datasets from structured sources: 1. Accessing structured data 2. Standardizing features 3. Dealing with too many features 4. Dealing with missing data 5. Constructing new features Structured data, generally reside in database tables. Databases are queried using SQL (Structured Query Language) and the results can be loaded into systems for analysis. Data in different tables may be linked using a database operation called a “join”. The data may need to be reshaped into a useable format. It is common to standardize features, which transforms all features into a common numerical range. The process of standardizing is sometimes called normalizing. Standardization facilitates later analysis by reducing the effect of values that are extremely large or extremely small relative to other values in the dataset. A commonly used transformation rescales each column so it spans the same range, often 0 to 1. Another transformation is such that the column has an arithmetic mean of 0 with a standard deviation of 1. Reasons why you might not want to use all of the features: Some features might be useless Missingness: A feature might be missing for most patients Sparsity: A large number of features are missing for a given patient Redundancy: Feature1 might be highly correlated with Feature2[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQH7NDIppHRdSVdnTdAXOVFODtBMU7JKjCI7HYu40yf00C9TTepERBfFTanZ6WaLtoDXTNL-Av7El274bAqBt8_3Pwpo362B3_cxyvBGEYxaXZSudWcsXiJxfKLPbsjd-M5r2WuK=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQE1uKHcY75xeECdj5XmR-E39a-ezBT0rMo92hzMxKXywJTwQ3P7YansC_nkmYcBJY6YBT5-MqKF9uiMRaUQoSWgN9-VpDbgCtmtJZxF0UAfUr0hmuioRz-t0StCAiR0oTUjLPbWNA=w600-h73-v0)

 Copyright © Stanford University Speed: Large number of features can slow the analysis Privacy: Saving more features increases the chance of violating patient privacy Low-prevalence, low-variance features are good candidates for removal. Another way to reduce features is to combine features using domain knowledge. A benefit of such aggregation is that it may remove some idiosyncrasies of how individual clinical sites code features, making cross-site comparison easier. The aggregation step requires accurate representations of domain knowledge in the form knowledge graphs. It is also possible to use mathematical operations to detect and use patterns in the data. Many of these methods, such as principal components analysis (PCA), use linear algebra. The benefits of using such techniques is that they are domain-independent and do not hinge on specific medical knowledge. The main drawback of mathematically combining existing features, is that it makes the derived feature difficult to interpret. The new derived feature set may enable accurate predictions, but the features that contribute to the prediction may not have understandable clinical interpretation. When you are considering reducing the number of features: Think about whether the distinctions reflected in a feature are relevant to your question The more flexible the model you are using in the later analysis stage, the less benefit aggregation will provide. Regressions will benefit more than gradient boosted trees Reducing the required computational resources provides benefits independent of the choice of model MISSING VALUES When we convert a patient timeline view of the data into a patient-feature matrix, naturally some entries in this matrix will be missing. Missing Data: In prospective studies, when a value for a data element is missing, it is reasonable to assume that it should have been recorded but was not. However, in data that are a byproduct of routine care, just because there is a place in a user constructed patient-feature matrix, does not mean that the value should have been recorded The absence of a specific value in a column of patient feature matrix could mean three things: 1. The value should have existed, but does not (the usual meaning of missing data) [Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQGkWS5Kw3c3bOr5QIxbYCQlyskel5EMjD6-dFMsJy586gw3HdshMwCnOB2g3Yk1jq3si4P3YXXTY-E78_urTe9ZgxHF3osewfLXT_niAMIgCXYIJLloInvVgxH5tygOjYHxOGZFHQ=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQHFNuYhoKJnSpl-AikgUVGjgmQXJm-_H4B721HWaOAoVEbLBSal_6EJS7eqG8_pvA1wVWvUKL3deb-OzdJqSs1HxiZyQ7UPmXR5qw1wN9XBlwHBFTfh6YhMIjgo-KlLx_MCMAII6w=w600-h73-v0)

 Copyright © Stanford University 2. The value not being present is an artifact of adopting a tabular view of the data 3. The value could have existed, but was deemed unnecessary to collect Absent values create problems for analysis in two ways: 1) From how they are reported 2) If they were truly ‘missing data’, then from how they are imputed Some systems allow for a special data element, often written as "NA" or “null”, to represent a missing value. Other systems might use numerical values that are outside the range of possible values for that feature, such as 0 or -999, to denote a missing value. Removing patient records with missing values a tempting and simple solution, but it often creates problems. Removing patients with a missing value would tend to remove under represented patients from dataset. This would bias our analysis. Dealing with missing values One widely used method is to impute the missing values. Imputation is a kind of prediction that fills in the missing values based on other information in the dataset. A simple imputation method, called column mean imputation, replaces the missing value with the mean of the known values in the same column. This assumes that the variable’s values in the other rows of that column have information about the missing value, which is often not true in medicine. We can use values in other columns of the same patient to improve the imputation procedure. This is usually better than column imputation which considers only values in one column at a time. We are using expected correlations among different features of the same patient to infer the value of the missing feature. A procedure called k-nearest neighbors imputation fills in a missing cell by looking for patients who are similar to the current patient on the basis of other features, and then uses those known values to impute the missing one. A modern method called multiple imputation, repeatedly invokes imputation to create multiple versions of the data, which can be analyzed to provide an estimate of the variance in the imputed values. Making a decision on whether to remove missing values or to impute: [Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQEKwzx9g3iyWIWvkesGn4U-pZIks_FwFEL44FoLVZbyzWiGoLmmB2o1bG8K_FwtqZH3P2CNlsNJUWOnzg50OwB964pyBm5Re4KTdINDjdDko_a-cdZVfQDselwPwIfP4nZ-0zh6=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQHGg_tV6ttITYP-WRS0uR-jGm3nduUQJBRzvgtXHoR7NFTPyZ31LAETG8xhJjYGNMcp2brDDEVxt7KObPEH2eLrBznFqQ6KskgxaxDrQjtbEiBcrTDFoIJeNa4ZLbgpA4eqAsmabA=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQEwgnRGWIAKHCwerVGFXeuKU0HPfnTKGH0xEdAmCHU_nnYAnmaaNxnrnvW-Agqsy5TjJNpVcbtVecvLGSfNYjKwkZIO66TvCpCtdVH1ZipAGum8obMn81q-AB5jU3T5_ij7JZdFsw=w1280-h440-v0)

 Copyright © Stanford University If a variable is mostly measured with only a few missing values, then you should consider imputation If a particular variable has mostly missing values, then you should consider dropping the variable. That variable does not contribute useful information for most patients, and we would have to impute the values for most patients. If the distribution of missing values is in middle-zone between these alternatives, some experts have advised adding indicator variables to mark which values have been imputed, but this recommendation has been disputed by others. From a practical perspective, it may be better to use an analysis method that naturally handles missingness rather than imputing the missing values. Finally, think about how important the feature with missing data is to your question. Could you avoid imputation by answering the question without considering that variable? CREATING NEW FEATURES As we convert a patient timeline view of the data into a patient-feature matrix, we can also perform simple operations on the source data to create new features. Such construction of new features is called "feature engineering". Constructed features are transformations of the original features or their combinations. Simple models with well-engineered features can perform better than fancy models with original features. Examples of engineered features [Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQE2kvLb8GbAatD3_SHzb8NTMKS8QSawoGbueT0qEvyyFCendfeJZDTReYyM3ybGXjDNK5t8gg7Znb8UtSRTpVRwx4DQcCytgEPTNEwZ9wqkjOLrI_BSNa480QJXYz9frw8lJxwB_A=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQH8JHUfVv51u1N1gzq_rIfkX1uJelfdEBMAFwQkvpq0PZan8IfRMUMmVQiLuvSzS6dvJ7PhBFBpuHqEMqWI_Fxa6JvkCYtjRvHHuRFwi2ik6_6wexXoTaa3VzcfxRvKQaKkOndeWg=w600-h73-v0)

 Copyright © Stanford University Clinical scoring systems, simple formulas that combine values found in the EMR, are great examples of engineered features. The body mass index is a relatively simple example of a scoring system that allows us to estimate the severity of how over or underweight someone is. Other scoring systems quantify the overall burden of multiple diseases; often called the comorbidity burden. They are typically used to account for overall patient illness in analyses and avoid comparing sick people to healthy people. Among other examples: Create proxy features for a patient's socioeconomic status from their zip code, and the number of EMR records they have, scaled by a measure of their overall health discussed above. Infer unrecorded conditions, such as smoking status, by looking for the presence of keywords in text, such as “cigarette”. In other cases, could look for specific combinations of drugs and procedures. Can also use clinical knowledge to guide feature engineering. General Advice for Feature Engineering: Think about what features might be important but are not directly measured Take advantage of pre-validated clinical scoring systems When creating a new feature, consider including counts, differences, change over time, and ratios of existing measurements Lean towards creating new features using some clinical knowledge and creativity Balance the benefit from building new features against the effort used to create them Deep learning: A new method in machine learning that uses more than conventional amounts of raw data and builds the needed features without domain knowledge Creating analysis ready datasets from patient timelines Structured data in database tables can be transformed into analysis ready datasets called patient feature matrix The number of features in the patient feature matrix can be reduced by aggregating features using domain knowledge, or by using mathematical techniques such as principal component analysis Missing data can be removed, or imputed with different levels of methodological sophistication Consider creating additional features from the original data [Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQHBx9btaLvBBZEEVlfcCYJXkvplnRVmrxU3QaKXkqUK8soth6IeYV5iucbkgpwKOHH9_gXevHNGVLq8WSlkujXuJZYUkQl0JAGmjs9h6979rcST9KKJsUZCzgJoIWYczVTIr4f-2A=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQFyGkjy6my0YB8ZYmQQuGHiiL2Nx03ORYTG0aYOwR6joyzeIt0glMRSmaTbXwovMW-EkDnOROGZUEerm-AvkK89-3GsjN0QpJ2C2o6XhMAG6UuM_84Utj9k2qK2Rd0VwEDpi7uE6w=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQFh0SF1FS_pLum3oE3W1bVllJ2Qj0R7HH46F_68nhb0seOeUhi_VnDJQajDZBvBqVNU8jWHGJMmC8h7lv-9No7MkwY0E_xK-OmDDR9Gp_sFOVw_qzVR7E3Szg3cdgOnm6oZiU09=w1280-h725-v0)

 Copyright © Stanford University KNOWLEDGE GRAPHS A knowledge graph is a declaration of what entities exist in a domain and the relationships among them. It is also referred to as an ontology. Ideally represented in digital form. A common problem when working with clinical data is that there are multiple ways to express the same concept. Knowledge graphs can help because they explicitly represent synonyms of entities and the relations among different entities. So what exactly is in a knowledge graph? 1. They contain entities. 2. There are sets of equivalent names for those entities, or synonyms. 3. There are relations between the entities. A very common relation represents "is a kind of" o This ‘kind of’ relationship in Knowledge graphs is the most important because it codifies what is a kind of what in the medical domain. Entities will inherit properties from the entities they are a kind of. 4. Contain links to other knowledge graphs. This can provide a consistent way to refer to entities across different data sources Knowledge graphs are extremely useful when querying clinical data. They help identify different terms with the same meaning. There are hundreds of knowledge graphs available in medicine and in biological research. If you want to explore the many knowledge graphs available, check out the BioPortal from the National Center for Biomedical Ontology at Stanford. [Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQHnAUtRaa516hkRjeR_Ob55fS9w8AS0Fd7tBNzbrwFkTwm4H27EjhqQ-2D1deczTOlvJWkkveiRg6SC0jn14SNNepr2khzG7q1YXTKOfAndmr9BveBFCTb-jBBPzvDso_QSW5yFtw=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKXwDQGSD2dg5a6K7P0__HFIfUjeumP8I6UEagKyCDYxJbOOhndTJ1zm3_RJNh6SHHacKBeshlUDAZD81xZFNST3yz05mOeC1mtP6Z95bRV4RLq1_5e_wKOP-5UeKZTKAujj5fo7CvPE=w600-h73-v0)

 Copyright © Stanford University Important Knowledge Graphs: International Classification of Diseases (ICD-10. ICD-9) The Current Procedural Terminology (CPT) RxNorm and RxNav provided by the US National Library of Medicine (NLM) Anatomic Therapeutic Chemical (ATC) Classification System The Logical Observation Identifiers Names and Codes (LOINC) The Unified Medical Language System’s metathesaurus, or the UMLS metathesaurus, is a union of over 140 knowledge graphs. It contains all of the knowledge graphs we have just mentioned, along with declarations of relationships between these knowledge graphs. Questions to evaluate a knowledge graph: 1. What are the entities the knowledge graph has, and what is the basis of classification? 2. What words are used to name the entities in the graph? Are there synonyms and alternative names? 3. Is it mapped to other knowledge graphs? How ‘connected’ is a knowledge graph with other knowledge graphs? Aside from these three principled questions, there are some practical approaches to assessing a knowledge graph. For example, given data from an EMR, count the number of terms from each knowledge graph that are mentioned in EMR text documents. In addition, if the knowledge graph is too big, with millions of terms, you can use the counts of term occurrences to help decide which terms to keep. In summary, knowledge graphs are large, highly curated collections of medical entities, alternative names of those entities, and relationships between them. They are an extremely important source of medical knowledge for creating features and processing clinical text.

---

## 9. Main points about creating analysis ready datasets.mp4

### Summary

Converting raw medical databases into **analysis-ready datasets** requires a strategic transformation of patient timelines into a structured feature matrix. To ensure this data is manageable and accurate, researchers must **reduce complexity** through expert domain knowledge or mathematical modeling while carefully addressing the challenge of **missing information**. The process is not merely technical; it demands the **active creation of new features** to uncover deeper insights. Ultimately, the quality of your results depends on a deep **integration of biological and medical understanding** to guide your data preparation.

**Keywords:** Analysis ready datasets, Patient feature matrix, Feature aggregation, Missing data imputation, Domain knowledge integration

### Content

Now let's summarize the main points about creating analysis ready data sets from patient timelines. Structured data in database tables can be transformed into analysis ready data sets. Basically our patient feature matrix using widely available programming tools. The number of features in the patient feature matrix can be reduced by aggregating features using domain knowledge or by using mathematical techniques such as principal component analysis. Missing data can be removed or to impute it with different levels of methodological sophistication. While creating analysis ready data sets, you should consider creating additional features from the original data. Your effectiveness in doing all of these tasks will increase by learning about the relevant biology and medicine pertinent to your medical question.

---

## 10. So what exactly is in a knowledge graph.mp4

### Summary

A medical knowledge graph functions as a sophisticated map that organizes healthcare data through three primary layers: **foundational entities**, their **synonymous labels**, and the **hierarchical relationships** that connect them. By explicitly linking clinical terms, such as mapping brand-name drugs to their generic counterparts, the system ensures that different words for the same concept are recognized as identical. The most critical feature is the **logic of inheritance**, which allows the graph to automatically understand that a specific condition or medication belongs to a broader category with shared properties. Ultimately, these interconnected frameworks serve as **essential tools for data retrieval**, enabling researchers to accurately identify patient groups even when medical records use inconsistent terminology.

**Keywords:** Medical knowledge graphs, Domain entities, Equivalent names, Entity relations, Data querying benefits

### Content

So what exactly is in a knowledge graph? First, they contain entities. For our purposes, the entities are from the medical domain. Medical knowledge graphs typically include symptoms, diseases, medications, treatments, body parts, and so on. Second, there are sets of equivalent names for those entities or synonyms if you will. For example, heart attack and acute myioardial inffection mean the same thing. Most medications have at least two names. the brand name and the genetic name. These equivalences are explicitly represented in the knowledge graph. Third, there are relations between the entities. A very common relation is the kind of or is a kind of diarrhea is a kind of gastrointestinal disease which itself is a kind of disease. Lipur is a lipid-lowering drug and so on. This kind of relationship in knowledge graphs is the most important one because it codifies what is a kind of what in the medical domain entities will inherit properties from the entities they are a kind of. So if lipidor is a kind of a lipid-lowering drug everything that is true for lipid-lowering drugs should be true for lipiore. In addition if a patient is on lipore the patient is also on a lipid-lowering drug. Similar relationships can be declared for diseases so that diarrhea is a kind of gastrointestinal disease. Then if the patient has diarrhea then they have a gastrointestinal disease. Finally, a knowledge graph may also contain links to other knowledge graphs that provide a consistent way to refer to entities across different data sources. For example, metformin is a drug that treats diabetes. Knowledge graphs are extremely useful when quering clinical data. They help identify different terms with the same meaning, which would in turn help find all patients with diabetes or Everybody taking an anti-allergy medication, for example.

---

## 11. Standardizing features.mp4

### Summary

Standardizing features is a fundamental preprocessing technique used to align diverse datasets into a **uniform numerical scale**. By transforming data into a **consistent range**, such as zero to one, researchers can prevent extreme outliers or mismatched measurements from **skewing the accuracy** of mathematical models. This refinement process is essential because it ensures that various variables are treated with **equal importance** during analysis, rather than allowing one large-scale column to dominate the results. Ultimately, creating a **harmonized data structure** through zero-mean or fixed-range scaling leads to more reliable and precise computational outcomes.

**Keywords:** Standardizing features, Feature normalization, Numerical range, Data transformation, Scaling distance measures

### Content

It is common to standardize features which transforms all features into a common numerical range. The process of standardizing is sometimes also called normalizing. Standardization facilitates later analysis by reducing the effect of values that are extremely large or extremely small relative to other values in the data set. For example, if the data in different columns span wildly different numerical ranges, then using a distance measure in a later step may produce a unusual or incorrect results. A commonly used transformation rescales each column so that it spans the same range, often 0 to 1. Another transformation is such that each column has an arithmetic mean of zero with a standard deviation of one.

---

## 12. Structured knowledge graphs.mp4

### Summary

This text explores the utility of **knowledge graphs**, also known as ontologies, which serve as expert-curated digital maps defining the **entities and relationships** within the medical domain. By formalizing human expertise into a machine-readable format, these tools help researchers overcome the complexity of clinical data, such as **reconciling synonyms** or grouping specific brand-name drugs into broader therapeutic categories. Ultimately, the source illustrates how integrating this **structured prior knowledge** allows for more sophisticated data analysis, such as identifying a patient's condition based on the types of lab tests ordered rather than just the raw results.

**Keywords:** Patient feature matrix, Curated biomedical knowledge, Knowledge graph structure, Clinical data ontologies, Entity relationship mapping

### Content

Of the two topics for this module, constructing a patient feature matrix and using curated biomedical knowledge in the process. We just finished talking about creating features. In that discussion, we saw how using some prior knowledge helps. Now, let's review what sources of curated biomedical knowledge exist and how we can use them. First, let me introduce a new term, knowledge graph. A knowledge graph is a declaration of what entities exist in a domain and the relationships among them. It is also often referred to as an ontology. A knowledge graph is ideally represented in a digital form so it can be searched and processed by a computer. Knowledge graphs are comprehensive for the domain and constructed by experts. However, creating a knowledge graph is quite labor intensive. In our discussion, we alluded to prior knowledge a couple of times. The two specific instances are when we thought of using the counts of orders of laboratory tests that have something to do with glucose. instead of the actual results of those tests and using the number of times a test related to measuring glucose is ordered to help us decide whether someone is diabetic or not. How do we know that the hemoglobin A1C test is a test that measures glycated hemoglobin and that it is a test that is most commonly done for diabetics or for that matter that diabetes is a disease of glucose metabolism. In another example, we discuss grouping specific brand names of drugs into category of drugs such as non-steroidal anti-inflammatory drugs or NSAIDs. A knowledge graph of medicine would tell us that diabetes is a disease with abnormal glucose metabolism which in turn is a kind of metabolic disorder. A knowledge graph would tell us that alie contains ibuprofen as an ingredient which is a non-steroidal anti-inflammatory drug. A common problem when working with clinical data is that there are multiple ways to express the same concept. Now, Graphs can help because they explicitly represent synonyms of entities and the relationships amongst the different entities.

---

## 13. Summary recommendations for missing values.mp4

### Summary

Navigating the challenge of incomplete data requires a strategic balance between **imputing missing entries** and **removing unreliable variables**. While filling in gaps is suitable for datasets with minimal missingness, variables dominated by empty fields should generally be discarded to avoid **unwarranted assumptions** and excessive computational costs. Because complex imputation can double the complexity of a project for only marginal gains, researchers are encouraged to prioritize **essential features** or utilize analytical models like **classification trees** that manage gaps naturally. Ultimately, the goal is to ensure that the method of handling data loss does not compromise the **integrity and practical utility** of the final analysis.

**Keywords:** Missing value imputation, Data removal criteria, Statistical analysis methods, Feature importance assessment, Imputation challenges

### Content

Some of this can get complicated and you should consult with a bio statistician when performing imputation of missing values. Given these issues, is it better to remove missing values or to impute them? It is difficult to give broad guidance that is invaluable. However, generally speaking, if a variable is mostly measured with only a few missing values, then you should consider imputation. If a particular variable has mostly missing values, then you should consider dropping the variable. That variable does not contribute useful information for most patients and we would have to impute the values for most patients which is tricky. If the distribution of missing values is somewhere in the middle zone between these two alternatives then it's hard to give general advice. Some experts have advised adding indicator variables to mark which values have been imputed but this recommendation has been disputed by others. In addition, keeping track of what is imputed and what was recorded almost doubles the feature space. So missing data are a challenge and imputation is not a perfect solution. Analysis is difficult when the data are already sparse. The more missing data there are, the harder it is to impute them. Imputation methods make assumptions about the data which may not always hold. From a practical perspective, it may be better to use an analysis method such as classification trees that naturally handle missingness rather than imputing the missing values. Relative improvements in accuracy are often small compared to the computational cost of the imputation. Finally, think about how important the feature with the missing data is to your question. Could you avoid imputation by answering the question without considering that variable?

---

## 14. The origins of missing values.mp4

### Summary

In medical research, transforming patient histories into structured tables often creates blank entries that represent **informative patterns** rather than mere errors. While some data is truly lost, other gaps are **structural artifacts** of the matrix format or **deliberate clinical choices**, such as a doctor deciding a specific test was unnecessary for a healthy patient. These missing markers are often obscured by **ambiguous reporting methods**, such as using "null" or placeholder numbers that can confuse analysis. Ultimately, researchers must avoid simply deleting incomplete records, as this can **introduce systemic bias** by inadvertently excluding vulnerable populations whose life circumstances prevent regular data collection.

**Keywords:** Missing data origins, Patient feature matrix, Data collection bias, Imputation challenges, Analysis representation bias

### Content

When we convert a patient timeline view of the data into a patient feature matrix where a given patient occupies a single row and each column is a feature, naturally some entries in this matrix will be missing. What does missing data mean in this context? In prospective studies, when a value for data element is missing, it's reasonable to assume that it should have been recorded but was not. However, in data that are a byproduct of routine care, just because there's a place in a user constructed patient feature matrix for a value does not mean that the value should have been recorded. Therefore, the absence of a specific value in a column of our patient feature matrix could mean three things. The value should have existed but does not. The usual meaning of missing data or the value not being present is an artifact of adopting a tabular view of the data. For example, if we imagine that the different disease codes to be columns and record a one if the patient has the disease then for most patients the majority of the columns will have absent values because the patients only have few diseases. The third possibility is that the value could have existed but was deemed unnecessary to collect. For example, a test measuring troponent proteins in the blood is often used to detect a heart attack. When creating a data set for a question such as diabetes treatments associated with low blood sugar in patients with high blood pressure. Some patients will have this value and others will not. Those that do not probably didn't need the test. Meaning that the fact that the value is missing is a deliberate choice and is informative in itself. Such absent values create problems for analysis in two ways. One, from how they're reported in the data, and two, if they're truly missing, then from how they're imputed. Some systems allow for a special data element, often returned as a NA or null, to represent a missing value. Other systems might use numerical values that are outside of the range of possible values for that feature, such as stoing a zero or a minus 999 to denote a missing value. A numerical value, if used, needs to come with documentation that those values are actually a marker for missingness and are not a possible value. For example, is the presence of a zero, a stated absence of the feature or was it measured to be zero value. Removing patient records with missing data values is a tempting and simple solution, but it often creates problems. So, here's an example. A homeless diabetic patient may find it difficult to get to the clinical laboratory for blood tests, so they'll have more missing lab values. But being homeless also puts them at risk for other medical conditions. Removing patients with a missing value would now tend to remove homeless patients from our data set. This would under reppresent such patients and bias our analysis.

---

## 15. Turning clinical data into something you can analyze.mp4

### Summary

This course focuses on the systematic process of **transforming disorganized clinical information** into a structured format suitable for rigorous scientific inquiry. The core objective is the creation of a **patient feature matrix**, a tabular arrangement where individual rows represent distinct patients and columns capture specific medical variables. By exploring how to **extract, filter, and handle missing data**, the curriculum demonstrates how raw timelines are refined into actionable datasets. Furthermore, the lesson integrates **curated biomedical knowledge graphs** to ensure that the resulting features are both accurate and clinically meaningful for answering complex healthcare questions.

**Keywords:** Patient feature matrix, Clinical data analysis, Feature extraction, Biomedical knowledge graphs, Unit of analysis

### Content

Our overall goal in this course is to discuss how to convert messy clinical data into a form that facilitates analyses to answer our questions. So far, we've discussed the sources and types of healthcare data and the value of representing events on a timeline. We have mostly adopted a patient timeline view of the data with an occasional detour into viewing the data as a feature matrix. In this conversation, we'll dive into the construction of a patient feature matrix that is the foundation for all subsequent analyses. The patient feature matrix contains data about patients in a tabular form. The data for each given patient occupies a single row. Each column is a different measurement or feature. We'll talk about two related topics. First, we'll discuss which features we might want, how to get them, what to do if there are too many of them, and what to do if they're missing. We will also discuss the impact of the transformation methods and the answers we get to our clinical questions. Then, we'll review how to produce collections of curated biomedical knowledge called knowledge graphs or ontologies to help in the extraction and construction of features from clinical data. To discuss these two topics, constructing a patient feature matrix and using curated biomedical knowledge in the process, we first need to define the unit of analysis.

---

## 16. Using features and the presence of features.mp4

### Summary

When constructing machine learning models, researchers should ideally incorporate a **vast array of features**, only pruning them to manage computational costs or protect **sensitive personal data**. A sophisticated approach to data science involves **feature engineering**, where one leverages **metadata**—such as the frequency of a specific medical test rather than its result—to infer deeper health insights. By combining **prior knowledge** with these subtle data markers, analysts can craft powerful indicators that reveal hidden patterns, like identifying a chronic condition through behavioral footprints. Despite the potential for high-dimensional complexity, current industry standards often rely on a **surprisingly small number of variables**, leaving significant room for future experts to push the boundaries of **big data analysis**.

**Keywords:** Feature extraction, Metadata utilization, Feature engineering, Patient privacy, Risk prediction models

### Content

In general, it will be possible to extract hundreds or thousands of features. Should we use all of them? Generally, yes. It is best to start with all the features. If there are constraints in computing resources, then you may need to remove features to reduce the size of the data set. Some modern machine learning methods can automatically remove those features that contribute the least to the accuracy of your final model. Note that you may need to remove some sensitive features such as HIV status for the sake of patient privacy. We can use subtle information implicit in the data to help us craft features as well. For example, the distinction between the act of ordering a lab test from the recording that measured the value of the test. The variable marking the recording of the test is an indicator variable. It is a kind of metadata. That is data that refers to other data. Metadata can be quite informative. For example, let's say we need to determine who is a diabetic. Ideally, we look at the results of a test such as the HBA1C measurement. However, we can also use the counts of the orders of laboratory tests that have something to do with measuring glucose instead of the actual results of those tests. So, for example, if 80% of all laboratory tests ever done for a patient in an outpatient setting have something to do with measuring glucose, that is a hint that the person may be a diabetic. So, we've used the metadata, the number of times a test related to measuring glucose is ordered and some prior knowledge that diabetes malitis is a disease where glucose levels get messed up to craft a feature the percentage of tests that are about glucose which informs us whether someone is diabetic or not. Usually such features are created or engineered by using some prior knowledge. It's also possible to learn such features via computation. As we begin our exploration of creating analysis study data sets. Let us first get a handle on how many different features do researchers currently use. In one study from 2017, the median number of features used in risk prediction models built with EMR data was 27. The median number of samples was 12,000. These numbers may be smaller than what you might expect given the prevalence of discussions about big data. Perhaps after completing this class, you can perform analyses that change the status quo.

---

## 17. What are important knowledge graphs.mp4

### Summary

This text outlines the essential **knowledge graphs** used to standardize and organize medical data for clinical research and analysis. It details specialized classification systems that categorize everything from **disease diagnoses** and **surgical procedures** to **pharmaceutical ingredients** and **laboratory observations**. The primary purpose of these tools is to provide a universal language for healthcare, a goal that culminates in the **UMLS Metathesaurus**, which merges over 140 distinct sources into one comprehensive network. By understanding these frameworks, researchers can effectively bridge the gap between raw patient information and actionable **clinical data mining**.

**Keywords:** Medical knowledge graphs, Disease classification systems, Drug naming standards, Medical procedure coding, UMLS metathesaurus

### Content

There are hundreds of knowledge graphs available in medicine and in biological research. We'll focus here on some of the largest and the most commonly used ones in creating analysis ready data sets for patient data. If you want to explore the many knowledge graphs available, check out the bio portal from the National Center for Biomedical Ontology at Stanford. The International Classification of Diseases was created over 100 years ago originally to record causes of death worldwide. It's maintained by the World Health Organization. The current version in use in the USA is ICD 10. ICD 9 is also relevant because much of the medical data currently available was collected using that coding system. For example, the ICD9 code for uncomplicated diabetes malitis type 2 is 25.00 and the ICD 10 code is E11.9. The current procedural terminology or CPT is made by the American Medical Association since 19 1966. It is used for categorizing medical procedures and services primarily for billing. The entities in this one are procedures, services and the modifiers of those procedures. The main relationship is the subclass of or kind of the US National Library of Medicine or NLM provides RX norm a naming system for genetic and branded drugs. It explicitly represents sets of drug synonyms. The NLM also provides RXNAV a tool to navigate RXORM. The World Health Organization maintains the anatomic therapeutic and chemical or ATC classification system. This one categorizes the active ingredients of drugs by the organ systems they act upon, their therapeutic activity and their pharmacological properties. The logical observation identifiers names and codes or loink is maintained by the Regan Institute. It categorizes and provides identifiers for medical laboratory observations. Finally, the unified medical language systems metathossaurus or the UMLS metaththesaurus is a union of over 140 knowledge graphs. It contains all of the knowledge graphs we have just mentioned along with declarations of relationships between these knowledge graphs. The UMLS metaththesis and its associate artifacts, the semantic network and the lexical tools are things that anyone doing clinical data mining must know. There are excellent tutorials and online material to learn about this resource provided by the US National Library of Medicine. So, we briefly reviewed knowledge graphs corresponding to the main kinds of entities we encounter, diseases, drugs, and procedures. There's a lot more to explore, and I encourage you to check out what's available in the UMLS.

---

## 18. When to consider engineered features.mp4

### Summary

Feature engineering is the process of using **clinical intuition and creativity** to transform raw data into more meaningful variables, such as ratios or rates of change, which serve as **proxies for unmeasured phenomena**. While specialized **deep learning** techniques can automatically extract patterns from signals and images, traditional medical record analysis still relies heavily on human-led design and **pre-validated scoring systems**. Developers must carefully weigh the **cost-utility trade-off**, balancing the time spent crafting these new features against the actual predictive value they provide to the final model. Ultimately, the goal is to provide a rich set of inputs and allow **downstream analysis** to determine which specific attributes are most effective for solving a clinical problem.

**Keywords:** Engineered features, Clinical scoring systems, Feature engineering trade-offs, Deep learning, Electronic medical records

### Content

One question that remains is when should you consider constructing new features? Think about what features might be important but are not directly measured. Then construct a proxy for those out of the existing features. For example, the wound healing rate. Take advantage of pre-validated clinical scoring systems because these scores have been shown to be useful for a clinical problem. When creating a new feature, consider including counts, differences, change over time and ratios of existing measurements. Lean towards creating new features using some clinical knowledge and creativity. Let the downstream analysis figure out which ones are useful or not. In the end, balance the benefit from building new features against the effort needed to create them. There's a cost utility trade-off for each engineered feature. Finally, there are some new methods in machine learning called deep learning that use the raw data and build or rather learn the features they need without domain knowledge. However, to do this, they require more data than conventional analysis methods. Deep learning has shown particular value in processing signals and images. The benefit of deep learning derived feature representations for electronic medical records is modest as compared with the impressive gains in processing signals and images where deep learning has essentially obiated the need for feature engineering.

---

