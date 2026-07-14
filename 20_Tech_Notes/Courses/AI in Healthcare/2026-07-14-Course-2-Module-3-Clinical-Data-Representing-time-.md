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

# Course 2 : Module 3: Clinical Data : Representing time, events for data mining

**Sources:** 12 | **Exported:** July 14, 2026

---

## 1. Clinical processes are non-stationary.mp4

### Summary

The medical field is characterized by **non-stationary processes**, meaning that data distributions and clinical relationships shift over time due to evolving treatments, technologies, and administrative policies. Because these shifts can render old information irrelevant or misleading, researchers must recognize that **historical data may not remain a valid predictor** for contemporary outcomes. To address this, one can detect non-stationarity by attempting to **predict the time period of a record** based solely on its clinical variables; a successful prediction confirms that the data has fundamentally changed. Ultimately, the text serves as a warning that for studies spanning long durations, one must **actively test for temporal shifts** rather than assuming the data remains consistent.

**Keywords:** Non-stationary processes, Clinical data evolution, Predictive model accuracy, Machine learning detection, Data distribution shifts

### Content

Along with the choice of the time scale and the representation of time, we have to deal with the fact that the health care system itself is evolving over time. As a result, the data elements we capture as a byproduct of routine care change as new medications are developed, the preferred treatments evolve, and as the coding and billing incentives in the healthcare system change. Collectively, these changes make our data generation non-stationary. As mentioned before, a stationary process is one that generates data that looks similar over time. Although the exact values differ, the distribution of values at different times will be similar. A non-stationary process is one that generates data whose distribution of values changes over time. Therefore, the associations that hold in the data also change over time. Which means we cannot combine old data with newer data without very careful consideration. It also means that some association in the old data have been broken and features previously determined to be good predictors may no longer be useful in building predictive models. For example, non-stationity is usually a problem but is often ignored. One clever way to use machine learning to detect for the presence of non-stationity is to remove time as a feature and then try to predict time from the remaining variables. If you can do that accurately, then there's some signal in the predictor variables that correlates with time. Meaning there's strong non-stationity in a project to predict wound A classifier was trained to predict the source of the data as being before 2013 versus after 2013. The classifier could perfectly identify the data as being from before or after 2013, implying that there is non-station and that data from before 2013 are systematically different from data after 2013. We're not going to get into too much detail about non-starity. The point of this discussion is for you to know that this phenomena exists and that you have to test for its presence. This is particularly true for data sets that span long time intervals and studies that have large time scales.

---

## 2. Different ways to put data in bins.mp4

### Summary

When organizing raw information into time-based categories, researchers must choose specific mathematical methods to **summarize data points** in a way that captures their true clinical meaning. Rather than just calculating simple averages, one might focus on **presence versus absence**, the **most recent measurement**, or the **variance** to identify instability in a patient's health. The process of **feature engineering** often involves using specialized medical knowledge to create new variables, such as the **rate of change**, which reveals how a condition evolves over time. Ultimately, the choice of how to aggregate these values is dictated by the specific **research question** and the need to turn complex timelines into actionable insights.

**Keywords:** Data aggregation methods, Feature engineering, Clinical status summary, Temporal data encoding, Rate of change

### Content

When deciding on aggregating or summarizing data within each bin, there are many possibilities. It might make sense to use the count of the number of events that occur in each bin as the feature. You could record a count of zero versus a positive count. This would mark absence versus presence. For example, an indicator variable indicating that the test had been ordered separate from the value of the result of the test. You could use the average of all the values in the bin or the maximum values of all the values in the bin. or the most recent value of all the values you have or some variance of those values. This choice would be governed by the research question and the clinical item of interest. For example, suppose you were interested in tracking the status of a patient's type 2 diabetes malitis and you wanted to summarize their clinical status over one last year. A lab test called HBA1C is a single measurement that provides a summary of the patients glucose control over the last several months. The most recent HBA1C value is more relevant than the earlier measurements in the same year. So we could use only the most recent value. We could also use the variance because a high variance in those values would indicate that the value has not been stable. Perhaps the patient was having glucose control problems even if the most recent value was close to normal. So in this example, we would have represented the timeline of multiple HB1C measurements with two values. The most recent measurement and the variance. over the last year. Another effective way to encode information of how things unfolded over time is to add a second feature that records the rate of change of a feature. Suppose you're trying to predict whether a patient's wound will heal or not. If we have the wound size as a feature, then we can add a second feature, which is the rate of change in the wound size over some time. Wounds with very slow rates of healing are probably at the highest risk of not healing, creating New features like this is called feature engineering. And a little medical knowledge goes a long way in crafting such useful features that encode time.

---

## 3. Implicit representations of time.mp4

### Summary

This method simplifies chronological data by replacing precise timestamps with **implicit representations of time** through a process known as binning. Instead of tracking exact dates, researchers divide a patient’s history into **specific time intervals** and tally the occurrences of relevant medical events within each segment. The effectiveness of this approach relies on selecting an appropriate **granularity or scale** that aligns with the specific research goals. Ultimately, the analyst must decide how to **aggregate and summarize** these counts to transform raw timelines into structured features for a predictive matrix.

**Keywords:** Patient feature matrix, Implicit time representation, Data binning, Event counts, Temporal data aggregation

### Content

We want to represent time information in the patient feature matrix. Sometimes implicit representations of time are good enough where we ignore the exact date and time of an event and instead record the number of times that relevant events occurred during specified intervals. An example of this is called bin. Let us look at it in some detail. We start with a patient timeline. We define time intervals which we call bins that are relevant to the analysis and then count the number of events of each type that occur in each bin. For example, we might want to distinguish the past month from earlier times in the timeline. The bin counts or event counts in the bin become features in the patient feature matrix. There are some important choices to make when doing such binning. We need to decide on how many bins to use and how big is each one. What's the size or interval? The granularity of the bin interval chosen depends on the time scale. of the research question. Another very important design consideration is how to aggregate or summarize the data within each bin that we have defined.

---

## 4. Intro to Clinical Data Study Guide - M3.pdf

### Summary



### Content

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9f18qcypM0hhxzIfAORWQU0-pL-gIA5FKivitejJTF_RhTCkTJqsq2jf9NirHIjX3kv9GEBY0RT8evlIHQJENNbTx3sfLs6ziKzEjVRZiMCEAZGJU15IaZFpFQXujmRVraPChybw=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9rBBTAVdJaB34gkTamgBx13rd9gqhG6Qg5TdSEiEBFI5bMUDo6p0AR8KUBYHNtKEpdx4MlrDcOtHxtoU47cn0MUD2m2yACv53E6gmjZymXplWH8m3oUhHGlzz38FnonbvoLtAKig=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9VTlJ09M9sXot4KOrBYdOUPoSn2Elr0LQumMGI-pk--61OlyKX1UttA_M4PUwN7f3tT-7qbywQQK9m6vEBFFMQE6Swx41F6TXUkdUrHR8ilclf0IdFPPyQFm3FSpdcJoXArc1kgQ=w1039-h396-v0)

 Copyright © Stanford University INTRO TO CLINICAL DATA STUDY GUIDE MODULE 3 – REPRESENTING TIME, AND TIMING OF EVENTS, FOR CLINICAL DATA MINING LEARNING OBJECTIVES 1. Explain why timelines are useful for healthcare data 2. Identify the timescales of interest in a clinical research question. 3. Identify which timescales are represented in which kinds of data 4. Explain the difference between explicit and implicit representations of time 5. Describe at least one problem arising from temporal classification of exposures and outcomes 6. Describe non-stationary and why it is important HEALTHCARE HAPPENS OVER TIME The goal of this module is to discuss how the patient timeline relates to timescales of the questions we seek to answer as well as the issues that matter when representing time and working with healthcare data that changes over time. A good way to integrate all the different sources and types of data for a patient is to place all the events on a timeline. Each patient will have their own timeline. The timeline explicitly captures when the patient experienced each event. We care about time for two main reasons. A patient's age is a key factor in making medical care decisions about them We will often examine the order in which events occur [Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX_yjcd7YVrPQOgJMtp7a01v_nC307IF2JPXkK094YNIHCGUH9ULNyxxxfh0UxznfZ9Euh0jSbvyVO5KWOyYEMovM-D7aPRIgXZXPTFj6jIElLrTMu-8yAziDbToI9wQqzq2H5xQRw=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX8-lQwxiPv-uEQWPZ4Reo9An34IP1aK7ouv0g4LGXHVcP4GR612jRbnAfD4F94CD50_RQXzjfcRtlZknCfLHV1mN36hGWHTFAgyMSGL5k7_0SDWS0n-J55WqtBtwShpnyYg52Qq=w600-h73-v0)

 Copyright © Stanford University The timescales involved in answering medical questions span many orders of magnitude. We may need to consider intervals of well under one second, all the way to a patient's entire lifetime. The choice of the timescale and the way we choose to represent time have to deal with the fact that, not only do patients change over time, but the healthcare system itself is evolving over time, so the meaning of the data elements we capture as a by-product of routine care can change without our noticing. A stationary process is one that generates data that looks similar over time A non-stationary process is one that generates data whose distribution of values changes over time In healthcare, the relevant units of time can span many orders of magnitude, from fractions of a second to a century. The relevant interval of time is directly influenced by the disease process, the measurements that current technology can make, and how the healthcare system is organized. The relevant timescale depends on the question we want to answer. In addition to being influenced by the question, the relevant timescale is also often determined by the kind of data. Some diseases are chronic, meaning that a cure is not possible, so the disease must be managed indefinitely, perhaps for the rest of the patient's life. Diabetes is an example of a chronic disease. These two considerations -- the question, and the kind of data – interact and inform strategy. Strategy on what features you are going to use: How accurately should they be ascertained? How many different kinds of features you are going to use? How will you infer whether a patient has a condition of interest? REPRESENTATION OF TIME How we would capture (or encode) information about time in a computer-based representation -- that is how we represent time. Patient-feature matrix: A rectangular data frame in which each row is a patient and each column is a characteristic about them In a patient-feature matrix, each row is a patient and each column is a characteristic about them, such as an identifier. [Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX8Nw4OINOlLmZUGa0Xh_0MpBTPMx8JxQHE4A8QJqLd_lv4Swwy0EPt_0ZjqyTWgGvGzbMJ8uUyqKb1KMbed7PRZ_GuJisUd2jWXouQYnW07RoqaDNdZYXcuc0Jz5ZH0dUmfqDv2_g=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9qsZIoMEkX_yKp-G4Rt1FEnpWnAiPTFfBUYAjEG0cY5m-nV2y4MVrHXf77wI7C70gvijEJuqsoDInEZA-6E538e9nIXFZ7rQlucnUdr56AWIK4kGubcR4z3Y2kKti7W58Y2tTrng=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX8PWUwyOOeJLByPG8ypWZGtBx2TNtQaNuNZeURrihCDuN71XaZeyV1_B4oLbSH-fMYwtplVGqUKH38xzroNAo7WoOZZgkhitqh5WGn0-Ucv0i9HyXKE6_RFpwEDr2VpUuohIwECRQ=w1280-h429-v0)

 Copyright © Stanford University A time series is a set of measurements that are sampled at regularly-spaced intervals, with each measurement being of the same type. It is important to know that an important area of healthcare data that uses time series data and related analysis methods is in the ICU. A patient in the ICU is typically extremely ill, and their physiological status needs to be monitored continuously via sensors attached to the patient's body. These streams of data have regular sampling intervals and methods from the field of signal processing can handle these data well. Most medical data are not acquired on regular clock ticks. They are sampled asynchronously as determined by necessity. For example, the EKG is a continuous measurement, but blood pressure is measured as needed. Many medical measurements are acquired in two stages: 1. The clinician orders the test 2. The test is actually performed An indicator variable marks what test was ordered and when it was ordered, but does not record the result of the test. The indicator variable is separate from the test value, which records the actual value and the units in which it was measured. Order of events Knowing what happened when is a great start, but in many cases, we want to be able to reason about the order of events such as: finding patients with A and B, or patients with A then B. [Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-bfsB4uBWtnt0An3fojt1iXzeKzN_EVjtvnHphzdNRZMrDxsL0pLXNlQgsUWyUlWVIpCwZ12cBzNtz0fhV02ETZ-M3JJ9drA8BpZZfzZKGxmSl3feJOh35pYe7fKvF4QBfzAfS=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9I8bBLGWbXjTsYJR5i0TRrG0o8AYGY_Wfq2u_V6PBwVZLNN9FbsXhKMZMKpWqR1wfrAOoTgl1ogQ5e1fkxgs_kReysnaS5PUQpFdyA3dTfz5ZJeBFSnt4eeamwoMOLeZX7_LJfnA=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX8BDOGBCfcJOlslEP-SmNKf4wdZp8TwSeUPJDLSex-3o9stAvhjiWU8sj7ELSbwkL0pkf75z8hE60TGoEENMd9YmxvHc4qs6k1cXBYZJZWCdiHS2oImpskyrYjer9wX0TX1PPRH2A=w1280-h598-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX_Sc61zFKbD_stI9jSVDa-0Lz8FaQA4duRwDYKj8N-_rOI8mnNwACDzplzjiUV3kTE6YOzNjBq56_cj0p-MqfT3yoAVS-YtxMSkqufTqc0HxDevuX6SKaEPl0-871mTR-XlM0U80Q=w1280-h626-v0)

 Copyright © Stanford University If A and B are instantaneous points in time, then answering this question is straightforward. However, if A and B refer to intervals of having diseases, such as "pneumonia" and “rheumatoid arthritis”, then the reasoning becomes more complicated. What does patients with “pneumonia” and “rheumatoid arthritis” mean? In one interpretation, event A finishes before event B starts. In the second interpretation event A finishes after event B starts. Most general-purpose databases are not structured to make it easy to work with these distinctions— but a timeline representation does. Represent time information in the patient-feature matrix Binning: Record the number of times that the relevant events occur during specified intervals [Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-B84DiICvzb72FhIRuatH8mK1QbgiwBSR00JyilRMoHTdsQEmc9zHcCb7APaedj5QRH7KkiU0F2SsvAPQ3e1bxFY1T384QzJ5uLJPxqtflVKpWMdXLF_5Zr1fjjpviOfLJIBOveQ=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-qEA23chUbB5MfFMzOz4bWtzCkDavXknoONUxpDcwQjA7Qj5x1In6M7oQ4t4rKzffFfF639AOBtpp09nDdAYAyBMr-kLwHuUdTMTJAsJMSjwWEuM-VEAI4Mut7sIYItg7CR3pPIA=w600-h73-v0)

 Copyright © Stanford University Let us look at it in detail: We start with a patient timeline. We define time intervals, called bins, that are relevant to the analysis, and count the number of events of each type that occur in each bin. The bin counts become features in the patient-feature matrix. Choices in time-binning: How many bins? What granularities of time? How does this relate to the timescales at play in your research question? How do you aggregate the data within each bin? Possibilities for making a decision on aggregating or summarizing data within each bin: 1. It might make sense to use the count of the number of events that occur in each bin as the feature. You could record a count of zero vs a positive count. This would mark absence versus presence. 2. Use the average of all the values in the bin, or the maximum value of all the values in the bin, or the most recent value of all the values in the bin, or the variance of the values in the bin. This choice would be governed by the research question and the clinical item of interest. 3. Add a second feature that records the rate of change of a feature. Creating new features is called feature engineering, and a little medical knowledge goes a long way in crafting such useful features that encode time. Timing of exposures and outcomes Cohort: A set of patients that satisfies some inclusion criterion, typically an exposure of some sort Exposure: Something that could happen to the patient Outcome: A condition of interest that is assessed as having happened to the patient, usually at some point after the exposure In general, we are interested in whether there is an association between the exposure and the outcome for patients in the cohort. Therefore, we need to identify those that are exposed and those not exposed as well as those that had the outcome and those who did not. In addition, it matters when the exposure and outcome events occurred. [Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-pfCsgnl2zW1lPPmCWPC67FE_KcYHDy0tMneteUFPW-W6VqJEfUqqWq35K0l9VGvKGe3I4IQyrsMU0Umk7_yfhedng56MFSghjobAnpwJZv22zY0vYMAx3IdLv0s2XoyFMD3C4=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9AlVnaoZqjHkVcdcyVdMRhmOJWYz9PGJeQMkm-y7HJN3ahVS-gdF1TOCpmx0U-MNj2Tq6e8A4gCDAgVBr8YAmRWZ77aXi4HeAIn5NXmXvuRf9NLk7_AhbKdmw-haZOXRB_oGg4bg=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-ZtL_wTz4eQUDxi-JPtfn0DNCONW1GWT5ccMZQugkaAddoGpXDWZOg6TaQK6mxau2Hesb__Lo5GtyWPUdhio-ZK2FkNdiiLcHfDWomrInS6iO5G6FSjZO9fEgg3mh1AQqrSypJ=w1280-h562-v0)

 Copyright © Stanford University For those in the exposed group, such as those who had a coffee, the start time is straightforward to determine. It is when the exposure (i.e. having a coffee) appears on the patient timeline. The start time is also referred to as the index time. For those non-exposed, meaning those that did not have a coffee, it is straightforward to determine that they are not exposed, because you won't find any exposure or coffee drinking, events on the patient timeline. However, what time should we use for when the non-exposure to coffee happens? This is a very important issue, and not always easy to solve. A possible solution is to introduce a proxy event (such as drinking tea) whose presence is taken to mark the start of non-exposure. However, this may change who enters the control group and introduces a selection bias. For example, it excludes everyone who did not drink tea or coffee. Remember: Even if you know who is not exposed, it is hard to decide as of when they should be counted as not exposed. We also need the time when the outcome occurs. This will allow us to compute the time-to-event, which is the difference between the time of the outcome and the time of the exposure. [Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9w9fLs75KH8G54CQgpsgMNHf1AYJvoc3ubd_Qyi4-6aUTczj64j4fA2F6L9s5dWJ2Dic-6ApQ8ekhkDiC8ELSFv9aSVl2RikvWeNg9qGdgAvPvcYkzMOo7Oy_Dtjx-QLSq29n5OA=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9sqFbK-3FW2u7tX6gKMUkqh0ougLP9Ti6r96_QziJtg4yEfh1D1Z78WoxMKTjOjHVYNnTECIVEh-JGjz_Wy-8seB_RFbS9casdCuhEMLOCJhgAeJcbxvkoAkQh3W0Rcrt0-kDJqQ=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-OwVNwQf5om9TdbxUVwus1I3jTSL2YZ8BWb7PlcDuiUlXPUr5K9wtDbPka6kmurdugr09G5uP_a8amTdPIuQ0SoX0HQT_99hgKrPeAX3GufL51XSm0BNFWkZriAuVV2XGGGJLqPg=w1280-h587-v0)

 Copyright © Stanford University Without a time-stamp, we cannot compute the time difference. In epidemiology, this condition is called "right censoring". At a given point in time T, there will be some patients who have not yet developed the outcome. One possible solution is to use a special code, which we will write as ">T", which means "the outcome has not happened yet." Another solution is to record the time of the outcome, if known, or the time when the patient was last observed along with an indicator variable to mark whether the recorded time is for the outcome or for the last observation. In summary, you need to diligently determine exposure and outcome times correctly. DATA CHANGE OVER TIME Along with the choice of the timescale and the representation of time, we have to deal with the fact that the healthcare system itself is evolving over time. Collectively, these changes make our data generation “nonstationary”. Stationary process: One that generates data that looks similar over time Non-stationary process: One that generates data whose distribution of values changes over time Non-stationarity is usually a problem, but is often ignored. [Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-acsA9Vhfac3v1trlA3-b0k0a2GvW0zOVrhOGiRk5NxeS0VNtQKEx9u1F4oiH3aI1ro0yPE4I2l-SCGtBwqAsxa7goOzGhVnlTLxGjYg5l8-I6xRix6x94bnvAzCOWBq6FY9x0=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-jZa29JXa-c6eQ6SFmxsvK79IzIklgTdD49OknO0f7krBv-Kjn7s4oWe3t25qxx36Zco0OQtHF46RT5bUl62PiOj_BTwpL0Q-Gowl29ByGKA-881OiVxmhfJ_bSWiazsWRiZlW=w600-h73-v0)

 Copyright © Stanford University One clever way to use machine learning to detect non-stationarity is to remove time as a feature, and then try to predict time from the remaining variables. If we can do that accurately, then there is some pattern in the predictor variables that correlates with time -- meaning there is strong non-stationarity. The point of the discussion is for you to know that this phenomenon exists, and that you have to test for its presence. This is particularly true for datasets that span long time intervals and studies that have large timescales.

---

## 5. Introduction.mp4

### Summary

This module explores how medical histories are composed of various fragments of information captured by different providers across a **continuous chronological sequence**. It addresses the logistical difficulty of **integrating disconnected data sources** to form a unified narrative of a person's health journey. By aligning these individual timelines with specific research objectives, the text aims to teach students how to navigate the **shifting scales of time** inherent in medical records. Ultimately, the focus is on mastering the **representation of temporal changes** to ensure healthcare data remains accurate and meaningful as it evolves.

**Keywords:** Patient timeline, Healthcare data, Patient care, Linking data sources, Data representation

### Content

We've seen how the care of patients occurs over time and how the record of their care has an inherent time dimension to it. We've also seen how different actors in the healthcare ecosystem capture different portion of a patient's timeline and the issues involved in linking across those sources. The goal of this module is to discuss how the patient timeline relates to the time scales of the questions we seek to answer as well as the issues that matter when representing time and working with healthcare data. That changes over time.

---

## 6. Order of events.mp4

### Summary

While tracking medical events may seem simple, complications arise when we must determine the exact temporal relationship between **prolonged health conditions**. Standard databases often struggle to distinguish whether two illnesses occurred **sequentially without overlap** or **simultaneously with shared duration**. To resolve these ambiguities, researchers utilize a **timeline representation** to clarify the precise order and intersection of events. This structural approach allows for a more sophisticated **logical reasoning** of patient data than traditional data formats can provide.

**Keywords:** Order of events, Temporal reasoning, Disease intervals, Timeline representation, Data interpretation

### Content

Knowing what happened when is a great start, but in many cases we want to be able to reason about the order of events such as finding patients with A and B or patients with A then B. If A and B are instantaneous points in time, then answering this question is straightforward. However, if A and B refer to intervals of having diseases such as pneumonia and rheumatoid arthritis, then the reasoning becomes more complicated. What does patients with pneumonia and rheumator itis mean? In one interpretation, event A finishes before event B starts, such as having pneumonia at age 40 and then getting arthritis at age 60. In the second interpretation, event A finishes after event B starts, such as a person who has pneumonia and arthritis at the same time. Similar problems arise when reasoning about the phrase A before B. Does that mean that the condition A ended before the condition B started? Maybe with no overlap. Or does it mean that A started before B started and there is some overlap? Most generalpurpose databases are not structured to make it easy to work with these distinctions, but a timeline representation does that naturally.

---

## 7. Representation of time.mp4

### Summary

To analyze healthcare data, researchers must translate individual medical histories into a **structured rectangular format** known as a **patient feature matrix**. This organizational tool assigns each individual to a row while capturing their specific clinical traits and measurements within the columns. The primary challenge addressed is the **encoding of temporal information**, as time must be represented accurately within this grid to facilitate meaningful study. By exploring different methods of **integrating time into the matrix**, the text aims to provide a framework for converting complex, fluid patient timelines into standardized data ready for computation.

**Keywords:** Time representation, Patient feature matrix, Data encoding, Computer-based representation, Patient timelines

### Content

Let us now turn to the issue of how we would capture or encode information about time in a computer-based representation. That is, how do we represent time? Ultimately, to analyze the data, we need a rectangular data frame. Something we refer to as the patient feature matrix. In a patient feature matrix, each row is a patient. Each column is a characteristic about them such as an identifier, whether they have a certain disease, measurements such as blood pressure or a lab result. We will discuss how to convert a patient timeline into a patient feature matrix later. Right now, let's focus on how we would represent time in the patient timeline as well as in the patient feature matrix. There are multiple ways to represent time when creating the patient feature matrix, each with its own advantages and disadvantages. Let's dive into those next.

---

## 8. Time series and non-time series data.mp4

### Summary

This text explores the distinction between **regularly sampled time series** and the **asynchronous nature of clinical data**, highlighting how the timing of medical events conveys critical information. While tools from **signal processing** are ideal for continuous streams like EKG readings, most healthcare records consist of irregular measurements triggered by a patient's worsening condition. The author emphasizes that **indicator variables**, which track when a test was ordered rather than its specific result, provide significant insight into a clinician's priorities and a patient's stability. Ultimately, the source reveals that in medicine, the **absence or frequency of data** often tells a story about health and illness that the raw numbers alone might miss.

**Keywords:** Time series data, Medical data sampling, Signal processing, ICU patient monitoring, Indicator variables

### Content

We'll begin with a time series. A time series is a set of measurements that are sampled at regularly spaced intervals with each measurement being of the same type. An example is the voltage measured on one of the chest leads of an EKG machine. There are many methods drawn from electrical engineering for processing time series and we won't focus on them here. However, it's important to know that an important area of healthcare data that uses time series data and related analysis methods is in the the ICU. A patient in the ICU is typically extremely ill and their physiological status needs to be monitored continuously via sensors attached to the patient's body. These streams of data have regular sampling intervals and methods from the field of signal processing can handle those data well. However, most medical data are not acquired on regular clock ticks. They're sampled asynchronously as determined by necessity. For example, the EKG is a continuous measurement, but blood pressure is measured as needed. We know the most about patients from times when they're sick, not from when they're well. We know more about disease than about health, even though health is everyone's goal. Also note that many medical measurements are acquired in two stages. First, the clinician orders the test. Then the test is actually performed and we get the result. Although this might seem like a trivial distinction, it's quite important. Some data sets such as medical claims might only record the orders and not the result of the test. To capture this distinction, we can use indicator variables. An indicator variable marks what test was ordered and when it was ordered, but does not record the result of the test. The indicator variable is separate from the test value, which records the actual result and the value and the units in which it was measured. There's considerable information in just knowing what test was ordered when, without knowing the value returned by the test. In healthcare, when there are long stretches of no measurement, We can also infer that the patient status is healthy and stable. But often we don't really know.

---

## 9. Time, timelines, timescales and representations of time.mp4

### Summary

By organizing medical records into a chronological **patient timeline**, clinicians can better assess how age influences treatment and determine the **causal order of events**. This temporal approach must account for a massive range of **timescales**, spanning from sub-second heart rhythms to a century of health status. Crucially, researchers must remain aware of **non-stationarity**, a phenomenon where the underlying distribution of healthcare data shifts over time due to evolving medical technologies, new diseases, and changing administrative codes. Ultimately, the purpose of this framework is to provide a structured method for interpreting complex data while acknowledging that both **biological and systemic factors** are constantly in flux.

**Keywords:** Patient timelines, Clinical decision making, Event sequencing, Medical time scales, Data non-stationarity

### Content

A good way to integrate all the different sources and types of data for a patient is to place all the events on a timeline. Each patient will have their own timeline. The timeline explicitly captures when the patient experienced each event. We care about time for two main reasons. First, a patient's age is a key factor in making medical care decisions about them. Pediatric patients, adult patients, and geriatric patients differ in important ways. They're at risk for different diseases. They metabolize medications at different rates and they may even have access to different health insurance coverage. Second, to make sense of healthcare data, we will often examine the order in which events occur. Generally, if X caused Y, then we should expect to see some evidence of X in the patient's record before we see some evidence of Y. For example, the exposure to a medication would precede an adverse event caused by it. The time scales involved in answering medical questions span many orders of magnitude. We may need to consider intervals of well under a second such as in the record of a heart rhythm all the way to a patient's entire lifetime which could span a century such as when tracking global measures of health status or count lifetime exposures to medications. The choice of the time scale and the way we choose to represent time have to deal with the fact that not only do patients change over time but the healthare system itself is evolving over time. So the meaning of the data elements we capture as a byproduct of routine care can change without our noticing. For example, new medications are developed, the preferred treatment may change and the new diseases get discovered. The coding and billing in the healthcare system also changes with incentives. Collectively, these changes result in non-stationerity in the data we analyze. A stationary process is one that generates data that looks similar over time. Although the exact values will of course differ, the distribution of values at different points in time will be similar. A non-stationary process is one that generates data whose distribution of values changes over time. And as you can guess, most healthcare data are non-stationary.

---

## 10. Timescale Choosing the relevant units of time.mp4

### Summary

Medical data analysis relies on identifying the appropriate **temporal granularity**, which can range from split-second physiological changes to long-term trends spanning decades. Selecting the correct timeframe is not arbitrary; rather, it is shaped by the specific **nature of a disease**, the **precision of diagnostic tools**, and the **logistics of clinical infrastructure**. By recognizing these diverse variables, practitioners can better understand how to align their observations with the **rhythms of human health**. This conceptual framework serves as a vital starting point for mastering how we **measure and interpret time** within a healthcare context.

**Keywords:** Healthcare time scales, Disease process, Measurement technology, Time intervals, Healthcare system organization

### Content

First, let's examine the issue of time scale in more detail. In healthcare, the relevant units of time can span many orders of magnitude from fractions of a second to a century. The relevant interval of time is directly influenced by the disease process, the measurements that current technology can make, and how the healthare system is organized. Let's develop some intuition around this with a short exercise.

---

## 11. Timing of exposures and outcomes.mp4

### Summary

This text explores the complexities of building medical cohorts by accurately identifying the **timing of exposures and outcomes** on a patient’s timeline. A primary challenge involves establishing an **index time for non-exposed groups**, as researchers must determine exactly when a patient officially counts as a control subject without introducing **selection bias**. Furthermore, the material addresses **right censoring**, a common issue where the time-to-event cannot be calculated because the outcome has not yet occurred for certain patients. To maintain data integrity, researchers must use **proxy events or indicator variables** to meticulously track when these events—or lack thereof—transpire within a clinical study.

**Keywords:** Cohort construction, Exposure and outcome, Index time determination, Selection bias, Right censoring

### Content

Now that we've reviewed timelines, time scales, and representations of time, we turn to some specific issues in dealing with time when building cohorts and determining exposures as well as outcomes. A cohort is a set of patients that satisfy some inclusion criteria, typically an exposure of some sort. Here we're using the word exposure to refer to something that could happen to the patient. Examples are diseases, drugs, or medical procedures, or say drinking coffee. An outcome is a condition of interest that is assessed as having happened to the patient usually at some point after the exposure. Examples are complications getting cured, the cost accured for the treatment and the time duration the patient lived. In general, we are interested in whether there is an association between the exposure and the outcome for patients in the cohort. Therefore, we need to identify those that are exposed and those not exposed as well as those that had an outcome and those who did not. In addition, it matters when the exposure and outcome events occurred. For those in the exposed group, such as those who had a coffee, the start time is straightforward to determine. It is when the exposure, that is having coffee, appears on the patient timeline. The start time is also referred to as the index time. For those non-exposed, meaning those that did not have a coffee, it is straightforward to determine that they are not exposed because you won't find any exp. exposure or coffee drinking events on the patient timeline. However, what time should we use for when the non-exposure to coffee happened? That is, when does the did not drink coffee event occur? This is a very important issue and not always easy to solve. A possible solution is to introduce a proxy event such as drinking tea whose presence is taken to mark the start of the non-exposure. However, doing so may change who enters the control group and introduces selection bias. For example, it excludes everyone who did not drink either tea or coffee. Remember, even if you know who is not exposed, it is hard to decide as of when they should be counted as not exposed. We also need the time when the outcome occurs. This will allow us to compute time to event, which is the difference between the time of the outcome and the time of the exposure. If the outcome has occurred for a patient, it will appear on their timeline and getting their time of outcome is straightforward. However, what if the outcome has not yet happened for a patient? Without a time stamp, we cannot compute the time difference. In epidemiology, this condition is called right sensoring. At a given point in time t, there will be some patients who have not yet developed the outcome. One possible solution is to use a special code which we'll write as greater than and t which means the outcome has not yet happened. Another solution is to record the time of the outcome if known or the time when the patient was last observed along with an indicator variable to mark whether the recorded time is for the outcome or the last observation. Using such techniques, we can create the patient feature matrix at the cost of creating composite and extra features. In summary, you need to diligently determine the exposure and outcome times correctly. Some events such as death will happen to all patients. They have either already happened or have not happened yet. The analysis needs to take into consideration such things.

---

## 12. What affects the timescale.mp4

### Summary

The duration of medical observation is primarily dictated by the specific **clinical objective** and the inherent **characteristics of the data** being analyzed. While laboratory results may only remain valid for a few days, a formal diagnosis can track a patient’s health over several years or even an **entire lifetime**. This distinction is especially clear when comparing **acute conditions** like the flu, which resolve quickly, to **chronic illnesses** like diabetes that require permanent management. Ultimately, these factors work in tandem to shape a researcher's **strategic approach** to feature selection and diagnostic accuracy.

**Keywords:** Relevant time scales, Laboratory data, Acute diseases, Chronic diseases, Feature engineering strategy

### Content

As we can see, the relevant time scale depends on the question we want to answer. In addition to being influenced by the question, the relevant time scale is often determined by the kind of data. Laboratory tests are typically relevant for days. Some of them might be weeks or even months. A diagnosis is relevant for periods of days or weeks or even up to an entire lifetime. Some diseases are acute, meaning that the patient is ill then recovers back to the normal state of health. Infections such as common cold or influenza are typically acute. Some diseases are chronic, meaning that a cure is not possible. So, the disease must be managed indefinitely, perhaps for the rest of a patient's life. Diabetes is an example of a chronic disease. These two considerations, the question and the kind of data interact together. They inform your strategy about what features you are going to use, how accurately should they be ascertained, how many different kinds of features you're going to use, And how will you infer whether a patient has a condition of interest?

---

