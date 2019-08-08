<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:ba_res="urn:customs.ru:Information:SQDocuments:FnsBankAccountsInfoResponse:5.13.3">
	<!-- Шаблон для типа FnsBankAccountsInfoResponseType -->
	<xsl:template match="ba_res:FnsBankAccountsInfoResponse">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: normal;
									}

									div.page {
									width: 210mm;
									max-width: 210mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
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
									font-size: 9pt;
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
										<b>Ответ на запрос cведений о банковских счетах (вкладах, депозитах)</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
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
					<xsl:if test="ba_res:PhysicalPersonInfo">
						<div class="title marg-top">Сведения о физическом лице</div>
						<xsl:apply-templates select="ba_res:PhysicalPersonInfo"/>
					</xsl:if>
					<xsl:if test="ba_res:JuridicalPersonInfo">
						<div class="title marg-top">Сведения о юридическом лице</div>
						<xsl:apply-templates select="ba_res:JuridicalPersonInfo"/>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Начало диапазона</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="ba_res:StartPeriod"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Конец диапазона</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="ba_res:EndPeriod"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Сведения о банке и счетах</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Регистрационный номер банка по КГРКО</td>
								<td class="graphMain bordered">Порядковый номер филиала банка по КГРКО</td>
								<td class="graphMain bordered">БИК банка (филиала банка)</td>
								<td class="graphMain bordered">Сокращенное наименование банка (филиала банка), учреждения Банка России</td>
								<td class="graphMain bordered">ИНН банка</td>
								<td class="graphMain bordered">Сведения о банковском счете (вкладе)</td>
							</tr>
							<xsl:for-each select="ba_res:BanksInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ba_res:AccountInfoType -->
	<xsl:template match="ba_res:AccountInfo">
		<u><xsl:value-of select="ba_res:AccountNumber"/></u>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="ba_res:AccountType"/>
		<xsl:text>) </xsl:text>
		<br/>
		<xsl:text>период открытия счета: </xsl:text>
		<br/>
		<xsl:text>с </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="ba_res:CreationDate"/>
		</xsl:call-template>
		<xsl:if test="ba_res:CloseDate">
			<xsl:text> по </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="ba_res:CloseDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="ba_res:StateCode='true' or ba_res:StateCode='1'"> /действующий</xsl:when>
			<xsl:otherwise> /закрыт</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="ba_res:ChangeDate">
			<br/>
			<xsl:text>дата изменения счета: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="ba_res:ChangeDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ba_res:BankInformationType -->
	<xsl:template match="ba_res:BanksInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="ba_res:KGRKORegNum"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ba_res:KGRKONppNum"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ba_res:BankBIK"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ba_res:BankName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ba_res:BankINN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="ba_res:AccountInfo">
					<xsl:apply-templates select="."/>
					<br/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ba_res:ResJuridicalPersonInfoType -->
	<xsl:template match="ba_res:JuridicalPersonInfo">
		<xsl:if test="ba_res:ResidentRFSign">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Резидент РФ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="ba_res:ResidentRFSign='1' or ba_res:ResidentRFSign='true'">Да</xsl:when>
							<xsl:when test="ba_res:ResidentRFSign='0' or ba_res:ResidentRFSign='false'">Нет</xsl:when>
							<xsl:otherwise><xsl:value-of select="ba_res:ResidentRFSign"/></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ba_res:Organization">
			<div class="title marg-top">Наименование организации</div>
			<xsl:apply-templates select="ba_res:Organization"/>
		</xsl:if>
		<xsl:if test="ba_res:KIO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код иностранной организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ba_res:KIO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUOrganizationBaseType -->
	<xsl:template match="ba_res:Organization">
		<xsl:if test="RUScat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="RUScat_ru:OrganizationName">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:ShortName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:OrganizationLanguage"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:RFOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
			<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:RKOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
			<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:RBOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
			<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:RAOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
			<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:KGOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
			<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="ba_res:PersonFIO">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фамилия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonMiddleName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Отчество</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ba_res:ResPhysicalPersonInfoType -->
	<xsl:template match="ba_res:PhysicalPersonInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Индивидуальный предприниматель</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ba_res:SoleTraderSign='1' or ba_res:SoleTraderSign='true'">Да</xsl:when>
						<xsl:when test="ba_res:SoleTraderSign='0' or ba_res:SoleTraderSign='false'">Нет</xsl:when>
						<xsl:otherwise><xsl:value-of select="ba_res:SoleTraderSign"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="ba_res:PersonFIO">
			<div class="title marg-top">ФИО лица</div>
		</xsl:if>
		<xsl:apply-templates select="ba_res:PersonFIO"/>
		<xsl:if test="ba_res:BirthDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата рождения физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ba_res:BirthDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ba_res:BirthPlace">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Место рождения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ba_res:BirthPlace"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ba_res:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ba_res:INN"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ba_res:OGRNIP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРНИП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ba_res:OGRNIP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CategoryCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:KATOCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:RNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITNReserv">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ITNReserv"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН / ПИН</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:KGINN"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGOKPO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OGRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:INN"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:KPP"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:BIN"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:IIN"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
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
