<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    <xsl:variable name="ch789" select="document('ch789markup.xml')"/>

<xsl:template match="$ch789">
    <xsl:result-document method="xhtml" indent="yes" href="exercise-d-output.html"/>
        <html>
            <head><title>chapters</title>
                <link rel="stylesheet" type="text/css" href="Blevinsxslt_e.css"/></head>
            <body>
                <xsl:for-each select=".//div">
                    <xsl:if test="./head">
                        <h2><xsl:apply-templates/></h2>
                    </xsl:if>
                    <xsl:if test="./ab">
                        <p><xsl:apply-templates/></p>
                    </xsl:if>
                </xsl:for-each>
            </body>
        </html>
       
</xsl:template>
    <!--used xsl for each, and used span-->
    <xsl:template match="projecttheme">
        <span class="projecttheme"><xsl:apply-templates/></span>
    </xsl:template> </xsl:result-document>
</xsl:stylesheet><!--i'm not sure why this is giving me a red square???-->