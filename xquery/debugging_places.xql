(: development doc, will eventually be stripped out :)


xquery version "3.1";
declare namespace tei="http://www.tei-c.org/ns/1.0";
(:declare variable $story-uri := replace(tokenize(request:get-uri(), '/')[last()], "-map.xql", ".xml");:)
declare variable $story :=doc('/db/apps/hoax/TEI/tompainesghost_theage_1832_edited.xml');
declare variable $places :=doc('/db/apps/hoax/places/places.xml');
declare variable $place := $places//tei:place;
declare variable $placeNames :=$story//tei:placeName/@ref;
declare option exist:serialize 'method=xhtml media-type=text/html indent=yes';
<section class="container">
<section id="map">
    <div id="mapid"></div>
</section>
<script>{("var mymap = L.map('mapid').setView([51.51424, -0.11017], 13);",

    let $distinct :=distinct-values($placeNames) ! replace(., "#", "")    
    for $ref in $distinct
        let $printplace := $place[@xml:id = $ref]
        let $printname := $printplace/tei:placeName
        let $geo := $printplace/tei:location/tei:geo =>
            normalize-space() =>
            replace(' ',', ')
        return
            ("var circle = L.circle([{", $geo, "}], {
                    
                    color: 'red',
                        fillColor: '#f03',
                        fillOpacity: 0.5,
                        radius: 500
                    }).addTo(mymap);"),
                    
            "L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={pk.eyJ1IjoiZ2FiaWtlYW5lIiwiYSI6ImNqdG5vNjhxODBjcGc0NHFwc202aWg2cXcifQ.SOQ0EIUgnV013TdQeCNQyw}', {
    attribution: 'Map data © <a href=&quot;https://www.openstreetmap.org/&quot;>OpenStreetMap</a> contributors, <a href=&quot;https://creativecommons.org/licenses/by-sa/2.0/&quot;>CC-BY-SA</a>, Imagery © <a href=&quot;https://www.mapbox.com/&quot;>Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoiZ2FiaWtlYW5lIiwiYSI6ImNqdG5vNjhxODBjcGc0NHFwc202aWg2cXcifQ.SOQ0EIUgnV013TdQeCNQyw'
}).addTo(mymap);")

    
}</script>
</section>
(: var marker = L.marker([{$secondgeo}]).addTo(mymap); :)


