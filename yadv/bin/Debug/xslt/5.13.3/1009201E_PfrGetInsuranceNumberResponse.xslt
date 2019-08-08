<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:inres="urn:customs.ru:Information:SQDocuments:PfrGetInsuranceNumberResponse:5.13.3">
 <!-- Шаблон для типа PfrGetInsuranceNumberResponseType -->
<xsl:template match="inres:PfrGetInsuranceNumberResponse">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Получение страхового номера застрахованного лица (ответ)</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><xsl:if test="inres:FIO"><div class="title marg-top">ФИО застрахованного лица</div></xsl:if><xsl:apply-templates select="inres:FIO" /><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата рождения</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="inres:birthDate" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Пол: M - мужской; F - женский</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="inres:gender=M"><xsl:text>мужской</xsl:text></xsl:when><xsl:when test="inres:gender=F"><xsl:text>женский</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="inres:gender" /></xsl:otherwise></xsl:choose></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата формирования</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="inres:formationDate" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Страховой номер</td><td class="value graphMain" style="width:50%"><xsl:value-of select="inres:insuranceNumber" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Количество двойников</td><td class="value graphMain" style="width:50%"><xsl:value-of select="inres:twinQuantity" /></td></tr></table><xsl:if test="inres:twin"><div class="title marg-top">Информация о двойнике</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Страховой номер</td><td class="graphMain bordered">Место рождения</td><td class="graphMain bordered">Удостоверяющий документ</td></tr><xsl:for-each select="inres:twin"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:if></div></body></html></xsl:template>

<!-- Шаблон для типа cat_ru:PersonBaseType -->
<xsl:template match="inres:FIO">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Фамилия</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonSurname" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Имя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonName" /></td></tr></table><xsl:if test="cat_ru:PersonMiddleName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Отчество</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonMiddleName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PersonPost"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Должность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonPost" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа RUScat_ru:RUAddressType -->
<xsl:template match="inres:birthPlace">
<xsl:if test="RUScat_ru:AddressKindCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Кодовое обозначение вида адреса</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AddressKindCode" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:PostalCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Почтовый индекс</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:PostalCode" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:CountryCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:CountryCode" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:CounryName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:CounryName" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:Region"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:Region" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:District"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:District" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:Town"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Город</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:Town" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:City"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Населенный пункт</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:City" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:StreetHouse"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:StreetHouse" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:House"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:House" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:Room"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:Room" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:AddressText"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AddressText" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:OKTMO"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:OKTMO" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:OKATO"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:OKATO" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:KLADR"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код КЛАДР</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:KLADR" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:AOGUID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AOGUID" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:AOID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:AOID" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:TerritoryCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:TerritoryCode" /></td></tr></table></xsl:if><xsl:if test="RUScat_ru:PostOfficeBoxId"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td><td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:PostOfficeBoxId" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа inres:IdentityDocumentType -->
<xsl:template match="inres:identityDocument">
<xsl:if test="cat_ru:IdentityCardCode"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardCode" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardSeries"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardSeries" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IdentityCardNumber" /></td></tr></table></xsl:if><xsl:if test="cat_ru:IdentityCardDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate" /></xsl:call-template></td></tr></table></xsl:if><xsl:if test="cat_ru:OrganizationName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationName" /></td></tr></table></xsl:if><xsl:if test="inres:serialLatin"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Серия римские цифры</td><td class="value graphMain" style="width:50%"><xsl:value-of select="inres:serialLatin" /></td></tr></table></xsl:if><xsl:if test="inres:serialRussian"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Серия русские буквы</td><td class="value graphMain" style="width:50%"><xsl:value-of select="inres:serialRussian" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа inres:twinType -->
<xsl:template match="inres:twin">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Страховой номер</td><td class="value graphMain" style="width:50%"><xsl:value-of select="inres:insuranceNumber" /></td></tr></table><xsl:if test="inres:birthPlace"></xsl:if><xsl:if test="inres:birthPlace"><div class="title marg-top">Место рождения</div></xsl:if><xsl:apply-templates select="inres:birthPlace" /><xsl:if test="inres:identityDocument"><div class="title marg-top">Удостоверяющий документ</div></xsl:if><xsl:apply-templates select="inres:identityDocument" /></xsl:template>

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