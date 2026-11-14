<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    <!-- KR not sure what the issue is here -->
    
    <xsl:variable name="UFSmarkup" select="document('../xml/Up-From-Slavery.xml')"/>
    <xsl:template match="$UFSmarkup">
        
        
        
        <xsl:result-document method="xhtml" indent="yes" href="keiraJill_output.html">
            
            <html>
                <head><title> Up From SLavery </title></head>
                <body>
                    <ol>
                        <xsl:apply-templates select="//chapList" mode="toc"/>
                    </ol> <!-- KR This should be making a table of contents of the chapters -->
                    <xsl:apply-templates select="//chapList"/>
                    
                </body>
                
                <head><title>Up From Slavery</title>
                    <link rel="stylesheet" type="text/css" href="exercise-e-JLG.css"/></head>
                <body>
                    <xsl:apply-templates select=".//chapter"/>
                    <xsl:apply-templates select=".//p"/>
                </body>
                
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="chapter">
        <h2 id="{count(preceding::chapter)-2}">Chapter <xsl:apply-templates select="@number"/> (<xsl:apply-templates select="count(preceding::chapter)+1"/>)</h2>
        <p><xsl:apply-templates/></p> <!-- KR This is meant to create a numbered list of the chapters -->
    </xsl:template>
    
    <xsl:template match="chapter" mode="toc">
        <li><a href="#{count(preceding::chapter)-2}"><xsl:apply-templates select="title" mode="toc"/></a></li>
    </xsl:template> <!-- This is meant to list the chapter title with the corresponding chapters in the list -->
    
    <xsl:template match="title"><xsl:text>Chapter </xsl:text>
        <h2><xsl:apply-templates select="../@n"/></h2> 
        <xsl:apply-templates/><br/> <!-- attempt to create a link that brings you to the text of each chapter -->
    </xsl:template>
    <xsl:template match="title" mode="toc">
        <xsl:apply-templates/>
    </xsl:template>

           
    <xsl:template match="chapter">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="title">
        <h2><xsl:apply-templates/></h2>
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