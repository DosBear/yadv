<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ugdr="urn:customs.ru:Information:TransportDocuments:Air:UploadedGoodsDepartRequest:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="ugdr:UploadedGoodsDepartRequest">
      <html>
         <head>
            <title>Запрос на убытие фактически загруженных на борт товаров</title>
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
							font-family:Courier New;
							}
						.bold{
							font-weight: bold;
							font-family:Courier New;
							}
						.italic{
							font-style: italic;
							font-family:Courier New;
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
                           <span style="font-weight:bold; ">ЗАПРОС НА УБЫТИЕ ФАКТИЧЕСКИ ЗАГРУЖЕННЫХ НА БОРТ ТОВАРОВ<br/>
                              <br/>
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
                              <u>УИН описи документов:</u>
                           </span>
                        </td>
                        <td align="left" valign="top">
							<span class="graph">
								<xsl:value-of select="ugdr:UIN"/>
							</span>
                        </td>
                     </tr>
                     <tr>
                        <xsl:variable name="F" select="ugdr:Flight"/>
                        <td align="left" valign="top">
                           <span class="graph">
                              <u>Сведения о  рейсе:</u>
                           </span>
                        </td>
                        <td align="left" valign="top">
                           <span class="graph">Номер рейса 
													<xsl:value-of select="$F/catTrans_ru:FlightNumber"/>
                           </span>
                           <br/>
                           <span class="graph">Дата рейса 
													<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="$F/catTrans_ru:FlightDate"/>
                              </xsl:call-template>
                           </span>
                           <br/>
                           <xsl:if test="$F/catTrans_ru:Mark">
                              <span class="graph">Тип воздушного судна 
													<xsl:value-of select="$F/catTrans_ru:Mark"/>
                              </span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="$F/catTrans_ru:AirPlaneRegNum">
                              <span class="graph">Бортовой номер воздушного судна 
													<xsl:value-of select="$F/catTrans_ru:AirPlaneRegNum"/>
                              </span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="$F/catTrans_ru:FlightTime">
                              <span class="graph">Время вылета рейса 
													<xsl:value-of select="$F/catTrans_ru:FlightTime"/>
                              </span>
                              <br/>
                           </xsl:if>
                           <span class="graph">Аэропорт отправления 
													<xsl:value-of select="$F/catTrans_ru:DepartureAirport/catTrans_ru:IATACode"/>
                              <xsl:if test="$F/catTrans_ru:DepartureAirport/catTrans_ru:Name"> (<xsl:value-of select="$F/catTrans_ru:DepartureAirport/catTrans_ru:Name"/>)</xsl:if>
                           </span>
                           <br/>
                        </td>
                     </tr>
                     <tr style="height:4mm">
                        <td align="left" colspan="2" valign="top">
                           <xsl:text> </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" colspan="2" valign="top">
                           <span class="graph">
                              <u>Сведения о товарах, фактически загруженных на борт:</u>
                           </span>
                        </td>
                     </tr>
                     <xsl:for-each select="ugdr:UploadedGoods">
                        <tr>
                           <td align="left" valign="top">
                              <span class="graph">
                                 <xsl:value-of select="position()"/>). Номер накладной:<br/>
                                 <u>
                                    <span class="graph9Bold">
                                       <xsl:apply-templates select="ugdr:WayBillNumber"/>
                                    </span>
                                 </u>
                              </span>
                           </td>
                           <td align="left" valign="top">
                              <span class="graph">Наименование товара: 
													<xsl:value-of select="ugdr:GoodsDescription"/>
                              </span>
                              <br/>
                              <xsl:if test="ugdr:GoodsTNVEDCode">
                                 <span class="graph">Код товара по товарной номенклатуре: 
													<xsl:value-of select="ugdr:GoodsTNVEDCode"/>
                                 </span>
                                 <br/>
                              </xsl:if>
                              <span class="graph">Количество мест, принятых к перевозке / Количество мест товара по накладной при полной загрузке товара: 
													<xsl:value-of select="ugdr:PlacesQuantity"/>
                              </span>
                              <br/>
                              <span class="graph">Вес товара, брутто (кг): 
													<xsl:value-of select="ugdr:GrossWeightQuantity"/>
                              </span>
                              <br/>
                              <xsl:if test="ugdr:ContainerNumber">
                                 <span class="graph">Номер контейнера: 
										<xsl:for-each select="ugdr:ContainerNumber">
                                       <xsl:if test="position()>1">, </xsl:if>
                                       <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </span>
                                 <br/>
                              </xsl:if>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <!--</tbody>
								</table>-->
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="ugdr:WayBillNumber">
      <xsl:if test="catTrans_ru:AirlineIATACode">
         <xsl:value-of select="catTrans_ru:AirlineIATACode"/>
      </xsl:if>
      <xsl:text> - </xsl:text>
      <xsl:value-of select="catTrans_ru:DocumentNumber"/>
   </xsl:template>
</xsl:stylesheet>
