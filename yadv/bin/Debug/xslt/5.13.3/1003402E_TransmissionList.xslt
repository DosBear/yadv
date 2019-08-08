<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tral="urn:customs.ru:Information:TransportDocuments:Railway:TransmissionList:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template name="ResidencePlace">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="tral:TransmissionList">
      <html>
         <head>
            <title>Передаточная ведомость</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
							font-size: 15pt;
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
					border-bottom: solid 1pt #000000;
					font-weight: bold;
										}	
						.borderedAll {
					border-bottom: solid 1pt #000000;border-top: solid 1pt #000000;border-left: solid 1pt #000000;border-right: solid 1pt #000000;
					font-weight: bold;
										}	
                </style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:210mm">
                  <tbody>
                     <tr>
                        <td align="center" class="bold" colspan="4" style="width:190mm">Передаточная ведомость № <xsl:value-of select="tral:Number"/>
                        </td>
                     </tr>
                     <tr>
                        <!--<td>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
								</td>-->
                        <td align="left">
                           <xsl:text disable-output-escaping="yes">Дата составления ППВ </xsl:text>
                           <u>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="tral:TransmissionDate"/>
                              </xsl:call-template>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain">Индекс поезда <xsl:value-of select="tral:TrainIndex"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain">
									Номер поезда 
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="tral:TrainNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:95mm">передающая груз
								<span class="bordered">
                              <xsl:value-of select="tral:DirectionalRailwayStation/tral:RailwayStationName"/>
                           </span>
                        </td>
                        <td class="borderedAll" style="width:45mm">
                           <xsl:value-of select="tral:DirectionalRailwayStation/tral:RailwayStationCode"/>
                        </td>
                        <xsl:if test="tral:DirectionalRailwayStation/tral:RailwayCode">
                           <td style="width:4mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           </td>
                           <td class="borderedAll" style="width:45mm">
                              <xsl:value-of select="tral:DirectionalRailwayStation/tral:RailwayCode"/>
                           </td>
                        </xsl:if>
                        <!--<td class="borderedAll" style="width:45mm">
									<xsl:value-of select="tral:ReceivingRailwayStation/tral:RailwayStationCode"/>
								</td>-->
                     </tr>
                     <tr>
                        <!--<td align="left" class="graphMain" style="width:95mm"> принимающая груз
									<span class="bordered">
										<xsl:value-of select="tral:ReceivingRailwayStation/tral:RailwayStationName"/>
									</span>
								</td>-->
                        <td style="width:4mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graphMain" style="width:45mm">
								(Код станции)
								</td>
                        <xsl:if test="tral:DirectionalRailwayStation/tral:RailwayCode">
                           <td style="width:4mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           </td>
                           <td class="graphMain" style="width:45mm">
									(Код железной<br/>дороги)
									</td>
                        </xsl:if>
                        <!--<td class="graphMain" style="width:45mm">
								(принимающей <br/>стороны)
								</td>-->
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="0" cellspacing="0" style="width:210mm">
                  <tbody>
                     <tr>
                        <td align="center" class="graphMain" rowspan="3" style="width:10mm">№ накладной</td>
                        <td class="graphMain" rowspan="3" style="width:10mm">№ перечня</td>
                        <td class="graphMain" rowspan="3" style="width:10mm">№ вагона</td>
                        <td class="graphMain" rowspan="3" style="width:10mm">Пункт и наименование ж.д. отправления</td>
                        <td class="graphMain" rowspan="3" style="width:10mm">Пункт и наименование ж.д. назначения</td>
                        <td class="graphMain" rowspan="3" style="width:50mm">Наименование груза</td>
                        <td class="graphMain" rowspan="3" style="width:10mm">№ контейнера</td>
                        <td class="graphMain" colspan="2" style="width:40mm">Количество груза</td>
                        <td class="graphMain" rowspan="3" style="width:20mm">№ актов на несохран- ность груза, состав- ленных при передаче</td>
                        <!--<td style="width:15mm" rowspan="3" class="graphMain">Взыскано при отправ- лении, руб. и коп.</td>-->
                        <!--<td style="width:15mm" rowspan="3" class="graphMain">Сумма, причитаю- щаяся по заверит. штемпелям, руб. и коп.</td>-->
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:20mm">по накладным</td>
                        <!--<td colspan="2" style="width:20mm" class="graphMain">передано</td>-->
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:10mm">мест</td>
                        <td class="graphMain" style="width:10mm">вес в кг</td>
                        <!--<td style="width:10mm" class="graphMain">мест</td>
								<td style="width:10mm" class="graphMain">вес в кг</td>-->
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:10mm">1</td>
                        <td class="graphMain" style="width:10mm">2</td>
                        <td class="graphMain" style="width:10mm">3</td>
                        <td class="graphMain" style="width:10mm">4</td>
                        <td class="graphMain" style="width:10mm">5</td>
                        <td class="graphMain" style="width:50mm">6</td>
                        <td class="graphMain" style="width:10mm">7</td>
                        <td class="graphMain" style="width:10mm">8</td>
                        <td class="graphMain" style="width:10mm">9</td>
                        <!--<td style="width:10mm" class="graphMain">9</td>
								<td style="width:10mm" class="graphMain">10</td>-->
                        <td class="graphMain" style="width:20mm">10</td>
                        <!--<td style="width:15mm" class="graphMain">12</td>-->
                        <!--<td style="width:15mm" class="graphMain">13</td>-->
                     </tr>
                     <xsl:for-each select="tral:List">
                        <tr>
                           <td class="graphMain" style="width:10mm">
                              <xsl:value-of select="tral:BillNumber"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td class="graphMain" style="width:10mm">
                              <xsl:value-of select="tral:CatalogNumber"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td class="graphMain" style="width:10mm">
                              <xsl:value-of select="tral:CarriageNumber"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td class="graphMain" style="width:10mm">
                              <xsl:value-of select="tral:DepartureStation/tral:RailwayStationName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="tral:DepartureStation/tral:RailwayStationCode"/>
                           </td>
                           <td class="graphMain" style="width:10mm">
                              <xsl:value-of select="tral:DestinationStation/tral:RailwayStationName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="tral:DestinationStation/tral:RailwayStationCode"/>
                           </td>
                           <td class="graphMain" style="width:50mm">
                              <xsl:for-each select="tral:GoodDescription">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </td>
                           <td class="graphMain">
                              <xsl:for-each select="tral:ContainerNumber">
                                 <xsl:value-of select="."/>; 
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </td>
                           <td class="graphMain" style="width:10mm">
                              <xsl:value-of select="tral:BillQuantity/tral:PackagesQuantity"/>
                           </td>
                           <td class="graphMain" style="width:10mm">
                              <xsl:value-of select="tral:BillQuantity/tral:Quantity"/>
                           </td>
                           <!--<td style="width:10mm" class="graphMain">
										<xsl:value-of select="tral:TransferredQuantity/tral:PackagesQuantity"/>
									</td>
									<td style="width:10mm" class="graphMain">
										<xsl:value-of select="tral:TransferredQuantity/tral:PackagesQuantity"/>
									</td>-->
                           <td class="graphMain" style="width:20mm">
                              <xsl:value-of select="tral:ActNumber"/>
                           </td>
                           <!--<td style="width:15mm" class="graphMain">
										<xsl:value-of select="tral:Recovered"/>
									</td>-->
                           <!--<td style="width:15mm" class="graphMain">
										<xsl:value-of select="tral:StampPayment"/>
									</td>-->
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <br/>
               <div align="left">
                  <span style="text-decoration:underline">Сведения о вагонах:</span>
                  <table width="100%">
                     <tbody>
                        <xsl:for-each select="tral:CarriageInfo">
                           <tr>
                              <td style="vertical-align: top">
                                 <xsl:value-of select="position()"/>. Вагон № 
											<xsl:value-of select="tral:Number"/>
                                 <!--xsl:if test="tral:InventoryNumber">
                                    <br/>(инв. номер: <xsl:value-of select="tral:InventoryNumber"/>)
											</xsl:if-->
                              </td>
                              <td>
											Заполненность: 
											<xsl:choose>
                                    <xsl:when test="tral:EmptyIndicator = '1' or tral:EmptyIndicator = 'true' or tral:EmptyIndicator = 't' ">
													Порожний
												</xsl:when>
                                    <xsl:when test="tral:EmptyIndicator = '0' or tral:EmptyIndicator = 'false' or tral:EmptyIndicator = 'f' ">
													Непорожний
												</xsl:when>
                                 </xsl:choose>
                                 <br/>
                                 <xsl:if test="tral:RegistrationCountry">
												Страна регистрации: <xsl:value-of select="tral:RegistrationCountry"/>
                                    <br/>
                                 </xsl:if>
											Страна отправления: <xsl:value-of select="tral:DispatchCountry"/>
                                 <br/>
											Страна назначения: <xsl:value-of select="tral:DestinationCountry"/>
                                 <br/>
											Вес груза, кг: <xsl:value-of select="tral:CargoWeight"/>
                                 <br/>
											Номер накладной: 
											<xsl:for-each select="tral:WaybillNumber">
                                    <xsl:if test="position()>1">,<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                                 <br/>
                                 <xsl:if test="tral:DepartureStation/tral:RailwayStationName">
											Станция отправления: <xsl:value-of select="tral:DepartureStation/tral:RailwayStationName"/> (Код железнодорожной станции:
											<xsl:value-of select="tral:DepartureStation/tral:RailwayStationCode"/>
                                    <xsl:if test="tral:DepartureStation/tral:RailwayCode">; Код железной дороги: <xsl:value-of select="tral:DepartureStation/tral:RailwayCode"/>
                                    </xsl:if>)</xsl:if>
                                 <br/>
                                 <xsl:if test="tral:DestinationStation/tral:RailwayStationName">
											Станция назначения: <xsl:value-of select="tral:DestinationStation/tral:RailwayStationName"/> (Код железнодорожной станции:
											<xsl:value-of select="tral:DestinationStation/tral:RailwayStationCode"/>
                                    <xsl:if test="tral:DestinationStation/tral:RailwayCode">; Код железной дороги: <xsl:value-of select="tral:DestinationStation/tral:RailwayCode"/>
                                    </xsl:if>)</xsl:if>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </div>
               <xsl:if test="tral:Container">
                  <br/>
                  <div align="left">
                     <span style="text-decoration:underline">Сведения о контейнерах:</span>
                     <xsl:for-each select="tral:Container">
                        <table>
                           <tbody>
                              <tr>
                                 <td style="vertical-align:top; padding-right:10mm">Контейнер № <xsl:value-of select="tral:ContainerID"/>
                                 </td>
                                 <td>
                                    <xsl:if test="tral:ContainerKind">Тип <xsl:value-of select="tral:ContainerKind"/>
                                       <br/>
                                    </xsl:if>
												Вид <xsl:value-of select="tral:ContainerModeDescription"/>
                                    <br/>
                                    <xsl:if test="tral:ContainerCapacity">Емкость 
													<xsl:value-of select="tral:ContainerCapacity"/>
                                       <xsl:value-of select="tral:ContainerCapacityUnitQualifierCode"/>
                                       <br/>
                                    </xsl:if>
                                    <xsl:if test="tral:RailwayCode">Код ж/д <xsl:value-of select="tral:RailwayCode"/>
                                       <br/>
                                    </xsl:if>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </xsl:for-each>
                  </div>
               </xsl:if>
               <xsl:for-each select="tral:BorderStation">
                  <div align="left">
                     <span style="text-decoration:underline">Пограничный пост:</span>
                     <table>
                        <tbody>
                           <tr>
                              <!--<td style="vertical-align:top; padding-right:10mm"></td>-->
                              <td>
                                 <xsl:if test="position()>1">
                                    <br/>
                                 </xsl:if>
                                 <xsl:value-of select="tral:StationName"/>
                                 <xsl:if test="string(tral:StationCode)!=''">, <xsl:value-of select="tral:StationCode"/>
                                 </xsl:if>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
               </xsl:for-each>
               <table border="0" style="width:210mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain">
                           <br/> Перечисленные в настоящей ведомости грузы, накладные и акты сдал
								<u>
                              <xsl:value-of select="tral:Person/cat_ru:PersonPost"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="tral:Person/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="tral:Person/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="tral:Person/cat_ru:PersonMiddleName"/>
                           </u>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
