SchemaWebPage plugin
====================

Add basic schema.org microdata for "WebPage" or "Blog" schemas in your MODX Evolution your template

**SchemaWebPage plugin**

![SchemaWebPage](https://raw.githubusercontent.com/Nicola1971/SchemaWebPage-plugin/master/schemawebpage-plugin-conf-rc12.jpg)

**SchemaItemScope tv**

![Schema tv](https://raw.githubusercontent.com/Nicola1971/SchemaWebPage-plugin/master/itemscopetv.jpg)

Supported Properties in RC 1.2:
* itemscope and itemtype: Default (WebPage), Contactpage, SearchResultsPage
* mainContentOfPage
* headline
* alternativeHeadline
* image
* keywords (tagLinks snippet)
* rating (anythingRating snippet)

### Instructions:

* Install with Package Manager or Store module
* Assign **SchemaItemScope** tv to all your templates

### or

* create a new plugin named **SchemaWebPage**
* copy and paste the plugin code from **schemaWebPage.tpl**

* **System Events:** OnWebPagePrerender

* **Plugin configuration:** 
 
```&CreativeWork= Default itemscope itemtype:;string;WebPage &ContactPageId= Contact page id:;text;6 &SearchResultsPageId= Search Results Page id:;text;8 &headlinetag= Headline Tag:;list;h1,h2,h3;h1 &altheadlinetag= Alternate Headline Tag:;list;h1,h2,h3;h3 &KeywordsContainerclass= Keywords container class:;string;taglinks &RatingContainerclass= Rating container class:;string;score &ratingValueclass= Rating value class:;string;outnbsClass &ratingVotesClass= Rating votes class:;string;votesClass &itempropImage= Enable itemprop image:;list;enable,disable;enable ```

# Updates

### RC 1.2
* **SchemaItemScope** tv - Override default page itemscope and itemtype
* switch from itemprop mainContentOfPage to articleBody, when itemscope is set to Article or Blog
* enable/disable image itemprop in plugin configuration

### RC 1.1
* ContactPage and SearchResultPage configuration
* keywords configuration: default class based on tagLinks snippet
* rating configuration: default class based on anythingRating snippet
* mainContentOfPage (wrap content system variable)

# To Do
* description
* date 
* author
* comment
