xquery version "3.1";

import module namespace hoax ="http://obdurodon.org/hoax" at "../modules/hoax.xqm";
declare namespace tei="http://www.tei-c.org/ns/1.0";

declare variable $docs :=collection('/db/apps/hoax/TEI');

<section class="container"><ol>{

   let $list := hoax:maplist($docs)
   return $list
    
}
</ol></section>    


