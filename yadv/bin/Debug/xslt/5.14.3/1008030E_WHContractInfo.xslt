<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.14.3" xmlns:cltWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonLeafTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:whci="urn:customs.ru:Information:WarehouseDocuments:WHContractInfo:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа WHContractInfoType -->
	<xsl:template match="whci:WHContractInfo">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
									background: #ffffff;
									border: solid 1pt #000000;
									font-family: Arial;
									font-size: 9pt;
									}

									.marg-top
									{
									margin-top:5mm;
									}

									.marg-t1
									{
									margin-top:10mm;
									font-size: 11pt;
									}

									.marg-t2
									{
									margin-top:7mm;
									margin-bottom:2mm;
									font-size: 10pt;
									font-style: italic;
									}

									table
									{
									width: 100%;
									border: 0;
									empty-cells: show;
									border-collapse: collapse;
									margin-top: 1px;
									font-family: Arial;
									font-size: 9pt;
									}

									table.border tr td
									{
									border: 1px solid gray;
									}

									.graph {
									font-family: Arial;
									font-size: 9pt;
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
										<b>Информирование ТО о заключенном договоре на ВХ</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%"> Договор</td>
							<td class="value graphMain" style="width:50%">
								<xsl:text>№ </xsl:text>
								<xsl:value-of select="whci:Number"/>
								<xsl:text> от </xsl:text>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="whci:Date"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="whci:Participants">
						<div class="title marg-t1">Сведения о лицах, заключивших договор</div>
						<xsl:apply-templates select="whci:Participants"/>
					</xsl:if>
					<xsl:if test="whci:Details">
						<div class="title marg-t1">Подробности договора</div>
						<xsl:apply-templates select="whci:Details"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CategoryCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный  код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:KATOCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:RNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ITNReserv"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGINN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОКПО - общий идентификационный код предприятий, организаций и индивидуальных предпринимателей</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGOKPO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный  номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OGRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:INN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KPP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:BIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:ITN"/>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WarehouseCertificateType -->
	<xsl:template match="catWH_ru:ActualWarehouseLicense| catWH_ru:WarehouseLicense">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Вид документа, на основании которого осуществляет свою деятельность владелец склада</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="catWH_ru:CertificateKind"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер Свидетельства о включении в Реестр / Номер лицензии / Номер приказа о создании ЗТК</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="catWH_ru:CertificateNumber"/>
				</td>
			</tr>
		</table>
		<xsl:if test="catWH_ru:CertificateDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата документа, на основании которого разрешено хранение</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catWH_ru:CertificateDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WHAddressType -->
	<xsl:template match="catWH_ru:Address">
		<xsl:if test="cat_ru:PostalCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PostalCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CounryName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Region"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Населенный пункт</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:City"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:StreetHouse"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления (для Кыргызской Республики)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:TerritoryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catWH_ru:AddressLine">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация об адресе организации в виде одной строки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catWH_ru:AddressLine"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="catWH_ru:CarrierPerson| catWH_ru:WarehousePerson">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фамилия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonMiddleName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Отчество</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="catWH_ru:IdentityCard">
		<xsl:if test="RUScat_ru:IdentityCardCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:IdentityCardCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:IdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для организаций -->
	<xsl:template match="whci:Carrier| whci:Consignee| whci:WareHouseOwner">
		<xsl:if test="cat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ShortName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationLanguage"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="catWH_ru:CountryCode">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Цифровой код страны организации (по справочнику ОКСМ)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="catWH_ru:CountryCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="catWH_ru:Address">
			<div class="title marg-top">Адрес организации</div>
			<xsl:apply-templates select="catWH_ru:Address"/>
		</xsl:if>
		<xsl:if test="catWH_ru:IdentityCard">
			<div class="title marg-top">Документ, удостоверяющий личность получателя. Заполняется в случае, если получатель - физ. лицо</div>
			<xsl:apply-templates select="catWH_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="catWH_ru:CarrierPerson">
			<div class="title marg-top">Представитель перевозчика</div>
			<xsl:apply-templates select="catWH_ru:CarrierPerson"/>
		</xsl:if>
		<xsl:if test="catWH_ru:WarehouseLicense">
			<div class="title marg-top">Документ, на основании которого разрешено временное хранение</div>
			<xsl:apply-templates select="catWH_ru:WarehouseLicense"/>
		</xsl:if>
		<xsl:if test="catWH_ru:ActualWarehouseLicense">
			<div class="title marg-top">Действующий документ владельца СВХ</div>
			<xsl:apply-templates select="catWH_ru:ActualWarehouseLicense"/>
		</xsl:if>
		<xsl:if test="catWH_ru:WarehousePerson">
			<div class="title marg-top">Представитель СВХ</div>
			<xsl:apply-templates select="catWH_ru:WarehousePerson"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа whci:ContractDetailsType -->
	<xsl:template match="whci:Details">
		<xsl:if test="whci:LimitDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Срок действия договора</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="whci:LimitDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="whci:ProcurementPeriod">
			<div class="title marg-top">Планируемый период поставки</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Дата начала поставки</td>
						<td class="graphMain bordered">Дата окончания поставки</td>
					</tr>
					<xsl:for-each select="whci:ProcurementPeriod">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="whci:GoodsDescription">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание планируемых к помещению на ВХ товаров</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="whci:GoodsDescription">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="whci:KeepingConditions">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание особых условий временного хранения</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="whci:KeepingConditions">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="whci:OtherInfo">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Другая информация из договора, которая может (или должна) влиять на решение о возможности помещения грузов на склад и которую владелец склада (иного места) временного хранения считает необходимым довести до таможенного органа</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="whci:OtherInfo">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа whci:ParticipantsType -->
	<xsl:template match="whci:Participants">
		<xsl:if test="whci:WareHouseOwner">
			<div class="title marg-t2">Данные о владельце склада (иного места) временного хранения</div>
			<xsl:apply-templates select="whci:WareHouseOwner"/>
		</xsl:if>
		<xsl:if test="whci:Carrier">
			<div class="title marg-t2">Информация о перевозчике</div>
			<xsl:apply-templates select="whci:Carrier"/>
		</xsl:if>
		<xsl:if test="whci:Consignee">
			<div class="title marg-t2">Получатель</div>
			<xsl:apply-templates select="whci:Consignee"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа whci:ProcurementPeriodType -->
	<xsl:template match="whci:ProcurementPeriod">
		<tr>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="whci:StartDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="whci:FinishDate"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="catWH_ru:CertificateKind">
		<xsl:choose>
			<xsl:when test=".='lic_Certificate'">Свидетельство о включении в реестр владельцев СВХ</xsl:when>
			<xsl:when test=".='lic_Licence'">Лицензия владельца СВХ</xsl:when>
			<xsl:when test=".='lic_Permition'">Разрешение ТО на временное хранение в ином месте</xsl:when>
			<xsl:when test=".='lic_PermZtk'">ПЗТК</xsl:when>
			<xsl:when test=".='lic_TempZtk'">ВЗТК</xsl:when>
		</xsl:choose>
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
