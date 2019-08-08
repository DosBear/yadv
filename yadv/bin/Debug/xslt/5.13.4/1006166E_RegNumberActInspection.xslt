<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rnains="urn:customs.ru:Information:CustomsDocuments:RegNumberActInspection:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="rnains:RegNumberActInspection">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Регистрационный номер акта таможенного досмотра/осмотра</title>
            <style type="text/css">
				body {background-color: #cccccc;}

				div.page {
					width: 210mm;
					margin: 6pt auto;
					padding: 10mm;
					background: white;
					border: solid 1px black;
				}

				/*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
				@media print {div.page {border: none; margin: 0; padding: 0;}}

				h1 {
					text-align: center;
					font-size: 16pt;
					margin-bottom: 10pt;
					counter-reset: numbered;
				}
			</style>
         </head>
         <body>
            <div class="page">
               <h1>Регистрационный номер акта таможенного досмотра/осмотра</h1>
			
				Акт таможенного досмотра № 
				<xsl:for-each select="rnains:ActNumber">
                  <span style="text-decoration:underline;">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="."/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </span>
                  <xsl:if test="position()!=last()">,</xsl:if>
               </xsl:for-each>
               <br/>
               <br/>
				Дата таможенного досмотра 
				<span style="text-decoration:underline;">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="rnains:InspectionDate"/>
                  </xsl:call-template>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </span>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
