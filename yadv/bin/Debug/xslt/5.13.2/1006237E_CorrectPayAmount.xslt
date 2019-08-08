<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:grn_cat="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCommonAggregateTypesCust:5.13.1" xmlns:cpa="urn:customs.ru:Information:CustomsDocuments:CorrectPayAmount:5.13.2" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа CorrectPayAmountType -->
	<xsl:template match="cpa:CorrectPayAmount">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div.page {
					width: 210mm;
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
										<b>Информация о суммах таможенных платежей, начисленных в связи с принятием РКТ</b>
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
							<td class="annot graphMain" style="width:40%">Регистрационный номер ДТ</td>
							<td class="value graphMain"><xsl:apply-templates select="cpa:RegNumberDT"/></td>
						</tr>
						<xsl:if test="cpa:ProcedureID">
							<tr>
								<td class="annot graphMain" style="width:40%">Идентификатор  процедуры декларирования</td>
								<td class="value graphMain"><xsl:value-of select="cpa:ProcedureID"/></td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:40%">Регистрационный номер РКТ</td>
							<td class="value graphMain"><xsl:apply-templates select="cpa:RegistrationNumber"/></td>
						</tr>
						<xsl:if test="cpa:Comments">
							<tr>
								<td class="annot graphMain" style="width:40%">Комментарии</td>
								<td class="value graphMain"><xsl:value-of select="cpa:Comments"/></td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:40%">Наименование таможенного органа</td>
							<td class="value graphMain"><xsl:apply-templates select="cpa:Customs"/></td>
						</tr>
					</table>		
					<xsl:if test="cpa:Consignee">
						<div class="title marg-top">Получатель</div>
						<xsl:apply-templates select="cpa:Consignee"/>
					</xsl:if>
					<xsl:if test="cpa:Consignor">
						<div class="title marg-top">Отправитель</div>
						<xsl:apply-templates select="cpa:Consignor"/>
					</xsl:if>
					<table class="bordered w190">
						<xsl:for-each select="cpa:Goods">
							<tr>
								<td class="annot graphMain" style="border-bottom:1px solid black" colspan="9">
									<div class="title marg-top">Товар № <xsl:value-of select="position()"/></div>
								</td>
							</tr>
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">
			<xsl:if test="cat_ru:PostalCode">, </xsl:if>
			<xsl:if test="not(cat_ru:CounryName)"><xsl:value-of select="cat_ru:CountryCode"/></xsl:if>
			<xsl:value-of select="cat_ru:CounryName"/>			
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City or cat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="cat_ru:TerritoryCode"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
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
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="cat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName"><xsl:value-of select="cat_ru:IdentityCardName"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries"> серия: <xsl:value-of select="cat_ru:IdentityCardSeries"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber"> № <xsl:value-of select="cat_ru:IdentityCardNumber"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName"> выдан: 
			<xsl:if test="cat_ru:IdentityCardDate">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
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
			<xsl:text>ОГРН: </xsl:text>
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
	<!-- Шаблон для типа cat_ru:CUOrganizationType -->
	<xsl:template match="cpa:Consignee| cpa:Consignor| cpa:Declarant">
		<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование организации /<br/>ФИО физического лица</td>
					<td class="value graphMain">
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
					<td class="value graphMain"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Сведения об организации</td>
					<td class="value graphMain">
						<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Address">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Адрес организации</td>
					<td class="value graphMain"><xsl:apply-templates select="cat_ru:Address"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCard">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Документ, удостоверяющий личность</td>
					<td class="value graphMain"><xsl:apply-templates select="cat_ru:IdentityCard"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Contact">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Контактная информация</td>
					<td class="value graphMain"><xsl:apply-templates select="cat_ru:Contact"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="cpa:Customs">
		<xsl:value-of select="cat_ru:Code"/>&#160;
		<xsl:value-of select="cat_ru:OfficeName"/>
	</xsl:template>
	<xsl:template match="cpa:Goods">
		<xsl:variable name="kol1" select="count(cpa:TotalPayCustCost)"/>
		<xsl:variable name="kol2" select="count(cpa:TotalClassGood)"/>
		<xsl:variable name="kol3" select="count(cpa:FactClassGood)"/>
		<xsl:variable name="kol4" select="count(cpa:ReturnAmount)"/>
		<xsl:variable name="kol_str" select="$kol1+$kol2+$kol3+$kol4"/>
		<xsl:if test="cpa:GoodsDescription">
			<tr>
				<td class="annot graphMain" colspan="3"><xsl:apply-templates select="cpa:GoodsDescription"/></td>
			</tr>	
		</xsl:if>
		<xsl:if test="cpa:TNVEDCode or cpa:GoodsNumeric or cpa:GoodsAddTNVEDCode">
			<tr>
				<td class="annot graphMain" colspan="3"><i><div class="marg-top">Сведения из ДТ</div></i></td>
			</tr>	
			<xsl:if test="cpa:GoodsNumeric">
				<tr>
					<td class="annot graphMain" style="width:2%"/>
					<td class="annot graphMain" style="width:38%">Номер товара</td>
					<td class="value graphMain"><xsl:value-of select="cpa:GoodsNumeric"/></td>
				</tr>	
			</xsl:if>
			<xsl:if test="cpa:TNVEDCode">
				<tr>
					<td class="annot graphMain" style="width:2%"/>
					<td class="annot graphMain" style="width:38%">Код товара по ТН ВЭД ЕАЭС</td>
					<td class="value graphMain"><xsl:value-of select="cpa:TNVEDCode"/></td>
				</tr>	
			</xsl:if>
			<xsl:if test="cpa:GoodsAddTNVEDCode">
				<tr>
					<td class="annot graphMain" style="width:2%"/>
					<td class="annot graphMain" style="width:38%">Код товара по классификатору доп.тамож.информации</td>
					<td class="value graphMain"><xsl:value-of select="cpa:GoodsAddTNVEDCode"/></td>
				</tr>	
			</xsl:if>
		</xsl:if>
		<xsl:if test="cpa:TNVEDCodeKDT or cpa:KDTGoodsNumeric or cpa:GoodsAddTNVEDCodeKDT">
			<tr>
				<td class="annot graphMain" colspan="3"><i><div class="marg-top">Сведения из КДТ</div></i></td>
			</tr>	
			<xsl:if test="cpa:KDTGoodsNumeric">
				<tr>
					<td class="annot graphMain" style="width:2%"/>
					<td class="annot graphMain" style="width:38%">Номер товара</td>
					<td class="value graphMain"><xsl:value-of select="cpa:KDTGoodsNumeric"/></td>
				</tr>	
			</xsl:if>
			<xsl:if test="cpa:TNVEDCodeKDT">
				<tr>
					<td class="annot graphMain" style="width:2%"/>
					<td class="annot graphMain" style="width:38%">Код товара по ТН ВЭД ЕАЭС</td>
					<td class="value graphMain"><xsl:value-of select="cpa:TNVEDCodeKDT"/></td>
				</tr>	
			</xsl:if>
			<xsl:if test="cpa:GoodsAddTNVEDCodeKDT">
				<tr>
					<td class="annot graphMain" style="width:2%"/>
					<td class="annot graphMain" style="width:38%">Код товара по классификатору доп.тамож.информации</td>
					<td class="value graphMain"><xsl:value-of select="cpa:GoodsAddTNVEDCodeKDT"/></td>
				</tr>	
			</xsl:if>
		</xsl:if>
		<xsl:if test="cpa:IsPartialGood or cpa:EffectCode or cpa:NoTariffCode">
			<tr>
				<td class="annot graphMain" colspan="3"><i><div class="marg-top">Решение по товарам</div></i></td>
			</tr>	
			<xsl:if test="cpa:IsPartialGood">
				<tr>
					<td class="annot graphMain" style="width:2%"/>
					<td class="annot graphMain" style="width:38%">Решение принято в отношении</td>
					<td class="value graphMain">
						<xsl:choose>
							<xsl:when test="cpa:IsPartialGood=1 or cpa:IsPartialGood='true'">части товара</xsl:when>
							<xsl:otherwise>всего товара</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>	
			</xsl:if>
			<xsl:if test="cpa:EffectCode">
				<tr>
					<td class="annot graphMain" style="width:2%"/>
					<td class="annot graphMain" style="width:38%">Следствие решения по классификации</td>
					<td class="value graphMain">
						<xsl:choose>
							<xsl:when test="cpa:EffectCode=1">таможенные  платежи не изменились</xsl:when>
							<xsl:when test="cpa:EffectCode=2">изменение размера таможенных  платежей, в сторону уменьшения</xsl:when>
							<xsl:when test="cpa:EffectCode=3">изменение размера таможенных  платежей, в сторону увеличения в связи с изменением ставок</xsl:when>
							<xsl:when test="cpa:EffectCode=4">информация об изменении таможенных платежей, отсутствует: проводится доп проверка ТС и (или) контроль правильности начисления платежей</xsl:when>
							<xsl:when test="cpa:EffectCode=5">таможенные платежи не изменились: в отношении товара действуют тарифные преференции и льготы</xsl:when>
							<xsl:when test="cpa:EffectCode=6">изменение размера таможенных платежей, в сторону увеличения в связи с изменением ТС</xsl:when>
							<xsl:when test="cpa:EffectCode=7">изменение размера таможенных платежей, в сторону увеличения в связи с изменением ставок и таможенной стоимости</xsl:when>
							<xsl:when test="cpa:EffectCode=8">доначисление таможенных платежей достигнуто при повторном декларировании товаров</xsl:when>
							<xsl:when test="cpa:EffectCode=9">информация об изменении таможенных  платежей отсутствует: прочие причины</xsl:when>
							<xsl:otherwise><xsl:value-of select="cpa:EffectCode"/></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>	
			</xsl:if>
			<xsl:if test="cpa:NoTariffCode">
				<tr>
					<td class="annot graphMain" style="width:2%"/>
					<td class="annot graphMain" style="width:38%">Следствие по нетарифным мерам</td>
					<td class="value graphMain">
						<xsl:choose>
							<xsl:when test="cpa:NoTariffCode=4">нетарифные меры регулирования не изменились</xsl:when>
							<xsl:when test="cpa:NoTariffCode=5">нетарифные меры регулирования изменились</xsl:when>
							<xsl:otherwise><xsl:value-of select="cpa:NoTariffCode"/></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>	
			</xsl:if>
		</xsl:if>
		<xsl:if test="cpa:Declarant">
			<tr>
				<td class="annot graphMain" colspan="3"><i><div class="marg-top">Декларант</div></i></td>
			</tr>	
			<tr>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" colspan="2"><xsl:apply-templates select="cpa:Declarant"/></td>
			</tr>	
		</xsl:if>
		<xsl:if test="$kol_str &gt; 0">
			<tr>
				<td class="annot graphMain" colspan="3"><i><div class="marg-top">Таможенные платежи</div></i></td>
			</tr>	
			<tr>
				<td class="annot graphMain" colspan="3">
					<table class="w190">
						<tr>
							<td class="graphMain bordered" style="vertical-align:middle;width:5%">№<br/>п/п</td>
							<td class="graphMain bordered" style="vertical-align:middle">Наименование платежа</td>
							<td class="graphMain bordered" style="vertical-align:middle;width:25%">Cумма</td>
						</tr>
						<xsl:if test="cpa:TotalPayCustCost">
							<tr>
								<td class="graphMain bordered" align="center"><xsl:value-of select="$kol1"/>.</td>
								<td class="graphMain bordered" style="font-size:11pt">Общая сумма таможенных платежей, начисленных в результате корректировки таможенной стоимости</td>
								<td class="graphMain bordered" style="font-size:11pt"><xsl:value-of select="translate(cpa:TotalPayCustCost, '.', ',')"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="cpa:TotalClassGood">
							<tr>
								<td class="graphMain bordered" align="center"><xsl:value-of select="$kol1+$kol2"/>.</td>
								<td class="graphMain bordered" style="font-size:11pt">Дополнительно начисленные таможенные платежи в связи с увеличением ставок платежа</td>
								<td class="graphMain bordered" style="font-size:11pt"><xsl:value-of select="translate(cpa:TotalClassGood, '.', ',')"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="cpa:FactClassGood">
							<tr>
								<td class="graphMain bordered" align="center"><xsl:value-of select="$kol1+$kol2+$kol3"/>.</td>
								<td class="graphMain bordered" style="font-size:11pt">Взысканные таможенные платежи в связи с увеличением ставок платежа</td>
								<td class="graphMain bordered" style="font-size:11pt"><xsl:value-of select="translate(cpa:FactClassGood, '.', ',')"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="cpa:ReturnAmount">
							<tr>
								<td class="graphMain bordered" align="center"><xsl:value-of select="$kol1+$kol2+$kol3+$kol4"/>.</td>
								<td class="graphMain bordered" style="font-size:11pt">Таможенные платежи, подлежащих возврату</td>
								<td class="graphMain bordered" style="font-size:11pt"><xsl:value-of select="translate(cpa:ReturnAmount, '.', ',')"/></td>
							</tr>
						</xsl:if>
					</table>
				</td>
			</tr>	
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа grn_cat:AmountPaidType -->
	<xsl:template match="cpa:PayCustCost">
		<xsl:value-of select="translate(grn_cat:Amount, '.', ',')"/>
		<xsl:text> </xsl:text>
		<xsl:if test="grn_cat:CurrencyCode"><xsl:value-of select="grn_cat:CurrencyCode"/> </xsl:if>
		<xsl:if test="grn_cat:CUCustomsPaymentCode"> (код: <xsl:value-of select="grn_cat:CUCustomsPaymentCode"/>)</xsl:if>		
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="cpa:RegNumberDT">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date"><xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/></xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cpa:RegistrationNumberType -->
	<xsl:template match="cpa:RegistrationNumber">
		<xsl:text>РКТ-</xsl:text>
		<xsl:value-of select="cpa:CustomsCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="substring(cpa:Date,3,2)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cpa:SerialNumber"/>
		<xsl:text>И</xsl:text>
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
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
