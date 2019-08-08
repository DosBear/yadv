<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:PfrReq="urn:customs.ru:Information:SQDocuments:PfrRequest:5.13.2">
 <!-- Шаблон для типа PfrRequestType -->
<xsl:template match="PfrReq:PfrRequest">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Запрос сведений о размере пенсии</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><xsl:if test="PfrReq:Citizen"><div class="title marg-top">ФИО лица, дата рождения, адрес</div></xsl:if><xsl:apply-templates select="PfrReq:Citizen" /><table class="w190"><tr><td class="annot graphMain" style="width:50%">Страховой номер индивидуального лицевого счета</td><td class="value graphMain" style="width:50%"><xsl:value-of select="PfrReq:Snils" /></td></tr></table><xsl:if test="PfrReq:DateRequest"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата направления запроса</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="PfrReq:DateRequest" /></xsl:call-template></td></tr></table></xsl:if><xsl:if test="PfrReq:PensionCases"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер пенсионного дела (по возможности)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="PfrReq:PensionCases" /></td></tr></table></xsl:if><xsl:if test="PfrReq:Period"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Период выплаты суммы пенсии, количество месяцев</td><td class="value graphMain" style="width:50%"><xsl:value-of select="PfrReq:Period" /></td></tr></table></xsl:if></div></body></html></xsl:template>

<!-- Шаблон для типа PfrReq:CitizenType -->
<xsl:template match="PfrReq:Citizen">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Имя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="PfrReq:Surname" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Фамилия</td><td class="value graphMain" style="width:50%"><xsl:value-of select="PfrReq:Name" /></td></tr></table><xsl:if test="PfrReq:Patronymic"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Отчество</td><td class="value graphMain" style="width:50%"><xsl:value-of select="PfrReq:Patronymic" /></td></tr></table></xsl:if><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата рождения</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="PfrReq:Birthday" /></xsl:call-template></td></tr></table></xsl:template>

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