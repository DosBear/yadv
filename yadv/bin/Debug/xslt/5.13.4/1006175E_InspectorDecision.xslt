<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ispd="urn:customs.ru:Information:CustomsDocuments:InspectorDecision:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="ispd:InspectorDecision">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Решение должностного лица</title>
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

				h2.numbered:after {
					content: " № " counter(numbered);
					counter-increment: numbered;
				}

				h2 {
					font-size: 14pt;
					text-align: center;
					margin-top: 20pt;
				}


				p {padding-left: 10pt;}
				
				.low 
				{
					font-size: 13;
				}
				
				.auxiliary tbody tr td { border: 0; }
			</style>
         </head>
         <body>
            <div class="page">
               <h2>Решение должностного лица</h2>
               <table border="0">
                  <tbody>
                     <xsl:for-each select="ispd:DecisionDescription">
                        <tr>
                           <td style="vertical-align:top">
                              <xsl:value-of select="position()"/>. </td>
                           <td>
                              <xsl:apply-templates select="."/>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="ispd:DecisionDescription">
      <xsl:apply-templates select="ispd:DocumentInfo"/>
      <xsl:if test="ispd:DecisionText">
		Описание: 
		<xsl:for-each select="ispd:DecisionText">
            <xsl:value-of select="."/>
         </xsl:for-each>
         <br/>
      </xsl:if>
	
	Дата и время принятия: 
	<xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="ispd:DecisionDate"/>
      </xsl:call-template>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="substring(ispd:DecisionTime, 1, 5)"/>
      <br/>
      <xsl:apply-templates select="ispd:CustomsPerson"/>
      <xsl:apply-templates select="ispd:Customs"/>
      <xsl:if test="ispd:GoodsCustoms">Таможенный орган, в регионе деятельности которого находятся товары:
			<xsl:apply-templates select="ispd:GoodsCustoms"/>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="ispd:DocumentInfo">
	Номер документа: 
	<xsl:value-of select="cat_ru:PrDocumentName"/> № <xsl:value-of select="cat_ru:PrDocumentNumber"/> от 
	<xsl:value-of select="substring(cat_ru:PrDocumentDate,9,2)"/>.<xsl:value-of select="substring(cat_ru:PrDocumentDate,6,2)"/>.<xsl:value-of select="substring(cat_ru:PrDocumentDate,1,4)"/>
      <br/>
   </xsl:template>
   <xsl:template match="ispd:CustomsPerson">
	Должностное лицо: <xsl:value-of select="cat_ru:PersonName"/>
      <xsl:if test="cat_ru:LNP">(ЛНП: <xsl:value-of select="cat_ru:LNP"/>)</xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="ispd:Customs | ispd:GoodsCustoms">
	Таможенный орган: 
	<xsl:value-of select="cat_ru:Code"/>
      <xsl:if test="cat_ru:OfficeName">
		(<xsl:value-of select="cat_ru:OfficeName"/>)
	</xsl:if>
      <br/>
   </xsl:template>
</xsl:stylesheet>
