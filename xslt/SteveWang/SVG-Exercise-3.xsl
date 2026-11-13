<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:variable name="projSVG" select="document('../../xml/Up-From-Slavery.xml')"/>
    
    <xsl:variable name="xspacer" select="30"/>
    <xsl:variable name="yspacer" select="20"/>
    
    <xsl:template match="$projSVG">
        <xsl:result-document method="xhtml" indent="yes" href="SVG-Exercise-3-Output.html">
            <html>
                <head>
                    <title>Persons in Up From Slavery</title>
                </head>
                <body>
                    <h1>Persons in each chapter of Up From Slavery, by frequency</h1>
                    <svg viewBox="0 0 1000 1000">
                        <g transform="translate(50,50)">
                            <xsl:for-each select=".//chapter">
                                <xsl:variable name="pers-relation" select=".//person/@relation"/>
                                <xsl:variable name="chapter" select="@n"/>
                                <xsl:variable name="chapNum" select="count(preceding::chapter)+1"/>
                                <xsl:for-each-group select=".//person" group-by="@relation">
                                    <xsl:variable name="pers-frequency" select="count(current-group())"/>
                                    <circle cx="{$chapNum*$xspacer}" cy="{$pers-frequency*$yspacer}" r="5" fill="red"/>
                                    <text x="{-1*$xspacer}" y="{$pers-frequency*$yspacer}"><xsl:apply-templates select="$pers-frequency"/></text>
                                </xsl:for-each-group>
                            </xsl:for-each>
                            <line x1="40" y1="300" x2="40" y2="0" stroke="blue" stroke-width="1"/>
                            <line x1="40" y1="300" x2="300" y2="300" stroke="blue" stroke-width="1"/>
                        </g>
                    </svg>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>