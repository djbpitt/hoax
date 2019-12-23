xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";
import module namespace hoax ="http://obdurodon.org/hoax" at "../modules/hoax.xqm";


declare variable $story-uri := replace(tokenize(request:get-uri(), '/')[last()], "-map.xql", ".xml");
declare variable $story :=doc(concat('/db/apps/hoax/TEI/', $story-uri));
declare variable $places :=doc('/db/apps/hoax/places/places.xml');
declare variable $place := $places//tei:place;
declare variable $placeNames :=$story//tei:placeName/@ref;

<section class="container">
{
    let $title := hoax:title($story)
    return $title
    }
    <div id="mapid">*</div>
    <div>Map data © <a href=";https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a></div>

<script>{
    let $map := hoax:map($placeNames, $place)
    return $map
}
    
</script>
</section>





