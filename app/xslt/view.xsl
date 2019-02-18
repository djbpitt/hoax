<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
<xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html>
            <head>
               <title>Hoax</title> 
               <link rel="stylesheet" type="text/css" href="CSS/hoax.css"/> 
               <link rel="icon" href="typewriter.jpg"/>
               <meta charset="UTF-8"/>
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
                <section>
                    <xsl:apply-templates/>
                </section>    
            </body>
        </html>
    </xsl:template>
    <xsl:template match="title">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    <xsl:template match="publisher">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    <xsl:template match="body">
        <section class="body">
        <xsl:apply-templates/>
        </section>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template> 
    <xsl:template match="q">
        <q>
            <xsl:apply-templates/>
        </q>
    </xsl:template>    
        
</xsl:stylesheet>