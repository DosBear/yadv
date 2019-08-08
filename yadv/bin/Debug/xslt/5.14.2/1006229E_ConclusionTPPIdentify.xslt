<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.0" xmlns:contpp="urn:customs.ru:Information:CustomsDocuments:ConclusionTPPIdentify:5.14.0">
	<!-- Шаблон для типа ConclusionTPPIdentifyType -->
	<xsl:template match="contpp:ConclusionTPPIdentify">
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
									/*width: 190mm;*/
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm 10mm 10mm 20mm;
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
										<b>Заключение о содержании сырья и комплектующих в товарах, изготовленных (полученных) с использованием иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
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
					<xsl:if test="contpp:RegistrationNumber">
						<div class="title marg-top">Регистрационный номер заключения</div>
					</xsl:if>
					<xsl:apply-templates select="contpp:RegistrationNumber"/>
					<xsl:if test="contpp:OEZ_Resident">
						<div class="title marg-top">Заявитель /Резидент ОЭЗ</div>
					</xsl:if>
					<xsl:apply-templates select="contpp:OEZ_Resident"/>
					<xsl:if test="contpp:OEZ_Manufacturer">
						<div class="title marg-top">Производитель / Резидент ОЭЗ</div>
					</xsl:if>
					<xsl:apply-templates select="contpp:OEZ_Manufacturer"/>
					<xsl:if test="contpp:Activity">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Операции, совершаемые в отношении сырьевых товаров, комплектующих, упаковочных материалов</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="contpp:Activity">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="contpp:MethodIdentify">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Способ установления факта использования товаров при изготовлении готовой продукции</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="contpp:MethodIdentify">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="contpp:PersonIssue">
						<div class="title marg-top">Выдавшее должностное лицо</div>
					</xsl:if>
					<xsl:apply-templates select="contpp:PersonIssue"/>
					<div class="title marg-top">Товары спецификации</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Порядковый номер позиции</td>
								<!--td class="graphMain bordered">Готовая продукция</td>
								<td class="graphMain bordered">Использованное сырье</td-->
								<td class="graphMain bordered">Номер ДТ / ТД</td>
								<td class="graphMain bordered">Номер товара в ДТ / ТД</td>
								<td class="graphMain bordered">Документ основание владения, пользования и (или) распоряжения товарами</td>
								<td class="graphMain bordered">Статус товаров</td>
							</tr>
							<xsl:for-each select="contpp:Goods">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address| contpp:FactAddress">
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
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер телефона</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="cat_ru:Phone">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер факса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Fax"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер телекса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Telex"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="cat_ru:E_mail">
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
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="cat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardSeries"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
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
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="catESAD_cu:GoodsGroupQuantity">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа contpp:GoodsListType -->
	<xsl:template match="contpp:Goods">
		<tr align="center">
			<td class="bordered">1</td>
			<td class="bordered">2</td>
			<td class="bordered">3</td>
			<td class="bordered">4</td>
			<td class="bordered">5</td>
		</tr>
		<tr>
			<td class="graphMain bordered" rowspan="3">
				<xsl:value-of select="contpp:Position"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="contpp:GoodsDescription">
					<xsl:apply-templates select="contpp:GoodsDescription"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="contpp:GoodsNumeric"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="contpp:Ownership">
					<xsl:apply-templates select="contpp:Ownership"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="contpp:GoodsStatus='ИНТ'">
						<xsl:text>иностранные товары</xsl:text>
					</xsl:when>
					<xsl:when test="contpp:GoodsStatus='ТТС'">
						<xsl:text>товары Таможенного союза</xsl:text>
					</xsl:when>
					<xsl:when test="contpp:GoodsStatus='ОЭЗ'">
						<xsl:text>товары, полностью произведенные на территории ОЭЗ</xsl:text>
					</xsl:when>
					<xsl:when test="contpp:GoodsStatus='УПК'">
						<xsl:text>упаковка (кроме первичной)</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="contpp:GoodsStatus"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="4">
				<div class="title">Готовая продукция</div>
				<xsl:apply-templates select="contpp:Products"/>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="4">
				<div class="title">Использованное сырье</div>
				<xsl:apply-templates select="contpp:GoodsRaw"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="contpp:GoodsDescription">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:GoodsGroupInformationType -->
	<xsl:template match="contpp:GoodsGroupInformation">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:Manufacturer"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:TradeMark"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:GoodsMark"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:GoodsModel"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:GoodsMarking"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:GoodsStandard"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:GoodsSort"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:WoodSortiment"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:WoodKind"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:Dimensions"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="catESAD_cu:DateIssue"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:SerialNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catESAD_cu:GoodsGroupQuantity">
					<xsl:apply-templates select="catESAD_cu:GoodsGroupQuantity"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="contpp:GoodsQuantity">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа contpp:GoodsRawType -->
	<xsl:template match="contpp:GoodsRaw">
		<xsl:if test="contpp:GoodsTNVEDCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код товара по ТН ВЭД ЕАЭС </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="contpp:GoodsTNVEDCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Описание товара</td>
				<td class="graphMain value" style="width:50%">
					<xsl:for-each select="contpp:GoodsDescription">
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</table>
		<xsl:if test="contpp:GoodsGroupInformation">
			<div class="title marg-top">Характеристика товаров </div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Свед. о произв-ле</td>
						<td class="graphMain bordered">Тов. знак</td>
						<td class="graphMain bordered">Марка</td>
						<td class="graphMain bordered">Модель</td>
						<td class="graphMain bordered">Артикул</td>
						<td class="graphMain bordered">Стандарт</td>
						<td class="graphMain bordered">Сорт</td>
						<td class="graphMain bordered">Сортимента</td>
						<td class="graphMain bordered">Порода</td>
						<td class="graphMain bordered">Размеры</td>
						<td class="graphMain bordered">Дата вып.</td>
						<td class="graphMain bordered">Сер. №</td>
						<td class="graphMain bordered">Кол-во</td>
					</tr>
					<xsl:for-each select="contpp:GoodsGroupInformation">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="contpp:NetWeightQuantity">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Фискированная норма использования (кг) </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(contpp:NetWeightQuantity, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="contpp:GoodsQuantity">
			<div class="title marg-top">Фиксированная норма использования (ДЕИ)</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Количество товара в единице измерения</td>
						<td class="graphMain bordered">Условное обозначение единицы измерения</td>
						<td class="graphMain bordered">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td>
					</tr>
					<xsl:for-each select="contpp:GoodsQuantity">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="contpp:WeightMin">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Начало диапазона нормы использования (кг) </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(contpp:WeightMin, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="contpp:WeightMax">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Конец диапазона нормы использования (кг) </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(contpp:WeightMax, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="contpp:QuantityMin">
			<div class="title marg-top">Начало диапазона нормы использования (ДЕИ) </div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Количество товара в единице измерения</td>
						<td class="graphMain bordered">Условное обозначение единицы измерения</td>
						<td class="graphMain bordered">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td>
					</tr>
					<xsl:for-each select="contpp:QuantityMin">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="contpp:QuantityMax">
			<div class="title marg-top">Конец диапазона нормы использования (ДЕИ) </div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Количество товара в единице измерения</td>
						<td class="graphMain bordered">Условное обозначение единицы измерения</td>
						<td class="graphMain bordered">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td>
					</tr>
					<xsl:for-each select="contpp:QuantityMax">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа contpp:OEZ_RezidentType -->
	<xsl:template match="contpp:OEZ_Manufacturer| contpp:OEZ_Resident">
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
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="cat_ru:Address">
			<div class="title marg-top">Адрес организации</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Address"/>
		<xsl:if test="cat_ru:IdentityCard">
			<div class="title marg-top">Документ, удостоверяющий личность</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:IdentityCard"/>
		<xsl:if test="cat_ru:Contact">
			<div class="title marg-top">Контактная информация</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Contact"/>
		<xsl:if test="contpp:OEZ_ResidentCertif">
			<div class="title marg-top">Свидетельство, удостоверяющее регистрацию лица в качестве резидента ОЭЗ</div>
		</xsl:if>
		<xsl:apply-templates select="contpp:OEZ_ResidentCertif"/>
		<xsl:if test="contpp:FactAddress">
			<div class="title marg-top">Фактический адрес организации</div>
		</xsl:if>
		<xsl:apply-templates select="contpp:FactAddress"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="contpp:OEZ_ResidentCertif| contpp:Ownership">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="contpp:PersonIssue">
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
		<xsl:if test="cat_ru:IssueDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата подписания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа contpp:GoodsInfoType -->
	<xsl:template match="contpp:Products">
		<xsl:if test="contpp:GoodsTNVEDCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код товара по ТН ВЭД ЕАЭС  </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="contpp:GoodsTNVEDCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Описание товара</td>
				<td class="graphMain value" style="width:50%">
					<xsl:for-each select="contpp:GoodsDescription">
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</table>
		<xsl:if test="contpp:NetWeightQuantity">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вес товара </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(contpp:NetWeightQuantity, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="contpp:GoodsGroupInformation">
			<div class="title marg-top">Характеристика товаров </div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Свед. о произв-ле</td>
						<td class="graphMain bordered">Тов. знак</td>
						<td class="graphMain bordered">Марка</td>
						<td class="graphMain bordered">Модель</td>
						<td class="graphMain bordered">Артикул</td>
						<td class="graphMain bordered">Стандарт</td>
						<td class="graphMain bordered">Сорт</td>
						<td class="graphMain bordered">Сортимента</td>
						<td class="graphMain bordered">Порода</td>
						<td class="graphMain bordered">Размеры</td>
						<td class="graphMain bordered">Дата вып.</td>
						<td class="graphMain bordered">Сер. №</td>
						<td class="graphMain bordered">Кол-во</td>
					</tr>
					<xsl:for-each select="contpp:GoodsGroupInformation">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="contpp:GoodsQuantity">
			<div class="title marg-top">Количество товара </div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Количество товара в единице измерения</td>
						<td class="graphMain bordered">Условное обозначение единицы измерения</td>
						<td class="graphMain bordered">Код единицы измерения в соответствии с единицами измерения, применяемыми в ТН ВЭД ЕАЭС</td>
					</tr>
					<xsl:for-each select="contpp:GoodsQuantity">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="contpp:QuantityMin| contpp:QuantityMax">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа contpp:RegistrationNumberType -->
	<xsl:template match="contpp:RegistrationNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак территориальной торгово-промышленной палаты, которая выдала Заключение</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="contpp:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="contpp:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="contpp:Number"/>
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
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
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
