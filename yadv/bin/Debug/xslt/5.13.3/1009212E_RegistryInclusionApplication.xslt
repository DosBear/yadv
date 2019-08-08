<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:riapp="urn:customs.ru:Information:SQDocuments:RegistryInclusionApplication:5.13.3" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0">
	<!-- Шаблон для типа RegistryInclusionApplicationType -->
	<xsl:template match="riapp:RegistryInclusionApplication">
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
								</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Заявление на включение в реестр банков, иных кредитных организаций и страховых организаций</b>
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
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип организации</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="riapp:TypeSign='true' or riapp:TypeSign='1'">
										<xsl:text>банк или иная КО</xsl:text>
									</xsl:when>
									<xsl:when test="riapp:TypeSign='false' or riapp:TypeSign='0'">
										<xsl:text>страховая компания</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="riapp:TypeSign"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Вид заявления</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="riapp:Kind=1">
										<xsl:text>включить в реестр первично</xsl:text>
									</xsl:when>
									<xsl:when test="riapp:Kind=2">
										<xsl:text>включить в реестр повторно</xsl:text>
									</xsl:when>
									<xsl:when test="riapp:Kind=3">
										<xsl:text>внести изменения</xsl:text>
									</xsl:when>
									<xsl:when test="riapp:Kind=4">
										<xsl:text>исключить из реестра</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="riapp:Kind"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="riapp:Comment">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Комментарий. Суть обращения</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="riapp:Comment"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор заявления на ЕПГУ</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="riapp:ApplicationSourceSystemID"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата заявления на ЕПГУ</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="riapp:ApplicationDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор заявки в АПС "Электронные Госуслуги"</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="riapp:ApplicationID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="riapp:ApplicantID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">СНИЛС заявителя</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="riapp:ApplicantID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="riapp:ApplicationRegDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата регистрации заявления на АПС "Электронные Госуслуги"</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="riapp:ApplicationRegDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="riapp:OrganizationInfo">
						<div class="title marg-top">Реквизиты организации</div>
					</xsl:if>
					<xsl:apply-templates select="riapp:OrganizationInfo"/>
					<xsl:if test="riapp:Director"/>
					<xsl:if test="riapp:Director">
						<div class="title marg-top">Сведения о руководителе организации.</div>
					</xsl:if>
					<xsl:apply-templates select="riapp:Director"/>
					<xsl:if test="riapp:ChiefAccountant"/>
					<xsl:if test="riapp:ChiefAccountant">
						<div class="title marg-top">Сведения о главном бухгалтере</div>
					</xsl:if>
					<xsl:apply-templates select="riapp:ChiefAccountant"/>
					<xsl:if test="riapp:License"/>
					<xsl:if test="riapp:License">
						<div class="title marg-top">Информация о лицензии на осуществление банковских операций/страхования</div>
					</xsl:if>
					<xsl:apply-templates select="riapp:License"/>
					<xsl:if test="riapp:AdditionalInfo"/>
					<xsl:if test="riapp:AdditionalInfo">
						<div class="title marg-top">Дополнительная информация</div>
					</xsl:if>
					<xsl:apply-templates select="riapp:AdditionalInfo"/>
					<xsl:if test="riapp:BranchInfo">
						<div class="title marg-top">Сведения о филиале КО/страховой организации</div>
						<xsl:for-each select="riapp:BranchInfo">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
						
						<!--table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Наименование организации / ФИО физического лица</td>
									<td class="graphMain bordered">Краткое наименование организации</td>
									<td class="graphMain bordered">Код языка для заполнения наименования </td>
									<td class="graphMain bordered">Сведения об организации. Особенности Российской Федерации</td>
									<td class="graphMain bordered">Сведения об организации. Особенности Республики Казахстан</td>
									<td class="graphMain bordered">Сведения об организации. Особенности Республики Беларусь</td>
									<td class="graphMain bordered">Сведения об организации. Особенности Республики Армения</td>
									<td class="graphMain bordered">Сведения об организации. Особенности Кыргызской Республики</td>
									<td class="graphMain bordered">Адрес организации</td>
									<td class="graphMain bordered">Документ, удостоверяющий личность</td>
									<td class="graphMain bordered">Контактная информация</td>
									<td class="graphMain bordered">Полные данные по организации одной строкой (при отсутствии детализации)</td>
									<td class="graphMain bordered">Код организации по ОКПО.</td>
									<td class="graphMain bordered">Эл.почта организации</td>
									<td class="graphMain bordered">Дата государственной регистрации</td>
									<td class="graphMain bordered">Вид заявления: 1 - включить в реестр первично, 2 - включить в реестр повторно, 3 - внести изменения, 4 - исключить из реестра</td>
									<td class="graphMain bordered">Фактический адрес (заполняется в случае, если фактический адрес не совпадает с юридическим)</td>
									<td class="graphMain bordered">Финансовые реквизиты организации</td>
									<td class="graphMain bordered">Направленные с заявкой документы</td>
									<td class="graphMain bordered">Порядковый номер филиала в КГР КО</td>
								</tr>
								<xsl:for-each select="riapp:BranchInfo">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table-->
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:Address">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение вида адреса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AddressKindCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:PostalCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CounryName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Region"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:District"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Город</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Town"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Населенный пункт</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:City"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:StreetHouse"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:House"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Room"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AddressText"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:OKTMO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKATO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:OKATO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:KLADR">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код КЛАДР</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:KLADR"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOGUID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AOGUID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AOID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:TerritoryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:TerritoryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер телефона</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="cat_ru:Phone">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер факса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Fax"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер телекса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Telex"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="cat_ru:E_mail">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardSeries"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
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
					<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IssuerCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:IssuerCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование вида документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AuthorityId"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CountryCode"/>
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
					<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="cat_ru:KGINN=ИНН">
								<xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
							</xsl:when>
							<xsl:when test="cat_ru:KGINN=ПИН">
								<xsl:text>персональный идентификационный номер</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="cat_ru:KGINN"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
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
					<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OGRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:INN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KPP"/>
					</td>
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
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:BIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITN"/>
		<xsl:if test="cat_ru:ITN">
			<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:ITN"/>
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
	<!-- Шаблон для типа riapp:AdditionalInfoType -->
	<xsl:template match="riapp:AdditionalInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Срок осуществления деятельности (в годах)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="riapp:ActivityDuration"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Зарегистрированный уставный капитал (руб.)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(riapp:Equity, '.', ',')"/>
				</td>
			</tr>
		</table>
		<xsl:if test="riapp:IsFinancialSanationRequired">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Требование БР об осуществлении мер по финансовому оздоровлению КО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="riapp:IsFinancialSanationRequired='true' or riapp:IsFinancialSanationRequired='1'">
								<xsl:text>предъявлено</xsl:text>
							</xsl:when>
							<xsl:when test="riapp:IsFinancialSanationRequired='false' or riapp:IsFinancialSanationRequired='0'">
								<xsl:text>не предъявлено (заполняется только для банков и иных КО)</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="riapp:IsFinancialSanationRequired"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа riapp:BranchType -->
	<!--xsl:template name="riapp:BranchInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="RUScat_ru:OrganizationName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="RUScat_ru:ShortName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="RUScat_ru:OrganizationLanguage"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="RUScat_ru:Address">
					<xsl:apply-templates select="RUScat_ru:Address"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="RUScat_ru:IdentityCard">
					<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="RUScat_ru:Contact">
					<xsl:apply-templates select="RUScat_ru:Contact"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="RUScat_ru:OrganizationFullDatas"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="riapp:OKPOID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="riapp:Email"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="riapp:RegistrationDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="riapp:Kind=1">
						<xsl:text>включить в реестр первично</xsl:text>
					</xsl:when>
					<xsl:when test="riapp:Kind=2">
						<xsl:text>включить в реестр повторно</xsl:text>
					</xsl:when>
					<xsl:when test="riapp:Kind=3">
						<xsl:text>внести изменения</xsl:text>
					</xsl:when>
					<xsl:when test="riapp:Kind=4">
						<xsl:text>исключить из реестра</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="riapp:Kind"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="riapp:FactAddress">
					<xsl:apply-templates select="riapp:FactAddress"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="riapp:FinancialRequisites">
					<xsl:apply-templates select="riapp:FinancialRequisites"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="riapp:PresentedDocument">
					<div class="title marg-top">Направленные с заявкой документы</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<tr>
									<td class="graphMain bordered">Наименование документа</td>
									<td class="graphMain bordered">Номер документа</td>
									<td class="graphMain bordered">Дата документа</td>
									<td class="graphMain bordered">Код документа. 2 символа, числовой</td>
									<td class="graphMain bordered">Данные файла в кодировке BASE64</td>
								</tr>
							</tr>
							<xsl:for-each select="riapp:PresentedDocument">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="riapp:SequenceNumber"/>
			</td>
		</tr>
	</xsl:template-->
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="riapp:ChiefAccountant">
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
		<xsl:if test="cat_ru:IssueDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата подписания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="riapp:Director">
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
		<xsl:if test="cat_ru:IssueDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата подписания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="riapp:FactAddress">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение вида адреса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AddressKindCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:PostalCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:CounryName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Region"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:District"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Город</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Town"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Населенный пункт</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:City"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:StreetHouse"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:House"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:Room"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AddressText"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:OKTMO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKATO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:OKATO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:KLADR">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код КЛАДР</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:KLADR"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOGUID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AOGUID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:AOID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:TerritoryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:TerritoryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа riapp:FinancialRequisitesType -->
	<xsl:template match="riapp:FinancialRequisites">
		<xsl:if test="riapp:BankName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование банка</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="riapp:BankName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="riapp:OperatingAccount">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Расчетный счет</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="riapp:OperatingAccount"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Корреспондентский счет</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="riapp:CorrespondentAccount"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">БИК</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="riapp:BIC"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="riapp:License">
		<xsl:if test="cat_ru:PrDocumentName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PrDocumentName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PrDocumentNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа riapp:OrganizationType -->
	<xsl:template match="riapp:OrganizationInfo|riapp:BranchInfo">

		<xsl:if test="riapp:SequenceNumber">
			<table class="w190">
				<tr>
					<td style="width:50%"><br/></td>
					<td style="width:50%"><br/></td>
				</tr>
				<tr>
					<td class="annot graphMain" style="width:50%"><b>Порядковый номер филиала в КГР КО:</b></td>
					<td class="value graphMain" style="width:50%">
						<b><xsl:value-of select="riapp:SequenceNumber"/></b>
					</td>
				</tr>
			</table>
		</xsl:if>

		<xsl:if test="RUScat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="RUScat_ru:OrganizationName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
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
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:RKOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:RBOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:RAOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:KGOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:Address"/>
		<xsl:if test="RUScat_ru:Address">
			<div class="title marg-top">Адрес организации</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:Address"/>
		<xsl:if test="RUScat_ru:IdentityCard"/>
		<xsl:if test="RUScat_ru:IdentityCard">
			<div class="title marg-top">Документ, удостоверяющий личность</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		<xsl:if test="RUScat_ru:Contact"/>
		<xsl:if test="RUScat_ru:Contact">
			<div class="title marg-top">Контактная информация</div>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:Contact"/>
		<xsl:if test="RUScat_ru:OrganizationFullDatas">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Полные данные по организации одной строкой (при отсутствии детализации)</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="RUScat_ru:OrganizationFullDatas">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="riapp:OKPOID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код организации по ОКПО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="riapp:OKPOID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="riapp:Email">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Эл.почта организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="riapp:Email"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="riapp:RegistrationDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата государственной регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="riapp:RegistrationDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="riapp:Kind">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вид заявления: 1 - включить в реестр первично, 2 - включить в реестр повторно, 3 - внести изменения, 4 - исключить из реестра</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="riapp:Kind=1">
								<xsl:text>включить в реестр первично</xsl:text>
							</xsl:when>
							<xsl:when test="riapp:Kind=2">
								<xsl:text>включить в реестр повторно</xsl:text>
							</xsl:when>
							<xsl:when test="riapp:Kind=3">
								<xsl:text>внести изменения</xsl:text>
							</xsl:when>
							<xsl:when test="riapp:Kind=4">
								<xsl:text>исключить из реестра</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="riapp:Kind"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="riapp:FactAddress"/>
		<xsl:if test="riapp:FactAddress">
			<div class="title marg-top">Фактический адрес (заполняется в случае, если фактический адрес не совпадает с юридическим)</div>
		</xsl:if>
		<xsl:apply-templates select="riapp:FactAddress"/>
		<xsl:if test="riapp:FinancialRequisites"/>
		<xsl:if test="riapp:FinancialRequisites">
			<div class="title marg-top">Финансовые реквизиты организации</div>
		</xsl:if>
		<xsl:apply-templates select="riapp:FinancialRequisites"/>
		<xsl:if test="riapp:PresentedDocument">
			<div class="title marg-top">Направленные с заявкой документы</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Наименование документа</td>
						<td class="graphMain bordered">Номер документа</td>
						<td class="graphMain bordered">Дата документа</td>
						<td class="graphMain bordered">Код документа. 2 символа, числовой</td>
						<td class="graphMain bordered">Данные файла в кодировке BASE64</td>
					</tr>
					<xsl:for-each select="riapp:PresentedDocument">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа riapp:DocumentType -->
	<xsl:template match="riapp:PresentedDocument">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="riapp:Code"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="string-length(string(riapp:DocumentsBody)) &gt; 0">Есть</xsl:when>
					<xsl:otherwise>Нет</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
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
