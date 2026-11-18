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
    <xsl:variable name="xspacer" select="20"/> 
    <xsl:variable name="yspacer" select="10"/>
    <xsl:variable name="ChapterNumber" select="count(//chapter)"/>
    <xsl:variable name="HistRef_EmanProc" select="//HistRef[@event='Emancipation_Proclamation']=>count()"/>
    <!-- BC - commenting this varaible out as it surves no purpose at the moment. <xsl:variable name="HistRef_name" select="//HistRef[@name]=>count()"/> -->
    <xsl:variable name="HistRef_War" select="//HistRef[@event='Civil_War']=>count()"/>
    <xsl:variable name="HistRef_Lincoln" select="//HistRef[@name='Lincoln']=>count()"/>
    <xsl:template match="$DocMatch">
        <xsl:result-document method="xml" indent="yes" href="../Results/BC-SVG-3-results.svg">
            <svg viewBox="0 0 1000 1000"> <!-- BC - Makes the svg viewable on most screens fully, and will be scrollable if necessary. -->
                <g transform="translate(50,50)">
                    <line x1="0" x2="{$xspacer*$HistRef_War}" y1="{$yspacer*10}" y2="{$yspacer*10}" stroke="blue" stroke-width="15"/>
                    <line x1="0" x2="{$xspacer*$HistRef_Lincoln}" y1="{$yspacer*$HistRef_Lincoln}" y2="{$yspacer*$HistRef_Lincoln}" stroke="red" stroke-width="15"/>
                    <line x1="0" x2="{$xspacer*$HistRef_EmanProc}" y1="{$yspacer*$HistRef_EmanProc}" y2="{$yspacer*$HistRef_EmanProc}" stroke="yellow" stroke-width="15"/>
                    <line x1="0" x2="0" y1="0" y2="150" stroke="black" stroke-width="1"/>
                    <text x="-140" y="{$yspacer*10}" text-anchor="right">References of war <xsl:value-of select="$HistRef_War"/></text>
                    <text x="-160" y="{$yspacer*$HistRef_Lincoln}" text-anchor="right">References of Lincoln <xsl:value-of select="$HistRef_Lincoln"/></text>
                    <text x="-310" y="{$yspacer*$HistRef_EmanProc}" text-anchor="right">References of the Emancipation Proclomation <xsl:value-of select="$HistRef_EmanProc"/></text>
                    <text x="100" y="0" font-size="25" text-anchor="left">All Historical References in Up From Slavery</text>
                    <!--<xsl:for-each-group select="//HistRef" group-by="@event|@name
                        <xsl:variable name="HistRef_Count" select="count(current-group())"/>
                        <xsl:variable name="Chapter_Count" select="//chapter=>count()"/>
                        <xsl:if test="@event">
                            <line x1="0" x2="{$xspacer*$HistRef_Count}" y1="{$yspacer*$HistRef_Count}" y2="{$yspacer*$HistRef_Count}" stroke-width="10" stroke="red"/>
                            <text x="-165" y="{$yspacer*$HistRef_Count}" text-anchor="right">Historical Event Refs <xsl:value-of select="$HistRef_Count"/></text>
                        </xsl:if>
                        <xsl:if test="@name">
                            <line x1="0" x2="{$xspacer*$HistRef_Count}" y1="{$yspacer*$HistRef_Count}" y2="{$yspacer*$HistRef_Count}" stroke-width="10" stroke="blue"/>
                            <text x="-165" y="{$yspacer*$HistRef_Count}" text-anchor="right">Historical Figure Refs <xsl:value-of select="$HistRef_Count"/></text>
                        </xsl:if> -->
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
                        
                       <!-- <line x1="0" x2="0" y1="0" y2="400" stroke="black" stroke-width="1"/>
                    </xsl:for-each-group> -->
                </g>
            </svg>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>