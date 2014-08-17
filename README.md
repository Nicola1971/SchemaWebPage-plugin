SchemaWebPage plugin
====================

Add schema.org microdata for "WebPage", "Article" or "Blog" to your MODX Evolution website without change the html code of your template and your snippets tpls.

This plugin search for html tags and default modx snippets output and automatically adds schema.org microdatata.

Supported Properties in RC 1.3:
* itemscope and itemtype: Default (WebPage), Contactpage, SearchResultsPage or Tv value 
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
<img src="assets/images/image.png" alt="image test"/>
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
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
<img itemprop="image" src="assets/images/image.png" alt="image test"/>
<div id="maincontent" itemprop="articleBody">
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
</div>
<div class="anythingRating">
<div id="score_idItem" class="score" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
<span class="outnbsClass" itemprop="ratingValue">0/5 stars</span> <span class="votesClass" itemprop="reviewCount">(0 votes)</span>
</div>
</div>

```


**SchemaWebPage plugin**

![SchemaWebPage](https://raw.githubusercontent.com/Nicola1971/SchemaWebPage-plugin/master/schemawebpage-plugin-conf-rc13.jpg)

## Configuration parameters:
The default plugin configuration works with the Evolution demo content installation and most used modx snippets, but it can be customized according to the need.

* **Default itemscope itemtype:** default itemscope type applied to body tag of all images (can be overwritten by page tv value) 
* **Contact page id:** id of contact page. http://schema.org/ContactPage
* **Search Results Page id:** id of Search result page. http://schema.org/SearchResultsPage
* **Itemprop on content images:** Enable itemprop="image" for all images in the content field
* **Itemprop on phpthumb images:** Enable itemprop="image" for all phpthumb snippet images (stored in assets/cache/images/)
* **Headline Tag:** Select the Title tag for itemprop="headline"
* **Alternate Headline Tag:** Select the Title tag for  itemprop="alternativeHeadline" 
* **Keywords container class:** Class of the keywords container (default value "tagLinks" based on taglink snippet output)
* **Rating container class:** Class of the external container of rating snippet (default value "score" based on AnythingRating snippet output)
* **Rating value class:** Class of rating value (ie: 5/10) (default value "outnbsClass" based on AnythingRating snippet output)
* **Rating votes class:** Class of rating votes (ie: 42 votes) (default value "votesClass" based on AnythingRating snippet output)

**SchemaItemScope tv**

![Schema tv](https://raw.githubusercontent.com/Nicola1971/SchemaWebPage-plugin/master/itemscopetv.jpg)

### Instructions:

* Install with Package Manager or Store module
* Assign **SchemaItemScope** tv to all your templates

### or

* create a new plugin named **SchemaWebPage**
* copy and paste the plugin code from **schemaWebPage.tpl**

* **System Events:** OnWebPagePrerender OnParseDocument OnLoadWebDocument

* **Plugin configuration:** 
 
```&CreativeWork= Default itemscope itemtype:;string;WebPage &ContactPageId= Contact page id:;text;6 &SearchResultsPageId= Search Results Page id:;text;8 &headlinetag= Headline Tag:;list;h1,h2,h3;h1 &altheadlinetag= Alternate Headline Tag:;list;h1,h2,h3;h3 &KeywordsContainerclass= Keywords container class:;string;taglinks &RatingContainerclass= Rating container class:;string;score &ratingValueclass= Rating value class:;string;outnbsClass &ratingVotesClass= Rating votes class:;string;votesClass &itempropImage= Enable itemprop image:;list;enable,disable;enable ```

# Updates

### RC 1.3
* itemprop image only on content images with OnLoadWebDocument
* support for phpthumb images (can be disabled in the plugin configuration tab)

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
