<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Hoax</title>
                <link rel="stylesheet" type="text/css" href="CSS/hoax.css"/>
            </head>
            <body>
            <section>    
                <header class="container">
            <h1>
                            <a href="http://localhost:8080/exist/apps/hoax/home.xql">GHOST HOAXES in 19th-C. BRITISH NEWS MEDIA</a>
                        </h1>
            
        </header>
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
       </section> 
    
        <xsl:copy-of select="*"/>
       
        
            </body>
        </html>
    </xsl:template>    
</xsl:stylesheet>