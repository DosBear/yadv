<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:fssp_epd_req="urn:customs.ru:Information:SQDocuments:FsspExecutoryProcessDebtorsRequest:5.13.3">
	<!-- Шаблон для типа FsspExecutoryProcessDebtorsRequestType -->
	<xsl:template match="fssp_epd_req:FsspExecutoryProcessDebtorsRequest">
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

					.marg-top2
					{
					margin-top:2mm;
					font-style: italic;
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
						<tr>
							<td align="center" class="graphMain">
								<font size="4">
									<b>Запрос сведений из системы ЕАИС таможенных органов по запросу судебного пристава-исполнителя сведений о должниках по исполнительным производствам, стороной которого он является</b>
								</font>
							</td>
						</tr>
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Сведения о цепочке обмена сообщениями</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:ConversationId"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Ключ документа ФССП России</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:DocumentKey"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Запрос</td>
							<td class="value graphMain" style="width:50%">
								№ <xsl:value-of select="fssp_epd_req:RequestNumber"/>&#160;
								от&#32;
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_epd_req:RequestDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Код СПИ</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:SPICode"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">ФИО СПИ</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:SPIFullName"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">ФИО и должность СПИ</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_epd_req:SPIPerson"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Телефон СПИ</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:SPIPhone"/></td>
						</tr>
						<xsl:if test="fssp_epd_req:SPIHeadFullName">
							<tr>
								<td class="annot graphMain" style="width:50%">ФИО старшего СПИ</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:SPIHeadFullName"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="fssp_epd_req:SPIHeadPerson">
							<tr>
								<td class="annot graphMain" style="width:50%">ФИО и должность старшего СПИ</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_epd_req:SPIHeadPerson"/></td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Срок ответа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_epd_req:ResponseDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата создания</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_epd_req:CreationDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Сведения об исполнительном производстве</div>
					<xsl:apply-templates select="fssp_epd_req:ExecutoryProcess"/>
					<div class="title marg-top">Сведения</div>
					<xsl:apply-templates select="fssp_epd_req:Information"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об отсутствии НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="fssp_epd_req:Address | fssp_epd_req:AddressInformation | fssp_epd_req:DebtorAddress">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text>Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalCode"><xsl:value-of select="RUScat_ru:PostalCode"/>, </xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
		<xsl:if test="RUScat_ru:CounryName"><xsl:value-of select="RUScat_ru:CounryName"/></xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text>номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text> (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
<!-- Шаблон для типа fssp_epd_req:DebtorInformationType -->
	<xsl:template match="fssp_epd_req:DebtorInformation">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип должника</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:DebtorType"/></td>
			</tr>
		</table>
		<xsl:apply-templates select="fssp_epd_req:DebtorNameFull"/>
		<table class="w190">
			<xsl:if test="fssp_epd_req:DebtorNameParts and not(fssp_epd_req:DebtorNameFull/cat_ru:OrganizationName)">
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО должника</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_epd_req:DebtorNameParts"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Адрес должника по ИД</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_epd_req:DebtorAddress"/></td>
			</tr>
			<xsl:if test="fssp_epd_req:SNILS">
				<tr>
					<td class="annot graphMain" style="width:50%">СНИЛС</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:SNILS"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_epd_req:OSP or fssp_epd_req:OSPName">
				<tr>
					<td class="annot graphMain" style="width:50%">ОСП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="fssp_epd_req:OSP"/>&#160;
						<xsl:value-of select="fssp_epd_req:OSPName"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_epd_req:BirthDate or fssp_epd_req:TruthBirthDate">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата рождения ФЛ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="fssp_epd_req:BirthDate"/>
						</xsl:call-template>
						<xsl:choose>
							<xsl:when test="fssp_epd_req:TruthBirthDate='0'"> (полная точность)</xsl:when>
							<xsl:when test="fssp_epd_req:TruthBirthDate='1'"> (с точностью до месяца, число недостоверно)</xsl:when>
							<xsl:when test="fssp_epd_req:TruthBirthDate='2'"> (с точностью до года, число и месяц недостоверны)</xsl:when>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_epd_req:BirthPlace">
				<tr>
					<td class="annot graphMain" style="width:50%">Место рождения ФЛ</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:BirthPlace"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:OrganizationBaseType -->
	<xsl:template match="fssp_epd_req:DebtorNameFull">
		<table class="w190">
			<xsl:if test="cat_ru:OrganizationLanguage">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО должника</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:ShortName">
							<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
							<xsl:value-of select="cat_ru:ShortName"/>
							<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</xsl:if>
		</table>	
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="fssp_epd_req:DebtorNameParts|fssp_epd_req:FirstName|fssp_epd_req:SPIHeadPerson|fssp_epd_req:SPIPerson">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="cat_ru:PersonName"/>&#160;
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="cat_ru:PersonPost">, должность: <xsl:value-of select="cat_ru:PersonPost"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа fssp_epd_req:ExecutiveObjectType -->
	<xsl:template match="fssp_epd_req:ExecutiveObject">
		<xsl:value-of select="fssp_epd_req:Code"/>&#160;
		<xsl:value-of select="fssp_epd_req:Name"/>
	</xsl:template>
	<!-- Шаблон для типа fssp_epd_req:ExecutoryProcessType -->
	<xsl:template match="fssp_epd_req:ExecutoryProcess">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Ключ ФССП России</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:DocumentKey"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор ИД АИС ведомства</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:EaisId"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Номер ИП строковый</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:ExecutoryProcessNumber"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата возбуждения ИП</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_epd_req:ExecutoryProcessDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование ИП</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:ExecutoryProcesName"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Исполнительный документ (ИД)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="fssp_epd_req:ExecutiveDocumentType"/>&#160;
					№ <xsl:value-of select="fssp_epd_req:ExecutoryDocumentNumber"/>&#160;
					от&#32;
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_epd_req:ExecutoryDocumentDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата вступления в законную силу</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_epd_req:ExecutionDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Предмет исполнения</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_epd_req:ExecutiveObject"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма долга по ИД</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_epd_req:DebtSum, '.', ',')"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма долга по ИД на момент запроса</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_epd_req:DebtSumRequest, '.', ',')"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Код СПИ, ведущего ИП</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:SPIHeadCode"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">ФИО полностью СПИ, ведущего ИП</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:SPIHeadName"/></td>
			</tr>
			<xsl:if test="fssp_epd_req:RelatedExecutoryDocumentNumber">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер прошлых ИП</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="fssp_epd_req:RelatedExecutoryDocumentNumber">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
		</table>
		<div class="marg-top2">Сведения о должнике</div>
		<xsl:apply-templates select="fssp_epd_req:DebtorInformation"/>
	</xsl:template>
	<!-- Шаблон для типа fssp_epd_req:GoodInfoType -->
	<xsl:template match="fssp_epd_req:GoodInfo">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="fssp_epd_req:Status"/></td>
			<td class="graphMain bordered"><xsl:value-of select="fssp_epd_req:Name"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(fssp_epd_req:Cost, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(fssp_epd_req:Quantity, '.', ',')"/></td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="fssp_epd_req:StorageDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered"><xsl:value-of select="fssp_epd_req:StoragePlace"/></td>
			<td class="graphMain bordered"><xsl:value-of select="fssp_epd_req:AdditionalInformation"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа fssp_epd_req:GoodsType -->
	<xsl:template match="fssp_epd_req:Goods">
		<table class="bordered w190">
			<tr class="title">
				<td class="graphMain bordered">Статус товара</td>
				<td class="graphMain bordered">Наименование</td>
				<td class="graphMain bordered">Стоимость</td>
				<td class="graphMain bordered">Количество</td>
				<td class="graphMain bordered">Дата помещения на хранение</td>
				<td class="graphMain bordered">Место хранения</td>
				<td class="graphMain bordered">Доп. информация</td>
			</tr>
			<xsl:for-each select="fssp_epd_req:GoodInfo">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="fssp_epd_req:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode or RUScat_ru:FullIdentityCardName">
			(<xsl:value-of select="cat_ru:IdentityCardCode"/>
			<xsl:if test="RUScat_ru:FullIdentityCardName">&#160;<xsl:value-of select="RUScat_ru:FullIdentityCardName"/></xsl:if>)
		</xsl:if>		
		<xsl:if test="cat_ru:IdentityCardName">
			<xsl:text> </xsl:text>	
			<xsl:value-of select="cat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<xsl:text>серия </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			<xsl:text> </xsl:text>
		</xsl:if>				
		<xsl:if test="cat_ru:IdentityCardNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName or RUScat_ru:IssuerCode">выдан </xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName or RUScat_ru:IssuerCode">
			&#160;<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">&#160;ID органа гос.власти: <xsl:value-of select="RUScat_ru:AuthorityId"/></xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">&#160;код страны: <xsl:value-of select="RUScat_ru:CountryCode"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа fssp_epd_req:InformationType -->
	<xsl:template match="fssp_epd_req:Information">
		<xsl:apply-templates select="fssp_epd_req:IdentityCard"/>
		<table class="w190">
			<xsl:if test="fssp_epd_req:AddressInformation">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_epd_req:AddressInformation"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_epd_req:DebtorPhone">
				<tr>
					<td class="annot graphMain" style="width:50%">Телефон должника</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_epd_req:DebtorPhone"/></td>
				</tr>
			</xsl:if>
		</table>	
		<div class="marg-top2">Сведения о товарах</div>
		<xsl:apply-templates select="fssp_epd_req:Goods"/>
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
