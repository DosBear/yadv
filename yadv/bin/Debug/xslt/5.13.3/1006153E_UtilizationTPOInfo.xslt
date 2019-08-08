<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:uttp="urn:customs.ru:Information:CustomsDocuments:UtilizationTPOInfo:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template match="/">
      <html>
         <head>
            <title>Сведения об оформленном ТПО на утилизационные сборы.</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 210mm;
						height: 210mm;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding:	10mm;
						padding-left:	20mm;
						background: #ffffff;
						border: solid 1pt #000000;
						}
						
					.bordered {
						border: solid 1pt #000000;
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						
					.underlined {
						border-bottom: solid 0.5pt #000000;
						}
						
					p.NumberDate {
						font-weight: bold;
						}
						
					.graph {
						font-family: Arial;
						font-size: 8pt;
						}
					td {
						font-family:Courier;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
				</style>
         </head>
         <body>
            <div class="page">
               <h2>Сведения об оформленном ТПО на утилизационные сборы.</h2>
               <br/>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:45%">
                           <xsl:text>Код освобождения от уплаты от утилизационных сборов</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;border-bottom:solid 0.5pt #000000;">
                           <xsl:value-of select="//uttp:CodeReasonFreePayment"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%">
                           <xsl:text>Идентифицирующие параметры документа ТПО</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;">
                           <xsl:value-of select="//uttp:TPOID/uttp:CustomsCode"/>; №<xsl:value-of select="//uttp:TPOID/uttp:OrderNumber"/>
                           <xsl:if test="//uttp:TPOID"> от
									<xsl:choose>
                                 <xsl:when test="substring(//uttp:TPOID/uttp:RegistrationDate,5,1)='-' and substring(//uttp:TPOID/uttp:RegistrationDate,8,1)='-'">
                                    <xsl:value-of select="substring(//uttp:TPOID/uttp:RegistrationDate,9,2)"/>.<xsl:value-of select="substring(//uttp:TPOID/uttp:RegistrationDate,6,2)"/>.<xsl:value-of select="substring(//uttp:TPOID/uttp:RegistrationDate,1,4)"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:value-of select="//uttp:TPOID/uttp:RegistrationDate"/>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.5pt #000000;">
                           <xsl:text>(Код таможенного органа, зарегистрировавшего документ; типографский номер бланка ТПО, дата )</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%">
                           <xsl:text>Учетный номер карточки</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;border-bottom:solid 0.5pt #000000;">
                           <xsl:value-of select="//uttp:CardNumber/cat_ru:CustomsCode"/>; №
									<xsl:value-of select="//uttp:CardNumber/cat_ru:GTDNumber"/> от <xsl:choose>
                              <xsl:when test="substring(//uttp:CardNumber/cat_ru:RegistrationDate,5,1)='-' and substring(//uttp:CardNumber/cat_ru:RegistrationDate,8,1)='-'">
                                 <xsl:value-of select="substring(//uttp:CardNumber/cat_ru:RegistrationDate,9,2)"/>.<xsl:value-of select="substring(//uttp:CardNumber/cat_ru:RegistrationDate,6,2)"/>.<xsl:value-of select="substring(//uttp:CardNumber/cat_ru:RegistrationDate,1,4)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="//uttp:CardNumber/cat_ru:RegistrationDate"/>
                              </xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;">
                           <xsl:text>(код таможенного органа, зарегистрировавшего документ; порядковый номер документа по журналу регистрации, дата регистрации документа)</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
