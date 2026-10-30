<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"      
    exclude-result-prefixes="#all"
    version="3.0"> 
    <xsl:result-document method="xhtml" indent="yes" href="rozanski-xslte.html"/>
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
   <!-- KR not sure what the issue is here -->
       
    <xsl:variable name="UFSmarkup" select="document('../../xml/JG_Up-From-Slavery_Mark-Up.xml')"/>
    <xsl:template match="$UFSmarkup">
        <xsl:result-document method="xhtml" indent="yes" href="rozanski-xslte.html">
            
       
           <xsl:template-match select="/">
            <html>
                <head><title> Up From SLavery </title></head>
            <body>
                <ol><xsl:apply-templates select="//chapter" mode="toc"/></ol> <!-- KR This should be making a table of contents of the chapters -->
                <xsl:apply-templates select="//chapter"/>
            
            </body>
          
                </html>
              
        <xsl:template-match select="chapter">
            <h2 id="{count(preceding::chapter)+1}">Chapter <xsl:apply-templates select="@number"/> (<xsl:apply-templates select="count(preceding::chapter)+1"/>)</h2>
            <p><xsl:apply-templates/></p> <!-- KR This is meant to create a numbered list of the chapters -->
        </xsl:template-match>
               
            <xsl:template-match select="chapter" mode="toc">
                <li><a href="#{count(preceding::chapter)+1}"><xsl:apply-templates select="title" mode="toc"/></a></li>
            </xsl:template-match> <!-- This is meant to list the chapter title with the corresponding chapters in the list -->
            
               <xsl:template match="title">
                   <xsl:apply-templates/><br/> <!-- attempt to create a link that brings you to the text of each chapter -->
               </xsl:template>
               <xsl:template match="title" mode="toc">
                   <xsl:apply-templates/>
               </xsl:template>
               
            
       
        </xsl:result-document>
    
    </xsl:stylesheet>