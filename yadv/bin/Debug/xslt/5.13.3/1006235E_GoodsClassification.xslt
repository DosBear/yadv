<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:GCl="urn:customs.ru:GoodsClassification:5.13.3">
	<!-- Шаблон для типа GoodsClassificationType -->
	<xsl:template match="GCl:GoodsClassification">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div
					{
					white-space: normal;
					}

					div.page {
					width: 287mm;
					max-width: 287mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 5mm 10mm 5mm;
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
										<b>Заявление на оказание услуги <br/>"ПРИНЯТИЕ ПРЕДВАРИТЕЛЬНЫХ РЕШЕНИЙ ПО КЛАССИФИКАЦИИ ТОВАРОВ ПО ЕДИНОЙ ТОВАРНОЙ НОМЕНКЛАТУРЕ ВНЕШНЕЭКОНОМИЧЕСКОЙ ДЕЯТЕЛЬНОСТИ ЕАЭС"</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="GCl:ApplicationInfo">
						<div class="title marg-top">СВЕДЕНИЯ О  ЗАЯВЛЕНИИ</div>
						<xsl:apply-templates select="GCl:ApplicationInfo"/>
					</xsl:if>
					<xsl:if test="GCl:Applicant">
						<div class="title marg-top">СВЕДЕНИЯ О  ЗАЯВИТЕЛЕ</div>
						<xsl:apply-templates select="GCl:Applicant"/>
					</xsl:if>
					<xsl:if test="GCl:AppliedDocument">
						<div class="title marg-top">СВЕДЕНИЯ О ПРЕДОСТАВЛЯЕМЫХ ДОКУМЕНТАХ</div>
						<table class="bordered w190">
							<tr class="title" bgcolor="#e3e3e3">
								<td class="graphMain bordered">Имя файла документа</td>
								<td class="graphMain bordered">Номер файла документа</td>
								<td class="graphMain bordered">Расширение файла</td>
								<td class="graphMain bordered">Файл в формате base64</td>
								<td class="graphMain bordered">Комментарий</td>
							</tr>
							<xsl:for-each select="GCl:AppliedDocument">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					</xsl:if>
					<xsl:if test="GCl:DecisionPreliminaryTNVED">
						<div class="title marg-top">ВЫДАЧА РЕШЕНИЙ</div>
						<xsl:apply-templates select="GCl:DecisionPreliminaryTNVED"/>
					</xsl:if>
					<xsl:if test="GCl:Dublicate">
						<div class="title marg-top">ВЫДАЧА ДУБЛИКАТА</div>
						<xsl:apply-templates select="GCl:Dublicate"/>
					</xsl:if>
					<xsl:if test="GCl:Alteration">
						<div class="title marg-top">ВНЕСЕНИЕ ИЗМЕНЕНИЙ</div>
						<xsl:apply-templates select="GCl:Alteration"/>
					</xsl:if>
				</div>
			</body>
		</html>
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
	<xsl:template match="cat_ru:KGOrganizationFeatures">
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
	<xsl:template match="cat_ru:RAOrganizationFeatures">
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
	<xsl:template match="cat_ru:RBOrganizationFeatures">
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
	<xsl:template match="cat_ru:RFOrganizationFeatures">
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
	<xsl:template match="cat_ru:RKOrganizationFeatures">
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
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName"><xsl:value-of select="RUScat_ru:FullIdentityCardName"/></xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId"> выдан <xsl:value-of select="RUScat_ru:AuthorityId"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails | GCl:LegalLocation">
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
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
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
	<!-- Шаблон для типа GCl:AlterationType -->
	<xsl:template match="GCl:Alteration|GCl:Dublicate">
		<table class="w190">
			<xsl:if test="GCl:Note">
				<tr>
					<td class="annot graphMain" style="width:50%">Примечание</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="GCl:Note"><xsl:value-of select="."/></xsl:for-each>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="GCl:Papermail">
				<tr>
					<td class="annot graphMain" style="width:50%">Направить результат оказания услуги на  бумажном носителе по почте</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="GCl:Papermail='true'or GCl:Papermail='1'"><xsl:text>да</xsl:text></xsl:when>
							<xsl:otherwise><xsl:text>нет</xsl:text></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
		</table>
		<div class="title marg-top">Ранее выданное предварительное решение</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title" valign="middle" bgcolor="#e3e3e3">
					<td class="graphMain bordered">Наименование документа</td>
					<td class="graphMain bordered">Письмо ФТС о  выдаче предварительного решения (при наличии)</td>
					<td class="graphMain bordered">Причина</td>
					<td class="graphMain bordered">Описание товара</td>
				</tr>
				<xsl:for-each select="GCl:PreliminaryDecision"><xsl:apply-templates select="."/></xsl:for-each>
			</tbody>
		</table>
		<xsl:if test="GCl:StatementInfo">
			<div class="title marg-top">Заявление о принятии предварительного решения</div>
			<xsl:apply-templates select="GCl:StatementInfo"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа GCl:ApplicantType -->
	<xsl:template match="GCl:Applicant">
		<table class="w190">
			<xsl:if test="cat_ru:OrganizationLanguage">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
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
			<xsl:if test="RUScat_ru:CountryA2Code">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:CountryA2Code"/></td>
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
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="RUScat_ru:UITN"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:PersonId">
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор физического лица</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:PersonId"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о документе, удостоверяющем личность физического лица</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="RUScat_ru:IdentityCard"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<tr>
						<td class="annot graphMain" style="width:50%"><xsl:if test="position()=1">Адрес</xsl:if> </td>
						<td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="RUScat_ru:CommunicationDetails">
				<tr>
					<td class="annot graphMain" style="width:50%">Контактные данные</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="RUScat_ru:CommunicationDetails"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор заявителя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="GCl:ApplicantID"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Тип заявителя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="GCl:ApplicantType"/></td>
			</tr>
			<xsl:if test="GCl:PersonPost">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="GCl:PersonPost"/></td>
				</tr>
			</xsl:if>
		</table>	
		<xsl:if test="GCl:Organization">
			<div class="title marg-top">Данные юридического лица</div>
			<xsl:apply-templates select="GCl:Organization"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа DocumentBaseType -->
	<xsl:template mode="doc" match="*">
		<xsl:if test="cat_ru:PrDocumentName"><xsl:value-of select="cat_ru:PrDocumentName"/><xsl:text> </xsl:text></xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">№ <xsl:value-of select="cat_ru:PrDocumentNumber"/> </xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate"> от 
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>	
	</xsl:template>
	<!-- Шаблон для типа GCl:ApplicationInfoType -->
	<xsl:template match="GCl:ApplicationInfo">
		<table class="w190">
			<xsl:if test="cat_ru:PrDocumentName or cat_ru:PrDocumentNumber or cat_ru:PrDocumentDate">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates mode="doc" select="."/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор заявления на ЕПГУ</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="GCl:ApplicationSourceSystemID"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор заявки в АПС "Электронные Госуслуги"</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="GCl:ApplicationID"/></td>
			</tr>
			<xsl:if test="GCl:DepartmentCode">
				<tr>
					<td class="annot graphMain" style="width:50%">Код подразделения, в которое предоставляется заявка</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="GCl:DepartmentCode"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа GCl:BinaryDocumentIssuedByOVType -->
	<xsl:template match="GCl:BinaryDocumentIssuedByOV|GCl:BinaryDocument|GCl:DocumentView">
		<tr>
			<td class="graphMain bordered"><xsl:apply-templates mode="doc" select="."/></td>
			<td class="graphMain bordered"><xsl:value-of select="GCl:DocumentIssuedBy"/></td>
			<xsl:for-each select="GCl:BinaryDocumentIssued">
				<td class="graphMain bordered"><xsl:value-of select="GCl:Name"/></td>
				<td class="graphMain bordered"><xsl:value-of select="GCl:Number"/></td>
				<td class="graphMain bordered"><xsl:value-of select="GCl:Expansion"/></td>
				<td class="graphMain bordered"><xsl:value-of select="GCl:Base"/></td>
				<td class="graphMain bordered" colspan="2"><xsl:value-of select="GCl:Description"/></td>
			</xsl:for-each>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа GCl:DecisionPreliminaryTNVEDType -->
	<xsl:template match="GCl:DecisionPreliminaryTNVED">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Форма выдачи</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="GCl:FormIssue=1">В письменном виде</xsl:when>
						<xsl:when test="GCl:FormIssue=2">В электронном виде</xsl:when>
						<xsl:otherwise><xsl:value-of select="GCl:FormIssue"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<xsl:if test="GCl:DataPaymentDocument">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата платежного документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="GCl:DataPaymentDocument"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="GCl:NumPaymentDocument">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер платежного документа</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="GCl:NumPaymentDocument"/></td>
				</tr>
			</xsl:if>
		</table>
		<div class="title marg-top">Сведения о товаре</div>
		<table class="bordered w190">
			<xsl:for-each select="GCl:Goods">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="GCl:DepartmentCode">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text> </xsl:text>
 		<xsl:if test="cat_ru:OfficeName"><xsl:value-of select="cat_ru:OfficeName"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типов GCl:AppliedDocumentType и GCl:BinaryDocumentType -->
	<xsl:template match="GCl:DocumentView|GCl:BinaryDocument|GCl:AppliedDocument">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="GCl:Name"/></td>
			<td class="graphMain bordered"><xsl:value-of select="GCl:Number"/></td>
			<td class="graphMain bordered"><xsl:value-of select="GCl:Expansion"/></td>
			<td class="graphMain bordered"><xsl:value-of select="GCl:Base"/></td>
			<xsl:choose>
				<xsl:when test="name(.)='GCl:DocumentView'">
					<td class="graphMain bordered" colspan="4"><xsl:value-of select="GCl:Description"/></td>
				</xsl:when>
				<xsl:when test="name(.)='GCl:BinaryDocument'">
					<td class="graphMain bordered" colspan="2"><xsl:value-of select="GCl:Description"/></td>
					<td class="graphMain bordered" colspan="2"><xsl:value-of select="GCl:DocumentDescription"/></td>
				</xsl:when>
				<xsl:otherwise><td class="graphMain bordered"><xsl:value-of select="GCl:Description"/></td></xsl:otherwise>
			</xsl:choose>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа GCl:GoodsType -->
	<xsl:template match="GCl:Goods">
		<tr class="title">
			<td class="graphMain bordered" colspan="8" bgcolor="silver">
				<xsl:value-of select="GCl:GoodsID"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="GCl:Description"/>
			</td>
		</tr>
		<tr valign="middle" bgcolor="#e3e3e3">
			<td class="graphMain bordered">Фирменное наименование товара</td>
			<td class="graphMain bordered">Назначение</td>
			<td class="graphMain bordered">Стандарт</td>
			<td class="graphMain bordered">Сорт</td>
			<td class="graphMain bordered">Марка</td>
			<td class="graphMain bordered">Модель</td>
			<td class="graphMain bordered">Артикул</td>
			<td class="graphMain bordered">Предполагаемый код товара по ТН ВЭД ЕАЭС.</td>
		</tr>		
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="GCl:CorporateDescription"/></td>
			<td class="graphMain bordered"><xsl:value-of select="GCl:Purpose"/></td>
			<td class="graphMain bordered"><xsl:value-of select="GCl:Standard"/></td>
			<td class="graphMain bordered"><xsl:value-of select="GCl:Kind"/></td>
			<td class="graphMain bordered"><xsl:value-of select="GCl:Mark"/></td>
			<td class="graphMain bordered"><xsl:value-of select="GCl:Model"/></td>
			<td class="graphMain bordered"><xsl:value-of select="GCl:Art"/></td>
			<td class="graphMain bordered"><xsl:value-of select="GCl:PresumedTNVEDCode"/></td>
		</tr>		
		<tr>	
			<td valign="middle" class="annot graphMain" colspan="2">Материал, из которого изготовлен товар</td>
			<td class="value graphMain" colspan="6"><xsl:value-of select="GCl:MaterialsName"/></td>
		</tr>		
		<tr>	
			<td valign="middle" class="annot graphMain" colspan="2">Выполняемые товаром функции</td>
			<td class="value graphMain" colspan="6"><xsl:value-of select="GCl:Features"/></td>
		</tr>		
		<tr>	
			<td valign="middle" class="annot graphMain" colspan="2">Индивидуальная и транспортная тара</td>
			<td class="value graphMain" colspan="6"><xsl:value-of select="GCl:Container"/></td>
		</tr>		
		<tr>	
			<td valign="middle" class="annot graphMain" colspan="2">Иное</td>			
			<td class="value graphMain" colspan="6"><xsl:value-of select="GCl:Other"/></td>
		</tr>		
		<xsl:if test="GCl:DocumentView">
			<tr>	
				<td class="annot graphMain" colspan="8"><br/><i>Внешний вид товара</i></td>
			</tr>	
			<tr valign="middle" bgcolor="#e3e3e3">
				<td class="graphMain bordered">Имя файла документа</td>
				<td class="graphMain bordered">Номер файла документа</td>
				<td class="graphMain bordered">Расширение файла</td>
				<td class="graphMain bordered">Файл в формате base64</td>
				<td class="graphMain bordered" colspan="4">Комментарий</td>
			</tr>
			<xsl:for-each select="GCl:DocumentView">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="GCl:BinaryDocument">
			<tr>	
				<td class="annot graphMain" colspan="8"><br/><i>Прикрепляются документы, содержащие необходимые сведения для принятия предварительного решения</i></td>
			</tr>	
			<tr valign="middle" bgcolor="#e3e3e3">
				<td class="graphMain bordered">Имя файла документа</td>
				<td class="graphMain bordered">Номер файла документа</td>
				<td class="graphMain bordered">Расширение файла</td>
				<td class="graphMain bordered">Файл в формате base64</td>
				<td class="graphMain bordered" colspan="2">Комментарий</td>
				<td class="graphMain bordered" colspan="2">Файл содержит</td>
			</tr>
			<xsl:for-each select="GCl:BinaryDocument">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="GCl:BinaryDocumentIssuedByOV">
			<tr>	
				<td class="annot graphMain" colspan="8"><br/><i>Прикрепляются документы, содержащие необходимые сведения для принятия предварительного решения, выданный органом власти</i></td>
			</tr>	
			<tr valign="middle" bgcolor="#e3e3e3">
				<td class="graphMain bordered" rowspan="2">Наименование документа</td>
				<td class="graphMain bordered" rowspan="2">Кем выдан</td>
				<td class="graphMain bordered" colspan="6">Вложение</td>
			</tr>
			<tr valign="middle" bgcolor="#e3e3e3">
				<td class="graphMain bordered">Имя файла документа</td>
				<td class="graphMain bordered">Номер файла документа</td>
				<td class="graphMain bordered">Расширение файла</td>
				<td class="graphMain bordered">Файл в формате base64</td>
				<td class="graphMain bordered" colspan="2" >Комментарий</td>
			</tr>
			<xsl:for-each select="GCl:BinaryDocumentIssuedByOV">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<tr class="title">	
			<td class="annot graphMain" colspan="8"><br/></td>
		</tr>	
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="GCl:Head">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:PersonMiddleName"><xsl:value-of select="cat_ru:PersonMiddleName"/></xsl:if>
		<xsl:if test="cat_ru:PersonPost"> - <xsl:value-of select="cat_ru:PersonPost"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа GCl:LegalInfoType -->
	<xsl:template match="GCl:Organization">
		<table class="w190">
			<xsl:if test="GCl:GeneralNotes">
				<tr>
					<td class="annot graphMain" style="width:50%">Примечание</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="GCl:GeneralNotes"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="GCl:Head">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о руководителе организации</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="GCl:Head"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="GCl:LegalLocation">
				<tr>
					<td class="annot graphMain" style="width:50%">Юридический адрес</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="GCl:LegalLocation"/></td>
				</tr>
			</xsl:if>
		</table>	
	</xsl:template>
	<!-- Шаблон для типа GCl:PreliminaryDecisionType -->
	<xsl:template match="GCl:PreliminaryDecision">
		<tr>
			<td class="graphMain bordered" style="width:18%">
				<xsl:apply-templates mode="doc" select="."/>
			</td>
			<td class="graphMain bordered" style="width:18%">
				<xsl:if test="GCl:OrderNumber">№ <xsl:value-of select="GCl:OrderNumber"/></xsl:if>
				<xsl:if test="GCl:OrderDate">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="GCl:OrderDate"/>
					</xsl:call-template>
				</xsl:if>
			</td>
			<td class="graphMain bordered" style="width:24%"><xsl:value-of select="GCl:Cause"/></td>
			<td class="graphMain bordered" style="width:40%"><xsl:value-of select="GCl:Description"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа GCl:StatementInfoType -->
	<xsl:template match="GCl:StatementInfo">
		<table class="w190">
			<xsl:if test="cat_ru:PrDocumentName or cat_ru:PrDocumentNumber or cat_ru:PrDocumentDate">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates mode="doc" select="."/></td>
				</tr>
			</xsl:if>
			<xsl:if test="GCl:GoodsName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование товара</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="GCl:GoodsName"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="GCl:GoodsDescription">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание товара</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="GCl:GoodsDescription"/></td>
				</tr>
			</xsl:if>
		</table>
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
