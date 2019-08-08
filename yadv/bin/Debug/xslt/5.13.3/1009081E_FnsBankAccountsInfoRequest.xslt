<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ba_req="urn:customs.ru:Information:SQDocuments:FnsBankAccountsInfoRequest:5.13.2">
	<!-- Шаблон для типа FnsBankAccountsInfoRequestType -->
	<xsl:template match="ba_req:FnsBankAccountsInfoRequest">
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
										<b>Запрос cведений о банковских счетах (вкладах)</b>
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
					<xsl:if test="ba_req:PhysicalPersonInfo">
						<div class="title marg-top">Сведения о физическом лице</div>
						<xsl:apply-templates select="ba_req:PhysicalPersonInfo"/>
					</xsl:if>
					
					<xsl:if test="ba_req:JuridicalPersonInfo">
						<div class="title marg-top">Сведения о юридическом лице</div>
						<xsl:apply-templates select="ba_req:JuridicalPersonInfo"/>
					</xsl:if>
					<xsl:if test="ba_req:AccountStartDate or ba_req:AccountEndDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата открытия счета</td>
								<td class="value graphMain" style="width:50%">
									<xsl:if test="ba_req:AccountStartDate">
										<xsl:text>c </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="ba_req:AccountStartDate"/>
										</xsl:call-template>
										<xsl:text> </xsl:text>
									</xsl:if>
									<xsl:if test="ba_req:AccountEndDate">
										<xsl:text>по </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="ba_req:AccountEndDate"/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ba_req:AccountStateCode">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Код состояния счета</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="ba_req:AccountStateCode='true'">
											<xsl:text>действующий</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>закрыт</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="ba_req:IdentityCard">
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
					<td class="annot graphMain" style="width:50%">Краткое наименование документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Серия документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IdentityCardSeries"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
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
					<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ba_req:ReqJuridicalPersonInfoType -->
	<xsl:template match="ba_req:JuridicalPersonInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Резидент РФ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ba_req:ResidentRFSign='1' or ba_req:ResidentRFSign='true'">да</xsl:when>
						<xsl:when test="ba_req:ResidentRFSign='0' or ba_req:ResidentRFSign='false'">нет</xsl:when>
						<xsl:otherwise><xsl:value-of select="ba_req:ResidentRFSign"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ИНН</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="ba_req:INN"/></td>
			</tr>
		</table>
		<xsl:if test="ba_req:KPP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ba_req:KPP"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ba_req:OGRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРН организации - резидента</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ba_req:OGRN"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ba_req:KIO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код иностранной организации</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ba_req:KIO"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="ba_req:PersonFIO">
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
	<!-- Шаблон для типа ba_req:ReqPhysicalPersonInfoType -->
	<xsl:template match="ba_req:PhysicalPersonInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Индивидуальный предприниматель</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="ba_req:SoleTraderSign='1' or ba_req:SoleTraderSign='true'">Да</xsl:when>
						<xsl:when test="ba_req:SoleTraderSign='0' or ba_req:SoleTraderSign='false'">Нет</xsl:when>
						<xsl:otherwise><xsl:value-of select="ba_req:SoleTraderSign"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="ba_req:PersonFIO">
			<div class="title marg-top">ФИО лица</div>
			<xsl:apply-templates select="ba_req:PersonFIO"/>
		</xsl:if>
		<xsl:if test="ba_req:BirthDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата рождения физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ba_req:BirthDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ba_req:IdentityCard">
			<div class="title marg-top">Документ, удостоверяющий личность</div>
			<xsl:apply-templates select="ba_req:IdentityCard"/>
		</xsl:if>
		
		<xsl:if test="ba_req:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ba_req:INN"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ba_req:OGRNIP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРНИП</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="ba_req:OGRNIP"/></td>
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
