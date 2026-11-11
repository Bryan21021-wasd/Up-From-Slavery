<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <!--whc: above you are missing this line:
            xmlns="http://www.w3.org/1999/xhtml"  -->
    
    <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compact" omit-xml-declaration="yes"/>
    <xsl:variable name="UFS" select="document('../../xml/Up-From-Slavery.xml')"/>
    
    <xsl:variable name="xspacer" select="15"/>
    <xsl:variable name="yspacer" select="30"/>
    
    <xsl:template match="$UFS">
        <xsl:result-document method="xml" indent="yes" href="KR-svg3-output.html"><!--whc: should be xhtml, not xml-->
            
            <html>
                <head><title>Project Themes</title></head>
                <body>
                    <h1>Project Themes Mentioned in Each Chapter</h1> <!-- KR goal is to create a bar graph that lists theme occurances in each chapter -->
                    <svg viewBox="0 0 1000 650">
                        <g transform="translate(250,10"><!--whc: missing close paren-->
                            <xsl:for-each-group select="//chapter/project" group-by="@theme">
                                <xsl:sort select="count(current-group())" order="descending"/>
                                
                                
                                <!-- local variables=only operating in current group -->
                                <xsl:variable name="project-occurrence-count" select="count(current-group())"/>
                                <xsl:variable name="theme-sequence" select="position()"/>
                                
                                <!-- KR this is making the bars of the graph -->
                                <line x1="0" x2="{$xspacer*$project-occurrence-count}"
                                    y1="{$yspacer*$theme-sequence}" y2="{$yspacer*$theme-sequence}"
                                    stroke-width="10" stroke="purple"/>
                                <line x1="0" x2="{$xspacer*$project-occurrence-count}"
                                    y1="{$yspacer*$theme-sequence}" y2="{$yspacer*$theme-sequence}"
                                    stroke-width="10" stroke="yellow"/>
                                
                                <!--Kr this will label each bar with name and attribute-->
                                <text x="-10" y="{$yspacer*$theme-sequence}" text-anchor="end">
                                    <xsl:value-of select="$theme-sequence"/><xsl:text> : </xsl:text>
                                    <xsl:apply-templates select="string()"/> </text>
                                
                                <!-- KR this will place the count after each bar -->
                                <text x="{$xspacer*$project-occurrence-count+10}" y="{$yspacer*$theme-sequence}" text-anchor="right">
                                    <xsl:value-of select="$project-occurrence-count"/></text>
                            </xsl:for-each-group>
                        </g>
                    </svg>
                    
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
