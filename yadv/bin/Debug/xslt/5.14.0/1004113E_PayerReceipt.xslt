<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:recp="urn:customs.ru:Information:ExchangeDocuments:PayerReceipt:5.13.1">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="recp:PayerReceipt">
		<html>
			<head>
				<title>Квитанция плательщика</title>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<style type="text/css">
					body {
					background: #cccccc;
					}

					div.page {
					width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					table.border tr td
					{
					border: 1px solid gray;
					}
					td {
					font-family: Courier, serif;
					vertical-align:top;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}
					jh {
					font: 16;
					font-face: Arial;
					}
					dog1 {
					position:relative;
					left: 50px;
					bottom: 50px;
					}
					.gra {
					font-family: Arial;
					font-size: 6pt;
					}
					.g{
					border-right:0pt solid;
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

					.normal{
					font-weight: bold;
					font-family:Arial;
					font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext;
					}
					.center
					{
					text-align:center;
					}
					.w190
					{
					width:190mm;
					}
					div.row > span
					{
					display:inline-block;
					}
					div
					{
					margin:0;
					padding:0;
					}
					.right
					{
					text-align:right;
					}
					.mt
					{
					margin-top:8mm;
					}
					.mb
					{
					margin-bottom:3mm;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tr>
							<td align="center" class="graphMain">
								<font size="4">
								<b>
								Квитанция №
								<xsl:value-of select="recp:ReceiptNumber"/>
								</b>
								</font>
							</td>
						</tr>
					</table>
					<br/>
					<table class="w190" align="center" style="width:100mm">
						<tr>
							<td class="graphMain" style="width:3mm">к </td>
							<td class="graphMain center" style="width:97mm;border-bottom:solid 1pt #000000">
								<xsl:text>ДТ № </xsl:text>
								<xsl:value-of select="recp:CustomsDocument/recp:CustomsCode"/>
								<xsl:text>/</xsl:text>
								<xsl:call-template name="gtd_date">
									<xsl:with-param name="dateIn" select="recp:CustomsDocument/recp:RegistrationDate"/>
								</xsl:call-template>
								<xsl:text>/</xsl:text>
								<xsl:value-of select="recp:CustomsDocument/recp:DocNumber"/>
							</td>
						</tr>
						<tr>
							<td class="graphLittle"/>
							<td class="graphLittle center">(наименование и номер документа основания платежа)</td>
						</tr>
					</table>
					<table class="w190" align="center" style="width:100mm">
						<tr>
							<td class="graphMain" style="width:33mm">дата регистрации: </td>
							<td class="graphMain center" style="width:67mm;border-bottom:solid 1pt #000000">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="recp:ReceiptDate" />
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="graphLittle"/>
							<td class="graphLittle center">(дата регистрации документа основания платежа)</td>
						</tr>
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="graphMain" style="width:17mm">Таможня:</td>
							<td class="graphMain center" style="width:163mm;border-bottom:solid 1pt #000000">
								<xsl:choose>
									<xsl:when test="string-length(recp:TPORegNumber/recp:CustomsCode)=8">
										<xsl:value-of select="concat(substring(recp:TPORegNumber/recp:CustomsCode, 1, 6),'00')"/>
									</xsl:when>
									<xsl:otherwise><xsl:value-of select="recp:TPORegNumber/recp:CustomsCode"/></xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td class="graphLittle"/>
							<td class="graphLittle center">(код и наименование таможни)</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="graphMain" style="width:30mm">таможенный пост</td>
							<td class="graphMain center" style="width:150mm;border-bottom:solid 1pt #000000">
								<xsl:value-of select="recp:TPORegNumber/recp:CustomsCode"/>
							</td>
						</tr>
						<tr>
							<td class="graphLittle"/>
							<td class="graphLittle center">(код и наименование таможенного поста)</td>
						</tr>
					</table>
					<xsl:apply-templates select="recp:Payee"/>
					<xsl:apply-templates select="recp:Payer"/>
					<br/>
					<table class="w190 border mb">
						<tr align="center">
							<td class="graphMain">Вид платежа</td>
							<td class="graphMain">КБК</td>
							<td class="graphMain">Наименование платежа</td>
							<td class="graphMain">Сумма к оплате</td>
							<td class="graphMain">Валюта</td>
						</tr>
						<xsl:for-each select="recp:Paying">
							<tr>
								<td class="graphMain"><xsl:value-of select="recp:PaymentModeCode"/></td>
								<td class="graphMain"><xsl:value-of select="recp:CBC"/></td>
								<td class="graphMain"><xsl:value-of select="recp:PaymentName"/></td>
								<td class="graphMain right"><xsl:value-of select="translate(translate(format-number(recp:Amount, '#,###.00'), ',', ' '), '.', ',')"/></td>
								<td class="graphMain center"><xsl:value-of select="recp:CurrencyRate"/></td>
							</tr>
						</xsl:for-each>
						<tr>
							<td class="graphMain"/>
							<td class="graphMain" align="center">Итого:</td>
							<td class="graphMain"/>
							<td class="graphMain right">
								<xsl:value-of select="translate(translate(format-number(recp:Amount, '#,###.00'), ',', ' '), '.', ',')"/>
								<xsl:if test="recp:AmountLetter">
									<br/><xsl:text>(</xsl:text>
									<xsl:value-of select="recp:AmountLetter"/>
									<xsl:text>)</xsl:text>
								</xsl:if>
							</td>
							<td class="graphMain center"><xsl:value-of select="recp:CurrencyRate"/></td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:value-of select="substring($dateIn, 9, 2)"/>
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="substring($dateIn, 6, 2)='01'">января</xsl:when>
			<xsl:when test="substring($dateIn, 6, 2)='02'">февраля</xsl:when>
			<xsl:when test="substring($dateIn, 6, 2)='03'">марта</xsl:when>
			<xsl:when test="substring($dateIn, 6, 2)='04'">апреля</xsl:when>
			<xsl:when test="substring($dateIn, 6, 2)='05'">мая</xsl:when>
			<xsl:when test="substring($dateIn, 6, 2)='06'">июня</xsl:when>
			<xsl:when test="substring($dateIn, 6, 2)='07'">июля</xsl:when>
			<xsl:when test="substring($dateIn, 6, 2)='08'">августа</xsl:when>
			<xsl:when test="substring($dateIn, 6, 2)='09'">сентября</xsl:when>
			<xsl:when test="substring($dateIn, 6, 2)='10'">октября</xsl:when>
			<xsl:when test="substring($dateIn, 6, 2)='11'">ноября</xsl:when>
			<xsl:when test="substring($dateIn, 6, 2)='12'">декабря</xsl:when>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateIn, 1, 4)"/>
		<xsl:text> г.</xsl:text>
	</xsl:template>
	<xsl:template match="recp:Payer">
		<table class="w190 mt">
			<tr>
				<td class="graphMain" style="width:20mm">Плательщик:</td>
				<td class="graphMain" style="width:160mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="cat_ru:OrganizationName"/>
					<xsl:if test="not(cat_ru:OrganizationName)"><xsl:value-of select="cat_ru:ShortName"/></xsl:if>
				</td>
			</tr>
			<tr>
				<td class="graphLittle"/>
				<td class="graphLittle center">(наименование или Ф.И.О. плательщика)</td>
			</tr>
		</table>
		<xsl:if test="*[local-name()='RFOrganizationFeatures']/cat_ru:INN or *[local-name()='RFOrganizationFeatures']/cat_ru:KPP">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:10mm">ИНН</td>
					<td class="graphMain center" style="width:80mm;border-bottom:solid 1pt #000000">
						<xsl:value-of select="*[local-name()='RFOrganizationFeatures']/cat_ru:INN"/>
					</td>
					<td class="graphMain center" style="width:15mm">КПП </td>
					<td class="graphMain center" style="width:75mm;border-bottom:solid 1pt #000000">
						<xsl:value-of select="*[local-name()='RFOrganizationFeatures']/cat_ru:KPP"/>
					</td>
				</tr>
				<tr>
					<td class="graphLittle"/>
					<td class="graphLittle center">(ИНН плательщика)</td>
					<td class="graphLittle"/>
					<td class="graphLittle center">(КПП плательщика)</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:IdentityCard" />
		<!--xsl:apply-templates select="cat_ru:Address" />
		<xsl:apply-templates select="cat_ru:Contact" />
		<xsl:if test="recp:CardNumber">
			<table class="w190 mb">
				<tr>
					<td class="graphMain" style="width:70mm">
						Номер универсальной электронной карты
					</td>
					<td class="graphMain" style="border-bottom:solid 1pt #000000">
						<xsl:value-of select="recp:CardNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="recp:Payee">
		<table class="w190 mt">
			<tr>
				<td class="graphMain" style="width:20mm">Получатель:</td>
				<td class="graphMain center" style="width:160mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:OrganizationName"/>
				</td>
			</tr>
			<tr>
				<td class="graphLittle"/>
				<td class="graphLittle center">(наименование получателя)</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:10mm">ИНН</td>
				<td class="graphMain center" style="width:80mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:INN"/>
				</td>
				<td class="graphMain center" style="width:15mm">КПП</td>
				<td class="graphMain center" style="width:75mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:KPP"/>
				</td>
			</tr>
			<tr>
				<td class="graphLittle"/>
				<td class="graphLittle center">(ИНН получателя)</td>
				<td class="graphLittle"/>
				<td class="graphLittle center">(КПП получателя)</td>
			</tr>
		</table>
		<xsl:apply-templates select="catComFin_ru:Bank" />
		<!--xsl:apply-templates select="recp:Address" />
		<xsl:if test="catComFin_ru:AddInformation">
			<table class="w190">
				<tr>
					<td class="graphMain">
						<xsl:text>Дополнительная информация: </xsl:text>
						<xsl:value-of select="catComFin_ru:AddInformation"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="catComFin_ru:Bank">
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:30mm">Банк получателя</td>
				<td class="graphMain center" style="width:100mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:BankName"/>
				</td>
				<td class="graphMain center" style="width:10mm">БИК</td>
				<td class="graphMain center" style="width:40mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:BIC"/>
				</td>
			</tr>
			<tr>
				<td class="graphLittle"/>
				<td class="graphLittle center">(наименование банка получателя)</td>
				<td class="graphLittle"/>
				<td class="graphLittle center">(БИК банка получателя)</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:30mm">Счет получателя</td>
				<td class="graphMain center" style="width:160mm; border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:PersonalAccount"/>
				</td>
				<!--td class="graphMain" style="width:58mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:PersonalAccount"/>
				</td-->
				<!--td class="graphMain" style="width:5mm">
				</td>
				<td class="graphMain" style="width:42mm">
					Корр. счет получателя
				</td>
				<td class="graphMain" style="width:58mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:CorrespAccount"/>
				</td-->
			</tr>
			<tr>
				<td class="graphLittle"/>
				<td class="graphLittle center">(счет органа Федерального казначейства)</td>
				<!--td class="graphLittle c" style="width:5mm">
				</td>
				<td class="graphLittle c" style="width:42mm">
				</td>
				<td class="graphLittle c" style="width:58mm">
					(корр. счет органа Федерального казначейства)
				</td-->
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="cat_ru:Contact">
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
						Адрес электронной почты
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
	<xsl:template match="cat_ru:IdentityCard">
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:60mm">Документ, удостоверяющий личность</td>
				<td class="graphMain center" style="width:68mm;border-bottom:solid 1pt #000000">
					<xsl:if test="cat_ru:IdentityCardName">
						<xsl:value-of select="cat_ru:IdentityCardName"/>
					</xsl:if>
					<xsl:if test="cat_ru:IdentityCardCode">
						(код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)
					</xsl:if>
				</td>
				<td style="width:2mm" />
				<td class="graphMain center" style="width:50mm;border-bottom:solid 1pt #000000">
					<xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
						<xsl:value-of select="cat_ru:IdentityCardSeries"/>
						<xsl:text disable-output-escaping="yes" >&amp;nbsp;</xsl:text>
						<xsl:value-of select="cat_ru:IdentityCardNumber"/>
					</xsl:if>	
				</td>
			</tr>
			<tr>
				<td class="graphLittle"/>
				<td class="graphLittle center">(наименование документа)</td>
				<td style="width:2mm" />
				<td class="graphLittle center">(серия и номер)</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName"	>
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:15mm">Выдан</td>
					<td class="graphMain center" style="width:155mm;border-bottom:solid 1pt #000000">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
						</xsl:call-template>
						<xsl:text disable-output-escaping="yes" >&amp;nbsp;</xsl:text>
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
				<tr>
					<td class="graphLittle"/>
					<td class="graphLittle center">(когда и кем выдан)</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:Address|recp:Address">
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:35mm">
					Адрес организации
				</td>
				<td colspan="5" class="graphMain" style="width:155mm;border-bottom:solid 1pt #000000">
					<xsl:if test="cat_ru:CounryName">
						<xsl:value-of select="cat_ru:CounryName"/>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="cat_ru:PostalCode">
						<xsl:value-of select="cat_ru:PostalCode"/>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:value-of select="cat_ru:StreetHouse"/>
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
				</td>
				<td class="graphMain" style="width:20mm"/>
				<td class="graphMain" style="width:16mm">
					Область
				</td>
				<td class="graphMain" style="width:58.5mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="cat_ru:Region"/>
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
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
