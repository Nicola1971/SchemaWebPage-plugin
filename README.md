SchemaWebPage-plugin
====================

Add basic schema.org microdata for "WebPage" or "Blog" schemas in your MODX Evolution your template

Supported Properties in Beta 1.0: 
* type 
* headline
* alternativeHeadline
* image
* keywords (tagLinks snippet)
* rating (anythingRating snippet)

### Instructions:

* Install with Package Manager or Store module

* **System Events:** OnWebPagePrerender

* **Plugin configuration:** 
 
```&CreativeWork= Creative Work Type:;string;WebPage &headlinetag= Headline Tag:;list;h1,h2,h3;h1 &altheadlinetag= Alternate Headline Tag:;list;h1,h2,h3;h3 &KeywordsContainerclass= Keywords container class:;string;taglinks &RatingContainerclass= Rating container class:;string;score &ratingValueclass= Rating value class:;string;outnbsClass &ratingVotesClass= Rating votes class:;string;votesClass```

