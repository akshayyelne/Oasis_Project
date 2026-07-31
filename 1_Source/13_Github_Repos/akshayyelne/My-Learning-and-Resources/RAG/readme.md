# Extracted from: akshayyelne/My-Learning-and-Resources/RAG/readme.md
# Generated: 2026-07-31T00:49:45.279Z

I'm Akshay Yelne, passionate about building AI systems. This repository is my collection of RAG (Retrieval-Augmented Generation) resources to help you build powerful AI applications.

Feel free to connect with me on social media to discuss further

<div align="center">
  <p>
    <a href="https://www.linkedin.com/in/akshay-yelne" target="_blank"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn" /></a> |
    <a href="https://github.com/akshayyelne" target="_blank"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" alt="GitHub" /></a>
  </p>
</div>


RAG All-in-one is a guide to building Retrieval-Augmented Generation (RAG) applications. It offers a comprehensive collection of tools, libraries, and frameworks for RAG systems, organized by key components of the RAG architecture. This resource serves as a centralized directory to help you discover the most relevant technologies for each part of your RAG pipeline.

### RAG Architecture Diagram

![RAG Architecture](RAG%20Diagram.png)


| Component | Description |
|-----------|-------------|
| [📚 Courses and Learning Materials](#courses-and-learning-materials) | Comprehensive courses and learning resources for mastering RAG systems |
| [📄 Document Ingestor](#document-ingestor) | Tools for ingesting and processing raw documents. Document loaders, parsers, and preprocessing tools |
| [✂️ Chunking Techniques](#chunking-techniques) | Methods and tools for breaking down documents into manageable pieces for processing and retrieval |
| [🔍 Retrieval](#retrieval) | Advanced techniques and methods for retrieving relevant information in RAG systems using LlamaIndex |
| [🔄 Query Transform](#query-transform) | Advanced techniques for improving query quality and retrieval effectiveness in RAG systems |
| [🤖 Agent Framework](#agent-framework) | End-to-end frameworks for building RAG applications. Unified solutions for RAG implementation |
| [📀 Database](#database) | Databases optimized for storing and searching vector embeddings. Vector storage, similarity search, and indexing |
| [📝 Embedding](#embedding) | Models and services for creating text embeddings. Embedding models and APIs |
| [🔧 Fine-tuning](#fine-tuning) | Tools and techniques for customizing LLMs to specific domains or tasks |
| [🤔 Evaluation](#evaluation) | Tools for assessing RAG system performance. Metrics and evaluation frameworks |
| [📺 User Interface](#user-interface) | Tools for building interactive AI interfaces. UI frameworks for RAG applications |
| [🚀 Complete RAG Applications](#complete-rag-applications) | Ready-to-use, comprehensive RAG systems that integrate various components of the RAG stack |



Comprehensive courses and learning resources for mastering RAG systems.

| Course Name | Description | Link | Level |
|-------------|-------------|------|-------|
| Basics of RAG | Introduction to RAG fundamentals, architecture, and core concepts including retrieval, embeddings, and generation | [![YouTube](https://img.shields.io/badge/YouTube-Video%201-FF0000?style=flat-square&logo=youtube&logoColor=white)](https://www.youtube.com/watch?v=wd7TZ4w1mSw&list=PLGk_bcAbcD4dRev0FMQj9DhcB5piNMAOG&index=10) <br> [![YouTube](https://img.shields.io/badge/YouTube-Video%202-FF0000?style=flat-square&logo=youtube&logoColor=white)](https://www.youtube.com/watch?v=MykcjWPJ6T4) <br> [![GitHub](https://img.shields.io/badge/GitHub-Repo-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/langchain-ai/rag-from-scratch/blob/main/README.md) | Beginner |
| Traditional RAG - Build Pipelines | Building end-to-end traditional RAG pipelines including ingestion, chunking, embeddings, vector stores, and retrieval workflows | [![YouTube](https://img.shields.io/badge/YouTube-Video%201-FF0000?style=flat-square&logo=youtube&logoColor=white)](https://www.youtube.com/watch?v=MykcjWPJ6T4) <br> [![YouTube](https://img.shields.io/badge/YouTube-Video%202-FF0000?style=flat-square&logo=youtube&logoColor=white)](https://www.youtube.com/watch?v=adPi3a8fq4c) | Intermediate |
| Agentic RAG - Build Pipelines | Designing agentic RAG systems with tool usage, reasoning loops, dynamic retrieval, and multi-step decision making | [![YouTube](https://img.shields.io/badge/YouTube-Video%201-FF0000?style=flat-square&logo=youtube&logoColor=white)](https://www.youtube.com/watch?v=HodCjnGv8Ag) <br> [![YouTube](https://img.shields.io/badge/YouTube-Video%202-FF0000?style=flat-square&logo=youtube&logoColor=white)](https://www.youtube.com/watch?v=Chl-cRcwVpA) | Advanced |



Tools and libraries for ingesting various document formats, extracting text, and preparing data for further processing.

| Library | Description | Link | GitHub Stars 🌟 |
|---------|-------------|------|-------------|
| LangChain Document Loaders | Comprehensive set of document loaders for various file types | [GitHub](https://github.com/langchain-ai/langchain/tree/master/libs/community/langchain_community/document_loaders) | ![GitHub stars](https://img.shields.io/github/stars/langchain-ai/langchain) |
| LlamaIndex Reader | Flexible document parsing and chunking capabilities for various file formats | [GitHub](https://github.com/run-llama/llama_index/tree/main/llama-index-integrations/readers) | ![GitHub stars](https://img.shields.io/github/stars/jerryjliu/llama_index) |
| Docling | Document processing tool that parses diverse formats with advanced PDF understanding and AI integrations | [GitHub](https://github.com/docling-project/docling) | ![GitHub stars](https://img.shields.io/github/stars/docling-project/docling) |
| Unstructured | Library for pre-processing and extracting content from raw documents | [GitHub](https://github.com/Unstructured-IO/unstructured) | ![GitHub stars](https://img.shields.io/github/stars/Unstructured-IO/unstructured) |
| PyPDF | Library for reading and manipulating PDF files | [GitHub](https://github.com/py-pdf/pypdf) | ![GitHub stars](https://img.shields.io/github/stars/py-pdf/pypdf) |
| PyMuPDF | A Python binding for MuPDF, offering fast PDF processing capabilities | [GitHub](https://github.com/pymupdf/PyMuPDF) | ![GitHub stars](https://img.shields.io/github/stars/pymupdf/PyMuPDF) |
| MegaParse | Versatile parser for text, PDFs, PowerPoint, and Word documents with lossless information extraction | [GitHub](https://github.com/QuivrHQ/MegaParse) | ![GitHub stars](https://img.shields.io/github/stars/QuivrHQ/MegaParse) |
| Adobe PDF Extract | A service provided by Adobe for extracting content from PDF documents | [Link](https://developer.adobe.com/document-services/docs/overview/legacy-documentation/pdf-extract-api/quickstarts/python/) |  |
| Azure AI Document Intelligence | A service provided by Azure for extracting content including text, tables, images from PDF documents | [Link](https://developer.adobe.com/document-services/docs/overview/legacy-documentation/pdf-extract-api/quickstarts/python/) |  |


Methods and tools for breaking down documents into manageable pieces for processing and retrieval.

| Technique | Description | Link | Code Example |
|-----------|-------------|----------|--------------|
| Fixed Size Chunking | Splits text into chunks of specified character length. Simple and computationally efficient. Key concepts: chunk size, overlap, separator. | [Link](https://www.youtube.com/watch?v=8OJC21T2SL4&t=450s) | [Code Example](https://docs.llamaindex.ai/en/stable/api_reference/node_parsers/sentence_splitter/) |
| Recursive Chunking | Hierarchically divides text using multiple separators in sequence. Respects text structure by recursively applying different separators. | [Link](https://www.youtube.com/watch?v=8OJC21T2SL4&t=966s) | [Code Example](https://python.langchain.com/v0.1/docs/modules/data_connection/document_transformers/recursive_text_splitter/) |
| Document Based Chunking | Splits content according to document's inherent structure (headers, code blocks, tables, etc.). Format-aware chunking for Markdown, Python, JS, etc. | [Link](https://medium.com/@david.richards.tech/document-chunking-for-rag-ai-applications-04363d48fbf7) | [Code Example](https://python.langchain.com/v0.1/docs/modules/data_connection/document_transformers/markdown_header_metadata/) |
| Semantic Chunking | Creates chunks based on semantic similarity rather than size. Keeps related content together by analyzing embedding similarity at potential breakpoints. | [Link](https://www.youtube.com/watch?v=8OJC21T2SL4&t=1933s) | [Code Example](https://colab.research.google.com/github/run-llama/llama_index/blob/main/docs/docs/examples/node_parsers/semantic_chunking.ipynb) |
| Agentic Chunking | Uses LLM-based agents to intelligently determine chunk boundaries based on context and content. Can identify standalone propositions for optimal chunking. | [Link](https://www.youtube.com/watch?v=8OJC21T2SL4&t=2889s) | [Code Example](https://github.com/Ranjith-JS2803/Agentic-Chunker) |


Advanced techniques and methods for retrieving relevant information in RAG systems using LlamaIndex.

| Technique | Description | Implementation | Link |
|-----------|-------------|----------------|-----------|
| Fusion Retrieval | Combines different retrieval methods for more comprehensive results | - Hybrid retriever combining keyword and vector search<br>- Customizable weighting between retrieval methods | [Link](https://docs.llamaindex.ai/en/stable/examples/low_level/fusion_retriever/) |
| Intelligent Reranking | Advanced scoring mechanisms to improve relevance ranking | - LLM-based reranking with custom prompts<br>- Metadata-aware reranking<br>- Cross-encoder reranking | [Link](https://docs.llamaindex.ai/en/stable/examples/workflow/rag/) |
| Multi-faceted Filtering | Various filtering techniques to refine results | - Metadata filtering with custom filters<br>- Similarity threshold filtering<br>- Content-based filtering | |
| Hierarchical Indices | Multi-tiered system for efficient information navigation | - Summary index for high-level overview<br>- Document index for detailed retrieval<br>- Recursive retrieval across indices | [Link](https://medium.com/@nirdiamant21/hierarchical-indices-enhancing-rag-systems-43c06330c085) |
| Ensemble Retrieval | Combines multiple retrieval models for robust results | - Multiple embedding models<br>- Customizable ensemble strategies<br>- Weighted voting mechanisms | [Link](https://docs.llamaindex.ai/en/stable/examples/retrievers/ensemble_retrieval/) |
| Dartboard Retrieval | Optimizes for both relevance and diversity | - Combined scoring function<br>- Direct optimization for information gain | [Link](https://arxiv.org/html/2407.12101v1) |
| Multi-modal Retrieval | Handles diverse data types for richer responses | - Image-to-text retrieval<br>- Multi-modal embeddings<br>- Cross-modal similarity search | [Link](https://docs.llamaindex.ai/en/stable/examples/multi_modal/gpt4v_multi_modal_retrieval/) |


Advanced techniques for improving query quality and retrieval effectiveness in RAG systems.

| Technique | Description | Implementation | Link |
|-----------|-------------|----------------|-----------|
| Query Transformation | Transforms user queries to improve retrieval effectiveness by generating multiple variations or reformulations of the original query | - Multi-query generation<br>- Query rewriting<br>- RAG-Fusion with reciprocal rank fusion | [Link](https://blog.langchain.dev/query-transformations/) |
| Hypothetical Questions (HyDE) | Generates hypothetical documents that answer the query, then uses these for similarity search to improve retrieval | - LLM-based hypothetical document generation<br>- Embedding-based similarity search<br>- Combined retrieval with original query | [Link](https://python.langchain.com/v0.1/docs/use_cases/query_analysis/techniques/hyde/) |


End-to-end frameworks that provide integrated solutions for building RAG applications.

| Library | Description | Link | GitHub Stars 🌟 |
|-----------|-------------|------|-------------|
| LangChain | Framework for building applications with LLMs and integrating with various data sources | [GitHub](https://github.com/langchain-ai/langchain) | ![GitHub stars](https://img.shields.io/github/stars/langchain-ai/langchain) |
| LlamaIndex | Data framework for building RAG systems with structured data | [GitHub](https://github.com/jerryjliu/llama_index) | ![GitHub stars](https://img.shields.io/github/stars/jerryjliu/llama_index) |
| Haystack | End-to-end framework for building NLP pipelines | [GitHub](https://github.com/deepset-ai/haystack) | ![GitHub stars](https://img.shields.io/github/stars/deepset-ai/haystack) |
| SmolAgents | A barebones library for agents | [GitHub](https://github.com/huggingface/smolagents) | ![GitHub stars](https://img.shields.io/github/stars/huggingface/smolagents) |
| txtai | Open-source embeddings database for semantic search and LLM workflows | [GitHub](https://github.com/neuml/txtai) | ![GitHub stars](https://img.shields.io/github/stars/neuml/txtai) |
| Pydantic AI | Agent Framework / shim to use Pydantic with LLMs | [GitHub](https://github.com/pydantic/pydantic-ai) | ![GitHub stars](https://img.shields.io/github/stars/pydantic/pydantic-ai) |
| OpenAI Agent | A lightweight, powerful framework for multi-agent workflows | [GitHub](https://github.com/openai/openai-agents-python) | ![GitHub stars](https://img.shields.io/github/stars/openai/openai-agents-python) |


Databases optimized for storing and efficiently searching vector embeddings/text documents.

| Database | Description | Link | GitHub Stars 🌟 |
|----------|-------------|------|-------------|
| FAISS | Efficient similarity search library from Facebook AI Research | [GitHub](https://github.com/facebookresearch/faiss) | ![GitHub stars](https://img.shields.io/github/stars/facebookresearch/faiss) |
| Milvus | Open-source vector database | [GitHub](https://github.com/milvus-io/milvus) | ![GitHub stars](https://img.shields.io/github/stars/milvus-io/milvus) |
| Qdrant | Vector similarity search engine | [GitHub](https://github.com/qdrant/qdrant) | ![GitHub stars](https://img.shields.io/github/stars/qdrant/qdrant) |
| Chroma | Open-source embedding database designed for RAG applications | [GitHub](https://github.com/chroma-core/chroma) | ![GitHub stars](https://img.shields.io/github/stars/chroma-core/chroma) |
| pgvector | Open-source vector similarity search for Postgres | [GitHub](https://github.com/pgvector/pgvector) | ![GitHub stars](https://img.shields.io/github/stars/pgvector/pgvector) |
| Weaviate | Open-source vector search engine | [GitHub](https://github.com/weaviate/weaviate) | ![GitHub stars](https://img.shields.io/github/stars/weaviate/weaviate) |
| LanceDB | Developer-friendly, embedded retrieval engine for multimodal AI | [GitHub](https://github.com/lancedb/lancedb) | ![GitHub stars](https://img.shields.io/github/stars/lancedb/lancedb) |
| Pinecone | Managed vector database for semantic search | [Link](https://www.pinecone.io/) |  |
| MongoDB | General-purpose document database | [Link](https://www.mongodb.com/) |  |
| Elasticsearch | Search and analytics engine that can store documents | [Link](https://www.elastic.co/) |  |



Models and services for creating vector representations of text.

| Embedding Solution | Description | Link |
|-------------------|-------------|------|
| OpenAI Embeddings | API for text-embedding-ada-002 and newer models | [Link](https://platform.openai.com/docs/guides/embeddings) |
| Sentence Transformers | Python framework for state-of-the-art sentence embeddings | [Link](https://github.com/UKPLab/sentence-transformers) |
| Cohere Embed | Specialized embedding models API | [Link](https://cohere.com/embed) |
| Hugging Face Embeddings | Various embedding models | [Link](https://huggingface.co/models?pipeline_tag=feature-extraction) |
| E5 Embeddings | Microsoft's text embeddings | [Link](https://huggingface.co/intfloat/e5-large-v2) |
| BGE Embeddings | BAAI general embeddings | [Link](https://huggingface.co/BAAI/bge-large-en-v1.5) |


Tools and techniques for customizing LLMs to specific domains or tasks.

| Library | Description | Link | GitHub Stars 🌟 |
|---------|-------------|------|-------------|
| OpenAI Fine-tuning | API for fine-tuning OpenAI models on custom datasets | [Link](https://platform.openai.com/docs/guides/fine-tuning) |  |
| LLaMA Factory | Unified fine-tuning framework for LLMs with various methods and datasets | [GitHub](https://github.com/hiyouga/LLaMA-Factory) | ![GitHub stars](https://img.shields.io/github/stars/hiyouga/LLaMA-Factory) |
| Unsloth | Efficient fine-tuning for LLMs with 2-5x speedup and reduced memory usage | [GitHub](https://github.com/unslothai/unsloth) | ![GitHub stars](https://img.shields.io/github/stars/unslothai/unsloth) |
| PEFT | Parameter-Efficient Fine-Tuning methods like LoRA, QLoRA, and Adapters | [GitHub](https://github.com/huggingface/peft) | ![GitHub stars](https://img.shields.io/github/stars/huggingface/peft) |
| TRL | Transformer Reinforcement Learning library for RLHF, DPO, and PPO fine-tuning | [GitHub](https://github.com/huggingface/trl) | ![GitHub stars](https://img.shields.io/github/stars/huggingface/trl) |
| LitGPT | Lightweight implementation for fine-tuning LLMs with PyTorch Lightning | [GitHub](https://github.com/Lightning-AI/lit-gpt) | ![GitHub stars](https://img.shields.io/github/stars/Lightning-AI/lit-gpt) |
| Axolotl | User-friendly tool for fine-tuning LLMs with support for multiple architectures | [GitHub](https://github.com/OpenAccess-AI-Collective/axolotl) | ![GitHub stars](https://img.shields.io/github/stars/OpenAccess-AI-Collective/axolotl) |
| Mergekit | Tools for merging multiple fine-tuned LLMs into a single model | [GitHub](https://github.com/cg123/mergekit) | ![GitHub stars](https://img.shields.io/github/stars/cg123/mergekit) |



Tools and frameworks for assessing and improving RAG system performance.

| Library | Description | Link | GitHub Stars 🌟 |
|------|-------------|------|-------|
| FastChat | Open platform for training, serving, and evaluating LLM-based chatbots | [GitHub](https://github.com/lm-sys/fastchat) | ![GitHub stars](https://img.shields.io/github/stars/lm-sys/fastchat) |
| OpenAI Evals | Framework for evaluating LLMs and LLM systems | [GitHub](https://github.com/openai/evals) | ![GitHub stars](https://img.shields.io/github/stars/openai/evals) |
| RAGAS | Ultimate toolkit for evaluating and optimizing RAG systems | [GitHub](https://github.com/explodinggradients/ragas) | ![GitHub stars](https://img.shields.io/github/stars/explodinggradients/ragas) |
| Promptfoo | Open-source tool for testing and evaluating prompts | [GitHub](https://github.com/promptfoo/promptfoo) | ![GitHub stars](https://img.shields.io/github/stars/promptfoo/promptfoo) |
| DeepEval | Comprehensive evaluation library for LLM applications | [GitHub](https://github.com/confident-ai/deepeval) | ![GitHub stars](https://img.shields.io/github/stars/confident-ai/deepeval) |
| Giskard | Open-source evaluation and testing for ML & LLM systems | [GitHub](https://github.com/giskard-ai/giskard) | ![GitHub stars](https://img.shields.io/github/stars/giskard-ai/giskard) |
| PromptBench | Unified evaluation framework for large language models | [GitHub](https://github.com/microsoft/promptbench) | ![GitHub stars](https://img.shields.io/github/stars/microsoft/promptbench) |
| TruLens | Evaluation and tracking for LLM experiments with RAG-specific metrics | [GitHub](https://github.com/truera/trulens) | ![GitHub stars](https://img.shields.io/github/stars/truera/trulens) |
| EvalPlus | Rigorous evaluation framework for LLM4Code | [GitHub](https://github.com/evalplus/evalplus) | ![GitHub stars](https://img.shields.io/github/stars/evalplus/evalplus) |
| LightEval | All-in-one toolkit for evaluating LLMs | [GitHub](https://github.com/huggingface/lighteval) | ![GitHub stars](https://img.shields.io/github/stars/huggingface/lighteval) |
| LangTest | Test suite for comparing LLM models on accuracy, bias, fairness and robustness | [GitHub](https://github.com/JohnSnowLabs/langtest) | ![GitHub stars](https://img.shields.io/github/stars/JohnSnowLabs/langtest) |
| AgentEvals | Evaluators and utilities for measuring agent performance | [GitHub](https://github.com/langchain-ai/agentevals) | ![GitHub stars](https://img.shields.io/github/stars/langchain-ai/agentevals) |


Tools and frameworks for building interactive user interfaces for RAG applications.

| Library | Description | Link | GitHub Stars 🌟 |
|------|-------------|------|-------|
| Streamlit | Turn data scripts into shareable web apps in minutes | [GitHub](https://github.com/streamlit/streamlit) | ![GitHub stars](https://img.shields.io/github/stars/streamlit/streamlit) |
| Gradio | Build and share user interfaces for machine learning models | [GitHub](https://github.com/gradio-app/gradio) | ![GitHub stars](https://img.shields.io/github/stars/gradio-app/gradio) |
| Chainlit | Build Python LLM apps with minimal effort | [GitHub](https://github.com/Chainlit/chainlit) | ![GitHub stars](https://img.shields.io/github/stars/Chainlit/chainlit) |
| SimpleAIChat | Lightweight Python package for creating AI chat interfaces | [GitHub](https://github.com/minimaxir/simpleaichat) | ![GitHub stars](https://img.shields.io/github/stars/minimaxir/simpleaichat) |


Ready-to-use, comprehensive RAG applications that integrate various components of the RAG stack.

| Application | Description | Link | GitHub Stars 🌟 |
|-------------|-------------|------|-------------|
| RAGFlow | Open-source RAG engine based on deep document understanding for truthful question-answering with citations | [GitHub](https://github.com/infiniflow/ragflow) | ![GitHub stars](https://img.shields.io/github/stars/infiniflow/ragflow) |
| AnythingLLM | All-in-one Desktop & Docker AI application with built-in RAG, AI agents, and a no-code agent builder | [GitHub](https://github.com/Mintplex-Labs/anything-llm) | ![GitHub stars](https://img.shields.io/github/stars/Mintplex-Labs/anything-llm) |
| Kotaemon | Clean & customizable RAG UI for chatting with documents, built for both end users and developers | [GitHub](https://github.com/Cinnamon/kotaemon) | ![GitHub stars](https://img.shields.io/github/stars/Cinnamon/kotaemon) |
| Verba | Fully-customizable personal assistant utilizing RAG for querying and interacting with your data, powered by Weaviate | [GitHub](https://github.com/weaviate/Verba) | ![GitHub stars](https://img.shields.io/github/stars/weaviate/Verba) |
