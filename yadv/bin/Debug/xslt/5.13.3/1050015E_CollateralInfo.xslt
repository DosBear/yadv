<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:asgcat_ru="urn:customs.ru:ASG_CommonAggregateTypes:5.13.3" xmlns:clltrl_info="urn:customs.ru:CollateralInfo:5.13.3">
	<!-- Шаблон для типа CollateralInfoType -->
	<xsl:decimal-format name="spaces" decimal-separator="," grouping-separator=" "/>
	<xsl:template match="clltrl_info:CollateralInfo">
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
					width: 270mm;
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
					vertical-align:bottom
					;
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
										<b>Сведения о наличии и состоянии обеспечения</b>
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
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:40%">Дата и время создания/изменения электронного документа.</td>
							<td class="value graphMain" style="width:60%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="clltrl_info:DocumentDateTime"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(clltrl_info:DocumentDateTime,12,8)"/>
							</td>
						</tr>
					</table>
					<br/>
					<table class="bordered w190">
						<tbody>
							<xsl:for-each select="clltrl_info:PrincipalInfo">
								<tr class="title">
									<td class="graphMain bordered" bgcolor="#e3e3e3">Информация о принципале/должнике/декларанте №<xsl:value-of select="position()"/>
									</td>
								</tr>
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:BankInformationType -->
	<xsl:template match="RUScat_ru:BankInformation">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:BankAccount"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:BankAccountDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:BankName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:BankMFO"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:OKPOID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:BICID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:SWIFTID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:CorrAccount"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:TransitCurrencyAccount"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:SpecialTransitCurrencyAccount"/>
			</td>
		</tr>
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
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode or RUScat_ru:FullIdentityCardName">
			(<xsl:value-of select="cat_ru:IdentityCardCode"/>
			<xsl:if test="RUScat_ru:FullIdentityCardName">&#160;<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
			</xsl:if>)
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
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">&#160;ID органа гос.власти: <xsl:value-of select="RUScat_ru:AuthorityId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">&#160;код страны: <xsl:value-of select="RUScat_ru:CountryCode"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
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
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode">
			<br/>
			<xsl:text>(</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOGUID"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOID"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
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
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="asgcat_ru:CBRLicense">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон с дублирующимся match закомментирован -->
	<xsl:template match="clltrl_info:CollateralInfo" mode="mode1">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Код способа обеспечения по классификатору НСИ</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="asgcat_ru:GuaranteeType"/>
				</td>
			</tr>
			<xsl:if test="asgcat_ru:GuaranteeKind">
				<tr>
					<td class="annot graphMain" style="width:40%">Тип документа обеспечения</td>
					<td class="value graphMain" style="width:60%">
						<xsl:choose>
							<xsl:when test="asgcat_ru:GuaranteeKind=1">Денежный залог</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=2">Банковская гарантия</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=3">Залог имущества</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=4">Договор поручительства</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=5">Дополнение к договору поручительства (245)</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=6">Дополнение к договору поручительства (397)</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=7">Договор поручительства в рамках генерального</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeKind=8">Иное обеспечение</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="asgcat_ru:GuaranteeKind"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:40%">Признак генерального обеспечения</td>
				<td class="value graphMain" style="width:60%">
					<xsl:choose>
						<xsl:when test="asgcat_ru:IsGeneral='true' or asgcat_ru:IsGeneral='1'">есть</xsl:when>
						<xsl:otherwise>нет</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:40%">Номер и дата регистрации обеспечения</td>
				<td class="value graphMain" style="width:60%">
					<xsl:text>№ </xsl:text>
					<xsl:value-of select="asgcat_ru:GuaranteeRegNumber"/>
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="asgcat_ru:GuaranteeRegDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:40%">Код таможенного органа, в котором зарегистрировано обеспечение</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="asgcat_ru:GuaranteeCustomCode"/>
				</td>
			</tr>
			<xsl:if test="clltrl_info:GuaranteeOriginalNumber">
				<tr>
					<td class="annot graphMain" style="width:40%">Оригинальный номер обеспечения</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="asgcat_ru:GuaranteeOriginalNumber"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="asgcat_ru:GuaranteeOriginalDate">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата обеспечения (дата заключения договора, дата гарантии)</td>
					<td class="value graphMain" style="width:60%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="asgcat_ru:GuaranteeOriginalDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="asgcat_ru:GuaranteeSubmitDate">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата предоставления обеспечения</td>
					<td class="value graphMain" style="width:60%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="asgcat_ru:GuaranteeSubmitDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:40%">Период действия обеспечения</td>
				<td class="value graphMain" style="width:60%">
					<xsl:text>с </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="asgcat_ru:GuaranteeStartDate"/>
					</xsl:call-template>
					<xsl:if test="asgcat_ru:GuaranteeExpireDate">
						<xsl:text> по </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="asgcat_ru:GuaranteeExpireDate"/>
						</xsl:call-template>
					</xsl:if>
				</td>
			</tr>
			<xsl:if test="asgcat_ru:GuaranteeActualExpireDate">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата фактического завершения</td>
					<td class="value graphMain" style="width:60%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="asgcat_ru:GuaranteeActualExpireDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:40%">Сумма обеспечения</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="format-number(asgcat_ru:GuaranteeAmount, '# ###,##', 'spaces')"/>
					<xsl:text>  </xsl:text>
					<xsl:apply-templates mode="currencyCode" select="asgcat_ru:GuaranteeCurrencyCode"/>
				</td>
			</tr>
			<xsl:if test="asgcat_ru:UsedAmount">
				<tr>
					<td class="annot graphMain" style="width:40%">Общая сумма неисполненных обязательств в валюте обеспечения, при условии, что информация об обязательствах присутствует в системе</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="translate(asgcat_ru:UsedAmount, '.', ',')"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="asgcat_ru:AvailableAmount">
				<tr>
					<td class="annot graphMain" style="width:40%">Сумма, доступная для использования таможенным органом</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="format-number(asgcat_ru:AvailableAmount, '# ###,##', 'spaces')"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="asgcat_ru:ObligationTypeInfo">
				<tr>
					<td class="annot graphMain" style="width:40%">Информация о видах обязательств</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="asgcat_ru:ObligationTypeInfo"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="asgcat_ru:CustomsOrderInfo">
				<tr>
					<td class="annot graphMain" style="width:40%">Информация о документах подтверждающих предоставление обеспечения</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="asgcat_ru:CustomsOrderInfo"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="asgcat_ru:RequisitesLetterIn">
				<tr>
					<td class="annot graphMain" style="width:40%">Реквизиты входящего письма ФТС России</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="asgcat_ru:RequisitesLetterIn"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="asgcat_ru:RequisitesLetterOut">
				<tr>
					<td class="annot graphMain" style="width:40%">Реквизиты исходящего письма</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="asgcat_ru:RequisitesLetterOut"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="asgcat_ru:GuaranteeFormat">
				<tr>
					<td class="annot graphMain" style="width:40%">Признак выдачи банковской гарантии</td>
					<td class="value graphMain" style="width:60%">
						<xsl:choose>
							<xsl:when test="asgcat_ru:GuaranteeFormat='0'">в бумажном виде</xsl:when>
							<xsl:when test="asgcat_ru:GuaranteeFormat='1'">в электронном виде</xsl:when>
							<xsl:otherwise><xsl:value-of select="asgcat_ru:GuaranteeFormat"/></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="asgcat_ru:SecurityStatus">
				<tr>
					<td class="annot graphMain" style="width:40%">Статус обеспечения</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="asgcat_ru:SecurityStatus"/>
					</td>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="asgcat_ru:Guarantor">
			<div class="title marg-top">Информация об организации-гаранте</div>
			<xsl:apply-templates select="asgcat_ru:Guarantor"/>
		</xsl:if>
		<xsl:if test="asgcat_ru:DebtDoc">
			<div class="title marg-top">Информация о расходовании денежных средств, принятых в качестве обеспечения / Информация о взыскании</div>
			<table class="bordered w190">
				<tr class="title">
					<td class="graphMain bordered" rowspan="2">Вид информации</td>
					<td class="graphMain bordered" colspan="3" align="center">Сведения о документе</td>
					<td class="graphMain bordered" rowspan="2">Сумма списанных / взысканных средств</td>
				</tr>
				<tr class="title">
					<td class="graphMain bordered">Наименование</td>
					<td class="graphMain bordered">Номер документа</td>
					<td class="graphMain bordered">Дата документа</td>
				</tr>
				<xsl:for-each select="asgcat_ru:DebtDoc">
					<tr>
						<td class="graphMain bordered">
							<xsl:choose>
								<xsl:when test="asgcat_ru:DocKind=1">Информация о расходовании денежных средств, принятых в качестве обеспечения</xsl:when>
								<xsl:when test="asgcat_ru:DocKind=2">Информация о взыскании</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="asgcat_ru:DocKind"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
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
							<xsl:value-of select="format-number(asgcat_ru:Amount/RUScat_ru:Amount, '# ###,##', 'spaces')"/>&#160;
							<xsl:apply-templates mode="currencyCode" select="asgcat_ru:Amount/RUScat_ru:CurrencyCode"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа asgcat_ru:CustomsOrderInfoType -->
	<xsl:template match="asgcat_ru:CustomsOrderInfo">
		<xsl:choose>
			<xsl:when test="asgcat_ru:CustomsOrderKind=5">ТПО</xsl:when>
			<xsl:when test="asgcat_ru:CustomsOrderKind=6">ТР</xsl:when>
			<xsl:when test="asgcat_ru:CustomsOrderKind=7">Дополнение к договору поручительства</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="asgcat_ru:CustomsOrderKind"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text> № </xsl:text>
		<xsl:value-of select="asgcat_ru:CustomsOrderNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="asgcat_ru:CustomsOrderDate"/>
		</xsl:call-template>
		<xsl:text> код таможенного органа: </xsl:text>
		<xsl:value-of select="asgcat_ru:CustomsOrderCustomsCode"/>
	</xsl:template>
	<!-- Шаблон для типа clltrl_info:BankOrganizationType -->
	<xsl:template match="asgcat_ru:Guarantor| clltrl_info:GuarantorInfo">
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
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:OrganizationLanguage"/>
					</td>
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
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="RUScat_ru:CountryA2Code"/>
					</td>
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
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="RUScat_ru:UITN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Уникальный идентификатор физического лица</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="RUScat_ru:PersonId"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Сведения о документе, удостоверяющем личность физического лица</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<table class="w190">
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<tr>
						<td class="annot graphMain" style="width:40%">
							<xsl:if test="position()=1">Адрес</xsl:if>
						</td>
						<td class="value graphMain" style="width:60%">
							<xsl:apply-templates select="."/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Контактный реквизит субъекта</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="asgcat_ru:CBRLicense">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Лицензия ЦБ</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="asgcat_ru:CBRLicense"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:BankInformation">
			<div class="marg-top">
				<i>Информация о банковских счетах</i>
			</div>
			<table class="bordered w190">
				<tr class="title">
					<td class="graphMain bordered">Номер банковского счета</td>
					<td class="graphMain bordered">Описание типа счета: расчетный, валютный</td>
					<td class="graphMain bordered">Название банка</td>
					<td class="graphMain bordered">МФО банка</td>
					<td class="graphMain bordered">Код банка по ОКПО</td>
					<td class="graphMain bordered">БИК банка</td>
					<td class="graphMain bordered">SWIFT код банка</td>
					<td class="graphMain bordered">Номер корреспондентского счета банка</td>
					<td class="graphMain bordered">Валютный счет организации (транзитный)</td>
					<td class="graphMain bordered">Валютный счет организации (специальный транзитный)</td>
				</tr>
				<xsl:for-each select="RUScat_ru:BankInformation">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа clltrl_info:ObligationTypeInfoType -->
	<xsl:template match="asgcat_ru:ObligationTypeInfo">
		<xsl:for-each select="asgcat_ru:ObligationCode">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа clltrl_info:PrincipalInfoType -->
	<xsl:template match="clltrl_info:PrincipalInfo">
		<tr>
			<td class="annot graphMain">
				<xsl:apply-templates select="clltrl_info:GuarantorInfo"/>
			</td>
		</tr>
		<xsl:for-each select="clltrl_info:CollateralInfo">
			<tr>
				<td class="value graphMain">
					<div class="title marg-top">Информация об обеспечении № <xsl:value-of select="position()"/>
					</div>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain">
					<xsl:apply-templates select="." mode="mode1"/>
				</td>
			</tr>
		</xsl:for-each>
		<tr>
			<td class="annot graphMain">
				<br/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template mode="currencyCode" match="*">
		<xsl:choose>
			<xsl:when test=".='643'">RUB</xsl:when>
			<xsl:when test=".='840'">USD</xsl:when>
			<xsl:when test=".='978'">EUR</xsl:when>
			<xsl:otherwise>
				<xsl:text>(код:</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>) </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
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
