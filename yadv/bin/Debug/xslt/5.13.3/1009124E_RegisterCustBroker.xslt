<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.13.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.13.3" xmlns:rcb="urn:customs.ru:Information:SQDocuments:RegisterCustBroker:5.13.3">
	<!-- Шаблон для типа RegisterCustBrokerType -->
	<xsl:template match="rcb:RegisterCustBroker">
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
									padding: 10mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									.marg-top
									{
									margin-top:3mm;
									}

									.marg-t1
									{
									margin-top:8mm;
									margin-bottom:3mm;
									font-family: Arial;
									font-size: 12pt;
									font-variant: small-caps;
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
										<b>Реестр таможенных представителей</b>
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
					<xsl:if test="rcb:EECEDocHeaderAddInfo">
						<div class="title marg-t1">Дополнительные технологические реквизиты электронного документа (сведений)</div>
						<xsl:apply-templates select="rcb:EECEDocHeaderAddInfo"/>
					</xsl:if>
					<div class="title marg-t1">Сведения об объекте учета реестра таможенных представителей</div>
					<table class="bordered w190">
						<xsl:for-each select="rcb:RegisterCustBrokerDetails">
							<tr class="title" bgcolor="silver">
								<td class="graphMain bordered"> # <xsl:value-of select="position()"/></td>
							</tr>	
							<xsl:apply-templates select="."/>
							<tr>
								<td class="annot graphMain"><br/></td>
							</tr>	
						</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:AddressDetails| RUScat_ru:PostalAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text> Вид адреса: </xsl:text>
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
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode">
			<br/>
			<xsl:text>(</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOGUID"/></xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOID"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:text>код объекта: </xsl:text>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<xsl:text> код справочника: </xsl:text>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:PeriodDetailsType -->
	<xsl:template match="RUScat_ru:ValidityPeriodDetails">
		<xsl:if test="RUScat_ru:StartDateTime">
			<xsl:text>с </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:StartDateTime"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring(RUScat_ru:StartDateTime, 12, 8)"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:EndDateTime">
			<xsl:text>по </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:EndDateTime"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring(RUScat_ru:EndDateTime, 12, 8)"/>
		</xsl:if>
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
	<!-- Шаблон для типа rcb:CustomsBrokerDetailsType -->
	<xsl:template match="rcb:CustomsBrokerDetails">
		<xsl:if test="rcb:CustomsBrokerParentDetails">
			<div class="title marg-top">Сведения о головном подразделении таможенного представителя</div>
			<xsl:apply-templates select="rcb:CustomsBrokerParentDetails"/>
		</xsl:if>
		<xsl:for-each select="rcb:CustomsBrokerBranchDetails">
			<div class="title marg-top">Сведения о структурном подразделении таможенного представителя #<xsl:value-of select="position()"/></div>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RegisterOrganizationDetailsType -->
	<xsl:template match="rcb:CustomsBrokerParentDetails| rcb:CustomsBrokerBranchDetails">
		<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование организации / ФИО физического лица</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:ShortName">
							<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
							<xsl:value-of select="cat_ru:ShortName"/>
							<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Сведения об организации</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:CountryA2Code"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode or RUScat_ru:BusinessEntityTypeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Организационно-правовая форма, в которой зарегистрирован хозяйствующий субъект</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
						<xsl:if test="RUScat_ru:BusinessEntityTypeName">
							<xsl:text> </xsl:text>
							<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</td>
					<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUScat_ru:UITN"/></td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Адрес регистрации юридического лица</td>
				<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUScat_ru:AddressDetails"/></td>
			</tr>
		</table>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Контактный реквизит</td>
					<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUScat_ru:CommunicationDetails[1]"/></td>
				</tr>
				<xsl:for-each select="RUScat_ru:CommunicationDetails[position() &gt; 1]">
					<tr>
						<td class="annot graphMain" style="width:40%"/>
						<td class="value graphMain" style="width:60%"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalAddressDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Информация о почтовом адресе юридического лица</td>
					<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUScat_ru:PostalAddressDetails"/></td>
				</tr>
			</table>	
		</xsl:if>
		<xsl:if test="RUScat_ru:BranchFlagCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Признак филиала организации</td>
					<td class="value graphMain" style="width:60%">
						<xsl:choose>
							<xsl:when test="RUScat_ru:BranchFlagCode=0">головная организация (основное подразделение)</xsl:when>
							<xsl:when test="RUScat_ru:BranchFlagCode=1">филиал организации (структурное подразделение)</xsl:when>
							<xsl:otherwise><xsl:value-of select="RUScat_ru:BranchFlagCode"/></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:EECEDocHeaderAddInfoType -->
	<xsl:template match="rcb:EECEDocHeaderAddInfo">
		<xsl:if test="RUScat_ru:InfEnvelopeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Кодовое обозначение сообщения общего процесса</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:InfEnvelopeCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Кодовое обозначение электронного документа (сведений) в соответствии с реестром структур электронных документов и сведений</td>
				<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:EDocCode"/></td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Дата и время создания электронного документа (сведений)</td>
				<td class="value graphMain" style="width:60%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="RUScat_ru:EDocDateTime"/>
					</xsl:call-template>
					<xsl:text> </xsl:text>
					<xsl:value-of select="substring(RUScat_ru:EDocDateTime, 12, 8)"/>
				</td>
			</tr>
		</table>
		<xsl:if test="RUScat_ru:LanguageCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Кодовое обозначение языка</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:LanguageCode"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rcb:RegisterCustBrokerDetailsType -->
	<xsl:template match="rcb:RegisterCustBrokerDetails">
		<tr>
			<td class="annot graphMain">
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:40%">Кодовое обозначение страны, предоставившей информацию</td>
						<td class="value graphMain" style="width:60%"><xsl:value-of select="rcb:RegisterCountryCode"/></td>
					</tr>
					<xsl:apply-templates select="rcb:ResourceItemStatusDetails"/>
				</table>
				<br/>
			</td>
		</tr>		
		<tr class="title" bgcolor="#e3e3e3">
			<td class="annot graphMain">Сведения о документе, подтверждающем включение юридического лица в реестр</td>
		</tr>
		<tr>
			<td class="annot graphMain"><xsl:apply-templates select="rcb:RegisterDocumentDetails"/><br/></td>
		</tr>
		<tr class="title" bgcolor="#e3e3e3">
			<td class="annot graphMain">Сведения об организации, включенной в реестр таможенных представителей</td>
		</tr>
		<tr>
			<td class="annot graphMain"><xsl:apply-templates select="rcb:CustomsBrokerDetails"/><br/></td>
		</tr>
		<xsl:if test="rcb:GoodsRestrictionText or rcb:CustomsOperationRestrictionText or rcb:TransportRestrictionText or rcb:RegionRestrictionText or rcb:AdditionalInfoText">
			<tr class="title" bgcolor="#e3e3e3">
				<td class="annot graphMain">Дополнительная информация и ограничения, относящиеся к описываемому объекту</td>
			</tr>
			<tr>
				<td class="annot graphMain">
					<xsl:if test="rcb:GoodsRestrictionText">
						<div class="title marg-top">Ограничения по видам товаров в соответствии с ТН ВЭД ЕАЭС</div>
						<xsl:for-each select="rcb:GoodsRestrictionText"><xsl:value-of select="."/></xsl:for-each>
					</xsl:if>
					<xsl:if test="rcb:CustomsOperationRestrictionText">
						<div class="title marg-top">Ограничение по видам таможенных операций</div>
						<xsl:for-each select="rcb:CustomsOperationRestrictionText"><xsl:value-of select="."/></xsl:for-each>
					</xsl:if>
					<xsl:if test="rcb:TransportRestrictionText">
						<div class="title marg-top">Ограничение по видам транспорта</div>
						<xsl:for-each select="rcb:TransportRestrictionText"><xsl:value-of select="."/></xsl:for-each>
					</xsl:if>
					<xsl:if test="rcb:RegionRestrictionText">
						<div class="title marg-top">Ограничения по региону деятельности</div>
						<xsl:for-each select="rcb:RegionRestrictionText"><xsl:value-of select="."/></xsl:for-each>
					</xsl:if>
					<xsl:if test="rcb:AdditionalInfoText">
						<div class="title marg-top">Дополнительная информация, относящаяся к описываемому объекту</div>
						<xsl:value-of select="rcb:AdditionalInfoText"/><br/>
					</xsl:if>
					<br/>
				</td>
			</tr>
		</xsl:if>
		<tr class="title" bgcolor="#e3e3e3">
			<td class="annot graphMain">Период осуществления деятельности</td>
		</tr>
		<tr>
			<td class="annot graphMain">
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:40%">1-й день действия, в том числе после временного прекращения / приостановления</td>
						<td class="value graphMain" style="width:60%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="rcb:StartActivityDate"/>
							</xsl:call-template>
						</td>
					</tr>
					<xsl:if test="rcb:EndActivityDate">
						<tr>
							<td class="annot graphMain" style="width:40%">последний день действия, в том числе по причине временного прекращения</td>
							<td class="value graphMain" style="width:60%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rcb:EndActivityDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа RUDECLcat:RegisterDocumentDetailsType -->
	<xsl:template match="rcb:RegisterDocumentDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Регистрационный номер юридического лица согласно реестру</td>
				<td class="value graphMain" style="width:60%"><xsl:value-of select="RUDECLcat:RegistrationNumberIdentifier"/></td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Дата подписания, утверждения или регистрации документа</td>
				<td class="value graphMain" style="width:60%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="RUDECLcat:DocCreationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<xsl:if test="RUDECLcat:RegisterDocumentCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Тип документа, подтверждающего включение юридического лица в реестр</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUDECLcat:RegisterDocumentCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUDECLcat:ReregistrationCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Кодированное обозначение признака перерегистрации</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUDECLcat:ReregistrationCode"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:ResourceItemStatusDetailsType -->
	<xsl:template match="rcb:ResourceItemStatusDetails">
		<xsl:if test="RUScat_ru:ValidityPeriodDetails">
			<tr>
				<td class="annot graphMain" style="width:40%">Период действия записи общего ресурса (реестра, перечня, базы данных)</td>
				<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUScat_ru:ValidityPeriodDetails"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:UpdateDateTime">
			<tr>
				<td class="annot graphMain" style="width:40%">Дата и время обновления записи общего ресурса (реестра, перечня, базы данных)</td>
				<td class="value graphMain" style="width:60%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="RUScat_ru:UpdateDateTime"/>
					</xsl:call-template>
					<xsl:text> </xsl:text>
					<xsl:value-of select="substring(RUScat_ru:UpdateDateTime, 12, 8)"/>
				</td>
			</tr>
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
