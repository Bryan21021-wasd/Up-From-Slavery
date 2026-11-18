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
    <xsl:variable name="yspacer" select="40"/>
    
    <xsl:template match="$UFS">
        <xsl:result-document method="xhtml" indent="yes" href="KR-svg3-output.html">
            
            <html>
                <head><title>Project Themes</title></head>
                <body>
                    <h1>Project Themes Mentioned in Each Chapter</h1> <!-- KR goal is to create a bar graph that lists theme occurances in each chapter -->
                    <svg viewBox="0 0 1000 1000">
                        <g transform="translate(150,10)">
                            <g transform="translate(600,5)"> 
                                <text>Key</text>
                            </g>
                            <xsl:for-each select=".//chapter[@num]">
                                <xsl:variable name="chapnum" select="count(preceding::chapter[@num])+1"/>
                                                                                                                            
                            
                                <!-- local variables=only operating in current group -->
                                <xsl:variable name="education-count" select="count(.//project[@theme='education'])"/>
                                <xsl:variable name="inequality-count" select="count(.//project[@theme='inequality'])"/>
                                
                                <!-- KR this is making the bars of the graph -->
                                <line x1="0" x2="{$xspacer*$education-count}"
                                    y1="{$yspacer*$chapnum}" y2="{$yspacer*$chapnum}"
                                    stroke-width="10" stroke="purple"/>
                                <line x1="0" x2="{$xspacer*$inequality-count}"
                                    y1="{$yspacer*$chapnum+10}" y2="{$yspacer*$chapnum+10}"
                                    stroke-width="10" stroke="yellow"/>
                                
                                <!--Kr this is labeling chapter num on side of axis-->          
                                <text x="-12" y="{$yspacer*$chapnum+12}" text-anchor="end">
                                    <xsl:value-of select="$chapnum"/>
                                </text>
                                
                                <!-- KR this will place the count after each bar -->
                                <text x="{$xspacer*$education-count+10}" y="{$yspacer*$chapnum+5}" text-anchor="right">
                                    <xsl:value-of select="$education-count"/></text>
                                <text x="{$xspacer*$inequality-count+10}" y="{$yspacer*$chapnum+20}" text-anchor="right">
                                    <xsl:value-of select="$inequality-count"/></text>
                                
                            </xsl:for-each>
                            <line x1="0" y1="0" x2="0" y2="{count(.//chapter)*$yspacer}" stroke="black" stroke-width="2"/>
                            <!--text x1="0" y1="0" x2="0" y2="{count(.//chapter*$yspacer)}"> </text-->
                        </g>
                    </svg>
                    
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>