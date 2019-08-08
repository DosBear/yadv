<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:nfd="urn:customs.ru:Information:TransportDocuments:Air:NoticeFlightDeparture:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="nfd:NoticeFlightDeparture">
      <html>
         <head>
            <title>Уведомление о выполнении международного рейса</title>
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
                           <span style="font-weight:bold; ">УВЕДОМЛЕНИЕ О ВЫПОЛНЕНИИ МЕЖДУНАРОДНОГО РЕЙСА<br/>
                              <br/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" valign="top">
                           <span class="graph">
                              <u>Наименование перевозчика:</u>
                           </span>
                        </td>
                        <td align="left" valign="top">
                           <span class="graph">
                              <xsl:apply-templates select="nfd:Carrier"/>
                           </span>
                        </td>
                     </tr>
                     <tr style="height:6mm">
                        <td align="left" colspan="2" valign="top">
                           <xsl:text> </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" valign="top">
                           <span class="graph">
                              <u>Таможенный орган, в регионе деятельности <br/>которого находится воздушный пункт пропуска:</u>
                           </span>
                        </td>
                        <td align="left" valign="top">
                           <span class="graph">
                              <xsl:apply-templates select="nfd:CustomsOffice"/>
                           </span>
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
                              <u>Сведения об убытии воздушного судна</u>
                           </span>
                        </td>
                     </tr>
                     <xsl:for-each select="nfd:DepartureInfo">
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
                        <tr>
                           <td align="left" valign="top">
                              <span class="graph">
											Расчетное время вылета рейса:
										</span>
                           </td>
                           <td align="left" valign="top">
                              <span class="graph">
                                 <xsl:value-of select="nfd:EstimatedFlightTime"/>
                              </span>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" colspan="2" valign="top">
                              <span class="graph9Bold">
                                 <br/>Маршрут следования:
										</span>
                           </td>
                        </tr>
                        <xsl:for-each select="nfd:RouteInfo">
                           <tr>
                              <td align="left" valign="top">
                                 <xsl:value-of select="position()"/>) <xsl:value-of select="catTrans_ru:NumPP"/>
                              </td>
                              <td align="left" valign="top">
                                 <xsl:text> </xsl:text>
                              </td>
                           </tr>
                           <xsl:if test="catTrans_ru:CarrierName">
                              <tr>
                                 <td align="left" valign="top">
                                    <span class="graph">Наименование перевозчика</span>
                                 </td>
                                 <td align="left" valign="top">
                                    <span class="graph">
                                       <xsl:value-of select="catTrans_ru:CarrierName"/>
                                    </span>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="catTrans_ru:CarrierCode">
                              <tr>
                                 <td align="left" valign="top">
                                    <span class="graph">Двухсимвольный код перевозчика</span>
                                 </td>
                                 <td align="left" valign="top">
                                    <span class="graph">
                                       <xsl:value-of select="catTrans_ru:CarrierCode"/>
                                    </span>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="catTrans_ru:FlightNumber">
                              <tr>
                                 <td align="left" valign="top">
                                    <span class="graph">Номер рейса</span>
                                 </td>
                                 <td align="left" valign="top">
                                    <span class="graph">
                                       <xsl:value-of select="catTrans_ru:FlightNumber"/>
                                    </span>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="catTrans_ru:FlightDate">
                              <tr>
                                 <td align="left" valign="top">
                                    <span class="graph">Дата рейса</span>
                                 </td>
                                 <td align="left" valign="top">
                                    <span class="graph">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="catTrans_ru:FlightDate"/>
                                       </xsl:call-template>
                                    </span>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="catTrans_ru:Airport">
                              <tr>
                                 <td align="left" valign="top">
                                    <span class="graph">Следующий  аэропорт</span>
                                 </td>
                                 <td align="left" valign="top">
                                    <span class="graph">
                                       <xsl:value-of select="catTrans_ru:Airport/catTrans_ru:IATACode"/>
                                       <xsl:if test="catTrans_ru:Airport/catTrans_ru:Name"> (<xsl:value-of select="catTrans_ru:Airport/catTrans_ru:Name"/>)
													</xsl:if>
                                    </span>
                                 </td>
                              </tr>
                           </xsl:if>
                           <tr/>
                           <tr style="height:6mm">
                              <td align="left" colspan="2" valign="top">
                                 <xsl:text> </xsl:text>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </xsl:for-each>
                     <tr style="height:4mm">
                        <td align="left" colspan="2" valign="top">
                           <xsl:text> </xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="nfd:CustomsOffice">
      <xsl:value-of select="cat_ru:Code"/>
      <xsl:if test="cat_ru:OfficeName">
		(<xsl:value-of select="cat_ru:OfficeName"/>)
	</xsl:if>
   </xsl:template>
   <xsl:template match="nfd:Carrier">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
      <xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
         <br/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <span class="header">Адрес:</span>
      <br/>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span>
      <br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
</xsl:stylesheet>
