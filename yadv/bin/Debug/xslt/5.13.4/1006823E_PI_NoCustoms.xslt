<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:catpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonAggregateTypes:5.13.4" xmlns:pinc="urn:customs.ru:Information:PriorInformation:PI_NoCustoms:5.13.4">
	<!-- Шаблон для типа PI_NoCustomsType -->
	<xsl:template match="pinc:PI_NoCustoms">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					body {
					background: #cccccc;
					}

					div
					{
					/*white-space: nowrap;*/
					}

					div.page {
					width: 200mm;
					margin: 10px auto;
					/*margin-top: 6pt;
					margin-bottom: 6pt;*/
					padding: 10mm 5mm 5mm 5mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					.marg-top
					{
					margin-top:5mm;
					}

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					font-size: 9pt;
					}

					table.border tr td
					{
					border: 1px solid gray;
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

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Предварительное уведомление о прибытии товаров c целью проведения иных видов контроля</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:if test="pinc:PI_URN/child::comment()[1]">
						<table class="190w">
							<tbody>
								<tr>
									<td align="center">
										<xsl:variable name="bmpData" select="substring(pinc:PI_URN/child::comment()[1],8)"/>
										<img>
											<xsl:attribute name="src"><xsl:value-of select="concat('data:image/bmp;base64,', $bmpData)"/></xsl:attribute>
										</img>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<xsl:if test="pinc:Exp_CountryCode">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Код страны экспорта</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="pinc:Exp_CountryCode"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pinc:PI_DTNumber">
						<xsl:apply-templates select="pinc:PI_DTNumber"/>
					</xsl:if>
					<xsl:if test="pinc:Consignee">
						<div class="title marg-top">Информация о получателе</div>
						<xsl:apply-templates select="pinc:Consignee"/>
					</xsl:if>
					<xsl:if test="pinc:Carrier">
						<div class="title marg-top">Информация о перевозчике</div>
						<xsl:apply-templates select="pinc:Carrier"/>
					</xsl:if>
					<xsl:if test="pinc:Consignor">
						<div class="title marg-top">Информация об отправителе товара</div>
						<xsl:apply-templates select="pinc:Consignor"/>
					</xsl:if>
					<xsl:if test="pinc:ShippingInformation">
						<div class="title marg-top">Информация о перевозке груза</div>
						<xsl:apply-templates select="pinc:ShippingInformation"/>
					</xsl:if>
					<xsl:if test="pinc:GoodsInform">
						<div class="title marg-top">Информация о перевозимых товарах</div>
						<xsl:apply-templates select="pinc:GoodsInform"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:SubjectDetailsTypee -->
	<xsl:template match="pinc:Carrier| pinc:Consignee| pinc:Consignor| catpi_ru:Producer| catpi_ru:Manufacturer">
		<table class="w190">
			<xsl:if test="cat_ru:OrganizationLanguage">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationLanguage"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="graphMain value" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName"> (</xsl:if>
						<xsl:value-of select="cat_ru:ShortName"/>
						<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName">)</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="catpi_ru:ManufacturerKind">
				<tr>
					<td class="annot graphMain" style="width:50%">Тип предприятия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="catpi_ru:ManufacturerKind=0">бойня</xsl:when>
							<xsl:when test="catpi_ru:ManufacturerKind=1">холодильник</xsl:when>
							<xsl:when test="catpi_ru:ManufacturerKind=2">перерабатывающее предприятие</xsl:when>
							<xsl:when test="catpi_ru:ManufacturerKind=3">производитель</xsl:when>
							<xsl:when test="catpi_ru:ManufacturerKind=9">иное</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="catpi_ru:ManufacturerKind"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="catpi_ru:ManufacturerInfo">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание предприятия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catpi_ru:ManufacturerInfo"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="catpi_ru:ManufacturerNum">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catpi_ru:ManufacturerNum"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryA2Code">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CountryA2Code"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeCode or RUScat_ru:BusinessEntityTypeName">
				<tr>
					<td class="annot graphMain" style="width:50%">Организационно-правовая форма, в которой зарегистрирован хозяйствующий субъект</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
						<xsl:if test="RUScat_ru:BusinessEntityTypeName">
							<xsl:text> </xsl:text>
							<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:UITN">
				<tr>
					<td class="annot graphMain" style="width:50%">Таможенный номер, присвоенный юридическому или физическому лицу</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:UITN"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:PersonId">
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:PersonId"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о документе, удостоверяющем личность физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<tr>
						<td class="annot graphMain" style="width:50%">
							<xsl:if test="position()=1">Адрес</xsl:if>
						</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="."/>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:CountryPortInfoType -->
	<xsl:template match="catpi_ru:DangerPort| catpi_ru:Ports">
		<xsl:value-of select="catpi_ru:CountryCode"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="catpi_ru:PortName"/>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:DocPermitType -->
	<xsl:template match="catpi_ru:DocPermit| catpi_ru:FitoSanitaryDoc">
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
		<xsl:if test="catpi_ru:PresentedDocumentModeCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="catpi_ru:PresentedDocumentModeCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="catpi_ru:ExpiredDate">
			<xsl:text> срок действия: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="catpi_ru:ExpiredDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="catpi_ru:NetWeightQuantity">
			<xsl:text> вес нетто: </xsl:text>
			<xsl:value-of select="translate(catpi_ru:NetWeightQuantity, '.', ',')"/>
			<xsl:text> кг.</xsl:text>
		</xsl:if>
		<xsl:if test="catpi_ru:GrossWeightQuantity">
			<xsl:text> вес брутто: </xsl:text>
			<xsl:value-of select="translate(catpi_ru:GrossWeightQuantity, '.', ',')"/>
			<xsl:text> кг.</xsl:text>
		</xsl:if>
		<xsl:if test="catpi_ru:GoodsMeasureQuantity">
			<xsl:text> кол-во товара в ДЕИ: </xsl:text>
			<xsl:apply-templates select="catpi_ru:GoodsMeasureQuantity"/>
		</xsl:if>
		<xsl:if test="catpi_ru:CodeFOIV or catpi_ru:FOIVName">
			<xsl:text> выдан: </xsl:text>
			<xsl:if test="catpi_ru:CodeFOIV">(<xsl:value-of select="catpi_ru:CodeFOIV"/>)	</xsl:if>
			<xsl:value-of select="catpi_ru:FOIVName"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:FitoSanitaryType -->
	<xsl:template match="catpi_ru:FitoSanitary">
		<xsl:if test="catpi_ru:FitoSanitaryDoc">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Фитосанитарный сертификат страны-экспортера</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catpi_ru:FitoSanitaryDoc"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:FitoCountryCode or catpi_ru:FitoCountryName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Страна, выдавшая сертификат</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="catpi_ru:FitoCountryCode">(<xsl:value-of select="catpi_ru:FitoCountryCode"/>) </xsl:if>
						<xsl:value-of select="catpi_ru:FitoCountryName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:OriginPlace">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Место производства / выращивания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catpi_ru:OriginPlace"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:DepartDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата отгрузки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catpi_ru:DepartDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:DisinfectionInfo">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация об обеззараживании</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catpi_ru:DisinfectionInfo"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<!--xsl:if test="catpi_ru:Consignee">
			<div class="title marg-top">Получатель в ЕАЭС</div>
			<xsl:apply-templates select="catpi_ru:Consignee"/>
		</xsl:if-->
		<xsl:if test="catpi_ru:Marking">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о маркировке</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="catpi_ru:Marking">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="catpi_ru:ForeignDoc|catpi_ru:DangerDoc|catpi_ru:HeavyweightDoc|catpi_ru:OversizedDoc|catpi_ru:RusPermitDoc">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
		</xsl:if>
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
	<!-- Шаблон для типа catpi_ru:GoodsMeasureQuantityType -->
	<xsl:template match="catpi_ru:GoodsMeasureQuantity">
		<xsl:value-of select="translate(catpi_ru:GoodsQuantity, '.', ',')"/>
		<xsl:if test="catpi_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="catpi_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="catpi_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="catpi_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:PackingInformationType -->
	<xsl:template match="catpi_ru:PackingInformation">
		<xsl:value-of select="catpi_ru:PakingQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="catpi_ru:PackingCode"/>
		<xsl:if test="catpi_ru:PackingMark">
			<xsl:text>, маркировка: </xsl:text>
			<xsl:value-of select="catpi_ru:PackingMark"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:SanitaryQuarantineType -->
	<xsl:template match="catpi_ru:SanitaryQuarantine">
		<xsl:if test="catpi_ru:DocPermit">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Cвидетельство о государственной регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catpi_ru:DocPermit"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:OriginPlace">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Место производства / выращивания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catpi_ru:OriginPlace"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:GoodsPurpose">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Назначение товаров</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="catpi_ru:GoodsPurpose">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:GoodsScope">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Область применения товаров</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="catpi_ru:GoodsScope">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:FoodGoods">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Характеристика пищевых продуктов</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="catpi_ru:FoodGoods">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:PromGoods">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Характеристика промышленных товаров</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="catpi_ru:PromGoods">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:DateSeaDecl">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата морской медико-санитарной декларации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catpi_ru:DateSeaDecl"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:Producer">
			<div class="marg-top">
				<i>Изготовитель</i>
			</div>
			<xsl:apply-templates select="catpi_ru:Producer"/>
		</xsl:if>
		<xsl:if test="catpi_ru:Ports">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">
						<div class="marg-top">
							<i>Порты захода</i>
						</div>
					</td>
					<td class="value graphMain" style="width:50%">
						<xsl:for-each select="catpi_ru:Ports">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:DangerPort or catpi_ru:DangerDate">
			<div class="marg-top">
				<i>Информация о заходе судна на зараженную территорию</i>
			</div>
		</xsl:if>
		<xsl:if test="catpi_ru:DangerPort">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Порты захода (на зараженной территории)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:for-each select="catpi_ru:DangerPort">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:DangerDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата захода судна на зараженную территорию</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catpi_ru:DangerDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<br/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:30%">Признак наличия действующего Свидетельства об освобождении судна от санитарного контроля / Свидетельства о прохождении судном санитарного контроля</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190">
						<tr>
							<td class="graphMain bordered" align="center">
								<xsl:choose>
									<xsl:when test="catpi_ru:Immunity='true' or catpi_ru:Immunity='1'">V</xsl:when>
									<xsl:otherwise>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак достаточности и эффективности проведенных экипажем мер по устранению ранее выявленных и указанных в свидетельстве рисков в области санитарно-эпидемиологического благополучия</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190">
						<tr>
							<td class="graphMain bordered" align="center">
								<xsl:choose>
									<xsl:when test="catpi_ru:Effect='true' or catpi_ru:Effect='1' or catpi_ru:Effect='t'">V</xsl:when>
									<xsl:otherwise>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак необходимости размещения на санитарном причале (рейде)</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190">
						<tr>
							<td class="graphMain bordered" align="center">
								<xsl:choose>
									<xsl:when test="catpi_ru:Raid='true' or catpi_ru:Raid='1'">V</xsl:when>
									<xsl:otherwise>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:30%">Признак принятия решения о разрешении свободной практики в порту в отношении пассажиров и членов экипажа</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190">
						<tr>
							<td class="graphMain bordered" align="center">
								<xsl:choose>
									<xsl:when test="catpi_ru:FreePass='true' or catpi_ru:FreePass='1'">V</xsl:when>
									<xsl:otherwise>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак противоэпидемической готовности транспортных средств (наличие противоэпидемического имущества)</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190">
						<tr>
							<td class="graphMain bordered" align="center">
								<xsl:choose>
									<xsl:when test="catpi_ru:Equipment='true' or catpi_ru:Equipment='1'">V</xsl:when>
									<xsl:otherwise>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак достаточности инсектицидных препаратов и средств индивидуальной защиты</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190">
						<tr>
							<td class="graphMain bordered" align="center">
								<xsl:choose>
									<xsl:when test="catpi_ru:insecticide='true' or catpi_ru:insecticide='1'">V</xsl:when>
									<xsl:otherwise>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:30%">Признак подготовки членов экипажей судов по вопросам профилактики и проведения противоэпидемических мероприятий</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190">
						<tr>
							<td class="graphMain bordered" align="center">
								<xsl:choose>
									<xsl:when test="catpi_ru:Prevention='true' or catpi_ru:Prevention='1'">V</xsl:when>
									<xsl:otherwise>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак защиты водного судна от проникновения и распространения насекомых – переносчиков возбудителей инфекционных болезней</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190">
						<tr>
							<td class="graphMain bordered" align="center">
								<xsl:choose>
									<xsl:when test="catpi_ru:Insects='true' or catpi_ru:Insects='1'">V</xsl:when>
									<xsl:otherwise>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак проведения профилактической дезинсекции судна и по эпидемиологическим показаниям</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190">
						<tr>
							<td class="graphMain bordered" align="center">
								<xsl:choose>
									<xsl:when test="catpi_ru:Disinfestation='true' or catpi_ru:Disinfestation='1'">V</xsl:when>
									<xsl:otherwise>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:30%">Признак наличия сертификата дезинсекции с последействием</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190">
						<tr>
							<td class="graphMain bordered" align="center">
								<xsl:choose>
									<xsl:when test="catpi_ru:DisinfestationSert='true' or catpi_ru:DisinfestationSert='1'">V</xsl:when>
									<xsl:otherwise>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%">Признак необходимости повторной инспекции</td>
				<td class="annot graphMain" style="width:2%" align="center">
					<table class="w190">
						<tr>
							<td class="graphMain bordered" align="center">
								<xsl:choose>
									<xsl:when test="catpi_ru:RepeatInspection='true' or catpi_ru:RepeatInspection='1'">V</xsl:when>
									<xsl:otherwise>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</td>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:30%"/>
				<td class="annot graphMain" style="width:2%"/>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:VeterinaryType -->
	<xsl:template match="catpi_ru:Veterinary">
		<xsl:if test="catpi_ru:DocPermit">
			<xsl:variable name="row" select="count(catpi_ru:DocPermit)"/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%" rowspan="{$row}">Разрешение на ввоз</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="catpi_ru:DocPermit[position()=1]"/>
					</td>
				</tr>
				<tr>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="catpi_ru:DocPermit[position() &gt; 1]">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:Marking">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о маркировке</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="catpi_ru:Marking">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:VeterinaryAdd">
			<div class="marg-top">
				<i>Ветеринарный сопроводительный документ</i>
			</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Наименование документа</td>
						<td class="graphMain bordered">Номер документа</td>
						<td class="graphMain bordered">Дата документа</td>
						<td class="graphMain bordered">Код вида документа</td>
						<td class="graphMain bordered">Срок действия документа</td>
						<td class="graphMain bordered">Вес нетто по документу</td>
						<td class="graphMain bordered">Вес брутто по документу</td>
						<td class="graphMain bordered">Кол-во товара  в ДЕИ</td>
						<td class="graphMain bordered">ФОИВ, выдавший документ</td>
					</tr>
					<xsl:for-each select="catpi_ru:VeterinaryAdd">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="catpi_ru:Manufacturer">
			<xsl:for-each select="catpi_ru:Manufacturer">
				<div class="marg-top">
					<i>Производитель/Переработчик № <xsl:value-of select="position()"/>
					</i>
				</div>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catpi_ru:VeterinaryInfo">
			<div class="marg-top">
				<i>Сведения о лекарственном препарате, субстанции, добавке, корме</i>
			</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Наименование документа</td>
						<td class="graphMain bordered">Номер документа</td>
						<td class="graphMain bordered">Дата документа</td>
						<td class="graphMain bordered">Срок действия документа</td>
						<td class="graphMain bordered">Торговое наименование</td>
						<td class="graphMain bordered">Учетная серия добавки</td>
						<td class="graphMain bordered">Производитель</td>
					</tr>
					<xsl:for-each select="catpi_ru:VeterinaryInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUOrganizationNameAddrType -->
	<xsl:template match="catpi_ru:Manufacturer" mode="table">
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		<xsl:if test="not(RUScat_ru:OrganizationName)">
			<xsl:value-of select="RUScat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:RFOrganizationFeatures or RUScat_ru:RKOrganizationFeatures or RUScat_ru:RBOrganizationFeatures or RUScat_ru:RAOrganizationFeatures or RUScat_ru:KGOrganizationFeatures">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Address">
			<xsl:text>, адрес: </xsl:text>
			<xsl:value-of select="RUScat_ru:Address"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:DocPermitType -->
	<xsl:template match="catpi_ru:VeterinaryAdd">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:PresentedDocumentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="catpi_ru:ExpiredDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(catpi_ru:NetWeightQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(catpi_ru:GrossWeightQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:GoodsMeasureQuantity">
					<xsl:apply-templates select="catpi_ru:GoodsMeasureQuantity"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:CodeFOIV">(<xsl:value-of select="catpi_ru:CodeFOIV"/>)	</xsl:if>
				<xsl:value-of select="catpi_ru:FOIVName"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:VeterinaryInfoType -->
	<xsl:template match="catpi_ru:VeterinaryInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="catpi_ru:ExpiredDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:Description"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:Series"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:Manufacturer">
					<xsl:apply-templates select="catpi_ru:Manufacturer" mode="table"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CUCustomsType -->
	<xsl:template match="pinc:BorderCustoms">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:OfficeName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CustomsCountryCode">
			<xsl:text> (код страны: </xsl:text>
			<xsl:value-of select="cat_ru:CustomsCountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:TransportMeansType -->
	<xsl:template match="pinc:BorderTransport">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:TransportIdentifier"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:TrailerIdentifier"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:SecondTrailerIdentifier"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:VINID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:TransportModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:TransportMeansNationalityCode"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:ControlNoCustomsType -->
	<xsl:template match="catpi_ru:ControlNoCustoms">
		<xsl:if test="catpi_ru:SanitaryQuarantine">
			<div class="title marg-top">Cанитарно-карантинный контроль</div>
			<xsl:apply-templates select="catpi_ru:SanitaryQuarantine"/>
		</xsl:if>
		<xsl:if test="catpi_ru:Veterinary">
			<div class="title marg-top">Ветеринарный контроль</div>
			<xsl:apply-templates select="catpi_ru:Veterinary"/>
		</xsl:if>
		<xsl:if test="catpi_ru:FitoSanitary">
			<div class="title marg-top">Фитосанитарный контроль</div>
			<xsl:apply-templates select="catpi_ru:FitoSanitary"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:CountryInformationType -->
	<xsl:template match="pinc:DestinationCountry| pinc:DispatchCountry">
		(<xsl:value-of select="catpi_ru:CountryACode"/>) 
		<xsl:value-of select="catpi_ru:CountryName"/>
		<xsl:if test="catpi_ru:CountryPlace">
			<xsl:if test="name(.)='pinc:DestinationCountry'"> - место назначения: </xsl:if>
			<xsl:if test="name(.)='pinc:DispatchCountry'"> - место отгрузки: </xsl:if>
			<xsl:value-of select="catpi_ru:CountryPlace"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pinc:PI_GoodsType -->
	<xsl:template match="pinc:Goods">
		<tr style="border-top: 3px solid gray;">
			<!-- Столбцы с данными о товаре-->
			<td class="graphMain bordered" bgcolor="#e3e3e3" align="center" style="width:8%; border-left: 3px solid gray">
				<xsl:text>Номер товара</xsl:text>
				<br/>
				<xsl:value-of select="catpi_ru:GoodsNumeric"/>
			</td>
			<td class="graphMain bordered" style="width:82%" colspan="5">
				<i>
					<xsl:value-of select="pinc:GoodsName"/>
				</i>
				<br/>
				<xsl:for-each select="catpi_ru:GoodsDescription">
					<xsl:value-of select="."/>
				</xsl:for-each>
				<xsl:if test="catpi_ru:GoodsTNVEDCode">
					<xsl:text> (ТН ВЭД ЕАЭС: </xsl:text>
					<xsl:value-of select="catpi_ru:GoodsTNVEDCode"/>
					<xsl:text>)</xsl:text>
					<xsl:if test="catpi_ru:PIId">
						<br/>
						<xsl:text>ИД ПИ: </xsl:text>
						<xsl:value-of select="catpi_ru:PIId"/>
					</xsl:if>
					<xsl:if test="pinc:GoodsId">
						<br/>
						<xsl:text>уникальный идентификатор товара: </xsl:text>
						<xsl:value-of select="pinc:GoodsId"/>
					</xsl:if>
				</xsl:if>
			</td>
			<td class="graphMain bordered" style="width:10%">
				Страна происхождения<br/>
				<xsl:value-of select="catpi_ru:OriginCountryCode"/>
				<br/>
			</td>
		</tr>
		<tr style="border-top: 3px solid gray;">
			<td class="graphMain bordered" style="width:8%">
				Вес брутто (кг)<br/>
				<xsl:value-of select="translate(catpi_ru:GrossWeightQuantity, '.', ',')"/>
				<br/>
			</td>
			<td class="graphMain bordered" style="width:8%">
				Вес нетто (кг)<br/>
				<xsl:value-of select="translate(catpi_ru:NetWeightQuantity, '.', ',')"/>
				<br/>
			</td>
			<td class="graphMain bordered" style="width:8%">
				Кол-во товара<br/>в ДЕИ<br/>
				<xsl:apply-templates select="catpi_ru:GoodsMeasureQuantity"/>
				<br/>
			</td>
			<td class="graphMain bordered" style="width:20%">
				Фактурная стоимость<br/>
				<xsl:value-of select="translate(catpi_ru:InvoicedCost, '.', ',')"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="catpi_ru:CurrencyCode"/>
				<br/>
				<xsl:if test="catpi_ru:CurrencyRate">
					курс валюты: <xsl:value-of select="translate(catpi_ru:CurrencyRate, '.', ',')"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered" style="width:10%">
				Номера<br/>контейнеров<br/>
				<xsl:for-each select="catpi_ru:ContainerNumbers">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
				<br/>
			</td>
			<!-- Строки с данными о грузовых местах и упаковке-->
			<td class="graphMain bordered" style="width:46%" colspan="2">
				<table class="w190">
					<tr style="border-bottom: 1px solid gray;">
						<td style="border-right: 1px solid gray;">Кол-во груз. мест</td>
						<td style="border-right: 1px solid gray;">Код груза</td>
						<td style="border-right: 1px solid gray;">Описание</td>
						<td style="border-right: 1px solid gray;">Номера пломб</td>
						<td>Сведения об упаковке</td>
					</tr>
					<xsl:if test="catpi_ru:GoodsPackaging">
						<xsl:for-each select="catpi_ru:GoodsPackaging">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</xsl:if>
				</table>
			</td>
		</tr>
		<!-- Строки с данными о нетаможенном контроле-->
		<tr>
			<td colspan="7">
				<xsl:if test="catpi_ru:ControlNoCustoms">
					<xsl:apply-templates select="catpi_ru:ControlNoCustoms"/>
				</xsl:if>
				<br/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа pinc:GoodsInformType -->
	<xsl:template match="pinc:GoodsInform">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Всего наименований товаров</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pinc:TotalGoodsNameQuantity"/>
				</td>
			</tr>
		</table>
		<xsl:if test="pinc:ShipSpecifQuantity">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Количество отгрузочных спецификаций</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pinc:ShipSpecifQuantity"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pinc:ShipSpecifGoodsQuantity">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Количество товаров по отгрузочным спецификациям</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pinc:ShipSpecifGoodsQuantity"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pinc:DateExpectedArrival or pinc:TimeExpectedArrival">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время ожидаемого прибытия товаров и транспортных средств в пограничный пункт пропуска</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="pinc:DateExpectedArrival"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(pinc:TimeExpectedArrival, 1,8)"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pinc:BorderCustoms">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Таможенный орган (пограничный пункт пропуска), в который ожидается прибытие товаров и ТС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="pinc:BorderCustoms"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<br/>
		<!--div class="title marg-top">Сведения о товарах</div -->
		<table class="w190">
			<xsl:for-each select="pinc:Goods">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:GoodsMeasureQuantityType -->
	<xsl:template match="catpi_ru:GoodsMeasureQuantity">
		<xsl:value-of select="translate(catpi_ru:GoodsQuantity, '.', ',')"/>
		<xsl:if test="catpi_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="catpi_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="catpi_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="catpi_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:GoodsPackagingType -->
	<xsl:template match="catpi_ru:GoodsPackaging">
		<tr>
			<td style="border-right: 1px solid gray;">
				<xsl:value-of select="translate(catpi_ru:PakageQuantity, '.', ',')"/>
			</td>
			<td style="border-right: 1px solid gray;">
				<xsl:value-of select="catpi_ru:CargoCode"/>
			</td>
			<td style="border-right: 1px solid gray;">
				<xsl:value-of select="catpi_ru:CargoDescription"/>
			</td>
			<td style="border-right: 1px solid gray;">
				<xsl:for-each select="catpi_ru:Seal">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="catpi_ru:PackingInformation">
					<xsl:apply-templates select="."/>
					<br/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа pinc:DTNumType -->
	<xsl:template match="pinc:PI_DTNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">
					Номер
					<xsl:choose>
						<xsl:when test="pinc:DTKind=0"> транзитной декларации</xsl:when>
						<xsl:when test="pinc:DTKind=1"> предварительной декларации на товары</xsl:when>
						<xsl:otherwise> предварительной декларации на товары  / транзитной декларации</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:call-template name="number_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа pinc:ShippingInformationType -->
	<xsl:template match="pinc:ShippingInformation">
		<xsl:if test="pinc:ContainerIndicator and (pinc:ContainerIndicator='true' or pinc:ContainerIndicator='1')">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Признак контейнерной перевозки</td>
					<td class="value graphMain" style="width:50%">есть</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pinc:DispatchCountry">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Страна отправления товаров</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="pinc:DispatchCountry"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pinc:DestinationCountry">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Страна назначения товаров</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="pinc:DestinationCountry"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pinc:BorderTransport">
			<div class="marg-top">
				<i>Транспортное средство</i>
			</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Номер основного ТС</td>
						<td class="graphMain bordered">Номер прицепного ТС</td>
						<td class="graphMain bordered">Номер второго прицепного ТС</td>
						<td class="graphMain bordered">Идентификационный номер ТС (VIN)</td>
						<td class="graphMain bordered">Код вида ТС</td>
						<td class="graphMain bordered">Буквенный код страны</td>
					</tr>
					<xsl:for-each select="pinc:BorderTransport">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="pinc:TransControl">
			<div class="marg-top">
				<i>Транспортный контроль</i>
			</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Разрешение для иностранных перевозчиков</td>
						<td class="graphMain bordered">Тип разрешения для иностранных перевозчиков</td>
						<td class="graphMain bordered">Cпециальное разрешение на перевозку опасных грузов</td>
						<td class="graphMain bordered">Cпециальное разрешение на перевозку опасных грузов</td>
						<td class="graphMain bordered">Cпециальное разрешение на перевозку тяжеловесных грузов</td>
						<td class="graphMain bordered">Карточка допуска российского транспортного средства к международным перевозкам грузов</td>
					</tr>
					<xsl:for-each select="pinc:TransControl">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:TransControlType -->
	<xsl:template match="pinc:TransControl">
		<tr>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:ForeignDoc">
					<xsl:apply-templates select="catpi_ru:ForeignDoc"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="catpi_ru:ForeignKind=1">двустороннее</xsl:when>
					<xsl:when test="catpi_ru:ForeignKind=2">транзитное</xsl:when>
					<xsl:when test="catpi_ru:ForeignKind=3">в / из третьих стран</xsl:when>
					<xsl:when test="catpi_ru:ForeignKind=9">иное</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="catpi_ru:ForeignKind"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:DangerDoc">
					<xsl:apply-templates select="catpi_ru:DangerDoc"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:OversizedDoc">
					<xsl:apply-templates select="catpi_ru:OversizedDoc"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:HeavyweightDoc">
					<xsl:apply-templates select="catpi_ru:HeavyweightDoc"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catpi_ru:RusPermitDoc">
					<xsl:apply-templates select="catpi_ru:RusPermitDoc"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures| RUScat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures| RUScat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об отсутствии НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures| RUScat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures| RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures | RUScat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:text>код объекта: </xsl:text>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<xsl:text> код справочника: </xsl:text>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode or cat_ru:IdentityCardName">
			<xsl:value-of select="cat_ru:IdentityCardCode"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<xsl:text>серия </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName or RUScat_ru:IssuerCode">выдан </xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName or RUScat_ru:IssuerCode">
			<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/>
			</xsl:if>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId"> выдан <xsl:value-of select="RUScat_ru:AuthorityId"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text>Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="number_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
