## Multithreading in iOS

Production applications will often need to perform heavier operations such as downloading high-resolution images or a executing non-cached database queries. To prevent stalling the main thread (and a hit in frame rate), Apple has provided a few tools to help you out! 

We'll take a look at Grand Central Dispatch, NSOperations, and the performSelectorInBackground method on NSObject.
