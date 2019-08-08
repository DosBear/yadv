<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:glrr="urn:customs.ru:Information:SQDocuments:GoodsListsRegistrationRejection:5.13.2">
 <!-- Шаблон для типа GoodsListsRegistrationRejectionType -->
<xsl:template match="glrr:GoodsListsRegistrationRejection">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Сведения об отказе регистрации перечня (списка)</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><div class="title marg-top">Сведения об отказе регистрации перечня (списка)</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Внутренний номер перечня Минпромторга</td><td class="graphMain bordered">Сведения о решении об отказе в регистрации</td><td class="graphMain bordered">Причина отказа в регистрации</td><td class="graphMain bordered">Уполномоченное лицо со стороны ФТС</td><td class="graphMain bordered">Информация о дате и времени последнего изменения</td></tr><xsl:for-each select="glrr:GoodsListRegistrationRejection"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></div></body></html></xsl:template>

<!-- Шаблон для типа cat_ru:PersonBaseType -->
<xsl:template match="glrr:AuthorizedPerson">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Фамилия</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonSurname" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Имя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonName" /></td></tr></table><xsl:if test="cat_ru:PersonMiddleName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Отчество</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonMiddleName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PersonPost"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Должность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonPost" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа glrr:GoodsListRegistrationRejectionType -->
<xsl:template match="glrr:GoodsListRegistrationRejection">
<tr><td class="graphMain bordered"><xsl:value-of select="glrr:RegNumber" /></td><td class="graphMain bordered"><xsl:apply-templates select="glrr:RejectionDecisionInfo" /></td><td class="graphMain bordered"><xsl:apply-templates select="glrr:RejectionReason" /></td><td class="graphMain bordered"><xsl:apply-templates select="glrr:AuthorizedPerson" /></td><td class="graphMain bordered"><xsl:value-of select="glrr:LastChangeDateTime" /></td></tr></xsl:template>

<!-- Шаблон для типа cat_ru:DocumentBaseType -->
<xsl:template match="glrr:RejectionDecisionInfo">
<xsl:if test="cat_ru:PrDocumentName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PrDocumentName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PrDocumentNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PrDocumentNumber" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PrDocumentDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата документа</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" /></xsl:call-template></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа glrr:RejectionReasonType -->
<xsl:template match="glrr:RejectionReason">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Признак отказа в регистрации: 1 - Неверно указано наименование таможенного органа; 2 - Отсутствие указанного таможенного органа; 3 - Неверно указана информация о товаре</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="glrr:RejectionSign=1"><xsl:text>Неверно указано наименование таможенного органа</xsl:text></xsl:when><xsl:when test="glrr:RejectionSign=2"><xsl:text>Отсутствие указанного таможенного органа</xsl:text></xsl:when><xsl:when test="glrr:RejectionSign=3"><xsl:text>Неверно указана информация о товаре</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="glrr:RejectionSign" /></xsl:otherwise></xsl:choose></td></tr></table><xsl:if test="glrr:RejectedGoodNum"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер позиции товара в перечне</td><td class="value graphMain" style="width:50%"><xsl:value-of select="glrr:RejectedGoodNum" /></td></tr></table></xsl:if><xsl:if test="glrr:OtherReasons"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Другие причины</td><td class="value graphMain" style="width:50%"><xsl:value-of select="glrr:OtherReasons" /></td></tr></table></xsl:if></xsl:template>

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