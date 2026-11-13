<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    
    <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compact" omit-xml-declaration="yes"/>
    <xsl:variable name="UFS" select="document('../../xml/Up-From-Slavery.xml')"/>
    
    <xsl:variable name="xspacer" select="15"/>
    <xsl:variable name="yspacer" select="30"/>
    
    <xsl:template match="$UFS">
        <xsl:result-document method="xhtml" indent="yes" href="KR-svg3-output.html">
            
            <html>
                <head><title>Project Themes</title></head>
                <body>
                    <h1>Project Themes Mentioned in Each Chapter</h1> <!-- KR goal is to create a bar graph that lists theme occurances in each chapter -->
                    <svg viewBox="0 0 1000 650">
                        <g transform="translate(250,10)">
                            <xsl:for-each select=".//chapter">
                                <xsl:variable name="chapnum" select="count(preceding::chapter)+1"/>
                            <xsl:for-each-group select=".//project" group-by="@theme">
                                <xsl:sort select="count(current-group())"/>
                                
                                
                                <!-- local variables=only operating in current group -->
                                <xsl:variable name="theme-occurrence-count" select="count(current-group())"/>
                                <xsl:variable name="theme-sequence" select="position()"/>
                                
                                <!-- KR this is making the bars of the graph -->
                                <line x1="0" x2="{$xspacer*$theme-occurrence-count}"
                                    y1="{$yspacer*$theme-sequence}" y2="{$yspacer*$theme-sequence}"
                                    stroke-width="10" stroke="purple"/>   <!-- KR not sure if this is the correct format -->
                                <line x1="0" x2="{$xspacer*$theme-occurrence-count}"
                                    y1="{$yspacer*$theme-sequence+15}" y2="{$yspacer*$theme-sequence+15}"
                                    stroke-width="10" stroke="yellow"/>
                                
                                <!--Kr this will label each bar with name and attribute-->
                                <text x="-10" y="{$yspacer*$theme-sequence}" text-anchor="end">
                                    <xsl:value-of select="$theme-sequence"/><xsl:text> : </xsl:text>
                                    <xsl:apply-templates select="string()"/> </text>
                                
                                <!-- KR this will place the count after each bar -->
                                <text x="{$xspacer*$theme-occurrence-count+10}" y="{$yspacer*$theme-sequence}" text-anchor="right">
                                    <xsl:value-of select="$theme-occurrence-count"/></text>
                            </xsl:for-each-group>
                            </xsl:for-each>
                            <line x1="0" y1="0" x2="0" y2="{count(.//chapter)*$yspacer}" stroke="black" stroke-width="3"/>
                            <text x1="0" y1="0" x2="0" y2="{count(.//chapter*$yspacer)}"> </text>
                        </g>
                    </svg>
                    
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>