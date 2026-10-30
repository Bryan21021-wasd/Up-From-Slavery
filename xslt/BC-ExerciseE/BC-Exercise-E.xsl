<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"      
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:variable name="UFSMarkup" select="document('../../xml/JillianGrgic/JG_Up-From-Slavery_Mark-Up.xml')"/>
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:template match="//HistRef">
        <ul><xsl:apply-templates/></ul>
    </xsl:template>
    <xsl:template match="$UFSMarkup">
        <xsl:result-document method="xhtml" indent="yes" href="BC-Exercise-E-results.html">
            <html>
                <head>
                    <h2>Chapter List</h2>
                    </head>
                    <body>
                        <xsl:for-each select="//chapter"> <!-- BC - This function creates the list of chapter titles from the chapter list -->
                                <xsl:if test="@n"><ol>Chapter <xsl:value-of select="@n"/></ol></xsl:if> <!-- BC - This tests to make sure that it's listing the chapter numbers, as I can't do an apply templates blindly using Chapter. -->
                            <xsl:if test="descendant::HistRef">
                                 <xsl:apply-templates select="./p/HistRef"/> 
                            </xsl:if>
                        </xsl:for-each>
                    </body>
            </html>
          </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>