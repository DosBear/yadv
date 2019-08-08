<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ct="urn:customs.ru:Information:EArchDocuments:EADCommonTypes:5.13.1" xmlns:acd="urn:customs.ru:Information:EArchDocuments:ArchShareDoc:5.13.1">
	<!-- Шаблон для типа ArchShareDocType -->
	<xsl:template match="acd:ArchShareDoc">
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
									width: 250mm;
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
										<b>
											<xsl:choose>
												<xsl:when test="acd:DocSign=0">Предоставление доступа к документам другим участникам ВЭД</xsl:when>
												<xsl:when test="acd:DocSign=1">Запрос списка документов с доступом на чтение в рамках Соглашения</xsl:when>
												<xsl:when test="acd:DocSign=2">Уведомление о документах  с правами на чтение</xsl:when>
												<xsl:otherwise>Документы в архиве декларанта для доступа заинтересованных участников ВЭД по Соглашению</xsl:otherwise>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
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
					<div class="title marg-top">Реквизиты Соглашения</div>
					<xsl:apply-templates select="acd:AgreementParticipants"/>
					<xsl:if test="acd:DocumentInfo">
						<div class="title marg-top">Информация о документе</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title" valign="middle">
									<td class="graphMain bordered" rowspan="2">Сведения о документе</td>
									<td class="graphMain bordered" colspan="5" align="center">Архив</td>
									<td class="graphMain bordered" rowspan="2">Регистрационный номер первой ДТ, при подаче который использован документ</td>
								</tr>
								<tr class="title" valign="middle">
									<td class="graphMain bordered">Идентификатор архива</td>
									<td class="graphMain bordered">Архивный идентификатор док-та</td>
									<td class="graphMain bordered">Уникальный идентификатор док-та</td>
									<td class="graphMain bordered">Статус док-та в архиве</td>
									<td class="graphMain bordered">Дата/время помещения док-та в архив (последнего изменения)</td>
								</tr>
								<xsl:for-each select="acd:DocumentInfo">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ct:AgreementNumType -->
	<xsl:template match="acd:AgreementParticipants">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:30%">Уникальный идентификатор</td>
				<td class="value graphMain" style="width:70%">
					<xsl:value-of select="ct:UniqueID"/>
				</td>
			</tr>
		</table>
		<xsl:if test="ct:PrDocumentName or ct:PrDocumentNumber or ct:PrDocumentNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:30%">Наименование документа</td>
					<td class="value graphMain" style="width:70%">
						<xsl:value-of select="ct:PrDocumentName"/>
						<xsl:if test="ct:PrDocumentNumber"> № <xsl:value-of select="ct:PrDocumentNumber"/>
						</xsl:if>
						<xsl:if test="ct:PrDocumentDate">
							<xsl:text> от </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="ct:PrDocumentDate"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа acd:ArchDocumentType -->
	<xsl:template match="acd:DocumentInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="ct:PrDocumentName"/>
				<xsl:if test="ct:PrDocumentNumber"> № <xsl:value-of select="ct:PrDocumentNumber"/></xsl:if>
				<xsl:if test="ct:PrDocumentDate">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ct:PrDocumentDate"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="acd:ExecutiveBodyID"> выдан <xsl:value-of select="acd:ExecutiveBodyID"/></xsl:if>
				<xsl:if test="acd:DocBeginDate or acd:DocEndDate">
					<br/> период действия: 
					<xsl:if test="acd:DocBeginDate">
						<xsl:text> c </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="acd:DocBeginDate"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="acd:DocEndDate">
						<xsl:text> по </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="acd:DocEndDate"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="acd:DocumentCode">
						<br/>вид док-та по АФ: <xsl:value-of select="acd:DocumentCode"/>
					</xsl:if>
					<xsl:if test="acd:PresentedDocumentModeCode">
						<br/>код вида док-та: <xsl:value-of select="acd:PresentedDocumentModeCode"/>
					</xsl:if>
				</xsl:if>
			</td>
			<td class="graphMain bordered"><xsl:value-of select="acd:ArchID"/></td>
			<td class="graphMain bordered"><xsl:value-of select="acd:ArchDocID"/></td>
			<td class="graphMain bordered"><xsl:value-of select="acd:ArchDocumentID"/></td>
			<td class="graphMain bordered"><xsl:value-of select="acd:ArchDocStatus"/></td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="acd:ArchDocDate"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(acd:ArchDocDate, 12, 8)"/>
			</td>
			<td class="graphMain bordered"><xsl:apply-templates select="acd:FirstDT"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ct:GTDIDType -->
	<xsl:template match="acd:FirstDT">
		<xsl:value-of select="ct:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="ct:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="ct:GTDNumber"/>
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
