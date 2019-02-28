<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="titleStmt">
        <titleStmt>
            <title><xsl:value-of select="title"/></title>
            <respStmt>
                <resp>Originally published by</resp>
                <name><xsl:value-of select="//publicationStmt/publisher"/></name>
            </respStmt>
            <respStmt>
                <resp>Transcribed and encoded by</resp>
                <name>Gabi Keane</name>
            </respStmt>
        </titleStmt>
    </xsl:template>
    <xsl:template match="publicationStmt">
        <publicationStmt>
            <xsl:copy-of select="publisher"></xsl:copy-of>
        <xsl:copy-of select="date"></xsl:copy-of>
        </publicationStmt>
        <seriesStmt>
            <title>Ghost hoaxes in 19th-century British news media</title>
        </seriesStmt>
    </xsl:template>
    <xsl:template match="sourceDesc">
        <sourceDesc>
        <p>All texts in this collection were sourced from British periodical and newspaper archives, transcribed,and encoded. The citation below was provided by the archive and appears exactly as given.</p>
        <p><xsl:copy-of select="bibl"/></p>
        </sourceDesc>
    </xsl:template>
    <xsl:template match="encodingDesc">
        <encodingDesc>
            
            <projectDesc>
                <p>This document is part of a larger digital collection of stories of ghost hoaxes from the
                    18th and 19th century London newspapers and periodicals. The project explores the
                    beginnings of mass print media in a metropolitan area at a time when technology and
                    education made reading increasingly common and inexpensive.</p>
                <p>The corpus holds 36 individual documents, which reflect a diverse mix of reporting on various
                    hauntings in and around London between 1804 and 1889. The PDF and JPEGs from online databases were
                    transcribed using ABBYFineReader OCR, then corrected and occasionally manually transcribed if document quality
                    necessitated it. After normalization in plain text, all documents were upconverted to TEI XML.</p>
            </projectDesc>
            <editorialDecl>
                <normalization>
                    <p>Earlier texts have had some spelling normalization due to errors in OCR. Typographic em dashes are longer than modern em dashes, so all dashes have been normalized to modern em dash length.</p>
                </normalization>
                <quotation>
                    <p>All extraneous white space used by printers to avoid overlapping with letters has been removed. All quotes are simply tagged with the q tag.</p>
                </quotation>
            </editorialDecl>
            
        </encodingDesc>  
    </xsl:template>
    
    
</xsl:stylesheet>