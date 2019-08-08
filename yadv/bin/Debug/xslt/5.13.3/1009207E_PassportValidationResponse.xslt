<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:PVRes="urn:customs.ru:Information:SQDocuments:PassportValidationResponse:5.13.2">
 <!-- Шаблон для типа PassportValidationResponseType -->
<xsl:template match="PVRes:PassportValidationResponse">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Проверка действительности паспорта (ответ)</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><div class="title marg-top">Результаты запроса</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Уникальный идентификатор запроса</td><td class="graphMain bordered">Данные паспорта, валидность которого проверяется</td><td class="graphMain bordered">Ответ по статусу паспорта</td></tr><xsl:for-each select="PVRes:PassportResponse"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></div></body></html></xsl:template>

<!-- Шаблон для типа PVRes:PassportType -->
<xsl:template match="PVRes:Passport">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Серия</td><td class="value graphMain" style="width:50%"><xsl:value-of select="PVRes:DOC_SERIE" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер</td><td class="value graphMain" style="width:50%"><xsl:value-of select="PVRes:DOC_NUMBER" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата выдачи</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="PVRes:DOC_ISSUEDATE" /></xsl:call-template></td></tr></table><xsl:if test="PVRes:DOC_ISSUER"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код выдавшего подразделения</td><td class="value graphMain" style="width:50%"><xsl:value-of select="PVRes:DOC_ISSUER" /></td></tr></table></xsl:if><xsl:if test="PVRes:CITIZEN_LASTNAME"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Фамилия</td><td class="value graphMain" style="width:50%"><xsl:value-of select="PVRes:CITIZEN_LASTNAME" /></td></tr></table></xsl:if><xsl:if test="PVRes:CITIZEN_FIRSTNAME"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Имя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="PVRes:CITIZEN_FIRSTNAME" /></td></tr></table></xsl:if><xsl:if test="PVRes:CITIZEN_GIVENNAME"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Отчество</td><td class="value graphMain" style="width:50%"><xsl:value-of select="PVRes:CITIZEN_GIVENNAME" /></td></tr></table></xsl:if><xsl:if test="PVRes:CITIZEN_BIRTHDAY"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата рождения</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="PVRes:CITIZEN_BIRTHDAY" /></xsl:call-template></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа PVRes:PassportResponseType -->
<xsl:template match="PVRes:PassportResponse">
<tr><td class="graphMain bordered"><xsl:value-of select="PVRes:ReqID" /></td><td class="graphMain bordered"><xsl:if test="PVRes:Passport"><xsl:apply-templates select="PVRes:Passport" /></xsl:if></td><td class="graphMain bordered"><xsl:apply-templates select="PVRes:Status" /></td></tr></xsl:template>

<!-- Шаблон для типа PVRes:StatusType -->
<xsl:template match="PVRes:Status">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Статус паспорта:</td><td class="value graphMain" style="width:50%"><xsl:choose>
	<xsl:when test="PVRes:DOC_STATUS='300' or PVRes:DOC_STATUS='0'">Действителен</xsl:when>
	<xsl:when test="PVRes:DOC_STATUS='302'">Сведения по заданным реквизитам отсутствуют</xsl:when>
	<xsl:otherwise>Не действителен</xsl:otherwise>
</xsl:choose> (статус: <xsl:value-of select="PVRes:DOC_STATUS" />)</td></tr></table><xsl:if test="PVRes:INVALIDITY_REASON"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Причина недействительности</td><td class="value graphMain" style="width:50%"><xsl:value-of select="PVRes:INVALIDITY_REASON" /></td></tr></table></xsl:if><xsl:if test="PVRes:INVALIDITY_SINCE"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Недействительно с даты</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="PVRes:INVALIDITY_SINCE" /></xsl:call-template></td></tr></table></xsl:if></xsl:template>

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