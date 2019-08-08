<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rlod_res="urn:customs.ru:Information:SQDocuments:RlodInfoResponse:5.13.1">
	<!-- Шаблон для типа RlodInfoResponseType -->
	<xsl:template match="rlod_res:RlodInfoResponse">
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
									margin-top:5mm;
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
						<tr>
							<td align="center" class="graphMain">
								<font size="4">
									<b>Сведения о конкретной лицензии в виде выписки из реестра лицензий на осуществление образовательной деятельности</b>
								</font>
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
						<tr>
							<td class="annot graphMain" style="width:50%">Дата выписки</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rlod_res:DateRlodInfo"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Сведения о лицензии</div>
					<xsl:apply-templates select="rlod_res:LicenceInfo"/>
					<xsl:if test="rlod_res:Supplement">
						<xsl:for-each select="rlod_res:Supplement">
							<div class="title marg-top">Приложение к лицензии № <xsl:value-of select="rlod_res:SupNumber"/>
								<xsl:choose>
									<xsl:when test="rlod_res:SupStatus='Valid'"> (действует)</xsl:when>
									<xsl:when test="rlod_res:SupStatus='FullSuspended'"> (приостановлено)</xsl:when>
									<xsl:when test="rlod_res:SupStatus='NotValid'"> (не действует)</xsl:when>
								</xsl:choose>
							</div>
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rlod_res:AdmIssueType -->
	<xsl:template match="rlod_res:AdmIssue">
		<xsl:choose>
			<xsl:when test="rlod_res:DocTypeName='Prik'">Приказ</xsl:when>
			<xsl:when test="rlod_res:DocTypeName='Rasp'">Распоряжение</xsl:when>
		</xsl:choose>
		<xsl:if test="rlod_res:DocNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="rlod_res:DocNumber"/>
		</xsl:if>
		<xsl:if test="rlod_res:DocDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="rlod_res:DocDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rlod_res:AdmSuspResumeType -->
	<xsl:template match="rlod_res:AdmSuspResume">
		<xsl:if test="rlod_res:AdmSuspInfo">
			<xsl:text>Постановление об административном приостановлении деятельности: </xsl:text>
			<xsl:value-of select="rlod_res:AdmSuspInfo"/>
		</xsl:if>
		<xsl:if test="rlod_res:SuspResumeDecisions">
			<xsl:if test="rlod_res:AdmSuspInfo">; </xsl:if>
			<xsl:text>Решение лицензирующего органа о приостановлении и возобновлении действия лицензии: </xsl:text>
			<xsl:value-of select="rlod_res:SuspResumeDecisions"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rlod_res:AdmTerminateType -->
	<xsl:template match="rlod_res:AdmTerminate">
		<xsl:if test="rlod_res:TerminateDate">
			<xsl:text>c </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="rlod_res:TerminateDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="rlod_res:TerminateBase">
			<xsl:text>на основании: </xsl:text>
			<xsl:value-of select="rlod_res:TerminateBase"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rlod_res:BlankType -->
	<xsl:template match="rlod_res:Blank">
		<xsl:if test="rlod_res:BlankSer">
			<xsl:text>серия </xsl:text>
			<xsl:value-of select="rlod_res:BlankSer"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="rlod_res:BlankNum">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="rlod_res:BlankNum"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="rlod_res:IsDubl">
			<xsl:text> (</xsl:text>
			<xsl:choose>
				<xsl:when test="rlod_res:IsDubl='true' or rlod_res:IsDubl=1">дубликат</xsl:when>
				<xsl:otherwise>оригинал</xsl:otherwise>
			</xsl:choose>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rlod_res:DirectionType -->
	<xsl:template match="rlod_res:Direction">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="rlod_res:Level"/></td>
			<td class="graphMain bordered"><xsl:value-of select="rlod_res:Code"/></td>
			<td class="graphMain bordered"><xsl:value-of select="rlod_res:Name"/></td>
			<td class="graphMain bordered"><xsl:value-of select="rlod_res:Kind"/></td>
			<td class="graphMain bordered"><xsl:value-of select="rlod_res:Qualification"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rlod_res:HolderType и rlod_res:OrgInfoType -->
	<xsl:template match="rlod_res:Holder| rlod_res:OrgInfo">
		<xsl:if test="rlod_res:FullOrgName">
			<xsl:value-of select="rlod_res:FullOrgName"/>
		</xsl:if>
		<xsl:if test="rlod_res:ShortOrgName">
			<xsl:if test="rlod_res:FullOrgName"> (</xsl:if>
			<xsl:value-of select="rlod_res:ShortOrgName"/>
			<xsl:if test="rlod_res:FullOrgName">) </xsl:if>
		</xsl:if>
		<xsl:if test="rlod_res:NameIP">
			<xsl:if test="rlod_res:ShortOrgName or rlod_res:FullOrgName">, </xsl:if>
			<xsl:value-of select="rlod_res:NameIP"/>
		</xsl:if>
		<xsl:if test="rlod_res:RFOrganizationFeatures">
			<xsl:if test="rlod_res:ShortOrgName or rlod_res:FullOrgName or rlod_res:NameIP">, </xsl:if>
			<xsl:apply-templates select="rlod_res:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="rlod_res:Region">
			<xsl:if test="rlod_res:ShortOrgName or rlod_res:FullOrgName or rlod_res:NameIP or rlod_res:RFOrganizationFeatures">, </xsl:if>
			<xsl:text>субъект РФ: </xsl:text>
			<xsl:value-of select="rlod_res:Region"/>
		</xsl:if>
		<xsl:if test="rlod_res:Address">
			<xsl:if test="rlod_res:ShortOrgName or rlod_res:FullOrgName or rlod_res:NameIP or rlod_res:RFOrganizationFeatures or rlod_res:Region">, </xsl:if>
			<xsl:text>адрес: </xsl:text>
			<xsl:value-of select="rlod_res:Address"/>
		</xsl:if>
		<xsl:if test="rlod_res:ImplAddresses">
			<xsl:if test="rlod_res:ShortOrgName or rlod_res:FullOrgName or rlod_res:NameIP or rlod_res:RFOrganizationFeatures or rlod_res:Region or rlod_res:Address">, </xsl:if>
			<xsl:text>места обр. деятельности: </xsl:text>
			<xsl:value-of select="rlod_res:ImplAddresses"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="rlod_res:Licence">
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
	<!-- Шаблон для типа rlod_res:LicenceInfoType -->
	<xsl:template match="rlod_res:LicenceInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Реквизиты лицензии</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rlod_res:Licence"/></td>
			</tr>
			<xsl:if test="rlod_res:LicEndDate">
				<tr>
					<td class="annot graphMain" style="width:50%">Срок действия лицензии </td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="rlod_res:LicEndDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="rlod_res:LicStatus">
				<tr>
					<td class="annot graphMain" style="width:50%">Статус лицензии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="rlod_res:LicStatus='Valid'">действует</xsl:when>
							<xsl:when test="rlod_res:LicStatus='FullSuspended'">приостановлена полностью</xsl:when>
							<xsl:when test="rlod_res:LicStatus='PartSuspended'">приостановлена частично</xsl:when>
							<xsl:when test="rlod_res:LicStatus='NotValid'">не действует</xsl:when>
							<xsl:otherwise><xsl:value-of select="rlod_res:LicStatus"/></xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="rlod_res:LicOrgan">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование органа, выдавшего лицензию</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="rlod_res:LicOrgan"/></td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Держатель лицензии</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rlod_res:Holder"/></td>
			</tr>
			<xsl:if test="rlod_res:Blank">
				<tr>
					<td class="annot graphMain" style="width:50%">Бланк лицензии</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rlod_res:Blank"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="rlod_res:AdmIssue">
				<tr>
					<td class="annot graphMain" style="width:50%">Распорядительный документ о выдаче</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rlod_res:AdmIssue"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="rlod_res:AdmSuspResume">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация о приостановлении и возобновлении действия лицензии</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rlod_res:AdmSuspResume"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="rlod_res:AdmTerminate">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация о прекращении действия лицензии</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rlod_res:AdmTerminate"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="rlod_res:InspectionInfo">
				<tr>
					<td class="annot graphMain" style="width:50%">Основания и даты проведения проверок организации, акты по результатам проверок</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="rlod_res:InspectionInfo"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="rlod_res:AnnulDecision">
				<tr>
					<td class="annot graphMain" style="width:50%">Решение суда об аннулировании лицензии</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="rlod_res:AnnulDecision"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="rlod_res:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:if test="cat_ru:OGRN">, </xsl:if>
			<xsl:text>ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="cat_ru:OGRN or cat_ru:INN">, </xsl:if>
			<xsl:text>КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rlod_res:SupplementType -->
	<xsl:template match="rlod_res:Supplement">
		<table class="w190">			
			<xsl:if test="rlod_res:Blank">
				<tr>
					<td class="annot graphMain" style="width:50%">Бланк приложения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rlod_res:Blank"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="rlod_res:OrgInfo">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация об организации (филиале)</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rlod_res:OrgInfo"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="rlod_res:AdmIssue">
				<tr>
					<td class="annot graphMain" style="width:50%">Распорядительный документ о выдаче приложения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rlod_res:AdmIssue"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="rlod_res:AdmTerminate">
				<tr>
					<td class="annot graphMain" style="width:50%">Информация о прекращении действия приложения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rlod_res:AdmTerminate"/></td>
				</tr>
			</xsl:if>
		</table>	
		<xsl:if test="rlod_res:Direction">
			<br/>
			<table class="bordered w190">
				<tr class="title">
					<td class="graphMain bordered">Уровень образования</td>
					<td class="graphMain bordered">Код направления подготовки</td>
					<td class="graphMain bordered">Наименование направления подготовки</td>
					<td class="graphMain bordered">Вид направления подготовки</td>
					<td class="graphMain bordered">Присваиваемая квалификация</td>
				</tr>
				<xsl:for-each select="rlod_res:Direction">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
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
			<xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
