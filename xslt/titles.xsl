<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Home</title>
                <meta charset="UTF-8"/>
            </head>
            <body>
                <h1>19th-century ghost hoaxes in news media</h1>
                <p>Some text about various things</p>
                <ul>
                    <xsl:apply-templates/>
                </ul>    
            </body>
        </html>
    </xsl:template>
    <xsl:template match="li">
        <li>
            <a href="{@href}">
            <xsl:apply-templates/>
            </a>
        </li>
    </xsl:template>
  
</xsl:stylesheet>