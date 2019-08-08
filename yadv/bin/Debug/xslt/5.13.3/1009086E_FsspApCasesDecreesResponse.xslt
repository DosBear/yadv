<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:fssp_acd_res="urn:customs.ru:Information:SQDocuments:FsspApCasesDecreesResponse:5.13.3">
	<!-- Шаблон для типа FsspApCasesDecreesResponseType -->
	<xsl:template match="fssp_acd_res:FsspApCasesDecreesResponse">
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
										<b>Ответ на передачу сведений из системы ЕАИС таможенных органов, необходимых для возбуждения и ведения исполнительного производства по постановлениям по делам об административных правонарушениях, вынесенные таможенными органами</b>
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
						<tr>
							<td class="annot graphMain" style="width:50%">Сведения о цепочке обмена сообщениями</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:ConversationId"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор ИД АИС ведомства</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:EaisId"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата отправки документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_acd_res:DocumentDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<xsl:if test="fssp_acd_res:Barcode">
							<tr>
								<td class="annot graphMain" style="width:50%">Штрих-код</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:Barcode"/></td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Исполнительный документ (ИД)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="fssp_acd_res:ExecutiveDocumentType"/>&#160;
								№ <xsl:value-of select="fssp_acd_res:ExecutiveDocumentNumber"/>&#160;
								от&#32;
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_acd_res:ExecutiveDocumentDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Экземпляр ИД</td>
							<td class="graphMain value" style="width:50%">
								<xsl:for-each select="fssp_acd_res:ExecutiveDocumentCopy">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Номер дела или материалов</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:CaseNumber"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата принятия решения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_acd_res:DecisionDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование органа, выдавшего ИД</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:ExecutiveDocumentIssuerName"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Адрес органа, выдавшего ИД</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_res:ExecutiveDocumentIssuerAddress"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">ФИО и должность подписавшего лица</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_res:SignPerson"/></td>
						</tr>
					</table>
					<div class="title marg-top">Должник</div>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип должника</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:DebtorType"/></td>
						</tr>
					</table>
					<xsl:if test="fssp_acd_res:PrivatePerson"><div class="marg-top"><i>Физическое лицо</i></div></xsl:if>
					<xsl:apply-templates select="fssp_acd_res:PrivatePerson"/>
					<xsl:if test="fssp_acd_res:LegalEntity"><div class="marg-top"><i>Юридическое лицо</i></div></xsl:if>
					<xsl:apply-templates select="fssp_acd_res:LegalEntity"/>
					<div class="title marg-top">Взыскатель</div>
					<xsl:apply-templates select="fssp_acd_res:Creditor"/>
					<div class="title marg-top">Предмет исполнения</div>
					<xsl:apply-templates select="fssp_acd_res:ExecutiveObject"/>
					<div class="title marg-top">Информация о задолженности</div>
					<xsl:apply-templates select="fssp_acd_res:DebtInfo"/>
					<div class="title marg-top">Исполнительный документ</div>
					<xsl:apply-templates select="fssp_acd_res:ExecutiveDocument"/>
					<div class="title marg-top">Сведения</div>
					<xsl:apply-templates select="fssp_acd_res:Information"/>
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
	<xsl:template match="fssp_acd_res:Address| fssp_acd_res:AddressInformation| fssp_acd_res:DebtorAddress| fssp_acd_res:ExecutiveDocumentIssuerAddress">
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
	<!-- Шаблон для типа fssp_acd_res:CreditorType -->
	<xsl:template match="fssp_acd_res:Creditor">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код взыскателя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:Code"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование взыскателя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:Name"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Адрес взыскателя</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_res:Address"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_acd_res:DebtInfoType -->
	<xsl:template match="fssp_acd_res:DebtInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма долга или начисления долга</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_acd_res:Sum, '.', ',')"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата срока добровольного погашения задолженности</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_acd_res:RepaymentDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Признак дубликата</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="fssp_acd_res:IsDublicate='true' or fssp_acd_res:IsDublicate='1'">есть</xsl:when>
						<xsl:otherwise>нет</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="fssp_acd_res:DebtorName| fssp_acd_res:SignPerson">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="cat_ru:PersonName"/>&#160;
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="cat_ru:PersonPost">, должность: <xsl:value-of select="cat_ru:PersonPost"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа fssp_acd_res:ExecutiveDocumentType -->
	<xsl:template match="fssp_acd_res:ExecutiveDocument">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Исполнительный документ</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:ExecutiveDocument"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">ЭП исполнительного документа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:ExecutiveDocumentSign"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_acd_res:ExecutiveObjectType -->
	<xsl:template match="fssp_acd_res:ExecutiveObject">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип предмета исполнения</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:Type"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование предмета исполнения</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:Name"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_acd_res:PrivatePersonType -->
	<xsl:template match="fssp_acd_res:IdentityCard| fssp_acd_res:PrivatePerson">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Ф.И.О.</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_res:DebtorName"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Адрес по месту регистрации/пребывания</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_res:DebtorAddress"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата рождения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_acd_res:BirthDate"/>
					</xsl:call-template>
					<xsl:choose>
						<xsl:when test="fssp_acd_res:TruthBirthDate='0'"> (полная точность)</xsl:when>
						<xsl:when test="fssp_acd_res:TruthBirthDate='1'"> (с точностью до месяца, число недостоверно)</xsl:when>
						<xsl:when test="fssp_acd_res:TruthBirthDate='2'"> (с точностью до года, число и месяц недостоверны)</xsl:when>
					</xsl:choose>
				</td>
			</tr>
			<xsl:if test="fssp_acd_res:BirthPlace">
				<tr>
					<td class="annot graphMain" style="width:50%">Место рождения</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:BirthPlace"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_acd_res:INN">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:INN"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_acd_res:OGRNIP">
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРНИП</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:OGRNIP"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Паспортные данные</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_res:Passport"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_acd_res:InformationType -->
	<xsl:template match="fssp_acd_res:Information">
		<xsl:apply-templates select="fssp_acd_res:IdentityCard"/>
		<table class="w190">
			<xsl:if test="fssp_acd_res:AddressInformation">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_acd_res:AddressInformation"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_acd_res:DebtorPhone">
				<tr>
					<td class="annot graphMain" style="width:50%">Телефон должника</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:DebtorPhone"/></td>
				</tr>
			</xsl:if>	
		</table>
		<div class="marg-top"><i>Реквизиты для перечисления</i></div>
		<xsl:apply-templates select="fssp_acd_res:Transfer"/>
	</xsl:template>
	<!-- Шаблон для типа fssp_acd_res:LegalEntityType -->
	<xsl:template match="fssp_acd_res:LegalEntity">
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
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:Address"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Юридический адрес</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:LegalAddress"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="fssp_acd_res:Passport">
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
	<!-- Шаблон для типа fssp_acd_res:TransferType -->
	<xsl:template match="fssp_acd_res:Transfer">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование получателя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:ReceiverName"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Банк получателя (взыскателя)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:BankName"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">БИК банка</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:BankBIC"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Расчетный счет получателя (взыскателя)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:ReceiverAccount"/></td>
			</tr>
			<xsl:if test="fssp_acd_res:INN">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН получателя (взыскателя)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:INN"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_acd_res:KPP">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП получателя (взыскателя)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:KPP"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_acd_res:OKTMO">
				<tr>
					<td class="annot graphMain" style="width:50%">ОКТМО</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:OKTMO"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_acd_res:KBK">
				<tr>
					<td class="annot graphMain" style="width:50%">КБК</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:KBK"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Лицевой счет</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:Account"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Показатель типа платежа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_acd_res:PaymentType"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма, перечисляемая по данным реквизитам</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_acd_res:Sum, '.', ',')"/></td>
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
