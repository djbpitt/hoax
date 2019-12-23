declare namespace request="http://exist-db.org/xquery/request";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace ft="http://exist-db.org/xquery/lucene";

import module namespace kwic="http://exist-db.org/xquery/kwic";
declare namespace exist = "http://exist.sourceforge.net/NS/exist";
declare option exist:serialize 'method=xhtml media-type=text/html indent=yes';

let $input_search := request:get-parameter("input_search", "string")
(:   :let $close := concat($input_search, "~.6") :)
let $collection := collection('/db/apps/hoax/TEI')
let $articles_exact := $collection//tei:body[ft:query(.,$input_search)]
(:  :let $articles_ngram := $collection//article[ngram:wildcard-contains(., $input_search)] :)
(:  :let $articles_close := $collection//article[ft:query(.,$close)]:)
(:  :let $articles_all := ($articles_exact, $articles_ngram, $articles_close) :)
(:  :let $exactEl := $articles_exact//body//*[ft:query(.,$input_search)]
let $ngramEl := ($articles_ngram//body//p[ngram:wildcard-contains(.,$input_search)], 
  $articles_ngram//body//titleLine[ngram:wildcard-contains(.,$input_search)],
  $articles_ngram//body//media[ngram:wildcard-contains(.,$input_search)])
let $closeEl := $articles_close//body//*[ft:query(.,$close)]:)
return
<section class="container">
    {count($articles_exact)}
</section>





(:  :<div id="searchResults">
    <h3>Exact search results:</h3> :)
(:  :{let $eResults :=
if (count($exactEl) > 0)
  then
    for $e in $exactEl :)
(:  :let $uri := $e/tokenize(base-uri(), '/')[last()]:)
(:  :let $link := $e/ancestor::article//hyperlink
order by $link
return kwic:summarize($e, <config width="60" link="{$link}"/>)
else <p>No results found.</p>
return $eResults
}
<h3>Ngram search results:</h3>
{let $nResults :=
   if (count($ngramEl) > 0)
   then 
       for $n in $ngramEl
       let $link := $n/ancestor::article//hyperlink
       order by $link
       return kwic:summarize($n, <config width="60" link="{$link}"/>)
   else <p>No results found.</p>
   return $nResults
}
<h3>Close (fuzzy) search results:</h3>
{let $cResults :=
if (count($closeEl) > 0)
then
    for $c in $closeEl
(:  :let $uri := $e/tokenize(base-uri(), '/')[last()]:)
let $link := $c/ancestor::article//hyperlink
order by $link
return kwic:summarize($c, <config width="60" link="{$link}"/>)
else <p>No results found.</p>
return $cResults
}</div> :)