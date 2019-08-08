<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gor="urn:customs.ru:Information:TransportDocuments:Air:GoodsOperationRequest:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="gor:GoodsOperationRequest">
      <html>
         <head>
            <title>Запрос перевозчика в таможенный орган на совершение операций с грузом</title>
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
                        <td align="center" colspan="2">
                           <span style="font-weight:bold;  ">ЗАПРОС ПЕРЕВОЗЧИКА В ТАМОЖЕННЫЙ ОРГАН НА СОВЕРШЕНИЕ ОПЕРАЦИЙ С ГРУЗОМ<br/>
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
                              <xsl:apply-templates select="gor:Carrier"/>
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
                              <xsl:apply-templates select="gor:CustomsOffice"/>
                           </span>
                        </td>
                     </tr>
                     <tr style="height:4mm">
                        <td align="left" colspan="2" valign="top">
                           <xsl:text> </xsl:text>
                        </td>
                     </tr>
                     <xsl:if test="gor:WayBillOperation">
                        <tr>
                           <td align="left" valign="top">
                              <span class="graph">
                                 <u>Сведения об операциях с грузом по накладной:</u>
                              </span>
                           </td>
                           <td align="left" valign="top">
                              <xsl:text> </xsl:text>
                           </td>
                        </tr>
                        <br/>
                     </xsl:if>
                     <xsl:for-each select="gor:WayBillOperation">
                        <!--<table style="width:190mm" border="0">
									<tbody>-->
                        <tr>
                           <td align="left" valign="top">
                              <span class="graph">
                                 <xsl:value-of select="position()"/>). Номер накладной:
										</span>
                           </td>
                           <td align="left" valign="top">
                              <span class="graph">
                                 <xsl:apply-templates select="gor:WayBillNumber"/>
                              </span>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" valign="top">
                              <span class="graph">
											Операция с грузом:
										</span>
                           </td>
                           <td align="left" valign="top">
                              <span class="graph">
                                 <xsl:choose>
                                    <xsl:when test="gor:Operation = 1">Выгрузка</xsl:when>
                                    <xsl:when test="gor:Operation = 2">Перегрузка (перевалка)</xsl:when>
                                    <xsl:when test="gor:Operation = 3">Погрузка</xsl:when>
                                    <xsl:otherwise>Отсутствие операций с грузом</xsl:otherwise>
                                 </xsl:choose>
                              </span>
                           </td>
                        </tr>
                        <xsl:if test="gor:Reasons">
                           <tr>
                              <td align="left" valign="top">
                                 <span class="graph">
											Основание:
										</span>
                              </td>
                              <td align="left" valign="top">
                                 <span class="graph">
                                    <xsl:value-of select="gor:Reasons"/>
                                 </span>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="gor:NewFlightInfo">
                           <xsl:variable name="F" select="gor:NewFlightInfo"/>
                           <tr>
                              <td align="left" valign="top">
                                 <span class="graph">
											Сведения о новом рейсе:
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
                        </xsl:if>
                        <tr style="height:4mm">
                           <td align="left" colspan="2" valign="top">
                              <xsl:text> </xsl:text>
                           </td>
                        </tr>
                        <!--</tbody>
								</table>-->
                     </xsl:for-each>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="gor:WayBillNumber">
      <xsl:if test="catTrans_ru:AirlineIATACode">
         <xsl:value-of select="catTrans_ru:AirlineIATACode"/>
      </xsl:if>
      <xsl:text> - </xsl:text>
      <xsl:value-of select="catTrans_ru:DocumentNumber"/>
   </xsl:template>
   <xsl:template match="gor:CustomsOffice">
      <xsl:value-of select="cat_ru:Code"/>
      <xsl:if test="cat_ru:OfficeName">
		(<xsl:value-of select="cat_ru:OfficeName"/>)
	</xsl:if>
   </xsl:template>
   <xsl:template match="gor:Carrier">
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
