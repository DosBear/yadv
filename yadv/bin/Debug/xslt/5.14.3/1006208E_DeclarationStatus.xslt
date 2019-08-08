<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ds="urn:customs.ru:Information:CustomsDocuments:DeclarationStatus:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="ds:DeclarationStatus">
      <html>
         <head>
            <title>Актуализированные сведения о состоянии таможенной декларации</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
         </head>
         <body>
            <div class="album_page">
               <table>
                  <tr>
                     <td align="center" class="graph" colspan="2" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Актуализированные сведения о состоянии таможенной декларации</b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <u>Регистрационный номер таможенной декларации</u>: <xsl:apply-templates select="ds:DeclarationRegNumber"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <u>Состояние таможенной декларации</u>: <xsl:value-of select="ds:StatusDescription"/>
                     </td>
                  </tr>
                  <xsl:if test="ds:AdditionalID">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Уникальный идентификатор, присваиваемый дополнению к договору поручительства при регистрации</u>: <xsl:value-of select="ds:AdditionalID"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="ds:DecisionCode">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Код решения по декларации</u>: <xsl:value-of select="ds:DecisionCode"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="ds:Comments">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Комментарии</u>: <xsl:value-of select="ds:Comments"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="ds:CustomsPerson">
                     <xsl:apply-templates select="ds:CustomsPerson"/>
                  </xsl:if>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="ds:DeclarationRegNumber">
      <!--код/дата/номер-->
      <xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="ds:CustomsPerson">
      <tr>
         <td class="graph" style="border:solid 0pt">
            <u>Должностное лицо таможенного органа</u>: <xsl:value-of select="cat_ru:PersonName"/>
            <xsl:if test="cat_ru:LNP">(<xsl:value-of select="cat_ru:LNP"/>)</xsl:if>
         </td>
      </tr>
   </xsl:template>
</xsl:stylesheet>
