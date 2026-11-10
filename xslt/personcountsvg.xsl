<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:variable name="UFS" select="document('Up-From-Slavery.xml.xml')"/>
    <xsl:variable name="xspacer" select="30"/>
    <xsl:variable name="yspacer" select="15"/>
    
    <xsl:template match="$UFS">
    <xsl:result-document method="xhtml" indent="yes" href="svg-output.html">
        <html>
            <head><title>Relatives of Booker T. Washington in "Up From Slavery"</title></head>
            <body>
                <h1>Relatives of Booker T. Washington in "Up From Slavery," by frequency</h1>
            <svg viewBox="0 0 1000 650">
                <g transform="translate(250,10)">
                    <xsl:for-each-group select="//book//chapter//person" group-by="@relation">
                        
                        <xsl:sort select="count(current-group())" order="descending"/>
                        <xsl:variable name="person-count" select="count(current-group())"/>
                        <xsl:variable name="person-sequence" select="position()"/>

                        <line x1="0" x2="{$xspacer * $person-count}" 
                            y1="{$yspacer * $person-sequence}" y2="{$yspacer * $person-sequence}"
                            stroke-width="10" stroke="ffb7c5"/>
                       
                        <text x="-10" y="{$yspacer * $person-sequence}" text-anchor="end">
                            <xsl:value-of select="$person-sequence"/><xsl:text>: </xsl:text>
                        <xsl:apply-templates select="string()[1]"/></text>
                       
                        <text x="{$xspacer * $person-count + 10}" y="{$yspacer * $person-sequence}" text-anchor="right">
                            <xsl:value-of select="$person-count"/></text>
                        
                    </xsl:for-each-group>
                  
                    <line x1="0" y1="0" x2="0" y2="{count(//body//persName=>distinct-values()) * $yspacer}" stroke="fc0fc0" stroke-width="1"/>
                    
                </g>
            </svg>
                <p></p>
            </body>
        </html>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>