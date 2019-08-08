<?xml version="1.0" encoding="utf-8"?>
<!-- бланк по форме Приказа ФТС от 20.12.2018 № 2077 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.14.0" xmlns:AEO_rf1="urn:customs.ru:Information:AEO_ReportF1:5.14.0">
	<!-- Шаблон для типа AEO_ReportF1Type -->
	<xsl:template match="AEO_rf1:AEO_ReportF1">
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
					width: 267mm;
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

					div.title, tr.title td 
					{ 
					font-weight:bold;
					text-align: center;
					}

					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
					font-size: 9pt;
					}

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:top;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table style="width: 100%" align="center">
						<tr class="title" align="center">
							<td class="graphMain" style="font-size: medium">Отчет уполномоченного экономического оператора по форме № 1</td>
						</tr>
						<tr class="title">
							<td><br/></td>
						</tr>
						<tr class="title">
							<td class="value graphMain" style="font-size: medium" align="center">
								<xsl:for-each select="AEO_rf1:AuthoriziedOperatorDetails">
									<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
										<xsl:value-of select="RUScat_ru:BusinessEntityTypeCode"/>
									</xsl:if>
									<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
										<xsl:if test="RUScat_ru:BusinessEntityTypeCode">, </xsl:if>
										<xsl:value-of select="cat_ru:OrganizationName"/>
										<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName"><xsl:value-of select="cat_ru:ShortName"/></xsl:if>
									</xsl:if>
									<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
										<xsl:if test="RUScat_ru:BusinessEntityTypeCode or cat_ru:OrganizationName or cat_ru:ShortName">, </xsl:if>
										<xsl:text>ИНН: </xsl:text>
										<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
										<xsl:text>, КПП: </xsl:text>
										<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</xsl:if>
								</xsl:for-each>	
							</td>
						</tr>
						<tr>
							<td style="font-size: x-small" align="center">организационно-правовая форма, наименование, идентификационный номер налогоплательщика (ИНН)/код причины постановки на учет (КПП)</td>
						</tr>
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
					<table>
						<tr>
							<td class="annot graphMain" style="width: 15%">свидетельство от </td>
							<td class="value graphMain" style="width: 10%" align="center">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="AEO_rf1:AuthoriziedOperatorDetails/AEO_rf1:DateIssued"/>
								</xsl:call-template>
							</td>
							<td class="annot graphMain" style="width: 5%" align="center">№</td>
							<td class="value graphMain" style="width: 70%">
								<xsl:apply-templates select="AEO_rf1:AuthoriziedOperatorDetails/RUDECLcat:AEORegistryIdDetails"/>
							</td>
						</tr>
					</table>
					<br/>
					<table style="width: 110mm">
						<tr>
							<td class="annot graphMain" style="width: 22mm">за период с </td>
							<td class="value graphMain" style="width: 40mm" align="center">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="AEO_rf1:DODate/AEO_rf1:StartDate"/>
								</xsl:call-template>
							</td>
							<td class="annot graphMain" style="width: 8mm" align="center"> по </td>
							<td class="value graphMain" style="width: 40mm" align="center">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="AEO_rf1:DODate/AEO_rf1:EndDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<br/>
					<xsl:apply-templates select="AEO_rf1:TableF1"/>
					<br/>
					<xsl:apply-templates select="AEO_rf1:Signatures"/>
				</div>
				<div class="page">
					<table class="w190" style="width: 180mm" align="center">
						<tr class="title">
							<td class="graphMain" style="font-size: medium">ДОПОЛНИТЕЛЬНАЯ ИНФОРМАЦИЯ</td>
						</tr>
					</table>
					<xsl:if test="AEO_rf1:RegNumberReport">
						<div class="title marg-top">Исходящие регистрационные данные отчета</div>
						<xsl:apply-templates select="AEO_rf1:RegNumberReport"/>
					</xsl:if>
					<xsl:if test="AEO_rf1:AuthoriziedOperatorDetails">
						<div class="title marg-top">Сведения об уполномоченном экономическом операторе</div>
						<xsl:apply-templates select="AEO_rf1:AuthoriziedOperatorDetails"/>
					</xsl:if>
					<xsl:if test="AEO_rf1:Signatures/cat_ru:IssueDate">
						<div class="title marg-top">Дополнительные свведения о подписании документа</div>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:40%">Дата подписания</td>
								<td class="value graphMain" style="width:60%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="AEO_rf1:Signatures/cat_ru:IssueDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа AEO_rf1:DTInfoType -->
	<xsl:template match="AEO_rf1:DTInfo">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="AEO_rf1:GoodsLocationAddress| RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text> Вид адреса - </xsl:text>
			<xsl:choose>
				<xsl:when test="RUScat_ru:AddressKindCode='1'">адрес регистрации</xsl:when>
				<xsl:when test="RUScat_ru:AddressKindCode='2'">фактический</xsl:when>
				<xsl:when test="RUScat_ru:AddressKindCode='3'">почтовый</xsl:when>
				<xsl:otherwise><xsl:value-of select="RUScat_ru:AddressKindCode"/></xsl:otherwise>
			</xsl:choose>
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
	<!-- Шаблон для типа AEO_rf1:PostingPartType -->
	<xsl:template match="AEO_rf1:PostingPart">
		<td class="graphMain bordered"><xsl:value-of select="AEO_rf1:DocumentInfo/cat_ru:PrDocumentName"/></td>
		<td class="graphMain bordered" align="center">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="AEO_rf1:DocumentInfo/cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</td>
		<td class="graphMain bordered"><xsl:value-of select="AEO_rf1:DocumentInfo/cat_ru:PrDocumentNumber"/></td>
		<td class="graphMain bordered"><xsl:value-of select="AEO_rf1:GoodsTNVEDCode"/></td>
		<td class="graphMain bordered"><xsl:apply-templates select="AEO_rf1:GoodsDescription"/></td>
		<td class="graphMain bordered" align="right"><xsl:value-of select="translate(AEO_rf1:GoodsQuantity/cat_ru:GoodsQuantity, '.', ',')"/></td>
		<td class="graphMain bordered" align="center">
			<xsl:value-of select="AEO_rf1:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
			<xsl:if test="AEO_rf1:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
				<xsl:text> (код: </xsl:text>
				<xsl:value-of select="AEO_rf1:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
				<xsl:text>) </xsl:text>
			</xsl:if>
		</td>	
		<td class="graphMain bordered" align="right"><xsl:value-of select="translate(AEO_rf1:IdenticalDealNationalPrice, '.', ',')"/></td>
		<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf1:PriceCurrencyCode"/></td>
		<td class="graphMain bordered" align="right"><xsl:value-of select="translate(AEO_rf1:Cost, '.', ',')"/></td>
		<td class="graphMain bordered" align="center">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="AEO_rf1:DateInp"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<!-- Шаблон для типа AEO_rf1:ExpensePartType -->
	<xsl:template match="AEO_rf1:ExpensePart">
		<td class="graphMain bordered"><xsl:value-of select="AEO_rf1:DocumentInfo/cat_ru:PrDocumentName"/></td>
		<td class="graphMain bordered" align="center">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="AEO_rf1:DocumentInfo/cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</td>
		<td class="graphMain bordered"><xsl:value-of select="AEO_rf1:DocumentInfo/cat_ru:PrDocumentNumber"/></td>
		<td class="graphMain bordered"><xsl:value-of select="AEO_rf1:GoodsTNVEDCode"/></td>
		<td class="graphMain bordered"><xsl:apply-templates select="AEO_rf1:GoodsDescription"/></td>
		<td class="graphMain bordered" align="right"><xsl:value-of select="translate(AEO_rf1:GoodsQuantity/cat_ru:GoodsQuantity, '.', ',')"/></td>
		<td class="graphMain bordered" align="center">
			<xsl:value-of select="AEO_rf1:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
			<xsl:if test="AEO_rf1:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
				<xsl:text> (код: </xsl:text>
				<xsl:value-of select="AEO_rf1:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
				<xsl:text>) </xsl:text>
			</xsl:if>
		</td>	
		<td class="graphMain bordered" align="right"><xsl:value-of select="translate(AEO_rf1:IdenticalDealNationalPrice, '.', ',')"/></td>
		<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf1:PriceCurrencyCode"/></td>
		<td class="graphMain bordered" align="right"><xsl:value-of select="translate(AEO_rf1:Cost, '.', ',')"/></td>
		<td class="graphMain bordered" align="center">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="AEO_rf1:DateExit"/>
			</xsl:call-template>
		</td>
	</xsl:template>
	<!-- Шаблон для типа AEO_rf1:RegNumberReportType -->
	<xsl:template match="AEO_rf1:RegNumberReport">
		<xsl:if test="AEO_rf1:RegNumberDoc">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Исходящий регистрационный номер</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="AEO_rf1:RegNumberDoc"/></td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Дата исходящего документа</td>
				<td class="value graphMain" style="width:60%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="AEO_rf1:ExecutionDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа AEO_rf1:RestGoodType -->
	<xsl:template match="AEO_rf1:RestGood">
		<td class="graphMain bordered" align="right"><xsl:value-of select="translate(AEO_rf1:GoodsQuantity/cat_ru:GoodsQuantity, '.', ',')"/></td>
		<td class="graphMain bordered" align="center">
			<xsl:value-of select="AEO_rf1:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
			<xsl:if test="AEO_rf1:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
				<xsl:text> (код: </xsl:text>
				<xsl:value-of select="AEO_rf1:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
				<xsl:text>) </xsl:text>
			</xsl:if>
		</td>	
		<td class="graphMain bordered" align="right"><xsl:value-of select="translate(AEO_rf1:IdenticalDealNationalPrice, '.', ',')"/></td>
		<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf1:PriceCurrencyCode"/></td>
		<td class="graphMain bordered" align="right"><xsl:value-of select="translate(AEO_rf1:Cost, '.', ',')"/></td>
	</xsl:template>
	<!-- Шаблон для типа AEO_rf1:SignatureType -->
	<xsl:template match="AEO_rf1:Signatures">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Руководитель организации<br/>(или им уполномоченное должностное лицо)</td>
				<td class="value graphMain" style="width:20%"/>
				<td class="annot graphMain" style="width:5%"/>	
				<td class="value graphMain" valign="bottom" style="width:35%; vertical-align: bottom;" align="center">
					<xsl:value-of select="cat_ru:PersonSurname"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="cat_ru:PersonName"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="cat_ru:PersonMiddleName"/>
					<xsl:if test="cat_ru:PersonPost">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="cat_ru:PersonPost"/>
						<xsl:text>)</xsl:text>
					</xsl:if>
				</td>
			</tr>	
			<tr>
				<td class="annot graphMain"/>
				<td class="annot graphMain" style="font-size: x-small" align="center"><i>подпись</i></td>
				<td class="annot graphMain"/>	
				<td class="annot graphMain" style="font-size: x-small" align="center"><i>фамилия, имя, отчество (при наличии)</i></td>
			</tr>	
		</table>
	</xsl:template>
	<!-- Шаблон для типа AEO_rf1:SpecialSimplifiedType -->
	<xsl:template match="AEO_rf1:SpecialSimplified">
		<xsl:if test="AEO_rf1:SpecialSimplifiedCode">
			<xsl:value-of select="AEO_rf1:SpecialSimplifiedCode"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="AEO_rf1:SpecialSimplifiedName">
			<xsl:value-of select="AEO_rf1:SpecialSimplifiedName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="AEO_rf1:KodeksArticle">
			<xsl:text> - на основании </xsl:text>
			<xsl:value-of select="AEO_rf1:KodeksArticle"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа AEO_rf1:StatementNumberType -->
	<xsl:template match="AEO_rf1:StatementNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:if test="AEO_rf1:AddNumberPart"><xsl:value-of select="AEO_rf1:AddNumberPart"/></xsl:if>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа AEO_rf1:TableF1Type -->
	<xsl:template match="AEO_rf1:TableF1">
		<xsl:if test="AEO_rf1:TableF1Row">
			<table class="bordered" width="100%">
				<tr class="title">
					<td class="graphMain bordered" rowspan="2" width="4%" style="vertical-align: middle">№ п/п</td>
					<td class="graphMain bordered" rowspan="2" width="10%" style="vertical-align: middle">Вид применяемых специальных упрощений</td>
					<td class="graphMain bordered" colspan="3" width="35%">Сведения о транспортном (перевозочном) документе</td>
					<td class="graphMain bordered" rowspan="2" width="15%" style="vertical-align: middle">Адрес места фактического нахождения товара</td>
					<td class="graphMain bordered" rowspan="2" width="13%" style="vertical-align: middle">Регистрационный номер заявления о выпуске товаров до подачи декларации на товары</td>
					<td class="graphMain bordered" rowspan="2" width="13%" style="vertical-align: middle">Номер декларации на товар</td>
					<td class="graphMain bordered" rowspan="2" width="10%" style="vertical-align: middle">Номер товара в декларации на товар</td>
				</tr>
				<tr class="title">
					<td class="graphMain bordered" width="15%" style="vertical-align: middle">Наименование документа</td>
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Дата документа</td>
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Номер документа</td>
				</tr>
				<tr class="title">
					<td class="graphMain bordered">1</td>
					<td class="graphMain bordered">2</td>
					<td class="graphMain bordered">3</td>
					<td class="graphMain bordered">4</td>
					<td class="graphMain bordered">5</td>
					<td class="graphMain bordered">6</td>
					<td class="graphMain bordered">7</td>
					<td class="graphMain bordered">8</td>
					<td class="graphMain bordered">9</td>
				</tr>
				<xsl:for-each select="AEO_rf1:TableF1Row">
					<tr>
						<td class="graphMain bordered" valign="top" align="center"><xsl:value-of select="position()"/></td>
						<td class="graphMain bordered" valign="top"><xsl:apply-templates select="AEO_rf1:SpecialSimplified"/></td>
						<td class="graphMain bordered" valign="top"><xsl:value-of select="AEO_rf1:CU_Car/cat_ru:PrDocumentName"/></td>
						<td class="graphMain bordered" valign="top" align="center">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="AEO_rf1:CU_Car/cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</td>
						<td class="graphMain bordered" valign="top"><xsl:value-of select="AEO_rf1:CU_Car/cat_ru:PrDocumentNumber"/></td>
						<td class="graphMain bordered" valign="top"><xsl:apply-templates select="AEO_rf1:GoodsLocationAddress"/></td>
						<td class="graphMain bordered" valign="top"><xsl:apply-templates select="AEO_rf1:AppReleaseGoodsBeforeDTNumber"/></td>
						<td class="graphMain bordered" valign="top"><xsl:apply-templates select="AEO_rf1:DTInfo"/></td>
						<td class="graphMain bordered" valign="top" align="center"><xsl:value-of select="AEO_rf1:DTInfo/AEO_rf1:GoodsNumeric"/></td>
					</tr>
				</xsl:for-each>
			</table>
			<br/>
			<table class="bordered w190">
				<tr class="title">
					<td class="graphMain bordered" colspan="11">Приход</td>
				</tr>
				<tr class="title">
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Наименование документа</td>
					<td class="graphMain bordered" width="6%" style="vertical-align: middle">Дата документа</td>
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Номер документа</td>
					<td class="graphMain bordered" width="6%" style="vertical-align: middle">Код ТН ВЭД ЕАЭС</td>
					<td class="graphMain bordered" width="16%" style="vertical-align: middle">Наименование товара</td>
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Количество в ед. изм. по бухгалтерскому учету</td>
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Условное обозначение ед. изм. по бухгалтерскому учету</td>
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Цена (тариф) за ед. измерения</td>
					<td class="graphMain bordered" width="6%" style="vertical-align: middle">Буквенный код валюты</td>
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Стоимость товара</td>
					<td class="graphMain bordered" width="6%" style="vertical-align: middle">Дата помещения товара на временное хранение</td>
				</tr>
				<tr class="title">
					<td class="graphMain bordered">10</td>
					<td class="graphMain bordered">11</td>
					<td class="graphMain bordered">12</td>
					<td class="graphMain bordered">13</td>
					<td class="graphMain bordered">14</td>
					<td class="graphMain bordered">15</td>
					<td class="graphMain bordered">16</td>
					<td class="graphMain bordered">17</td>
					<td class="graphMain bordered">18</td>
					<td class="graphMain bordered">19</td>
					<td class="graphMain bordered">20</td>
				</tr>
				<xsl:for-each select="AEO_rf1:TableF1Row">
					<tr>
						<xsl:choose>
							<xsl:when test="AEO_rf1:PostingPart"><xsl:apply-templates select="AEO_rf1:PostingPart"/></xsl:when>
							<xsl:otherwise>
								<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
								<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
								<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
								<td class="graphMain bordered"/><td class="graphMain bordered"/>
							</xsl:otherwise>
						</xsl:choose>
					</tr>
				</xsl:for-each>
			</table>
			<br/>
			<table class="bordered w190">
				<tr class="title">
					<td class="graphMain bordered" colspan="11">Расход</td>
				</tr>
				<tr class="title">
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Наименование документа</td>
					<td class="graphMain bordered" width="6%" style="vertical-align: middle">Дата документа</td>
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Номер документа</td>
					<td class="graphMain bordered" width="6%" style="vertical-align: middle">Код ТН ВЭД ЕАЭС</td>
					<td class="graphMain bordered" width="16%" style="vertical-align: middle">Наименование товара</td>
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Количество в ед. изм. по бухгалтерскому учету</td>
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Условное обозначение ед. изм. по бухгалтерскому учету</td>
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Цена (тариф) за ед. измерения</td>
					<td class="graphMain bordered" width="6%" style="vertical-align: middle">Буквенный код валюты</td>
					<td class="graphMain bordered" width="10%" style="vertical-align: middle">Стоимость товара</td>
					<td class="graphMain bordered" width="6%" style="vertical-align: middle">Дата первой выдачи товара</td>
				</tr>
				<tr class="title">
					<td class="graphMain bordered">21</td>
					<td class="graphMain bordered">22</td>
					<td class="graphMain bordered">23</td>
					<td class="graphMain bordered">24</td>
					<td class="graphMain bordered">25</td>
					<td class="graphMain bordered">26</td>
					<td class="graphMain bordered">27</td>
					<td class="graphMain bordered">28</td>
					<td class="graphMain bordered">29</td>
					<td class="graphMain bordered">30</td>
					<td class="graphMain bordered">31</td>
				</tr>
				<xsl:for-each select="AEO_rf1:TableF1Row">
					<tr>
						<xsl:choose>
							<xsl:when test="AEO_rf1:ExpensePart"><xsl:apply-templates select="AEO_rf1:ExpensePart"/></xsl:when>
							<xsl:otherwise>
								<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
								<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
								<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
								<td class="graphMain bordered"/><td class="graphMain bordered"/>
							</xsl:otherwise>
						</xsl:choose>
					</tr>
				</xsl:for-each>
			</table>
			<br/>
			<table class="bordered w190">
				<tr class="title">
					<td class="graphMain bordered" colspan="5">Остаток</td>
				</tr>
				<tr class="title">
					<td class="graphMain bordered" style="vertical-align: middle">Количество в ед. изм. по бухгалтерскому учету</td>
					<td class="graphMain bordered" style="vertical-align: middle">Условное обозначение ед. изм. по бухгалтерскому учету</td>
					<td class="graphMain bordered" style="vertical-align: middle">Цена (тариф) за ед. измерения</td>
					<td class="graphMain bordered" style="vertical-align: middle">Буквенный код валюты</td>
					<td class="graphMain bordered" style="vertical-align: middle">Стоимость товаров</td>
				</tr>
				<tr class="title">
					<td class="graphMain bordered">32</td>
					<td class="graphMain bordered">33</td>
					<td class="graphMain bordered">34</td>
					<td class="graphMain bordered">35</td>
					<td class="graphMain bordered">36</td>
				</tr>
				<xsl:for-each select="AEO_rf1:TableF1Row">
					<tr>
						<xsl:choose>
							<xsl:when test="AEO_rf1:RestGood"><xsl:apply-templates select="AEO_rf1:RestGood"/></xsl:when>
							<xsl:otherwise>
								<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
								<td class="graphMain bordered"/><td class="graphMain bordered"/>
							</xsl:otherwise>
						</xsl:choose>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu::AEORegistryIdDetailsType -->
	<xsl:template match="RUDECLcat:AEORegistryIdDetails">
		<xsl:value-of select="catESAD_cu:DocId"/>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="catESAD_cu:AEORegistryKindCode"/>
		<xsl:text>) код типа реестра: </xsl:text>
		<xsl:value-of select="catESAD_cu:RegistryOwnerCode"/>
		<xsl:if test="catESAD_cu:CountryA2Code">
			<xsl:text> код страны: </xsl:text>
			<xsl:value-of select="catESAD_cu:CountryA2Code"/>
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
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode or cat_ru:IdentityCardName">
			<xsl:value-of select="cat_ru:IdentityCardCode"/>
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
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName or RUScat_ru:IssuerCode">
			<xsl:text>Выдан: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<xsl:text>Выдан: </xsl:text>
			<xsl:value-of select="RUScat_ru:AuthorityId"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text>Код страны: </xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:OrganizationType -->
	<xsl:template match="RUScat_ru:SubjectBranch| AEO_rf1:AuthoriziedOperatorDetails">
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
		<xsl:if test="RUScat_ru:PersonId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Уникальный идентификатор физического лица</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:PersonId"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Сведения о документе, удостоверяющем личность физического лица</td>
					<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUScat_ru:IdentityCard"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Адрес</td>
					<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUScat_ru:SubjectAddressDetails[1]"/></td>
				</tr>
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails[position() &gt; 1]">
					<tr>
						<td class="annot graphMain" style="width:40%"/>
						<td class="value graphMain" style="width:60%"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		<br/>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Контактный реквизит субъекта</td>
					<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUScat_ru:CommunicationDetails"/></td>
				</tr>
			</table>
		</xsl:if>	
		<xsl:if test="RUDECLcat:AEORegistryIdDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Номер свидетельства о включении в реестр уполномоченных экономических операторов</td>
					<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUDECLcat:AEORegistryIdDetails"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectBranch">
			<div class="title marg-top">Сведения об обособленном подразделении</div>
			<xsl:apply-templates select="RUScat_ru:SubjectBranch"/>
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
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
