xquery version "3.1";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare variable $story :=doc('/db/apps/hoax/TEI/hammersmithghost_times_1804.xml');
declare variable $places :=doc('/db/apps/hoax/places/places.xml');

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
   concat($ref, " or ", $printname, ': ', $printgeo)
   
    