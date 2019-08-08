<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="catWH_ru cat_ru do1r" version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:do1r="urn:customs.ru:Information:WarehouseDocuments:DO1Report:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="do1r:DO1Report">
		<html>
			<head>
				<title>DO1Report</title>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: normal;*/ padding-left:4pt }
					td.bold { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 8.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
					td.border-left { border-left: medium none; border-right: .5pt solid black; }
					td.border { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: medium none; } 
					td.border-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; } 
					td.border-top { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-bottom { border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; } 
					td.border-top-bottom { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; } 
					td.border-top-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-top-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left-right-bottom { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					span.bold { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.valueMain {border-bottom: solid 1px black; font-family: Arial; font-style: italic; font-weight: bold; }
                    .value {border-bottom: solid 1px black; font-style: italic; font-family: Arial; text-valign: bottom; }
					div.page { width: 297mm; height: 210mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {border: solid 1pt #000000;}
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graphUnderlined {font-family: Arial; font-size: 7pt; border-top: solid 0.8pt #000000}
					.graph-number { font-size: 9pt; font-weight: bold; }
				</style>
			</head>
			<body>
				<div class="page">
					<table border="0" cellpadding="3" cellspacing="0" width="260mm">
						<tr>
							<td colspan="2" style="width:260mm">
								<table border="0" cellpadding="3" cellspacing="0" style="width:260mm">
									<tbody>
										<tr>
											<td align="center" height="30mm" rowspan="3" style="width:150mm;border:solid 1.5pt #000000;">
												<span class="bold">
													<xsl:text>СВХ </xsl:text>
													<span class="value">
														<xsl:value-of select="catWH_ru:WarehouseOwner/cat_ru:OrganizationName"/>
													</span>
													<br/>
													<xsl:variable name="WHLicCertKind" select="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind"/>
													<xsl:choose>
														<xsl:when test="$WHLicCertKind='lic_Certificate'"> Свидетельство о включении в реестр владельцев СВХ </xsl:when>
														<xsl:when test="$WHLicCertKind='lic_Licence'"> Лицензия владельца СВХ </xsl:when>
														<xsl:when test="$WHLicCertKind='lic_Permition'"> Разрешение ТО на временное хранение в ином месте </xsl:when>
														<xsl:when test="$WHLicCertKind='lic_PermZtk'"> ПЗТК </xsl:when>
														<xsl:when test="$WHLicCertKind='lic_TempZtk'"> ВЗТК </xsl:when>
														<xsl:otherwise> Свидетельство о включении в реестр владельцев СВХ </xsl:otherwise>
													</xsl:choose>
													<xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate">
														<span class="value">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate"/>
															</xsl:call-template>
														</span>
													</xsl:if>
													<xsl:text> № </xsl:text>
													<span class="value">
														<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/>
													</span>
												</span>
												<br/>
												<span class="graph"> (при хранении товаров на складе получателя товаров указывается номер разрешения таможни) </span>
											</td>
											<td height="30mm" rowspan="3" style="width:80mm">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
											<td align="center" height="10mm" style="width:30mm;border:solid 1.5pt #000000;">
												<span class="bold">Форма ДО1</span>
											</td>
										</tr>
										<tr>
											<td height="10mm" style="width:30mm"/>
										</tr>
										<tr>
											<td height="10mm" style="width:30mm"/>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<!--xsl:for-each select="do1r:GoodsShipment/do1r:TransportDocs/do1r:Goods"-->
						<!--xsl:if test="do1r:GoodsShipment/do1r:TransportDocs/catWH_ru:Goods/catWH_ru:ShippingDocsMismatch"-->
						<!--xsl:choose>
								<xsl:when test="do1r:ShippingDocsMismatch"-->
						<!--Для вывода шапки добавочного листа по признаку наличия элемента ShippingDocsMismatch-->
						<!--tr>
                        <td align="center" class="bold" colspan="2" style="width:260mm">
                           <br/-->
						<!--span class="bold"-->
						<!--xsl:text>Добавочный лист к отчету № </xsl:text>
                           <xsl:value-of select="catWH_ru:ReportNumber"/-->
						<!--xsl:if test="//catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:CustomsCode">
												<xsl:value-of select="//catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:CustomsCode"/>
											</xsl:if>
											<xsl:text> / </xsl:text>
											<xsl:call-template name="russian_date_gtd">
												<xsl:with-param name="dateIn" select="//catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:RegistrationDate"/>
											</xsl:call-template>
											<xsl:text> / </xsl:text>
											<xsl:value-of select="//catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:GTDNumber"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text-->
						<!--xsl:text> от </xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
                           </xsl:call-template>
                           <br/>
                           <xsl:text> о принятии товаров на хранение </xsl:text-->
						<!--/span-->
						<!--br/>
                        </td>
                     </tr>
                  </xsl:if-->
						<!--/xsl:when-->
						<!--Для вывода шапки основного листа по признаку отсутсtвия элемента ShippingDocsMismatch-->
						<!--xsl:otherwise-->
						<!--xsl:if test="not(do1r:GoodsShipment/do1r:TransportDocs/catWH_ru:Goods/catWH_ru:ShippingDocsMismatch)"-->
						<tr>
							<td align="center" class="bold" colspan="2" style="width:260mm">
								<br/>
								<!--span class="bold"-->
								<xsl:text> Отчет № </xsl:text>
								<span class="valueMain">
									<xsl:value-of select="catWH_ru:ReportNumber"/>
								</span>
								<!--xsl:if test="catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:CustomsCode">
												<xsl:value-of select="//catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:CustomsCode"/>
											</xsl:if>
											<xsl:text> / </xsl:text>
											<xsl:call-template name="russian_date_gtd">
												<xsl:with-param name="dateIn" select="catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:RegistrationDate"/>
											</xsl:call-template>
											<xsl:text> / </xsl:text>
											<xsl:value-of select="catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:GTDNumber"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text-->
								<xsl:text> от </xsl:text>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<span class="valueMain">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
									</xsl:call-template>
								</span>
								<br/>
								<xsl:text> о принятии товаров на хранение </xsl:text>
								<!--/span-->
								<br/>
								<br/>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="width:260mm">
								<xsl:choose>
									<xsl:when test="catWH_ru:CustomRegistration/catWH_ru:CustomState='ds_Registered'">Зарегистрировано</xsl:when>
								</xsl:choose>
								<xsl:if test="catWH_ru:CustomRegistration/catWH_ru:RegisterTime">
									<xsl:text> </xsl:text>
									<xsl:value-of select="catWH_ru:CustomRegistration/catWH_ru:RegisterTime"/>
								</xsl:if>
								<xsl:if test="catWH_ru:CustomRegistration/catWH_ru:Inspector">
									<xsl:text>, </xsl:text>
									<xsl:value-of select="catWH_ru:CustomRegistration/catWH_ru:Inspector/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="catWH_ru:CustomRegistration/catWH_ru:Inspector/cat_ru:PersonName"/>
									<xsl:text> ЛНП </xsl:text>
									<xsl:value-of select="catWH_ru:CustomRegistration/catWH_ru:Inspector/catWH_ru:LNP"/>
								</xsl:if>
								<xsl:for-each select="catWH_ru:CustomRegistration/catWH_ru:RegisterNumber">
									<xsl:text>, № </xsl:text>
									<xsl:value-of select="cat_ru:CustomsCode"/>
									<xsl:text>/</xsl:text>
									<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
									</xsl:call-template>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="cat_ru:GTDNumber"/>
								</xsl:for-each>
							</td>
						</tr>
						<!--tr>
							<td colspan="2" style="width:180mm">
							<p align="left"><xsl:text>В адрес получателя:</xsl:text><br/>
							<xsl:text>по транспортному документу (вид, дата и номер): </xsl:text>
								<xsl:for-each select="do1r:GoodsShipment/do1r:TransportDocs">
								<xsl:value-of select="./catWH_ru:PresentedDocumentModeCode"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:if test="./cat_ru:PrDocumentDate">
									 <xsl:text> от </xsl:text>
									 <xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="./cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								 </xsl:if>
								<xsl:if test="./cat_ru:PrDocumentNumber">		 
									<xsl:text> № </xsl:text><xsl:value-of select="./cat_ru:PrDocumentNumber"/>
								 </xsl:if>		 
							</xsl:for-each></p>
							</td>
						</tr-->
						<!--/xsl:if-->
						<tr>
							<td style="width:260mm">
								<p align="left">
									<xsl:text>Перевозчик </xsl:text>
									<span class="value">
										<xsl:value-of select="//do1r:Carrier/cat_ru:OrganizationName"/>
									</span>
								</p>
							</td>
							<td align="center" style="width:260mm">
								<p align="left">
									<xsl:text>Код вида транспорта </xsl:text>
									<span class="value">
										<xsl:value-of select="catWH_ru:MainTransportModeCode"/>
									</span>
									<xsl:if test="do1r:GoodsShipment/do1r:MasterAirWayBill">
										<xsl:text> Авиа-накладная </xsl:text>
										<span class="value">
											<xsl:for-each select="do1r:GoodsShipment/do1r:MasterAirWayBill">
												<xsl:value-of select="cat_ru:PrDocumentNumber"/>
												<xsl:if test="cat_ru:PrDocumentDate">
													<xsl:text> от </xsl:text>
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:for-each>
										</span>
									</xsl:if>
								</p>
								<br/>
							</td>
						</tr>
						<!--/xsl:otherwise>
							</xsl:choose-->
						<!--/xsl:for-each-->
					</table>
					<table border="0" cellpadding="1" cellspacing="0" width="260mm">
						<!--tr>
							<td colspan="2" style="width:180mm"><p align="left">
								<xsl:text>Регистрационный номер автотранспортного средства (прицепа), воздушного судна или наименование морского (речного) судна  </xsl:text>
									<xsl:for-each select="do1r:Transports">
									<xsl:value-of select="./catWH_ru:TransportIdentifier"/>
									<xsl:if test="./catWH_ru:Avto"><xsl:value-of select="./catWH_ru:TrailerIdentifier"/>, </xsl:if>	 
									<xsl:if test="./catWH_ru:Avto">,<xsl:value-of select="./catWH_ru:SecondTrailerIdentifier"/> </xsl:if>
									<xsl:if test="./catWH_ru:Avia">, номер рейса <xsl:value-of select="catWH_ru:Avia/catWH_ru:FlightNumber"/></xsl:if>	 
									<xsl:if test="./catWH_ru:Avia"> дата рейса 
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="catWH_ru:Avia/catWH_ru:FlightDate"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:for-each>
							</p>
							</td>
						</tr-->
						<!--tr>
							<td colspan="2" style="width:180mm"><p align="left"><xsl:text>Номер транзитной декларации или книжки МДП:</xsl:text>
							
							
							<xsl:for-each select="do1r:GoodsShipment/do1r:CustomsDocs">
										<xsl:if test="./cat_ru:PrDocumentNumber">		 
									<xsl:text> № </xsl:text><xsl:value-of select="./cat_ru:PrDocumentNumber"/>
								 </xsl:if>		
								<xsl:if test="./cat_ru:PrDocumentDate">
									 <xsl:text> от </xsl:text>
									 <xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="./cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								 </xsl:if>
 										<xsl:if test="./catWH_ru:VttCustomsCode">		 
									<xsl:text> код таможни </xsl:text><xsl:value-of select="./catWH_ru:VttCustomsCode"/>
								 </xsl:if>	
							</xsl:for-each>
							
							
							
							
							<br/>
							<xsl:text>Приняты на хранение следующие товары (табл.)</xsl:text><br/></p>
							</td>
						</tr-->
						<tr>
							<td align="left" style="width:260mm">Вид, дата и номер транспортного документа <span class="value">
									<xsl:for-each select="do1r:GoodsShipment/do1r:TransportDocs">
										<xsl:value-of select="./catWH_ru:PresentedDocumentModeCode"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="./cat_ru:PrDocumentDate">
											<xsl:text> от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="./cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="./cat_ru:PrDocumentNumber">
											<xsl:text> № </xsl:text>
											<xsl:value-of select="./cat_ru:PrDocumentNumber"/>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr align="left">
							<td align="left" class="graph" style="width:260mm" valign="top">(если для указания сведений недостаточно места, допускается указывать их на обратной стороне основного листа отчета и делать запись "см. на обороте")
							</td>
						</tr>
						<tr>
							<td>
								<br/>
								<xsl:text>Приняты на хранение следующие товары (табл.)</xsl:text>
								<br/>
							</td>
						</tr>
						<tr>
							<td style="width:260mm">
								<xsl:if test="(do1r:GoodsShipment/do1r:MPOSign='0') or (do1r:GoodsShipment/do1r:MPOSign='f') or (do1r:GoodsShipment/do1r:MPOSign='false')">
									<table align="center" width="180mm">
										<tbody>
											<p align="center">
												<tr>
													<td class="bordered" align="center" style="width:10mm;">№ п/п</td>
													<td class="bordered" align="center" style="width:15mm;">Дата и время помещения на склад</td>
													<td class="bordered" align="center" style="width:30mm;">Наименование товара</td>
													<td class="bordered" align="center" style="width:15mm;">Код товара</td>
													<td class="bordered" align="center" style="width:20mm;">Складской номер товара</td>
													<td class="bordered" align="center" style="width:10mm;">Количество грузовых мест</td>
													<td class="bordered" align="center" style="width:20mm;">Вес товара брутто (в кг) или объем товара (в куб. м) (либо в доп. единицах измерения)</td>
													<td class="bordered" align="center" style="width:10mm;">Стоимость товара в валюте, указанной в транспортных или коммерческих документах</td>
													<td class="bordered" align="center" style="width:10mm;">Буквенный код валюты</td>
													<td class="bordered" align="center" style="width:40mm;">Примечание</td>
												</tr>
												<tr>
													<td class="bordered" align="center" style="width:10mm;">1</td>
													<td class="bordered" align="center" style="width:15mm;">2</td>
													<td class="bordered" align="center" style="width:30mm;">3</td>
													<td class="bordered" align="center" style="width:15mm;">4</td>
													<td class="bordered" align="center" style="width:20mm;">5</td>
													<td class="bordered" align="center" style="width:10mm;">6</td>
													<td class="bordered" align="center" style="width:20mm;">7</td>
													<td class="bordered" align="center" style="width:10mm;">8</td>
													<td class="bordered" align="center" style="width:10mm;">9</td>
													<td class="bordered" align="center" style="width:40mm;">11</td>
												</tr>
												<!--xsl:for-each select="do1r:GoodsShipment/do1r:TransportDocs"-->
												<!--xsl:for-each select="do1r:Goods"-->
												<!--xsl:variable name="TransportDocs" select="current()"/-->
												<xsl:variable name="TransportDocs" select="do1r:GoodsShipment/do1r:TransportDocs"/>
												<xsl:for-each select="do1r:GoodsShipment/do1r:TransportDocs/catWH_ru:Goods">
													<tr>
														<td class="bordered" align="center" style="width:10mm;">
															<xsl:value-of select="catWH_ru:GoodsNumber"/>
														</td>
														<td class="bordered" align="center" style="width:15mm;">
															<xsl:if test="catWH_ru:AcceptDateTime">
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="catWH_ru:AcceptDateTime"/>
																</xsl:call-template>
																<br/>
																<xsl:value-of select="substring(catWH_ru:AcceptDateTime,12,8)"/>
															</xsl:if>
														</td>
														<td class="bordered" align="center" style="width:30mm;">
															<!--<xsl:choose>
																<xsl:when test="do1r:ShippingDocsMismatch/do1r:GoodsDescription">
																	<xsl:value-of select="do1r:ShippingDocsMismatch/do1r:GoodsDescription"/>
																</xsl:when>
																<xsl:otherwise>-->
															<xsl:for-each select="catWH_ru:GoodsDescription">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
															<!--</xsl:otherwise>
															</xsl:choose>-->
														</td>
														<td class="bordered" align="center" style="width:15mm;">
															<!--<xsl:choose>
																<xsl:when test="do1r:ShippingDocsMismatch/do1r:GoodsTNVEDCode">
																	<xsl:value-of select="do1r:ShippingDocsMismatch/do1r:GoodsTNVEDCode"/>
																</xsl:when>
																<xsl:otherwise>-->
															<xsl:if test="catWH_ru:GoodsTNVEDCode">
																<xsl:value-of select="catWH_ru:GoodsTNVEDCode"/>
															</xsl:if>
															<!--</xsl:otherwise>
															</xsl:choose>-->
														</td>
														<td class="bordered" align="center" style="width:20mm;">
															<xsl:if test="catWH_ru:GoodsWHNumber">
																<xsl:value-of select="catWH_ru:GoodsWHNumber"/>
															</xsl:if>
															<!--xsl:for-each select="do1r:Container"><xsl:value-of select="catWH_ru:ContainerNumber"/>, </xsl:for-each-->
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Area">,
													<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:Area"/>
																<xsl:text> </xsl:text>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Parking">,
													<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:Parking"/>
																<xsl:text> </xsl:text>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Square">
													,<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:Square"/>
																<xsl:text> </xsl:text>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Comments">,
													<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:Comments"/>
																<xsl:text> </xsl:text>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Angar">,
													<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:Angar"/>
																<xsl:text> </xsl:text>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:WHPackind">,
													<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:WHPackind"/>
																<xsl:text> </xsl:text>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Cell">,
													<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:Cell"/>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator">,
													<xsl:choose>
																	<xsl:when test="catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator='true' or catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator='t' or catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator='1'">хранение без выгрузки из ТС (контейнеров)</xsl:when>
																	<xsl:when test="catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator='false' or catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator='f' or catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator='0'">хранение c выгрузкой из ТС (контейнеров)</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator"/>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:if>
															<xsl:for-each select="$TransportDocs/catWH_ru:Containers">
																<xsl:value-of select="catWH_ru:ContainerNumber"/>
																<xsl:if test="position()!=last()">, 
											 </xsl:if>
															</xsl:for-each>
														</td>
														<td class="bordered" align="center" style="width:10mm;">
															<!--<xsl:choose>
																<xsl:when test="do1r:ShippingDocsMismatch/do1r:PlaceNumber">
																	<xsl:value-of select="do1r:ShippingDocsMismatch/do1r:PlaceNumber"/>
																</xsl:when>
																<xsl:otherwise>-->
															<xsl:if test="catWH_ru:CargoPlace/catWH_ru:PlaceNumber">
																<xsl:value-of select="catWH_ru:CargoPlace/catWH_ru:PlaceNumber"/>
															</xsl:if>
															<!--</xsl:otherwise>
															</xsl:choose>-->
														</td>
														<td class="bordered" align="center" style="width:20mm;">
															<!--<xsl:choose>
																<xsl:when test="do1r:ShippingDocsMismatch/catWH_ru:BruttoVolQuant">
																	<xsl:value-of select="do1r:ShippingDocsMismatch/catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/>
																	<xsl:text> </xsl:text>
																	<xsl:if test="do1r:ShippingDocsMismatch/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName">
																		<xsl:value-of select="do1r:ShippingDocsMismatch/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/>
																	</xsl:if>
																</xsl:when>
																<xsl:otherwise>-->
															<xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/>
															<xsl:text> </xsl:text>
															<xsl:if test="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName">
																<xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/>
															</xsl:if>
																	(<xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>)
																
                                             <!--</xsl:otherwise>
															</xsl:choose>-->
														</td>
														<td class="bordered" align="center" style="width:10mm;">
															<!--<xsl:choose>
																<xsl:when test="do1r:ShippingDocsMismatch/do1r:InvoiceCost">
																	<xsl:value-of select="do1r:ShippingDocsMismatch/do1r:InvoiceCost"/>
																</xsl:when>
																<xsl:otherwise>-->
															<xsl:if test="catWH_ru:InvoiceCost">
																<xsl:value-of select="catWH_ru:InvoiceCost"/>
															</xsl:if>
															<!--</xsl:otherwise>
															</xsl:choose>-->
														</td>
														<td class="bordered" align="center" style="width:10mm;">
															<xsl:if test="catWH_ru:CurrencyCode">
																<xsl:value-of select="catWH_ru:CurrencyCode"/>
															</xsl:if>
														</td>
														<td class="bordered" align="center" style="width:40mm;">
															<xsl:if test="catWH_ru:Comments">
																<xsl:value-of select="catWH_ru:Comments"/>
															</xsl:if>
															<!--<xsl:if test="do1r:ShippingDocsMismatch">
												<xsl:if test="do1r:ShippingDocsMismatch/do1r:Kind='mism_ResortGood'">
															 Товар есть в наличии, но его характеристики не соответствуют заявленным в товаросопроводительных документах.
															</xsl:if>
															<xsl:if test="do1r:ShippingDocsMismatch/do1r:Kind='mism_MissedGood'">
															 Товар был заявлен в товаросопроводительных документах, но отсутствует по факту.
															</xsl:if>
															
															<xsl:if test="do1r:ShippingDocsMismatch/do1r:Kind='mism_ExtraGood'">
															 Дополнительный (лишний) товар, отсутствовавший в товаросопроводительных документах, но выявленный по факту.	
															</xsl:if>-->
															<!--xsl:value-of select="do1r:ShippingDocsMismatch/do1r:Kind"/-->
															<!--&#160;
																	<xsl:if test="do1r:ShippingDocsMismatch/do1r:Stage='mist_AtAcceptance'">
															 Несоответствие выявлено на этапе принятия товара.
															</xsl:if>
															<xsl:if test="do1r:ShippingDocsMismatch/do1r:Stage='mist_AtKeeping'">
															Несоответствие выявлено в процессе 
															</xsl:if>-->
															<!--xsl:value-of select="do1r:ShippingDocsMismatch/do1r:Stage"/--> 
																
                                             <!--<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="do1r:ShippingDocsMismatch/do1r:Date"/>
																</xsl:call-template>&#160;	
																<xsl:value-of select="do1r:ShippingDocsMismatch/do1r:Time"/>&#160;
																<xsl:for-each select="do1r:ShippingDocsMismatch/do1r:CommerceAct">
																	<xsl:value-of select="."/>&#160;
																</xsl:for-each>
															</xsl:if>-->
														</td>
													</tr>
												</xsl:for-each>
											</p>
										</tbody>
									</table>
								</xsl:if>
								<xsl:if test="(do1r:GoodsShipment/do1r:MPOSign='1') or (do1r:GoodsShipment/do1r:MPOSign='t') or (do1r:GoodsShipment/do1r:MPOSign='t') or (do1r:GoodsShipment/do1r:MPOSign='true')">
									<table align="center" width="180mm">
										<tbody>
											<p align="center">
												<tr>
													<td class="bordered" align="center" style="width:10mm;">№ п/п</td>
													<td class="bordered" align="center" style="width:15mm;">Дата и время приема документов</td>
													<td class="bordered" align="center" style="width:30mm;">Номер МПО</td>
													<td class="bordered" align="center" style="width:15mm;">Код товара</td>
													<td class="bordered" align="center" style="width:15mm;">Номер емкости МПО</td>
													<td class="bordered" align="center" style="width:10mm;">Количество грузовых мест</td>
													<td class="bordered" align="center" style="width:25mm;">Вес МПО брутто (в кг) или объем МПО (в куб. м) (либо в доп. единицах измерения)</td>
													<td class="bordered" align="center" style="width:10mm;">Стоимость товара в валюте, указанной в транспортных или коммерческих документах</td>
													<td class="bordered" align="center" stye="width:10mm;">Код валюты</td>
													<td class="bordered" align="center" style="width:40mm;">Примечание</td>
												</tr>
												<tr>
													<td class="bordered" align="center" style="width:10mm;">1</td>
													<td class="bordered" align="center" style="width:15mm;">2</td>
													<td class="bordered" align="center" style="width:30mm;">3</td>
													<td class="bordered" align="center" style="width:15mm;">4</td>
													<td class="bordered" align="center" style="width:15mm;">5</td>
													<td class="bordered" align="center" style="width:10mm;">6</td>
													<td class="bordered" align="center" style="width:25mm;">7</td>
													<td class="bordered" align="center" style="width:10mm;">8</td>
													<td class="bordered" align="center" style="width:10mm;">9</td>
													<td class="bordered" align="center" style="width:40mm;">11</td>
												</tr>
												<!--xsl:variable name="TransportDocs" select="current()"/-->
												<xsl:for-each select="do1r:GoodsShipment/do1r:TransportDocs/catWH_ru:Goods">
													<tr>
														<td align="center" class="bordered" style="width:10mm;">
															<xsl:value-of select="catWH_ru:GoodsNumber"/>
														</td>
														<td align="center" class="bordered" style="width:15mm;">
															<xsl:if test="catWH_ru:AcceptDateTime">
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="catWH_ru:AcceptDateTime"/>
																</xsl:call-template>
																<br/>
																<xsl:value-of select="substring(catWH_ru:AcceptDateTime,12,8)"/>
															</xsl:if>
														</td>
														<td align="center" class="bordered" style="width:30mm;">
															<xsl:if test="catWH_ru:MPONumber">
																<xsl:value-of select="catWH_ru:MPONumber/catWH_ru:ServiceIndicator"/>/
																<xsl:value-of select="catWH_ru:MPONumber/catWH_ru:SerialNumber"/>/
																<xsl:value-of select="catWH_ru:MPONumber/catWH_ru:CountryCode"/>
															</xsl:if>
															<!--	<xsl:if test="catWH_ru:MPOCaseNum">
																<xsl:value-of select="catWH_ru:MPOCaseNum"/>/
														</xsl:if>-->
														</td>
														<td class="bordered" align="center" style="width:15mm;"/>
														<td class="bordered" align="center" style="width:15mm;">
															<xsl:value-of select="catWH_ru:MPOCaseNumder"/>
															<!--xsl:for-each select="do1r:Container"><xsl:value-of select="catWH_ru:ContainerNumber"/>, </xsl:for-each-->
															<!--xsl:if test="do1r:KeepingPlace/do1r:Area">,
													<xsl:value-of select="do1r:KeepingPlace/do1r:Area"/>
													<xsl:text> </xsl:text> 
													</xsl:if>
													<xsl:if test="do1r:KeepingPlace/do1r:Parking">,
													<xsl:value-of select="do1r:KeepingPlace/do1r:Parking"/>
													<xsl:text> </xsl:text>
													 </xsl:if>
													<xsl:if test="do1r:KeepingPlace/do1r:Square">
													,<xsl:value-of select="do1r:KeepingPlace/do1r:Square"/>
													<xsl:text> </xsl:text>
													 </xsl:if>
														<xsl:if test="do1r:KeepingPlace/do1r:Comments">,
														<xsl:value-of select="do1r:KeepingPlace/do1r:Comments"/>
														<xsl:text> </xsl:text>
														 </xsl:if>													
													<xsl:if test="do1r:KeepingPlace/do1r:Angar">,
													<xsl:value-of select="do1r:KeepingPlace/do1r:Angar"/>
													<xsl:text> </xsl:text>
													 </xsl:if>
													<xsl:if test="do1r:KeepingPlace/do1r:WHPackind">,
													<xsl:value-of select="do1r:KeepingPlace/do1r:WHPackind"/>
													<xsl:text> </xsl:text> 
													</xsl:if>
													<xsl:if test="do1r:KeepingPlace/do1r:Cell">,
													<xsl:value-of select="do1r:KeepingPlace/do1r:Cell"/>
													</xsl:if>
													
												<xsl:for-each select="$TransportDocs/do1r:Conatiners">
												<xsl:value-of select="catWH_ru:ContainerNumber"/>, 
												</xsl:for-each-->
														</td>
														<td class="bordered" align="center" style="width:10mm;">1</td>
														<td align="center" class="bordered" style="width:25mm;">
															<xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/>
															<xsl:text> </xsl:text>
															<xsl:if test="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName">
																<xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/>
															</xsl:if>
															(<xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>)
														</td>
														<td class="bordered" align="center" style="width:10mm;"/>
														<td class="bordered" align="center" style="width:10mm;"/>
														<td class="bordered" align="center" style="width:40mm;">
															<xsl:if test="catWH_ru:Comments">
																<xsl:value-of select="catWH_ru:Comments"/> 
											</xsl:if>
															<xsl:if test="catWH_ru:MpoBillBruttoVolQuant">
																<xsl:value-of select="catWH_ru:MpoBillBruttoVolQuant/catWH_ru:GoodsQuantity"/> 
												<xsl:value-of select="catWH_ru:MpoBillBruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
												<xsl:value-of select="catWH_ru:MpoBillBruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
															</xsl:if>
														</td>
													</tr>
												</xsl:for-each>
												<!--/xsl:for-each-->
											</p>
										</tbody>
									</table>
								</xsl:if>
							</td>
						</tr>
						<!--tr>
							<td style="width:260mm;" colspan="2">
								<table border="0" width="100%">
								<tbody>
									<br/>
									<tr>
										<td width="100mm"><p align="right"><xsl:text>Указанные товары принял</xsl:text> </p></td>
										<td width="30mm"><p align="left">
											<xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost">
												<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost"/>
											</xsl:if></p>
										</td>
										<td width="20mm">
											______________
										</td>
										<td width="30mm">
												<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/>
												<xsl:text> </xsl:text>												
												<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonSurname"/>								
										</td>
									</tr>
									<tr>
										<td width="100mm"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text> </td>
										<td width="30mm">
										<p align="center"> (должность уполномоченного работника склада)</p>		 
										 </td>
										<td width="20mm">
										<p align="center">(подпись)</p>		 
										 </td>
										 <td width="30mm">
										<p align="center">(инициалы, фамилия)</p>		 
										 </td>
									</tr>
									
								</tbody>
							</table>
						</td>
						
						</tr-->
						<tr align="right">
							<td align="right">
								<table width="180mm">
									<tbody>
										<tr>
											<td colspan="2">
												<br/>
												<br/>
											</td>
										</tr>
										<tr>
											<td align="right">Указанные товары принял</td>
											<td align="center">
												<span class="value">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
													</xsl:call-template>
													<xsl:text> &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160;</xsl:text>
													<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonSurname"/> 
												<xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost">
														<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost"/>
													</xsl:if>
												</span>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
											<td align="center" class="graph">(дата) (подпись, инициалы, фамилия и должность уполномоченного работника склада)</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!--xsl:template match="do1r:Consignor | do1r:Consignee">
		<xsl:value-of select="cat_ru:OrganizationName"/><br/>
		<xsl:apply-templates select="cat_ru:Address"/><br/>
		<xsl:apply-templates select="cat_ru:BankInformation"/>
	</xsl:template>
	<xsl:template match="cat_ru:Address">
		<xsl:value-of select="cat_ru:StreetHouse"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:value-of select="cat_ru:City"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:if test="string(cat_ru:PostalCode)!=''"><xsl:value-of select="cat_ru:PostalCode"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
		<xsl:value-of select="cat_ru:CounryName"/>
	</xsl:template-->
	<!--xsl:template match="cat_ru:BankInformation">
		Cчет № : <xsl:value-of select="cat_ru:BankAccount"/>
	</xsl:template-->
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
</xsl:stylesheet>
