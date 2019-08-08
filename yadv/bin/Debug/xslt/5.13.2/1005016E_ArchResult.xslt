<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ct="urn:customs.ru:Information:EArchDocuments:EADCommonTypes:5.13.1" xmlns:rslt="urn:customs.ru:Information:EArchDocuments:ArchResult:5.13.1">
	<!-- Шаблон для типа ArchResultType -->
	<xsl:template match="rslt:ArchResult">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
					<h3 align="center">Результат обработки сообщения / выполнения операции в ЭАД</h3>
					<table class="bordered w190">
						<tr class="title">
							<td class="graphMain bordered" rowspan="2">Идентификатор документа, в котором была допущена ошибка.</td>
							<td class="graphMain bordered" rowspan="2">Текстовое описание ошибки</td>
							<td class="graphMain bordered" rowspan="2">Код ошибки</td>
							<td class="graphMain bordered" colspan="5">Информация о документах в архиве декларанта</td>
						</tr>
						<tr class="title">
							<td class="graphMain bordered">Идентификатор декларанта а ЭАД</td>
							<td class="graphMain bordered">Идентификатор архива</td>
							<td class="graphMain bordered">Идентификатор документа в архиве декларанта</td>
							<td class="graphMain bordered">Статус документа в архиве.</td>
							<td class="graphMain bordered">Номер ДТ, в которой докумет впервые предоставлялся</td>
						</tr>
						<xsl:for-each select="rslt:Response">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rslt:EADInfoType -->
	<xsl:template match="rslt:EADInfo">
		<td class="graphMain bordered"><xsl:value-of select="rslt:ArchDeclID"/></td>
		<td class="graphMain bordered"><xsl:value-of select="rslt:ArchID"/></td>
		<td class="graphMain bordered"><xsl:value-of select="rslt:ArchDocID"/></td>
		<td class="graphMain bordered"><xsl:value-of select="rslt:ArchDocStatus"/></td>
		<td class="graphMain bordered"><xsl:value-of select="rslt:DtNumber"/></td>
	</xsl:template>
	<!-- Шаблон для типа rslt:ResponseType -->
	<xsl:template match="rslt:Response">
		<tr>
			<td class="graphMain bordered" rowspan="{count(rslt:ResultInformation/rslt:EADInfo)+count(rslt:ResultInformation[not(rslt:EADInfo)])}">
				<xsl:value-of select="rslt:RefDocumentID"/> 
			</td>
			<xsl:for-each select="rslt:ResultInformation[1]">
				<td class="graphMain bordered" rowspan="{count(rslt:EADInfo)}">
					<span style="background-color:#ddd;font-style:italic;"><xsl:value-of select="rslt:ResultDescription"/></span>
				</td>
				<td class="graphMain bordered" rowspan="{count(rslt:EADInfo)}">
					<xsl:value-of select="rslt:ResultCode"/>
				</td>
				<xsl:choose>
					<xsl:when test="rslt:EADInfo"><xsl:apply-templates select="rslt:EADInfo[1]"/></xsl:when>
					<xsl:otherwise>
						<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</tr>
		<xsl:for-each select="rslt:ResultInformation[1]/rslt:EADInfo[position() &gt; 1]">
			<tr>
				<xsl:apply-templates select="."/>
			</tr>
		</xsl:for-each>
		<xsl:for-each select="rslt:ResultInformation[position() &gt; 1]">
			<tr>
				<td class="graphMain bordered" rowspan="{count(rslt:EADInfo)}">
					<span style="background-color:#ddd;font-style:italic;"><xsl:value-of select="rslt:ResultDescription"/></span>
				</td>
				<td class="graphMain bordered" rowspan="{count(rslt:EADInfo)}">
					<xsl:value-of select="rslt:ResultCode"/>
				</td>
				<xsl:choose>
					<xsl:when test="rslt:EADInfo"><xsl:apply-templates select="rslt:EADInfo[1]"/></xsl:when>
					<xsl:otherwise>
						<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<xsl:for-each select="rslt:EADInfo[position() &gt; 1]">
				<tr>
					<xsl:apply-templates select="."/>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
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