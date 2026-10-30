<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    <xsl:variable name="UFS" select="document('../../xml/JillianGrgic/JG_Up-From-Slavery_Mark-Up.xml')"/>
    <!--To output the document beginning at the first chapter and going through the document to the last one. I am unsure, with the structuring of this xml document, how to make sure the original paragraph tags stay-->
    <xsl:template match="$UFS">
        <xsl:result-document method="xhtml" indent="yes" href="exercise-e-output-JLG.html">
            <html>
                <head><title>Up From Slavery</title>
                    <link rel="stylesheet" type="text/css" href="exercise-e-JLG.css"/></head>
                <template match="chapter">
                <body>
                        <p><xsl:apply-templates/></p>
                </body>
                </template>
            </html>
        </xsl:result-document>
</xsl:template>
    <!--To connect the css to the html and let the properties show up.-->
    <xsl:template match="person">
        <span class="person"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="project">
        <span class="project"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="HistRef">
        <span class="HistRef"><xsl:apply-templates/></span>
    </xsl:template>
</xsl:stylesheet>