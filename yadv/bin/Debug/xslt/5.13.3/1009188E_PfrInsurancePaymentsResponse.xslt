<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ipres="urn:customs.ru:Information:SQDocuments:PfrInsurancePaymentsResponse:5.13.2">
 <!-- Шаблон для типа PfrInsurancePaymentsResponseType -->
<xsl:template match="ipres:PfrInsurancePaymentsResponse">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Предоставление сведений о размере выплат застрахованного лица по линии Пенсионного фонда Российской Федерации (ответ)</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><xsl:if test="ipres:responseOnPeriod"><div class="title marg-top">Результат обработки запроса за период</div></xsl:if><xsl:apply-templates select="ipres:responseOnPeriod" /><xsl:if test="ipres:responseOnDate"><div class="title marg-top">Результат обработки запроса на дату</div></xsl:if><xsl:apply-templates select="ipres:responseOnDate" /></div></body></html></xsl:template>

<!-- Шаблон для типа ipres:PaymentType -->
<xsl:template match="ipres:Payment">
<tr><td class="graphMain bordered"><xsl:value-of select="ipres:type" /></td><td class="graphMain bordered"><xsl:value-of select="ipres:base" /></td><td class="graphMain bordered"><xsl:value-of select="translate(ipres:sum, '.', ',')" /></td><td class="graphMain bordered"><xsl:if test="ipres:paymentDetail"><div class="title marg-top">Детализация выплаты</div><table class="bordered w190"><tbody><tr class="title"><tr><td class="graphMain bordered">Вид выплаты</td><td class="graphMain bordered">Основание назначения</td><td class="graphMain bordered">Сумма выплаты</td></tr></tr><xsl:for-each select="ipres:paymentDetail"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:if></td></tr></xsl:template>

<!-- Шаблон для типа cat_ru:PersonBaseType -->
<xsl:template match="ipres:fio">
<table class="w190"><tr><td class="annot graphMain" style="width:50%">Фамилия</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonSurname" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Имя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonName" /></td></tr></table><xsl:if test="cat_ru:PersonMiddleName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Отчество</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonMiddleName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PersonPost"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Должность</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonPost" /></td></tr></table></xsl:if></xsl:template>

<!-- Шаблон для типа ipres:MonthlyPaymentType -->
<xsl:template match="ipres:monthlyPayment">
<tr><td class="graphMain bordered"><xsl:value-of select="ipres:yearMonth" /></td><td class="graphMain bordered"><xsl:value-of select="translate(ipres:totalPaymentsSum, '.', ',')" /></td><td class="graphMain bordered"><xsl:value-of select="ipres:numberOfPayments" /></td><td class="graphMain bordered"><xsl:apply-templates select="ipres:payments" /></td></tr></xsl:template>

<!-- Шаблон для типа ipres:monthlyPaymentsType -->
<xsl:template match="ipres:monthlyPayments">
<div class="title marg-top">Выплаты за месяц</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Год и месяц</td><td class="graphMain bordered">Общая сумма выплат</td><td class="graphMain bordered">Количество выплат</td><td class="graphMain bordered">Выплаты</td></tr><xsl:for-each select="ipres:monthlyPayment"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:template>

<!-- Шаблон для типа ipres:PaymentDetailType -->
<xsl:template match="ipres:paymentDetail">
<tr><td class="graphMain bordered"><xsl:value-of select="ipres:type" /></td><td class="graphMain bordered"><xsl:value-of select="ipres:base" /></td><td class="graphMain bordered"><xsl:value-of select="translate(ipres:sum, '.', ',')" /></td></tr></xsl:template>

<!-- Шаблон для типа ipres:PaymentsType -->
<xsl:template match="ipres:payments">
<div class="title marg-top">Выплата</div><table class="bordered w190"><tbody><tr class="title"><td class="graphMain bordered">Вид выплаты</td><td class="graphMain bordered">Основание назначения</td><td class="graphMain bordered">Сумма выплаты</td><td class="graphMain bordered">Детализация выплаты</td></tr><xsl:for-each select="ipres:Payment"><xsl:apply-templates select="."></xsl:apply-templates></xsl:for-each></tbody></table></xsl:template>

<!-- Шаблон для типа ipres:responseOnDateType -->
<xsl:template match="ipres:responseOnDate">
<xsl:if test="ipres:fio"><div class="title marg-top">ФИО</div></xsl:if><xsl:apply-templates select="ipres:fio" /><table class="w190"><tr><td class="annot graphMain" style="width:50%">СНИЛС</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ipres:snils" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата рождения</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ipres:birthDate" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Пол</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ipres:gender" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата, по состоянию на которую сведения актуальны</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ipres:actualDate" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наличие данных</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="ipres:existData='true'"><xsl:text>есть</xsl:text></xsl:when><xsl:otherwise><xsl:text>нет</xsl:text></xsl:otherwise></xsl:choose></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата, на которую запрашиваются сведения</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ipres:appDate" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Общая сумма выплат</td><td class="value graphMain" style="width:50%"><xsl:value-of select="translate(ipres:totalPaymentsSum, '.', ',')" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Количество выплат</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ipres:numberOfPayments" /></td></tr></table><xsl:if test="ipres:payments"></xsl:if><xsl:if test="ipres:payments"><div class="title marg-top">Выплаты</div></xsl:if><xsl:apply-templates select="ipres:payments" /></xsl:template>

<!-- Шаблон для типа ipres:ResponseOnPeriodType -->
<xsl:template match="ipres:responseOnPeriod">
<xsl:if test="ipres:fio"><div class="title marg-top">ФИО</div></xsl:if><xsl:apply-templates select="ipres:fio" /><table class="w190"><tr><td class="annot graphMain" style="width:50%">СНИЛС</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ipres:snils" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата рождения</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ipres:birthDate" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Пол</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ipres:gender" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата, по состоянию на которую сведения актуальны</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ipres:actualDate" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наличие данных</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="ipres:existData='true'"><xsl:text>есть</xsl:text></xsl:when><xsl:otherwise><xsl:text>нет</xsl:text></xsl:otherwise></xsl:choose></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата начала периода</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ipres:beginPeriod" /></xsl:call-template></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Количество месяцев</td><td class="value graphMain" style="width:50%"><xsl:value-of select="ipres:numberOfMonths" /></td></tr></table><xsl:if test="ipres:monthlyPayments"></xsl:if><xsl:if test="ipres:monthlyPayments"><div class="title marg-top">Выплаты по месяцам</div></xsl:if><xsl:apply-templates select="ipres:monthlyPayments" /></xsl:template>

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