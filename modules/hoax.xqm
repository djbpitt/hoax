xquery version "3.1";
(: tei and project namespaces :)
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace hoax="http://obdurodon.org/hoax";

(: beginning to move some project specific functionality into this XQM file :)


(: title formatting :)
declare function hoax:title($story){
    let $storytitle := $story//tei:titleStmt/tei:title/text()
    let $pub := $story//tei:respStmt[1]/tei:name/text()
    let $date := $story//tei:publicationStmt/tei:date/@when/string(.)
  return
      <div>
      <h2>{$storytitle}</h2>
      <h3>{$pub}</h3>
      <h3>{$date}</h3>
      </div>
    
};
(: create list page for article titles :)
declare function hoax:titlelist($docs){
    
    for $doc in $docs
    let $date := $doc//tei:date/@when
    let $printdate := substring-before($date, '-')
    let $title := concat($doc//tei:titleStmt//tei:title, ', ', $printdate)
    let $filename := concat(substring-before(tokenize(fn:base-uri($doc), '/')[last()], '.'), ".xml")
    order by $date
    return
          <li><a href="{$filename}">{$title}</a></li>
};

(: compile map titles and create links. So far, I've been doing this by creating individual xql files for each map. this isn't scalable
 : filter articles with place references, make the filename into a link so that when clicked it just appends to current URL
 : this solution allowed me to play around with adding drawings and annotations to each map. I'm not against changing this functionality to a more robust solution, but could foresee this solution working well for a project this small :)
 
declare function hoax:maplist($docs){
    for $doc in $docs
    let $filter := $doc[contains(.//tei:placeName/@ref,"#")]
    for $placedoc in $filter
    let $date := $placedoc//tei:date/@when
    let $printdate := substring-before($date, '-')
    let $title := concat($placedoc//tei:titleStmt//tei:title, ', ', $printdate)
    let $filename := concat(substring-before(tokenize(fn:base-uri($placedoc), '/')[last()], '.'), "-map.xql")
    order by $date
return
      <li><a href="{$filename}">{$title}</a></li>
};


(: map script function. eventually hope to determine the setView aspect of this using a variable :)

declare function hoax:map($placeNames, $place){
    ("var mymap = L.map('mapid').setView([51.51424, -0.11017], 13);
    
        L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiZ2FiaWtlYW5lIiwiYSI6ImNqcmxiOG13dzA2cnozeW1xdXB6bW5tc3MifQ.wA4kAitClPDQoCZuYNhrOw', {
            attribution: 'attribution',
                    maxZoom: 18,
                     id: 'mapbox.streets',
                     accessToken: 'pk.eyJ1IjoiZ2FiaWtlYW5lIiwiYSI6ImNqcmxiOG13dzA2cnozeW1xdXB6bW5tc3MifQ.wA4kAitClPDQoCZuYNhrOw'
                    }).addTo(mymap);"),

    let $distinct :=distinct-values($placeNames) ! replace(., "#", "")    
    for $ref in $distinct
        let $printplace := $place[@xml:id = $ref]
        let $printname := $printplace/tei:placeName/text() ! replace(., "'", "") ! concat("'", . , "'")
        let $geo := $printplace/tei:location/tei:geo =>
            normalize-space() =>
            replace(' ',', ')
        return
            ("L.marker([", $geo, "]).addTo(mymap)
    .bindPopup(", $printname, ")
    .openPopup();")
};

(: this is the only way I could get the file to stop error messaging ¯\_(ツ)_/¯ :)
let $end := "end of file"
return $end