<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:PVReq="urn:customs.ru:Information:SQDocuments:PassportValidationRequest:5.13.2">
 <!-- Шаблон для типа PassportValidationRequestType -->
<xsl:template match="PVReq:PassportValidationRequest">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Проверка действительности паспорта (запрос)</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><div class="title marg-top">Данные паспорта, валидность которого проверяется</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Уникальный идентификатор запроса</td><td class="graphMain bordered">Серия</td><td class="graphMain bordered">Номер</td><td class="graphMain bordered">Дата выдачи</td><td class="graphMain bordered">Код выдавшего подразделения</td><td class="graphMain bordered">Фамилия</td><td class="graphMain bordered">Имя</td><td class="graphMain bordered">Отчество</td><td class="graphMain bordered">Дата рождения</td></tr><xsl:for-each select="PVReq:Passport"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table><xsl:if test="PVReq:RequestPerson"><div class="title marg-top">Лицо, запрашивающее сведения</div></xsl:if><xsl:apply-templates select="PVReq:RequestPerson" /></div></body></html></xsl:template>

<!-- Шаблон для типа PVReq:PassportType -->
<xsl:template match="PVReq:Passport">
<tr><td class="graphMain bordered"><xsl:value-of select="PVReq:ReqID" /></td><td class="graphMain bordered"><xsl:value-of select="PVReq:DOC_SERIE" /></td><td class="graphMain bordered"><xsl:value-of select="PVReq:DOC_NUMBER" /></td><td class="graphMain bordered"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="PVReq:DOC_ISSUEDATE" /></xsl:call-template></td><td class="graphMain bordered"><xsl:value-of select="PVReq:DOC_ISSUER" /></td><td class="graphMain bordered"><xsl:value-of select="PVReq:CITIZEN_LASTNAME" /></td><td class="graphMain bordered"><xsl:value-of select="PVReq:CITIZEN_FIRSTNAME" /></td><td class="graphMain bordered"><xsl:value-of select="PVReq:CITIZEN_GIVENNAME" /></td><td class="graphMain bordered"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="PVReq:CITIZEN_BIRTHDAY" /></xsl:call-template></td></tr></xsl:template>

<!-- Шаблон для типа cat_ru:PersonBaseType -->
<xsl:template match="PVReq:RequestPerson">
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