<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
	xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ntp="urn:customs.ru:Information:ExchangeDocuments:NotifTobaccoPrices:5.14.3">
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="ntp:NotifTobaccoPrices">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Уведомление о розничных ценах на табачные изделия, ввозимые в РФ</title>
				<style>
					body {
					background: #cccccc;
					}


					div.page
					{
					width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					.graphMain
					{
					font-family: Arial;
					font-size: 10pt;
					font-weight: normal;
					}
					.graphLittle
					{
					font-family: Arial;
					font-size: 7pt;
					text-align:center;
					}

					.normal
					{
					font-weight: bold;
					font-family:Arial;
					font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext;
					}
					.w190
					{
					width:190mm;
					}

					table.border tr td
					{
					border: solid 1pt windowtext;
					text-align:center;
					}
					table.border
					{
					border-collapse: collapse;
					}

					.bb
					{
					border-bottom: solid 1pt windowtext;
					}

				</style>
			</head>
			<body>
				<div class="page">
					<div align="center" class="w190 graphMain" style="margin-bottom:5mm">
						<font size="4">
							<b>
								Уведомление о розничных ценах на табачные изделия, ввозимые в РФ<br/>
								Дата установления заявленных розничных цен:
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="ntp:NewPriceStartDate" />
								</xsl:call-template>
							</b>
						</font>
					</div>

					<table class="w190">
						<tr>
							<td class="graphMain" style="width:38mm">
								Таможенный орган:
							</td>
							<td class="graphMain bb" style="width:152mm">
								<xsl:value-of select="ntp:Customs/cat_ru:OfficeName"/>
								<xsl:text> (код </xsl:text>
								<xsl:value-of select="ntp:Customs/cat_ru:OfficeName"/>
							</td>
						</tr>
					</table>
					<xsl:apply-templates select="ntp:TaxPayer"/>
					<xsl:apply-templates select="ntp:ChiefSignature"/>

					<xsl:if test="ntp:Goods">
						<div style="margin-top:5mm">
							Список товаров
						</div>
						<table class="w190 border">
							<tr>
								<td class="graphMain">Код товара</td>
								<td class="graphMain">Наименование</td>
								<td class="graphMain">Вид изделия</td>
								<td class="graphMain">Диапазон цен</td>
								<td class="graphMain">Кол-во в упаковке</td>
							</tr>
							<xsl:for-each select="ntp:Goods">
								<xsl:apply-templates select="." />
							</xsl:for-each>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="ntp:TaxPayer">
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:60mm">
					Сведения о налогоплательщике
				</td>
				<td class="graphMain bb" style="width:130mm">
					<xsl:value-of select="cat_ru:OrganizationName"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td style="width:10mm" class="graphMain">
					ИНН
				</td>
				<td style="width:40mm" class="graphMain bb">
					<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</td>
				<td style="width:10mm" class="graphMain">
					КПП
				</td>
				<td style="width:40mm" class="graphMain bb">
					<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td style="width:10mm" class="graphLittle">
				</td>
				<td style="width:40mm" class="graphLittle">
					(ИНН плательщика)
				</td>
				<td style="width:10mm" class="graphLittle">
				</td>
				<td style="width:40mm" class="graphLittle">
					(КПП плательщика)
				</td>
				<td></td>
			</tr>
		</table>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:variable name="address_title">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации организации</xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес организации</xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес организации</xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode">Адрес организации (код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>)</xsl:when>
						<xsl:otherwise>Адрес организации</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:apply-templates select=".">
					<xsl:with-param name="titleIn" select="$address_title" />
				</xsl:apply-templates>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:IdentityCard" />
		<xsl:apply-templates select="RUScat_ru:CommunicationDetails" />
		<xsl:apply-templates select="ntp:FactAddress">
			<xsl:with-param name="titleIn" select="'Фактический адрес организации'" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<table class="w190 mb">
				<tr>
					<td class="graphMain" style="width:30mm">
						Номер телефона
					</td>
					<td class="graphMain" style="width:150mm;border-bottom:solid 1pt #000000">
						<xsl:for-each select="cat_ru:Phone">
							<xsl:value-of select="."/>
							<xsl:if test="position() != last()">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<table class="w190 mb">
				<tr>
					<td class="graphMain" style="width:25mm">
						Номер факса
					</td>
					<td class="graphMain" style="width:60mm;border-bottom:solid 1pt #000000">
						<xsl:value-of select="cat_ru:Fax"/>
					</td>
					<xsl:if test="cat_ru:Telex">
						<td class="graphMain" style="width:15mm">
						</td>
						<td class="graphMain" style="width:25mm">
							Номер телекса
						</td>
						<td class="graphMain" style="width:60mm;border-bottom:solid 1pt #000000">
							<xsl:value-of select="cat_ru:Telex"/>
						</td>
					</xsl:if>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<table class="w190 mb">
				<tr>
					<td class="graphMain" style="width:40mm">
						Адрес элетронной почты
					</td>
					<td class="graphMain" style="width:140mm;border-bottom:solid 1pt #000000">
						<xsl:for-each select="cat_ru:E_mail">
							<xsl:value-of select="."/>
							<xsl:if test="position() != last()">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>

	<xsl:template match="cat_ru:Address|ntp:FactAddress|RUScat_ru:SubjectAddressDetails">
		<xsl:param name="titleIn" />
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:35mm">
					<xsl:value-of select="$titleIn" />
				</td>
				<td colspan="5" class="graphMain" style="width:155mm;border-bottom:solid 1pt #000000">
					<xsl:if test="cat_ru:CounryName">
						<xsl:value-of select="cat_ru:CounryName"/>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="RUScat_ru:CounryName">
						<xsl:value-of select="RUScat_ru:CounryName"/>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="cat_ru:PostalCode">
						<xsl:value-of select="cat_ru:PostalCode"/>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="RUScat_ru:PostalCode">
						<xsl:value-of select="RUScat_ru:PostalCode"/>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="cat_ru:StreetHouse">
						<xsl:value-of select="cat_ru:StreetHouse"/>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="RUScat_ru:StreetHouse">
						<xsl:value-of select="RUScat_ru:StreetHouse"/>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="RUScat_ru:House">
						<xsl:value-of select="RUScat_ru:House"/>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="RUScat_ru:Room">
						<xsl:value-of select="RUScat_ru:Room"/>
						<xsl:text> </xsl:text>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td class="graphLittle" style="width:35mm">
				</td>
				<td colspan="5" class="graphLittle c" style="width:155mm;">
					(Страна, почтовый индекс, улица, номер дома, номер офиса)
				</td>
			</tr>
			<tr>
				<td class="graphMain" style="width:35mm"/>
				<td class="graphMain" style="width:20mm">
					Нас. пункт
				</td>
				<td class="graphMain" style="width:40mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="cat_ru:City"/>
					<xsl:if test="RUScat_ru:Town">
						<xsl:value-of select="RUScat_ru:Town"/>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:value-of select="RUScat_ru:City"/>
				</td>
				<td class="graphMain" style="width:20mm"/>
				<td class="graphMain" style="width:16mm">
					Область
				</td>
				<td class="graphMain" style="width:58.5mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="cat_ru:Region"/>
					<xsl:if test="RUScat_ru:Region">
						<xsl:value-of select="RUScat_ru:Region"/>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:value-of select="RUScat_ru:District"/>
				</td>
			</tr>
			<tr>
				<td class="graphLittle" style="width:35mm"/>
				<td class="graphLittle" style="width:20mm">

				</td>
				<td class="graphLittle c" style="width:40mm">
					(населенный пункт)
				</td>
				<td class="graphLittle" style="width:20mm"/>
				<td class="graphLittle" style="width:16mm">

				</td>
				<td class="graphLittle c" style="width:58.5mm">
					(регион, штат, провинция и т.п.)
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="RUScat_ru:IdentityCard">
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:65mm">
					Документ, удостоверяющий личность
				</td>
				<td class="graphMain" style="width:55mm;border-bottom:solid 1pt #000000">

					<xsl:if test="RUScat_ru:IdentityCardName">
						<xsl:value-of select="RUScat_ru:IdentityCardName"/>
					</xsl:if>
					<xsl:if test="RUScat_ru:IdentityCardCode">
						(код вида документа <xsl:value-of select="RUScat_ru:IdentityCardCode"/>)
					</xsl:if>

				</td>
				<td style="width:9.5mm" />
				<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
					<td class="graphMain" style="width:50mm;border-bottom:solid 1pt #000000">
						<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
						<xsl:text disable-output-escaping="yes" >&amp;nbsp;</xsl:text>
						<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
					</td>

				</xsl:if>
			</tr>
			<tr>
				<td class="graphLittle" style="width:65mm">
				</td>
				<td class="graphLittle c" style="width:55mm">
					(наименование документа)

				</td>
				<td style="width:9.5mm" />
				<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
					<td class="graphLittle c" style="width:50mm">
						(серия и номер)
					</td>

				</xsl:if>
			</tr>
			<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName"	>
				<tr>
					<td class="graphMain" style="width:65mm">

					</td>
					<td colspan="3" class="graphMain" style="width:125mm;border-bottom:solid 1pt #000000">
						Выдан
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
						</xsl:call-template>
						<xsl:text disable-output-escaping="yes" >&amp;nbsp;</xsl:text>
						<xsl:value-of select="RUScat_ru:OrganizationName"/>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="graphLittle" style="width:65mm">

					</td>
					<td colspan="3" class="graphLittle c" style="width:125mm">
						(кем и когда выдан)
					</td>
				</tr>
			</xsl:if>
		</table>

	</xsl:template>

	<xsl:template match="ntp:ChiefSignature">
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:45mm">
					Руководитель организации
				</td>
				<td class="graphMain" style="width:145mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="concat(cat_ru:PersonName, ' ', cat_ru:PersonMiddleName, ' ', cat_ru:PersonSurname)"/>
				</td>
			</tr>
			<tr>
				<td class="graphLittle" style="width:45mm">

				</td>
				<td class="graphLittle" style="width:145mm;">
					(руководитель организации (индивидуальный предприниматель))
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:20mm">
					Должность
				</td>
				<td class="graphMain" style="width:100mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="cat_ru:PersonPost"/>
				</td>
				<td class="graphMain" style="width:15mm">

				</td>
				<td class="graphMain" style="width:30mm">
					Дата подписания
				</td>
				<td class="graphMain" style="width:25mm;border-bottom:solid 1pt #000000">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:IssueDate" />
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="graphLittle" style="width:20mm">

				</td>
				<td class="graphLittle" style="width:100mm">
					(должность)
				</td>
				<td class="graphLittle" style="width:15mm">

				</td>
				<td class="graphLittle" style="width:30mm">

				</td>
				<td class="graphLittle" style="width:25mm">
					(дата подписания)
				</td>
			</tr>
		</table>

	</xsl:template>

	<xsl:template match="ntp:Goods">
		<tr>
			<td class="graphMain">
				<xsl:value-of select="ntp:GoodsTNVEDCode"/>
			</td>
			<td class="graphMain">
				<xsl:for-each select="ntp:GoodsDescription">
					<xsl:value-of select="."/>
					<br/>
				</xsl:for-each>
			</td>
			<td class="graphMain">
				<xsl:choose>
					<xsl:when test="ntp:GoodsKind=0">
						сигареты с фильтром
					</xsl:when>
					<xsl:when test="ntp:GoodsKind=1">
						сигареты без фильтра
					</xsl:when>
					<xsl:when test="ntp:GoodsKind=2">
						папиросы
					</xsl:when>
				</xsl:choose>
			</td>
			<td class="graphMain">
				<xsl:value-of select="concat(ntp:MinPrice, ' - ', ntp:MaxPrice, ', ', ntp:CurrencyCode)"/>
			</td>
			<td class="graphMain">
				<xsl:value-of select="concat(ntp:QuantityPerPackage/cat_ru:GoodsQuantity, ', ', ntp:QuantityPerPackage/cat_ru:MeasureUnitQualifierName, ' (код ', ntp:QuantityPerPackage/cat_ru:MeasureUnitQualifierCode, ')')"/>
			</td>
		</tr>
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
</xsl:stylesheet>
