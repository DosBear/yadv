<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ct="urn:customs.ru:Information:EArchDocuments:EADCommonTypes:5.13.1" xmlns:adoc="urn:customs.ru:Information:EArchDocuments:ArchDocResponse:5.13.1">
	<!-- Шаблон для типа ArchDocResponseType -->
	<xsl:template match="adoc:ArchDocResponse">
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
										<b>Электронный документ из архива декларанта.</b>
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
							<td class="value graphMain" style="width:50%"><xsl:value-of select="ct:ArchDeclID"/></td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор архива</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="ct:ArchID"/></td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Статус документа в архиве</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="adoc:ArchDocStatus"/></td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Архивный идентификатор документа</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="adoc:ArchDocID"/></td>
						</tr>
					</table>
					<xsl:if test="adoc:FirstDT">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Регистрационный номер первой ДТ, при подаче который использован документ</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="adoc:FirstDT"/></td>
							</tr>
						</table>
					</xsl:if>
					<!--xsl:if test="adoc:ArchDocument">
						<div class="title marg-top">Документ из архива</div>
					</xsl:if>
					<xsl:apply-templates select="adoc:ArchDocument"/-->
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ct:GTDIDType -->
	<xsl:template match="adoc:FirstDT">
		<xsl:value-of select="ct:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="ct:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="ct:GTDNumber"/>
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
