<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:fssp_cpd_req="urn:customs.ru:Information:SQDocuments:FsspCustomsPaymentsDecreesRequest:5.13.3">
	<!-- Шаблон для типа FsspCustomsPaymentsDecreesRequestType -->
	<xsl:template match="fssp_cpd_req:FsspCustomsPaymentsDecreesRequest">
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
										<b>Сведения из системы ЕАИС таможенных органов, необходимые для возбуждения и ведения исполнительного производства по постановлениям о взыскании таможенных платежей, процентов и пеней за счет имущества плательщика</b>
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
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="fssp_cpd_req:ConversationId"/>
							</td>
						</tr>
					</table>
					<xsl:if test="fssp_cpd_req:EaisId">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Идентификатор ИД АИС ведомства</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="fssp_cpd_req:EaisId"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата отправки документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_cpd_req:DocumentDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="fssp_cpd_req:Barcode">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Штрих-код</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="fssp_cpd_req:Barcode"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип исполнительного документа (ИД)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="fssp_cpd_req:ExecutiveDocumentType"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Номер постановления о взыскании таможенных платежей, процентов, пеней за счет имущества плательщика</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="fssp_cpd_req:ResolutionNumber"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата постановления о взыскании таможенных платежей, процентов, пеней за счет имущества плательщика</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_cpd_req:ResolutionDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Экземпляр ИД</td>
							<td class="graphMain value" style="width:50%">
								<xsl:for-each select="fssp_cpd_req:ExecutiveDocumentCopy">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Номер решения о взыскании таможенных платежей, процентов, пеней за счет имущества плательщика</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="fssp_cpd_req:DecisionNumber"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата решения о взыскании таможенных платежей, процентов, пеней за счет имущества плательщика</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_cpd_req:DecisionDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Номер требования об уплате таможенных платежей</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="fssp_cpd_req:RequirementNumber"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата требования об уплате таможенных платежей</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_cpd_req:RequirementDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="fssp_cpd_req:PartExecutionDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата частичного исполнения инкассового поручения (при наличии)</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="fssp_cpd_req:PartExecutionDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="fssp_cpd_req:CollectionComissionDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата постановки инкассового поручения в картотеку (при наличии)</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="fssp_cpd_req:CollectionComissionDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="fssp_cpd_req:AccountClosingDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата закрытия счета плательщика (при наличии)</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="fssp_cpd_req:AccountClosingDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип должника</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:DebtorType"/></td>
						</tr>
					</table>
					<xsl:if test="fssp_cpd_req:Creditor">
						<div class="title marg-top">Взыскатель</div>
						<xsl:apply-templates select="fssp_cpd_req:Creditor"/>
					</xsl:if>
					<xsl:if test="fssp_cpd_req:SignPerson">
						<div class="title marg-top">ФИО и должность подписавшего лица</div>
						<xsl:apply-templates select="fssp_cpd_req:SignPerson"/>
					</xsl:if>
					<xsl:if test="fssp_cpd_req:LegalEntity">
						<div class="title marg-top">Юридическое лицо/Индивидуальный предприниматель</div>
						<xsl:apply-templates select="fssp_cpd_req:LegalEntity"/>
					</xsl:if>
					<xsl:if test="fssp_cpd_req:DebtInfo">
						<div class="title marg-top">Информация о задолженности</div>
						<xsl:apply-templates select="fssp_cpd_req:DebtInfo"/>
					</xsl:if>
					<xsl:if test="fssp_cpd_req:ExecutiveDocument">
						<div class="title marg-top">Исполнительный документ</div>
						<xsl:apply-templates select="fssp_cpd_req:ExecutiveDocument"/>
					</xsl:if>
					<xsl:if test="fssp_cpd_req:Information">
						<div class="title marg-top">Сведения о должнике</div>
						<xsl:apply-templates select="fssp_cpd_req:Information"/>
					</xsl:if>
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
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
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
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="fssp_cpd_req:Address| fssp_cpd_req:AddressDetails| fssp_cpd_req:LegalAddress">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text>Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа fssp_cpd_req:CreditorType -->
	<xsl:template match="fssp_cpd_req:Creditor">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код взыскателя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:Code"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование взыскателя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:Name"/></td>
			</tr>
			<xsl:if test="fssp_cpd_req:Address">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес взыскателя</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_cpd_req:Address"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_cpd_req:DebtInfoType -->
	<xsl:template match="fssp_cpd_req:DebtInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма задолженности</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_cpd_req:Sum, '.', ',')"/></td>
			</tr>
		</table>
		<div class="marg-top"><i>Сумма по видам платежа</i></div>
		<xsl:apply-templates select="fssp_cpd_req:DebtRecInfo"/>
		<br/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак дубликата</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="fssp_cpd_req:IsDublicate='true' or fssp_cpd_req:IsDublicate='1'">есть</xsl:when>
						<xsl:otherwise>нет</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата вступления постановления в законную силу</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_cpd_req:RulingStartDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата выдачи постановления</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_cpd_req:RulingDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_cpd_req:DebtRecInfoType -->
	<xsl:template match="fssp_cpd_req:DebtRecInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код бюджетной классификации</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:KBK"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование вида платежа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:if test="fssp_cpd_req:PaymentModeCode">(<xsl:value-of select="fssp_cpd_req:PaymentModeCode"/>) </xsl:if>
					<xsl:value-of select="fssp_cpd_req:PaymentType"/>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма по виду платежа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_cpd_req:TypesSum, '.', ',')"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_cpd_req:ExecutiveDocumentType -->
	<xsl:template match="fssp_cpd_req:ExecutiveDocument">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Исполнительный документ</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:ExecutiveDocument"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">ЭП исполнительного документа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:ExecutiveDocumentSign"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_cpd_req:InformationType -->
	<xsl:template match="fssp_cpd_req:Information">
		<xsl:apply-templates select="fssp_cpd_req:OrganizationName"/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Организационно-правовая форма</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:OPF"/></td>
			</tr>
			<xsl:if test="fssp_cpd_req:AddressDetails">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес в расшифровке</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_cpd_req:AddressDetails"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_cpd_req:DebtorPhone">
				<tr>
					<td class="annot graphMain" style="width:50%">Телефон должника</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:DebtorPhone"/></td>
				</tr>
			</xsl:if>
		</table>
		<div class="marg-top"><i>Реквизиты для перечисления</i></div>
		<xsl:apply-templates select="fssp_cpd_req:Transfer"/>
	</xsl:template>
	<!-- Шаблон для типа fssp_cpd_req:LegalEntityType -->
	<xsl:template match="fssp_cpd_req:LegalEntity| fssp_cpd_req:OrganizationName">
		<table class="w190">
			<xsl:if test="cat_ru:OrganizationLanguage">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="graphMain value" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName"> (</xsl:if>
						<xsl:value-of select="cat_ru:ShortName"/>
						<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName">)</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_cpd_req:Address">
				<tr>
					<td class="annot graphMain" style="width:50%">Фактический адрес</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_cpd_req:Address"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_cpd_req:LegalAddress">
				<tr>
					<td class="annot graphMain" style="width:50%">Юридический адрес</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_cpd_req:LegalAddress"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_cpd_req:RegistrationDate">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации должника ЮЛ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="fssp_cpd_req:RegistrationDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="fssp_cpd_req:SignPerson">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Ф.И.О.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
					<xsl:value-of select="cat_ru:PersonName"/>&#160;
					<xsl:value-of select="cat_ru:PersonMiddleName"/>
				</td>
			</tr>
			<xsl:if test="cat_ru:PersonPost">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonPost"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_cpd_req:TransferType -->
	<xsl:template match="fssp_cpd_req:Transfer">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование получателя</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:ReceiverName"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Банк получателя (взыскателя)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:BankName"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">БИК банка получаетля (взыскателя)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:BankBIC"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Расчетный счет получателя (взыскателя)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:ReceiverAccount"/></td>
			</tr>
			<xsl:if test="fssp_cpd_req:INN">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН получателя (взыскателя)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:INN"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_cpd_req:KPP">
				<tr>
					<td class="annot graphMain" style="width:50%">КПП получателя (взыскателя)</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:KPP"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_cpd_req:OKTMO">
				<tr>
					<td class="annot graphMain" style="width:50%">ОКТМО</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:OKTMO"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">КБК</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:KBK"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Лицевой счет</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:Account"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Показатель типа платежа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_cpd_req:PaymentType"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма, перечисляемая по данным реквизитам</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_cpd_req:Sum, '.', ',')"/></td>
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
