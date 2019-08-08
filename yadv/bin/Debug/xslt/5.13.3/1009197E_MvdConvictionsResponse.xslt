<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mcres="urn:customs.ru:Information:SQDocuments:MvdConvictionsResponse:5.13.2">
 <!-- Шаблон для типа MvdConvictionsResponseType -->
<xsl:template match="mcres:MvdConvictionsResponse">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Ответ на запрос сведений о наличии (отсутствии) судимости и (или) факта уголовного преследования либо о прекращении уголовного преследования, сведения о нахождении в розыске</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><table class="w190"><tr><td class="annot graphMain" style="width:50%">Идентификатор элемента</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcres:ID" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Признак наличия сведений по запросу</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="mcres:DataFound='true'"><xsl:text>есть</xsl:text></xsl:when><xsl:otherwise><xsl:text>нет</xsl:text></xsl:otherwise></xsl:choose></td></tr></table><xsl:if test="mcres:Records"></xsl:if><xsl:if test="mcres:Records"><div class="title marg-top">Найденные сведения</div></xsl:if><xsl:apply-templates select="mcres:Records" /></div></body></html></xsl:template>

<!-- Шаблон для типа mcres:BirthDateType -->
<xsl:template match="mcres:BirthDate">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Год</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcres:Year" /></td></tr></table><xsl:if test="mcres:Month"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Месяц</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcres:Month" /></td></tr></table></xsl:if><xsl:if test="mcres:Day"><table class="w190"><tr><td class="annot graphMain" style="width:50%">День</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcres:Day" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа mcres:LegislationType -->
<xsl:template match="mcres:Cause">
<tr><td class="graphMain bordered"><xsl:apply-templates select="mcres:Code" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Article" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Part" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Paragraph" /></td></tr></xsl:template>

<!-- Шаблон для типа mcres:ChangingTermType -->
<xsl:template match="mcres:ChangingTerm">
<tr><td class="graphMain bordered"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mcres:Date" /></xsl:call-template></td><td class="graphMain bordered"><xsl:value-of select="mcres:Enforcer" /></td><td class="graphMain bordered"><div class="title marg-top">Период</div><table class="bordered w190"><tbody><tr class="title"><tr><td class="graphMain bordered">Годы</td><td class="graphMain bordered">Месяцы</td><td class="graphMain bordered">Дни</td><td class="graphMain bordered">Часы</td></tr></tr><xsl:for-each select="mcres:Period"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></td></tr></xsl:template>

<!-- Шаблон для типа mcres:ClassifierValueType -->
<xsl:template match="mcres:Code">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Код</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcres:Code" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Значение</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcres:Value" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mcres:LegalInfoType -->
<xsl:template match="mcres:Condemnation">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mcres:Date" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Орган</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcres:Enforcer" /></td></tr></table><div class="title marg-top">Основание</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Кодекс</td><td class="graphMain bordered">Статья</td><td class="graphMain bordered">Часть</td><td class="graphMain bordered">Пункт</td></tr><xsl:for-each select="mcres:Cause"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:template>

<!-- Шаблон для типа mcres:ConvictionType -->
<xsl:template match="mcres:Conviction">
<tr><td class="graphMain bordered"><xsl:apply-templates select="mcres:PersonalInfo" /></td><td class="graphMain bordered"><xsl:apply-templates select="mcres:Condemnation" /></td><td class="graphMain bordered"><div class="title marg-top">Наказание</div><table class="bordered w190"><tbody><tr class="title"><tr><td class="graphMain bordered">Вид наказания</td><td class="graphMain bordered">Штраф</td><td class="graphMain bordered">Временные показатели</td></tr></tr><xsl:for-each select="mcres:Judgement"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></td><td class="graphMain bordered"><xsl:if test="mcres:ReQualification"><div class="title marg-top">Переквалификация</div><table class="bordered w190"><tbody><tr class="title"><tr><td class="graphMain bordered">Дата переквалификации</td><td class="graphMain bordered">Орган</td><td class="graphMain bordered">Переквалификация с</td><td class="graphMain bordered">Переквалификация на</td></tr></tr><xsl:for-each select="mcres:ReQualification"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:if></td><td class="graphMain bordered"><xsl:if test="mcres:ChangingTerm"><div class="title marg-top">Изменение срока</div><table class="bordered w190"><tbody><tr class="title"><tr><td class="graphMain bordered">Дата</td><td class="graphMain bordered">Орган</td><td class="graphMain bordered">Период</td></tr></tr><xsl:for-each select="mcres:ChangingTerm"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:if></td><td class="graphMain bordered"><xsl:if test="mcres:Release"><xsl:apply-templates select="mcres:Release" /></xsl:if></td><td class="graphMain bordered"><xsl:value-of select="mcres:RemoveConvictionReasons" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:AdditionalInfo" /></td></tr></xsl:template>

<!-- Шаблон для типа mcres:LegalInfoType -->
<xsl:template match="mcres:Denial">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mcres:Date" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Орган</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcres:Enforcer" /></td></tr></table><div class="title marg-top">Основание</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Кодекс</td><td class="graphMain bordered">Статья</td><td class="graphMain bordered">Часть</td><td class="graphMain bordered">Пункт</td></tr><xsl:for-each select="mcres:Cause"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:template>

<!-- Шаблон для типа mcres:ExemptionMaterialType -->
<xsl:template match="mcres:ExemptionMaterial">
<tr><td class="graphMain bordered"><xsl:apply-templates select="mcres:PersonalInfo" /></td><td class="graphMain bordered"><xsl:apply-templates select="mcres:Denial" /></td><td class="graphMain bordered"><xsl:apply-templates select="mcres:Reason" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:AdditionalInfo" /></td></tr></xsl:template>

<!-- Шаблон для типа mcres:ImpeachmentType -->
<xsl:template match="mcres:Impeachment">
<tr><td class="graphMain bordered"><xsl:apply-templates select="mcres:PersonalInfo" /></td><td class="graphMain bordered"><xsl:apply-templates select="mcres:ImpeachmentInfo" /></td><td class="graphMain bordered"><xsl:apply-templates select="mcres:Judgment" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:AdditionalInfo" /></td></tr></xsl:template>

<!-- Шаблон для типа mcres:LegalInfoType -->
<xsl:template match="mcres:ImpeachmentInfo">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mcres:Date" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Орган</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcres:Enforcer" /></td></tr></table><div class="title marg-top">Основание</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Кодекс</td><td class="graphMain bordered">Статья</td><td class="graphMain bordered">Часть</td><td class="graphMain bordered">Пункт</td></tr><xsl:for-each select="mcres:Cause"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:template>

<!-- Шаблон для типа mcres:ClassifierValueType -->
<xsl:template match="mcres:InfoCenter">
<tr><td class="graphMain bordered"><xsl:value-of select="mcres:Code" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Value" /></td></tr></xsl:template>

<!-- Шаблон для типа mcres:JudgementType -->
<xsl:template match="mcres:Judgement">
<tr><td class="graphMain bordered"><xsl:value-of select="mcres:Type" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Fine" /></td><td class="graphMain bordered"><xsl:if test="mcres:Limit"><xsl:apply-templates select="mcres:Limit" /></xsl:if></td></tr></xsl:template>

<!-- Шаблон для типа mcres:DecisionType -->
<xsl:template match="mcres:Judgment">
<xsl:if test="mcres:Description"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Описание</td><td class="graphMain value" style="width:50%"><xsl:for-each select="mcres:Description"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table></xsl:if><xsl:if test="mcres:LegalInfo"><div class="title marg-top">Юридическая информация</div></xsl:if><xsl:apply-templates select="mcres:LegalInfo" /></xsl:template>

<!-- Шаблон для типа mcres:LegalInfoType -->
<xsl:template match="mcres:LegalInfo">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mcres:Date" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Орган</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcres:Enforcer" /></td></tr></table><div class="title marg-top">Основание</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Кодекс</td><td class="graphMain bordered">Статья</td><td class="graphMain bordered">Часть</td><td class="graphMain bordered">Пункт</td></tr><xsl:for-each select="mcres:Cause"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:template>

<!-- Шаблон для типа mcres:TimeType -->
<xsl:template match="mcres:Limit">
</xsl:template>

<!-- Шаблон для типа mcres:PeriodType -->
<xsl:template match="mcres:Period">
<tr><td class="graphMain bordered"><xsl:value-of select="mcres:Years" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Months" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Days" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Hours" /></td></tr></xsl:template>

<!-- Шаблон для типа cat_ru:PersonBaseType -->
<xsl:template match="mcres:PersonFIO">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Фамилия</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonSurname" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Имя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonName" /></td></tr></table><xsl:if test="cat_ru:PersonMiddleName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Отчество</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonMiddleName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PersonPost"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Должность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonPost" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа mcres:PersonalInfoType -->
<xsl:template match="mcres:PersonalInfo">
<xsl:if test="mcres:PersonFIO"><div class="title marg-top">ФИО</div></xsl:if><xsl:apply-templates select="mcres:PersonFIO" /><xsl:if test="mcres:BirthDate"><div class="title marg-top">Дата рождения лица (неполная дата)</div></xsl:if><xsl:apply-templates select="mcres:BirthDate" /><xsl:if test="mcres:BirthPlace"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Место рождения</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcres:BirthPlace" /></td></tr></table></xsl:if><div class="title marg-top">ИЦ</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Код</td><td class="graphMain bordered">Значение</td></tr><xsl:for-each select="mcres:InfoCenter"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:template>

<!-- Шаблон для типа mcres:ReQualificationType -->
<xsl:template match="mcres:ReQualification">
<tr><td class="graphMain bordered"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mcres:Date" /></xsl:call-template></td><td class="graphMain bordered"><xsl:value-of select="mcres:Enforcer" /></td><td class="graphMain bordered"><div class="title marg-top">Переквалификация с</div><table class="bordered w190"><tbody><tr class="title"><tr><td class="graphMain bordered">Кодекс</td><td class="graphMain bordered">Статья</td><td class="graphMain bordered">Часть</td><td class="graphMain bordered">Пункт</td></tr></tr><xsl:for-each select="mcres:RequalificationFrom"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></td><td class="graphMain bordered"><div class="title marg-top">Переквалификация на</div><table class="bordered w190"><tbody><tr class="title"><tr><td class="graphMain bordered">Кодекс</td><td class="graphMain bordered">Статья</td><td class="graphMain bordered">Часть</td><td class="graphMain bordered">Пункт</td></tr></tr><xsl:for-each select="mcres:RequalificationTo"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></td></tr></xsl:template>

<!-- Шаблон для типа mcres:ReasonType -->
<xsl:template match="mcres:Reason">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Описание причины</td><td class="graphMain value" style="width:50%"><xsl:for-each select="mcres:Description"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table><div class="title marg-top">Основание</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Кодекс</td><td class="graphMain bordered">Статья</td><td class="graphMain bordered">Часть</td><td class="graphMain bordered">Пункт</td></tr><xsl:for-each select="mcres:Cause"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:template>

<!-- Шаблон для типа mcres:RecordsType -->
<xsl:template match="mcres:Records">
<xsl:if test="mcres:Conviction"><div class="title marg-top">Судимость</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Персональные данные</td><td class="graphMain bordered">Осуждение</td><td class="graphMain bordered">Наказание</td><td class="graphMain bordered">Переквалификация</td><td class="graphMain bordered">Изменение срока</td><td class="graphMain bordered">Освобождение</td><td class="graphMain bordered">Основания для снятия судимости</td><td class="graphMain bordered">Дополнительные данные</td></tr><xsl:for-each select="mcres:Conviction"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:if><xsl:if test="mcres:Impeachment"><div class="title marg-top">Привлечение</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Персональные данные</td><td class="graphMain bordered">Данные по привлечению</td><td class="graphMain bordered">Решение</td><td class="graphMain bordered">Дополнительные данные</td></tr><xsl:for-each select="mcres:Impeachment"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:if><xsl:if test="mcres:Search"></xsl:if><xsl:if test="mcres:Search"><div class="title marg-top">Розыск</div></xsl:if><xsl:apply-templates select="mcres:Search" /><xsl:if test="mcres:ExemptionMaterial"><div class="title marg-top">Отказной материал</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Персональные данные</td><td class="graphMain bordered">Отказ</td><td class="graphMain bordered">Причина</td><td class="graphMain bordered">Дополнительные данные</td></tr><xsl:for-each select="mcres:ExemptionMaterial"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:if><xsl:if test="mcres:AdditionalInfo"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дополнительные данные</td><td class="graphMain value" style="width:50%"><xsl:for-each select="mcres:AdditionalInfo"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа mcres:ReleaseType -->
<xsl:template match="mcres:Release">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mcres:Date" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Основание</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcres:Cause" /></td></tr></table></xsl:template>

<!-- Шаблон для типа mcres:LegislationType -->
<xsl:template match="mcres:RequalificationFrom">
<tr><td class="graphMain bordered"><xsl:apply-templates select="mcres:Code" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Article" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Part" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Paragraph" /></td></tr></xsl:template>

<!-- Шаблон для типа mcres:LegislationType -->
<xsl:template match="mcres:RequalificationTo">
<tr><td class="graphMain bordered"><xsl:apply-templates select="mcres:Code" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Article" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Part" /></td><td class="graphMain bordered"><xsl:value-of select="mcres:Paragraph" /></td></tr></xsl:template>

<!-- Шаблон для типа mcres:SearchType -->
<xsl:template match="mcres:Search">
<xsl:if test="mcres:PersonalInfo"><div class="title marg-top">Персональные данные</div></xsl:if><xsl:apply-templates select="mcres:PersonalInfo" /><xsl:if test="mcres:SearchInfo"><div class="title marg-top">Данные по розыску</div></xsl:if><xsl:apply-templates select="mcres:SearchInfo" /><xsl:if test="mcres:AdditionalInfo"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дополнительные данные</td><td class="graphMain value" style="width:50%"><xsl:for-each select="mcres:AdditionalInfo"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа mcres:LegalInfoType -->
<xsl:template match="mcres:SearchInfo">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mcres:Date" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Орган</td><td class="value graphMain" style="width:50%"><xsl:value-of select="mcres:Enforcer" /></td></tr></table><div class="title marg-top">Основание</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Кодекс</td><td class="graphMain bordered">Статья</td><td class="graphMain bordered">Часть</td><td class="graphMain bordered">Пункт</td></tr><xsl:for-each select="mcres:Cause"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:template>

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