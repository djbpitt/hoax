<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
<xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html>
            <head>
               <title>19th-century British Ghost Hoaxes</title> 
               <link rel="stylesheet" type="text/css" href="hoax.css"/>
               
            </head>
            <body>
            <nav id="nav">
           <ul>
                <li>
                            <a href="http://localhost:8080/exist/apps/hoax/home.xql">Home</a>
                        </li> 
                <li>
                            <a href="http://localhost:8080/exist/apps/hoax/titles.xql">Collections</a>
                        </li>
                <li>
                            <a href="http://localhost:8080/exist/apps/hoax/maps.xql">Maps</a>
                        </li> 
                <li>
                            <a href="http://localhost:8080/exist/apps/hoax/crit.xql">Crit</a>
                        </li> 
            </ul>    
        </nav>
        <header class="container">
            <h1>Ghost hoaxes in 19th-century British news media</h1>
        </header>
                <section>
                    <xsl:apply-templates/>
                </section>    
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>