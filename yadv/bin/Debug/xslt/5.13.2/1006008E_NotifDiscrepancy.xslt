<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="ndc cat_ru" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ndc="urn:customs.ru:Information:CustomsDocuments:NotifDiscrepancy:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="ndc:NotifDiscrepancy">
      <html>
         <head>
            <title>Информация о несоответствии сведений, заявленных в декларации на товары, сведениям, полученным в результате применения дополнительных форм таможенного контроля (досмотр, осмотр) </title>
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
							@media print {div.page {border: none; margin: 0; padding: 0;}}						
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
									Дата создания уведомления: 
									<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ndc:SendDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr align="left">
                        <td align="center" class="bold" style="width:150mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal" style="width:50mm">
                           <xsl:value-of select="ndc:GTDNumber/cat_ru:CustomsCode"/>/
									<xsl:call-template name="russian_date2">
                              <xsl:with-param name="dateIn" select="ndc:GTDNumber/cat_ru:RegistrationDate"/>
                           </xsl:call-template>/
								    <xsl:value-of select="ndc:GTDNumber/cat_ru:GTDNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="bold" style="width:145mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:45mm">
								(номер ДТ)							
							</td>
                     </tr>
                     <tr align="right">
                        <td align="center" class="bold" style="width:145mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal" style="width:45mm">
                           <xsl:value-of select="ndc:Customs/cat_ru:Code"/> 
									<xsl:value-of select="ndc:Customs/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="bold" style="width:145mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:45mm">
								(наименование таможенного органа)
								</td>
                     </tr>
                     <tr>
                        <td align="center" class="bold" colspan="2">Информация о несоответствии сведений, заявленных в декларации на товары, сведениям, полученным в результате применения дополнительных форм таможенного контроля (досмотр, осмотр)<br/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="2" cellpadding="5">
                  <tr>
                     <th>Наименование представляемого документа</th>
                     <th>Номер представляемого документа</th>
                     <th>Дата представляемого документа</th>
                     <th>Комментарии</th>
                  </tr>
                  <xsl:for-each select="ndc:SourceOfInformation">
					  <tr>
						 <td>
							<xsl:value-of select="cat_ru:PrDocumentName"/>
						 </td>
						 <td>
							<xsl:value-of select="cat_ru:PrDocumentNumber"/>
						 </td>
						 <td>
							<xsl:call-template name="russian_date">
							   <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						 </td>
						 <td>
							<xsl:value-of select="ndc:Comments"/>
						 </td>
					  </tr>
                  </xsl:for-each>
               </table>
               <br/>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr align="left">
                        <td align="left" class="graphMain" style="width:190mm">
                           <xsl:if test="ndc:Comments">Комментарии:<span class="normal">
                                 <xsl:value-of select="ndc:Comments"/>
                              </span>
                           </xsl:if>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <br/>
               <table border="0" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" class="normal" style="width:50mm">
                           <xsl:value-of select="ndc:CustomsPerson/cat_ru:PersonName"/>
                        </td>
                        <td style="width:100mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:40mm">ЛНП:
								<xsl:value-of select="ndc:CustomsPerson/cat_ru:LNP"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:50mm">
								(фамилия, инициалы должностного лица таможенного органа)
								</td>
                        <td colspan="2" style="width:140mm">
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
