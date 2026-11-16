<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/2000/svg"
    version="3.0">
    <xsl:output method="xml" indent="yes"/> 
    <xsl:variable name="DocMatch" select="document('../../../xml/Up-From-Slavery.xml')"/>
    <!-- BC - Global Variables below -->
    <xsl:variable name="xspacer" select="10"/> 
    <xsl:variable name="yspacer" select="10"/>
    <xsl:variable name="ChapterNumber" select="count(//chapter)"/>
    <xsl:template match="$DocMatch">
        <xsl:result-document method="xml" indent="yes" href="./Results/BC-SVG-3-results.svg">
            <svg viewBox="0 0 1000 1000"> <!-- BC - Makes the svg viewable on most screens fully, and will be scrollable if necessary. -->
                <g transform="translate(50,50)">
                    <xsl:for-each-group select="//HistRef" group-by="@event|@name">
                        <xsl:variable name="HistRef_Count" select="count(current-group())"/>
                        <xsl:variable name="Chapter_Count" select="count(//chapter)"/>
                        <xsl:if test="@event">
                            <line x1="0" x2="{$xspacer*$HistRef_Count}" y1="{$yspacer*$HistRef_Count}" y2="{$yspacer*$HistRef_Count}" stroke-width="10" stroke="red"/>
                        </xsl:if>
                        <xsl:if test="@name">
                            <line x1="0" x2="{$xspacer*$HistRef_Count}" y1="{$yspacer*$HistRef_Count}" y2="{$yspacer*$HistRef_Count}" stroke-width="10" stroke="blue"/>
                        </xsl:if>
                        <!-- BC - Commenting things out for testing purposes<xsl:if test="@event='Civil_War'">
                            <line x1="200" x2="0" y1="100" y2="300"/>
                        </xsl:if>
                        <xsl:if test="@event='Emancipation_Proclamation'">
                            <line x="600" x2="400" y1="300" y2="500"/>
                        </xsl:if>
                        <xsl:if test="@name='/1'">
                            <line x1="400" x2="200" y1="500" y2="600"/>
                        </xsl:if>
                        <xsl:if test="@event='Civil_War'"> --> <!-- BC - These if statements should, in theory, create different ways to create the lines. However, there seems to only be one way to use the historical name references as all of them are marked with /1. I am currently experiencing an error with the svg at the moment, unfortunately. -->
                            <!-- BC - I'm not sure what to do with this if, but am keeping it for future reference. -->
                        <!--</xsl:if>-->
                        <text x="-25" y="{$yspacer*$Chapter_Count}" text-anchor="right"><xsl:value-of select="$Chapter_Count"/></text>
                        <line x1="0" x2="0" y1="0" y2="400" stroke="black" stroke-width="1"/>
                    </xsl:for-each-group>
                </g>
            </svg>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>