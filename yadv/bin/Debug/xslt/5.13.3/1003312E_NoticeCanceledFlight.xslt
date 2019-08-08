<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ncf="urn:customs.ru:Information:TransportDocuments:Air:NoticeCanceledFlight:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dategtd"/>
      <xsl:choose>
         <xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
            <xsl:value-of select="substring($dategtd,9,2)"/>
            <xsl:value-of select="substring($dategtd,6,2)"/>
            <xsl:value-of select="substring($dategtd,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dategtd"/>
         </xsl:otherwise>
      </xsl:choose>
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
   <xsl:template match="ncf:NoticeCanceledFlight">
      <html>
         <head>
            <title>Уведомление об отмене рейса</title>
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
							font-weight: normal;
							font-family:Courier;
							}
						.bold{
							font-weight: bold;
							font-family:Courier;
							}
						.italic{
							font-style: italic;
							font-family:Courier;
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
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
						.graph9Bold {
						font-family: Arial;
						font-size: 9pt;
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
                        <td align="center" colspan="2">
                           <span style="font-weight:bold;">УВЕДОМЛЕНИЕ ОБ ОТМЕНЕ РЕЙСА<br/>
                              <br/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" valign="top">
                           <span class="graph">
                              <u>Дата уведомления:</u>
                           </span>
                        </td>
                        <td align="left" valign="top">
                           <span class="graph">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="ncf:NoticeDate"/>
                              </xsl:call-template>
                           </span>
                        </td>
                     </tr>
                     <tr style="height:4mm">
                        <td align="left" colspan="2" valign="top">
                           <xsl:text> </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" valign="top">
                           <span class="graph">
                              <u>Время уведомления:</u>
                           </span>
                        </td>
                        <td align="left" valign="top">
                           <span class="graph">
                              <xsl:value-of select="ncf:NoticeTime"/>
                           </span>
                        </td>
                     </tr>
                     <tr style="height:4mm">
                        <td align="left" colspan="2" valign="top">
                           <xsl:text> </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" valign="top">
                           <span class="graph">
                              <u>Причины:</u>
                           </span>
                        </td>
                        <td align="left" valign="top">
                           <span class="graph">
                              <xsl:value-of select="ncf:Reasons"/>
                           </span>
                        </td>
                     </tr>
                     <tr style="height:4mm">
                        <td align="left" colspan="2" valign="top">
                           <xsl:text> </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" valign="top">
                           <span class="graph">
                              <u>Сведения об отмененном рейсе:</u>
                           </span>
                        </td>
                        <td align="left" valign="top">
                           <xsl:text> </xsl:text>
                        </td>
                     </tr>
                     <tr style="height:4mm">
                        <td align="left" colspan="2" valign="top">
                           <xsl:text> </xsl:text>
                        </td>
                     </tr>
                     <xsl:for-each select="ncf:Flight">
                        <tr>
                           <td align="left" valign="top">
                              <span class="graph">
											Номер рейса:
										</span>
                           </td>
                           <td align="left" valign="top">
                              <span class="graph">
                                 <xsl:value-of select="catTrans_ru:FlightNumber"/>
                              </span>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" valign="top">
                              <span class="graph">
											Дата рейса:
										</span>
                           </td>
                           <td align="left" valign="top">
                              <span class="graph">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catTrans_ru:FlightDate"/>
                                 </xsl:call-template>
                              </span>
                           </td>
                        </tr>
                        <xsl:if test="catTrans_ru:Mark">
                           <tr>
                              <td align="left" valign="top">
                                 <span class="graph">
											Тип воздушного судна:
										</span>
                              </td>
                              <td align="left" valign="top">
                                 <span class="graph">
                                    <xsl:value-of select="catTrans_ru:Mark"/>
                                 </span>
                                 <br/>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="catTrans_ru:AirPlaneRegNum">
                           <tr>
                              <td align="left" valign="top">
                                 <span class="graph">
											Бортовой номер воздушного судна:
										</span>
                              </td>
                              <td align="left" valign="top">
                                 <span class="graph">
                                    <xsl:value-of select="catTrans_ru:AirPlaneRegNum"/>
                                 </span>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="catTrans_ru:FlightTime">
                           <tr>
                              <td align="left" valign="top">
                                 <span class="graph">
											Время вылета рейса:
										</span>
                              </td>
                              <td align="left" valign="top">
                                 <span class="graph">
                                    <xsl:value-of select="catTrans_ru:FlightTime"/>
                                 </span>
                              </td>
                           </tr>
                        </xsl:if>
                        <tr>
                           <td align="left" valign="top">
                              <span class="graph">
											Аэропорт отправления:
										</span>
                           </td>
                           <td align="left" valign="top">
                              <span class="graph">
                                 <xsl:value-of select="catTrans_ru:DepartureAirport/catTrans_ru:IATACode"/>
                                 <xsl:if test="catTrans_ru:DepartureAirport/catTrans_ru:Name"> (<xsl:value-of select="catTrans_ru:DepartureAirport/catTrans_ru:Name"/>)</xsl:if>
                              </span>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr/>
                     <tr style="height:4mm">
                        <td align="left" colspan="2" valign="top">
                           <xsl:text> </xsl:text>
                        </td>
                     </tr>
                     <tr style="height:6mm">
                        <td align="left" valign="top">
                           <span class="graph">
                              <u>Таможенный орган</u>
                           </span>
                        </td>
                        <td align="left" class="graph" valign="top">
                           <xsl:apply-templates select="ncf:CustomsOffice"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="ncf:CustomsOffice">
      <!-- Таможенный орган - облегченный вариант -->
      <xsl:value-of select="cat_ru:Code"/>
      <xsl:if test="cat_ru:OfficeName">
      (<xsl:value-of select="cat_ru:OfficeName"/>)
   </xsl:if>
   </xsl:template>
</xsl:stylesheet>
