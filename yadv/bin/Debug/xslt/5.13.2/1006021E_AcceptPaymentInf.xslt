<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:api="urn:customs.ru:Information:CustomsDocuments:AcceptPaymentInf:5.12.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="api:AcceptPaymentInf">
      <html>
         <head>
            <title>Сведения о поступлении денежных средств на счет таможенного органа.</title>
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
                        <td align="center" class="bold">Сведения о поступлении денежных средств на счет таможенного органа.<br/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:190mm">
								   В соответствии  с обращением  предоставить  сведения о том, что таможенные пошлины, налоги, авансовые платежи поступили на счет <br/>
                           <span class="normal">
                              <xsl:value-of select="api:Customs/cat_ru:Code"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="api:Customs/cat_ru:OfficeName"/>
                           </span>, уплачены в отношении товаров, оформленных по таможенной декларации 
									<span class="normal">
                              <xsl:value-of select="api:GTDNumber/cat_ru:CustomsCode"/>
                              <xsl:text>/ </xsl:text>
                              <xsl:call-template name="russian_date2">
                                 <xsl:with-param name="dateIn" select="api:GTDNumber/cat_ru:RegistrationDate"/>
                              </xsl:call-template>
                              <xsl:text>/ </xsl:text>
                              <xsl:value-of select="api:GTDNumber/cat_ru:GTDNumber"/>
                           </span>, в размере

									<span class="normal">
                              <xsl:for-each select="api:PyamentInf">
                                 <xsl:if test="position()>1">; </xsl:if>
                                 <xsl:value-of select="catESAD_ru:Summa"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="catESAD_ru:Currency"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catESAD_ru:DateInf"/>
                                 </xsl:call-template>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="catESAD_ru:Comments"/>
                              </xsl:for-each>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <xsl:if test="api:Comments">
                        <tr>
                           <td class="graphMain" colspan="2" style="width:190mm">
									Комментарии: <span class="normal">
                                 <xsl:value-of select="api:Comments"/>
                              </span>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:95mm">
                           <span class="normal">
                              <xsl:value-of select="api:CustomsPerson/cat_ru:PersonName"/>
                           </span>
                        </td>
                        <td align="left" class="graphMain" style="width:95mm">ЛНП: 
								<span class="normal">
                              <xsl:value-of select="api:CustomsPerson/cat_ru:LNP"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphLittle" style="width:95mm">
								(инициалы, фамилия должностного лица таможенного органа)
								</td>
                        <td align="left" class="graphMain" style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:95mm">
                           <span class="normal">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="api:SendDate"/>
                              </xsl:call-template>
                           </span>
                        </td>
                        <td align="center" class="graphMain" style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphLittle" style="width:95mm">
								(дата)
								</td>
                        <td align="left" class="graphMain" colspan="2" style="width:95mm">
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
