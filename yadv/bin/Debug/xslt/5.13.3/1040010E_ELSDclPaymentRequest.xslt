<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:els_agr="urn:customs.ru:Information:ELSDocuments:ELSAggregateTypes:5.13.2" xmlns:elspr="urn:customs.ru:Informational:ELSDocuments:ELSDclPaymentRequest:5.13.2">
	<!-- Шаблон для типа ELSDclPaymentRequestType -->
	<xsl:template match="elspr:ELSDclPaymentRequest">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: nowrap;
									}

									div.page {
									width: 277mm;
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
								</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Запрос списания  платежей</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="elspr:DocChargeInfo">
						<div class="title marg-top">Сведения о документе-основании начисления/списания</div>
					</xsl:if>
					<xsl:apply-templates select="elspr:DocChargeInfo"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="els_agr:Address">
		<xsl:if test="cat_ru:PostalCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PostalCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CounryName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Region"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Населенный пункт</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:City"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:StreetHouse"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:TerritoryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа els_agr:AdjustmentInfoType -->
	<xsl:template match="els_agr:AdjustmentInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:AdjustDocNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="els_agr:AdjustDocDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="els_agr:PersonType=0">
						<xsl:text>декларант</xsl:text>
					</xsl:when>
					<xsl:when test="els_agr:PersonType=1">
						<xsl:text>должностное лицо ТО</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="els_agr:PersonType"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:ChangeCode/els_agr:PhaseChanges"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:ChangeCode/els_agr:BasisCompilation"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:ChangeCode/els_agr:QuantityChanges"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:ChangeCode/els_agr:CountryChanges"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:ChangeCode/els_agr:TNVEDChanges"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:ChangeCode/els_agr:CustCostChanges"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:ChangeCode/els_agr:CustomsPaymentChanges"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:ChangeCode/els_agr:OtherChanges"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа els_agr:AccPaymentAmountType -->
	<xsl:template match="els_agr:AmountInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:BCC"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:PaymentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(els_agr:Amount, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:AdjustDocNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="els_agr:IsWorked='true'">
						<xsl:text>есть</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>нет</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:CustomsReceipt"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="els_agr:PayerType=0 or els_agr:PayerType='false'">
						<xsl:text>Декларант</xsl:text>
					</xsl:when>
					<xsl:when test="els_agr:PayerType=1 or els_agr:PayerType='true'">
						<xsl:text>Таможенный представитель</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="els_agr:PayerType"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа els_agr:BrokerInfoType -->
	<xsl:template match="els_agr:BrokerInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ИНН</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="els_agr:INN"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">КПП</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="els_agr:KPP"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа els_agr:ChangeCodeType -->
	<xsl:template match="els_agr:ChangeCode">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Элемент 1.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(els_agr:PhaseChanges, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Элемент 2.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(els_agr:BasisCompilation, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Элемент 3.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(els_agr:QuantityChanges, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Элемент 4.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(els_agr:CountryChanges, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Элемент 5.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(els_agr:TNVEDChanges, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Элемент 6.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(els_agr:CustCostChanges, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Элемент 7.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(els_agr:CustomsPaymentChanges, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Элемент 8.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(els_agr:OtherChanges, '.', ',')"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа els_agr:DclPaymentInfoType -->
	<xsl:template match="els_agr:DclPaymentInfo">
		<xsl:if test="els_agr:PrecedingDocument">
			<div class="title marg-top">Предшествующие ДН</div>
			<table class="bordered w190">
				<tbody>
					<!--tr class="title">
						<td class="graphMain bordered">Код таможенного органа</td>
						<td class="graphMain bordered">Дата регистрации документа.</td>
						<td class="graphMain bordered">Порядковый номер ДТ/ рег. номер ТПО/ типографский номер ТР / номер МПО</td>
					</tr-->
					<xsl:for-each select="els_agr:PrecedingDocument">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:PayableAmount">
			<div class="title marg-top">Суммы, подлежащие уплате</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">КБК</td>
						<td class="graphMain bordered">Код вида платежа</td>
						<td class="graphMain bordered">Сумма</td>
						<td class="graphMain bordered">Номер КДТ после выпуска товаров</td>
						<td class="graphMain bordered">Признак отработки в предыдущих запросах</td>
					</tr>
					<xsl:for-each select="els_agr:PayableAmount">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:AmountInfo">
			<div class="title marg-top">Суммы, списываемые с лицевого счета</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">КБК</td>
						<td class="graphMain bordered">Код вида платежа</td>
						<td class="graphMain bordered">Сумма</td>
						<td class="graphMain bordered">Номер КДТ после выпуска товаров</td>
						<td class="graphMain bordered">Признак отработки в предыдущих запросах</td>
						<td class="graphMain bordered">Номер таможенной расписки</td>
						<td class="graphMain bordered">Сведения о плательщике</td>
					</tr>
					<xsl:for-each select="els_agr:AmountInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:DelayPaymentInfo">
			<div class="title marg-top">График начислений</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">КБК</td>
						<td class="graphMain bordered">Код вида платежа</td>
						<td class="graphMain bordered">Сумма</td>
						<td class="graphMain bordered">Порядковый номер начисления</td>
						<td class="graphMain bordered">Дата начисления</td>
					</tr>
					<xsl:for-each select="els_agr:DelayPaymentInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа els_agr:DeclarantInfoType -->
	<xsl:template match="els_agr:DeclarantInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="els_agr:OrganizationName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="els_agr:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="els_agr:ShortName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="els_agr:OrganizationLanguage"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:OKSM">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="els_agr:OKSM"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:Classification">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Классификация лицевого счета: </td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="els_agr:Classification=0">
								<xsl:text>юридическое лицо</xsl:text>
							</xsl:when>
							<xsl:when test="els_agr:Classification=1">
								<xsl:text>физическое лицо</xsl:text>
							</xsl:when>
							<xsl:when test="els_agr:Classification=2">
								<xsl:text>ИП</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="els_agr:Classification"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="els_agr:INN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:KPP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="els_agr:KPP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:OKTMO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКТМО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="els_agr:OKTMO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:Birthdate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата рождения физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="els_agr:Birthdate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:Address"/>
		<xsl:if test="els_agr:Address">
			<div class="title marg-top">Адрес организации / физического лица</div>
		</xsl:if>
		<xsl:apply-templates select="els_agr:Address"/>
		<xsl:if test="els_agr:IdentityCard"/>
		<xsl:if test="els_agr:IdentityCard">
			<div class="title marg-top">Документ, удостоверяющий личность</div>
		</xsl:if>
		<xsl:apply-templates select="els_agr:IdentityCard"/>
	</xsl:template>
	<!-- Шаблон для типа els_agr:DelayPaymentInfoType -->
	<xsl:template match="els_agr:DelayPaymentInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:BCC"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:PaymentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(els_agr:Amount, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:StageNumb"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="els_agr:PayDate"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="els_agr:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Серия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardSeries"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата выдачи</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа els_agr:ReqPayableAmountType -->
	<xsl:template match="els_agr:PayableAmount">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:BCC"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:PaymentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(els_agr:Amount, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:AdjustDocNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="els_agr:IsWorked='true'">
						<xsl:text>есть</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>нет</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа els_agr:RegistrationNumberType -->
	<xsl:template match="els_agr:PrecedingDocument">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="els_agr:CustomsCode"/>
				<xsl:text>/</xsl:text>
			<!--/td>
			<td class="graphMain bordered"-->
				<xsl:call-template name="num_date">
					<xsl:with-param name="dateIn" select="els_agr:RegistrationDate"/>
				</xsl:call-template>
				<xsl:text>/</xsl:text>
			<!--/td>
			<td class="graphMain bordered"-->
				<xsl:value-of select="els_agr:DocNumber"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа els_agr:RegistrationNumberType -->
	<xsl:template match="els_agr:RegistrationNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Рег. номер</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="els_agr:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:call-template name="num_date">
						<xsl:with-param name="dateIn" select="els_agr:RegistrationDate"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="els_agr:DocNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа els_agr:DocChargeInfoType -->
	<xsl:template match="elspr:DocChargeInfo">
		<xsl:if test="els_agr:RegistrationNumber">
			<div class="title marg-top">Регистрационный номер документа начислений</div>
		</xsl:if>
		<xsl:apply-templates select="els_agr:RegistrationNumber"/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип документа начислений</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="els_agr:DocumentChargeType=0">
							<xsl:text>ДТ</xsl:text>
						</xsl:when>
						<xsl:when test="els_agr:DocumentChargeType=1">
							<xsl:text>ТПО</xsl:text>
						</xsl:when>
						<xsl:when test="els_agr:DocumentChargeType=2">
							<xsl:text>ТР</xsl:text>
						</xsl:when>
						<xsl:when test="els_agr:DocumentChargeType=3">
							<xsl:text>Постановление об АП</xsl:text>
						</xsl:when>
						<xsl:when test="els_agr:DocumentChargeType=4">
							<xsl:text>МПО</xsl:text>
						</xsl:when>
						<xsl:when test="els_agr:DocumentChargeType=5">
							<xsl:text>Уголовное дело</xsl:text>
						</xsl:when>
						<xsl:when test="els_agr:DocumentChargeType=6">
							<xsl:text>Уголовное дело (штраф)</xsl:text>
						</xsl:when>
						<xsl:when test="els_agr:DocumentChargeType=7">
							<xsl:text>Постановление о распоряжении изъятым ищуществом</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="els_agr:DocumentChargeType"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="els_agr:DocumentChargeKind">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вид документа начислений</td>
					<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="els_agr:DocumentChargeKind=0 and els_agr:DocumentChargeType=0">
									<xsl:text>обычная</xsl:text>
								</xsl:when>
								<xsl:when test="els_agr:DocumentChargeKind=1 and els_agr:DocumentChargeType=0">
									<xsl:text>Временный ввоз</xsl:text>
								</xsl:when>
								<xsl:when test="els_agr:DocumentChargeKind=2 and els_agr:DocumentChargeType=0">
									<xsl:text>Временный вывоз</xsl:text>
								</xsl:when>
								<xsl:when test="els_agr:DocumentChargeKind=3 and els_agr:DocumentChargeType=0">
									<xsl:text>ВД</xsl:text>
								</xsl:when>
								<xsl:when test="els_agr:DocumentChargeKind=4 and els_agr:DocumentChargeType=0">
									<xsl:text>ПД</xsl:text>
								</xsl:when>
								<xsl:when test="els_agr:DocumentChargeKind=0 and els_agr:DocumentChargeType=1">
									<xsl:text>Обычный</xsl:text>
								</xsl:when>
								<xsl:when test="els_agr:DocumentChargeKind=1 and els_agr:DocumentChargeType=1">
									<xsl:text>Электронный</xsl:text>
								</xsl:when>
								<xsl:when test="els_agr:DocumentChargeKind=0 and els_agr:DocumentChargeType=2">
									<xsl:text>Обычная</xsl:text>
								</xsl:when>
								<xsl:when test="els_agr:DocumentChargeKind=1 and els_agr:DocumentChargeType=2">
									<xsl:text>ГО</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="els_agr:DocumentChargeKind"/>
								</xsl:otherwise>
							</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Cостояние ДН</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="els_agr:DocumentStatus"/>
				</td>
			</tr>
		</table>
		<xsl:if test="els_agr:CustomsProcedure">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Таможенная процедура</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="els_agr:CustomsProcedure"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:FinalDeclarationIndicator">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ДТ является последней полной таможенной декларацией</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="els_agr:FinalDeclarationIndicator='true'">
								<xsl:text>да</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>нет</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:PaymentDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Срок добровольной уплаты</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="els_agr:PaymentDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:ArchID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор архива</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="els_agr:ArchID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:ArchDocID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор ДН в архиве декларанта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="els_agr:ArchDocID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="els_agr:DeclarantInfo"/>
		<xsl:if test="els_agr:DeclarantInfo">
			<div class="title marg-top">Сведения о декларанте</div>
		</xsl:if>
		<xsl:apply-templates select="els_agr:DeclarantInfo"/>
		<xsl:if test="els_agr:BrokerInfo"/>
		<xsl:if test="els_agr:BrokerInfo">
			<div class="title marg-top">Сведения о таможенном представителе</div>
		</xsl:if>
		<xsl:apply-templates select="els_agr:BrokerInfo"/>
		<xsl:if test="els_agr:DclPaymentInfo">
			<div class="title marg-top">Сведения о платежах по ДН</div>
		</xsl:if>
		<xsl:apply-templates select="els_agr:DclPaymentInfo"/>
		<xsl:if test="els_agr:AdjustmentInfo">
			<div class="title marg-top">Сведения о корректировках ДТ</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td rowspan="2" class="graphMain bordered">Номер</td>
						<td rowspan="2" class="graphMain bordered">Дата составления</td>
						<td rowspan="2" class="graphMain bordered">Лицо,<br/>составившее КДТ</td>
						<td colspan="8" class="graphMain bordered">Код изменений гр 45а</td>
					</tr>
					<tr valign="top">
						<td class="graphMain bordered">Графа 45а. Элемент 1. Этап внесения изменений и (или) дополнений в сведения, указанных в ДТ</td>
						<td class="graphMain bordered">Графа 45а. Элемент 2. Обстоя-<br/>тельства, послужившие основанием для  внесения изменений и (или) дополнений в сведения, указанных в ДТ</td>
						<td class="graphMain bordered">Графа 45а. Элемент 3. Изменение и (или) дополнение сведений, указанных в ДТ, в отношении количества (веса) товаров</td>
						<td class="graphMain bordered">Графа 45а. Элемент 4. Изменение и (или) дополнение сведений , указанных в ДТ, о стране происхож-<br/>дения товаров и (или) тарифных преференциях</td>
						<td class="graphMain bordered">Графа 45а. Элемент 5. Изменение сведений, указанных в ДТ,  в отношении классифика-<br/>ционного кода товара по ТН ВЭД ТС</td>
						<td class="graphMain bordered">Графа 45а. Элемент 6. Изменение и (или) дополнение сведений, указанных в ДТ, в отношении таможенной стоимости товаров</td>
						<td class="graphMain bordered">Графа 45а. Элемент 7. Изменение и (или) дополнение сведений, указанных в ДТ, в отношении исчисленных (уплаченных) таможенных, иных платежей</td>
						<td class="graphMain bordered">Графа 45а. Элемент 8. Изменение и (или) дополнение иных сведений, указанных в ДТ</td>
					</tr>
					<xsl:for-each select="els_agr:AdjustmentInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
