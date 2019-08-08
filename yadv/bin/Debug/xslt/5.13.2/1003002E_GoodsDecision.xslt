<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.12.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:pigd="urn:customs.ru:Information:TransportDocuments:GoodsDecision:5.12.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
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
	<xsl:template name="TDNumber">
		<xsl:param name="num"/>
		<xsl:value-of select="$num/cat_ru:CustomsCode"/><xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="$num/cat_ru:RegistrationDate"/>
		</xsl:call-template><xsl:text>/</xsl:text>
		<xsl:value-of select="$num/cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="pigd:GoodsDecision">
		<html>
			<head>
				<title>Предварительное/окончательное решение в отношении товаров при перевозке морским/воздушным/ЖД транспортном</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
					body {
					text-align: center;
					background: #cccccc;
					}
					div.page {
					width: 280mm;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding:	10mm;
					padding-left:	10mm;
					background: #ffffff;
					border: solid .5pt #000000;
					}
					td {
					font-family:Arial;
					font-size: 10pt;
					vertical-align:top;
					}
					.normal{
					font-weight: bold;
					font-family:Arial;
					font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext;
					}
					.normal2{
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

					.graphMainbold {
					font-family: Arial;
					font-size: 8pt;
					font-weight:bold;
					}
					.graphLittle {
					font-family: Arial;
					font-size: 7pt;
					}
					.graph8Bold {
					font-family: Arial;
					font-size: 10pt;
					font-weight: bold;
					}
					.bordered {
					border-bottom: solid 1pt #000000;
					font-weight: bold;
					}
					.borderednormal {
					border-bottom: solid 1pt #000000;
					font-weight: normal;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table border="0" style="width:280mm">
						<tbody>
							<tr>
								<td class="bold" colspan="2">
									<xsl:if test="pigd:DecisionKind = 1">Предварительное</xsl:if>
									<xsl:if test="pigd:DecisionKind =2">Окончательное </xsl:if>
									решение в отношении товаров при перевозке
									<xsl:if test="pigd:TransportKind = 1">воздушным</xsl:if>
									<xsl:if test="pigd:TransportKind = 2">морским</xsl:if>
									<xsl:if test="pigd:TransportKind = 3">ЖД</xsl:if>
									транспортном <br/>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="left" class="graphMain">
									Код таможенного органа: <xsl:value-of select="pigd:CustomsCode"/>
								</td>
								<td align="right" class="graphMain">
									Дата / Время принятия решения:
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="pigd:DecisionDate"/>
									</xsl:call-template>
									/
									<xsl:value-of select="pigd:DecisionTime"/>
								</td>
							</tr>
							<tr>
								<td align="left" class="graphMain" colspan="2">
									Расчетные дата и время прибытия: 
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="pigd:EstimatedArrival"/></xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(pigd:EstimatedArrival,12,8)"/>
								</td>
							</tr>
							<br/>
							<br/>
							<tr>
								<td align="left" class="graph" colspan="2">
									Сведения о транспортом средстве:

								</td>
							</tr>
							<xsl:if test="pigd:FlightInfo">
								<tr>
									<td align="left" class="graphMain" colspan="2">
										Номер рейса: <xsl:value-of select="pigd:FlightInfo/pigd:FlightNumber"/>
										<br/>
										<xsl:if test="pigd:FlightInfo/pigd:Mark">
											Марка:<xsl:value-of select="pigd:FlightInfo/pigd:Mark"/>
											<br/>
										</xsl:if>
										<xsl:if test="pigd:FlightInfo/pigd:AirPlaneRegNum">
											Регистрационный номер воздушного судна:<xsl:value-of select="pigd:FlightInfo/pigd:AirPlaneRegNum"/>
											<br/>
										</xsl:if>
										Дата рейса: <xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="pigd:FlightInfo/pigd:FlightDate"/>
										</xsl:call-template>
										<xsl:if test="pigd:FlightInfo/pigd:FlightTime">
											Время:<xsl:value-of select="pigd:FlightInfo/pigd:FlightTime"/>
											<br/>
										</xsl:if>
										Аэропорт вылета:<br/> Код ИАТА <xsl:value-of select="pigd:FlightInfo/pigd:DepatureAirport/pigd:IATACode"/>
										<xsl:if test="pigd:FlightInfo/pigd:DepatureAirport/pigd:AirportName">
											Название аэропорта:<xsl:value-of select="pigd:FlightInfo/pigd:DepatureAirport/pigd:AirportName"/>
										</xsl:if>
										<br/>
										Аэропорт прилета:<br/> Код ИАТА <xsl:value-of select="pigd:FlightInfo/pigd:ArrivalAirport/pigd:IATACode"/>
										<xsl:if test="pigd:FlightInfo/pigd:ArrivalAirport/pigd:AirportName">
											Название аэропорта:<xsl:value-of select="pigd:FlightInfo/pigd:ArrivalAirport/pigd:AirportName"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="pigd:Railway">
								<tr>
									<td align="left" class="graphMain" colspan="2">
										<xsl:if test="pigd:Railway/pigd:RailwayCode">
											Код железнодорожной дороги: <xsl:value-of select="pigd:Railway/pigd:RailwayCode"/>
											<br/>
										</xsl:if>
										<xsl:if test="pigd:Railway/pigd:StationCode">
											Код железнодорожной станции: <xsl:value-of select="pigd:Railway/pigd:StationCode"/>
											<br/>
										</xsl:if>
										Наименование дороги и станции назначения: <xsl:value-of select="pigd:Railway/pigd:RailwayAndStationName"/>
										<br/>
										<xsl:if test="pigd:Railway/pigd:TrainIndex">
											Индекс поезда: <xsl:value-of select="pigd:Railway/pigd:TrainIndex"/>
											<br/>
										</xsl:if>
										<xsl:if test="pigd:Railway/pigd:TrainNumber">
											Номер поезда:<xsl:value-of select="pigd:Railway/pigd:TrainNumber"/>
											<br/>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="pigd:ShipInfo">
								<tr>
									<td align="left" class="graphMain" colspan="2">
										<xsl:if test="pigd:ShipInfo/pigd:ShipIMO">
											ИМО номер судна: <xsl:value-of select="pigd:ShipInfo/pigd:ShipIMO"/>
											<br/>
										</xsl:if>
										<xsl:if test="pigd:ShipInfo/pigd:ShipName">
											Наименование судна: <xsl:value-of select="pigd:ShipInfo/pigd:ShipName"/>
											<br/>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="pigd:CustomsOperationPlace">
								<tr>
									<td align="left" class="graph" colspan="2">
										Место совершения таможенных операций:
										<span align="left" class="graphMain">
											<xsl:value-of select="pigd:CustomsOperationPlace"/>
										</span>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="pigd:CustomsOperationPlace">
								<tr>
									<td align="left" class="graph" colspan="2">
										Решение:
										<span align="left" class="graphMain">
											<xsl:for-each select="pigd:TSControlDecision">
												<xsl:choose>
													<xsl:when test="pigd:Decision='0'">Ввоз (вывоз) / Разгрузка (погрузка) запрещена</xsl:when>
													<xsl:when test="pigd:Decision='1'">Ввоз (вывоз) / Разгрузка (погрузка) разрешена</xsl:when>
													<xsl:when test="pigd:Decision='2'">Ввоз (вывоз) / Разгрузка (погрузка) разрешена, требуется дополнительные меры контроля</xsl:when>
													<xsl:when test="pigd:Decision='0'">Решения различны</xsl:when>
												</xsl:choose>
												<xsl:text> </xsl:text>
												<xsl:value-of select="pigd:DecisionDetails"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="pigd:Foundation"/>
											</xsl:for-each>
										</span>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td align="left" class="graph" colspan="2">
									Номера ДТ/ТД:<xsl:text> </xsl:text>
									<span align="left" class="graphMain">
										<xsl:for-each select="pigd:TDNumber">
											<xsl:call-template name="TDNumber"><xsl:with-param name="num" select="."/></xsl:call-template>
											<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
										</xsl:for-each>
									</span>
								</td>
							</tr>
							<xsl:if test="pigd:StoresControlDecision">
								<tr>
									<td align="left" class="graph" colspan="2">
										<xsl:text>Принятое решение по припасам: </xsl:text>
										<span align="left" class="graphMain">
											<xsl:for-each select="pigd:StoresControlDecision">
												<xsl:choose>
													<xsl:when test="pigd:StoreKind='1'">Эксплуатационные</xsl:when>
													<xsl:when test="pigd:StoreKind='2'">Продаваемые</xsl:when>
													<xsl:when test="pigd:StoreKind='3'">Потребительские</xsl:when>
													<xsl:otherwise><xsl:value-of select="pigd:StoreKind"/></xsl:otherwise>
												</xsl:choose>
												<xsl:if test="pigd:NameGoods">
													<xsl:text> (</xsl:text>
													<xsl:for-each select="pigd:NameGoods"><xsl:value-of select="."/></xsl:for-each>
												</xsl:if>
												<xsl:if test="pigd:SupplementaryQuantity">
													<xsl:for-each select="pigd:SupplementaryQuantity">
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:GoodsQuantity"/>
														<xsl:if test="cat_ru:MeasureUnitQualifierName">
															<xsl:text> </xsl:text>
															<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
														</xsl:if>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="pigd:NameGoods|pigd:SupplementaryQuantity"><xsl:text>)</xsl:text></xsl:if>
												<xsl:text> - </xsl:text>												
												<xsl:choose>
													<xsl:when test="pigd:Decision='0'">ввоз (вывоз) / разгрузка (погрузка) запрещена</xsl:when>
													<xsl:when test="pigd:Decision='1'">ввоз (вывоз) / разгрузка (погрузка) разрешена</xsl:when>
													<xsl:when test="pigd:Decision='2'">ввоз (вывоз) / разгрузка (погрузка) разрешена, требуется дополнительные меры контроля</xsl:when>
													<xsl:when test="pigd:Decision='3'">Решения различны (для ТС в целом)</xsl:when>
												</xsl:choose>
												<xsl:if test="position()!=last()">; </xsl:if>
											</xsl:for-each>
										</span>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<!--xsl:variable name="hasWagons">
						<xsl:value-of select="pigd:Consignments/pigd:Goods/pigd:Wagon"/>
					</xsl:variable>
					<xsl:variable name="hasContainerNumber">
						<xsl:value-of select="pigd:Consignments/pigd:Goods/pigd:ContainerNumber"/>
					</xsl:variable-->
					<table border="1" cellpadding="0" cellspacing="0" style="width:280mm;" width="100%">
						<tbody>
							<tr>
								<td class="graphMainbold" width="5%">Номер партии</td>
								<td class="graphMainbold" width="7%">Номер накладной</td>
								<!--xsl:if test="$hasWagons=true()"-->
								<td class="graphMainbold" width="5%">Вагон</td>
								<!--/xsl:if>
								<xsl:if test="$hasContainerNumber=true()"-->
								<td class="graphMainbold" width="8%">Номер контейнера</td>
								<!--/xsl:if-->
								<td class="graphMainbold" width="5%">Номер товара</td>
								<td class="graphMainbold" width="10%">Описание товара</td>
								<td class="graphMainbold" width="10%">Вес брутт/нетто</td>
								<td class="graphMainbold" width="10%">Доп. ед. изм.</td>
								<td class="graphMainbold" width="10%">Код товара ТН ВЭД ЕАЭС</td>
								<td class="graphMainbold" width="15%">Таможенный контроль</td>
								<td class="graphMainbold" width="15%">Решение</td>
							</tr>
							<xsl:for-each select="pigd:Consignments">
								<xsl:variable name="rowspan">
									<xsl:choose>
										<xsl:when test="count(pigd:Goods) &gt; 0"><xsl:value-of select="count(pigd:Goods)"/></xsl:when>
										<xsl:otherwise><xsl:value-of select="number('1')"/></xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr>
									<td width="5%" rowspan="{$rowspan}">
										<xsl:value-of select="pigd:ConsignmentNum"/>
									</td>
									<td width="7%" rowspan="{$rowspan}">
										<xsl:value-of select="pigd:BillSerialNumber"/>
									</td>
									
									<!--GOODS-->
									<xsl:choose>
										<xsl:when test="count(pigd:Goods) &gt; 0">
											<xsl:apply-templates select="pigd:Goods[position() = 1]"/>
										</xsl:when>
										<xsl:otherwise>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</xsl:otherwise>
									</xsl:choose>
									
									<td style="font-size:8pt;" rowspan="{$rowspan}">
										<xsl:choose>
											<xsl:when test="pigd:ConsignmentControlDecision/pigd:Decision='0'">Ввоз (вывоз) / Разгрузка (погрузка) запрещена</xsl:when>
											<xsl:when test="pigd:ConsignmentControlDecision/pigd:Decision='1'">Ввоз (вывоз) / Разгрузка (погрузка) разрешена</xsl:when>
											<xsl:when test="pigd:ConsignmentControlDecision/pigd:Decision='2'">Ввоз (вывоз) / Разгрузка (погрузка) разрешена, требуется дополнительные меры контроля</xsl:when>
											<xsl:when test="pigd:ConsignmentControlDecision/pigd:Decision='3'"> Решения различны (для ТС в целом)</xsl:when>
										</xsl:choose>
									</td>
								</tr>
								<xsl:for-each select="pigd:Goods[position() &gt; 1]">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</xsl:for-each>
						</tbody>
					</table>
					<table border="0" style="width:280mm">
						<tbody>
							<tr>
								<br/>
								<br/>
								<br/>
								<td class="normal2">
									<xsl:value-of select="pigd:CustomsPerson/cat_ru:PersonName"/>
								</td>
								<td class="normal2">
									<xsl:value-of select="pigd:CustomsPerson/cat_ru:LNP"/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
									(ФИО должностного лица таможенного органа)
								</td>
								<td class="graphLittle">
									(ЛНП)
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="pigd:Goods">
		<!--xsl:if test="pigd:Wagon"-->
		<td width="6.6%">
			<xsl:for-each select="pigd:Wagon">
				<xsl:value-of select="pigd:WagonNumber"/>
				<xsl:text> - </xsl:text>
				<xsl:for-each select="pigd:Decision">
					<xsl:choose>
						<xsl:when test=".='0'">Ввоз запрещен</xsl:when>
						<xsl:when test=".='1'">Ввоз разрешен</xsl:when>
						<xsl:when test=".='2'">вагон отцеплен</xsl:when>
						<xsl:otherwise><xsl:value-of select="pigd:Decision"/></xsl:otherwise>
					</xsl:choose>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</td>
		<!--/xsl:if>
		<xsl:if test="pigd:ContainerNumber"-->
		<td width="11.1%">
			<xsl:for-each select="pigd:ContainerNumber">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</td>
		<!--/xsl:if-->
		<td width="6.7%">
			<xsl:value-of select="cat_ru:GoodsNumeric"/>
		</td>
		<td width="15%">
			<xsl:value-of select="cat_ru:GoodsDescription"/>
		</td>
		<td width="10%">
			<xsl:choose>
				<xsl:when test="(cat_ru:GrossWeightQuantity) or (cat_ru:NetWeightQuantity)">
					<xsl:if test="cat_ru:GrossWeightQuantity">
						<xsl:value-of select="cat_ru:GrossWeightQuantity"/> /
					</xsl:if>
					<xsl:value-of select="cat_ru:NetWeightQuantity"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</td>
		<td width="10%">
			<xsl:value-of select="pigd:GoodsQuantity/cat_ru:GoodsQuantity"/>
			<xsl:text> </xsl:text>
			<xsl:if test="pigd:GoodsQuantity/cat_ru:MeasureUnitQualifierName">
				<xsl:value-of select="pigd:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
				<xsl:if test="pigd:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
					(<xsl:value-of select="pigd:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)
				</xsl:if>
			</xsl:if>
		</td>
		<td width="10%">
			<xsl:choose>
				<xsl:when test="cat_ru:GoodsTNVEDCode">
					<xsl:value-of select="cat_ru:GoodsTNVEDCode"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</td>
		<!--td width="15%">
			<xsl:choose>
				<xsl:when test="(pigd:CustControlForm) or (pigd:CustControlResult)">
					<xsl:value-of select="pigd:CustControlForm"/>
					<xsl:value-of select="pigd:CustControlResult"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</td-->
		<td width="20%">
			<xsl:value-of select="pigd:CustControlDecision"/>
		</td>
	</xsl:template>
</xsl:stylesheet>
