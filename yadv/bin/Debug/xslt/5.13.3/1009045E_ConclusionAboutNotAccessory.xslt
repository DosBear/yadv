<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:conana="urn:customs.ru:Information:SQDocuments:ConclusionAboutNotAccessory:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
	<xsl:template match="conana:ConclusionAboutNotAccessory">
		<html>
			<head>
				<title>Заключение ФСВТС России</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
				body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					height: 297mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
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
					font-family: Courier New, serif;
					vertical-align:top;
				}
				
				.common {
					font: 13;
					/*font-weight: bold;*/
					font-family: Arial, serif;
				}
				
				/*.info tbody tr td {
					border: 0;
				}*/
				
			</style>
			</head>
			<body>
				<div class="page">
					<h2>Заключение ФСВТС России</h2>
					<table border="1" style="table-layout:fixed;word-wrap:break-word; width:100%;">
						<tbody>
							<tr>
								<td>Товар</td>
								<td>
									<xsl:for-each select="conana:GoodsDescription">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>Заключение</td>
								<td>
									<xsl:apply-templates select="conana:Conclusion"/>
								</td>
							</tr>
							<tr>
								<td>Контракт</td>
								<td>
									<xsl:apply-templates select="conana:ContractInfo"/>
								</td>
							</tr>
							<tr>
								<td>Организация, получившая заключение</td>
								<td>
									<xsl:apply-templates select="conana:ConclusionReceiver"/>
								</td>
							</tr>
							<xsl:if test="conana:VTS_TOV">
								<tr>
									<td colspan="2">
										Товары заключения
										<table width="100%">
											<tbody>
												<tr>
													<td>Наим.</td>
													<td>Обозн.</td>
													<td>Сер. №</td>
													<td>Док-т</td>
													<td>Кол-во</td>
													<td>Прим.</td>
												</tr>
												<xsl:for-each select="conana:VTS_TOV">
													<tr>
														<td>
															<xsl:value-of select="conana:Name_Prod"/>
														</td>
														<td>
															<xsl:value-of select="conana:Obozn_Prod"/>
														</td>
														<td>
															<xsl:value-of select="conana:SerN_Prod"/>
														</td>
														<td>
															<xsl:value-of select="conana:Rekv_Prod"/>
														</td>
														<td>
															<xsl:value-of select="conana:Kol_Prod"/>
														</td>
														<td>
															<xsl:value-of select="conana:Primech"/>
															<br/>
															<xsl:choose>
																<xsl:when test="conana:Prizn_Bloc=1 or conana:Prizn_Bloc='true'">
																	блокировать для ввоза/вывоза
																</xsl:when>
																<xsl:when test="conana:Prizn_Bloc=0 or conana:Prizn_Bloc='false'">
																	не блокировать
																</xsl:when>
															</xsl:choose>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<xsl:apply-templates select="conana:AuthorizedPerson"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="conana:Conclusion | conana:ContractInfo">
		<span>
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</xsl:if>
			<br/>
			<xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</xsl:if>
		</span>
		<br/>
		<xsl:if test="conana:Duration">
			<span>Действителен до </span>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="conana:Duration"/>
			</xsl:call-template>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="conana:ConclusionReceiver">
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
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>ИНН: <xsl:value-of select="cat_ru:INN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
			</span>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span>УНП: <xsl:value-of select="cat_ru:UNP"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
			</span>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span>БИН: <xsl:value-of select="cat_ru:BIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
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
		<xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
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
		<xsl:if test="cat_ru:IdentityCardCode">(код вида документа - <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
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
		<br/>
	</xsl:template>
	<xsl:template match="conana:AuthorizedPerson">
		<table border="0" style="margin-top:50px; width:100%">
			<tbody>
				<tr>
					<td align="center" style="border-right:0; border-left:0; border-top:0">
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
					<td style="border:0;" width="40px"/>
					<td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td style="border:0;" width="40px"/>
					<td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td align="center" style="border:0;">Ф.И.О.</td>
					<td style="border:0;"/>
					<td align="center" style="border:0;">Должность</td>
					<td style="border:0;"/>
					<td align="center" style="border:0;">Дата подписания</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
