<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:IntPr="urn:customs.ru:IntellectualProperty:5.13.3">
	<!-- Шаблон для типа IntellectualPropertyType -->
	<xsl:template match="IntPr:IntellectualProperty">
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
									<font size="4"><b>Заявление на оказание услуги<br/>
									"ВЕДЕНИЕ РЕЕСТРА ОБЪЕКТОВ ИНТЕЛЛЕКТУАЛЬНОЙ СОБСТВЕННОСТИ"</b></font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="IntPr:ApplicationInfo">
						<div class="title marg-top">СВЕДЕНИЯ О ЗАЯВКЕ</div>
						<xsl:apply-templates select="IntPr:ApplicationInfo"/>
					</xsl:if>
					<xsl:if test="IntPr:Applicant">
						<div class="title marg-top">СВЕДЕНИЯ О ЗАЯВИТЕЛЕ</div>
						<xsl:apply-templates select="IntPr:Applicant"/>
					</xsl:if>
					<xsl:if test="IntPr:ApplicationForm">
						<div class="title marg-top">ЗАЯВЛЕНИЕ</div>
						<xsl:apply-templates select="IntPr:ApplicationForm"/>
					</xsl:if>
					<xsl:if test="IntPr:AppliedDocument">
						<div class="title marg-top">ВЛОЖЕНИЯ<br/></div>
						<table class="bordered w190">
							<tbody>
								<tr class="title" bgcolor="#e3e3e3" valign="middle">
									<td class="graphMain bordered" width="25%">Имя файла документа</td>
									<td class="graphMain bordered" width="7%">Номер файла</td>
									<td class="graphMain bordered" width="8%">Расширение файла</td>
									<td class="graphMain bordered" width="20%">Файл в формате base64</td>
									<td class="graphMain bordered" width="40%">Примечание</td>
								</tr>
								<xsl:for-each select="IntPr:AppliedDocument"><xsl:apply-templates select="."/></xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address | IntPr:LegalLocation | IntPr:PostalLocation">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
		<!--xsl:if test="cat_ru:PostalCode">
			<tr>
				<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PostalCode"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">
			<tr>
				<td class="annot graphMain" style="width:50%">Страна в соответствии с классификатором стран мира</td>
				<td class="value graphMain" style="width:50%">
					<xsl:if test="cat_ru:CountryCode"><xsl:value-of select="cat_ru:CountryCode"/><xsl:text> </xsl:text></xsl:if>
					<xsl:if test="cat_ru:CounryName"><xsl:value-of select="cat_ru:CounryName"/></xsl:if>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<tr>
				<td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:Region"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<tr>
				<td class="annot graphMain" style="width:50%">Населенный пункт</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:City"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<tr>
				<td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:StreetHouse"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">
			<tr>
				<td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:TerritoryCode"/></td>
			</tr>
		</xsl:if-->
	</xsl:template>
<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact| RUScat_ru:CommunicationDetails">
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
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="cat_ru:IdentityCard| RUScat_ru:IdentityCard">
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
	<xsl:template match="RUScat_ru:SubjectAddressDetails | IntPr:PersonPostalAddress">
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
<!-- Шаблон для типа cat_ru:ITNKZType -->
<xsl:template match="cat_ru:ITN">
	<xsl:text> (Код категория лица: </xsl:text>
	<xsl:value-of select="cat_ru:CategoryCode" />
	<xsl:text> Код КАТО: </xsl:text>
	<xsl:value-of select="cat_ru:KATOCode" />
	<xsl:if test="cat_ru:RNN">
		<xsl:text> РНН: </xsl:text>
		<xsl:value-of select="cat_ru:RNN" />
	</xsl:if>
	<xsl:if test="cat_ru:ITNReserv">
		<xsl:text> Резерв: </xsl:text>
		<xsl:value-of select="cat_ru:ITNReserv" />
	</xsl:if>
	<xsl:text>)</xsl:text>
</xsl:template>
<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
<xsl:template match="cat_ru:KGOrganizationFeatures">
	<xsl:if test="cat_ru:KGINN">
		<xsl:text>ИНН/ПИН: </xsl:text>
		<xsl:value-of select="cat_ru:KGINN" />
	</xsl:if>
	<xsl:if test="cat_ru:KGOKPO">
		<xsl:text> ОКПО: </xsl:text>
		<xsl:value-of select="cat_ru:KGOKPO" />
	</xsl:if>
</xsl:template>
<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
<xsl:template match="cat_ru:RAOrganizationFeatures">
	<xsl:if test="cat_ru:UNN">
		<xsl:text>УНН: </xsl:text>
		<xsl:value-of select="cat_ru:UNN" />
	</xsl:if>
	<xsl:if test="cat_ru:SocialServiceNumber">
		<xsl:text> НЗОУ: </xsl:text>
		<xsl:value-of select="cat_ru:SocialServiceNumber" />
	</xsl:if>
	<xsl:if test="cat_ru:SocialServiceCertificate">
		<xsl:text> Номер справки об отсутствии НЗОУ: </xsl:text>
		<xsl:value-of select="cat_ru:SocialServiceCertificate" />
	</xsl:if>
</xsl:template>
<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
<xsl:template match="cat_ru:RBOrganizationFeatures">
	<xsl:if test="cat_ru:UNP">
		<xsl:text>УНП: </xsl:text>
		<xsl:value-of select="cat_ru:UNP" />
	</xsl:if>
	<xsl:if test="cat_ru:RBIdentificationNumber">
		<xsl:text> Идентификационный номер физического лица: </xsl:text>
		<xsl:value-of select="cat_ru:RBIdentificationNumber" />
	</xsl:if>
</xsl:template>
<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
<xsl:template match="cat_ru:RFOrganizationFeatures">
	<xsl:if test="cat_ru:OGRN">
		<xsl:text>ОГРН/ОГРНИП: </xsl:text>
		<xsl:value-of select="cat_ru:OGRN" />
	</xsl:if>
	<xsl:if test="cat_ru:INN">
		<xsl:text> ИНН: </xsl:text>
		<xsl:value-of select="cat_ru:INN" />
	</xsl:if>
	<xsl:if test="cat_ru:KPP">
		<xsl:text> КПП: </xsl:text>
		<xsl:value-of select="cat_ru:KPP" />
	</xsl:if>
</xsl:template>
<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
<xsl:template match="cat_ru:RKOrganizationFeatures">
	<xsl:if test="cat_ru:BIN">
		<xsl:text>БИН: </xsl:text>
		<xsl:value-of select="cat_ru:BIN" />
	</xsl:if>
	<xsl:if test="cat_ru:IIN">
		<xsl:text> ИИН: </xsl:text>
		<xsl:value-of select="cat_ru:IIN" />
	</xsl:if>
	<xsl:if test="cat_ru:ITN">
		<xsl:text> Идентификационный таможенный номер: </xsl:text>
		<xsl:apply-templates select="cat_ru:ITN" />
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
<!-- Шаблон для типа IntPr:ApplicantType -->
	<xsl:template match="IntPr:Applicant | IntPr:OwnerInfo | IntPr:AgentInfo | IntPr:ChangeOwnerInfo | IntPr:ChangeAgentInfo | IntPr:Importer | IntPr:Contact | IntPr:OrganizationInfo">
		<table class="w190">
			<xsl:if test="cat_ru:OrganizationName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationName"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:ShortName"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationLanguage">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Российской Федерации</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cat_ru:RFOrganizationFeatures" /></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Республики Казахстан</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cat_ru:RKOrganizationFeatures" /></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Республики Беларусь</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cat_ru:RBOrganizationFeatures" /></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Республики Армения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cat_ru:RAOrganizationFeatures" /></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Кыргызской Республики</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cat_ru:KGOrganizationFeatures" /></td>
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
		</table>
		<!--xsl:if test="cat_ru:Address">
			<table>	
				<tr><td class="annot graphMain" colspan="2"><br/><u>Адрес организации:</u></td></tr>
				<xsl:apply-templates select="cat_ru:Address"/>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCard">
			<table>
				<tr><td class="annot graphMain" colspan="2"><br/><u>Документ, удостоверяющий личность:</u></td></tr>
				<xsl:apply-templates select="cat_ru:IdentityCard"/>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Contact">
			<table>
				<tr><td class="annot graphMain" colspan="2"><br/><u>Контактная информация:</u></td></tr>
				<xsl:apply-templates select="cat_ru:Contact"/>
			</table>				
		</xsl:if-->
		<xsl:choose>
			<xsl:when test="name(.)='IntPr:Contact'">
				<table class="w190">
					<xsl:if test="IntPr:WebSite">
						<tr>
							<td class="annot graphMain" style="width:50%">Интернет-сайт</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:WebSite"/></td>
						</tr>
					</xsl:if>
				</table>
				<div><u>Сведения о доверенности, выданной контактному лицу, документах передоверия и нотариальном удостоверии:</u><br/><i>Код документа = 26</i></div>
				<table class="bordered w190">
					<tbody>
						<xsl:call-template name="headtabl"/>
						<xsl:for-each select="IntPr:InfoContactPersonDoc">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:when>
			<xsl:when test="name(.)='IntPr:OrganizationInfo'">
				<table class="w190">
					<tr><td class="annot graphMain" colspan="2"><br/><u>Сведения об организации:</u></td></tr>
					<tr>
						<td class="annot graphMain" style="width:50%">Тип организации</td>
						<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:OrganizationKind"/></td>
					</tr>	
					<tr>
						<td class="annot graphMain" style="width:50%">Код типа организации</td>
						<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:OrganizationKindCode"/></td>
					</tr>
				</table>
				<xsl:if test="IntPr:InfoLisenceDoc">
					<div><br/><u>Сведения о лицензионном договоре:</u></div>
					<table class="bordered w190">
						<tbody>
							<xsl:call-template name="headtabl"/>
							<xsl:for-each select="IntPr:InfoLisenceDoc">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>	
				<div><br/><u>Сведения о документе, подтверждающем согласие правообладателя на введение товаров в гражданский оборот:</u><br/><i>Код документа=25</i></div>
				<table class="bordered w190">
					<tbody>
						<xsl:call-template name="headtabl"/>
						<xsl:for-each select="IntPr:InfoAgreementDoc">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="IntPr:PersonType or IntPr:PersonID">
					<table>
						<tr><td class="annot graphMain" colspan="2"><br/></td></tr>
						<xsl:if test="IntPr:PersonType">
							<tr>
								<td class="annot graphMain" style="width:50%">Тип заявителя/правообладателя</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="IntPr:PersonType='01'"><xsl:text>ФЛ</xsl:text></xsl:when>
										<xsl:when test="IntPr:PersonType='02'"><xsl:text>ЮЛ</xsl:text></xsl:when>
										<xsl:when test="IntPr:PersonType='03'"><xsl:text>ТП</xsl:text></xsl:when>
										<xsl:when test="IntPr:PersonType='04'"><xsl:text>ИГ</xsl:text></xsl:when>
										<xsl:when test="IntPr:PersonType='05'"><xsl:text>ИЮЛ</xsl:text></xsl:when>
										<xsl:otherwise><xsl:value-of select="IntPr:PersonType"/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="IntPr:PersonID">
							<tr>
								<td class="annot graphMain" style="width:50%">Идентификатор Заявителя/правообладателя</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:PersonID"/></td>
							</tr>
						</xsl:if>
					</table>			
				</xsl:if>
				<xsl:if test="IntPr:BirthDate or IntPr:BirthPlace or IntPr:PersonPostalAddress">
					<table>
						<tr><td class="annot graphMain" colspan="2"><br/><u>Указывается для ФЛ/ИП:</u></td></tr>
						<xsl:if test="IntPr:BirthDate">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата рождения</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="IntPr:BirthDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="IntPr:BirthPlace">
							<tr>
								<td class="annot graphMain" style="width:50%">Место рождения</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:BirthPlace"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="IntPr:PersonPostalAddress">
							<tr>
								<td class="annot graphMain" style="width:50%">Почтовый адрес</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="IntPr:PersonPostalAddress"/></td>
							</tr>
						</xsl:if>
					</table>			
				</xsl:if>
				<table>
					<xsl:if test="IntPr:PlaceWork">
						<tr>
							<td class="annot graphMain" style="width:50%">Место работы (наименование организации)</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:PlaceWork"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="IntPr:PersonPost">
						<tr>
							<td class="annot graphMain" style="width:50%">Должность</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:PersonPost"/></td>
						</tr>
					</xsl:if>
				</table>	
				<xsl:if test="IntPr:ConfidenceInfo">
					<div><br/><u>Документ, подтверждающий полномочия законного представителя</u></div>
					<table class="bordered w190">
						<tbody>
							<xsl:call-template name="headtabl"/>
							<xsl:apply-templates select="IntPr:ConfidenceInfo"/>
						</tbody>
					</table>
				</xsl:if>
				<xsl:if test="IntPr:RightHolderLegal">
					<div><br/><u>Сведения о юридическом лице</u></div>
					<xsl:apply-templates select="IntPr:RightHolderLegal"/>
				</xsl:if>
				<xsl:if test="IntPr:RightHolderForeignLegal">
					<div><br/><u>Сведения о иностранном юридическом лице</u></div>
					<xsl:apply-templates select="IntPr:RightHolderForeignLegal"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа IntPr:ApplicationFormType -->
	<xsl:template match="IntPr:ApplicationForm">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип заявления</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="IntPr:ApplicationCode='01'"><xsl:text>включение в реестр</xsl:text></xsl:when>
						<xsl:when test="IntPr:ApplicationCode='02'"><xsl:text>внесение изменений</xsl:text></xsl:when>
						<xsl:when test="IntPr:ApplicationCode='03'"><xsl:text>исключение</xsl:text></xsl:when>
						<xsl:when test="IntPr:ApplicationCode='04'"><xsl:text>предоставление выписки</xsl:text></xsl:when>
						<xsl:otherwise><xsl:value-of select="IntPr:ApplicationCode"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<xsl:if test="IntPr:NumReestr">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер объекта интеллектуальной собственности</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:NumReestr"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:Base">
				<tr>
					<td class="annot graphMain" style="width:50%">Суть обращения</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:Base"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:PeriodTill">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о предполагаемом сроке принятия мер, связанных с приостановлением выпуска товаров</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="IntPr:PeriodTill"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:PeriodStartDate or IntPr:PeriodEndDate">
				<tr>
					<td class="annot graphMain" style="width:50%">Срок принятия мер, связанных с приостановлением выпуска товаров</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="IntPr:PeriodStartDate">
							<xsl:text>с </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="IntPr:PeriodStartDate"/>
							</xsl:call-template>
							<xsl:text> </xsl:text>
						</xsl:if>	
						<xsl:if test="IntPr:PeriodEndDate">
							<xsl:text>по </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="IntPr:PeriodEndDate"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
		</table>	
		<xsl:if test="IntPr:OwnerInfo">
			<div class="title marg-top"><u>Сведения о правообладателях:</u></div>
			<xsl:variable name="kolvo"><xsl:value-of select="count(IntPr:OwnerInfo)"/></xsl:variable>	
			<xsl:for-each select="IntPr:OwnerInfo">
				<xsl:if test="$kolvo &gt; 1">
					<div class="title marg-top">Правообладатель № <xsl:value-of select="position()"/></div>
				</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="IntPr:AgentInfo">
			<div class="title marg-top"><u>Сведения о представителе правообладателя:</u></div>
			<xsl:apply-templates select="IntPr:AgentInfo"/>
		</xsl:if>
		<xsl:if test="IntPr:ChangeOwnerInfo">
			<div class="title marg-top"><u>Сведения о правообладателях, подлежащие изменению:</u></div>
			<xsl:variable name="kolvo"><xsl:value-of select="count(IntPr:ChangeOwnerInfo)"/></xsl:variable>	
			<xsl:for-each select="IntPr:ChangeOwnerInfo">
				<xsl:if test="$kolvo &gt; 1">
					<div class="title marg-top">Правообладатель, подлежащий изменению № <xsl:value-of select="position()"/></div>
				</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="IntPr:ChangeAgentInfo">
			<div class="title marg-top"><u>Сведения о представителе правообладателя, подлежащие изменению:</u></div>
			<xsl:apply-templates select="IntPr:ChangeAgentInfo"/>
		</xsl:if>
		<xsl:if test="IntPr:IntellectualPropertyObjectsInfo">
			<div class="title marg-top"><u>Сведения об объектах интеллектуальной собственности:</u><br/></div>
			<table class="bordered w190">
				<tbody>
					<xsl:for-each select="IntPr:IntellectualPropertyObjectsInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:Contact">
			<div class="title marg-top"><u>Сведения о контактных лицах, уполномоченных на основании доверенности, выданной правообладателем, оказывать квалифицированную помощь<br/>таможенным органам:</u></div>
            <xsl:apply-templates select="IntPr:Contact"/>
		</xsl:if>
		<xsl:if test="IntPr:OrganizationInfo">
			<div class="title marg-top"><u>Сведения о лицензиатах, сублицензиатах, об уполномоченных импортерах:</u></div>
			<xsl:variable name="kolvo"><xsl:value-of select="count(IntPr:OrganizationInfo)"/></xsl:variable>	
			<xsl:for-each select="IntPr:OrganizationInfo">
				<xsl:if test="$kolvo &gt; 1">
					<div class="title marg-top">Лицензиат / Сублицензиат / Уполномоченный импортер № <xsl:value-of select="position()"/></div>
				</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="IntPr:InfoCommitment">
			<div class="title marg-top"><u>Сведения о письменном обязательстве правообладателя о возмещении имущественного вреда:</u></div>
            <table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Общая сумма обеспечения</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(IntPr:InfoCommitment/IntPr:SumCommitment, '.', ',')"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:InfoSecuringCommitments">
			<div class="title marg-top"><u>Сведения об обеспечении обязательства</u></div>
			<table class="w190">
				<tbody>
					<xsl:call-template name="headtabl"/>
					<xsl:for-each select="IntPr:InfoSecuringCommitments">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:Exception">
			<div class="title marg-top"><u>Сведения о решении о принятии мер, связанных с приостановкой выпуска объекта:</u><br/><i>Код документа=27</i></div>
			<table class="w190">
				<tbody>
					<xsl:call-template name="headtabl"/>
					<xsl:apply-templates select="IntPr:Exception"/>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:InfringingMerchandise">
			<div class="title marg-top"><u>Сведения о товарах, обладающих признаками контрафактных:</u></div>
			<xsl:for-each select="IntPr:InfringingMerchandise">
				<table class="bordered w190">
					<tbody>
						<tr class="title" bgcolor="silver">
							<td class="annot graphMain">Сведения о легальной продукции</td>
						</tr>
						<tr>
							<td><xsl:apply-templates select="IntPr:LegalProduct"/><br/></td>
						</tr>
					</tbody>
				</table>
				<table class="bordered w190">
					<tbody>
						<tr class="title" bgcolor="silver">
							<td class="annot graphMain">Сведения о продукции, обладающей признаками контрафактной</td>
						</tr>
						<tr>
							<td><xsl:apply-templates select="IntPr:BogusProduct"/><br/></td>
						</tr>
					</tbody>
				</table>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="IntPr:ObjectInfo">
			<div class="title marg-top">Сведения об объекте, на который запрашивается выписка</div>
            <xsl:apply-templates select="IntPr:ObjectInfo"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа IntPr:ApplicationInfoType -->
	<xsl:template match="IntPr:ApplicationInfo">
		<table class="w190">
			<xsl:if test="cat_ru:PrDocumentName or cat_ru:PrDocumentNumber or cat_ru:PrDocumentDate">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="cat_ru:PrDocumentName"><xsl:value-of select="cat_ru:PrDocumentName"/><xsl:text> </xsl:text></xsl:if>
						<xsl:if test="cat_ru:PrDocumentNumber">№ <xsl:value-of select="cat_ru:PrDocumentNumber"/> </xsl:if>
						<xsl:if test="cat_ru:PrDocumentDate"> от 
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</xsl:if>	
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор заявления на ЕПГУ</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:ApplicationSourceSystemID"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор заявки в АПС "Электронные Госуслуги"</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:ApplicationID"/></td>
			</tr>
			<xsl:if test="IntPr:DepartmentCode">
				<xsl:apply-templates select="IntPr:DepartmentCode"/>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа IntPr:AppliedDocumentType -->
	<xsl:template match="IntPr:AppliedDocument">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:Name"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:Number"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:Expansion"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:Base"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:Description"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа IntPr:CopyrightType -->
	<xsl:template match="IntPr:Copyright">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:30%">Наименование объекта</td>
				<td class="value graphMain" style="width:70%"><xsl:value-of select="IntPr:ProductName"/></td>
			</tr>
			<xsl:if test="IntPr:ProductForm">
				<tr>
					<td class="annot graphMain" style="width:30%">Форма произведения</td>
					<td class="value graphMain" style="width:70%"><xsl:value-of select="IntPr:ProductForm"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:ProductType">
				<tr>
					<td class="annot graphMain" style="width:30%">Вид произведения</td>
					<td class="value graphMain" style="width:70%"><xsl:value-of select="IntPr:ProductType"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:30%">Описание объекта</td>
				<td class="value graphMain" style="width:70%"><xsl:value-of select="IntPr:ObjectDescription"/></td>
			</tr>
		</table>
		<xsl:if test="IntPr:InfoDocument">
			<div class="title marg-top">Сведения о документах, подтверждающих наличие прав</div>
			<table class="bordered w190">
				<tbody>
					<xsl:call-template name="headtabl"/>
					<xsl:for-each select="IntPr:InfoDocument">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:InfoDocRightsTransmission">
			<div class="title marg-top">Сведения о документах на передачу прав</div>
			<table class="bordered w190">
				<tbody>
					<xsl:call-template name="headtabl"/>
					<xsl:for-each select="IntPr:InfoDocRightsTransmission">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:InfoAgreementDoc">
			<div class="title marg-top">Сведения о документах, подтверждающих введение товаров, содержащих объекты авторского права, в гражданский оборот на территории РФ</div>
			<table class="bordered w190">
				<tbody>
					<xsl:call-template name="headtabl"/>
					<xsl:for-each select="IntPr:InfoAgreementDoc">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:Goods">
			<div class="title marg-top">Перечень товаров
				<xsl:if test="IntPr:Goods/IntPr:ObjType">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="IntPr:Goods/IntPr:ObjType"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</div>
			<xsl:apply-templates select="IntPr:Goods"/>
		</xsl:if>
		<br/>
	</xsl:template>
<!-- Шаблон для шапки таблицы документов -->
	<xsl:template name="headtabl">
		<tr class="title" bgcolor="#e3e3e3" valign="middle">
			<td class="graphMain bordered" rowspan="2">Наименование документа</td>
			<td class="graphMain bordered" colspan="3">Сведения о договоре страхования</td>
			<td class="graphMain bordered" colspan="8">Государственная регистрации договора / Документ, подтверждающий предоставление права пользования наименованием места происхождения товара</td>
		</tr>
		<tr class="title" bgcolor="#e3e3e3" valign="middle">
			<td class="graphMain bordered">Наименование документа</td>
			<td class="graphMain bordered">Сумма</td>
			<td class="graphMain bordered">Валюта</td>
			<td class="graphMain bordered">Код документа</td>
			<td class="graphMain bordered">Номер</td>
			<td class="graphMain bordered">Дата</td>
			<td class="graphMain bordered">Регистрационный номер объекта</td>
			<td class="graphMain bordered">Дата окончания полномочий</td>
			<td class="graphMain bordered">Кем выдан документ</td>
			<td class="graphMain bordered">Лицензиат (сублицензиат)</td>
			<td class="graphMain bordered">ФИО нотариуса</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа IntPr:CountryType -->
	<xsl:template match="IntPr:CountryInfo">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:CountryName"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:CountryCode"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:Priznac"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="IntPr:DepartmentCode">
		<tr>
			<td class="annot graphMain" style="width:50%">Таможенный орган, в который предоставляется заявка</td>
			<td class="value graphMain" style="width:50%">
				<xsl:value-of select="cat_ru:Code"/>
				<xsl:if test="cat_ru:OfficeName">
					<xsl:text> </xsl:text>
					<xsl:value-of select="cat_ru:OfficeName"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа IntPr:MeasuredGoodsList -->
	<xsl:template match="IntPr:Goods|IntPr:MeasuredGoodsList">
		<xsl:if test="name(.)='IntPr:MeasuredGoodsList'">
			<xsl:if test="IntPr:ObjType">
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:50%">Вид объекта</td>
						<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:ObjType"/></td>
					</tr>
				</table>
			</xsl:if>
			<div class="title marg-top">Описание товаров</div>
		</xsl:if>
		<table class="bordered w190">
			<tbody>
				<tr class="title" bgcolor="#e3e3e3">
					<td class="graphMain bordered">Наименование товара</td>
					<td class="graphMain bordered">Класс по МКТУ</td>
					<td class="graphMain bordered">Коды товаров, в соответствии с ТН ВЭД</td>
				</tr>
				<xsl:for-each select="IntPr:MeasuredGoods">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа IntPr:GoodsType -->
	<xsl:template match="IntPr:MeasuredGoods">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:GoodsName"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:GoodsClass"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:BogusProductCodes"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа IntPr:DocumentType -->
	<xsl:template match="IntPr:InfoDocument| IntPr:InfoDocRightsTransmission| IntPr:InfoAgreementDoc| IntPr:DocumentInfo| IntPr:InfoReg| IntPr:InfoContactPersonDoc| IntPr:InfoLisenceDoc| IntPr:InfoAgreementDoc| IntPr:InfoSecuringCommitments| IntPr:Exception| IntPr:ConfidenceInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:if test="cat_ru:PrDocumentName"><xsl:value-of select="cat_ru:PrDocumentName"/><xsl:text> </xsl:text></xsl:if>
				<xsl:if test="cat_ru:PrDocumentNumber">№ <xsl:value-of select="cat_ru:PrDocumentNumber"/><xsl:text> </xsl:text></xsl:if>
				<xsl:if test="cat_ru:PrDocumentDate">
					<xsl:text>от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
					</xsl:call-template>
				</xsl:if>
			</td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:InsuranceContract"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:TypeSecuringSum"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:TypeSecuringCurrency"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:PrDocumentNameCode"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:DocumentRegNumber"/></td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="IntPr:DocumentRegDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:ObjectRegNumber"/></td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="IntPr:ComplationAuthorityDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:IssuedAgent"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:LisenceeName"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:NotaryName"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа IntPr:IntellectualPropertyObjectsInfoType -->
	<xsl:template match="IntPr:IntellectualPropertyObjectsInfo">
		<tr class="title" bgcolor="silver">
			<td>Идентификатор объекта интелектуальной собственности: <xsl:value-of select="IntPr:IntellectualPropertyObjectsID"/></td>
		</tr>
		<xsl:if test="IntPr:Copyright">
			<tr class="title" bgcolor="silver"><td>Объект авторского и смежного права</td></tr>
			<tr><td><xsl:apply-templates select="IntPr:Copyright"/></td></tr>
		</xsl:if>
		<xsl:if test="IntPr:Mark">
			<tr class="title" bgcolor="silver"><td>Товарный знак</td></tr>
			<tr><td><xsl:apply-templates select="IntPr:Mark"/></td></tr>
		</xsl:if>
		<xsl:if test="IntPr:OriginPlace">
			<tr class="title" bgcolor="silver"><td>Место происхождения</td></tr>
			<tr><td><xsl:apply-templates select="IntPr:OriginPlace"/></td></tr>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа IntPr:ProductInfoType -->
	<xsl:template match="IntPr:LegalProduct|IntPr:BogusProduct">
		<xsl:if test="IntPr:ProductDescription">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание внешнего вида продукции</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:ProductDescription"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:BogusProductCodes">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Коды товаров, обладающих признаками контрафактных, не менее чем на уровне первых четырех знаков в соответствии с ТН ВЭД ЕАЭС</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:BogusProductCodes"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:OtherInfo">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Иные сведения</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:OtherInfo"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:Place">
			<div class="title marg-top">Места ввоза легальной продукции (01), таможенного оформления легальной продукции (02),<br/>ввоза товаров, обладающих признаками контрафактных (03), таможенного оформления товаров, обладающих признаками контрафактных (04)</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title" bgcolor="#e3e3e3">
						<td class="graphMain bordered">Наименование места</td>
						<td class="graphMain bordered">Код места</td>
					</tr>
					<xsl:for-each select="IntPr:Place">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:CountryInfo">
			<div class="title marg-top">Страна отправления легальной продукции (01), cтрана происхождения легальной продукции (02),<br/>cтрана отправления контрафактной продукции (03), cтрана происхождения контрафактной продукции (04)</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title" bgcolor="#e3e3e3">
						<td class="graphMain bordered">Наименование страны</td>
						<td class="graphMain bordered">Код страны</td>
						<td class="graphMain bordered">Код вида страны</td>
					</tr>
					<xsl:for-each select="IntPr:CountryInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:Importer">
			<div class="title marg-top"><u>Сведения об уполномоченных импортерах:</u></div>
			<xsl:variable name="kolvo"><xsl:value-of select="count(IntPr:Importer)"/></xsl:variable>	
			<xsl:for-each select="IntPr:Importer">
				<xsl:if test="$kolvo &gt; 1">
					<div class="title marg-top">Уполномоченный импортер № <xsl:value-of select="position()"/></div>
				</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			<br/>
		</xsl:if>
		<xsl:if test="IntPr:BogusProductImporters">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о импортерах</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:BogusProductImporters"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:ProductProdusers">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о производителях</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:ProductProdusers"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:PeriodDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Срок принятия мер, связанных с приостановлением выпуска товаров.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="IntPr:PeriodDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа IntPr:MarkType -->
	<xsl:template match="IntPr:Mark">
		<table class="w190">
			<xsl:if test="IntPr:BrandMarkName">
				<tr>
					<td class="annot graphMain" style="width:30%">Наименование товарного знака (знака обслуживания)</td>
					<td class="value graphMain" style="width:70%"><xsl:value-of select="IntPr:BrandMarkName"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:BrandMarkDescription">
				<tr>
					<td class="annot graphMain" style="width:30%">Описание товарного знака (знака обслуживания)</td>
					<td class="value graphMain" style="width:70%"><xsl:value-of select="IntPr:BrandMarkDescription"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:LapseOfRightDocumentsDescription">
				<tr>
					<td class="annot graphMain" style="width:30%">Описание документов</td>
					<td class="value graphMain" style="width:70%"><xsl:value-of select="IntPr:LapseOfRightDocumentsDescription"/></td>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="IntPr:Goods">
			<div class="title marg-top">Перечень товаров
				<xsl:if test="IntPr:Goods/IntPr:ObjType">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="IntPr:Goods/IntPr:ObjType"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</div>
			<xsl:apply-templates select="IntPr:Goods"/>
		</xsl:if>
		<xsl:if test="IntPr:DocumentInfo">
			<div class="title marg-top">Сведения о документе, подтверждающем регистрацию товарного знака (знака обслуживания) в соответствии с законодательством<br/>Российской Федерации и международными договорами, договоре об отчуждении исключительного права на товарный знак<br/>или об уступке товарного знака (при наличии), договоре коммерческой концессии (субконцессии)</div>
			<table class="bordered w190">
				<tbody>
					<xsl:call-template name="headtabl"/>
					<xsl:for-each select="IntPr:DocumentInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:TrademarkWithoutContract">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о переходе исключительного права на товарный знак без договора</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="IntPr:TrademarkWithoutContract">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:GoodsFlag">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Имеются сведения о товарах с нарушениями прав правообладателя и требуется защита таможенными органами</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="IntPr:GoodsFlag='true'"><xsl:text>есть</xsl:text></xsl:when>
							<xsl:otherwise><xsl:text>нет</xsl:text></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<br/>
	</xsl:template>
	<!-- Шаблон для типа IntPr:ObjectType -->
	<xsl:template match="IntPr:ObjectInfo">
		<table class="w190">
			<xsl:if test="IntPr:NumReestr">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер объекта интеллектуальной собственности в Реестре</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:NumReestr"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:Date">
				<tr>
					<td class="annot graphMain" style="width:50%">Срок принятия мер таможенными органами</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="IntPr:Date"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:ObjectName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование объекта</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:ObjectName"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:ObjectDescription">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание объекта</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:ObjectDescription"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Вид объекта</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:ObjType"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Код вида объекта</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:CodeObjType"/></td>
			</tr>
			<xsl:if test="IntPr:OwnerName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование правообладателя объекта</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:OwnerName"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:Base">
				<tr>
					<td class="annot graphMain" style="width:50%">Основание для запроса выписки из реестра</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:Base"/></td>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="IntPr:MeasuredGoodsList">
			<div class="title marg-top"><u>Перечень товаров, в отношении которых принимаются меры:</u></div>
		</xsl:if>
		<xsl:apply-templates select="IntPr:MeasuredGoodsList"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="IntPr:OrganizationHead">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="cat_ru:PersonName"/>&#160;
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="cat_ru:PersonPost">, <xsl:value-of select="cat_ru:PersonPost"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа IntPr:OriginPlaceType -->
	<xsl:template match="IntPr:OriginPlace">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование места происхождения</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:OriginName"/></td>
			</tr>
			<xsl:if test="IntPr:LapseOfRightDocumentsDescription">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание документов</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:LapseOfRightDocumentsDescription"/></td>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="IntPr:Goods">
			<div class="title marg-top">Перечень товаров
				<xsl:if test="IntPr:Goods/IntPr:ObjType">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="IntPr:Goods/IntPr:ObjType"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</div>	
			<xsl:apply-templates select="IntPr:Goods"/>	
		</xsl:if>
		<xsl:if test="IntPr:InfoReg">
			<div class="title marg-top">Сведения о документах, подтверждающих регистрацию и предоставление права пользования наименованием места происхождения в соответствии<br/>с законодательством Российской Федерации и международными договорами</div>
			<table class="bordered w190">
				<tbody>
					<xsl:call-template name="headtabl"/>
					<xsl:for-each select="IntPr:InfoReg">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:GoodsFlag">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Имеются сведения о товарах с нарушениями прав правообладателя и требуется защита таможенными органами</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="IntPr:GoodsFlag='true'"><xsl:text>есть</xsl:text></xsl:when>
							<xsl:otherwise><xsl:text>нет</xsl:text></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<br/>
	</xsl:template>
	<!-- Шаблон для типа IntPr:PlaceType -->
	<xsl:template match="IntPr:Place">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:Name"/></td>
			<td class="graphMain bordered"><xsl:value-of select="IntPr:CodePlace"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа IntPr:RightHolderLegalType -->
	<xsl:template match="IntPr:RightHolderLegal | IntPr:RightHolderForeignLegal">
		<table class="w190">
			<xsl:if test="IntPr:FNSDocumentSeries">
				<tr>
					<td class="annot graphMain" style="width:50%">Серия свидетельства о постановке на налоговый учет</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:FNSDocumentSeries"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:FNSDocumentNumber">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер свидетельства о постановке на налоговый учет</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:FNSDocumentNumber"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:INNCertificateDate">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата постановки на учет</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="IntPr:INNCertificateDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:OGRNDocumentNumber">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер свидетельства о постановке на налоговый учет</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:OGRNDocumentNumber"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:OGRNDocumentDate">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата постановки на учет</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="IntPr:OGRNDocumentDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:RegistrationNumber">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер государственной регистрации</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:RegistrationNumber"/></td>
				</tr>
			</xsl:if>
		</table>	
		<xsl:if test="IntPr:LegalLocation">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Юридический адрес</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="IntPr:LegalLocation"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:PostalLocation">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый адрес</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="IntPr:PostalLocation"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="IntPr:OrganizationHead">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения о руководителе</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="IntPr:OrganizationHead"/></td>
				</tr>
			</table>
		</xsl:if>		
		<table class="w190">
			<xsl:if test="IntPr:FullNameRus">
				<tr>
					<td class="annot graphMain" style="width:50%">Полное наименование на на русском языке</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:FullNameRus"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:ShortNameRus">
				<tr>
					<td class="annot graphMain" style="width:50%">Сокращенное наименование на русском языке</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:ShortNameRus"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:OPFRus">
				<tr>
					<td class="annot graphMain" style="width:50%">Организационно-правовая форма на русском языке</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:OPFRus"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:FullAddressRus">
				<tr>
					<td class="annot graphMain" style="width:50%">Полный адрес организации на русском языке</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:FullAddressRus"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:FullNameForeign">
				<tr>
					<td class="annot graphMain" style="width:50%">Полное наименование на иностранном языке (в латинской транскрипции)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:FullNameForeign"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:ShortNameForeign">
				<tr>
					<td class="annot graphMain" style="width:50%">Сокращенное наименование на иностранном языке (в латинской транскрипции)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:ShortNameForeign"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:OPFForeign">
				<tr>
					<td class="annot graphMain" style="width:50%">Организационно-правовая форма (в латинской транскрипции)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:OPFForeign"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:FullAddressForeign">
				<tr>
					<td class="annot graphMain" style="width:50%">Полный адрес организации (на иностранном языке)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:FullAddressForeign"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:DocRegistration">
				<tr>
					<td class="annot graphMain" style="width:50%">Документ о регистрации</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:DocRegistration"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:RegistrationOrganName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование органа, зарегистрировавшего организацию</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:RegistrationOrganName"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:RegistrationDocumentNumber">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа регистрации</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:RegistrationDocumentNumber"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:RegistrationDate">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="IntPr:RegistrationDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="IntPr:RegistrationPlace">
				<tr>
					<td class="annot graphMain" style="width:50%">Место регистрации</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="IntPr:RegistrationPlace"/></td>
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