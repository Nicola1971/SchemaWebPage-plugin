//<?php
/**
 * SchemaWebPage
 *
 * Add basic schema.org microdata for WebPage or Blog in your MODX Evolution template
 *
 * @author    Nicola Lambathakis
 * @category    plugin
 * @version    1.0 RC1
 * @license	 http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal    @events OnWebPagePrerender
 * @internal    @installset base
 * @internal    @modx_category Schema4Evo
 * @internal @properties  &CreativeWork= Creative Work Type:;string;WebPage &headlinetag= Headline Tag:;list;h1,h2,h3;h1 &altheadlinetag= Alternate Headline Tag:;list;h1,h2,h3;h3 &KeywordsContainerclass= Keywords container class:;string;taglinks &RatingContainerclass= Rating container class:;string;score &ratingValueclass= Rating value class:;string;outnbsClass &ratingVotesClass= Rating votes class:;string;votesClass
 */

/*
###SchemaWebPage Plugin for MODX Evolution###
Written By Nicola Lambathakis http://www.tattoocms.it/
Version RC1.1
Events: OnWebPagePrerender

Add basic schema.org microdata for "WebPage" or "Blog" schemas in your MODX Evolution template
http://schema.org/WebPage

Supported Properties in RC 1.1:
- type: Default (WebPage), Contactpage, SearchResultsPage
- mainContentOfPage
- headline
- alternativeHeadline
- image
- keywords (tagLinks snippet)
- rating (anythingRating snippet)

Instructions:

- System Events: OnWebPagePrerender OnParseDocument OnWebPageInit

- Plugin configuration:

&CreativeWork= Creative Work Type:;string;WebPage &ContactPageId= Contact page id:;text;6 &SearchResultsPageId= Search Results Page id:;text;8 &headlinetag= Headline Tag:;list;h1,h2,h3;h1 &altheadlinetag= Alternate Headline Tag:;list;h1,h2,h3;h3 &KeywordsContainerclass= Keywords container class:;string;taglinks &RatingContainerclass= Rating container class:;string;score &ratingValueclass= Rating value class:;string;outnbsClass &ratingVotesClass= Rating votes class:;string;votesClass


 */
$mainContent = array('[*content*]');
$replace = array('<div id="maincontent" itemprop="mainContentOfPage">[*content*]</div>');
$modx->documentOutput = str_replace($mainContent, $replace, $modx->documentOutput); // mainContentOfPage


$e= & $modx->Event;
switch ($e->name) {
	case "OnWebPagePrerender" :
	if ($modx->documentIdentifier == $ContactPageId) {

    $modx->documentOutput= str_replace('<body', '<body itemscope itemtype="http://schema.org/ContactPage" ', $modx->documentOutput); // Contactpage body creative type

} elseif ($modx->documentIdentifier == $SearchResultsPageId) {

    $modx->documentOutput= str_replace('<body', '<body itemscope itemtype="http://schema.org/SearchResultsPage" ', $modx->documentOutput); // Search Results body creative type

} else {

     $modx->documentOutput= str_replace('<body', '<body itemscope itemtype="http://schema.org/'.$CreativeWork.'" ', $modx->documentOutput); // body creative type
}
	$modx->documentOutput= str_replace('<'.$headlinetag.'', '<'.$headlinetag.' itemprop="headline"', $modx->documentOutput); //headline
	$modx->documentOutput= str_replace('<'.$altheadlinetag.'', '<'.$altheadlinetag.' itemprop="alternativeHeadline"', $modx->documentOutput);  //alternativee headline
	$modx->documentOutput= str_replace('<img', '<img itemprop="image"', $modx->documentOutput); // image
	$modx->documentOutput= str_replace('class="'.$KeywordsContainerclass.'"', 'class="'.$KeywordsContainerclass.'" itemprop="keywords"', $modx->documentOutput); //keywords default value "taglinks"  (from tagLinks snippet class)
	$modx->documentOutput= str_replace('class="'.$RatingContainerclass.'"', 'class="'.$RatingContainerclass.'" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating"', $modx->documentOutput); //rating container - default value "score" (from anythingRating snippet class)
	$modx->documentOutput= str_replace('class="'.$ratingValueclass.'"', 'class="'.$ratingValueclass.'" itemprop="ratingValue"', $modx->documentOutput); //rating votes - default value "outnbsClass"  (from anythingRating snippet class)
	$modx->documentOutput= str_replace('class="'.$ratingVotesClass.'"', 'class="'.$ratingVotesClass.'" itemprop="reviewCount"', $modx->documentOutput); //rating counts - default value "votesClass" (from anythingRating snippet class)
    break;

   default :
       return; // stop.
}