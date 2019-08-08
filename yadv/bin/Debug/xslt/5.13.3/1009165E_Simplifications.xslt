<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:smpf="urn:customs.ru:Information:SQDocuments:Simplifications:5.13.1">
	<!-- Шаблон для типа SimplificationsType -->
	<xsl:template match="smpf:Simplifications">
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
					font-weight:bold;
					}

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					font-family: Verdana;
					font-size: 9pt;
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
										<b>Сведения о применении / неприменении Упрощений</b>
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
					<table class="bordered w190">
						<tr class="title">
							<td class="bordered graphMain" style="vertical-align:middle">Сведения о налогоплательщике</td>
							<td class="bordered graphMain" style="vertical-align:middle">Регистрация в качестве ЮЛ / ИП</td>
							<td class="bordered graphMain" style="vertical-align:middle">Поставка на учет в налоговом органе</td>
							<td class="bordered graphMain" style="vertical-align:middle">Код категории налогоплательщик</td>
							<td class="bordered graphMain" style="vertical-align:middle">Код вида применяемого упрощения</td>
							<td class="bordered graphMain" style="vertical-align:middle">Период, в который налогоплательщик имеет право на применение подпункта 1.1 статьи 151 НКРФ</td>
							<td class="bordered graphMain" style="vertical-align:middle">Дата исключения из реестра резидентов ОЭЗ в Калининградской обл.</td>
						</tr>
						<xsl:for-each select="smpf:Simplification">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
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
	<!-- Шаблон для типа smpf:SimplificationType -->
	<xsl:template match="smpf:Simplification">
		<tr>
			<td class="graphMain bordered" rowspan="{count(smpf:SimplificationInfo)}">
				<xsl:choose>
					<xsl:when test="smpf:TaxPayerType=1"> (ЮЛ) </xsl:when>
					<xsl:when test="smpf:TaxPayerType=2"> (ИП) </xsl:when>
				</xsl:choose>
				<xsl:apply-templates select="smpf:TaxPayerInfo"/>
			</td>
			<td class="graphMain bordered" rowspan="{count(smpf:SimplificationInfo)}">
				<xsl:text>Дата регистрации: </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="smpf:RegDate"/>
				</xsl:call-template>
				<br/>
				<xsl:text> Код налогового органа (СПРО): </xsl:text>
				<xsl:value-of select="smpf:RegOrg"/>
				<xsl:if test="smpf:BusinessCeasementWithdrawDate">
					<br/>
					<xsl:text>Дата снятия с учета: </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="smpf:BusinessCeasementWithdrawDate"/>
					</xsl:call-template>
				</xsl:if>
			</td>
			<td class="graphMain bordered" rowspan="{count(smpf:SimplificationInfo)}">
				<xsl:text>Дата постановки на учет: </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="smpf:AuthorityDate"/>
				</xsl:call-template>
				<br/>	
				<xsl:text> Код налогового органа (СОУН): </xsl:text>
				<xsl:value-of select="smpf:AuthorityOrg"/>
				<xsl:if test="smpf:RegistrationWithdrawDate">
					<br/>
					<xsl:text>Дата снятия с учета: </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="smpf:RegistrationWithdrawDate"/>
					</xsl:call-template>
				</xsl:if>
			</td>
			<xsl:apply-templates select="smpf:SimplificationInfo[1]"/>
			<td class="graphMain bordered" rowspan="{count(smpf:SimplificationInfo)}">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="smpf:ReestrExclusionDate"/>
				</xsl:call-template>
			</td>
		</tr>
		<xsl:for-each select="smpf:SimplificationInfo[position() &gt; 1]">
			<tr>
				<xsl:apply-templates select="."/>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа smpf:SimplificationInfoType -->
	<xsl:template match="smpf:SimplificationInfo">
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="smpf:TaxPayerCode=1">резидент особой экономической зоны в Калининградской области</xsl:when>
					<xsl:when test="smpf:TaxPayerCode=2">налогоплательщик, который по состоянию на 1 апреля 2006 года осуществлял свою деятельность в  соответствии с положениями Федерального закона от 22.01.1996 № 13-ФЗ "Об особой экономической зоне в Калининградской области</xsl:when>
					<xsl:otherwise><xsl:value-of select="smpf:TaxPayerCode"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>         
					<xsl:when test="smpf:SimplificationTypeCode=1">Единый сельскохозяйственный налог (ЕСХН)</xsl:when>
					<xsl:when test="smpf:SimplificationTypeCode=2">Упрощенная система налогообложения (УСНО)</xsl:when>
					<xsl:when test="smpf:SimplificationTypeCode=3">Единый налог на вмененный доход (ЕНВД)</xsl:when>
					<xsl:when test="smpf:SimplificationTypeCode=4">Патентная система налогообложения (Патент)</xsl:when>
					<xsl:when test="smpf:SimplificationTypeCode=5">Применение статьи 149 НКРФ</xsl:when>
					<xsl:when test="smpf:SimplificationTypeCode=6">Применение статьи 145 НКРФ</xsl:when>
					<xsl:otherwise><xsl:value-of select="smpf:SimplificationTypeCode"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="smpf:NKRFArticleAcceptionDate">
					<xsl:text>c </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="smpf:NKRFArticleAcceptionDate"/>
					</xsl:call-template>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:if test="smpf:NKRFArticleDeclineDate">
					<xsl:text>по </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="smpf:NKRFArticleDeclineDate"/>
					</xsl:call-template>
				</xsl:if>
			</td>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:OrganizationBaseType -->
	<xsl:template match="smpf:TaxPayerInfo">
		<!--xsl:if test="cat_ru:OrganizationLanguage">
			<xsl:text>Код языка: </xsl:text>
			<xsl:value-of select="cat_ru:OrganizationLanguage"/>
			<xsl:text> </xsl:text>
		</xsl:if-->
		<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="cat_ru:ShortName">
				<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
				<xsl:value-of select="cat_ru:ShortName"/>
				<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
			</xsl:if>
		</xsl:if>	
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
			<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">, </xsl:if>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
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
