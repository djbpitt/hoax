xquery version "3.1";

declare namespace app="http://exist-db.org/test-app/templates";
declare namespace gabi="http://obdurodon.org/gabi"; 


(: declare eXist's external variables :)
declare variable $exist:path external;
declare variable $exist:resource external;
declare variable $exist:controller external;
declare variable $exist:prefix external;
declare variable $exist:root external;

declare variable $basename := substring-before($exist:resource, ".");

(: Capitalizes first letter of a word :)
declare function gabi:caps($input as xs:string) as xs:string {
  upper-case(substring($input, 1, 1)) || substring($input, 2)  
    
};

 declare function local:basicXQuery($query, $params)
    {<dispatch xmlns="http://exist.sourceforge.net/NS/exist">
      <forward url="{$exist:controller}/xquery/{$query}.xql">
       {$params//add-parameter}
    <set-attribute name="xslt.input" value="model"/>
    
    <set-attribute name="xslt.stylesheet" value="{concat($exist:root, $exist:controller, '/xslt/home.xsl')}"/>

      </forward>
      <view>
        <forward servlet="XSLTServlet">
          <clear-attribute name="xslt.input"/>
        </forward>
      </view>
    </dispatch>
};

declare function local:viewsXSL($path, $params)
    {<dispatch xmlns="http://exist.sourceforge.net/NS/exist">
        <forward url="{$exist:controller}/TEI/{$path}.xml">
        {$params//add-parameter}
    <set-attribute name="xslt.input" value="model"/>
    <set-attribute name="xslt.stylesheet" value="{concat($exist:root, $exist:controller, '/xslt/view.xsl')}"/>
      </forward>
      <view>
        <forward servlet="XSLTServlet">
          <clear-attribute name="xslt.input"/>
        </forward>
      </view>
    </dispatch>
    };  


(: [rule 1]: map all *.xql requests to their source files in xquery/, and corresponding xslt stylesheets in xslt/ :)
if (matches($exist:path, '^/[^/]*.xql')) then
  let $query := substring-before(tokenize($exist:path, '/')[last()], '.')
  return local:basicXQuery($query, ())
(: [rule 2]: redirect empty paths to main query :)
  else if ($exist:path eq '/') then
  local:basicXQuery('home', ())
(: [rule 3]: forward RESTful urls expressed as /home to xquery/home.xql :)
else if (starts-with($exist:path, '/home')) then
    local:basicXQuery('home', ())
(: [rule 4]: forward xml links to local:viewsXSL :) 
else if (matches($exist:path, '^/[^/]*.xml')) then
    let $path := substring-before(tokenize($exist:path, '/')[last()], '.')
    return local:viewsXSL ($path, ())
    
(: default rule: just pass through everything else :)
else
    <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
      <cache-control cache="yes"/>
    </dispatch>
    
  
    
