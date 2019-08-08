<?xml version="1.0" encoding="utf-8"?>
<!-- Бланк из заявки от Елены Поддубной от 18.08.2017 18:50 тема письма "Re: Личный кабинет - обеспечение. Требуется доработка GuaranteeBank + xslt в АФ 5.12.1"-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:grn_cat="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCommonAggregateTypesCust:5.13.4" xmlns:grn_bnk="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeBank:5.13.4">
	<!-- Шаблон для типа GuaranteeBankType -->
	<xsl:decimal-format name="spaces" decimal-separator="," grouping-separator=" "/>
	<xsl:template match="grn_bnk:GuaranteeBank">
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
									width: 190mm;
									/*height: 190mm;*/
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
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
									}

									table.border tr td
									{
									border: 1px solid black;
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
					<table width="100%">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>
											<xsl:choose>
												<xsl:when test="grn_bnk:Decision=1">
													<xsl:text>Решение таможенного органа о приеме банковской гарантии</xsl:text>
												</xsl:when>
												<xsl:when test="grn_bnk:Decision=0">
													<xsl:text>Решение таможенного органа об отказе в приеме банковской гарантии</xsl:text>
												</xsl:when>
												<xsl:otherwise>Решение таможенного органа</xsl:otherwise>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table width="100%">
						<tbody>
							<tr valign="top">
								<td width="50%">
									<xsl:choose>
										<xsl:when test="grn_bnk:Decision=1">
											<xsl:text>Дата и время принятия банковской гарантии</xsl:text>
										</xsl:when>
										<xsl:when test="grn_bnk:Decision=0">
											<xsl:text>Дата и время принятия решения об отказе в приеме банковской гарантии</xsl:text>
										</xsl:when>
										<xsl:otherwise>Дата и время принятия решения</xsl:otherwise>
									</xsl:choose>
								</td>
								<td>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="grn_bnk:DecisionDateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(grn_bnk:DecisionDateTime,12,8)"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center" style="font-weight:bold;">
									<br/>Сведения по банковской гарантии</td>
							</tr>
							<tr>
								<td>Номер банковской гарантии</td>
								<td>
									<xsl:value-of select="grn_bnk:GuaranteeInformation/grn_cat:GuaranteeOriginalNumber"/>
								</td>
							</tr>
							<tr>
								<td>Дата выдачи банковской гарантии</td>
								<td>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="grn_bnk:GuaranteeInformation/grn_cat:GuaranteeOriginalDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>Дата вступления в силу</td>
								<td>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="grn_bnk:GuaranteeInformation/grn_cat:StartDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>Срок действия</td>
								<td>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="grn_bnk:GuaranteeInformation/grn_cat:ExpireDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<xsl:if test="grn_bnk:GuaranteeInformation/grn_cat:GuaranteeType">
								<tr>
									<td>Тип банковской гарантии</td>
									<td>
										<xsl:choose>
											<xsl:when test="grn_bnk:GuaranteeInformation/grn_cat:GuaranteeType=0">Простое обеспечение</xsl:when>
											<xsl:when test="grn_bnk:GuaranteeInformation/grn_cat:GuaranteeType=1">Генеральное обеспечение</xsl:when>
										</xsl:choose>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:GuaranteeInformation/grn_cat:GuaranteeFormat">
								<tr>
									<td>Вид банковской гарантии</td>
									<td>
										<xsl:choose>
											<xsl:when test="grn_bnk:GuaranteeInformation/grn_cat:GuaranteeFormat=0">Банковская гарантия на бумажном носителе</xsl:when>
											<xsl:when test="grn_bnk:GuaranteeInformation/grn_cat:GuaranteeFormat=1">Электронная банковская гарантия</xsl:when>
										</xsl:choose>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td colspan="2" align="center" style="font-weight:bold;">
									<br/>Сумма банковской гарантии</td>
							</tr>
							<tr>
								<td>Сумма</td>
								<td>
									<!--xsl:value-of select="format-number(grn_bnk:GuaranteeInformation/grn_cat:GuaranteeAmount/grn_cat:Amount, '# ###,##', 'spaces')" /-->
									<xsl:value-of select="translate(grn_bnk:GuaranteeInformation/grn_cat:GuaranteeAmount/grn_cat:Amount, '.', ',')"/>
								</td>
							</tr>
							<tr>
								<td>Буквенный код валюты в соответствии с классификатором валют</td>
								<td>
									<xsl:value-of select="grn_bnk:GuaranteeInformation/grn_cat:GuaranteeAmount/grn_cat:CurrencyCode"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center" style="font-weight:bold;">
									<br/>Информация о видах обязательств</td>
							</tr>
							<xsl:if test="grn_bnk:GuaranteeInformation/grn_cat:ObligationTypeInfo/grn_cat:ObligationCode">
								<tr>
									<td>Код вида обязательства</td>
									<td>
										<xsl:for-each select="grn_bnk:GuaranteeInformation/grn_cat:ObligationTypeInfo/grn_cat:ObligationCode">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td colspan="2" align="center" style="font-weight:bold;">
									<br/>Сведения о гаранте</td>
							</tr>
							<xsl:if test="grn_bnk:Guarantor/cat_ru:OrganizationName">
								<tr>
									<td>Наименование организации</td>
									<td>
										<xsl:value-of select="grn_bnk:Guarantor/cat_ru:OrganizationName"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Guarantor/cat_ru:ShortName">
								<tr>
									<td>Краткое наименование организации</td>
									<td>
										<xsl:value-of select="grn_bnk:Guarantor/cat_ru:ShortName"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
								<tr>
									<td>ОГРН/ОГРНИП</td>
									<td>
										<xsl:value-of select="grn_bnk:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:INN">
								<tr>
									<td>ИНН</td>
									<td>
										<xsl:value-of select="grn_bnk:Guarantor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Guarantor/grn_cat:BICID">
								<tr>
									<td>БИК</td>
									<td>
										<xsl:value-of select="grn_bnk:Guarantor/grn_cat:BICID"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Guarantor/grn_cat:CorrAccount">
								<tr>
									<td>Корреспондентский счет</td>
									<td>
										<xsl:value-of select="grn_bnk:Guarantor/grn_cat:CorrAccount"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Guarantor/grn_cat:OKPOID">
								<tr>
									<td>ОКПО</td>
									<td>
										<xsl:value-of select="grn_bnk:Guarantor/grn_cat:OKPOID"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td colspan="2" align="center" style="font-weight:bold;">
									<br/>Сведения о принципале</td>
							</tr>
							<xsl:if test="grn_bnk:Principal/cat_ru:OrganizationName">
								<tr>
									<td>
										<xsl:choose>
											<xsl:when test="grn_bnk:Principal/grn_bnk:PrincipalType=1">Наименование организации</xsl:when>
											<xsl:when test="grn_bnk:Principal/grn_bnk:PrincipalType=2">ФИО физического лица</xsl:when>
											<xsl:otherwise>Наименование организации / ФИО физического лица</xsl:otherwise>
										</xsl:choose>
									</td>
									<td>
										<xsl:value-of select="grn_bnk:Principal/cat_ru:OrganizationName"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Principal/cat_ru:ShortName">
								<tr>
									<td>
										<xsl:choose>
											<xsl:when test="grn_bnk:Principal/grn_bnk:PrincipalType=1">Краткое наименование организации</xsl:when>
											<xsl:when test="grn_bnk:Principal/grn_bnk:PrincipalType=2">Фамилия и инициалы физического лица</xsl:when>
											<xsl:otherwise>Краткое наименование организации / Фамилия и инициалы физического лица</xsl:otherwise>
										</xsl:choose>
									</td>
									<td>
										<xsl:value-of select="grn_bnk:Principal/cat_ru:ShortName"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Principal/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
								<tr>
									<td>ОГРН/ОГРНИП</td>
									<td>
										<xsl:value-of select="grn_bnk:Principal/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Principal/cat_ru:RFOrganizationFeatures/cat_ru:INN">
								<tr>
									<td>ИНН</td>
									<td>
										<xsl:value-of select="grn_bnk:Principal/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Principal/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
								<tr>
									<td>КПП</td>
									<td>
										<xsl:value-of select="grn_bnk:Principal/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Principal/cat_ru:IdentityCard/cat_ru:IdentityCardName">
								<tr>
									<td>Вид документа, удостоверяющего личность</td>
									<td>
										<xsl:value-of select="grn_bnk:Principal/cat_ru:IdentityCard/cat_ru:IdentityCardName"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Principal/cat_ru:IdentityCard/cat_ru:IdentityCardSeries or grn_bnk:Principal/cat_ru:IdentityCard/cat_ru:IdentityCardNumber">
								<tr>
									<td>Серия и номер документа, удостоверяющего личность</td>
									<td>
										<xsl:value-of select="grn_bnk:Principal/cat_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
										<xsl:value-of select="grn_bnk:Principal/cat_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Principal/cat_ru:IdentityCard/cat_ru:IdentityCardDate">
								<tr>
									<td>Дата выдачи документа, удостоверяющего личность</td>
									<td>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="grn_bnk:Principal/cat_ru:IdentityCard/cat_ru:IdentityCardDate"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="grn_bnk:Principal/cat_ru:IdentityCard/cat_ru:OrganizationName">
								<tr>
									<td>Наименование организации, выдавшей документ</td>
									<td>
										<xsl:value-of select="grn_bnk:Principal/cat_ru:IdentityCard/cat_ru:OrganizationName"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td colspan="2" align="center" style="font-weight:bold;">
									<br/>Сведения о бенефициаре</td>
							</tr>
							<tr>
								<td>Код таможенного органа</td>
								<td>
									<xsl:value-of select="grn_bnk:Beneficiary/cat_ru:Code"/>
								</td>
							</tr>
							<xsl:if test="grn_bnk:Beneficiary/cat_ru:OfficeName">
								<tr>
									<td>Наименование таможенного органа</td>
									<td>
										<xsl:value-of select="grn_bnk:Beneficiary/cat_ru:OfficeName"/>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
				</div>
			</body>
		</html>
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
</xsl:stylesheet>
