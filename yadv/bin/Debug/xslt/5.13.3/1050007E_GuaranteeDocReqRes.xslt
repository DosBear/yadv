<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:grd_inf="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeDocReqRes:5.13.3" xmlns:grn_cat="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCommonAggregateTypesCust:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="grd_inf:GuaranteeDocReqRes">
		<html>
			<head>
				<title>Запрос/Информация о документе обеспечения</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
					body {
					background: #ffffff;
					}

					div.page {
					width: 210mm;
					max-width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #000000;
					}

					div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
					}

					.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
					}

					.header {
					font-weight: bold;
					margin-top:20px;
					}

					table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
					}

					.low {
					font: 12;
					font-fase: Courier;
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

				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tr>
							<td align="center" colspan="2" style="border:solid 0pt">
								<font face="Times new roman" size="4">
									<b>
										<xsl:if test="grd_inf:DocumentSign='1'">Информация</xsl:if>
										<xsl:if test="grd_inf:DocumentSign='0'">Запрос информации</xsl:if>
										о документе обеспечения
									</b>
								</font>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td>
								<span class="graph">Дата и время формирования электронного документа:</span>
							</td>
							<td class="graph">
								<xsl:call-template name="date_time">
									<xsl:with-param name="dateTimeIn" select="grd_inf:DocumentDateTime"/>
								</xsl:call-template>
							</td>
						</tr>
						<xsl:if test="grd_inf:DocumentInfo">
							<tr>
								<td class="graph">
									Информация о документе обеспечения:
								</td>
								<td class="graph">
									<xsl:if test="grd_inf:DocumentInfo/cat_ru:PrDocumentName">
										<xsl:value-of select="grd_inf:DocumentInfo/cat_ru:PrDocumentName"/> 
									</xsl:if>
									<xsl:if test="grd_inf:DocumentInfo/cat_ru:PrDocumentNumber">
										№
										<xsl:value-of select="grd_inf:DocumentInfo/cat_ru:PrDocumentNumber"/> 
									</xsl:if>
									<xsl:if test="grd_inf:DocumentInfo/cat_ru:PrDocumentDate">
										от
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="grd_inf:DocumentInfo/cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="graph">Тип документа:</td>
								<td class="graph">
									<xsl:choose>
										<xsl:when test="grd_inf:DocumentInfo/grn_cat:DocumentKind=0">Заявление при регистрации акцизных марок</xsl:when>
										<xsl:when test="grd_inf:DocumentInfo/grn_cat:DocumentKind=1">ДТ</xsl:when>
										<xsl:when test="grd_inf:DocumentInfo/grn_cat:DocumentKind=2">ТД</xsl:when>
										<xsl:when test="grd_inf:DocumentInfo/grn_cat:DocumentKind=3">Книжка МДП</xsl:when>
										<xsl:when test="grd_inf:DocumentInfo/grn_cat:DocumentKind=4">Сертификат</xsl:when>
										<xsl:when test="grd_inf:DocumentInfo/grn_cat:DocumentKind=5">ТПО</xsl:when>
										<xsl:when test="grd_inf:DocumentInfo/grn_cat:DocumentKind=6">ТР</xsl:when>
										<xsl:when test="grd_inf:DocumentInfo/grn_cat:DocumentKind=7">Дополнение к договору поручительства</xsl:when>
										<xsl:when test="grd_inf:DocumentInfo/grn_cat:DocumentKind=8">Банковская гарантия</xsl:when>
										<xsl:when test="grd_inf:DocumentInfo/grn_cat:DocumentKind=9">Свидетельство о включение в реестр</xsl:when>
										<!--xsl:when test="grd_inf:DocumentInfo/grn_cat:DocumentKind=10">Свидетельство о включение в реестр</xsl:when-->
									</xsl:choose>
								</td>
							</tr>
							<xsl:if test="grd_inf:DocumentInfo/grn_cat:ContractNumber or grd_inf:DocumentInfo/grn_cat:ContractDate">
								<tr>
									<td class="graph">Номер/Дата договора поручительства:</td>
									<td class="graph">
										<xsl:if test="grd_inf:DocumentInfo/grn_cat:ContractNumber">
											№ <xsl:value-of select="grd_inf:DocumentInfo/grn_cat:ContractNumber"/>
										</xsl:if>
										<xsl:if test="grd_inf:DocumentInfo/grn_cat:ContractDate">
											от
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="grd_inf:DocumentInfo/grn_cat:ContractDate"/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grd_inf:DocumentInfo/grd_inf:GuaranteeType">
								<tr>
									<td class="graph">Тип обеспечения:</td>
									<td class="graph">
										<xsl:choose>
											<xsl:when test="grd_inf:DocumentInfo/grd_inf:GuaranteeType='0'">простое</xsl:when>
											<xsl:when test="grd_inf:DocumentInfo/grd_inf:GuaranteeType='1'">генеральное</xsl:when>
											<xsl:when test="grd_inf:DocumentInfo/grd_inf:GuaranteeType='2'">генеральное (учет и контроль ГО с использованием ЕАИС ТО без выдачи таможенным органом подтверждения о предоставлении ГО)</xsl:when>
										</xsl:choose>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grd_inf:DocumentInfo/grd_inf:Status">
								<tr>
									<td class="graph">Статусное состояние документа обеспечения:</td>
									<td class="graph">
										<xsl:value-of select="grd_inf:DocumentInfo/grd_inf:Status"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grd_inf:DocumentInfo/grd_inf:ExpirationDate">
								<tr>
									<td class="graph">Дата окончания действия обеспечения:</td>
									<td class="graph">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="grd_inf:DocumentInfo/grd_inf:ExpirationDate"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grd_inf:DocumentInfo/grd_inf:Amount">
								<tr>
									<td class="graph">Сумма обеспечения:</td>
									<td class="graph">
										<xsl:value-of select="grd_inf:DocumentInfo/grd_inf:Amount/grn_cat:Amount"/>&#160;
										<xsl:value-of select="grd_inf:DocumentInfo/grd_inf:Amount/grn_cat:CurrencyCode"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grd_inf:DocumentInfo/grd_inf:RegistrationCustoms">
								<tr>
									<td class="graph">Код таможенного органа, в котором зарегистрировано обеспечение:</td>
									<td class="graph">
										<xsl:apply-templates select="grd_inf:DocumentInfo/grd_inf:RegistrationCustoms"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grd_inf:DocumentInfo/grd_inf:LiableTrader">
								<tr>
									<td class="graph">Информация о гаранте/поручителе или залогодателе:</td>
									<td class="graph">
										<xsl:apply-templates select="grd_inf:DocumentInfo/grd_inf:LiableTrader"/>
									</td>
								</tr>
							</xsl:if>
						</xsl:if>
						<xsl:if test="grd_inf:ObligationCode">
							<tr>
								<td class="graph">Код вида обязательства:</td>
								<td class="graph"><xsl:value-of select="grd_inf:ObligationCode"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="grd_inf:GuaranteeUseDocument">
							<tr>
								<td class="graph">Информация о документе, в котором используется обеспечение:</td>
								<td class="graph">
									<xsl:apply-templates select="grd_inf:GuaranteeUseDocument"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="grd_inf:Declarant">
							<tr>
								<td class="graph">Сведения о декларанте:</td>
								<td class="graph">
									<xsl:apply-templates select="grd_inf:Declarant"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="grd_inf:CustomsRepresentative">
							<tr>
								<td class="graph">Сведения о таможенном представителе:</td>
								<td class="graph">
									<xsl:apply-templates select="grd_inf:CustomsRepresentative"/>
								</td>
							</tr>
						</xsl:if>
					</table>
				</div>
			</body>
		</html>
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
	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateTimeIn,12,5)"/>
	</xsl:template>
	<xsl:template match="grd_inf:DocumentInfo/grd_inf:LiableTrader | grd_inf:Declarant | grd_inf:CustomsRepresentative">
		<xsl:if test="cat_ru:OrganizationLanguage">
			Язык заполнения:
			<xsl:value-of select="cat_ru:OrganizationLanguage"/>
			<br/>
		</xsl:if>
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<br/>
		<xsl:choose>
			<xsl:when test="cat_ru:RFOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RKOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RBOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="cat_ru:Address">
			<xsl:apply-templates select="cat_ru:Address"/>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCard">
			<xsl:apply-templates select="cat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="cat_ru:Contact">
			Контактные сведения:
			<xsl:for-each select="cat_ru:Contact">
				<xsl:if test="cat_ru:Phone">
					тел.: <xsl:for-each select="cat_ru:Phone">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">,&#160;</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="cat_ru:Fax">
					факс: <xsl:value-of select="cat_ru:Fax"/>&#160;
				</xsl:if>
				<xsl:if test="cat_ru:Telex">
					телекс: <xsl:value-of select="cat_ru:Telex"/>&#160;
				</xsl:if>
				<xsl:if test="cat_ru:E_mail">
					эл. почта: <xsl:for-each select="cat_ru:E_mail">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">,&#160;</xsl:if>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>
				ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>
				ИНН: <xsl:value-of select="cat_ru:INN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>
				КПП: <xsl:value-of select="cat_ru:KPP"/>
			</span>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span>
				УНП: <xsl:value-of select="cat_ru:UNP"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span>
				Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
			</span>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span>
				БИН: <xsl:value-of select="cat_ru:BIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<span>
				ИИН: <xsl:value-of select="cat_ru:IIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<span>
				ИТН:
				<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">
					/<xsl:value-of select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cat_ru:Address">
		<span class="header">Адрес:</span>
		<br/>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			(<xsl:value-of select="cat_ru:CountryCode"/>)
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="cat_ru:PostalCode">
			<br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="cat_ru:IdentityCard">
		<span class="header">Документ удостоверяющий личность:</span>
		<br/>
		<xsl:if test="cat_ru:IdentityCardName">
			<xsl:value-of select="cat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardCode">
			(код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
			<span>
				Серия номер:
				<xsl:value-of select="cat_ru:IdentityCardSeries"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
			Выдан
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="cat_ru:OrganizationName"/>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="grd_inf:RegistrationCustoms">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			(<xsl:value-of select="cat_ru:OfficeName"/>)
		</xsl:if>
	</xsl:template>
	<xsl:template match="grd_inf:GuaranteeUseDocument">
		<!--код/дата/номер-->
		<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="grd_inf:AddNumber"/><xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
</xsl:stylesheet>
