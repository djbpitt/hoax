xquery version "3.1";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare variable $docs :=collection('/db/apps/hoax/TEI');
<section><ul>
{for $doc in $docs
let $date := $doc//tei:date/@when
let $printdate := substring-before($date, '-')
let $title := concat($doc//tei:titleStmt//tei:title, ', ', $printdate)
let $filename := concat(substring-before(tokenize(fn:base-uri($doc), '/')[last()], '.'), ".xml")
order by $date
    return
      <li><a href="http://localhost:8080/exist/apps/hoax/{$filename}">{$title}</a></li>}
</ul></section>      


