<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Hoax</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
                <link rel="stylesheet" type="text/css" href="CSS/hoax.css"/>
            </head>
            <body>
                <section class="container">
                    <header id="head" class="container">
                        <h1>
                            <a href="http://localhost:8080/exist/apps/hoax/home.xql">GHOST HOAXES in
                                19th-C. BRITISH NEWS MEDIA</a>
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
                        <form class="form-inline my-2 my-lg-0" action="http://localhost:8080/exist/apps/hoax/search.xql">
                            <input class="form-control mr-sm-2" type="search" name="input_search" placeholder="Search term" aria-label="Search"/>
                            <button class="btn btn-outline-secondary my-2 my-sm-0">Search</button>
                        </form>
                    </nav>
                </section>

                <xsl:copy-of select="*"/>


            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>