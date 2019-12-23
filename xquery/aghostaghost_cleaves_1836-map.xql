xquery version "3.1";
declare namespace tei="http://www.tei-c.org/ns/1.0";

declare variable $story-uri := replace(tokenize(request:get-uri(), '/')[last()], "-map.xql", ".xml");
declare variable $story :=doc(concat('/db/apps/hoax/TEI/', $story-uri));
declare variable $places :=doc('/db/apps/hoax/places/places.xml');
<section id="map" class="container"><ol>{
let $placeNames :=distinct-values($story//tei:placeName/@ref)
for $placeName in $placeNames
    let $ref := replace($placeName, "#", "")
    
let $place := $places//tei:place
let $printplace := $place[@xml:id = $ref]
let $printname := $printplace/tei:placeName
let $geo := $printplace/tei:location/tei:geo
    let $normalgeo := normalize-space($geo)
    let $printgeo := replace($normalgeo, ' ',', ')
   
    
return
   <li>{concat($ref, " or ", $printname, ': ', $printgeo)}
       
   </li>}
     
   </ol>
   </section>
   
