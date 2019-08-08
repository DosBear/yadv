<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pdpi_req="urn:customs.ru:Information:SQDocuments:PreliminaryDecisionPIRequest:5.13.1">
	<!-- Шаблон для типа PreliminaryDecisionPIRequestType -->
	<xsl:template match="pdpi_req:PreliminaryDecisionPIRequest">
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
										<b>Запрос обновлённого предварительного решения по ПИ от Роспотребнадзора</b>
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
							<td class="annot graphMain" style="width:50%">Идентификатор ПИ товара</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pdpi_req:ProductPIId"/></td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Обновленное предварительное решение Роспотребнадзора по ПИ товара</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="pdpi_req:PrelimDecisionDesc='ImportPermitted'">ввоз разрешён</xsl:when>
									<xsl:when test="pdpi_req:PrelimDecisionDesc='ImportProhibited'">ввоз запрещен</xsl:when>
									<xsl:when test="pdpi_req:PrelimDecisionDesc='RequiredInspection'">требуется оценка</xsl:when>
									<xsl:when test="pdpi_req:PrelimDecisionDesc='NotSubjectSKK'">не подлежит СКК</xsl:when>
									<xsl:otherwise><xsl:value-of select="pdpi_req:PrelimDecisionDesc"/></xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор предварительного решения</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pdpi_req:PrelimDecisionId"/></td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор процесса</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pdpi_req:GUID"/></td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
