SchemaWebPage plugin
====================

Add basic schema.org microdata for "WebPage", "Article" or "Blog" schemas in your MODX Evolution your template

Supported Properties in RC 1.2:
* itemscope and itemtype: Default (WebPage), Contactpage, SearchResultsPage
* mainContentOfPage
* headline
* alternativeHeadline
* image
* keywords (tagLinks snippet)
* rating (anythingRating snippet)

#Example (before and after)

## Before:

```
<body>
<div class="container">
<h1>Title of this page</h1>
<div class="tagLinks">Tags: <a href="..." rel="tag">tag1</a>,<a href="..." rel="tag">tag2</a></div>
<div id="maincontent">
<img src="assets/images/image.png" alt="image test"/>
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
</div>
<div class="anythingRating">
<div id="score_idItem" class="score">
<span class="outnbsClass">0/5 stars</span> <span class="votesClass">(0 votes)</span>
</div>
</div>
```

## After:
```
<body itemscope itemtype="http://schema.org/Blog">
<div class="container">
<h1 itemprop="headline">Title of this page</h1>
<div class="tagLinks" itemprop="keywords">Tags: <a href="..." rel="tag">tag1</a>,<a href="..." rel="tag">tag2</a></div>
<div id="maincontent" itemprop="articleBody">
<img itemprop="image" src="assets/images/image.png" alt="image test"/>
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
</div>
<div class="anythingRating">
<div id="score_idItem" class="score" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
<span class="outnbsClass" itemprop="ratingValue">0/5 stars</span> <span class="votesClass" itemprop="reviewCount">(0 votes)</span>
</div>
</div>

```


### Screenshots:

**SchemaWebPage plugin**

![SchemaWebPage](https://raw.githubusercontent.com/Nicola1971/SchemaWebPage-plugin/master/schemawebpage-plugin-conf-rc12.jpg)

**SchemaItemScope tv**

![Schema tv](https://raw.githubusercontent.com/Nicola1971/SchemaWebPage-plugin/master/itemscopetv.jpg)


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
