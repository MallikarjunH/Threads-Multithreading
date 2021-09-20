## Multithreading in iOS

Production applications will often need to perform heavier operations such as downloading high-resolution images or a executing non-cached database queries. To prevent stalling the main thread (and a hit in frame rate), Apple has provided a few tools to help you out! 

1. Grand Central Dispatch
2. NSOperations
3. performSelectorInBackground     method on NSObject.


# Concurrency
 Executing multiple tasks at the same time in a scalable manner
 
 Ways to achieve concurrency in iOS - Threads, Dispatch Queues, Operation Queues.
 
 Ways to achive Multithreadubg in iOS - Threads, GCD(Grand Central Dispatch)
 Different Types of Dispatch Queues - Main Queues, Concurrent Queues (global dispatch queue), Serial Queue (private queue)
