<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:ndfl3res="urn:customs.ru:Information:SQDocuments:Fns3NDFLInfoRes:5.13.3">
	<!-- Шаблон для типа Fns3NDFLInfoResType -->
	<xsl:template match="ndfl3res:Fns3NDFLInfoRes">
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
										<b>Ответ на запрос сведений из декларации о доходах физических лиц 3-НДФЛ</b>
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
							<td class="annot graphMain" style="width:50%">Отчетный налоговый период</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ndfl3res:FiscalYear"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ndfl3res:PersonFio">
						<div class="title marg-top">ФИО физического лица</div>
					</xsl:if>
					<xsl:apply-templates select="ndfl3res:PersonFio"/>
					<xsl:if test="ndfl3res:Address">
						<div class="title marg-top">Сведения об адресе физического лица</div>
					</xsl:if>
					<xsl:apply-templates select="ndfl3res:Address"/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">ИНН физического лица</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ndfl3res:INN"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ndfl3res:IdentityCard">
						<div class="title marg-top">Сведения из документа, удостоверяющего личность</div>
					</xsl:if>
					<xsl:apply-templates select="ndfl3res:IdentityCard"/>
					<xsl:if test="ndfl3res:Base13"/>
					<xsl:if test="ndfl3res:Base13">
						<div class="title marg-top">Расчет налоговой базы и суммы налога по доходам, облагаемым по ставке 13%</div>
					</xsl:if>
					<xsl:apply-templates select="ndfl3res:Base13"/>
					<xsl:if test="ndfl3res:Base30"/>
					<xsl:if test="ndfl3res:Base30">
						<div class="title marg-top">Расчет налоговой базы и суммы налога по доходам, облагаемым по ставке 30%</div>
					</xsl:if>
					<xsl:apply-templates select="ndfl3res:Base30"/>
					<xsl:if test="ndfl3res:Base35"/>
					<xsl:if test="ndfl3res:Base35">
						<div class="title marg-top">Расчет налоговой базы и суммы налога по доходам, облагаемым по ставке 35%</div>
					</xsl:if>
					<xsl:apply-templates select="ndfl3res:Base35"/>
					<xsl:if test="ndfl3res:Base9"/>
					<xsl:if test="ndfl3res:Base9">
						<div class="title marg-top">Расчет налоговой базы и суммы налога по доходам, облагаемым по ставке 9%</div>
					</xsl:if>
					<xsl:apply-templates select="ndfl3res:Base9"/>
					<xsl:if test="ndfl3res:Base15"/>
					<xsl:if test="ndfl3res:Base15">
						<div class="title marg-top">Расчет налоговой базы и суммы налога по доходам, облагаемым по ставке 15%</div>
					</xsl:if>
					<xsl:apply-templates select="ndfl3res:Base15"/>
					<xsl:if test="ndfl3res:Total">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Итоговая общая сумма дохода</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="ndfl3res:Total"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ndfl3res:Activities"/>
					<xsl:if test="ndfl3res:Activities">
						<div class="title marg-top">Показатели, используемые для расчёта налоговой базы и суммы налога по виду деятельности</div>
					</xsl:if>
					<xsl:apply-templates select="ndfl3res:Activities"/>
					<xsl:if test="ndfl3res:ErrorMessage">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Информация об ошибке данных</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="ndfl3res:ErrorMessage"/>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ndfl3res:ActivitiesType -->
	<xsl:template match="ndfl3res:Activities">
		<div class="title marg-top">Показатель, используемый для расчёта налоговой базы и суммы налога по виду деятельности</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered">Код вида деятельности</td>
					<td class="graphMain bordered">Код вида предпринимательской деятельности</td>
					<td class="graphMain bordered">Сумма дохода</td>
				</tr>
				<xsl:for-each select="ndfl3res:Activity">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ndfl3res:ActivityType -->
	<xsl:template match="ndfl3res:Activity">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="ndfl3res:Code"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ndfl3res:OKVED"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ndfl3res:Income"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ndfl3res:AddressType -->
	<xsl:template match="ndfl3res:Address">
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
					<td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
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
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак адреса налогоплательщика</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(ndfl3res:AddressSign, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Текстовое значение признака адреса налогоплательщика</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ndfl3res:AddressSignTitle"/>
				</td>
			</tr>
		</table>
		<xsl:if test="ndfl3res:IntracityDistrict">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Внутригородской район</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:IntracityDistrict"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ndfl3res:AdditionalTerritory">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Доп. территория</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:AdditionalTerritory"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ndfl3res:StreetAdditionalTerritory">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Улица на доп.территории</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:StreetAdditionalTerritory"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ndfl3res:Building">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Корпус</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:Building"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ndfl3res:Structure">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Строение</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:Structure"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ndfl3res:BaseType -->
	<xsl:template match="ndfl3res:Base13">
		<xsl:if test="ndfl3res:Income">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Общая сумма дохода</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:Income"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ndfl3res:Base">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Налоговая база</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:Base"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ndfl3res:BaseType -->
	<xsl:template match="ndfl3res:Base15">
		<xsl:if test="ndfl3res:Income">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Общая сумма дохода</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:Income"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ndfl3res:Base">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Налоговая база</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:Base"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ndfl3res:BaseType -->
	<xsl:template match="ndfl3res:Base30">
		<xsl:if test="ndfl3res:Income">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Общая сумма дохода</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:Income"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ndfl3res:Base">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Налоговая база</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:Base"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ndfl3res:BaseType -->
	<xsl:template match="ndfl3res:Base35">
		<xsl:if test="ndfl3res:Income">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Общая сумма дохода</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:Income"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ndfl3res:Base">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Налоговая база</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:Base"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ndfl3res:BaseType -->
	<xsl:template match="ndfl3res:Base9">
		<xsl:if test="ndfl3res:Income">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Общая сумма дохода</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:Income"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ndfl3res:Base">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Налоговая база</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ndfl3res:Base"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ndfl3res:IdentityCardType -->
	<xsl:template match="ndfl3res:IdentityCard">
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
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Серия и номер документа (в одну строку)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ndfl3res:DocumentSeriesNumber"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата рождения физического лица</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ndfl3res:BirthDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Место рождения физического лица</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ndfl3res:BirthPlace"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="ndfl3res:PersonFio">
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
