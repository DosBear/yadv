<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ct="urn:customs.ru:Information:EArchDocuments:EADCommonTypes:5.13.1" xmlns:appi="urn:customs.ru:Information:EArchDocuments:ArchPermitParticipantsInfo:5.13.1">
	<!-- Шаблон для типа ArchPermitParticipantsInfoType -->
	<xsl:template match="appi:ArchPermitParticipantsInfo">
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
										<b>Сведения об иных участниках, имеющих доступ к просмотру документов архива</b>
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
								<xsl:value-of select="appi:ArchDeclID"/>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Участник, имеющий допуск к просмотру документов архива</div>
					<table class="w190">
							<!--tr class="title">
								<td class="graphMain bordered">Идентификатор участника</td>
								<td class="graphMain bordered">Архив, доступный для просмотра</td>
							</tr-->
						<xsl:for-each select="appi:Participant">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа appi:ArchDocumentType -->
	<xsl:template match="appi:ArchDocument">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="appi:ArchDocID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="appi:ArchDocumentID"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа appi:ArchiveType -->
	<xsl:template match="appi:Archive">
		<xsl:variable name="kol_vo" select="count(appi:ArchDocument)"/>
		<tr>
			<td rowspan="{$kol_vo}" class="graphMain bordered" style="vertical-align: middle">
				<xsl:value-of select="appi:ArchID"/>
			</td>
			<td class="graphMain bordered">
				<!--table class="bordered w190">
					<tbody>
						<tr class="title">
							<tr>
								<td class="graphMain bordered">Идентификатор документа в архиве</td>
								<td class="graphMain bordered">Уникальный идентификатор документа</td>
							</tr>
						</tr>
						<xsl:for-each select="appi:ArchDocument">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</tbody>
				</table-->
				<xsl:value-of select="appi:ArchDocument[position()=1]/appi:ArchDocID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="appi:ArchDocument[position()=1]/appi:ArchDocumentID"/>
			</td>
		</tr>
		<xsl:for-each select="appi:ArchDocument[position() &gt; 1]">
			<tr>
				<td class="graphMain bordered"><xsl:value-of select="appi:ArchDocID"/></td>
				<td class="graphMain bordered"><xsl:value-of select="appi:ArchDocumentID"/></td>
			</tr>	
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа appi:ParticipantType -->
	<xsl:template match="appi:Participant">
		<tr bgcolor="#e3e3e3">
			<td class="annot graphMain" style="width:50%; border-top: 1px solid grey">Идентификатор участник</td>
			<td class="value graphMain" style="width:50%; border-top: 1px solid grey"><xsl:value-of select="appi:ParticipantID"/></td>
		</tr>
		<tr>	
			<td colspan="2">
				<div class="title marg-top">Архив, доступный для просмотра</div>
				<table class="bordered w190">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered" rowspan="2">Идентификатор архива</td>
							<td class="graphMain bordered" colspan="2" align="center">Документ архива</td>
						</tr>
						<tr class="title">
							<td class="graphMain bordered">Идентификатор документа в архиве</td>
							<td class="graphMain bordered">Уникальный идентификатор документа</td>
						</tr>
						<xsl:for-each select="appi:Archive">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</tbody>
				</table>
				<br/>
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
