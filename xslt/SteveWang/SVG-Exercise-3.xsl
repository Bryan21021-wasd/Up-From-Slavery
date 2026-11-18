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
                        <g transform="translate(50,400)">
                            <!--<text x="0" y="{*$yspacer}"><xsl:apply-templates select="$"/></text>-->
                            <xsl:for-each select=".//chapter">
                                <xsl:variable name="pers-relation" select=".//person/@relation"/>
                                <xsl:variable name="chapter" select="@n"/>
                                <xsl:variable name="chapNum" select="@num"/>
                                <xsl:for-each-group select=".//person" group-by="@relation">
                                    <xsl:sort select="count(current-group())" order="ascending"/>
                                    <xsl:variable name="pers-frequency" select="count(current-group())"/>
                                    <xsl:if test="@relation='mother'">
                                    <circle cx="{$chapNum*$xspacer}" cy="{-$pers-frequency*$yspacer}" r="5" fill="red"/>
                                    </xsl:if>
                                    <xsl:if test="@relation='brother'">
                                        <circle cx="{$chapNum*$xspacer}" cy="{-$pers-frequency*$yspacer}" r="5" fill="red"/>
                                    </xsl:if>
                                    <xsl:if test="@relation='sister'">
                                        <circle cx="{$chapNum*$xspacer}" cy="{-$pers-frequency*$yspacer}" r="5" fill="red"/>
                                    </xsl:if>
                                    <text x="{$chapNum*$xspacer}" y="320"><xsl:apply-templates select="$chapter"/></text>
                                    
                                </xsl:for-each-group>
                            </xsl:for-each>
                            <line x1="0" y1="0" x2="0" y2="-400" stroke="blue" stroke-width="1"/>
                            <line x1="0" y1="0" x2="800" y2="0" stroke="blue" stroke-width="1"/>
                        </g>
                    </svg>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>