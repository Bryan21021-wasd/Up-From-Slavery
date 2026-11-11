<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/2000/svg"
    version="3.0">
    <xsl:output method="xml" indent="yes"/> <!-- BC - this is also necessary as SVG is technically an xml format-->
    <xsl:variable name="DocMatch" select="document('../../../xml/Up-From-Slavery')"/>
    <!-- BC - Global variables go here, so they are present throughout the document and only have to be defined once -->
    <xsl:variable name="xspacer" select="30"/> <!-- BC - This is a multiplier for whatever the count is, in order to get a better visual effect. These are the easiest way to adjust a graph. -->
    <xsl:variable name="yspacer" select="20"/>
    <xsl:template match="$DocMatch">
        <xsl:result-document method="xml" indent="yes" href="./Results/BC-SVG-3-results.svg">
            <svg viewBox="0 0 1000 1000"> <!-- BC - Makes the svg viewable on most screens fully, and will be scrollable if necessary. -->
                <g transform="translate(50,50)">
                    <xsl:for-each select="//HistRef">
                        <xsl:value-of select="@event"/>
                    </xsl:for-each>
                </g>
            </svg>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>