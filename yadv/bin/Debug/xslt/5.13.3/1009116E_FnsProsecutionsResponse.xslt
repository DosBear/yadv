<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:fp_res="urn:customs.ru:Information:SQDocuments:FnsProsecutionsResponse:5.13.3">
	<!-- Шаблон для типа FnsProsecutionsResponseType -->
	<xsl:template match="fp_res:FnsProsecutionsResponse">
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
					width: 290mm;
					max-width: 290mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 5mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					.marg-top
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
										<b>Ответ на запрос о возбужденных налоговыми органами делах об административных правонарушениях</b>
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
					</xsl:if>
					<div class="title marg-top">Номер и дата акта проверки</div-->
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered" style="vertical-align: middle">Сведения о физ. лице / организации</td>
								<!--td class="graphMain bordered" style="vertical-align: middle">Наименование организации</td-->
								<td class="graphMain bordered" style="vertical-align: middle">Номер и дата акта проверки</td>
								<td class="graphMain bordered" style="vertical-align: middle">Номер и дата постановления о прекращении производства по делу об АП</td>
								<td class="graphMain bordered" style="vertical-align: middle">Номер и дата протокола об АП</td>
								<td class="graphMain bordered" style="vertical-align: middle">Номер и дата определения о возбуждении дела об АП</td>
								<td class="graphMain bordered" style="vertical-align: middle">Номер и дата определения об отказе в возбуждении дела об АП</td>
								<td class="graphMain bordered" style="vertical-align: middle">Содержание правонарушения</td>
							</tr>
							<xsl:for-each select="fp_res:Information">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
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
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="fp_res:Act| fp_res:Designation| fp_res:DesignationFailure| fp_res:Protocol| fp_res:Ruling">
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
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="fp_res:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode or cat_ru:IdentityCardName">
			<xsl:value-of select="cat_ru:IdentityCardCode"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>) </xsl:text>
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
		<xsl:if test="RUScat_ru:FullIdentityCardName">&#160;<xsl:value-of select="RUScat_ru:FullIdentityCardName"/></xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId"> выдан <xsl:value-of select="RUScat_ru:AuthorityId"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа fp_res:InformationType -->
	<xsl:template match="fp_res:Information">
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="fp_res:PhysicalPersonInfo"/>
				<xsl:apply-templates select="fp_res:OrganizationName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="fp_res:Act"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="fp_res:Ruling"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="fp_res:Protocol"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="fp_res:Designation"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="fp_res:DesignationFailure"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="fp_res:Offense"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа fp_res:OffenseType -->
	<xsl:template match="fp_res:Offense">
		статья <xsl:value-of select="fp_res:Article"/>
		, пункт <xsl:value-of select="fp_res:Item"/>
		, часть <xsl:value-of select="fp_res:Part"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:OrganizationBaseType -->
	<xsl:template match="fp_res:OrganizationName">
		<b>Юридическое лицо</b><br/>
		<xsl:if test="cat_ru:OrganizationLanguage">
			Язык заполнения: <xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
		</xsl:if>
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<br/>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="fp_res:PersonFIO">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>	
		<xsl:if test="cat_ru:PersonPost">,  <xsl:value-of select="cat_ru:PersonPost"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа fp_res:ResPhysicalPersonInfoType -->
	<xsl:template match="fp_res:PhysicalPersonInfo">
		<b>Физическое лицо</b><br/>
		<xsl:apply-templates select="fp_res:PersonFIO"/><br/>
		<xsl:if test="fp_res:BirthDate">Дата рождения: 
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="fp_res:BirthDate"/>
			</xsl:call-template>
			<br/>
		</xsl:if>
		<xsl:if test="fp_res:BirthPlace">Место рождения: <xsl:value-of select="fp_res:BirthPlace"/><br/></xsl:if>
		<xsl:if test="fp_res:INN">ИНН: <xsl:value-of select="fp_res:INN"/><br/></xsl:if>
		<xsl:if test="fp_res:IdentityCard">Документ, удостоверяющий личность: <xsl:apply-templates select="fp_res:IdentityCard"/></xsl:if>
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
