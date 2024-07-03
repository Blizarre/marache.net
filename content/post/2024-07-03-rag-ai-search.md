+++
title = "Experiments with Retrieval-Augmented Generation (RAG or AI Search)"
draft = false
date = "2024-07-03T08:37:05+01:00"
thumbnail = "img/head_code.jpg"
+++

Over the weekend, I implemented a Retrieval-Augmented Generation (RAG) pipeline as an experiment. RAG is an AI-driven document search technique. While it is powerful and interesting, the fundamentals turned out to be a lot more basic than I expected.

The source code of the pipeline is available in the [microProjects repo](https://github.com/Blizarre/microProjects/tree/master/weekend_rag).

## What does RAG or AI Search look like?

From the point of view of the user, RAG is a sophisticated document search engine. You prompt it with a question, and it retrieves the relevant information from a document database. For instance, you might ask, "What is the name of the project manager on the Airbus project?" or "Who is Simon's manager?" The system then provides an answer, much like a chatbot.

### How does it work?

In its simplest form, RAG uses a document database (imagine an [Elasticsearch](https://www.elastic.co/) instance with one row per document). A script queries this database using keywords from your question, and the relevant documents are pasted (literally) into a Large Language Model (LLM) prompt with the question. The LLM then generates an answer for that prompt.

### Where does the AI come in?

The AI aspect can be enhanced by using "embeddings," which represent text as vectors of numbers. With a good model, texts with similar meanings/concepts will have similar embeddings. For example, "The doctor asked for the nurse" and "He gave me some pills to sleep tonight" would have closer embeddings than "She is a Software engineer at Airbus." However, in my tests, embeddings struggled with nonsensical or ambiguous keywords (such as lesser-known acronyms, codewords, brand names). When I queried about `Flask` in a corpus of web frameworks, it returned irrelevant results, presumably because in the embeddings Flask is associated with liquor, far west and whiskey!

### Commercial RAG solutions

Interestingly, RAG/AI search solutions from [Azure](https://aws.amazon.com/kendra/), [AWS](https://aws.amazon.com/kendra/), and others follow the same pattern. They provide document databases, connectors to keep the database updated with the data sources, data pipelines for cleaning data, and the infrastructure to run the LLM.

## My weekend RAG pipeline

I built a simple RAG pipeline using the [Haystack](https://haystack.deepset.ai/) library, with [Ollama](https://ollama.com/) running the LLM ([ollama3:8b](https://ollama.com/library/llama3)). ElasticSearch handled keyword indexing and search, while [Chroma DB](https://www.trychroma.com/) stored and searched embeddings.

I used a hybrid approach combining both fuzzy textual search in Elasticsearch and embeddings search. I had to use both to get around the limitations discussed earlier.

I asked the embeddings database for the 5 closest matches directly.

For the textual search, I generated the search keywords using llama3, and then retrieved the top 3 document matching these keywords in Elasticsearch. It gave me a total of 8 documents to use in the LLM. I found that too many documents would overwhelm llama3, which is why I limited myself to that number.

The code for the pipeline is available on [GitHub](https://github.com/Blizarre/microProjects/tree/master/weekend_rag). You can either ingest the data of a book or query the data.

### Experiments

I started with "20,000 Leagues Under the Sea" by Jules Verne, but Llama3 already knew the book too well. I then switched to a lesser-known book I found on the Gutenberg project, ["Pioneer Life in Illinois" by F. M. Perryman
](https://www.gutenberg.org/ebooks/48637). I split the book in 200-words chunks (with 35-word overlap) and ingested each chunk as a document. The main challenge was not text generation, but document retrieval. Getting relevant documents to the LLM was tricky, especially with my limited time and hardware.

I tried alternative models for embeddings like [qwen2:7b](https://ollama.com/library/qwen2), but switching models for the embeddings and the text generation part was taking too much time on my hardware. Besides, the results weren't very different.

I also attempted to index my WhatsApp chat history. However, since the documents were in French, embeddings and keyword searches were not working properly. I tried to use some [french embeddings](https://huggingface.co/croissantllm) but they were not compatible with my ollama setup (it would crash after the import).

## Conclusion

I now understand that the most critical part of RAG is the document search phase, which is probably why AI search work so well (hallucination excepted) for advanced search engines such as Google, Bing or [Kagi](https://kagi.com/fastgpt).

In the example below, you can see that `Did the wolves killed pigs?` was correct (there is a passage about this). It is because the search returned part of the book about pigs being killed by wolves, that the LLM could then use. However the more generic `> Did the wolves killed farm animals?` didn't return relevant results, and the LLM couldn't do anything about it.


### Examples from "Pioneer Life in Illinois"

```
(venv) simon@llm:~/haystack$ python rag.py query
> Did they train as soldiers?
Text search keywords: training soldiers military service recruits enlistment
According to "The Drill" document on page 24, yes, they trained as soldiers. In Illinois, there was a law that all able-bodied men from the age of 18 to 45 should meet and drill as soldiers every alternate Saturday from April till November. The author's father hosted one such gathering, where his cousin John L. Perryman was Captain, Ben. Tallman was Orderly Sergeant, Uncle Philip Perryman was fifer, and Harvey Cummings was drummer.
Prompt length: 6313 bytes

> Did the wolves killed pigs?
Text search keywords: wolves pigs predation livestock farming agriculture
According to the document "The Wolf Chase", yes, the wolves did kill the narrator's father's pigs more than usual in 1841. This led to the father going to get hounds and starting a wolf chase, which is described in detail in that document.
Prompt length: 6626 bytes

> Did the wolves killed farm animals?
Text search keywords: wolves farm animals livestock predation attacks
According to the documents, it is not explicitly stated whether the wolves killed farm animals or not. However, it can be inferred from the text that the wolves were a concern for the settlers, as they are mentioned alongside other wild animals such as bears and panthers.
There is one specific reference to wolves in the document "Wild Animals", where it is mentioned that the young wolves were "a little larger than a rabbit" and were caught by the settlers and their dogs. This suggests that the wolves may have been present on farms or in agricultural areas, but there is no direct evidence of them killing farm animals.
It's worth noting that the text does mention that the settlers had to deal with other problems such as bears and panthers, which could have potentially threatened their livelihoods and food supplies. However, without further information, it is not possible to say for certain whether wolves specifically were a problem for farm animals.
Prompt length: 6330 bytes

> Did they believe in god?
Text search keywords: theism belief religion spirituality god faith
Based on the provided documents, it appears that the author believed in God. In the poem "Christ will Wipe," the author writes:
"For He, who died and rose again
Will smile and wipe away our tears."
This suggests that the author believed in a Christian concept of God as a loving and caring deity who would comfort and forgive people.
Additionally, in the section on "Religion" from the autobiography, the author mentions being raised under the teaching and influence of various Christian denominations, including Methodist, Baptist, Presbyterian, and Christian churches. The author notes that they loved all these preachers and considered them "good, zealous Christian men." This suggests that the author had a strong respect for Christianity and its teachings.
Therefore, based on these documents, it appears that the author believed in God as a loving and caring deity who was central to their religious beliefs.
Prompt length: 4709 bytes
```