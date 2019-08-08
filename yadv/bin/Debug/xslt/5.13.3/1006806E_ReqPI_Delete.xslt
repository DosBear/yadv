<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonAggregateTypes:5.13.3" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rpid="urn:customs.ru:Information:PriorInformation:ReqPI_Delete:5.13.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ReqPI_DeleteType -->
	<xsl:template match="rpid:ReqPI_Delete">
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
										<b>Запрос на аннулирование предварительной информации</b>
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
					<xsl:if test="rpid:TIR_ID">
						<div class="title marg-top">Книжка МДП:</div>
						<xsl:apply-templates select="rpid:TIR_ID"/>
					</xsl:if>
					<xsl:if test="rpid:PI_RegID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Идентификатор запрашиваемой предварительной информации</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="rpid:PI_RegID"/></td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:TIR_IDType -->
	<xsl:template match="rpid:TIR_ID">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер книжки МДП</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="catpi_ru:TIRID"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Серия книжки МДП</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="catpi_ru:TIRSeries"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер белого листа книжки МДП</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="catpi_ru:TIRWhitePageNumber"/>
				</td>
			</tr>
		</table>
		<xsl:if test="catpi_ru:TIRGreenPageNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер зеленого листа книжки МДП</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="catpi_ru:TIRGreenPageNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификационный номер держателя книжки МДП</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="catpi_ru:TIRHolder"/>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>