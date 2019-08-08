<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ct="urn:customs.ru:Information:EArchDocuments:EADCommonTypes:5.13.1" xmlns:aadr="urn:customs.ru:Information:EArchDocuments:ArchAddDocRequest:5.13.1">
	<!-- Шаблон для типа ArchAddDocRequestType -->
	<xsl:template match="aadr:ArchAddDocRequest">
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
								<td align="center" class="graphMain">
									<font size="4">
										<b>Запрос на помещение документа в архив.</b>
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
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор декларанта в архиве</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ct:ArchDeclID"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор архива</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ct:ArchID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="aadr:DocumentBeginDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата начала действия документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aadr:DocumentBeginDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="aadr:DocumentEndDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата окончания действия документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aadr:DocumentEndDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Код вида запрашиваемого документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="aadr:DocCode"/>
							</td>
						</tr>
					</table>
					<!--xsl:if test="aadr:ArchDoc">
						<div class="title marg-top">Документ, помещаемый в архив</div>
					</xsl:if-->
					<xsl:apply-templates select="aadr:ArchDoc"/>
					<xsl:if test="aadr:DocBaseInfo"/>
					<xsl:if test="aadr:DocBaseInfo">
						<div class="title marg-top">Базовые сведения о документе</div>
					</xsl:if>
					<xsl:apply-templates select="aadr:DocBaseInfo"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа aadr:ArchDocType -->
	<xsl:template match="aadr:ArchDoc">
</xsl:template>
	<!-- Шаблон для типа ct:DocumentBaseType -->
	<xsl:template match="aadr:DocBaseInfo">
		<xsl:if test="ct:PrDocumentName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ct:PrDocumentName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ct:PrDocumentNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ct:PrDocumentNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ct:PrDocumentDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ct:PrDocumentDate"/>
						</xsl:call-template>
					</td>
				</tr>
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
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
