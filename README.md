SchemaWebPage-plugin
====================

Add basic schema.org microdata for "WebPage" or "Blog" schemas in your MODX Evolution your template

![SchemaWebPage](https://raw.githubusercontent.com/Nicola1971/SchemaWebPage-plugin/master/schemawebpage-plugin-conf-rc11.jpg)

Supported Properties in RC 1.1:
* type: Default (WebPage), Contactpage, SearchResultsPage
* mainContentOfPage
* headline
* alternativeHeadline
* image
* keywords (tagLinks snippet)
* rating (anythingRating snippet)

### Instructions:

* Install with Package Manager or Store module

### or

* create a new plugin named **SchemaWebPage**
* copy and paste the plugin code from **schemaWebPage.tpl**

* **System Events:** OnWebPagePrerender

* **Plugin configuration:** 
 
```&CreativeWork= Creative Work Type:;string;WebPage &ContactPageId= Contact page id:;text;6 &SearchResultsPageId= Search Results Page id:;text;8 &headlinetag= Headline Tag:;list;h1,h2,h3;h1 &altheadlinetag= Alternate Headline Tag:;list;h1,h2,h3;h3 &KeywordsContainerclass= Keywords container class:;string;taglinks &RatingContainerclass= Rating container class:;string;score &ratingValueclass= Rating value class:;string;outnbsClass &ratingVotesClass= Rating votes class:;string;votesClass  ```

# Updates

### RC 1.1
* ContactPage and SearchResultPage configuration
* keywords configuration: default class based on tagLinks snippet
* rating configuration: default class based on anythingRating snippet
