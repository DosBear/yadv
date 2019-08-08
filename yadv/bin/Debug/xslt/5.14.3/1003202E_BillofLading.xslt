<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru bol" version="1.0" xmlns:bol="urn:customs.ru:Information:TransportDocuments:Sea:BillofLading:5.14.3" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
	<xsl:template match="bol:BillofLading">
		<html>
			<head>
				<title>Коносамент</title>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
							
						div.page {
							width: 210mm;
							height: 297mm;
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
							border-bottom: solid 0.8pt #000000;
							}
							
						p.NumberDate {
							font-weight: bold;
							}
							
						.graph {
							font-family: Arial;
							font-size: 8pt;
							}
						td {
							font-family:Courier New;
							}
		
						.graphMain {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
					</style>
			</head>
			<body>
				<div class="page">
					<table border="1" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td rowspan="2" style="width:100mm">
									<span class="graphMain">Грузоотправитель: </span>
									<br/>
									<span class="graph">Компания </span>
									<xsl:value-of select="bol:Consignor/cat_ru:OrganizationName"/>
									<br/>
									<xsl:value-of select="bol:Consignor/cat_ru:Address/cat_ru:PostalCode"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="bol:Consignor/cat_ru:Address/cat_ru:CountryCode"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="bol:Consignor/cat_ru:Address/cat_ru:Region"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="bol:Consignor/cat_ru:Address/cat_ru:City"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="bol:Consignor/cat_ru:Address/cat_ru:StreetHouse"/>
									<xsl:if test="bol:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:INN">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							   ИНН
							   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="bol:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</xsl:if>
									<xsl:if test="bol:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							   КПП
							   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="bol:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</xsl:if>
									<p/>
									<span class="graphMain">Грузополучатель: </span>
									<br/>
									<!--
									<span class="graph">ПО РАСПОРЯЖЕНИЮ </span>
									<br/>
-->
									<xsl:value-of select="bol:Consignee/cat_ru:OrganizationName"/>
									<br/>
									<xsl:value-of select="bol:Consignee/cat_ru:Address/cat_ru:PostalCode"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="bol:Consignee/cat_ru:Address/cat_ru:CountryCode"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="bol:Consignee/cat_ru:Address/cat_ru:Region"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="bol:Consignee/cat_ru:Address/cat_ru:City"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="bol:Consignee/cat_ru:Address/cat_ru:StreetHouse"/>
									<xsl:if test="bol:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							   ИНН
							   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="bol:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</xsl:if>
									<xsl:if test="bol:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							   КПП
							   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="bol:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</xsl:if>
									<p/>
									<!--
									<span class="graphMain">Адрес извещения: </span>
									<br/>
									<span class="graph">Компания </span>
-->
									<!-- Адрес извещениия -->
									<!--xsl:value-of select="bol:Consignor/cat_ru:NameInf"/-->
									<!--xsl:value-of select="bol:Consignor/cat_ru:PostalAddress/cat_ru:PostalCode"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="bol:Consignor/cat_ru:PostalAddress/cat_ru:CountryCode"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="bol:Consignor/cat_ru:PostalAddress/cat_ru:Municipality"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="bol:Consignor/cat_ru:PostalAddress/cat_ru:AddressLine"/-->
								</td>
								<td class="graph" style="width:40mm" valign="top">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="width:40mm" valign="top">
									<span class="graph">№ коносамента:
									<xsl:value-of select="bol:RegistrationDocument/cat_ru:PrDocumentNumber"/>
										<xsl:if test="bol:PI_RegID">
											<br/>
											<br/>
											<br/>Регистрационный идентификатор предварительной информации: <xsl:value-of select="bol:PI_RegID"/>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="2" style="width:80mm">
									<p/>
									<h3 align="center">СУДОВОЙ КОНОСАМЕНТ</h3>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="width:180mm">
									<table border="0" cellpadding="3" cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td style="width:60mm;vertical-align:top;">
													<span class="graphMain">Судно: </span>
													<br/>
													<xsl:value-of select="bol:Vessel/catTrans_ru:Name"/>
													<xsl:if test="bol:Vessel/catTrans_ru:NationalityVessel or bol:Vessel/catTrans_ru:NationalityCode or bol:Vessel/catTrans_ru:NationalityVesselCode">
														<br/>
														<xsl:value-of select="bol:Vessel/catTrans_ru:NationalityVessel"/>
														<xsl:if test="bol:Vessel/catTrans_ru:NationalityVesselCode">
															<xsl:text> (</xsl:text>
															<xsl:value-of select="bol:Vessel/catTrans_ru:NationalityVesselCode"/>
															<xsl:text>)</xsl:text>
														</xsl:if>
													</xsl:if>
													<br/>
													<span class="graphMain">Порт разгрузки: </span>
													<br/>
													<xsl:value-of select="bol:Unloading/catTrans_ru:Name"/>
												</td>
												<td style="width:60mm;vertical-align:top;">
													<span class="graphMain">Фамилия капитана: </span>
													<br/>
													<xsl:if test="bol:Vessel/catTrans_ru:Shipmaster">
														<xsl:value-of select="bol:Vessel/catTrans_ru:Shipmaster"/>
													</xsl:if>
													<br/>
													<span class="graphMain">Порт погрузки: </span>
													<br/>
													<xsl:value-of select="bol:Loading/catTrans_ru:Name"/>
													<br/>
													<xsl:if test="bol:CommissionShipment">
														<br/>
														<span class="graphMain">Поручение(я) на погрузку:</span>
														<br/>
														<xsl:for-each select="bol:CommissionShipment">
															<xsl:apply-templates select="."/>
														   <xsl:if test="position()!=last()">;<br/></xsl:if>
														</xsl:for-each>
													</xsl:if>
												</td>
												<td style="width:60mm;vertical-align:top;">
													<span class="graphMain">Место получения груза перевозчиком: </span>
													<br/>
													<xsl:if test="bol:PlaceOfReceipt">
														<xsl:value-of select="bol:PlaceOfReceipt/bol:City"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:if test="bol:PlaceOfReceipt/bol:CountryName">
															<xsl:value-of select="bol:PlaceOfReceipt/bol:CountryName"/>
														</xsl:if>
													</xsl:if>
													<br/>
													<span class="graphMain">Конечный пункт назначения: </span>
													<br/>
													<xsl:if test="bol:Destination/bol:Name">
														<xsl:value-of select="bol:Destination/bol:Name"/>
													</xsl:if>
													<xsl:if test="bol:Destination/bol:Address/cat_ru:City">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="bol:Destination/bol:Address/cat_ru:City"/>
													</xsl:if>
													<!--xsl:if test="bol:PlaceOfDelivery"><xsl:value-of select="bol:PlaceOfDelivery/bol:City"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
													<xsl:if test="bol:PlaceOfDelivery/bol:CountryName">
													<xsl:value-of select="bol:PlaceOfDelivery/bol:CountryName"/>
													</xsl:if>
													</xsl:if-->
													<!-- Нужен ли адрес конечного пункта назначения? -->
												</td>
												<td style="width:60mm;vertical-align:top;">
													<span class="graphMain">Фрахт к оплате: </span>
													<br/>
													<xsl:if test="bol:Freight">
														<xsl:value-of select="bol:Freight/bol:FreightAmount"/>
													</xsl:if>
													<!--xsl:value-of select="bol:Loading/cat_ru:PortName"/-->
													<br/>
													<span class="graphMain">Число оригиналов коносамента: </span>
													<br/>
													<xsl:value-of select="bol:CopyNumber"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3" style="width:180mm">
									<table border="0" cellpadding="3" cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td style="width:30mm">
													<span class="graph">Отметки и номера</span>
												</td>
												<td style="width:20mm">
													<span class="graph">Номер контейнера</span>
												</td>
												<td style="width:80mm">
													<span class="graph">Число упаковок, описание товаров</span>
												</td>
												<td style="width:20mm">
													<span class="graph">Вес брутто</span>
												</td>
												<td style="width:30mm">
													<span class="graph">Габариты</span>
												</td>
												<xsl:if test="bol:Goods/bol:ZTKNum or bol:Goods/bol:ZTKName">
													<td>
														<span class="graph">ЗТК</span>
													</td>
												</xsl:if>
											</tr>
											<xsl:for-each select="bol:Goods">
												<tr valign="top">
													<td style="width:30mm">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="cat_ru:GoodsMarking"/>
													</td>
													<td>
														<xsl:for-each select="bol:Container">
															<xsl:value-of select="bol:ContainerNum"/>
															<xsl:if test="bol:Seal">
																<xsl:text>; пломбы: </xsl:text>
																<xsl:for-each select="bol:Seal">
																	<xsl:value-of select="."/>
																	<xsl:if test="position()!=last()">, </xsl:if>
																</xsl:for-each>
															</xsl:if>
															<xsl:if test="bol:TotalSealNumber">
																<xsl:text>; кол-во пломб: </xsl:text>
																<xsl:value-of select="bol:TotalSealNumber"/>
															</xsl:if>
															<xsl:if test="bol:ZTKNum or bol:ZTKName">
																<xsl:text>; ЗТК: </xsl:text>
																<xsl:if test="bol:ZTKNum">
																	<xsl:text>№ </xsl:text>
																	<xsl:value-of select="bol:ZTKNum"/>
																	<xsl:if test="bol:ZTKName">
																		<xsl:text>, </xsl:text>
																	</xsl:if>
																</xsl:if>
																<xsl:value-of select="bol:ZTKName"/>
															</xsl:if>
															<xsl:if test="position()!=last()">
																<br/>
															</xsl:if>
														</xsl:for-each>
													</td>
													<td style="width:80mm">
														<xsl:value-of select="bol:PlacesQuantity"/> 
													<xsl:value-of select="bol:PackingDescription"/>
														<xsl:if test="bol:PolletQuantity">
															<br/>
															<xsl:value-of select="bol:PolletQuantity"/> поддонов (палет)
													</xsl:if>
														<br/>
														<xsl:for-each select="cat_ru:GoodsDescription">
															<xsl:value-of select="."/>
															<br/>
														</xsl:for-each>
														<xsl:value-of select="catTrans_ru:GoodsNomenclatureCode"/>
													</td>
													<td style="width:20mm">
														<xsl:value-of select="bol:GrossWeightQuantity"/>
														<xsl:if test="bol:WeightWithCont">
															<xsl:text> (с конт.: </xsl:text>
															<xsl:value-of select="bol:WeightWithCont"/>
															<xsl:text>)</xsl:text>
														</xsl:if>
														<xsl:text> кг.</xsl:text>
													</td>
													<td style="width:30mm">
														<xsl:value-of select="catTrans_ru:VolumeQuantity"/>
													</td>
													<xsl:if test="../bol:Goods/bol:ZTKNum or ../bol:Goods/bol:ZTKName">
														<td>
															<xsl:if test="bol:ZTKNum">
																<xsl:text>№ </xsl:text>
																<xsl:value-of select="bol:ZTKNum"/>
																<xsl:if test="bol:ZTKName">
																	<xsl:text>, </xsl:text>
																</xsl:if>
															</xsl:if>
															<xsl:value-of select="bol:ZTKName"/>
														</td>
													</xsl:if>
												</tr>
											</xsl:for-each>
											<tr class="graphMain">
												<td style="width:30mm" colspan="2">
													<span class="underlined">ИТОГО:</span>
												</td>
												<td class="underlined" style="width:100mm">
													<xsl:if test="sum(bol:Goods/bol:PlacesQuantity) != 0 ">
														<xsl:value-of select="sum(bol:Goods/bol:PlacesQuantity)"/>
													</xsl:if>
												</td>
												<!-- <td style="width:20mm" class="underlined">
												<xsl:if test="sum(bol:Goods/bol:GrossWeightQuantity) != 0 ">
												  <xsl:value-of select="sum(bol:Goods/bol:GrossWeightQuantity)"/>&#160;кг
												</xsl:if>
											  </td>-->
												<td class="underlined" style="width:20mm">
													<xsl:if test="sum(bol:Goods/bol:GrossWeightQuantity) != 0 ">
														<xsl:value-of select="format-number(sum(bol:Goods/bol:GrossWeightQuantity),'#.000000')"/>
													</xsl:if>
													<xsl:if test="sum(bol:Goods/bol:WeightWithCont) != 0 ">
														<xsl:text> (с конт.: </xsl:text>
														<xsl:value-of select="format-number(sum(bol:Goods/bol:WeightWithCont),'#.000000')"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
													<xsl:if test="sum(bol:Goods/bol:GrossWeightQuantity) != 0 or sum(bol:Goods/bol:WeightWithCont) != 0">
														<xsl:text> кг</xsl:text>
													</xsl:if>
												</td>
												<td class="underlined" style="width:30mm">
													<xsl:if test="sum(bol:Goods/catTrans_ru:VolumeQuantity) != 0 ">
														<xsl:value-of select="sum(bol:Goods/catTrans_ru:VolumeQuantity)"/>
													</xsl:if>
												</td>
											</tr>
											<!--tr>
												<td colspan="4" style="width:180mm">
													<span class="graph">НА УСЛОВИЯХ</span>	
												</td>
											</tr>
											<tr>
												<td style="width:90mm">
													<span class="graph">ФРАХТ</span>	
												</td>
											</tr-->
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td rowspan="2" style="width:100mm">
									<span class="graph">
										<xsl:text> </xsl:text>
									</span>
									<br/>
									<xsl:value-of select="bol:Freight/bol:FrDescription"/>
								</td>
								<td colspan="2" style="width:80mm">
									<span class="graph">Место выдачи:</span>
									<br/>
									<xsl:if test="bol:RegistrationDocument/bol:Place">
										<xsl:value-of select="bol:RegistrationDocument/bol:Place"/>
									</xsl:if>
									<xsl:text> </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="bol:RegistrationDocument/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="width:80mm">
									<span class="graph">Подпись:</span>
									<table border="0" cellpadding="3" cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td style="width:40mm"/>
												<td style="width:40mm">
													<br/>
													<xsl:value-of select="bol:DocumentSignature/bol:PersonPost"/>
													<br/>
													<xsl:value-of select="bol:DocumentSignature/bol:PersonName"/>
													<br/>
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="bol:DocumentSignature/bol:IssueDate"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<xsl:choose>
									<xsl:when test="bol:Mark/bol:MarkSing='true' or bol:Mark/bol:MarkSing='t' or bol:Mark/bol:MarkSing='1'">
										<td class="graph" style="border-right: 0px;">
											<xsl:value-of select="bol:Mark/bol:MarkKind"/>: <xsl:value-of select="bol:Mark/bol:ResultControl"/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td class="graphMain">
											<xsl:text> </xsl:text>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="bol:CommissionShipment">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:if test="cat_ru:PrDocumentName">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:text>от  </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:if test="cat_ru:PrDocumentName or cat_ru:PrDocumentDate">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
