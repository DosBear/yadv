<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:fssp_acd_req="urn:customs.ru:Information:SQDocuments:FsspApCasesDecreesRequest:5.13.3">
	<!-- Шаблон для типа FsspApCasesDecreesRequestType -->
	<xsl:template match="fssp_acd_req:FsspApCasesDecreesRequest">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
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
										<b>Сведения из системы ЕАИС таможенных органов, необходимые для возбуждения и ведения исполнительного производства по постановлениям по делам об административных правонарушениях, вынесенные таможенными органами</b>
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
					<table class="w190">
						<xsl:if test="fssp_acd_req:ConversationId">
							<tr>
								<td class="annot graphMain" style="width:50%">Сведения о цепочке обмена сообщениями</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:ConversationId"/></td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор ИД АИС ведомства</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:EaisId"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата отправки документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_acd_req:DocumentDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<xsl:if test="fssp_acd_req:Barcode">
							<tr>
								<td class="annot graphMain" style="width:50%">Штрих-код</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:Barcode"/></td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Исполнительный документ - решение по делу (ИД)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="fssp_acd_req:ExecutiveDocumentType"/>&#160;
								№ <xsl:value-of select="fssp_acd_req:APCaseNumber"/>&#160;
								от&#32;
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_acd_req:CaseDecisionDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование органа, выдавшего ИД</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:ExecutiveDocumentIssuerName"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Адрес органа, выдавшего ИД</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_req:ExecutiveDocumentIssuerAddress"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">ФИО и должность подписавшего лица</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_req:SignPerson"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата вступления в законную силу</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_acd_req:ExecutionDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Должник</div>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип должника</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:DebtorType"/></td>
						</tr>
					</table>
					<xsl:if test="fssp_acd_req:PrivatePerson"><div class="marg-top2"><i>Физическое лицо</i></div></xsl:if>
					<xsl:apply-templates select="fssp_acd_req:PrivatePerson"/>
					<xsl:if test="fssp_acd_req:LegalEntity"><div class="marg-top2"><i>Юридическое лицо</i></div></xsl:if>
					<xsl:apply-templates select="fssp_acd_req:LegalEntity"/>
					<div class="title marg-top">Взыскатель</div>
					<xsl:apply-templates select="fssp_acd_req:Creditor"/>
					<div class="title marg-top">Предмет исполнения</div>
					<xsl:apply-templates select="fssp_acd_req:ExecutiveObject"/>
					<div class="title marg-top">Информация о задолженности</div>
					<xsl:apply-templates select="fssp_acd_req:DebtInfo"/>
					<div class="title marg-top">Исполнительный документ</div>
					<xsl:apply-templates select="fssp_acd_req:ExecutiveDocument"/>
					<div class="title marg-top">Сведения</div>
					<xsl:apply-templates select="fssp_acd_req:Information"/>
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
	<xsl:template match="fssp_acd_req:Address | fssp_acd_req:AddressInformation | fssp_acd_req:LegalAddress | fssp_acd_req:DebtorAddress | fssp_acd_req:ExecutiveDocumentIssuerAddress">
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
	<!-- Шаблон для типа fssp_acd_req:CreditorType -->
	<xsl:template match="fssp_acd_req:Creditor">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код взыскателя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:Code"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование взыскателя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:Name"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Адрес взыскателя</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_req:Address"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_acd_req:DebtInfoType -->
	<xsl:template match="fssp_acd_req:DebtInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма долга или начисления долга</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_acd_req:Sum, '.', ',')"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата срока добровольного погашения задолженности</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_acd_req:RepaymentDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Признак дубликата</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="fssp_acd_req:IsDublicate='true' or fssp_acd_req:IsDublicate=1">есть</xsl:when>
						<xsl:otherwise>нет</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Признак отсутствия оплаты задолженности</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="fssp_acd_req:IsUnpaid='true' or fssp_acd_req:IsUnpaid=1">есть</xsl:when>
						<xsl:otherwise>нет</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="fssp_acd_req:DebtorName | fssp_acd_req:SignPerson">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="cat_ru:PersonName"/>&#160;
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="cat_ru:PersonPost">, должность: <xsl:value-of select="cat_ru:PersonPost"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа fssp_acd_req:ExecutiveDocumentType -->
	<xsl:template match="fssp_acd_req:ExecutiveDocument">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Исполнительный документ</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:ExecutiveDocument"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">ЭП исполнительного документа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:ExecutiveDocumentSign"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_acd_req:ExecutiveObjectType -->
	<xsl:template match="fssp_acd_req:ExecutiveObject">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип предмета исполнения</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:Type"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование предмета исполнения</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:Name"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_acd_req:PrivatePersonType -->
	<xsl:template match="fssp_acd_req:IdentityCard | fssp_acd_req:PrivatePerson">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Ф.И.О.</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_req:DebtorName"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Адрес по месту регистрации/пребывания</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_req:DebtorAddress"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата рождения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_acd_req:BirthDate"/>
					</xsl:call-template>
					<xsl:choose>
						<xsl:when test="fssp_acd_req:TruthBirthDate='0'"> (полная точность)</xsl:when>
						<xsl:when test="fssp_acd_req:TruthBirthDate='1'"> (с точностью до месяца, число недостоверно)</xsl:when>
						<xsl:when test="fssp_acd_req:TruthBirthDate='2'"> (с точностью до года, число и месяц недостоверны)</xsl:when>
					</xsl:choose>
				</td>
			</tr>
			<xsl:if test="fssp_acd_req:BirthPlace">
				<tr>
					<td class="annot graphMain" style="width:50%">Место рождения</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:BirthPlace"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_acd_req:INN">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:INN"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_acd_req:OGRNIP">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРНИП</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:OGRNIP"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Паспортные данные</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_req:Passport"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_acd_req:InformationType -->
	<xsl:template match="fssp_acd_req:Information">
		<xsl:apply-templates select="fssp_acd_req:IdentityCard"/>
		<table class="w190">
			<xsl:if test="fssp_acd_req:AddressInformation">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_req:AddressInformation"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_acd_req:DebtorPhone">
				<tr>
					<td class="annot graphMain" style="width:50%">Телефон должника</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:DebtorPhone"/></td>
				</tr>
			</xsl:if>
		</table>	
		<div class="marg-top2"><i>Реквизиты для перечисления</i></div>
		<xsl:apply-templates select="fssp_acd_req:Transfer"/>
	</xsl:template>
	<!-- Шаблон для типа fssp_acd_req:LegalEntityType -->
	<xsl:template match="fssp_acd_req:LegalEntity">
		<table class="w190">
			<xsl:if test="cat_ru:OrganizationLanguage">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации</td>
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
			<tr>
				<td class="annot graphMain" style="width:50%">Фактический адрес</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_req:Address"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Юридический адрес</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_req:LegalAddress"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="fssp_acd_req:Passport">
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
	<!-- Шаблон для типа fssp_acd_req:TransferType -->
	<xsl:template match="fssp_acd_req:Transfer">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование получателя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:ReceiverName"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Банк получателя (взыскателя)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:BankName"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">БИК банка получаетля (взыскателя)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:BankBIC"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Расчетный счет получателя (взыскателя)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:ReceiverAccount"/></td>
			</tr>
			<xsl:if test="fssp_acd_req:INN">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН получателя (взыскателя)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:INN"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_acd_req:KPP">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП получателя (взыскателя)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:KPP"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_acd_req:OKTMO">
				<tr>
					<td class="annot graphMain" style="width:50%">ОКТМО</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:OKTMO"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_acd_req:KBK">
				<tr>
					<td class="annot graphMain" style="width:50%">КБК</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:KBK"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Лицевой счет</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:Account"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Показатель типа платежа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_req:PaymentType"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма, перечисляемая по данным реквизитам</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_acd_req:Sum, '.', ',')"/></td>
			</tr>
		</table>
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
