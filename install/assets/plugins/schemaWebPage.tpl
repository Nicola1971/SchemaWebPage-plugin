//<?php
/**
 * SchemaWebPage
 *
 * Add basic schema.org microdata for WebPage, Article or Blog in your MODX Evolution template
 *
 * @author    Nicola Lambathakis
 * @category    plugin
 * @version    RC 1.3
 * @license	 http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal    @events OnWebPagePrerender,OnParseDocument,OnLoadWebDocument
 * @internal    @installset base
 * @internal    @modx_category Schema4Evo
 * @internal @properties  &CreativeWork= Default itemscope itemtype:;string;WebPage &ContactPageId= Contact page id:;text;6 &SearchResultsPageId= Search Results Page id:;text;8 &itempropImage= Itemprop on all content images:;list;enable,disable;enable &itempropImagePhpThumb= Itemprop on phpthumb images:;list;enable,disable;enable &headlinetag= Headline Tag:;list;h1,h2,h3;h1 &altheadlinetag= Alternate Headline Tag:;list;h2,h3,h4,h5;h3 &KeywordsContainerclass= Keywords container class:;string;taglinks &RatingContainerclass= Rating container class:;string;score &ratingValueclass= Rating value class:;string;outnbsClass &ratingVotesClass= Rating votes class:;string;votesClass
 */

/*
### SchemaWebPage Plugin for MODX Evolution ###
Written By Nicola Lambathakis http://www.tattoocms.it/
Version RC 1.3
Events: OnWebPagePrerender,OnParseDocument,OnLoadWebDocument

Add basic schema.org microdata for "WebPage", "Article" or "Blog" schemas in your MODX Evolution template
http://schema.org/WebPage

Supported Properties in RC 1.3:
- itemscope and itemtype: Default (WebPage), Contactpage, SearchResultsPage or Tv value
- mainContentOfPage / articleBody
- headline
- alternativeHeadline
- image
- keywords (tagLinks snippet)
- rating (anythingRating snippet)

Instructions:

- System Events: OnWebPagePrerender,OnParseDocument,OnLoadWebDocument

- Plugin configuration:

&CreativeWork= Default itemscope itemtype:;string;WebPage &ContactPageId= Contact page id:;text;6 &SearchResultsPageId= Search Results Page id:;text;8 &itempropImage= Itemprop content images:;list;enable,disable;enable &itempropImagePhpThumb= Itemprop on phpthumb images:;list;enable,disable;enable &headlinetag= Headline Tag:;list;h1,h2,h3;h1 &altheadlinetag= Alternate Headline Tag:;list;h2,h3,h4,h5;h3 &KeywordsContainerclass= Keywords container class:;string;taglinks &RatingContainerclass= Rating container class:;string;score &ratingValueclass= Rating value class:;string;outnbsClass &ratingVotesClass= Rating votes class:;string;votesClass


 */

$tvSchema = "SchemaItemScope";  // Set the name of the Template Variable
//$documentIdentifier = ($modx->documentIdentifier);

$SchemaItemScope = $modx->getTemplateVarOutput($tvSchema,id); // Get the template value using API call


$mainContent = array('[*content*]');
// Check the tv value and change content microdata
   if ($SchemaItemScope[$tvSchema] == Blog)
    {
$replace = array('<div id="maincontent" itemprop="articleBody">[*content*]</div>');
 // articleBody for Blog itemprop

} elseif ($SchemaItemScope[$tvSchema] == Article)
   {
$replace = array('<div id="maincontent" itemprop="articleBody">[*content*]</div>');
 // articleBody for Article itemprop
		}
else {
		$replace = array('<div id="maincontent" itemprop="mainContentOfPage">[*content*]</div>');
 // mainContentOfPage for WebPage itemprop
}
$modx->documentOutput = str_replace($mainContent, $replace, $modx->documentOutput);

$e= & $modx->Event;
switch ($e->name) {
	case "OnWebPagePrerender" :

	if ($modx->documentIdentifier == $ContactPageId) {

    $modx->documentOutput= str_replace('<body', '<body itemscope itemtype="http://schema.org/ContactPage" ', $modx->documentOutput); // Contactpage body creative type

} elseif ($modx->documentIdentifier == $SearchResultsPageId) {

    $modx->documentOutput= str_replace('<body', '<body itemscope itemtype="http://schema.org/SearchResultsPage" ', $modx->documentOutput); // Search Results body creative type

} else {
		// Check the template value
        if ($SchemaItemScope[$tvSchema] == PluginValue)
    {

    $modx->documentOutput= str_replace('<body', '<body itemscope itemtype="http://schema.org/'.$CreativeWork.'" ', $modx->documentOutput); // default body creative type

}
else
     $modx->documentOutput= str_replace('<body', '<body itemscope itemtype="http://schema.org/'.$SchemaItemScope[$tvSchema].'" ', $modx->documentOutput); // body creative type tv based
}
	$modx->documentOutput= str_replace('<'.$headlinetag.'', '<'.$headlinetag.' itemprop="headline"', $modx->documentOutput); //headline
	$modx->documentOutput= str_replace('<'.$altheadlinetag.'', '<'.$altheadlinetag.' itemprop="alternativeHeadline"', $modx->documentOutput);  //alternativee headline
	$modx->documentOutput= str_replace('class="'.$KeywordsContainerclass.'"', 'class="'.$KeywordsContainerclass.'" itemprop="keywords"', $modx->documentOutput); //keywords default value "taglinks"  (from tagLinks snippet class)
	$modx->documentOutput= str_replace('class="'.$RatingContainerclass.'"', 'class="'.$RatingContainerclass.'" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating"', $modx->documentOutput); //rating container - default value "score" (from anythingRating snippet class)
	$modx->documentOutput= str_replace('class="'.$ratingValueclass.'"', 'class="'.$ratingValueclass.'" itemprop="ratingValue"', $modx->documentOutput); //rating votes - default value "outnbsClass"  (from anythingRating snippet class)
	$modx->documentOutput= str_replace('class="'.$ratingVotesClass.'"', 'class="'.$ratingVotesClass.'" itemprop="reviewCount"', $modx->documentOutput); //rating counts - default value "votesClass" (from anythingRating snippet class)

if ($itempropImage == enable) {
//check configuration for phpthumb image itremprop////////
$modx->documentOutput= str_replace('src="assets/cache/images/', 'itemprop="image" src="assets/cache/images/', $modx->documentOutput);
} // phpthumb image

    break;

case "OnLoadWebDocument":
	if ($itempropImage == enable) {
	//check configuration for image itremprop////////
	 	$modx->documentObject['content'] = str_replace('<img', '<img itemprop="image"',$modx->documentObject['content']);
		}
		break;
   default :
       return; // stop.
}