<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compact" omit-xml-declaration="yes"/>
    
    <xsl:variable name="UFS" select="document('../../xml/Up-From-Slavery.xml')"/>
    <xsl:variable name="xspacer" select="30"/>
    <xsl:variable name="yspacer" select="15"/>
    
    <xsl:template match="$UFS">
        <xsl:result-document method="xhtml" indent="yes" href="svg-3-output.html">
            <html>
                <head><title>Up From Slavery</title></head>
                <body>
                    <h1>Tones Mentioned</h1>
                    <svg viewbox="0 0 1000 650">
                        <g transform="(250,10)">
                            
                            <xsl:for-each-group select="//p//tone" group-by="@feeling">
                                
                                <xsl:variable name="toneCount" select="count(current-group())"/>
                                <xsl:variable name="toneSequence" select="position()"/>
                                
                                <line x1="0" x2="{$xspacer*$toneCount}" y1="{$yspacer*$toneSequence}" y2="{$yspacer*$toneSequence}" stroke-width="10" stroke="red"/>
                                <!--JLG: creates each bar in the bar graph-->
                                
                                <text x="-10" y="{$yspacer*$toneSequence}" text-anchor="end"><xsl:value-of select="$toneSequence"/><xsl:text>: </xsl:text> <xsl:apply-templates select="string()[1]"/></text>
                                <!--JLG: labels each bar with the index number and the name of each person-->
                                
                                <text x="{$xspacer*$toneCount + 10}" y="{$yspacer*$toneSequence}" text-anchor="right"><xsl:value-of select="$toneCount"/></text>
                                <!--JLG: adds the count number at the end of each bar-->
                                
                            </xsl:for-each-group>
                            
                            <line x1="0" y1="0" x2="0" y2="{count(//p//tone=>distinct-values())*$yspacer}" stroke="blue" stroke-width="1"/>
                            <!--JLG: reference line-->
                       </g>
                    </svg>  
                </body>
            </html>
            
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>