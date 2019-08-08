<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ata_ct="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CommonTypes:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:ata_findoo="urn:customs.ru:Information:TransportDocuments:ATA:ATA_FindOpenOperationRequest:5.14.3">
	<!-- Шаблон для типа ATA_FindOpenOperationRequestType -->
	<xsl:template match="ata_findoo:ATA_FindOpenOperationRequest">
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
										<b>Запрос незавершенных операций по карнетам АТА</b>
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
					<div class="title marg-top">Параметры запроса  незавершенных операций по карнетам АТА</div>
					<xsl:apply-templates select="ata_findoo:RequestParams"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ata_ct:RequestParamsType -->
	<xsl:template match="ata_findoo:RequestParams">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ata_ct:CustomsCode"/>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Период выборки данных</td>
				<td class="value graphMain" style="width:50%">
					<xsl:if test="ata_ct:DateFrom">
						<xsl:text>c </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ata_ct:DateFrom"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(ata_ct:DateFrom,12,8)"/>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="ata_ct:DateTo">
						<xsl:text>по </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="ata_ct:DateTo"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(ata_ct:DateTo,12,8)"/>
					</xsl:if>
				</td>
			</tr>
		</table>
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
				<xsl:text>  </xsl:text>
				<xsl:value-of select="substring($dateIn,12,8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
