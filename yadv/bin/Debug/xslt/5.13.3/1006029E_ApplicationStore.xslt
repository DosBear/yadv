<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:apps="urn:customs.ru:Information:CustomsDocuments:ApplicationStore:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0">
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
	<!--в произвольной форме - Приказ ФТС России 1665-->
	<xsl:template match="apps:ApplicationStore">
		<html>
			<head>
				<title>Заявление на припасы</title>
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
					border: solid 1px #000000;
					}

					.no_ml
					{
					margin-left:-3px;
					}

					td {
					font-family:Courier;
					}
					.normal{
					font-weight: normal;
					font-family:Arial;
					font-size: 10pt;
					}
					table{
						border-collapse:collapse;
					}
					table.bold tr td,.bold{
					font-weight: bold;
					font-family:Arial;
					font-size: 10pt;
					}
					.italic{
					font-style: italic;
					font-family:Arial;
					font-size: 9pt
					}
					.graph {
					font-family: Arial;
					font-size: 8pt;
					}
					.graphMain {
					font-family: Arial;
					font-size: 10pt;
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
					border: 1px solid;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table border="0" style="width:190mm">
						<tbody>
							<tr>
								<td align="center" colspan="10">
									<span align="center" style="font-weight:bold;  ">
										ЗАЯВЛЕНИЕ О ПРИПАСАХ, ПЕРЕМЕЩЕННЫХ НА
										<xsl:if test="apps:TransportInfom/apps:TransportType = '1' ">
											ВОЗДУШНОМ СУДНЕ
										</xsl:if>
										<xsl:if test="apps:TransportInfom/apps:TransportType = '2' ">
											МОРСКОМ СУДНЕ
										</xsl:if>
										<xsl:if test="apps:TransportInfom/apps:TransportType = '3' ">
											ЖД ТРАНСПОРТЕ
										</xsl:if>
										<br/>
										<br/>
									</span>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphMain" colspan="10" valign="middle">
									<xsl:if test="apps:GoalAction ='1'">
										ВВОЗ
									</xsl:if>
									<xsl:if test="apps:GoalAction ='2'">
										ВЫВОЗ
									</xsl:if>
									<xsl:if test="apps:GoalAction ='3'">
										ВЫГРУЗКА
									</xsl:if>
									<xsl:if test="apps:GoalAction ='4'">
										ПЕРЕДАЧА
									</xsl:if>
								</td>
							</tr>
							<xsl:if test="apps:RegNumer">
								<tr>
									<td align="center" class="graphMain" colspan="10" valign="middle">
										РЕГИСТРАЦИОННЫЙ НОМЕР

										<xsl:value-of select="apps:RegNumer/cat_ru:CustomsCode"/>
										<xsl:text>/ </xsl:text>
										<xsl:call-template name="russian_date2">
											<xsl:with-param name="dateIn" select="apps:RegNumer/cat_ru:RegistrationDate"/>
										</xsl:call-template>
										<xsl:text>/ </xsl:text>
										<xsl:value-of select="apps:RegNumer/cat_ru:GTDNumber"/>
										<br/>
										<br/>
										<br/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<th align="right" class="normal" colspan="5">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</th>
								<td align="right" class="graph" colspan="4">
									Дата составления заявления:  <br/>
									<br/>
								</td>
								<th align="right" class="graphMain" colspan="1">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="apps:DocumentDate"/>
									</xsl:call-template>
									<br/>
									<br/>
								</th>
							</tr>
							<tr>
								<xsl:choose>
									<xsl:when test="apps:Carrier">
										<td align="left" class="normal" style="width:45mm"> Перевозчик: </td>
										<td align="left" class="bold" colspan="4">
											<xsl:value-of select="apps:Carrier/cat_ru:OrganizationName"/>
											<xsl:text>, </xsl:text>
											<xsl:value-of select="apps:Carrier/cat_ru:ShortName"/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" class="normal" colspan="1" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
										<td align="right" class="normal" colspan="4" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="apps:Declarant">
									<td align="left" class="normal" style="width:45mm"> Декларант:</td>
									<td align="left" class="bold" colspan="4" style="width:45mm">
										<xsl:value-of select="apps:Declarant/cat_ru:OrganizationName"/>
										<xsl:text>, </xsl:text>
										<xsl:value-of select="apps:Declarant/cat_ru:ShortName"/>
									</td>
								</xsl:if>
							</tr>
							<tr>
								<td align="right" class="normal" colspan="1">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<xsl:choose>
									<xsl:when test="apps:Carrier/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
										<td align="left" class="bold" colspan="4" style="width:45mm">
											ОГРН:
											<xsl:value-of select="apps:Carrier/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" class="normal" colspan="4" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</xsl:otherwise>
								</xsl:choose>
								<td align="right" class="normal" colspan="1">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="left" class="bold" colspan="4" style="width:45mm">
									<xsl:if test="apps:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
										ОГРН:
										<xsl:value-of select="apps:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<th align="right" class="normal" colspan="1">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</th>
								<xsl:choose>
									<xsl:when test="apps:Carrier/cat_ru:RFOrganizationFeatures/cat_ru:INN">
										<td align="left" class="bold" colspan="4" style="width:45mm">
											ИНН:
											<xsl:value-of select="apps:Carrier/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" class="normal" colspan="4" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</xsl:otherwise>
								</xsl:choose>
								<th align="right" class="normal" colspan="1" style="width:45mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</th>
								<th align="left" class="bold" colspan="4" style="width:45mm">
									<xsl:if test="apps:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:INN">
										ИНН:
										<xsl:value-of select="apps:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</xsl:if>
								</th>
							</tr>
							<tr>
								<th align="right" class="bold" colspan="1" style="width:45mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</th>
								<xsl:choose>
									<xsl:when test="apps:Carrier/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										<td align="left" class="bold" colspan="4" style="width:45mm">
											КПП:
											<xsl:value-of select="apps:Carrier/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
											<br/>
											<br/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" class="normal" colspan="4" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</xsl:otherwise>
								</xsl:choose>
								<th align="right" class="bold" colspan="1">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</th>
								<th align="left" class="bold" colspan="4">
									<xsl:if test="apps:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										КПП:
										<xsl:value-of select="apps:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</xsl:if>
									<br/>
									<br/>
								</th>
							</tr>
							<xsl:if test="apps:Declarant/cat_ru:Address or apps:Carrier/cat_ru:Address">
								<tr>
									<td class="normal" valign="top">
										<xsl:if test="apps:Carrier/cat_ru:Address">
											Адрес:
										</xsl:if>
									</td>
									<th colspan="4" class="bold" align="left">
										<xsl:apply-templates select="apps:Carrier/cat_ru:Address" />
									</th>
									<td class="normal" valign="top">
										<xsl:if test="apps:Declarant/cat_ru:Address">
											Адрес:
										</xsl:if>
									</td>
									<th colspan="4" class="bold" align="left">
										<xsl:apply-templates select="apps:Declarant/cat_ru:Address" />
									</th>
								</tr>
							</xsl:if>
							<xsl:if test="apps:Declarant/cat_ru:IdentityCard or apps:Carrier/cat_ru:IdentityCard ">
								<tr>
									<td class="normal" valign="top">
										<xsl:if test="apps:Carrier/cat_ru:IdentityCard">
											Документ, удостоверяющий личность:
										</xsl:if>
									</td>
									<th colspan="4" class="bold" align="left">
										<xsl:apply-templates select="apps:Carrier/cat_ru:IdentityCard" />
									</th>
									<td class="normal" valign="top">
										<xsl:if test="apps:Declarant/cat_ru:IdentityCard">
											Документ, удостоверяющий личность:
										</xsl:if>
									</td>
									<th colspan="4" class="bold" align="left">
										<xsl:apply-templates select="apps:Declarant/cat_ru:IdentityCard" />
									</th>
								</tr>
							</xsl:if>
							<xsl:if test="apps:Declarant/cat_ru:Contact or apps:Carrier/cat_ru:Contact">
								<tr>
									<td class="normal" valign="top">
										<xsl:if test="apps:Carrier/cat_ru:Contact">
											Контактная информация:
										</xsl:if>
									</td>
									<th colspan="4" class="bold" align="left">
										<xsl:apply-templates select="apps:Carrier/cat_ru:Contact" />
									</th>
									<td class="normal" valign="top">
										<xsl:if test="apps:Declarant/cat_ru:Contact">
											Контактная информация:
										</xsl:if>
									</td>
									<th colspan="4" class="bold" align="left">
										<xsl:apply-templates select="apps:Declarant/cat_ru:Contact" />
									</th>
								</tr>
							</xsl:if>
							<xsl:if test="apps:Carrier/apps:AirlineIATACode">
								<tr>
									<td class="normal" valign="top">
										Код ИАТА:
									</td>
									<th colspan="4" class="bold" align="left">
										<xsl:apply-templates select="apps:Carrier/apps:AirlineIATACode" />
									</th>
								</tr>
							</xsl:if>
							<xsl:apply-templates select="apps:Carrier/apps:CarrierRepresentative"/>
							<tr>
								<xsl:choose>
									<xsl:when test="apps:ConsigneeInfo">
										<td align="left" class="normal" style="width:45mm"> Лицо, которому передаются припасы: </td>
										<td align="left" class="bold" colspan="4">
											<xsl:value-of select="apps:ConsigneeInfo/cat_ru:OrganizationName"/>
											<xsl:text> Сервисная компания "SkyService" </xsl:text>
											<xsl:value-of select="apps:ConsigneeInfo/cat_ru:ShortName"/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" class="normal" colspan="1" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
										<td align="right" class="normal" colspan="4" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<tr>
								<td align="right" class="normal" colspan="1">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<xsl:choose>
									<xsl:when test="apps:ConsigneeInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
										<td align="left" class="bold" colspan="4" style="width:45mm">
											ОГРН:
											<xsl:value-of select="apps:ConsigneeInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" class="normal" colspan="4" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<tr>
								<th align="right" class="normal" colspan="1">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</th>
								<xsl:choose>
									<xsl:when test="apps:ConsigneeInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN">
										<td align="left" class="bold" colspan="4" style="width:45mm">
											ИНН:
											<xsl:value-of select="apps:ConsigneeInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" class="normal" colspan="4" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<tr>
								<th align="right" class="bold" colspan="1" style="width:45mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</th>
								<xsl:choose>
									<xsl:when test="apps:ConsigneeInfo/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										<td align="left" class="bold" colspan="4" style="width:45mm">
											КПП:
											<xsl:value-of select="apps:ConsigneeInfo/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
											<br/>
											<br/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" class="normal" colspan="4" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<tr>
								<xsl:choose>
									<xsl:when test="apps:MoveDirection">
										<th align="left" class="normal" colspan="1">Направление перемещения</th>
										<td align="left" class="bold" colspan="4">
											<xsl:value-of select="apps:MoveDirection"/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" class="normal" colspan="1" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
										<td align="right" class="normal" colspan="4" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="apps:CustomsModeCode">
										<th align="left" class="normal">Код таможенного режима</th>
										<td align="left" class="bold" colspan="4">
											<xsl:value-of select="apps:CustomsModeCode"/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" class="normal" colspan="1" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
										<td align="right" class="normal" colspan="4" style="width:45mm">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<tr>
								<td align="left" class="normal" colspan="1">
									<span style="width:45mm"> Название морского судна/бортовой номер воздушного судна/номер поезда: </span>
								</td>
								<th align="left" class="bold" colspan="4">
									<xsl:if test="apps:TransportInfom">
										<xsl:value-of select="apps:TransportInfom/apps:TransportName"/>
									</xsl:if>
								</th>
								<th align="left" class="normal" colspan="1">
									<span style="width:45mm"> Страна  регистрации  транспортного средства:</span>
								</th>
								<td align="left" class="bold" colspan="4">
									<xsl:if test="apps:TransportInfom">
										<xsl:value-of select="apps:TransportInfom/apps:CountryRegTrans"/>
										<xsl:text>/ </xsl:text>
										<xsl:value-of select="apps:TransportInfom/apps:CodeCountryRegTrans"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<xsl:choose>
									<xsl:when test="apps:TransportInfom/apps:FlightNumber">
										<th align="left" class="normal" colspan="1">
											Номер рейса:
											<td align="left" class="bold" colspan="4">
												<xsl:value-of select="apps:TransportInfom/apps:FlightNumber"/>
											</td>
										</th>
									</xsl:when>
									<xsl:otherwise>
										<th colspan="5"></th>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="apps:TransportInfom/apps:Place/apps:AirportIATACode">
									<th align="left" class="normal" colspan="1" style="width:45mm">Код ИАТА аэропорта назначения: </th>
									<td align="left" class="bold" colspan="4">
										<xsl:value-of select="apps:TransportInfom/apps:Place/apps:AirportIATACode"/>
									</td>
								</xsl:if>
							</tr>
							<tr>
								<th align="left" class="normal" colspan="1" style="width:45mm">Наименование порта/аэропорта/станции: </th>
								<td align="left" class="bold" colspan="4">
									<xsl:if test="apps:TransportInfom/apps:Place">
										<xsl:value-of select="apps:TransportInfom/apps:Place/apps:PlaceName"/>
									</xsl:if>
								</td>
								<th align="left" class="normal" colspan="1">Страна назначения: </th>
								<td align="left" class="bold" colspan="4">
									<xsl:if test="apps:TransportInfom/apps:Place">
										<xsl:value-of select="apps:TransportInfom/apps:Place/apps:CountryName"/>
										<xsl:if test="apps:TransportInfom/apps:Place/apps:CountryCode">
											<xsl:text>/ </xsl:text>
											<xsl:value-of select="apps:TransportInfom/apps:Place/apps:CountryCode"/>
										</xsl:if>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<xsl:if test="apps:StoreInform/apps:DateMove">
									<th align="left" class="normal" colspan="1" style="width:45mm">Время/дата перемещения припасов: </th>
									<td align="left" class="bold" colspan="2">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="apps:StoreInform/apps:DateMove"/>
										</xsl:call-template>
									</td>
									
								</xsl:if>
								<xsl:choose>
									<xsl:when test="apps:StoreInform/apps:DateMove">
										<xsl:if test="apps:StoreInform/apps:TimeMove">
											<td align="left" class="bold" colspan="2">
												<xsl:text>/</xsl:text>
												<xsl:value-of select="apps:StoreInform/apps:TimeMove"/>
											</td>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:if test="apps:StoreInform/apps:TimeMove">
											<th align="left" class="normal" colspan="1" style="width:45mm">Время/дата перемещения припасов: </th>
											<td align="left" class="bold" colspan="4">
												<xsl:value-of select="apps:StoreInform/apps:TimeMove"/>
											</td>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<tr>
								<xsl:if test="apps:StoreInform">
									<th align="left" class="normal" colspan="1"> Место перемещения: </th>
									<td align="left" class="bold" colspan="4">
										<xsl:value-of select="apps:StoreInform/apps:PlaceMove"/>
									</td>
								</xsl:if>
							</tr>
							<tr>
								<xsl:if test="apps:StoreInform">
									<th align="left" class="normal" colspan="1"> Предполагаемые действия с припасами: </th>
									<td align="left" class="bold" colspan="4">
										<xsl:value-of select="apps:StoreInform/apps:StoreActions"/>
									</td>
								</xsl:if>
							</tr>
							<tr>
								<xsl:if test="apps:GTDID">
									<th align="left" class="normal" colspan="1"> Регистрационный номер таможенной декларации: </th>
									<td align="left" class="bold" colspan="4">
										<xsl:value-of select="apps:GTDID/cat_ru:CustomsCode"/>
										<xsl:text>/ </xsl:text>
										<xsl:call-template name="russian_date2">
											<xsl:with-param name="dateIn" select="apps:GTDID/cat_ru:RegistrationDate"/>
										</xsl:call-template>
										<xsl:text>/ </xsl:text>
										<xsl:value-of select="apps:GTDID/cat_ru:GTDNumber"/>
									</td>
								</xsl:if>
							</tr>
							<tr>
								<xsl:if test="apps:PresentedDoc">
									<th align="left" class="normal" colspan="1">Дополнительные документы:</th>
									<xsl:for-each select="apps:PresentedDoc[position()=1]">
										<xsl:if test="cat_ru:PrDocumentName">
											<th align="left" class="bold" colspan="2">
												<xsl:value-of select="cat_ru:PrDocumentName"/>
											</th>
										</xsl:if>
										<xsl:choose>
											<xsl:when test="cat_ru:PrDocumentName">
												<xsl:if test="cat_ru:PrDocumentNumber">
													<td align="left" class="bold" colspan="2">
														<xsl:value-of select="cat_ru:PrDocumentNumber"/>
													</td>
												</xsl:if>
												<xsl:if test="cat_ru:PrDocumentDate">
													<td align="left" class="bold" colspan="1">
														<xsl:text> </xsl:text>
														<span align="left" class="normal" colspan="3" style="width:45mm">дата документа</span>
														<td align="left" class="bold" colspan="1">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</td>
													</td>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="cat_ru:PrDocumentNumber">
													<td align="left" class="bold" colspan="2">
														<xsl:value-of select="cat_ru:PrDocumentNumber"/>
													</td>
												</xsl:if>
												<xsl:if test="cat_ru:PrDocumentDate">
													<td>
														<span align="left" class="normal" colspan="3" style="width:45mm">дата документа</span>
													</td>
													<td align="left" class="bold" colspan="2">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</td>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</xsl:if>
							</tr>
							<xsl:for-each select="apps:PresentedDoc[position()>1]">
								<tr>
									<th align="left" class="normal" colspan="1">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</th>
									<xsl:if test="cat_ru:PrDocumentName">
										<th align="left" class="bold" colspan="2">
											<xsl:value-of select="cat_ru:PrDocumentName"/>
										</th>
									</xsl:if>
									<xsl:choose>
										<xsl:when test="cat_ru:PrDocumentName">
											<xsl:if test="cat_ru:PrDocumentNumber">
												<td align="left" class="bold" colspan="2">
													<xsl:value-of select="cat_ru:PrDocumentNumber"/>
												</td>
											</xsl:if>
											<xsl:if test="cat_ru:PrDocumentDate">
												<td align="left" class="bold" colspan="1">
													<xsl:text> </xsl:text>
													<span align="left" class="normal" colspan="3" style="width:45mm">дата документа</span>
													<td align="left" class="bold" colspan="1">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</td>
												</td>
											</xsl:if>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="cat_ru:PrDocumentNumber">
												<td align="left" class="bold" colspan="2">
													<xsl:value-of select="cat_ru:PrDocumentNumber"/>
												</td>
											</xsl:if>
											<xsl:if test="cat_ru:PrDocumentDate">
												<td>
													<span align="left" class="normal" colspan="3" style="width:45mm">дата документа</span>
												</td>
												<td align="left" class="bold" colspan="2">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
													</xsl:call-template>
												</td>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<h4>ПЕРЕЧЕНЬ ТОВАРОВ </h4>
					<xsl:if test="apps:EthnicityFlag= '1'">
						<p align="right" class="Arial">
							Национальная принадлежность припасов:<span align="right" class="bold"> российское</span>
						</p>
					</xsl:if>
					<xsl:if test="apps:EthnicityFlag= '0'">
						<p align="right" class="Arial">
							Национальная принадлежность припасов:<span align="right" class="bold">иностранное</span>
						</p>
					</xsl:if>
					<xsl:if test="apps:StoreInform/apps:Consumer">
						<font size="3">
							<p align="left" class="bold">
								Потребительские припасы
							</p>
						</font>
						<!--<p align="left" class="normal">
									Общее количество: <xsl:value-of select="sum(apps:StoreInform/apps:Consumer/apps:NumberGoods)"/>
							</p>-->
						<table border="1" style="width:190mm">
							<tbody>
								<!--ПОТРЕБИТЕЛЬСКИЕ ПРИПАСЫ -->
								<tr>
									<th class="bold" colspan="2" lign="left">Наименование </th>
									<th class="bold" colspan="1" lign="left">ТН ВЭД ЕАЭС </th>
									<th class="bold" colspan="1" lign="left">Количество </th>
									<th class="bold" colspan="2" lign="left">
										Ед. измерения <br/>(код)
									</th>
									<th class="bold" colspan="1" lign="left">Количество в доп. ед. измерения </th>
									<th class="bold" colspan="1" lign="left">Количество в ед. измерения, отличной от осн. и доп.</th>
									<th class="bold" colspan="1" lign="left">
										Стоимость <br/> за ед.
									</th>
									<th class="bold" colspan="1" lign="left">Валюта</th>
									<th class="bold" colspan="1" lign="left">
										Стоимость<br/> товара
									</th>
									<th class="bold" colspan="1" lign="left">
										Таможенная <br/> стоимость
									</th>
									<th class="bold" colspan="1" lign="left">
										Доп.<br/> сведения
									</th>
								</tr>
								<xsl:for-each select="apps:StoreInform/apps:Consumer">
									<tr>
										<td align="center" class="normal" colspan="2">
											<xsl:value-of select="apps:NameGoods"/>
										</td>
										<xsl:choose>
											<xsl:when test="apps:GoodsNomenclatureCode">
												<td align="center" class="normal" colspan="1">
													<xsl:value-of select="apps:GoodsNomenclatureCode"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td colspan="1">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td align="center" class="normal" colspan="1">
											<xsl:value-of select="apps:NumberGoods"/>
										</td>
										<td align="center" class="normal" colspan="2">
											<xsl:value-of select="apps:UnitName"/>
											<xsl:if test="apps:UnitCode">
												(<xsl:value-of select="apps:UnitCode"/>)
											</xsl:if>
										</td>
										<td align="center" class="normal" colspan="1">
											<xsl:value-of select="apps:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
											<xsl:if test="apps:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName">
												<xsl:value-of select="concat('(',apps:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName, ')')"/>
											</xsl:if>
										</td>
										<td align="center" class="normal" colspan="1">
											<xsl:for-each select="apps:SupplementaryQuantity1">
												<xsl:if test="position()!=1">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="cat_ru:GoodsQuantity"/>
												<xsl:if test="cat_ru:MeasureUnitQualifierName">
													<xsl:value-of select="concat('(',cat_ru:MeasureUnitQualifierName, ')')"/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<xsl:choose>
											<xsl:when test="apps:PriceUnit">
												<td align="center" class="normal" colspan="1">
													<xsl:value-of select="apps:PriceUnit"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td colspan="1">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="apps:Currency">
												<td align="center" class="normal" colspan="1">
													<xsl:value-of select="apps:Currency"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td colspan="1">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="apps:TotalCostGoods">
												<td align="center" class="normal" colspan="1">
													<xsl:value-of select="apps:TotalCostGoods"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td colspan="1">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="apps:CustomsCostGoods">
												<td align="center" class="normal" colspan="1">
													<xsl:value-of select="apps:CustomsCostGoods"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td colspan="1">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td align="center" class="normal" colspan="1">
											<xsl:apply-templates select="apps:WayBill"/>
											<br/>
											<xsl:value-of select="apps:AdditionalInfo"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="apps:StoreInform/apps:Operating">
						<font size="3">
							<p align="left" class="bold">
								Эксплуатационные припасы
							</p>
						</font>
						<!--<p align="left" class="normal">
									Общее количество: <xsl:value-of select="sum(apps:StoreInform/apps:Operating/apps:NumberGoods)"/>
							</p>-->
						<table border="1" style="width:190mm">
							<tbody>
								<!--ЭКСПЛУАТАЦИОННЫЕ ПРИПАСЫ -->
								<tr>
									<th class="bold" colspan="2" lign="left">Наименование </th>
									<th class="bold" colspan="1" lign="left">ТН ВЭД ЕАЭС </th>
									<th class="bold" colspan="1" lign="left">Количество </th>
									<th class="bold" colspan="2" lign="left">
										Ед. измерения <br/>(код)
									</th>
									<th class="bold" colspan="1" lign="left">Количество в доп. ед. измерения </th>
									<th class="bold" colspan="1" lign="left">Количество в ед. измерения, отличной от осн. и доп.</th>
									<th class="bold" colspan="1" lign="left">
										Стоимость <br/> за ед.
									</th>
									<th class="bold" colspan="1" lign="left">Валюта</th>
									<th class="bold" colspan="1" lign="left">
										Стоимость<br/> товара
									</th>
									<th class="bold" colspan="1" lign="left">
										Таможенная <br/> стоимость
									</th>
									<th class="bold" colspan="1" lign="left">
										Доп.<br/> сведения
									</th>
									
								</tr>
								<xsl:for-each select="apps:StoreInform/apps:Operating">
									<tr>
										<td align="center" class="normal" colspan="2">
											<xsl:value-of select="apps:NameGoods"/>
										</td>
										<xsl:choose>
											<xsl:when test="apps:GoodsNomenclatureCode">
												<td align="center" class="normal" colspan="1">
													<xsl:value-of select="apps:GoodsNomenclatureCode"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td colspan="1">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td align="center" class="normal" colspan="1">
											<xsl:value-of select="apps:NumberGoods"/>
										</td>
										<td align="center" class="normal" colspan="2">
											<xsl:value-of select="apps:UnitName"/>
											<xsl:if test="apps:UnitCode">
												(<xsl:value-of select="apps:UnitCode"/>)
											</xsl:if>
										</td>

										<td align="center" class="normal" colspan="1">
											<xsl:value-of select="apps:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
											<xsl:if test="apps:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName">
												<xsl:value-of select="concat('(',apps:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName, ')')"/>
											</xsl:if>
										</td>
										<td align="center" class="normal" colspan="1">
											<xsl:for-each select="apps:SupplementaryQuantity1">
												<xsl:if test="position()!=1">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="cat_ru:GoodsQuantity"/>
												<xsl:if test="cat_ru:MeasureUnitQualifierName">
													<xsl:value-of select="concat('(',cat_ru:MeasureUnitQualifierName, ')')"/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<xsl:choose>
											<xsl:when test="apps:PriceUnit">
												<td align="center" class="normal" colspan="1">
													<xsl:value-of select="apps:PriceUnit"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td colspan="1">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="apps:Currency">
												<td align="center" class="normal" colspan="1">
													<xsl:value-of select="apps:Currency"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td colspan="1">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="apps:TotalCostGoods">
												<td align="center" class="normal" colspan="1">
													<xsl:value-of select="apps:TotalCostGoods"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td colspan="1">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="apps:CustomsCostGoods">
												<td align="center" class="normal" colspan="1">
													<xsl:value-of select="apps:CustomsCostGoods"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td colspan="1">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td align="center" class="normal" colspan="1">
											<xsl:apply-templates select="apps:WayBill"/>
											<br/>
											<xsl:value-of select="apps:AdditionalInfo"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="apps:StoreInform/apps:Sold">
						<font size="3">
							<p align="left" class="bold">
								Продаваемые припасы
							</p>
						</font>
						<!--<p align="left" class="normal">
									Общее количество: <xsl:value-of select="sum(apps:StoreInform/apps:Sold/apps:SoldGoodsList/apps:NumberGoods)"/>
							</p>-->
						<table border="1" style="width:190mm">
							<tbody>
								<!--ПРОДАВАЕМЫЕ ПРИПАСЫ -->
								<tr>
									<th class="bold" colspan="2" lign="left">Наименование </th>
									<th class="bold" colspan="1" lign="left">ТН ВЭД ЕАЭС </th>
									<th class="bold" colspan="1" lign="left">Количество </th>
									<th class="bold" colspan="2" lign="left">
										Ед. измерения <br/>(код)
									</th>
									<th class="bold" colspan="1" lign="left">Количество в доп. ед. измерения </th>
									<th class="bold" colspan="1" lign="left">Количество в ед. измерения, отличной от осн. и доп.</th>
									<th class="bold" colspan="1" lign="left">
										Стоимоть <br/> за ед.
									</th>
									<th class="bold" colspan="1" lign="left">Валюта</th>
									<th class="bold" colspan="1" lign="left">
										Стоимость<br/> товара
									</th>
									<th class="bold" colspan="1" lign="left">
										Таможенная <br/> стоимость
									</th>
									<th class="bold" colspan="1" lign="left">
										Доп.<br/> сведения
									</th>
								</tr>
								<xsl:for-each select="apps:StoreInform/apps:Sold/apps:SoldGoodsList">
									<tr>
										<td align="center" class="normal" colspan="2">
											<xsl:value-of select="apps:NameGoods"/>
										</td>
										<xsl:choose>
											<xsl:when test="apps:GoodsNomenclatureCode">
												<td align="center" class="normal" colspan="1">
													<xsl:value-of select="apps:GoodsNomenclatureCode"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td colspan="1">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td align="center" class="normal" colspan="1">
											<xsl:value-of select="apps:NumberGoods"/>
										</td>
										<td align="center" class="normal" colspan="2">
											<xsl:value-of select="apps:UnitName"/>
											<xsl:if test="apps:UnitCode">
												(<xsl:value-of select="apps:UnitCode"/>)
											</xsl:if>
										</td>
										<td align="center" class="normal" colspan="1">
											<xsl:value-of select="apps:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
											<xsl:if test="apps:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName">
												<xsl:value-of select="concat('(',apps:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName, ')')"/>
											</xsl:if>
										</td>
										<td align="center" class="normal" colspan="1">
											<xsl:for-each select="apps:SupplementaryQuantity1">
												<xsl:if test="position()!=1">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="cat_ru:GoodsQuantity"/>
												<xsl:if test="cat_ru:MeasureUnitQualifierName">
													<xsl:value-of select="concat('(',cat_ru:MeasureUnitQualifierName, ')')"/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<td align="center" class="normal" colspan="1">
											<xsl:value-of select="apps:PriceUnit"/>
										</td>
										<td align="center" class="normal" colspan="1">
											<xsl:value-of select="apps:Currency"/>
										</td>
										<td align="center" class="normal" colspan="1">
											<xsl:value-of select="apps:TotalCostGoods"/>
										</td>
										<td align="center" class="normal" colspan="1">
											<xsl:value-of select="apps:CustomsCostGoods"/>
										</td>
										<td align="center" class="normal" colspan="1">
											<xsl:apply-templates select="apps:WayBill"/>
											<br/>
											<xsl:value-of select="apps:AdditionalInfo"/>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<th align="right" class="normal" colspan="10">
										Итоговые суммы
										<xsl:if test="apps:StoreInform/apps:Sold">
											в
											<xsl:value-of select="apps:StoreInform/apps:Sold/apps:Currency"/>
										</xsl:if>
									</th>
									<td align="center" class="bold" colspan="1">
										<xsl:value-of select="apps:StoreInform/apps:Sold/apps:TotalCost"/>
									</td>
									<td align="center" class="bold" colspan="1">
										<xsl:value-of select="apps:StoreInform/apps:Sold/apps:CustomsTotalCostGoods"/>
									</td>
									<td class="normal" align="center">
										<xsl:apply-templates select="apps:StoreInform/apps:Sold/apps:WayBill"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="apps:Comments">
						<p align="left" class="normal">
							Примечание:	<xsl:for-each select="apps:Comments">
								<xsl:value-of select="apps:OtherInform"/>
								<xsl:text> </xsl:text>
							</xsl:for-each>
						</p>
					</xsl:if>
					<xsl:if test="apps:GoalAction ='3.'">
						<p align="center" class="bold">
							<u>Обязуюсь выгруженные припасы поместить зону таможенного контроля</u>
						</p>
					</xsl:if>
					<table border="0" style="width:190mm">
						<tbody>
							<tr>
								<td align="right" class="normal" colspan="5">
									Подпись лица составившего заявление
								</td>
								<td align="center" class="normal" colspan="2">
									<xsl:value-of select="apps:Person/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="apps:Person/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="apps:Person/cat_ru:PersonMiddleName"/>
								</td>
								<td colspan="1">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<xsl:if test="apps:Person/cat_ru:PersonPost">
								<tr>
									<th align="right" class="normal" colspan="5">
										должность:
									</th>
									<td align="center" class="normal" colspan="2">
										<xsl:value-of select="apps:Person/cat_ru:PersonPost"/>
									</td>
									<td colspan="1">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="cat_ru:IdentityCard">
		<xsl:value-of select="cat_ru:IdentityCardName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:IdentityCardSeries"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:IdentityCardNumber"/>
		<xsl:text>, выдан </xsl:text>
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:text> </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="cat_ru:Address">
		<xsl:value-of select="cat_ru:PostalCode"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:CounryName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:Region"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:City"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:StreetHouse"/>
	</xsl:template>

	<xsl:template match="cat_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>Телефон: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<br/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>, </xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			Факс:
			<xsl:value-of select="cat_ru:Fax"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			Телекс:
			<xsl:value-of select="cat_ru:Telex"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text>E-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<br/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>, </xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<xsl:template match="apps:CarrierRepresentative">
		<tr>
			<td align="left" class="normal" valign="top" style="width:45mm"> Представитель авиакомпании: </td>
			<td align="left" class="bold" colspan="4">
				<xsl:if test="cat_ru:OrganizationName">
					<xsl:value-of select="cat_ru:OrganizationName"/>
					<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName">
						<xsl:text>, </xsl:text>
					</xsl:if>
					<xsl:value-of select="cat_ru:ShortName"/>
					<br/>
					<br/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures">
					<table class="bold no_ml">
						<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
							<tr>
								<td>ОГРН:</td>
								<td>
									<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
							<tr>
								<td>ИНН:</td>
								<td>
									<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
							<tr>
								<td>КПП:</td>
								<td>
									<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
								</td>
							</tr>
						</xsl:if>
					</table>
					<br/>
				</xsl:if>
				<xsl:if test="cat_ru:Address">
					<u>Адрес:</u>
					<br/>
					<xsl:apply-templates select="cat_ru:Address"/>
					<br/>
					<br/>
				</xsl:if>
				<xsl:if test="cat_ru:IdentityCard">
					<u>Документ, удостоверяющий личность:</u>
					<br/>
					<xsl:apply-templates select="cat_ru:IdentityCard"/>
					<br/>
					<br/>
				</xsl:if>
				<xsl:if test="cat_ru:Contact">
					<u>Контактная информация:</u>
					<br/>
					<xsl:apply-templates select="cat_ru:Contact"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="apps:WayBill">
		<xsl:text>№ </xsl:text>
		<xsl:value-of select="catTrans_ru:DocumentNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="apps:Date"/>
		</xsl:call-template>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="apps:Place"/>
		<xsl:text>)</xsl:text>
	</xsl:template>

</xsl:stylesheet>
