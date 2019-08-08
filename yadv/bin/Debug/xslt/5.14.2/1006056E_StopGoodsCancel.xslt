<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:stc="urn:customs.ru:Information:ExchangeDocuments:StopGoodsCancel:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
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
   <xsl:template name="russian_date2">
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
   <xsl:template match="stc:StopGoodsCancel">
      <html>
         <head>
            <title>Отмена решения о приостановлении выпуска товаров</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}			
					</style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain">
									Дата направления запроса: 
									<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="stc:SendDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" style="width:70mm">
                           <xsl:value-of select="stc:Customs/cat_ru:Code"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="stc:Customs/cat_ru:OfficeName"/>
                        </td>
                        <td class="graphMain" style="width:130mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:70mm">
								(наименование таможенного органа)
								</td>
                        <td class="graphMain" style="width:130mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="bold" colspan="2">Отмена решения о приостановлении выпуска товаров
							</td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:190mm">
									По декларации №<u>
                              <xsl:value-of select="stc:DeclarationNumber/cat_ru:CustomsCode"/>/
				<xsl:value-of select="substring(stc:DeclarationNumber/cat_ru:RegistrationDate,9,2)"/>
                              <xsl:value-of select="substring(stc:DeclarationNumber/cat_ru:RegistrationDate,6,2)"/>
                              <xsl:value-of select="substring(stc:DeclarationNumber/cat_ru:RegistrationDate,1,4)"/>/
				<xsl:value-of select="stc:DeclarationNumber/cat_ru:GTDNumber"/>
                           </u> принято решение об отмене решения о приостановлении выпуска по следующим товарам: 
								</td>
                     </tr>
                     <tr>
                        <td align="left" colspan="2">
                           <table border="1" cellpadding="0" cellspacing="0" style="width:100mm">
                              <tbody>
                                 <tr>
                                    <td align="center" style="width:20mm">Номер товара по ДТ</td>
                                    <td align="center" style="width:80mm">Описание товара</td>
                                 </tr>
                                 <xsl:for-each select="stc:GoodsInfo">
                                    <tr>
                                       <td align="center">
                                          <xsl:value-of select="stc:GoodsNumeric"/>
                                       </td>
                                       <td align="center">
                                          <xsl:for-each select="stc:GoodsDescriptions">
                                             <xsl:value-of select="."/> 
												</xsl:for-each>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:30mm">
								Комментарии:
								</td>
                        <td align="left" class="normal" style="width:170mm">
                           <xsl:value-of select="stc:Comments"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td class="graphMain" colspan="5" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" style="width:63mm">
                           <xsl:value-of select="stc:CustomsPerson/cat_ru:PersonName"/>
                        </td>
                        <td class="graphMain" style="width:1mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal" style="width:63mm">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="stc:CancelIssueDate"/>
                           </xsl:call-template>
                        </td>
                        <td class="graphMain" style="width:1mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal" style="width:62mm">
										ЛНП: <xsl:value-of select="stc:CustomsPerson/cat_ru:LNP"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:63mm">
									(уполномоченное должностное лицо таможенного органа)
								</td>
                        <td class="graphMain" style="width:1mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:63mm">
									(дата)
									</td>
                        <td class="graphMain" style="width:1mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" style="width:62mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
