<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tsd="urn:customs.ru:Information:CustomsDocuments:TSDecision:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="tsd:TSDecision">
      <html>
         <head>
            <title>Результат обработки сообщения / выполнения операции.</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
				body {
					background: #cccccc;
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
					font: 12;
					font-family: Arial, serif;
					font-weight:bold;
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
				
				.signature {
					font-family: Arial, serif;
					font: 10;
					border-bottom: 0;
					border-right: 0;
					border-left: 0;
				}
				
				  .low {
						font: 11;
						font-family: Arial, serif;
					}
			</style>
         </head>
         <body>
            <div class="page">
               <h2>Результат обработки сообщения / выполнения операции.</h2>
               <div align="right">
                  <table border="0" style="margin-top:50px; width:60mm">
                     <tbody>
                        <tr>
                           <td align="center" style="border-right:0; border-left:0; border-top:0">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="substring(tsd:DecisionDateTime, 1, 10)"/>
                              </xsl:call-template>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="substring(tsd:DecisionDateTime, 12, 8)"/>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="low" style="border:0;">(Дата, время принятия решения)</td>
                        </tr>
                     </tbody>
                  </table>
               </div>	

				
				Принятое решение: 
				<span style="text-decoration: underline">
                  <xsl:choose>
                     <xsl:when test="tsd:DecisionIndicator = '1' or tsd:DecisionIndicator='t' or tsd:DecisionIndicator='true'">
							Заявленная таможенная стоимость принята
						</xsl:when>
                     <xsl:otherwise>Заявленная таможенная стоимость не принята</xsl:otherwise>
                  </xsl:choose>
               </span>
               <br/>
               <xsl:if test="tsd:DecisionText">Описание: <xsl:value-of select="tsd:DecisionText"/>
               </xsl:if>
               <xsl:apply-templates select="tsd:CustomsPerson"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="tsd:CustomsPerson">
      <table border="0" style="margin-top:50px; width:100%">
         <tbody>
            <tr>
               <td align="center" style="border-right:0; border-left:0; border-top:0">
                  <xsl:value-of select="cat_ru:PersonName"/>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
                  <xsl:value-of select="cat_ru:LNP"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="low" style="border:0;">(Ф.И.О. должностного лица)</td>
               <td style="border:0;"/>
               <td align="center" class="low" style="border:0;">(ЛНП)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
</xsl:stylesheet>
