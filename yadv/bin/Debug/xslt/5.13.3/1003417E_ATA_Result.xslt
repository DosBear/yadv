<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ata_rslt="urn:customs.ru:Information:TransportDocuments:ATA:ATA_Result:5.13.1">
	<!-- Шаблон для типа ATAResultType -->
	<xsl:template match="ata_rslt:ATA_Result">
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
					margin-top:6mm;
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
										<b>Результат обработки сообщения/выполнения операции Карнет АТА</b>
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
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered" style="vertical-align: middle" rowspan="2">Идентификатор документа, в котором была допущена ошибка</td>
								<td class="graphMain bordered" align="center" colspan="2">Информация о  результате обработки документа</td>
							</tr>
							<tr class="title">
								<td class="graphMain bordered">Код возврата</td>
								<td class="graphMain bordered" >Текстовое описание кода возврата</td>
							</tr>
							<xsl:for-each select="ata_rslt:Response">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ata_rslt:ResponseType -->
	<xsl:template match="ata_rslt:Response">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_rslt:RefDocumentID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_rslt:ResultInformation/ata_rslt:ResultCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="ata_rslt:ResultInformation/ata_rslt:ResultDescription">
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
