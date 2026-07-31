# Extracted from: akshayyelne/Oasis_Project/system prompt/Readme.md
# Generated: 2026-07-31T00:49:45.283Z

I'm Akshay Yelne, passionate about building AI systems. This repository is my collection of System Prompting resources to help you design, control, and optimize LLM behavior effectively.

Feel free to connect with me on social media to discuss further

<div align="center">
  <p>
    <a href="https://www.linkedin.com/in/akshay-yelne" target="_blank"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a> |
    <a href="https://github.com/akshayyelne" target="_blank"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" /></a>
  </p>
</div>



This repository is a comprehensive guide to understanding and designing System Prompts for Large Language Models (LLMs).

It includes:

- 🧠 Core concepts of system prompting  
- ✍️ Prompt design techniques  
- 🎯 Best practices for controlling model behavior  
- 🧩 Real-world prompt patterns and templates  



Comprehensive resources for mastering system prompts.

| Resource Name | Description | Link | Level |
|---------------|-------------|------|-------|
| Introduction to System Prompts | Learn what system prompts are and how they guide LLM behavior | [![YouTube](https://img.shields.io/badge/YouTube-Intro-FF0000?style=flat-square&logo=youtube&logoColor=white)](https://www.youtube.com/watch?v=dOxUroR57xs) | Beginner |
| Prompt Engineering Guide | Comprehensive guide to prompt design techniques and patterns | [![Website](https://img.shields.io/badge/Guide-Prompting-blue?style=flat-square)](https://www.promptingguide.ai/) | Beginner to Intermediate |
| OpenAI Prompting Best Practices | Official best practices for system and user prompts | [![OpenAI](https://img.shields.io/badge/OpenAI-Guide-412991?style=flat-square&logo=openai&logoColor=white)](https://platform.openai.com/docs/guides/prompt-engineering) | Intermediate |
| Anthropic Prompt Engineering | Practical prompt engineering techniques and interactive tutorial | [![GitHub](https://img.shields.io/badge/GitHub-Tutorial-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/anthropics/prompt-eng-interactive-tutorial) | Intermediate |
| Advanced Prompting Techniques | Deep dive into structured prompting, constraints, and system behavior control | [![IBM](https://img.shields.io/badge/IBM-Guide-052FAD?style=flat-square&logo=ibm&logoColor=white)](https://www.ibm.com/think/topics/prompt-engineering-techniques) | Advanced |



Core concepts for designing effective system prompts.

| Concept | Description | Example |
|--------|-------------|---------|
| Role Definition | Define assistant behavior and persona | "You are an expert AI engineer..." |
| Instruction Clarity | Clear and explicit instructions improve output quality | "Provide step-by-step explanation..." |
| Output Formatting | Control structure of responses | "Respond in bullet points..." |
| Constraints | Limit model behavior | "Do not hallucinate. If unsure, say I don't know." |
| Tone Control | Define tone and style | "Use a professional and concise tone." |



Reusable prompt patterns for common use cases.

| Pattern | Description | Example |
|--------|-------------|---------|
| Expert Role Prompt | Assign domain expertise | "You are a senior data scientist..." |
| Step-by-Step Reasoning | Encourage logical reasoning | "Think step by step before answering." |
| Structured Output | Enforce JSON or formatted output | "Return response in JSON format..." |
| Guardrails Prompt | Add safety and constraints | "Avoid unsafe or harmful content." |
| Context Injection | Provide additional context | "Use the following context to answer..." |



Guidelines for writing effective system prompts.

- ✅ Be explicit and specific  
- ✅ Define role and expectations clearly  
- ✅ Use structured output when needed  
- ✅ Add constraints to reduce hallucinations  
- ✅ Keep prompts concise but informative  
- ✅ Iterate and test prompts regularly  



Where system prompts are commonly used.

| Use Case | Description |
|----------|-------------|
| Chatbots | Control assistant tone and behavior |
| AI Agents | Define reasoning and tool usage |
| RAG Systems | Guide retrieval + generation behavior |
| Code Assistants | Enforce coding standards |
| Enterprise AI | Apply compliance and guardrails |



Explore deeper concepts in system prompting.

| Topic | Description | Link |
|------|-------------|------|
| Prompt Chaining | Multi-step prompt workflows | [Link](https://www.promptingguide.ai/) |
| Tool Usage Prompts | Enable function/tool calling | [Link](https://platform.openai.com/docs/guides/function-calling) |
| Evaluation of Prompts | Measuring prompt effectiveness | [Link](https://github.com/openai/evals) |
| Prompt Optimization | Improve prompt performance | [![IBM](https://img.shields.io/badge/IBM-Optimization-052FAD?style=flat-square&logo=ibm&logoColor=white)](https://www.ibm.com/think/topics/prompt-optimization#2014952965) |



```text
You are an expert AI assistant.

Your goals:
- Provide accurate and concise answers
- Use clear and structured explanations
- Avoid hallucinations

Instructions:
- If unsure, say "I don't know"
- Use bullet points where helpful
- Keep responses professional
