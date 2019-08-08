<?xml version="1.0" encoding="utf-8"?>

<!-- Свободная форма -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ct="urn:customs.ru:Information:EArchDocuments:EADCommonTypes:5.13.1" xmlns:agp="urn:customs.ru:Information:EArchDocuments:AgreementParticipants:5.13.1">
	<!-- Шаблон для типа AgreementParticipantsType -->
	<xsl:template match="agp:AgreementParticipants">
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
								<h3>
									Соглашение о доступе к документам ЭАДД заинтересованных участников ВЭД<br/>
									<xsl:apply-templates select="agp:AgreementParticipants" mode="document"/>
								</h3>
							</td>
						</tr>
					</table>
					<br/>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ct:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ct:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="ct:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="agp:DocBeginDate or agp:DocEndDate">
						<table class="w190" cellspacing="10">
							<tr>
								<td class="annot graphMain" style="width:70%">Период действия Соглашения</td>
								<td class="value graphMain" style="width:30%" align="center">
									<xsl:if test="agp:DocBeginDate"> с 
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="agp:DocBeginDate"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="agp:DocEndDate"> по 
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="agp:DocEndDate"/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="agp:Participants">
						<div class="title marg-top">Участники Соглашения</div>
						<table class="bordered w190">
							<tr class="title">
								<td class="graphMain bordered">ИД внешнего участника обмена</td>
								<td class="graphMain bordered">Наименование организации / ФИО физического лица</td>
								<td class="graphMain bordered">ОГРН/ОГРНИП</td>
								<td class="graphMain bordered">ИНН</td>
								<td class="graphMain bordered">КПП</td>
								<td class="graphMain bordered">Роль организации</td>
							</tr>
							<xsl:for-each select="agp:Participants"><xsl:apply-templates select="."/></xsl:for-each>
						</table>
					</xsl:if>
					<xsl:if test="agp:Agreement">
						<div class="title marg-top">Текст Соглашения</div>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:100%"><xsl:value-of select="agp:Agreement"/></td>
							</tr>
						</table>
						<br/>
					</xsl:if>
					<xsl:apply-templates select="agp:AgreementOption"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа agp:AgreementOptionType -->
	<xsl:template match="agp:AgreementOption">
		<xsl:if test="agp:ArchShareDoc">
			<table class="w190" cellspacing="10">
				<tr>
					<td class="annot graphMain" style="width:86%">Обеспечение частичного доступа к документам ЭАДД</td>
					<td class="graphMain bordered" style="width:4%" align="center"><xsl:if test="agp:ArchShareDoc='true' or agp:ArchShareDoc=1">X</xsl:if></td>
					<td class="annot graphMain" style="width:10%"/>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="agp:ShareProc">
			<table class="w190" cellspacing="10">
				<tr>
					<td class="annot graphMain" style="width:86%">Предоставление информации о процедуре декларирования</td>
					<td class="graphMain bordered" style="width:4%" align="center"><xsl:if test="agp:ShareProc='true' or agp:ShareProc=1">X</xsl:if></td>
					<td class="annot graphMain" style="width:10%"/>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="agp:PaymentFactSign">
			<table class="w190" cellspacing="10">
				<tr>
					<td class="annot graphMain" style="width:86%">Признак возможности оплаты таможенных платежей </td>
					<td class="graphMain bordered" style="width:4%" align="center"><xsl:if test="agp:PaymentFactSign='true' or agp:PaymentFactSign=1">X</xsl:if></td>
					<td class="annot graphMain" style="width:10%"/>
				</tr>
			</table>
		</xsl:if>	
		<xsl:if test="agp:DeclBothAgree">
			<table class="w190" cellspacing="10">
				<tr>
					<td class="annot graphMain" style="width:86%">Cогласие что, запрашивающая сторона получит полный доступ к документам ЭАДД</td>
					<td class="graphMain bordered" style="width:4%" align="center"><xsl:if test="agp:DeclBothAgree='true' or agp:DeclBothAgree=1">X</xsl:if></td>
					<td class="annot graphMain" style="width:10%"/>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!--xsl:template match="agp:AgreementParticipants"-->
	<xsl:template mode="document" match="agp:AgreementParticipants">
		<xsl:value-of select="ct:PrDocumentName" />
		<xsl:if test="ct:PrDocumentNumber"> № <xsl:value-of select="ct:PrDocumentNumber" /></xsl:if>
		<xsl:if test="ct:PrDocumentDate"> от 
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ct:PrDocumentDate" /></xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ct:EADOrgType -->
	<xsl:template match="agp:Participants">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="ct:ParticipantID"/></td>
			<td class="graphMain bordered"><xsl:value-of select="ct:OrganizationName"/></td>
			<td class="graphMain bordered"><xsl:value-of select="ct:OGRN"/></td>
			<td class="graphMain bordered"><xsl:value-of select="ct:INN"/></td>
			<td class="graphMain bordered"><xsl:value-of select="ct:KPP"/></td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="ct:Role=0">декларант</xsl:when>
					<xsl:when test="ct:Role=1">таможенный представитель</xsl:when>
					<xsl:when test="ct:Role=2">перевозчик</xsl:when>
					<xsl:otherwise><xsl:value-of select="ct:Role"/></xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
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
