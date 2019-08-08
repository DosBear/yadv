<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ipreq="urn:customs.ru:Information:SQDocuments:PfrInsurancePaymentsRequest:5.13.2">
 <!-- Шаблон для типа PfrInsurancePaymentsRequestType -->
<xsl:template match="ipreq:PfrInsurancePaymentsRequest">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Предоставление сведений о размере выплат застрахованного лица по линии Пенсионного фонда Российской Федерации (запрос)</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><xsl:if test="ipreq:FIO"><div class="title marg-top">ФИО застрахованного лица</div></xsl:if><xsl:apply-templates select="ipreq:FIO" /><table class="w190"><tr><td class="annot graphMain" style="width:50%">СНИЛС</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ipreq:snils" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата рождения</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ipreq:birthDate" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Пол</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ipreq:gender" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата начала периода</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ipreq:beginPeriod" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Количество месяцев</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ipreq:numberOfMonths" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата, на которую запрашиваются сведения</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ipreq:appDate" /></xsl:call-template></td></tr></table></div></body></html></xsl:template>

<!-- Шаблон для типа cat_ru:PersonBaseType -->
<xsl:template match="ipreq:FIO">
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