<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:fssp_pa_req="urn:customs.ru:Information:SQDocuments:FsspPropertyArrestRequest:5.13.3">
	<!-- Шаблон для типа FsspPropertyArrestRequestType -->
	<xsl:template match="fssp_pa_req:FsspPropertyArrestRequest">
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
						<tr>
							<td align="center" class="graphMain">
								<font size="4"><b>Сведения из системы (ЕАИС таможенных органов), необходимые для возбуждения и ведения исполнительного производства по постановлениям о наложении ареста на имущество плательщика таможенных пошлин, налогов,  вынесенные таможенными органами</b></font>
							</td>
						</tr>
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
						<xsl:if test="fssp_pa_req:ConversationId">
							<tr>
								<td class="annot graphMain" style="width:50%">Сведения о цепочке обмена сообщениями</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="fssp_pa_req:ConversationId"/>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор ИД АИС ведомства</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:EaisId"/></td>
						</tr>
					</table>
					<xsl:apply-templates mode="id" select="."/>
					<table class="w190">	
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование органа прокуратуры</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:ProsecutorAgencyName"/></td>
						</tr>
						<xsl:if test="fssp_pa_req:ProsecutorName">
							<tr>
								<td class="annot graphMain" style="width:50%">ФИО прокурора</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:ProsecutorName"/></td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата подписания санкции</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_pa_req:SanctionSignDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Постановление о взыскании таможенных платежей, процентов, пеней за счет имущества плательщика</td>
							<td class="value graphMain" style="width:50%">
								№ <xsl:value-of select="fssp_pa_req:PenaltyResolutionNumber"/>&#160;
								от&#32; 
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_pa_req:PenaltyResolutionDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">ФИО и должность подписавшего лица</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:SignPerson"/></td>
						</tr>
					</table>
					<div class="title marg-top">Взыскатель</div>
					<xsl:apply-templates select="fssp_pa_req:Creditor"/>
					<div class="title marg-top">Должник</div>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип должника</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:DebtorType"/></td>
						</tr>
					</table>
					<xsl:apply-templates select="fssp_pa_req:LegalEntity"/>
					<div class="title marg-top">Информация о задолженности</div>
					<xsl:apply-templates select="fssp_pa_req:DebtInfo"/>
					<div class="title marg-top">Представитель плательщика</div>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">ФИО представителя плательщика</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="fssp_pa_req:DebtorRepresentative"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Доверенность</td>
							<td class="value graphMain" style="width:50%">
								№ <xsl:value-of select="fssp_pa_req:AttorneyNumber"/>&#160;
								от&#32; 
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_pa_req:AttorneyDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Постановление о наложении ареста на имущество плательщика таможенных пошлин, налогов (ИД)</div>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата выдачи постановления должнику (представителю)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="fssp_pa_req:DecreeIssuenceDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:apply-templates select="fssp_pa_req:ExecutiveDocument"/>
					<div class="title marg-top">Протокол об аресте имущества</div>
					<xsl:apply-templates select="fssp_pa_req:ArrestProtocol"/>
					<xsl:if test="fssp_pa_req:ArrestCancelDecree">
						<div class="title marg-top">Постановление об отмене ареста на имущество</div>
						<xsl:apply-templates select="fssp_pa_req:ArrestCancelDecree"/>
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
	<xsl:template match="fssp_pa_req:Address| fssp_pa_req:ArrestedPropertyAddress| fssp_pa_req:LegalAddress| fssp_pa_req:StoragePlaceAddress">
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
	<!-- Шаблон для общей части ИД -->
	<xsl:template mode="id" match="*">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата отправки документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_pa_req:DocumentDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:if test="fssp_pa_req:Barcode">
				<tr>
					<td class="annot graphMain" style="width:50%">Штрих-код</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:Barcode"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">
					Исполнительный документ 
					<xsl:choose>
						<xsl:when test="name(.)='fssp_pa_req:FsspPropertyArrestRequest'"> - постановление о наложении ареста на имущество должника </xsl:when>
						<xsl:when test="name(.)='fssp_pa_req:ArrestCancelDecree'"> - постановление об отмене ареста </xsl:when>
						<xsl:when test="name(.)='fssp_pa_req:ArrestProtocol'"> - протокол ареста </xsl:when>
						<xsl:otherwise> </xsl:otherwise>
					</xsl:choose>
					(ИД)
				</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="fssp_pa_req:ExecutiveDocumentType"/>&#160;
					<xsl:choose>
						<xsl:when test="name(.)='fssp_pa_req:FsspPropertyArrestRequest'">
							№ <xsl:value-of select="fssp_pa_req:ArrestResolutionNumber"/>&#160;
							от&#32;
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="fssp_pa_req:ArrestResolutionDate"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="name(.)='fssp_pa_req:ArrestCancelDecree'">
							№ <xsl:value-of select="fssp_pa_req:ResolutionNumber"/>&#160;
							от&#32;
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="fssp_pa_req:ResolutionDate"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="name(.)='fssp_pa_req:ArrestProtocol'">
							№ <xsl:value-of select="fssp_pa_req:ProtocolNumber"/>&#160;
							от&#32;
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="fssp_pa_req:ProtocolDate"/>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Экземпляр ИД</td>
				<td class="graphMain value" style="width:50%">
					<xsl:for-each select="fssp_pa_req:ExecutiveDocumentCopy">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>	
	<!-- Шаблон для типа fssp_pa_req:ArrestCancelDecreeType -->
	<xsl:template match="fssp_pa_req:ArrestCancelDecree">
		<xsl:apply-templates mode="id" select="."/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Основание отмены ареста имущества</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:ArrestCancelBase"/></td>
			</tr>
		</table>
		<xsl:apply-templates select="fssp_pa_req:Creditor"/>
		<table class="w190">
			<xsl:if test="fssp_pa_req:SignPerson">
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО и должность подписавшего лица</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:SignPerson"/></td>
				</tr>
			</xsl:if>
		</table>	
		<div class="marg-top"><i>Сведения об организации-должнике</i></div>
		<xsl:apply-templates select="fssp_pa_req:LegalEntity"/>
		<div class="marg-top"><i>Сведения об арестованном имуществе</i></div>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование хранителя арестованного имущества</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:ArrestedPropertyHolder"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Адрес места хранения арестованного имущества</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:ArrestedPropertyAddress"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата получения копии постановления представителем</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_pa_req:RepresentativeReceiveDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата получения копии постановления должником</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_pa_req:DebtorReceiveDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата получения копии постановления хранителем</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_pa_req:HolderReceiveDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата направления экземпляра прокурору</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_pa_req:ProsecutorReceiveDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата направления экземпляра судебному приставу-исполнителю</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_pa_req:CourtOfficerReceiveDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<div class="marg-top"><i>Постановления об отмене ареста на имущество плательщика таможенных пошлин, налогов (ИД)</i></div>
		<xsl:apply-templates select="fssp_pa_req:ExecutiveDocument"/>
	</xsl:template>
	<!-- Шаблон для типа fssp_pa_req:ArrestedPropertyType -->
	<xsl:template match="fssp_pa_req:ArrestedProperty">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Вид (полный/частичный)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:Type"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Объем</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_pa_req:Value, '.', ',')"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Количество</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_pa_req:Quantity, '.', ',')"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Срок ограничения права пользования</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_pa_req:RestrictionDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Место изъятия</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:WithdrawPlace"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Место помещения на хранение</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:StoragePlace"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Адрес места хранения</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:StoragePlaceAddress"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Материально ответственное лицо по хранению</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:ResponsiblePerson"/></td>
			</tr>
		</table>
		<div class="marg-top"><i>Протокол об аресте имущества (ИД)</i></div>
		<xsl:apply-templates select="fssp_pa_req:ExecutiveDocument"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="fssp_pa_req:ArrestPerson| fssp_pa_req:CustomsExpert| fssp_pa_req:CustomsSpecialist| fssp_pa_req:DebtorRepresentative| fssp_pa_req:PresentPerson| fssp_pa_req:ProsecutorName| fssp_pa_req:ResponsiblePerson| fssp_pa_req:SignPerson| fssp_pa_req:Witness">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>			
		<xsl:if test="cat_ru:PersonPost">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа fssp_pa_req:ArrestProtocolType -->
	<xsl:template match="fssp_pa_req:ArrestProtocol">
		<xsl:apply-templates mode="id" select="."/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Основание наложения ареста</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:ArrestBase"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Время проведения ареста</td>
				<td class="value graphMain" style="width:50%">
					с <xsl:value-of select="substring(fssp_pa_req:ArrestBeginTime, 1,8)"/>&#160;
					по <xsl:value-of select="substring(fssp_pa_req:ArrestEndTime, 1,8)"/>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование органа производящего арест</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:ArrestOrgan"/></td>
			</tr>
			<xsl:if test="fssp_pa_req:ArrestPerson">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность и ФИО лица, производящего арест</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:ArrestPerson"/></td>
				</tr>
			</xsl:if>
		</table>	
		<xsl:variable name="kkk1" select="count(fssp_pa_req:Witness)"/>
		<xsl:variable name="kkk2" select="count(fssp_pa_req:PresentPerson)"/>
		<xsl:variable name="kkk3" select="count(fssp_pa_req:CustomsExpert)"/>
		<xsl:variable name="kkk4" select="count(fssp_pa_req:CustomsSpecialist)"/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%; vertical-align: top" rowspan="{$kkk1}">ФИО понятого</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:Witness[1]"/></td>
			</tr>
			<xsl:for-each select="fssp_pa_req:Witness[position() &gt; 1]">
				<tr><td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td></tr>
			</xsl:for-each>
			<tr>
				<td class="annot graphMain" style="width:50%; vertical-align: top" rowspan="{$kkk2}">ФИО присутствующего лица</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:PresentPerson[1]"/></td>
			</tr>
			<xsl:for-each select="fssp_pa_req:PresentPerson[position() &gt; 1]">
				<tr><td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td></tr>
			</xsl:for-each>
			<tr>
				<td class="annot graphMain" style="width:50%; vertical-align: top" rowspan="{$kkk3}">ФИО таможенного эксперта</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:CustomsExpert[1]"/></td>
			</tr>
			<xsl:for-each select="fssp_pa_req:CustomsExpert[position() &gt; 1]">
				<tr><td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td></tr>
			</xsl:for-each>
			<tr>
				<td class="annot graphMain" style="width:50%; vertical-align: top" rowspan="{$kkk4}">ФИО таможенного специалиста</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:CustomsSpecialist[1]"/></td>
			</tr>
			<xsl:for-each select="fssp_pa_req:CustomsSpecialist[position() &gt; 1]">
				<tr><td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td></tr>
			</xsl:for-each>
			<tr>
				<td class="annot graphMain" style="width:50%">Представитель плательщика таможенных пошлин, налогов</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:DebtorRepresentative"/></td>
			</tr>
		</table>
		<div class="marg-top"><i>Общая информация о должнике и арестованном имуществе</i></div>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип должника</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:DebtorType"/></td>
			</tr>
		</table>
		<xsl:apply-templates select="fssp_pa_req:LegalEntityArrest"/>
		<div class="marg-top"><i>Сведения по арестованному имуществу</i></div>
		<xsl:apply-templates select="fssp_pa_req:ArrestedProperty"/>
	</xsl:template>
	<!-- Шаблон для типа fssp_pa_req:CreditorType -->
	<xsl:template match="fssp_pa_req:Creditor">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Таможенный орган - взыскатель</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:Code"/>&#160;
					<xsl:value-of select="cat_ru:OfficeName"/>
				</td>
			</tr>
			<xsl:if test="fssp_pa_req:Address">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес взыскателя</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:Address"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_pa_req:DebtInfoType -->
	<xsl:template match="fssp_pa_req:DebtInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма задолженности</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_pa_req:Sum, '.', ',')"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Код бюджетной классификации</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:KBK"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование вида платежа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:PaymentType"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма по виду платежа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_pa_req:TypeSum, '.', ',')"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Проценты на сумму</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_pa_req:PercentsSum, '.', ',')"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Пенни на сумму</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_pa_req:FinesSum, '.', ',')"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Всего по виду платежа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_pa_req:TypeSumAll, '.', ',')"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование арестованного имущества</td>
				<td class="graphMain value" style="width:50%">
					<xsl:for-each select="fssp_pa_req:ArrestedProperty"><xsl:value-of select="."/></xsl:for-each>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование хранителя арестованного имущества</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:ArrestedPropertyHolder"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Адрес места хранения арестованного имущества</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:ArrestedPropertyAddress"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Признак дубликата</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="fssp_pa_req:IsDublicate='true' or fssp_pa_req:IsDublicate='1'">есть</xsl:when>
						<xsl:otherwise>нет</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_pa_req:ExecutiveDocumentType -->
	<xsl:template match="fssp_pa_req:ExecutiveDocument">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Исполнительный документ</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:ExecutiveDocument"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">ЭП исполнительного документа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:ExecutiveDocumentSign"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fssp_pa_req:LegalEntityArrestType -->
	<xsl:template match="fssp_pa_req:LegalEntityArrest| fssp_pa_req:LegalEntity">
		<table class="w190">
			<xsl:if test="cat_ru:OrganizationLanguage">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физ. лица</td>
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
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:Address"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Юридический адрес</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fssp_pa_req:LegalAddress"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации должника ЮЛ/ИП</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="fssp_pa_req:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:if test="fssp_pa_req:ArrestedProperty">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование арестованного имущества</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="fssp_pa_req:ArrestedProperty"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_pa_req:ArrestedPropertyCost">
				<tr>
					<td class="annot graphMain" style="width:50%">Стоимость арестованного имущества</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fssp_pa_req:ArrestedPropertyCost, '.', ',')"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="fssp_pa_req:ProtocolReceiveDate">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата получения копии протокола должником/представителем</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="fssp_pa_req:ProtocolReceiveDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
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
