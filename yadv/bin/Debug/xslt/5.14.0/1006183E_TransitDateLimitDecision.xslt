<?xml version="1.0" encoding="UTF-8"?>
<!--
Решение коллегии ЕЭК от 13.12.2017 г. N 170 О НЕКОТОРЫХ ВОПРОСАХ ПРИМЕНЕНИЯ ТАМОЖЕННОЙ ПРОЦЕДУРЫ ТАМОЖЕННОГО ТРАНЗИТА
Письмо ГУИТ от 08.02.2018 № 09-128/06999
-->
<xsl:stylesheet version="1.0" xmlns:tdld="urn:customs.ru:Information:CustomsDocuments:TransitDateLimitDecision:5.14.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="tdld:TransitDateLimitDecision">
		<html>
			<head>
				<style>
			body {
			background: #cccccc;
			}

			div
			{
			white-space: nowrap;
			}

			div.page {
			width: 190mm;
			max-width: 190mm;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
			}

			.marg-top
			{
			margin-top:5mm;
			}

			table
			{
			table-layout: fixed;
			width: 100%;
			border: 0;
			empty-cells: show;
			border-collapse: collapse;
			margin-top: 1px;
			}

			table.border tr td
			{
			border: 1px solid windowtext;
			}

			.graph {
			font-family: Arial;
			font-size: 10pt;
			}

			.value
			{
			border-bottom: solid 1px black;
			}

			div.title, tr.title td { font-weight:bold;  }
			.bordered { border-collapse: collapse; }
			td.bordered
			{
				border: solid 1px windowtext;
			}

			.border_bottom
			{
			border-bottom: 1px solid black;
			}

			.graphMain
			{
			font-family: Arial;
			font-size: 11pt;
			}

			.graphLittle 
			{
			font-family: Arial;
			font-size: 7pt;
			}
	
			.graphDelim 
			{
			font-family: Arial;
			font-size: 4pt;
			}

			td.graphMain
			{
			vertical-align:top;
			}
			td.value.graphMain
			{
			vertical-align:top;
			}

			.graphHeader
			{
			font-family: Arial;
			font-size: 12pt;
			font-weight:bold;
			}

			td.graphHeader
			{
			vertical-align:top;
			}
			td.value.graphHeader
			{
			vertical-align:bottom;
			}

			.normal
			{
			font-size: 11pt;
			font-family:Arial;
			}			

			.bold
			{
			font-weight: bold;
			font-family:Arial;
			font-size: 9pt;
			}			

			.italic
			{
			font-style: italic;
			font-family:Arial;
			font-size: 11pt;
			}		
			
			.delim {
				height: 7pt;
			}

			.delim_3 {
				height: 3pt;
			}

		</style>
				<title>Решение о продлении установленного срока таможенного транзита</title>
				<meta CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="tdld:DocKind=1">
						<body>
							<div class="page">
								<table>
									<tbody class="graphMain">
										<tr align="center">
											<td class="graphHeader">Решение о продлении установленного срока таможенного транзита<br/>
												<br/>
												<br/>
											</td>
										</tr>
										<xsl:if test="tdld:DocumentDate">
											<table class="normal" width="100%">
												<tbody>
													<tr>
														<td align="left" width="40%">
															<br/>
														</td>
														<td width="35%" align="left">Дата создания документа:</td>
														<td width="25%" align="center" class="border_bottom">
															<xsl:call-template name="date_time">
																<xsl:with-param name="dateTimeIn" select="tdld:DocumentDate"/>
																<xsl:with-param name="part" select="'1'"/>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td colspan="3" class="delim"><br/></td>
													</tr>
													<tr>
														<td align="left" width="40%">
															<br/>
														</td>
														<td width="35%" align="left">Время создания документа:</td>
														<td width="25%" align="center" class="border_bottom">
															<xsl:call-template name="date_time">
																<xsl:with-param name="dateTimeIn" select="tdld:DocumentDate"/>
																<xsl:with-param name="part" select="'2'"/>
															</xsl:call-template>
														</td>
													</tr>
												</tbody>
											</table>
										</xsl:if>
										<br/>
										<br/>
										<table class="normal" width="100%">
											<tbody>
												<tr>
													<td class="value">
														<xsl:apply-templates select="tdld:Carrier"/>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphLittle">
														(наименование перевозчика)
													</td>
												</tr>
												<tr>
													<td class="delim"><br/></td>
												</tr>
												<tr>
													<td class="value">
														<xsl:if test="tdld:TransportDoc/tdld:TD">Транзитная декларация: <xsl:apply-templates select="tdld:TransportDoc/tdld:TD"/>
															<xsl:if test="tdld:TransportDoc/tdld:MDPNumber or tdld:TransportDoc/tdld:CarnetNumber">
																<span class="normal">
																	<br/>
																</span>
															</xsl:if>
														</xsl:if>
														<xsl:if test="tdld:TransportDoc/tdld:MDPNumber"> Книжка МДП: <xsl:value-of select="tdld:TransportDoc/tdld:MDPNumber/tdld:TIRSeries"/>
															<xsl:text> </xsl:text>
															<xsl:value-of select="tdld:TransportDoc/tdld:MDPNumber/tdld:TIRID"/>
															<xsl:if test="tdld:MDPNumber/tdld:RegistrationDate"> от <xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="tdld:TransportDoc/tdld:MDPNumber/tdld:RegistrationDate"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:if>
														<xsl:if test="tdld:TransportDoc/tdld:CarnetNumber">Карнет АТА:<xsl:value-of select="tdld:TransportDoc/tdld:CarnetNumber"/>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphLittle">(номер транзитной декарации/книжки МДП/карнета АТА)</td>
												</tr>
												<tr>
													<td class="delim"><br/></td>
												</tr>
											</tbody>
										</table>
										<table class="normal" width="100%">
											<tbody>
												<tr>
													<td align="left" valign="bottom" width="20%" class="normal">по Обращению</td>
													<td class="value" width="3%"/>
													<td align="center" valign="bottom" class="value" width="2%"> </td>
													<td align="left" valign="bottom" class="value" width="75%">
														<xsl:apply-templates select="tdld:RegistrationNumber"/>
													</td>
												</tr>
												<tr>
													<td align="left" class="graphLittle" colspan="2"></td>
													<td align="center" colspan="2" class="graphLittle">(номер Обращения о продлении срока таможенного транзита)</td>
												</tr>
											</tbody>
										</table>
										<table class="normal" width="100%">
											<tbody>
												<tr>
													<xsl:if test="tdld:Reason">
														<tr>
															<td class="normal">в связи с:</td>
														</tr>
														<tr><td class="delim"><br/></td></tr>
														<tr>
															<td class="value">
																<xsl:for-each select="tdld:Reason">
																	<!--xsl:apply-templates/-->
																	<xsl:value-of select="."/>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:for-each>
															</td>
														</tr>
														<tr>
															<td align="center" class="graphLittle">
								(обстоятельства, обусловившие необходимость продления срока таможенного транзита)</td>
														</tr>
													</xsl:if>
												</tr>
											</tbody>
										</table>
										<br/>
										<table class="normal" width="100%">
											<tbody>
												<tr>
													<td align="left" valign="bottom" class="normal">Срок таможенного транзита продлен до:</td>
													<td align="center" valign="bottom" class="value">
														<xsl:call-template name="date_time">
															<xsl:with-param name="dateTimeIn" select="tdld:FactProlongDate"/>
															<xsl:with-param name="part" select="'1'"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr/>
											</tbody>
										</table>
									</tbody>
								</table>
								<br/>
								<br/>
								<xsl:apply-templates select="tdld:DecisionDetails/tdld:CustomsPerson"/>
								<br/>
							</div>
						</body>
					</xsl:when>
					<xsl:when test="tdld:DocKind=2">
						<body>
							<div class="page">
								<table>
									<tbody class="graphMain">
										<tr align="center">
											<td class="graphHeader">Отказ в продлении срока таможенного транзита<br/>
												<br/>
												<br/>
											</td>
										</tr>
										<xsl:if test="tdld:DocumentDate">
											<table class="normal" width="100%">
												<tbody>
													<tr>
														<td align="left" width="40%">
															<br/>
														</td>
														<td width="35%" align="left">Дата создания документа:</td>
														<td width="25%" align="center" class="border_bottom">
															<xsl:call-template name="date_time">
																<xsl:with-param name="dateTimeIn" select="tdld:DocumentDate"/>
																<xsl:with-param name="part" select="'1'"/>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td colspan="3" class="delim"><br/></td>
													</tr>
													<tr>
														<td align="left" width="40%">
															<br/>
														</td>
														<td width="35%" align="left">Время создания документа:</td>
														<td width="25%" align="center" class="border_bottom">
															<xsl:call-template name="date_time">
																<xsl:with-param name="dateTimeIn" select="tdld:DocumentDate"/>
																<xsl:with-param name="part" select="'2'"/>
															</xsl:call-template>
														</td>
													</tr>
												</tbody>
											</table>
										</xsl:if>
										<br/>
										<br/>
										<table class="normal" width="100%">
											<tbody>
												<tr>
													<td class="value">
														<xsl:apply-templates select="tdld:Carrier"/>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphLittle">(наименование перевозчика)</td>
												</tr>
												<tr>
													<td class="delim"><br/></td>
												</tr>
												<tr>
													<td class="value">
														<xsl:if test="tdld:TransportDoc/tdld:TD">Транзитная декларация: <xsl:apply-templates select="tdld:TransportDoc/tdld:TD"/>
															<xsl:if test="tdld:TransportDoc/tdld:MDPNumber or tdld:TransportDoc/tdld:CarnetNumber">
																<span class="normal">
																	<br/>
																</span>
															</xsl:if>
														</xsl:if>
														<xsl:if test="tdld:TransportDoc/tdld:MDPNumber"> Книжка МДП: <xsl:value-of select="tdld:TransportDoc/tdld:MDPNumber/tdld:TIRSeries"/>
															<xsl:text> </xsl:text>
															<xsl:value-of select="tdld:TransportDoc/tdld:MDPNumber/tdld:TIRID"/>
															<xsl:if test="tdld:MDPNumber/tdld:RegistrationDate"> от <xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="tdld:TransportDoc/tdld:MDPNumber/tdld:RegistrationDate"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:if>
														<xsl:if test="tdld:TransportDoc/tdld:CarnetNumber">Карнет АТА:<xsl:value-of select="tdld:TransportDoc/tdld:CarnetNumber"/>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphLittle">(номер транзитной декарации/книжки МДП/карнета АТА)</td>
												</tr>
												<tr>
													<td class="delim"><br/></td>
												</tr>
											</tbody>
										</table>
										<table class="normal" width="100%">
											<tbody>
												<tr>
													<td align="left" valign="bottom" width="20%" class="normal">по Обращению</td>
													<td class="value" width="3%"/>
													<td align="center" valign="bottom" class="value" width="2%"> </td>
													<td align="left" valign="bottom" class="value" width="75%">
														<xsl:apply-templates select="tdld:RegistrationNumber"/>
													</td>
												</tr>
												<tr>
													<td align="left" class="graphLittle" colspan="2"> </td>
													<td align="center" class="graphLittle" colspan="2">(номер Обращения о продлении срока таможенного транзита)</td>
												</tr>
											</tbody>
										</table>
										<table class="normal" width="100%">
											<tbody>
												<tr>
													<tr>
														<xsl:if test="tdld:FailureCause">
															<tr>
																<td class="normal">в связи с:</td>
															</tr>
															<tr><td class="delim"><br/></td></tr>
															<tr>
																<td class="value">
																	<xsl:for-each select="tdld:FailureCause">
																		<!--xsl:apply-templates/-->
																		<xsl:value-of select="."/>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:for-each>
																</td>
															</tr>
															<tr>
																<td align="center" class="graphLittle">(причины отказа в продлении срока таможенного транзита)</td>
															</tr>
															<tr><td class="delim"><br/></td></tr>
															<tr>
																<td class="normal">
																	в продлении срока таможенного транзита отказано.						
																</td>
															</tr>
														</xsl:if>
													</tr>
												</tr>
											</tbody>
										</table>
									</tbody>
								</table>
								<br/>
								<br/>
								<xsl:apply-templates select="tdld:DecisionDetails/tdld:CustomsPerson"/>
								<br/>
							</div>
						</body>
					</xsl:when>
				</xsl:choose>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="tdld:Carrier">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:if test="position()=1">; 
				<span class="normal">
						<br/>
					</span>
					<span class="italic">Адрес(а)</span>
					<span class="normal">: </span>
				</xsl:if>
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails ">
		<xsl:if test="RUScat_ru:PostalCode">
			<span class="normal"> </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:PostalCode"/>
			</span>
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
			<xsl:if test="RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</span>
			<xsl:if test="RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Region"/>
			</span>
			<xsl:if test="RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:District"/>
			</span>
			<xsl:if test="RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Town"/>
			</span>
			<xsl:if test="RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:City"/>
			</span>
			<xsl:if test="RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:StreetHouse"/>
			</span>
			<xsl:if test="RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:House"/>
			</span>
			<xsl:if test="RUScat_ru:Room or RUScat_ru:AddressText ">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Room"/>
			</span>
			<xsl:if test="RUScat_ru:AddressText">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">, </span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">: </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">, </span>
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">, </span>
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">, </span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">, </span>
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">, </span>
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">, </span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">, </span>
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">, </span>
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">, </span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal"> УИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"> (</span>
			<span class="normal">страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="normal">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic">по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<span class="normal">, </span>
		<span class="italic">Документ, удостоверяющий личность ФЛ</span>
		<span class="normal">: </span>
		<xsl:if test="cat_ru:IdentityCardCode">
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardCode"/>
			</span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
			</span>
			<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<span class="italic">серия</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			</span>
			<xsl:if test="string-length(cat_ru:IdentityCardNumber) &gt; 0">
				<span class="normal">&#160;</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<span class="italic">№</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(cat_ru:IdentityCardDate) &gt; 0 or string-length(cat_ru:OrganizationName) &gt; 0">
			<!--xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
			<span class="normal">, </span>
			<span class="italic">выдан</span>
			<span class="normal">: </span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<span class="normal">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<span class="normal">&#160;</span>
			<span class="normal">
				<xsl:value-of select="cat_ru:OrganizationName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IssuerCode">
			<span class="normal">, </span>
			<span class="italic">код подразделения</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IssuerCode"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<span class="normal">, </span>
			<span class="italic">идентификатор организации</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AuthorityId"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">, </span>
			<span class="italic">страна в уд.личности</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CommunicationDetails">
		<span class="normal">, </span>
		<span class="italic">Контактные данные</span>
		<span class="normal">: </span>
		<xsl:variable name="temp">
			<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
		</xsl:variable>
		<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RegistrationNumber" match="tdld:TransportDoc/tdld:TD | tdld:RegistrationNumber">
		<span class="normal">
			<xsl:value-of select="cat_ru:CustomsCode"/>
		</span>
		<span class="normal">/</span>
		<span class="normal">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
			</xsl:call-template>
		</span>
		<span class="normal">/</span>
		<span class="normal">
			<xsl:value-of select="cat_ru:GTDNumber"/>
		</span>
	</xsl:template>
	<xsl:template match="*" mode="document">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
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

	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:param name="part" select="0"/>
		<xsl:if test="$part != 2">
			<xsl:choose>
				<xsl:when test="substring($dateTimeIn,5,1)='-' and substring($dateTimeIn,8,1)='-'">
					<xsl:value-of select="substring($dateTimeIn, 9, 2)"/>&#160;
					   <xsl:choose>
						<xsl:when test="substring($dateTimeIn, 6, 2)='01'">января</xsl:when>
						<xsl:when test="substring($dateTimeIn, 6, 2)='02'">февраля</xsl:when>
						<xsl:when test="substring($dateTimeIn, 6, 2)='03'">марта</xsl:when>
						<xsl:when test="substring($dateTimeIn, 6, 2)='04'">апреля</xsl:when>
						<xsl:when test="substring($dateTimeIn, 6, 2)='05'">мая</xsl:when>
						<xsl:when test="substring($dateTimeIn, 6, 2)='06'">июня</xsl:when>
						<xsl:when test="substring($dateTimeIn, 6, 2)='07'">июля</xsl:when>
						<xsl:when test="substring($dateTimeIn, 6, 2)='08'">августа</xsl:when>
						<xsl:when test="substring($dateTimeIn, 6, 2)='09'">сентября</xsl:when>
						<xsl:when test="substring($dateTimeIn, 6, 2)='10'">октября</xsl:when>
						<xsl:when test="substring($dateTimeIn, 6, 22)='11'">ноября</xsl:when>
						<xsl:when test="substring($dateTimeIn, 6, 2)='12'">декабря</xsl:when>
					</xsl:choose>
				   &#160;<xsl:value-of select="substring($dateTimeIn, 1, 4)"/>&#160;г.
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$dateTimeIn"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>	
		<xsl:if test="$part = 0">
			<br/>
		</xsl:if>	
		<xsl:if test="$part != 1">
			<xsl:value-of select="substring($dateTimeIn,12,8)"/>
		</xsl:if>	
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
	<xsl:template match="tdld:Customs ">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text>) </xsl:text>
	</xsl:template>
	<xsl:template match="tdld:CustomsPerson">
		<table class="normal" width="100%">
			<tbody>
				<tr>
					<td width="47%">Уполномоченное должностное лицо<br/>таможенного органа:<br/>
						<br/>
					</td>
					<td/>
					<td width="15%"/>
					<td/>
					<td width="25%"/>
				</tr>
				<tr align="center" valign="bottom">
					<td class="value">
						<xsl:apply-templates select="../tdld:Customs"/>
					</td>
					<td/>
					<td class="value"/>
					<td/>
					<td class="value">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
				<tr align="center">
					<td class="graphLittle">(наименование таможенного органа)</td>
					<td/>
					<td class="graphLittle">(подпись)</td>
					<td/>
					<td class="graphLittle">(Ф.И.О.)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
