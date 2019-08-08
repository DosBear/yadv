<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltExch_ru="urn:customs.ru:Information:ExchangeDocuments:ExchangeCommonLeafTypes:5.0.8" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:grnrslt="urn:customs.ru:Information:ExchangeDocuments:GuaranteeResult:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа GuaranteeResultType -->
	<xsl:template match="grnrslt:GuaranteeResult">
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
										<b>Уведомление о результате обработки запроса статуса процесса работы с дополнением к договору поручительства.</b>
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
							<td class="annot graphMain" style="width:50%">Код возврата</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="grnrslt:ResultCode"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Текстовое описание</td>
							<td class="graphMain value" style="width:50%">
								<xsl:for-each select="grnrslt:ResultDescription">
									<xsl:value-of select="."/>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<xsl:if test="grnrslt:ResultCategory">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Степень критичности ошибки. Код или мнемоническое описание.</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="grnrslt:ResultCategory"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Описание статуса процесса работы с дополнением к договору поручительства.</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="grnrslt:StatusDescription"/>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
