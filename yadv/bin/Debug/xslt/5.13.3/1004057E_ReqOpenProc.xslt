<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rodp="urn:customs.ru:Information:ExchangeDocuments:ReqOpenProc:5.13.1" xmlns:xs="http://www.w3.org/2001/XMLSchema">
 <!-- Шаблон для типа ReqOpenProcType -->
<xsl:template match="rodp:ReqOpenProc">
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
				padding: 10mm 10mm 10mm 20mm;
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
							<td align="center" class="graphMain"><font size="4"><b>Запрос на открытие процедуры.</b></font></td>
						</tr>
					</tbody>
				</table>
				<br/>
				<xsl:if test="rodp:AgreementID">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор cоглашения между участниками ВЭД</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="rodp:AgreementID"/></td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="rodp:Declarant">
					<div class="title marg-top">Информация об основном участнике ВЭД</div>
					<xsl:apply-templates select="rodp:Declarant" />
				</xsl:if>
				<xsl:if test="rodp:Principal">
					<div class="title marg-top">Информация о дополнительном участнике обмена</div>
					<xsl:apply-templates select="rodp:Principal" />
				</xsl:if>
			</div>
		</body>
	</html>
</xsl:template>
<!-- Шаблон для типа cat_ru:AddressType -->
<xsl:template match="cat_ru:Address">
	<tr>
		<td class="annot graphMain" style="width:50%">Адрес</td>
		<td class="value graphMain" style="width:50%">
			<xsl:if test="cat_ru:PostalCode">
				<xsl:value-of select="cat_ru:PostalCode" />
				<xsl:text>,</xsl:text>
			</xsl:if>
			<xsl:if test="cat_ru:CountryCode">
				<xsl:text>  </xsl:text>
				<xsl:value-of select="cat_ru:CountryCode" />
				<xsl:text>,</xsl:text>
			</xsl:if>
			<xsl:if test="cat_ru:CounryName">
				<xsl:text>  </xsl:text>
				<xsl:value-of select="cat_ru:CounryName" />
				<xsl:text>,</xsl:text>
			</xsl:if>
				<xsl:if test="cat_ru:Region">
				<xsl:text>  </xsl:text>
				<xsl:value-of select="cat_ru:Region" />
				<xsl:text>,</xsl:text>
			</xsl:if>
			<xsl:if test="cat_ru:City">
				<xsl:text>  </xsl:text>
				<xsl:value-of select="cat_ru:City" />
				<xsl:text>,</xsl:text>
			</xsl:if>
			<xsl:if test="cat_ru:StreetHouse">
				<xsl:text>  </xsl:text>
				<xsl:value-of select="cat_ru:StreetHouse" />
				<xsl:if test="cat_ru:TerritoryCode"><xsl:text>,</xsl:text></xsl:if>
			</xsl:if>
			<xsl:if test="cat_ru:TerritoryCode">
				<xsl:text>  код (для КР): </xsl:text>
				<xsl:value-of select="cat_ru:TerritoryCode" />
			</xsl:if>
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для типа cat_ru:ContactType -->
<xsl:template match="cat_ru:Contact">
	<tr>
		<td class="annot graphMain" style="width:50%">Контактная информация</td>
		<td class="graphMain value" style="width:50%">
			<xsl:if test="cat_ru:Phone">		
				<xsl:text>телефон: </xsl:text>
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="." />
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="cat_ru:Fax">
				<xsl:text>  факс: </xsl:text>
				<xsl:value-of select="cat_ru:Fax" />
			</xsl:if>
			<xsl:if test="cat_ru:Telex">
				<xsl:text>  телекс: </xsl:text>
				<xsl:value-of select="cat_ru:Telex" />
			</xsl:if>
			<xsl:if test="cat_ru:E_mail">
				<xsl:text>  e-mail: </xsl:text>
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="." />
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для типа cat_ru:ITNKZType -->
<xsl:template match="cat_ru:ITN">
	<xsl:text> (Код категория лица: </xsl:text>
	<xsl:value-of select="cat_ru:CategoryCode" />
	<xsl:text> Код КАТО: </xsl:text>
	<xsl:value-of select="cat_ru:KATOCode" />
	<xsl:if test="cat_ru:RNN">
		<xsl:text> РНН: </xsl:text>
		<xsl:value-of select="cat_ru:RNN" />
	</xsl:if>
	<xsl:if test="cat_ru:ITNReserv">
		<xsl:text> Резерв: </xsl:text>
		<xsl:value-of select="cat_ru:ITNReserv" />
	</xsl:if>
	<xsl:text>)</xsl:text>
</xsl:template>
<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
<xsl:template match="cat_ru:KGOrganizationFeatures">
	<tr>
		<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Кыргызской Республики</td>
		<td class="value graphMain" style="width:50%">
			<xsl:if test="cat_ru:KGINN">
				<xsl:text>ИНН/ПИН: </xsl:text>
				<xsl:value-of select="cat_ru:KGINN" />
			</xsl:if>
			<xsl:if test="cat_ru:KGOKPO">
				<xsl:text> ОКПО: </xsl:text>
				<xsl:value-of select="cat_ru:KGOKPO" />
			</xsl:if>
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
<xsl:template match="cat_ru:RAOrganizationFeatures">
	<tr>
		<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Республики Армения</td>
		<td class="value graphMain" style="width:50%">
			<xsl:if test="cat_ru:UNN">
				<xsl:text>УНН: </xsl:text>
				<xsl:value-of select="cat_ru:UNN" />
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceNumber">
				<xsl:text> НЗОУ: </xsl:text>
				<xsl:value-of select="cat_ru:SocialServiceNumber" />
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceCertificate">
				<xsl:text> Номер справки об отсутствии НЗОУ: </xsl:text>
				<xsl:value-of select="cat_ru:SocialServiceCertificate" />
			</xsl:if>
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
<xsl:template match="cat_ru:RBOrganizationFeatures">
	<tr>
		<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Республики Беларусь</td>
		<td class="value graphMain" style="width:50%">
			<xsl:if test="cat_ru:UNP">
				<xsl:text>УНП: </xsl:text>
				<xsl:value-of select="cat_ru:UNP" />
			</xsl:if>
			<xsl:if test="cat_ru:RBIdentificationNumber">
				<xsl:text> Идентификационный номер физического лица: </xsl:text>
				<xsl:value-of select="cat_ru:RBIdentificationNumber" />
			</xsl:if>
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
<xsl:template match="cat_ru:RFOrganizationFeatures">
	<tr>
		<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Российской Федерации</td>
		<td class="value graphMain" style="width:50%">
			<xsl:if test="cat_ru:OGRN">
				<xsl:text>ОГРН/ОГРНИП: </xsl:text>
				<xsl:value-of select="cat_ru:OGRN" />
			</xsl:if>
			<xsl:if test="cat_ru:INN">
				<xsl:text> ИНН: </xsl:text>
				<xsl:value-of select="cat_ru:INN" />
			</xsl:if>
			<xsl:if test="cat_ru:KPP">
				<xsl:text> КПП: </xsl:text>
				<xsl:value-of select="cat_ru:KPP" />
			</xsl:if>
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
<xsl:template match="cat_ru:RKOrganizationFeatures">
	<tr>
		<td class="annot graphMain" style="width:50%">Сведения об организации. Особенности Республики Казахстан</td>
		<td class="value graphMain" style="width:50%">
			<xsl:if test="cat_ru:BIN">
				<xsl:text>БИН: </xsl:text>
				<xsl:value-of select="cat_ru:BIN" />
			</xsl:if>
			<xsl:if test="cat_ru:IIN">
				<xsl:text> ИИН: </xsl:text>
				<xsl:value-of select="cat_ru:IIN" />
			</xsl:if>
			<xsl:if test="cat_ru:ITN">
				<xsl:text> Идентификационный таможенный номер: </xsl:text>
				<xsl:apply-templates select="cat_ru:ITN" />
			</xsl:if>
		</td>
	</tr>
</xsl:template>
<!-- Шаблон для участника обмена -->
<xsl:template match="rodp:Declarant|rodp:Principal">
	<table class="w190">
		<xsl:if test="cat_ru:OrganizationName">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationName" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<tr>
				<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:ShortName" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<tr>
				<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" />
		</xsl:if>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures" />
		</xsl:if>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures" />
		</xsl:if>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures" />
		</xsl:if>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures" />
		</xsl:if>
		<xsl:if test="name(.)='rodp:Declarant'">
			<xsl:if test="cat_ru:OKPOID">
				<tr>
					<td class="annot graphMain" style="width:50%">Код организации по ОКПО</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OKPOID" /></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:OKATOCode">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ОКАТО</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OKATOCode" /></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:Contact">
				<xsl:apply-templates select="cat_ru:Contact" />
			</xsl:if>
			<xsl:if test="cat_ru:Address">
				<xsl:apply-templates select="cat_ru:Address" />
			</xsl:if>
		</xsl:if>
		<xsl:if test="name(.)='rodp:Principal'">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор внешнего участника обмена</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="rodp:ParticipantID" /></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Тип дополнительного участника</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="rodp:TypePrincipal=0"><xsl:text>перевозчик</xsl:text></xsl:when>
						<xsl:when test="rodp:TypePrincipal=1"><xsl:text>декларант</xsl:text></xsl:when>
						<xsl:otherwise><xsl:value-of select="rodp:TypePrincipal" /></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Признак допустимости активного участия в процедуре</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="rodp:Principal='true' or rodp:Principal='1'"><xsl:text>разрешено</xsl:text></xsl:when>
						<xsl:otherwise><xsl:value-of select="rodp:Principal" /></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
	</table>	
</xsl:template>
<!-- Шаблон для преобразования даты -->
<xsl:template name="russian_date">
	<xsl:param name="dateIn" />
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,6,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,1,4)" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>