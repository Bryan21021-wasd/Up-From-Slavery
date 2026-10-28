<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:variable name="xmlMarkup" select="document('../../xml/JillianGrgic/JG_Up-From-Slavery_Mark-Up.xml')"/>
    
    <xsl:template match="$xmlMarkup">
        <xsl:result-document method="xhtml" indent="yes" href="Exercise-E-Output.html">
            <html>
                <head>
                    <title>
                        Persons in Up From Slavery
                    </title>
                </head>
                <body>
                    <h1>
                        Persons in Up From Slavery
                    </h1>
                    <table>
                        <tr>
                            <th>
                                Person Relation
                            </th>
                            <th>
                                Person Frequency
                            </th>
                        </tr>
                        <xsl:for-each-group select="//person" group-by="@relation"> <!-->Find all person elements that have the attribute relation.<-->
                            <xsl:sort select="count(current-group())" order="descending"/> <!--Count the number for each relation and list it from high to low.-->
                                <tr>
                                    <td>
                                        <xsl:value-of select="@relation"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="count(current-group())"/>
                                    </td>
                                </tr>
                        </xsl:for-each-group>
                    </table>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>