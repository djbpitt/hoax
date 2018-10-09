<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    version="3.0">
    <xsl:output method="text" omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <!--<xsl:variable name="filename" as="xs:string" select="'test/'|| replace(, document-uri(.)'.txt', '.xml')">
        </xsl:variable>-->
        <xsl:for-each select="collection('text')">
            <xsl:variable name="name" as="xs:anyURI" select="document-uri()"/>
            <xsl:result-document method="text" omit-xml-declaration="no" href="{replace(substring-before(tokenize($name, '/'), '.'), '.txt', '.xml')}">
            <xsl:text>nice.</xsl:text>
            </xsl:result-document>    
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>