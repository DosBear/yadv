<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:rk_qe_res="urn:customs.ru:Information:SQDocuments:RoskosmosQuotaExhaustInfoResponse:5.13.3">
	<!-- Шаблон для типа RoskosmosQuotaExhaustInfoResponseType -->
	<xsl:template match="rk_qe_res:RoskosmosQuotaExhaustInfoResponse">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div
					{
					/*white-space: nowrap;*/
					}

					div.page {
					width: 290mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 5mm;
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
										<b>Подтверждение о целевом назначении товаров, ввозимых в рамках международного сотрудничества Российской Федерации в области исследования и использования космического пространства, в том числе оказания услуг по запуску космических аппаратов, по которому квота исчерпана</b>
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
					<xsl:if test="rk_qe_res:CustomControlInfo">
						<div class="title marg-top">Данные по целевом назначении товаров</div>
						<table class="bordered w190">
							<xsl:for-each select="rk_qe_res:CustomControlInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text> код КАТО </xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text> РНН </xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="rk_qe_res:AddQuantity|rk_qe_res:Quantity">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="rk_qe_res:Address">
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
	<!-- Шаблон для типа rk_qe_res:PersonType -->
	<xsl:template match="rk_qe_res:Authorized | rk_qe_res:AuthorizedCustoms">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="rk_qe_res:Contract">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>	
	</xsl:template>
	<!-- Шаблон для типа rk_qe_res:CustomControlInfoType -->
	<xsl:template match="rk_qe_res:CustomControlInfo">
		<tr class="title" bgcolor="#e3e3e3">
			<td class="graphMain bordered" colspan="2">
				<xsl:text>Подтверждение № </xsl:text>
				<xsl:value-of select="rk_qe_res:ConfirmationNumber"/>
				<xsl:text> от </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rk_qe_res:ConfirmationDate"/>
				</xsl:call-template>
			</td>
		</tr>
		<xsl:if test="rk_qe_res:InternationalTreaty">
			<tr>
				<td class="annon graphMain" style="width:35%">
					Сведения о международном соглашении (договоре), <br/>в рамках которого ввозятся товары</td>
				<td class="value graphMain" style="width:65%">
					<xsl:for-each select="rk_qe_res:InternationalTreaty"><xsl:value-of select="."/></xsl:for-each>
				</td>
			</tr>	
		</xsl:if>
		<xsl:if test="rk_qe_res:Contract">
			<tr>
				<td class="annon graphMain" style="width:35%">Реквизиты контракта</td>
				<td class="value graphMain" style="width:65%"><xsl:apply-templates select="rk_qe_res:Contract"/></td>
			</tr>	
		</xsl:if>
		<xsl:if test="rk_qe_res:Recipient">
			<tr>
				<td class="annon graphMain" colspan="2">
					<b>Сведения о получателе товаров (декларанте)</b><br/>
					<xsl:apply-templates select="rk_qe_res:Recipient"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="rk_qe_res:Vendor">
			<tr>
				<td class="annon graphMain" colspan="2">
					<b>Сведения о продавце</b><br/>
					<xsl:apply-templates select="rk_qe_res:Vendor"/>
				</td>
			</tr>
		</xsl:if>
		<tr>
			<td class="annon graphMain" colspan="2">
				<b>Сведения о товаре</b><br/>
				<xsl:for-each select="rk_qe_res:Product"><xsl:value-of select="."/></xsl:for-each>
				<br/>
				<table class="border w190">
					<tr class="title">
						<td class="graphMain bordered">Страна отправления</td>
						<td class="graphMain bordered">Страна происхождения</td>
						<td class="graphMain bordered">Срок ввоза</td>
						<xsl:if test="rk_qe_res:PeriodStart"><td class="graphMain bordered">Срок запуска КА</td></xsl:if>
						<td class="graphMain bordered">Кол-во</td>
						<xsl:if test="rk_qe_res:AddQuantity"><td class="graphMain bordered">Кол-во в ДЕИ</td></xsl:if>
						<xsl:if test="rk_qe_res:Cost"><td class="graphMain bordered">Стоимость (в валюте контракта)</td></xsl:if>
						<td class="graphMain bordered">Статистическая стоимость</td>
						<td class="graphMain bordered">Номер ДТ</td>
					</tr>
					<tr>
						<td class="graphMain bordered"><xsl:value-of select="rk_qe_res:DepartCountry"/></td>
						<td class="graphMain bordered"><xsl:value-of select="rk_qe_res:OriginCountryName"/></td>
						<td class="graphMain bordered">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="rk_qe_res:PeriodImport"/>
							</xsl:call-template>
						</td>
						<xsl:if test="rk_qe_res:PeriodStart">
							<td class="graphMain bordered">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rk_qe_res:PeriodStart"/>
								</xsl:call-template>
							</td>
						</xsl:if>
						<td class="graphMain bordered"><xsl:apply-templates select="rk_qe_res:Quantity"/></td>
						<xsl:if test="rk_qe_res:AddQuantity">
							<td class="graphMain bordered"><xsl:apply-templates select="rk_qe_res:AddQuantity"/></td>
						</xsl:if>
						<xsl:if test="rk_qe_res:Cost">
							<td class="graphMain bordered">
								<xsl:value-of select="translate(rk_qe_res:Cost, '.', ',')"/>
								<xsl:if test="rk_qe_res:ContractCurrency">
									(код валюты: <xsl:value-of select="rk_qe_res:ContractCurrency"/>)
								</xsl:if>
							</td>
						</xsl:if>
						<td class="graphMain bordered"><xsl:value-of select="translate(rk_qe_res:StatisticalCost, '.', ',')"/></td>
						<td class="graphMain bordered"><xsl:apply-templates select="rk_qe_res:NumberDeclaration"/></td>
					</tr>
				</table>
				<br/>
			</td>
		</tr>
		<xsl:if test="rk_qe_res:AdditionalInfo">
			<tr>
				<td class="annon graphMain" style="width:35%">Дополнительная информация</td>
				<td class="value graphMain" style="width:65%">
					<xsl:for-each select="rk_qe_res:AdditionalInfo"><xsl:value-of select="."/></xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<tr>
			<td class="annon graphMain" style="width:35%">Уполномоченное лицо</td>
			<td class="value graphMain" style="width:65%">
				<xsl:apply-templates select="rk_qe_res:Authorized"/>
			</td>
		</tr>
		<tr>
			<td class="annon graphMain" style="width:35%">Уполномоченное лицо тамож. органа</td>
			<td class="value graphMain" style="width:65%">
				<xsl:apply-templates select="rk_qe_res:AuthorizedCustoms"/>
			</td>
		</tr>
		<tr>
			<td class="annon graphMain" style="width:35%">Информация о текущем статусе подтверждения</td>
			<td class="value graphMain" style="width:65%">
				<xsl:value-of select="rk_qe_res:StatusConfirmation"/>
			</td>
		</tr>
		<tr>
			<td class="annon graphMain" style="width:35%">Информация о дате и времени последнего изменения</td>
			<td class="value graphMain" style="width:65%">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rk_qe_res:LastModification"/>
				</xsl:call-template>
			</td>
		</tr>
		<tr><td class="annon graphMain" colspan="2"><br/></td></tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="rk_qe_res:NumberDeclaration">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUOrganizationBaseType -->
	<xsl:template match="rk_qe_res:Recipient | rk_qe_res:Vendor">
		<table class="w190">
			<xsl:if test="RUScat_ru:OrganizationLanguage">
				<tr>
					<td class="annot graphMain" style="width:35%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:65%"><xsl:value-of select="RUScat_ru:OrganizationLanguage"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:ShortName">
				<tr>
					<td class="annot graphMain" style="width:35%">Наименование организации / ФИО физ. лица</td>
					<td class="graphMain value" style="width:65%">
						<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
						<xsl:if test="RUScat_ru:ShortName">
							<xsl:if test="RUScat_ru:OrganizationName"> (</xsl:if>
							<xsl:value-of select="RUScat_ru:ShortName"/>
							<xsl:if test="RUScat_ru:OrganizationName">)</xsl:if>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="RUScat_ru:RFOrganizationFeatures or RUScat_ru:RKOrganizationFeatures or RUScat_ru:RBOrganizationFeatures or RUScat_ru:RAOrganizationFeatures or RUScat_ru:KGOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:35%">Сведения об организации</td>
					<td class="value graphMain" style="width:65%">
						<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="rk_qe_res:Address">
				<tr>
					<td class="annot graphMain" style="width:35%">Адрес организации</td>
					<td class="value graphMain" style="width:65%"><xsl:apply-templates select="rk_qe_res:Address"/></td>
				</tr>	
			</xsl:if>
			<xsl:if test="rk_qe_res:Country">
				<tr>
					<td class="annot graphMain" style="width:35%">Страна продавца</td>
					<td class="value graphMain" style="width:65%"><xsl:value-of select="rk_qe_res:Country"/></td>
				</tr>	
			</xsl:if>
		</table>	
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text> ИНН / ПИН </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text> ОКПО </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text> УНН </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text> НЗОУ </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text> Номер справки об отсутствии НЗОУ </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text> УНП </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text> Ид.номер физ.лица </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text> БИН </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text> ИИН </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text> ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
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
