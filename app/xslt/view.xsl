<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Hoax</title> 
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
                <link rel="stylesheet" type="text/css" href="CSS/hoax.css"/> 
                <link rel="icon" href="typewriter.jpg"/>
                <meta charset="UTF-8"/>
            </head>
            <body>
                <section class="container">        
                    <header>
                        <h1>
                            <a href="http://localhost:8080/exist/apps/hoax/home.xql">GHOST HOAXES in 19th-C. BRITISH NEWS MEDIA</a>
                        </h1>
                    </header>        
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="http://localhost:8080/exist/apps/hoax/home.xql">Home</a>
                            </li> 
                            <li class="nav-item">
                                <a class="nav-link" href="http://localhost:8080/exist/apps/hoax/titles.xql">Collections</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="http://localhost:8080/exist/apps/hoax/maps.xql">Maps</a>
                            </li> 
                            <li class="nav-item">
                                <a class="nav-link" href="http://localhost:8080/exist/apps/hoax/crit.xql">Crit</a>
                            </li> 
                        </ul>  
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="search term" aria-label="Search"/>
                            <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </nav>
                </section>
                <section class="container" id="textbody">
                    <xsl:apply-templates select="//titleStmt"/>
                    <xsl:apply-templates select="//respStmt"/>
                    <xsl:apply-templates select="//body"/>
                    <xsl:apply-templates select="//teiHeader"/>
                    
                </section>    
            </body>
        </html>
    </xsl:template>
  
    <xsl:template match="titleStmt">
        <h2>
            <xsl:apply-templates select="title"/>
        </h2>
    </xsl:template>
    <xsl:template match="respStmt">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="body">
        <section class="body">
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    <xsl:template match="body//p">
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