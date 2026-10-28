<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"      
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:variable name="UFSMarkup" select="document('../../xml/JillianGrgic/JG_Up-From-Slavery_Mark-Up.xml')"/>
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    
    <!-- BC - This is supposed to select the XML I am using for the markup, yet I am unsure as to why I am not getting an output. -->
    <xsl:template match="$UFSMarkup">
        <xsl:result-document method="xhtml" indent="yes" href="BC-Exercise-E-results.html">
            <html>
                <head>
                    <h2>Chapter List</h2>
                    </head>
                    <body>
                        <li>
                        <xsl:for-each select="//chapList"> <!-- BC - This function creates the list of chapter titles from the chapter list -->
                                <ol><xsl:apply-templates/></ol>
                        </xsl:for-each>
                            <xsl:for-each select="distinct-values(//HistRef)"> <!-- BC - Unfortuately, with how our markup has proceeded, I am finding it difficult to attempt to organize the HistRefs in order by chapter and will require assistance in class. This does print the distinct values of each reference, but I am unsure of how to proceed further without assistance. -->
                                <value><ol><xsl:value-of select="."/></ol></value>
                            </xsl:for-each>
                        </li>
                    </body>
            </html>
          </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>