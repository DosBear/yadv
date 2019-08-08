<?xml version="1.0" encoding="utf-8"?>
<!-- 
Проект Приказа ФТС "Об утверждении формы обращения о выдаче разрешения на хранение товаров в местах, не являющихся таможенными складами и форм решений таможенного органа по результатам рассмотрения указанного обращения"
Приложение № 1 - Обращение о выдаче разрешения на хранение товаров в местах, не являющихся таможенными складами
Писмо ГУФТДиР от 25.12.2017 № 05-34/73722
Внесены изменения согласно Письму ГУОТОиТК от 15.08.2018 г. № 04-64/50997 (Добавлен номер 289-ФЗ «О таможенном регулировании...»)
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:asgnw="urn:customs.ru:Information:WarehouseDocuments:AppStoreGoodsNotWH:5.14.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:template match="asgnw:AppStoreGoodsNotWH">
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
			width: 180mm;
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
			</head>
			<body>
				<div class="page">
					<table width="100%" class="graphMain">
						<tbody>
							<table>
								<tbody width="100%" class="graphMain">
									<br/>
									<br/>
									<tr>
										<td valign="bottom" align="right" class="normal">Начальнику</td>
										<td align="center" class="value">
											<xsl:apply-templates select="asgnw:Customs"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graphLittle">&#160;</td>
										<td class="graphLittle">(наименование таможенного органа)</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody width="100%" class="graphMain">
									<br/>
									<br/>
									<tr>
										<td class="graphHeader" align="center">ОБРАЩЕНИЕ <br> о выдаче разрешения на хранение товаров в местах, не являющихся таможенными складами</br>
										</td>
									</tr>
									<tr align="left" class="normal">
										<td>
											<br/>
											<br>Настоящим</br>
										</td>
									</tr>
									<tr align="left">
										<td class="value" style="text-align: justify;">
											<xsl:apply-templates mode="Applicant" select="asgnw:Applicant"/>
										</td>
									</tr>
									<tr>
										<td class="graphLittle" align="center">(полное наименование организации, юридический адрес и почтовый адрес, ИНН или инициалы, фамилия, ИНН (при наличии), адрес физического лица)</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="normal" align="left" style="text-align: justify;">в соответствии со статьей 120 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные
законодательные акты Российской Федерации» просит выдать разрешение на хранение товаров в местах, не являющихся таможенными складами:</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody width="100%" align="center" class="graphMain" select="asgnw:GoodsInfo">
									<tr>
										<td class="bordered" width="10%">№ п/п</td>
										<td class="bordered" width="40%">Наименование товара</td>
										<td class="bordered" width="15%">Количество <sup>1</sup></td>
										<td class="bordered" width="35%">Индивидуальные признаки товара<sup>2</sup></td>
									</tr>
									<xsl:for-each select="asgnw:GoodsInfo">
										<tr align="center">
											<td class="bordered">
												<xsl:value-of select="cat_ru:GoodsNumeric"/>
											</td>
											<td class="bordered">
												<xsl:for-each select="cat_ru:GoodsDescription">
													<!--xsl:apply-templates/-->
													<xsl:value-of select="."/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:for-each>
												<xsl:if test="cat_ru:GoodsTNVEDCode">(<xsl:value-of select="cat_ru:GoodsTNVEDCode"/>)</xsl:if>
											</td>
											<td class="bordered">
												<xsl:if test="cat_ru:GrossWeightQuantity">
													<xsl:value-of select="asgnw:SupplementaryQuantity/cat_ru:GoodsQuantity"/>&#160;<xsl:if test="asgnw:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName">
														<xsl:value-of select="asgnw:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
													</xsl:if>
													<xsl:if test="asgnw:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">
													(<xsl:value-of select="asgnw:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)
													</xsl:if>
												</xsl:if>
											</td>
											<td class="bordered">
												<xsl:for-each select="asgnw:IndividualCharacteristics">
													<!--xsl:apply-templates/-->
													<xsl:value-of select="."/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table width="100%" class="graphMain">
								<tbody>
									<tr align="left" class="normal">
										<td>
											<br>по причине</br>
										</td>
									</tr>
									<tr align="left">
										<td class="value">
											<xsl:for-each select="asgnw:IndividualCharacteristics">
												<!--xsl:apply-templates/-->
												<xsl:value-of select="."/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graphLittle" align="center">(обоснование необходимости помещения товаров под таможенную процедуру таможенного склада без размещения на таможенном складе)</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<tr align="left">
										<td class="normal">место хранения товаров</td>
									</tr>
									<tr align="left">
										<td class="value" style="text-align: justify;">
											<xsl:if test="asgnw:StoragePlaceInfo/asgnw:StoragePlace">
												<xsl:for-each select="asgnw:StoragePlaceInfo/asgnw:StoragePlace">
													<!--xsl:apply-templates/-->
													<xsl:value-of select="."/>
													<xsl:if test="position()=last()">
														<xsl:text>;&#160;</xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:for-each select="asgnw:StoragePlaceInfo/asgnw:AddressStoragePlace">
												<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
												<xsl:if test="position()!=last()">
													<br>	&#160;</br>
												</xsl:if>
											</xsl:for-each>
											<xsl:if test="asgnw:StoragePlaceInfo/asgnw:OwnerRoomsInfo">
												<xsl:for-each select="asgnw:StoragePlaceInfo/asgnw:OwnerRoomsInfo">
													<xsl:if test="position()=1">; 
				</xsl:if>
													<!--xsl:apply-templates/-->
													<xsl:value-of select="."/>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br>	&#160;</br>
												</xsl:if>
											</xsl:if>
											<xsl:if test="asgnw:StoragePlaceInfo/asgnw:TitleDocDetails">
												<xsl:for-each select="asgnw:StoragePlaceInfo/asgnw:TitleDocDetails">
													<xsl:if test="position()=1">; 
				</xsl:if>
													<xsl:call-template name="document"/>
													<xsl:if test="position()!=last()">; 
				<xsl:text>	&#160;</xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="asgnw:StoragePlaceInfo/asgnw:MaterialTechnicalEquipment">
												<xsl:for-each select="asgnw:StoragePlaceInfo/asgnw:MaterialTechnicalEquipment">
													<!--xsl:apply-templates/-->
													<xsl:if test="position()=1">; 
				<span class="normal"/>
													</xsl:if>
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text>	&#160;</xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="asgnw:StoragePlaceInfo/asgnw:ActionsSafety">
												<xsl:for-each select="asgnw:StoragePlaceInfo/asgnw:ActionsSafety">
													<!--xsl:apply-templates/-->
													<xsl:if test="position()=1">; 
				<span class="normal"/>
													</xsl:if>
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text>	&#160;</xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="graphLittle" align="center">(точное место хранения товаров (включая указание почтового адреса), сведения о владении помещениями (открытыми площадками), предполагаемыми для хранения товаров, с указанием реквизитов соответствующих правоустанавливающих документов, о материально-техническом оснащении предполагаемого места хранения, а также о мерах, которые будут приняты декларантом для обеспечения сохранности товаров)</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value" align="left">
											<xsl:value-of select="asgnw:Applicant/cat_ru:OrganizationName"/>
										</td>
									</tr>
									<tr>
										<td class="graphLittle" align="center">(полное наименование организации)</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="normal" align="left" style="text-align: justify;">
											<xsl:text>просит выдать разрешение на хранение товаров в местах, не являющихся таможенными складами, без предоставления обеспечения исполнения обязанности по уплате таможенных пошлин, налогов в соответствии</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value" align="left" style="text-align: justify;">
											<xsl:if test="asgnw:NormOfLaw">
												<xsl:for-each select="asgnw:NormOfLaw">
													<!--xsl:apply-templates/-->
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text>	&#160;</xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<br/>
										</td>
									</tr>
									<tr>
										<td class="graphLittle" align="center">(указывается норма права ЕАЭС и законодательства Российской Федерации о таможенном деле<sup>3</sup>)</td>
									</tr>
									<table width="100%" class="graphMain">
										<br/>
										<tbody>
											<xsl:for-each select="asgnw:AttachedDocuments">
												<tr width="35%">
													<td class="normal" valign="bottom">
														<xsl:if test="position()=1">Перечень прилагаемых документов:</xsl:if>
													</td>
													<td class="value" valign="bottom" width="65%">
														<xsl:value-of select="position()"/>) <xsl:call-template name="document"/>
													</td>
												</tr>
												<tr valign="top" align="center" class="graphLittle">
													<td/>
													<xsl:if test="position()=1">
														<td>(указываются документы, прилагаемые к обращению)</td>
													</xsl:if>
												</tr>
												<tr>
													<td class="delim">
														<br/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
									<table width="100%" class="graphMain">
										<tbody>
											<br/>
											<br/>
											<tr>
												<td>
													<xsl:apply-templates mode="Signature" select="asgnw:ApproverPerson"/>
												</td>
											</tr>
											<tr class="normal">
												<td>
													<br/>
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="asgnw:ApproverPerson/cat_ru:IssueDate"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
									<table>
										<tbody width="100%" class="graphLittle">
											<br/>
											<br/>
											<tr>
												<td>_____________________________________</td>
											</tr>
											<tr>
												<td>
													<sup>1</sup>Указывается количество товара в основной и дополнительной единице измерения.</td>
											</tr>
											<tr>
												<td>
													<sup>2</sup>Указываются индивидуальные признаки, позволяющие идентифицировать товар.</td>
											</tr>
											<tr>
												<td style="text-align: justify;">
													<sup>3</sup>Указывается в случае, если в отношении товаров в соответствии с правом Евразийского экономического союза и законодательством Российской Федерации о таможенном деле не предоставляется обеспечение исполнения обязанности по уплате таможенных пошлин, налогов.</td>
											</tr>
											<tr>
												<td>
													<sup>4</sup>При наличии печати.</td>
											</tr>
										</tbody>
									</table>
								</tbody>
							</table>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="Organization" mode="Applicant" match="*">
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
		<!--<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>-->
		<!--<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>-->
		<!--<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>-->
		<!--<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>-->
		<!--<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>-->
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
		<!--<xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>-->
	</xsl:template>
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="*">
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
	<xsl:template match="*" mode="Signature" name="PersonSignature">
		<table>
			<tr align="center" valign="bottom">
				<td width="40%" class="value"/>
				<td/>
				<td width="40%" class="value">
					<xsl:value-of select="cat_ru:PersonSurname"/> &#160;<xsl:value-of select="substring(cat_ru:PersonName, 1, 1)"/>.<xsl:if test="cat_ru:PersonMiddleName">
						<xsl:value-of select="substring(cat_ru:PersonMiddleName, 1, 1)"/>.</xsl:if>
				</td>
			</tr>
			<tr align="center">
				<td valign="top" class="graphLittle">(подпись руководителя организации или уполномоченного от имени организации лица либо физического лица)</td>
				<td class="normal" valign="bottom">М.П. <sup>4</sup>
				</td>
				<td valign="top" class="graphLittle">(инициалы, фамилия)</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="asgnw:Customs">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text>) </xsl:text>
	</xsl:template>
	<xsl:template match="*" name="document">
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
		<xsl:if test="RUScat_ru:DocStartDate or RUScat_ru:DocValidityDate">
			<xsl:text>, срок действия:</xsl:text>
			<xsl:if test="RUScat_ru:DocStartDate"> с <xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="RUScat_ru:DocStartDate"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="RUScat_ru:DocValidityDate"> до <xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="RUScat_ru:DocValidityDate"/>
				</xsl:call-template>
			</xsl:if>
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
	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:if test="$number='01'">января</xsl:if>
		<xsl:if test="$number='02'">февраля</xsl:if>
		<xsl:if test="$number='03'">марта</xsl:if>
		<xsl:if test="$number='04'">апреля</xsl:if>
		<xsl:if test="$number='05'">мая</xsl:if>
		<xsl:if test="$number='06'">июня</xsl:if>
		<xsl:if test="$number='07'">июля</xsl:if>
		<xsl:if test="$number='08'">августа</xsl:if>
		<xsl:if test="$number='09'">сентября</xsl:if>
		<xsl:if test="$number='10'">октября</xsl:if>
		<xsl:if test="$number='11'">ноября</xsl:if>
		<xsl:if test="$number='12'">декабря</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<u>&#160;<xsl:value-of select="substring($dateIn,9,2)"/>&#160;</u>
				<xsl:text>" </xsl:text>
				<u>&#160;<xsl:call-template name="month">
						<xsl:with-param name="number" select="substring($dateIn,6,2)"/>
					</xsl:call-template>&#160;</u>
				<xsl:text> 20</xsl:text>
				<u>
					<xsl:value-of select="substring($dateIn,3,2)"/>
				</u>
				<xsl:text>г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
