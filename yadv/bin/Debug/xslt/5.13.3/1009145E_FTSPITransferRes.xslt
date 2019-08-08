<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pitres="urn:customs.ru:Information:SQDocuments:FTSPITransferRes:5.13.1">
	<!-- Шаблон для типа FTSPITransferResType -->
	<xsl:template match="pitres:FTSPITransferRes">
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
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Передача ПИ от ФТС России в Роспотребнадзор</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
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
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор процесса</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pitres:GUID"/></td>
						</tr>
					</table>
					<div class="title marg-top">Предварительное решение Роспотребнадзора</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Предварительное решение Роспотребнадзора по ПИ товара</td>
								<td class="graphMain bordered">Идентификатор предварительного решения</td>
								<td class="graphMain bordered">Идентификатор ПИ товара</td>
							</tr>
							<xsl:for-each select="pitres:PIDecision">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа pitres:PreliminaryDecisionType -->
	<xsl:template match="pitres:PIDecision">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="pitres:PreliminaryDecision"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pitres:PreliminaryDecisionId"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pitres:PIId"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
