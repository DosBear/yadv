<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ata_ct="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CommonTypes:5.14.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ata_getlr="urn:customs.ru:Information:TransportDocuments:ATA:ATA_GetLogResponse:5.14.0">
	<!-- Шаблон для типа ATA_GetLogResponseType -->
	<xsl:template match="ata_getlr:ATA_GetLogResponse">
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
										<b>Результат запроса журнала регистрации</b>
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
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Формат представления журнала регистрации</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ata_getlr:ViewType"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Формат передачи журнала регистрации</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="ata_getlr:Compressed='true' or ata_getlr:Compressed=1">сжатый</xsl:when>
									<xsl:when test="ata_getlr:Compressed='false' or ata_getlr:Compressed=0">несжатый</xsl:when>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Данные журнала регистрации</div>
					<xsl:apply-templates select="ata_getlr:Data"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ata_ct:DocumentBodyType -->
	<xsl:template match="ata_getlr:Data"/>
</xsl:stylesheet>
