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

# Course 2 : Module 5: Clinical Data : Handling structured and unstructured data

**Sources:** 18 | **Exported:** July 14, 2026

---

## 1. A primer on Natural Language Processing.mp4

### Summary

Natural language processing serves as a specialized branch of artificial intelligence designed to help computers **decode and interpret human speech or writing**. The field relies on a structured sequence of operations—including **tokenization, grammatical parsing, and named entity recognition**—to transform raw text into organized data. In a healthcare context, these systems must be further refined through **section detection and contextual analysis** to accurately distinguish between a patient's current symptoms and their past medical history. Ultimately, while standard tools provide a foundation, processing clinical records requires **addressing linguistic nuances like negation** to ensure the information remains medically relevant and accurate.

**Keywords:** Natural language processing, Tokenization, Parsing, Named entity recognition, Clinical text adaptation

### Content

Natural language processing or NLP is an area of artificial intelligence that develops methods to allow computers to process human language. Here we briefly summarized the steps in an NLP system. Earlier we stated that NLP is not required for processing of clinical text but is an important contrast to the non NLP methods that we will explore in this module. NLP consists of the following steps. First is tokenization. The purpose of this step is to detect words and identify where sentences begin and end. The second step is parsing which determines the grammatical structure of each sentence and tags each word with its part of speech such as noun or verb. Named entity recognition is the step that identifies words or phrases of interest and assigns appropriate category labels. For clinical text, appropriate labels might be diseases and medical procedures. Section detection is the step that identifies boundaries between different sections of a document. For clinical text, we would like to mark the section that constitutes the past medical history. This is important because having a history of disease is different from currently having the disease. When NLP tools are used on clinical text, they typically require some adaptation of the usual steps in an NLP system in order to work. The NLP tools need to address the negation and context problems we identified earlier.

---

## 2. A typical image management process.mp4

### Summary

The lifecycle of medical imaging begins with **image acquisition**, where physical energy is converted into digital signals using specialized hardware. To handle these large files, healthcare systems rely on **DICOM standards** and **Picture Archiving and Communication Systems (PACS)** to ensure data is compressed, organized, and tagged with essential metadata. While these images have historically been manually analyzed by experts to create text-based clinical reports, modern medicine is increasingly adopting **deep learning and machine learning** to automate interpretation. This technological shift aims to streamline the diagnostic process by **identifying clinical features directly from image data**, ultimately supporting or even replicating the high-level analysis traditionally performed by radiologists.

**Keywords:** Radiology image lifecycle, Image acquisition, DICOM standard, PACS storage systems, Deep learning analysis

### Content

The most common images accessible to data mining are radiology images. Therefore, let us review the life cycle of radiology images. The first step is image acquisition. A camera, scanner or sensor transduces the physical energy into a digital signal. The second step is image storage and management. The images are moved from the image acquisition device to a system that stores and organizes the images for retrieval. The storage system also records metadata such as the patient identifier, where and when the image was acquired, and the parameters of the apparatus used in the image acquisition step. Digital imaging and communications in medicine or DICOM is a widely used standard for the storage and transmission of medical images. It is based on efforts to standardize image representations that started in the 1980s. DICCom applies to all the imaging modalities described earlier. Medical images are stored in picture archiving and communications systems or packs. As noted earlier, images occupy relatively large amounts of computer storage. These representation standards and storage systems allow for image compression to reduce the amount of space occupied. The third step is processing and interpretation. Traditionally, the content of a medical image is interpreted by a specialist, usually a radiologist, who produces a narrative description of the clinically relevant features that are present or absent in the image. The text of this report is stored in the EMR. Much research these days concerns the processing of medical images by computer. In Some cases the goal is to automate routine tasks and highlight important features to ease the task of the radiologist or more recently pathologist. In other cases the goal is to automatically produce an expert level textual description of the contents of the image. There have been spectacular successes in using machine learning techniques called deep learning that can automatically learn to identify features directly from the image array.

---

## 3. Clinical text value.mp4

### Summary

Clinical text serves as a vital resource in healthcare because it captures a **comprehensive narrative** of patient experiences that standard billing codes often overlook. By analyzing progress notes and surgical descriptions, providers can achieve a **higher level of accuracy** in tracking complications, identifying chronic diseases, and ensuring patients receive necessary preventative care like vaccinations. Beyond individual treatment, this rich data source fuels **clinical research and discovery**, enabling the identification of new drug treatments and the construction of more precise study groups. Ultimately, the source illustrates that unstructured medical notes are an **indispensable data type** that bridges the gap between administrative records and the complex reality of clinical practice.

**Keywords:** Clinical text value, Medical billing codes, Disease surveillance, Clinical decision support, Research cohort construction

### Content

What makes clinical text valuable? Clinical text is useful because it can augment the billing codes that have been assigned to medical records. Those codes may be incomplete, biased, or influenced by billing procedures. Clinical text contains a description of what happened to the patient. That information often can increase the accuracy of our representation beyond just using the codes. Here's an example. We are interested in the number of patients who develop a common side effect, urinary incontinence, after prostate surgery. Incontinence following surgery is an important measurement used to track quality of care. It is also unpleasant for the patient. If we compare the number of patients who develop urinary incontinence after prostate surgery using mentions in progress notes to those found using diagnosis codes, we find that the progress note text identifies five times more patients than the codes. The value derived from clinical text may depend upon the medical condition under consideration. Some conditions are accurately represented by codes. In other cases, a significant fraction of the patients would can only be identified through the analysis of the text in the clinical notes. In one analysis, Alzheimer's disease, multiple sclerosis, and Parkinson's disease were all found in significant numbers through the use of terms appearing in clinical notes when compared to using codes. In contrast, atrial fibrillation was identified by using diagnosis codes and medications prescribed. Clinical text is useful for many different purposes. Clinical text is used for bioserveillance to detect and monitor disease outbreaks. Clinical text is used for improving the set of words that are used to refer to diseases. We'll talk more about this later in the module. Clinical text is used in clinical decision support. Let's talk about an example based on an actual serious case. If a patient has their spleen removed, they should get an anti-numok vaccination. However, if the procedure for removal of the spleen is not explicitly marked in the patient's problem list, then their doctor would not receive an automatic reminder to order the vaccination. Analyzing the text for evidence of the surgery would catch those cases that might otherwise be missed. Clinical text is also used to add codes to the patients medical record for querying and reporting. Clinical text can enable clinical research by facilitating the construction of study cohorts. Clinical text has even been used as part of an automated procedure to discover new knowledge by mining the text for particular patterns. In one example, a discovery of a possible treatment was made using informatics tools that identified a relationship between Renault's disease and fish oil. Thus, we see that clinical text can serve a multitude of purposes, making it an extremely valuable healthcare data type.

---

## 4. Intro to Clinical Data Study Guide - M5.pdf

### Summary

This study guide explores the management and analysis of **unstructured healthcare data**, specifically focusing on the distinct roles of **clinical text, medical images, and physiological signals**. It highlights how clinical narratives differ from standard language due to their technical shorthand and frequent use of **negation and context**, necessitating specialized **Natural Language Processing (NLP)** techniques and rigorous **de-identification** to protect patient privacy. The text further categorizes medical imaging by **modality and function**, explaining the transition from human interpretation to **automated feature detection** via systems like PACS and DICOM. Ultimately, the source emphasizes the transition of complex, raw data into **actionable clinical insights** while addressing the technical and ethical challenges of data accuracy and security.

**Keywords:** Unstructured healthcare data, Clinical text mining, Privacy and de-identification, Natural language processing, Medical imaging modalities

### Content

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX_Hnz_XPZstwfGR4drMqcLB_adpkkLgBVnpjvY-5-MfA1PP_ID_fE-yKyRVamidGz0fSloRsce-NtlQtsByK29UBZL8lMfDwE6Vuq3-Tcd1hiBAllSOGb1aCJhUWZMWNtWuYff7cg=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX8xrP7k0vdat2tS8vHuWddXwTKXKlMgv9o1pUMThE-I8j5PKNxxNZO6bTu-7f2-oQL2TyNIR6qbyQyZgdqcVIrTPq5sHXwda7LPiA4JqS35yfeaHK4Bl-hlMTwFdf7cY0g1ZcwUuA=w600-h73-v0)

 INTRO TO CLINICAL DATA STUDY GUIDE MODULE 5 - HANDLING UNSTRUCTURED HEALTHCARE DATA: TEXT, IMAGES, SIGNALS LEARNING OBJECTIVES Describe the ways in which clinical text is different from natural language Describe how simple text mining strategies can be as effective at NLP when applied to clinical text What are negation and context detection, and why are they important? Explain how de-identification is different from anonymization Describe the important properties of healthcare images Describe the important properties of healthcare signals UNSTRUCTURED DATA This module focuses on text, images, and signals. These are all called unstructured data in contrast to structured data, the rectangular tables found in databases. Unstructured data: text, images, and signals Structured data: the rectangular tables found in databases CLINICAL TEXT Clinical text is different from ordinary natural language and the language used in scientific publication. It is: Written by clinicians or other healthcare providers for clinicians and those documenting the services provided Used to describe patients, their pathologies, their personal, social and medical histories, and findings made during interviews and procedures [Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX_SsM-ToDny_KSXyqzklnaPJ7jQ3qTyXjRoLCSIgoWuOMlKKegL_slv-TB7zkbQYLQvIjE2vt-QFRMIa0stHLoXpDxyBs7q3m2Zt6sUc8BvJrffz-S1vfZciHvB3ItIM4KoFj_dCA=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-dsH_ZXdnfthuQHWzH8Wj-_wXD18mvV2L_7yRRiZOucXirnwxkcuctM75vqkudJ-ywdfDnEBT2JLFNDA2kUgf6wYuxFks6eBibChhlDc7jZNnt51Bm-4htHLxIn68Nkd8VJ8fwUA=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-ANj4oTFUqNrukJstMfGJ4iiGtaVJ5sImV1QA5GY06-NK3XekNHGdZ4M0sZMr2y6kTdrzyiT3rfY6mQF4v1rYfXligLqo8zCWDWfsgRivu3_Mx3b6ZkLR6Gs4qVmfXGWqNNp5A=w1079-h769-v0)

 Not written for publication and may not use full sentences What makes clinical text valuable: It can augment the billing codes that have been assigned to medical records It contains a description of what happened to the patient It is used for biosurveillance to detect and monitor disease outbreaks It is used for improving the set of words that are used to refer to diseases It is used in clinical decision support It is used to add codes to the patient's medical record for querying and reporting The value derived from clinical text may depend on the medical condition under consideration. Some conditions are accurately represented by codes. In other cases, a significant fraction of the patients would only be identified through the analysis of the text in the clinical notes. Clinical text can enable clinical research by facilitating the construction of study cohorts. It has even been used as part of an automated procedure to discover new knowledge by mining the text for particular patterns. There are many important challenges to using clinical text: Be ungrammatical. Have misspellings and concatenations[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-JaPSJzLX8M5TtpLspVGG40jpD9w0k-ovaaMTLs_vxAJ6YZQ7vHO8fG5vt2D2SKhrbt3purIa_EBlE8KKsT2eAvRjPWawpQxqi7BYXXKR2tjhPyAHazGOpH6tld32j84i0kV2DUg=w134-h39-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX8bAjrnNAgM43QTxSRTIK-LCUFrdPUHF1v_XcuCZCEprvrLZUQZZX12-jyF86R_ZoJjiLXZpu4X94xkBxNNXgQ9h0WJmiOGFYEvMnJJDH8l6ZkvvkJ6L7MTNSewx3QhFt1dI8iCOA=w499-h355-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9mRg86TOshfx-Sfe61Id5IsKlSuj1aRZJdVkmWtDBoUckyR_BRQDfpSTIvvHmRm-eLxK8fOD1tNRysuLjXmzsHtJ_roz3l8glL-G9JxYDO62lXlXTl1dNb7IWe0lTNLPMHbH7-sw=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX8LtoSYSfOkaRTrYaHq6QvL6q9yb694DhZy6i_r4mQ6uBY4r3wbyRvLoGUkF6OwBFk4EFr5hV0O8uZHxECrXHwPHK-elQHsftfdipYqhNCMiCdZMzNhI2HKK9dUswAt1eNNHqZEnQ=w600-h73-v0)

 Contain short telegraphic phrases, acronyms, and abbreviations The quality of the sources can vary widely A very important problem in analyzing clinical text is the problem of negation. Negation: Refers to the use of a phrase to indicate that the patient does not have a condition The problem of negation: the analysis of clinical text needs to detect when a term mentioned is inside a negation. Roughly 40% of the content of clinical text is stated as a negation. A related problem is called context. Context: Refer to a condition that a patient had before, or that a patient's family member has or had The analysis needs to detect the context of a term mentioned Finally, there is pervasive fear, misunderstanding, and confusion around security, privacy, anonymization, and de-identification. This has artificially increased the burden to obtaining data access to clinical text. PRIVACY AND DE-IDENTIFICATION Textual data can contain Protected Health Information (PHI), which cannot be shared without the patient's permission. Terminology Anonymization: Data cannot be linked to a specific person De-identification: Removal of identifiers that constitute protected health information Methods for de-identification: 1. Safe Harbor: Requires the removal of 18 specific items 2. Statistical Method: A statistician validates and documents that the statistical risk of re-identification is very small 3. "Hiding in plain sight": Replaces text that looks like identifiers with realistic-appearing surrogate information. Visit the US Government’s Health and Human Services website for more detail on statistical method and the safe harbor method. [Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-5cYT3G7t9W_wEPJgSt8dBg5CqWMhdYPJdWTZKzeytutaMhEO8UM66-JJETbCZ2upUaqi9NJ6Df7apomN9dpC2j0GrVjIrbW0Aco8lN0MaUYIzhTyAvdy64JkPJd-YSS2aN7CqYA=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9JPgnMDcmjzPQMRhBvMIqi1feTOHd-kwYYAnzywqSmIrtiGmyjDu82M1yI9WcssOb7Nlqc3ywjUbTAxX1yjaWR5pYA09TnaliGt8i53SV3wY-z4zKFUX29LFEhZcSBBlULmSwyOA=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9cYIAH6yM1hO6RcFPDGtZSXukxf4u7yPnaGpRCdajgI7oOa-OupAPDY5-VnDHNOkRlcQwBt15ceVEJFc-qiR-TkTZUXddcgnpuh342MAD6BlUF0R9vTwh1GFyzqYckBZHkBZ2m2A=w1280-h619-v0)

 NATURAL LANGUAGE PROCESSING Natural Language Processing (NLP) is an area of artificial intelligence that develops methods to allow computers to process human language. NLP consists of the following steps: 1. Tokenization: the purpose of this step is to detect words and identify where sentences begin and end 2. Parsing: determines the grammatical structure of each sentence and tags each word with its part of speech, such as noun or verb 3. Named entity recognition: identifies words or phrases of interest, and assigns appropriate category labels 4. Section detection: identifies boundaries between different sections of a document When NLP tools are used on clinical text, they typically require some adaptation of the usual steps in an NLP system in order to work. The NLP tools need to address negation and context problems. PRACTICAL APPROACH TO PROCESSING CLINICAL TEXT The ultimate goal is not to understand the contents of the document but to identify features in the text that will enable the downstream analyses that answer questions. There are two main approaches for considering the issue of PHI: [Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX8wRdouNjhtA7t3PbFgzk2PPAr6rYlFgWGJrh1a0_vDhxIzesGhpbfpFWHbDSAW8i6h6mH9-jO7pKFLqjR15hDKD8HwoWI_FiWJ0AnY9uQsvIn-ZB7XXD-s1PeWcrTrvD5E7LUL=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9ljt6lX_0dWGNu_dgerzyorcgyG9q_L20Ud9sb5lQQSL0Lu_fKiHIwCGmG_QSLMfy2uXn02d3hrUUsgMkMlBY1Nqq8gQo6ytv0MCOeKVHtEQY5BSvja8KVOWsFpHtqivXX7rJ-=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX8koXw5bsIMupyx6zXlUHmyvPfrC5wpD7Ps8xa9WBx7k0xoNy17mG_keUFS_GyajN18YXSixZgTWfBq_xa7Kf6UZNuq3ywjqCUuVaqmrM_jfoFqOEfGtC3YxriTrZWdDav4hZRzRQ=w1179-h868-v0)

 1. Remove the PHI. This requires locating all the PHI in the clinical text. If you can do this accurately, then the PHI can be removed or skipped, and the desired features can be extracted from the remaining text. 2. Keep only medical terms that are useful for analysis downstream; all other terms will be passively filtered out. Use a knowledge graph, a dictionary of terms from a computed-based representation of medical information, to extract the features. a. A knowledge graph can also help you decide which terms are ambiguous b. An ambiguous term is a term with multiple meanings c. Another text processing problem is how to find similar terms that might be missing from your dictionary. We described the important problem of detecting negation and context in clinical text. To detect negation and context in clinical text, there are software packages that have been designed, such as Negex and Context. Many types of clinical notes have section headings that can be useful in processing the text. One way to find section headings is to look for everything that occurs from the beginning of a line up to the first colon character. Mining clinical text: Pre-process the entire collection of documents containing clinical text[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX_TjS74oeES-q_jHVWJfywO8lDU8LysE0cjaKq4u_JJPshTUsKxi1YV_YgjPiW38do7DRpVzZOAqPkoG3j-64fzvo_o5qA8zZX_Ejklrp5tzXsuloxSQU81UN1pLr_UhOoRUfaXSg=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX90iPDe3EmxOd0myJBmJx_B8cMNC9jF3QFqBdnA0M-nh_WYMAHYeVOJSeVdSxQfFDjkg25vihQC9lP9uiN4TB5UXYvJvQbk4men4B3jMXhD3WLNDUKRFBnOZXCkgZijuHQpjHNIAw=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9pSNKwlmYPqYO5XYY7pRzuOhr1OTmeP5ldcLBNJbQ3rge5KcBwKvSHiKPNW7Xi21Dk_69aolegAA53g7QyS1k3K0pCmPV9cad__meMU8KNgYFZzDWnSn5WrdG-kQaB2EcwgGYvPQ=w1280-h447-v0)

 o Use knowledge graph and negation/context detection to find important terms o The output of this step is indexed positive, present mentions of diseases, drugs, devices and procedures  Indexed: a record of what string was mentioned where  Positive: negations are omitted  Present: personal and family history of the condition are omitted Answer a clinical research question: Use the knowledge graph to find synonyms of terms relevant to that question; use the timeline to help resolve ambiguous terms Count present, positive mentions about the patient: Use the temporal information, the aggregated event and drug mentions, and contextual filters to create a patient-feature matrix and construct patient cohorts for further statistical analysis. Using the temporal information is crucial. IMAGES Medical images serve several important goals: 1. Diagnosis 2. Disease staging and response to treatment 3. Guiding surgical interventions Images capture important details about anatomic structures and physiological processes. However, images are large and require interpretation by human or machine to turn the low-level image elements into meaningful features for downstream prediction tasks. Images are produced by the transduction of some kind of physical energy. [Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-YtgVhmk7Eob2MaHx9vNLcTBigPAvrjkFG3fzl9ULfsXl9aSFeg8pV3XuVNvP0eg2FmbNPDhs6SFcz_55D4Yp6MIMB2oCrK8tYYP3ro0GFhGw-TW3DSoaDIMWEwoWe6AR4Hp7UYg=w134-h39-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9NwaZwGjnYm6yrk0QCb3EdMBmFoqCZT3l9yOXoZ-EByKed1xAZxAVphmUE4Embi8ztlFedTppAfZL6bzFh-cyzP478vcuHDYDKyj2d-fe0sXYy1qrLGDf8qyNfLpvQKUWt3szITw=w639-h223-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-7ICX3CA9PWJVeDYJefwqrMkJvU1kVarv55qm_9GqS27XxX7AuqnaKaHy-CfKi4ZDfQ2WA4Z2S03N360xANd09WoCFj6xOqOmEmfDi4-8jmOcfxYIteP02wNjCkljRJZkukan5=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9H503wB_BGUjCkapiPCpbOMFbyZwExS7aM-bWzLtuT2uvzloCLTakGQ2kAXCQYegh__b-pLuxCwSGb_mC7kKzTmKY45zzd-nwhN5pDK0KzaM5TnP0IS9sq-s3YS16D7uf4wSoWeA=w600-h73-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX-M8yaWsNUdNnXuk9lMoWayt_Xiakdg5UkFiahleweCO_JznofyvXaYqP6lP8DBU2kMXawubnMiNyvlFfjrf7x9Adc3PGTtLV_BCxt9Hq5UNwfZouqYDDWy8JWmqX6mIxUs1hhV7Q=w1280-h444-v0)

 Each image is a two-dimensional rectangular array of values, where the value is a measure of signal intensity. Images can also be three-dimensional, with the third dimension corresponding either to time or to space. There are several ways to categorize medical images: 1. By the imaging modality--typically based on the kind of physical energy that is being detected: Visible light: Photographs or videos X-ray: High-frequency electromagnetic radiation, which is differentially absorbed by bones, air cavities, fluids, and tissues. X-rays, CTs, and related imaging techniques use ionizing radiation, which can cause injury to the exposed tissue in a dose-dependent way. Ultrasound: Uses sound waves with frequencies higher than can be detected by the human ear. These waves propagate through, and are reflected from, tissue depending on the tissue density. Ultrasound has an advantage that it does not harm the tissue. Magnetic resonance and nuclear medicine: Involve the use of magnetic resonance, in which the magnetic properties of atomic nuclei are measured when brief electromagnetic pulses are applied. The density of the tissue can be calculated. The location of specific chemical tracers can also be found. Magnetic resonance also does not harm the tissue. 2. By structural versus functional: Structural images capture the spatial location and organization of anatomic structures. Functional images identify activity or change over time. The most common images accessible for data mining are radiology images. The life cycle of radiology images is: [Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX8N5BJNF4zJ7P66r5F8KaK5d1gKrj00MRMjWNN2CO0htiQqlaqsuHvd63U_yzSu_F47tNoJjOoKeMtF4rH73n9ygQNgCzL8fbx9neJl61Hl27wmDOwO8ZpAx4037VxFlqNRyTsx=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX_6fSi-9S6ONhnCJutrVy5oqjMAST3es2HiV2f9rqCiH3KkQYRl-fZ_XlvzzmppYzofZAPMOWh23dUJ3dKfnRDhHFo-mDbrZR1ahyUJVp0GYMahpJn_fWdfJqW_ackCg4AK0q3E=w600-h73-v0)

 1. Image acquisition 2. Image storage and management: The images are moved from the image acquisition device to a system that stores and organizes the images for retrieval. The storage system also records metadata. a. Digital Imaging and Communications in Medicine (DICOM), is a very widely used standard for the storage and transmission of medical images. DICOM applies to all the imaging modalities described earlier. b. Medical images are stored in Picture Archiving and Communication Systems (PACS). These representation standards and storage systems allow for image Terminology Wearables: Electronic devices that use improved sensor technology to allow individuals to monitor physical activity, exercise and sleep compression to reduce the amount of space occupied. 3. Processing and interpretation a. Traditionally, the content of a medical image is interpreted by a specialist and the text of this report is stored in the EMR. b. Research these days concerns the processing of medical images by computer with the goals to: i. Automate routine tasks, and highlight important features to ease the task of the radiologist or pathologists ii. Automatically produce an expert-level textual description of the contents of the image SIGNALS A signal is created by biomedical equipment that measures some physiological value, and transduces it into an electrical signal, usually a voltage. Voltage is then converted into a numerical value in digital format for computer analysis. Signals are important because they provide continuous, real-time physiological. They are a time series of regularly-spaced values, converted into a digital format. Signals are: [Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX_N6x-k2-W-p2tAVOziGIjJoJuXDevBKYQAprF_trznpolmiS5Ksb9BCa7IqOUrrrh3RkHGFzO1NObR7_0cennq9F4kAd5qxYfcPKyKBSI2UBLFE5_OBrr0lH5maN3VXAuuDLjakg=w134-h39-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX8yvlTHCdNaaQi5FJMPISM9omWS2ZDwffZizVnKwenyHkAi5QHo0Ozz9o-eGiQzSdhA4JhQlH-rp93UI34WdSwTh9TEFp_qFOJ78pctoxf-M_qPCH_7t2XUD1rbRMBtna8RGdHRRg=w579-h125-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX8hemb_0UvrYqSRm4GSGlETCiNivhPVvJDYUkzCqxahrl2b0UOGv5775thAfj3aDlwkwINcBj6S1BTDoTSRQ9obdbVuoXlZ4ayy5oGVYh-AKBiqmKGDOnGtJV0ztZhTqR92H8Fn=w442-h129-v0)

[Image](https://lh3.googleusercontent.com/notebooklm/AKYWMX9GYgVY9iG_NS5JT38cNUfdhSDn5BjKOrsec0xk3ViK8ER_OvS3t7-3cXSTNjoATwCOd2CFJIJLj3orAQSkNjFN9vF2t1OSYlX9XjJgKpXk0hzCdKw6fqt_SicbaYL5CaW3ydWY-g=w600-h73-v0)

 composed of measured values at regularly-spaced intervals as determined by the sampling frequency of the sensor typically captured in clinical contexts in which continuous monitoring is important, such as in the intensive care unit important for wearable devices, such as those that track heart rate The research goals in using signals are similar to that for images: automatic feature detection and automatic construction of an interpretation. Most commercially available devices use proprietary algorithms for feature detection and interpretation of the signal What are the major issues with using signals? We do not know how accurate algorithms are, or which features are crucial for their interpretations to be correct Accuracy of consumer devices is uncertain; there are risks associated with missing real health problems, and falsely reporting problems that do not exist The true value of these devices and apps to health has not yet been demonstrated Privacy concerns

---

## 5. Overview and goals of medical imaging.mp4

### Summary

Medical imaging serves as a vital **non-invasive window** into the human body, revealing both the physical layout of organs and the functional processes occurring within them. This technology is primarily used to **identify specific medical conditions**, ranging from detecting hidden infections and internal injuries to locating foreign objects. Beyond initial diagnosis, these visual tools allow physicians to **track the progression of diseases** and measure how well a patient is responding to a particular therapy. Furthermore, imaging acts as a **critical navigational map** for surgeons, ensuring they can target interventions precisely while avoiding surrounding vital structures.

**Keywords:** Medical imaging, Diagnostic applications, Disease staging, Treatment response, Surgical intervention guidance

### Content

Let's now turn to medical images. Why are medical images important? Medical images are important because they provide a detailed view of anatomic structures and physiological activity inside the human body, usually in a non-invasive way. Images serve several important goals. First is diagnosis. X-rays can show lesions in the lung that arise during a tuberculosis infection. Images can also show evidence of current or recent internal bleeding. They can also show tumors or foreign bodies such as bullets or surgical tools that were accidentally not removed at the end of a procedure. Second is disease staging and response to treatment. This is very valuable for certain kinds of cancers. Depending upon the size of the tumor and whether has spread to adjacent or distant locations in the body determines the kinds of cancer treatments that are appropriate. Medical imaging can be used to monitor the size of the tumor to assess the effectiveness of the treatment. Third is guiding surgical interventions. A surgeon needs to know where the tumor or foreign body is, what structure It is near and whether there is evidence of internal bleeding.

---

## 6. Overview of biomedical signals.mp4

### Summary

Biomedical signals serve as the essential bridge between human biology and technology by converting **physiological phenomena** into readable data. This process begins when specialized equipment measures bodily functions and **transduces them into electrical voltages**, which are then transformed into a **digital format** for computational evaluation. By translating complex internal states like heart rhythms or oxygen levels into numerical values, medical professionals can perform **precise computer analysis** to monitor a patient's health. Ultimately, this systematic conversion allows raw physical activity to become **actionable diagnostic information**.

**Keywords:** Biomedical signals, Physiological measurements, Electrical voltage, Signal transduction, Digital data conversion

### Content

A signal is created by biometical equipment that measures some physiological value and transduces it into an electrical signal, usually a voltage. That voltage is then converted into numerical value in digital format for computer analysis. Examples of signals are heart rate, oxygen saturation, and the electroc cardiogram referred to as ECG or EKG.

---

## 7. Practical approach to processing clinical text.mp4

### Summary

The objective of this text is to provide a **practical framework for extracting clinical features** from medical records to enable research without requiring a full linguistic "understanding" of the documents. Rather than manually scrubbing sensitive data, the author suggests a **passive de-identification strategy** by using medical dictionaries and knowledge graphs to isolate only relevant clinical terms. This process is refined by **contextual filtering**, which identifies and removes negated findings, historical data, and ambiguous abbreviations to ensure the remaining data is both positive and present. To bolster the analysis, the text outlines methods for **term expansion through linguistic patterns** and the use of temporal logic to organize events into a **patient feature matrix**. Ultimately, these streamlined, pre-processed datasets allow researchers to effectively **construct patient cohorts and conduct statistical analyses** based on the chronological relationship between medical events.

**Keywords:** Clinical text processing, Protected health information, Feature extraction, Knowledge graphs, Downstream analyses

### Content

Some people assume that understanding the contents of a document is necessary in order to make use of the document. We do not advocate for using full natural language processing. The ultimate goal is not to understand the contents of the document. Instead, it is to identify features in the text that will enable downstream analyses that answer our questions. This may or may not require much understanding of the document contents. Here's a practical approach to the processing of clinical text to extract features for downstream analyses. First, you need to consider the issue of protected health information or PHI. There are two main approaches. In the first, you may remove the protected health information. This requires locating all the PHI in the clinical text. If you can do this accurately, then the PHI can be removed or skipped and the desired features can be extracted from the remaining text. However, finding all PHI is hard. As an alternative, you keep only medical terms that are useful for analysis downstream. All other terms will be passively filtered out. Did To do this, you need a dictionary of terms from a computer-based representation of medical information called a knowledge graph to extract the features. Note that you get deidentification for free because PHI will not appear in a medical dictionary. A knowledge graph can also help you decide which terms are ambiguous. An ambiguous term is one with multiple meanings. This is especially common when using abbreviations. As an example, the string MG might refer to the drug magnesium or it might refer to disease mythenior. Note that these two concepts have different semantic types. One is a drug and one is a disease. Strings that have multiple semantic types are ambiguous. Knowing this, it is straightforward to find them and remove them from the dictionary. Another text processing problem is how to find similar terms that might be missing from your dictionary. Here's an example. Suppose you start with 14 terms related to discomfort and want to find other similar terms. The key idea is that if two different words tend to be found in the middle of short word patterns that are otherwise the same, then those two words probably have the same meaning. To expand the set of target terms, start with a very large corpus. Find all local patterns around the words of interest. Then go back to the corpus and find all words in the middle of those patterns. This idea was originally called Hurst patterns and is now found in many datadriven text processing techniques such as word tovec. In our example, doing this expansion would result in 31 terms. We described the important problem of detecting negation in context in clinical text. There are software packages that have been designed to address this such as negx and context. We mentioned the problem of finding section headings in a clinical document. Many types of clinical notes have section headings that can be useful in processing the text. How could you find section headings? One way is to look for everything that occurs from the beginning of a line up to the first colon character because that is the format typically used when writing a section heading in the Stanford EMR. This produced a list of 826 possible headings. Then an expert reviewed that list by hand to mark the headings containing information that does not refer directly to the patient's current state, such as quote medical/surgical history, unquote. Note that this manual review needs only be done once. The resulting text is then used for context detection. Let's put all these ideas together into an outline from mining clinical text. First, we will pre-process the entire collection of documents containing clinical text. Assume we have a large collection of documents from an EMR. Because these documents are not going to change, we can process them once and store the process results for use in all later analyses. When new documents are added, we perform the same pre-processing step on them. The goal of the pre-processing step is to find important terms in the text using a knowledge graph and negation context detection. The output of this step is indexed positive present mentions for diseases. drugs, devices, and procedures. Indexed means that there is a record of what string was mentioned where. Positive means that negations are emitted. Present means that personal and family history of the condition are emitted. Now, to answer a clinical research question, use the knowledge graph to find synonyms of terms relevant to that question. You can use the timeline to help resolve ambiguous terms. As an example, the term stroke could refer to cerebrovascular stroke or to heat stroke. To figure out which concept is being referred to, use the age of the patient and the season of the year. If the patient is under 18 years of age and it is summer, then heat stroke is much more likely. Note that this processing is done once you have the query. Then count present positive mentions about the patient. Use the temporal information, the aggregated event and drug mentions, and contextual filters to create a patient feature matrix and construct patient cohorts for further statistical analysis. Using the temporal information is crucial. For example, a case in which mentions of a drug occurs after an outcome is different from a case where a drug precedes the outcome.

---

## 8. Privacy and de-identification.mp4

### Summary

Safeguarding medical records requires a deep understanding of the risks associated with **protected health information (PHI)**, as leaks can cause significant legal and personal harm. While **anonymization** aims for the often unattainable goal of permanent untraceability, **de-identification** focuses on the practical task of removing or masking specific personal markers. The text outlines three primary strategies for this: the **Safe Harbor method**, which mandates deleting eighteen distinct identifiers; the **statistical method**, which relies on a verified low probability of re-identification; and **hiding in plain sight**, which masks real data by blending it with **synthetic surrogates**. Ultimately, these techniques serve as critical frameworks for balancing the utility of healthcare data with the **ethical necessity of patient privacy**.

**Keywords:** Protected health information, Data de-identification, Patient privacy, Safe harbor method, Statistical re-identification risk

### Content

Textual data can contain protected health information or PHI which cannot be shared without the patients permission. Accidentally leaking PHI can harm the patient, damage the reputation of the healthcare institution, and result in large fines. When discussing the use of data that may contain PHI, two terms are frequently used, anonymization and deidentification. These terms have subtle but important differences in meaning. Anonymization means data cannot be linked to a specific person. Unfortunately, this is extremely difficult to guarantee. The problem is that at some later point, it may be possible to combine external data sources, some of which you are not currently aware of or some of which might not even exist today, to accurately link medical data to a particular person. Deidentification means removal of identifiers that constitute protected health information. First, we find them, then we mask or remove them. We will discuss three methods for deidentification. one, safe harbor. Two, statistical method. And three, hiding in plain sight. The safe harbor method requires the removal of 18 specific items. These include the name, social security number, telephone number, email address, full face photographic images, and others. There was a catch-all statement of quote any other unique identifying number, characteristic, or code unquote. The appearance of these identifiers ers applies not only to the patient but to their relatives, employers and household members. This method obviously depends on accurate identification of these identifiers in the text so that they can be removed. If we cannot identify some item as PHI, then we cannot remove it. In the statistical method, a statistician validates in documents that the statistical risk of reidentification is very small. How is very small defined? That is not entirely clear. One answer is to use the zip code rule from a US law governing patient privacy. A three-digit zip code can be revealed if that zip code area contains more than 20,000 people. So, we infer that we want reidentification risk to be less than one in 20,000. This method is used for some very large insurance claims databases. The statistical method and the safe harbor method are described in detail on the US government's health and human services website. A third method called hiding in plain sight starts with the observation that both manual and automatic methods for deidentification might leave some identifiers in the text. We can only remove the the identifiers that we can find. The hiding in plain sight method replaces text that looks like identifiers with realistic appearing surrogate information. So even if we could not identify the original items that constituted PHI, now we can't pick out the missed PHI item from the synthetic surrogates we injected.

---

## 9. Summary - Signals.mp4

### Summary

This text explores the landscape of modern bio-signals, defining them as **digitized time-series data** captured through accessible, cost-effective sensors. While these tools offer the immense benefit of **continuous physiological monitoring**, the author highlights significant technical hurdles regarding the **automated interpretation and detection** of meaningful patterns. Consequently, the narrative warns of a reliability gap in consumer technology, emphasizing the **clinical risks** of both overlooking genuine medical issues and generating deceptive diagnostic results.

**Keywords:** Physiological measurements, Digital time series, Automatic feature detection, Consumer device accuracy, Health data risks

### Content

In summary, signals are important because they provide continuous real-time physiological measurements using cheap and widely available sensors. They are a time series of regularly spaced values converted into a digital format. The challenges in using signals are automatic feature detection and automatic construction of an interpretation. Many consumer devices are now available, but their accuracy is uncertain. There are risks associated with missing real health problems and falsely reporting that problems do not exist.

---

## 10. Summary.mp4

### Summary

Extracting data from medical records is uniquely challenging because **clinical text** often lacks proper grammar and relies heavily on specialized jargon and shorthand. To navigate this complexity, researchers use **knowledge graphs** to identify key concepts without needing to interpret the full linguistic meaning of every sentence. The process must also prioritize **deidentification** to ensure sensitive patient information remains secure and private. Furthermore, systems must accurately recognize **negation in context** to distinguish between a patient having a condition and simply being tested for it. Overall, these specialized techniques bridge the gap between messy, unstructured notes and **actionable medical insights**.

**Keywords:** Clinical text, Medical jargon, Knowledge graphs, Negation handling, Patient deidentification

### Content

In summary, clinical text is a rich source of features but is messy and requires special techniques. Clinical text differs from ordinary natural language. It contains medical jargon and abbreviations and may not be grammatical. With the help of knowledge graphs, clinical text can often be processed effectively without fully understanding the content. Important issues when processing clinical text are the proper handling of negation in context and deidentification to protect patient privacy.

---

## 11. What are images.mp4

### Summary

Medical images are created through the **transduction of physical energy**, such as light, sound, or radiation, into data arrays that represent the intensity of these signals across two or three dimensions. The text categorizes these images primarily by **imaging modalities**, ranging from traditional visible light and X-rays to more advanced techniques like ultrasound and magnetic resonance imaging. Each method is distinguished by the specific energy source used and its **biological impact**, noting that while some involve ionizing radiation, others are valued for being non-harmful to tissue. Finally, the source differentiates between **structural imaging**, which maps the physical arrangement of anatomy, and **functional imaging**, which tracks physiological activity and movement over time.

**Keywords:** Medical imaging modalities, Image storage dimensionality, Physical energy transduction, Structural vs functional, Ionizing radiation safety

### Content

Images are produced by the transduction of some kind of physical energy. Visible light, X-rays, ultrasonic sound waves, or magnetic resonance. Each image is a two-dimensional rectangular array of values where the value is a measure of signal intensity. Images can also be three-dimensional with a third dimension corresponding either to time, such as in a movie, or to space for volumetric representation. Images may span thousands of measurements on each axis, so they take up considerable space in the computer. Images are often not stored in the EMR system, but in separate image archiving systems. There are several ways to categorize medical images. A common way is to categorize by the imaging modality, typically based on the kind of physical energy that is being detected. The most familiar imaging modality is visible light. These can be photographs of a patient's retina, a region of their skin, or through a microscope views of cells and tissues. They can also be videos such as recorded through the camera. of an endoscope. A second modality is the X-ray. Here the physical energy is high frequency electromagnetic radiation which is differentially absorbed by bones, air cavities, fluids and tissues. The common test X-ray is a two-dimensional projection. A collection of projections from a rotating scanner can produce three-dimensional reconstructions of all the volumes in a specified region of the body. This is called computed tomography or CT. X-rays, CTS, and related imaging techniques use ionizing radiation which can cause injury to the exposed tissue in a dose dependent way. This is their main disadvantage. Third is ultrasound which uses sound waves with frequencies higher than can be detected by the human ear. These waves propagate through and are reflected from tissue depending upon the tissue density. Ultrasound has an advantage that it does not harm the tissue. Ultrasound is commonly used to visualize the motion of the heart and blood and to visualize the development of human fetus during pregnancy. The last major modality is magnetic resonance and nuclear medicine. These involve the use of magnetic resonance in which the magnetic properties of atomic nuclei are measured when brief electromagnetic pulses are applied. Through complex signal processing, the density of the tissue can be calculated. The location of specific chemical tracers can also be found. Magnetic resonance also does not harm the tissue. Another way to categorize medical images is structural versus functional. Structural images capture the spatial location and organization of anatomic structures. These are static images. Functional images identify activity or change over time. This might be physical motion such as the movement of the wall of the beating heart or the flow of blood through the heart or blood vessel. Functional images can also show evidence of physiochemical activity through magnetic spectroscopy or functional magnetic resonance imaging.

---

## 12. What are signals.mp4

### Summary

Signals are defined as **sequential measurements** captured at consistent intervals, serving as a vital tool for **continuous monitoring** in both clinical settings and personal wearable technology. While the complex engineering behind processing these data streams is vast, the primary objective in a research context is the **automated detection of features** to generate immediate, meaningful interpretations. By identifying specific patterns, such as those found in a heart rhythm, these systems aim to provide **diagnostic insights** similar to those once exclusive to medical-grade equipment. Consequently, the integration of this technology into everyday devices is bridging the gap between **consumer health tracking** and professional clinical analysis.

**Keywords:** Signal sampling frequency, Clinical continuous monitoring, Wearable devices, Automatic feature detection, EKG interpretation

### Content

What are signals? Signals are composed of measured values at regularly spaced intervals as determined by the sampling frequency of the sensor. Signals are typically captured in clinical context in which continuous monitoring is important, such as in the intensive care unit. Signals are also important for wearable devices such as those that track heart rate. Signal processing is a large immature area in electrical engineering and not the focus of this course. The research goals in using signals are similar to that for images. Automatic fe detection and automatic construction of an interpretation. As an example, some EKG machines provide a preliminary readout of features from the heart rhythm as well as an interpretation such as the presence of atrial fibrillation. Some smart watches are now doing something very similar and vying to become medical grade.

---

## 13. What are the major issues with using signals.mp4

### Summary

This text examines the practical and ethical complications of using wearable technology to track personal health data. The author highlights that because most devices rely on **proprietary algorithms**, the raw data they collect is often **inconsistent and unverified** by rigorous clinical standards. This lack of transparency leads to a **credibility gap**, where users may experience either false anxiety or a misplaced sense of security regarding their physical well-being. Furthermore, while the **quantified self movement** pushes for innovation through continuous self-monitoring, the actual **medical value and privacy risks** of such pervasive data collection remain largely unproven.

**Keywords:** Proprietary algorithms, Data accuracy, Wearable technology, Quantified self movement, Privacy concerns

### Content

What are the major issues with using signals? Most commercially available devices use proprietary algorithms for feature detection and interpretation of the signal. A wearable on the wrist can measure acceleration in each of the three principal directions. However, these raw measurements need to be converted into higher level features to form useful interpretations. Which arm movements indicate sleep, sitting, standing, walking, and running. And how reliably can these states be determined? Do sleep trackers really measure time asleep and time spent in each of the stages of sleep. In many cases, we do not know how accurate these algorithms are and which features are crucial for their interpretation to be correct. For example, step counts from two different sensors on the same person can vary by up to 30%. This uncertainty creates two problems. These devices may give false reassurances of health, or they may create unnecessary panic over incidental findings that turn out to be false positives. The quantified self movement, a loosely aligned group of experimenters, has promoted the use of wearables for self monitoring analysis. They hope to improve their own health, wellness, and productivity. They're well positioned for knowledge discovery, identifying novel findings that have escaped the scrutiny of clinical trials and conventional medical observation. Some of their ideas have been converted into smartphone apps and wearables. Although these devices are enticing, we do not yet know how much continuous collection and analysis of signals actually improves health states. Their true value to health has not yet been demonstrated. There are also privacy concerns. They do create a new data source currently voluntarily collected and released. However, others may feel pressured into collecting and releasing their own data with considerable loss of privacy.

---

## 14. What is clinical text.mp4

### Summary

Clinical documentation represents a **specialized form of communication** that deviates significantly from the structured, grammatical conventions found in standard literature or scientific journals. Primarily authored by healthcare providers for an **audience of fellow experts**, these records prioritize clinical findings and medical histories over formal linguistic rules, often resulting in **fragmented sentences and jargon**. Because this text serves as a professional shorthand rather than a public narrative, it presents **unique computational challenges** that distinguish it from ordinary natural language. Consequently, the source emphasizes that effectively analyzing these records requires **tailored processing techniques** specifically designed to handle the dense, practical realities of medical shorthand.

**Keywords:** Clinical text, Healthcare providers, Patient documentation, Medical histories, Natural language processing

### Content

First, what is clinical text? Clinical text is different from ordinary natural language and the language used in scientific publication. The text that appears in books, articles, literature abstracts, and posters is written in grammatical English. In contrast, clinical text is written by clinicians or other healthcare providers. The audience is clinicians and those documenting the services provided. Clinical text describes patients, their pathologies, their personal, social, and medical histories and findings made during interviews and procedures. Clinical text is is not written for publication and may not use full sentences. Let's look at an example of some clinical text. This is the text that appears in a progress note documenting a patient visit to a clinic as written by their doctor. Because it is written for other medical experts, it requires special techniques for processing. It is not natural language. Although some researchers insist on using natural language processing or NLP to process clinical text. We will discuss this issue later in this module.

---

## 15. What makes clinical text difficult to handle.mp4

### Summary

Medical documentation is uniquely difficult to process because it deviates from standard language through **ungrammatical structures, inconsistent templates, and institutional jargon**. A primary hurdle for analysis is **negation and context**, as nearly half of clinical content describes conditions a patient does not actually have or refers to the medical histories of family members. Consequently, systems must distinguish between mere mentions of a disease and **present positive findings** to ensure accurate patient assessments. Furthermore, the field is complicated by **privacy concerns and data access burdens**, which hinder the ability of researchers to study these complex narratives effectively.

**Keywords:** Clinical text challenges, Acronyms and abbreviations, Negation detection, Contextual term interpretation, Data access barriers

### Content

We have already mentioned that clinical text is not ordinary English. There are many important challenges to using clinical text. Clinical text can be ungrammatical, have misspellings and concatenations. It can contain short telegraphic phrases, acronyms, and abbreviations which might not have unique interpretations. Some sources, such as radiology reports, are dictated by the clinician and composed deliberately for clear communication, while others, such as progress notes, are written for documentation, so their quality can vary widely. Clinical text can contain many things that are pasted in from some other part of the medical record such as long sets of lab values or vital signs. Some electronic medical record or EMR systems allow the construction of templates which can lead to idiosyncratic and institution specific patterns in clinical notes. A very important problem in analyzing clinical text is the problem of negation. Negation refers to the use of a phrase to indicate that the patient does not have a condition. This is often very important clinically and frequently written in clinical text. For example, the phrase no pneumonia contains the term pneumonia, but that patient does not have pneumonia. So, the analysis needs to detect when a term mentioned is inside a negation. This is important because roughly 40% of the content of clinical text is stated as a negation. A related problem is called context. Clinical text often includes terms that refer to a condition that a patient had before or that a patient's family member has or had. This kind of information is clinic valuable in establishing a diagnosis and so is commonly recorded in clinical text. In one example, a progress note might contain the phrase family history of heart attack. This phrase contains the term heart attack, but the patient did not have a heart attack, someone else in their family did. Therefore, the analysis needs to detect the context of a term mention. Does it refer to the patient or to someone else? Does the term refer to a condition that is present now or does it refer to a condition that happened in the past? In our analysis, we usually want to identify present positive mentions where the occurrence of the phrase indicates the presence of the condition in the patient at the time of writing the note. Negations and phrases about family members should not appear in present positive mentions. Finally, there is pervasive fear, misunderstanding, and confusion around security, privacy, anonymization, and deidentification. This has artificially increased the burden of obtaining data access to clinical text.

---

## 16. Why are images important.mp4

### Summary

Images serve as vital tools for documenting **intricate anatomical details** and **complex physiological functions** within a medical context. Although these visual records contain vast amounts of data, they remain raw information until they are **processed and interpreted** by either experts or specialized technology. The primary goal of this analysis is to distill **low-level elements** into **meaningful features** that can be utilized for accurate clinical predictions. Consequently, while images are inherently rich in data, their true value lies in the **translation of visual patterns** into actionable medical insights.

**Keywords:** Medical imaging, Anatomic structures, Physiological processes, Image interpretation, Feature extraction

### Content

Why are images important? For the purposes of this course, it is important to remember that images capture important details about anatomic structures and physiological processes. However, images are large and require interpretation by human or machine to turn the low-level image elements into meaningful features for downstream prediction tasks.

---

## 17. Why are signals important.mp4

### Summary

The true power of physiological signals lies in their ability to provide **real-time, continuous monitoring**, capturing vital health data that traditional medical records often overlook. Thanks to the growing affordability of sensor technology, **wearable devices** have moved into the mainstream, allowing for the constant tracking of daily habits like exercise and sleep. By analyzing subtle patterns in movement and heart rate, researchers are crafting **novel digital markers** that act as high-tech clues for a person's wellbeing. Ultimately, this technological shift transforms raw biological data into **predictive tools** that can help identify or manage various disease states before they escalate.

**Keywords:** Real-time monitoring, Physiological measurements, Wearable technology, Digital health markers, Disease prediction

### Content

Signals are important because they provide real-time continuous monitoring. The data are available at least in principle with almost no delay. Signals contain physiological measurements which are often missing from other healthcare data sources. Improvements in sensor technology along with marked reductions in cost have created an entirely new class of consumer electronic devices called wearables. These are now in wide use for individual monitoring of phys physical activity, exercise, and sleep. Some of these signals such as heart rate Finger movements and touchscreen typing are being analyzed to develop novel digital markers. These markers might be valuable features to predict health or disease states.

---

## 18. Wrap Up.mp4

### Summary

This text highlights the significance of **unstructured healthcare data**, which is defined by its departure from traditional, tabular formats. By examining **clinical text, images, and physiological signals**, the source illustrates how different data streams provide a **multidimensional view** of a patient’s health and the broader medical system. While text offers descriptive nuance and images capture anatomical detail, real-time signals track active bodily functions, making each unique format **essential for resolving complex clinical inquiries**. Ultimately, the passage emphasizes that a holistic understanding of medicine requires integrating these **diverse perspectives** rather than relying on a single source of information.

**Keywords:** Unstructured healthcare data, Clinical text, Medical images, Physiological signals, Clinical questions

### Content

This completes our discussion of unstructured healthcare data types, clinical text, images, and signals. They are called unstructured because the data do not appear in the form of a rectangular table. Each source provides a different perspective on the patient and on the healthcare system. Text provides a rich description of clinical reports and observations, but the text is different from ordinary natural language. Images provide a unique view of anatomy and physiology. Signals are real-time measurements of physiological activity. All these perspectives are important in answering clinical questions.

---

