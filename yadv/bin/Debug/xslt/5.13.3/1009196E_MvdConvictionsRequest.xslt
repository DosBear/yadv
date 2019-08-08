<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mcreq="urn:customs.ru:Information:SQDocuments:MvdConvictionsRequest:5.13.2">
 <!-- Шаблон для типа MvdConvictionsRequestType -->
<xsl:template match="mcreq:MvdConvictionsRequest">
<html><head><style>
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Запрос сведений о наличии (отсутствии) судимости и (или) факта уголовного преследования либо о прекращении уголовного преследования, сведения о нахождении в розыске</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><xsl:if test="mcreq:RequestedPerson"><div class="title marg-top">ФИО лица, по которому запрашиваются сведения</div></xsl:if><xsl:apply-templates select="mcreq:RequestedPerson" /><xsl:if test="mcreq:BirthDate"><div class="title marg-top">Дата рождения лица (с возможностью выбрать неполную дату)</div></xsl:if><xsl:apply-templates select="mcreq:BirthDate" /><xsl:if test="mcreq:SNILS"><table class="w190"><tr><td class="annot graphMain" style="width:50%">СНИЛС</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcreq:SNILS" /></td></tr></table></xsl:if><xsl:if test="mcreq:BirthPlace"><div class="title marg-top">Сведения о месте рождения</div></xsl:if><xsl:apply-templates select="mcreq:BirthPlace" /><xsl:if test="mcreq:LivingPlace"><div class="title marg-top">Сведения о месте жительства</div></xsl:if><xsl:apply-templates select="mcreq:LivingPlace" /><xsl:if test="mcreq:PlaceOfStay"><div class="title marg-top">Сведения о месте пребвания</div></xsl:if><xsl:apply-templates select="mcreq:PlaceOfStay" /></div></body></html></xsl:template>

<!-- Шаблон для типа cat_ru:AddressType -->
<xsl:template match="mcreq:Address">
<xsl:if test="cat_ru:PostalCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Почтовый индекс</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PostalCode" /></td></tr></table></xsl:if><xsl:if test="cat_ru:CountryCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:CountryCode" /></td></tr></table></xsl:if><xsl:if test="cat_ru:CounryName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:CounryName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:Region"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:Region" /></td></tr></table></xsl:if><xsl:if test="cat_ru:City"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Населенный пункт</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:City" /></td></tr></table></xsl:if><xsl:if test="cat_ru:StreetHouse"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:StreetHouse" /></td></tr></table></xsl:if><xsl:if test="cat_ru:TerritoryCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:TerritoryCode" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа mcreq:BirthDateType -->
<xsl:template match="mcreq:BirthDate">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Год</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcreq:Year" /></td></tr></table><xsl:if test="mcreq:Month"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Месяц</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcreq:Month" /></td></tr></table></xsl:if><xsl:if test="mcreq:Day"><table class="w190"><tr><td class="annot graphMain" style="width:50%">День</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcreq:Day" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа mcreq:RegistrationType -->
<xsl:template match="mcreq:BirthPlace">
<xsl:if test="mcreq:RegionCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код региона места регистрации</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcreq:RegionCode" /></td></tr></table></xsl:if><xsl:if test="mcreq:Address"><div class="title marg-top">Адрес места регистрации</div></xsl:if><xsl:apply-templates select="mcreq:Address" /></xsl:template>

<!-- Шаблон для типа mcreq:RegistrationType -->
<xsl:template match="mcreq:LivingPlace">
<xsl:if test="mcreq:RegionCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код региона места регистрации</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcreq:RegionCode" /></td></tr></table></xsl:if><xsl:if test="mcreq:Address"><div class="title marg-top">Адрес места регистрации</div></xsl:if><xsl:apply-templates select="mcreq:Address" /></xsl:template>

<!-- Шаблон для типа mcreq:RegistrationType -->
<xsl:template match="mcreq:PlaceOfStay">
<xsl:if test="mcreq:RegionCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код региона места регистрации</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcreq:RegionCode" /></td></tr></table></xsl:if><xsl:if test="mcreq:Address"><div class="title marg-top">Адрес места регистрации</div></xsl:if><xsl:apply-templates select="mcreq:Address" /></xsl:template>

<!-- Шаблон для типа cat_ru:PersonBaseType -->
<xsl:template match="mcreq:RequestedPerson">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Фамилия</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonSurname" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Имя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonName" /></td></tr></table><xsl:if test="cat_ru:PersonMiddleName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Отчество</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonMiddleName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PersonPost"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Должность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonPost" /></td></tr></table></xsl:if></xsl:template>

<xsl:template name="russian_date">
	<xsl:param name="dateIn" />
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,6,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,1,4)" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>