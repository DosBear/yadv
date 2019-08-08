<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ld_req="urn:customs.ru:Information:SQDocuments:MvdLostDocumentRequest:5.13.2">
 <!-- Шаблон для типа MvdLostDocumentRequestType -->
<xsl:template match="ld_req:MvdLostDocumentRequest">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Запрос сведений об утраченном документе</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><table class="w190"><tr><td class="annot graphMain" style="width:50%">Вид документа: 1 - Сведения о паспорте; 2 - Сведения о разрешении на работу; 3 - Сведения об удостоверении ветерана труда</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="ld_req:DocumentType=1"><xsl:text>Сведения о паспорте</xsl:text></xsl:when><xsl:when test="ld_req:DocumentType=2"><xsl:text>Сведения о разрешении на работу</xsl:text></xsl:when><xsl:when test="ld_req:DocumentType=3"><xsl:text>Сведения об удостоверении ветерана труда</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="ld_req:DocumentType" /></xsl:otherwise></xsl:choose></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Правовые основания для предоставления услуги</td><td class="graphMain value" style="width:50%"><xsl:for-each select="ld_req:Reason"><xsl:value-of select="." /><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each></td></tr></table><xsl:if test="ld_req:Operator"><div class="title marg-top">ФИО оператора, осуществляющего проверку</div></xsl:if><xsl:apply-templates select="ld_req:Operator" /><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код региона</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ld_req:Region" /></td></tr></table><xsl:if test="ld_req:RequestPerson"><div class="title marg-top">ФИО проверяемого лица</div></xsl:if><xsl:apply-templates select="ld_req:RequestPerson" /><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата рождения проверяемого лица</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ld_req:BirthDate" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">СНИЛС проверяемого лица</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ld_req:SNILS" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Место рождения - Наименование региона</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ld_req:PlaceOfBirth" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Место рождения - Код региона</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ld_req:PlaceOfBirthCode" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код региона проживания</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ld_req:AddressCode" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Тип регистрации : МП, МЖ</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ld_req:TypeRegistration" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Место регистрации</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ld_req:RegistrationPlace" /></td></tr></table><xsl:if test="ld_req:DocumentRequisites"></xsl:if><xsl:if test="ld_req:DocumentRequisites"><div class="title marg-top">Реквизиты запрашиваемого документа</div></xsl:if><xsl:apply-templates select="ld_req:DocumentRequisites" /><table class="w190"><tr><td class="annot graphMain" style="width:50%">Место потери документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ld_req:PlaceOfLost" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Код места потери документа (код региона)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ld_req:CodeOfLost" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата потери документа</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ld_req:DateOfLost" /></xsl:call-template></td></tr></table></div></body></html></xsl:template>

<!-- Шаблон для типа ld_req:DocumentRequisitesType -->
<xsl:template match="ld_req:DocumentRequisites">
<xsl:if test="ld_req:Series"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Серия документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ld_req:Series" /></td></tr></table></xsl:if><xsl:if test="ld_req:Number"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ld_req:Number" /></td></tr></table></xsl:if><xsl:if test="ld_req:IssOrganization"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование органа, выдавшего документ/ принявшего решение о присвоении звании ветерана</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ld_req:IssOrganization" /></td></tr></table></xsl:if><xsl:if test="ld_req:IssDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата выдачи документа</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ld_req:IssDate" /></xsl:call-template></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:PersonBaseType -->
<xsl:template match="ld_req:Operator">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Фамилия</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonSurname" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Имя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonName" /></td></tr></table><xsl:if test="cat_ru:PersonMiddleName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Отчество</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonMiddleName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PersonPost"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Должность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonPost" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа cat_ru:PersonBaseType -->
<xsl:template match="ld_req:RequestPerson">
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