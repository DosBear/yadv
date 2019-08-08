<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ata_ct="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CommonTypes:5.13.1" xmlns:ata_findcr="urn:customs.ru:Information:TransportDocuments:ATA:ATA_FindCarnetResponse:5.13.1">
	<!-- Шаблон для типа ATA_FindCarnetResponseType -->
	<xsl:template match="ata_findcr:ATA_FindCarnetResponse">
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
										<b>Результат поиска карнетов АТА</b>
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
					<xsl:if test="ata_findcr:CarnetInfo">
						<div class="title marg-top">Сведения о карнете АТА</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered" style="vertical-align: middle" rowspan="2">Номер карнета АТА</td>
									<td class="graphMain bordered" style="vertical-align: middle" rowspan="2">Держатель карнета АТА</td>
									<td class="graphMain bordered" style="vertical-align: middle" rowspan="2">Предполагаемое использование товаров</td>
									<td class="graphMain bordered" colspan="2">Сведения о группе товаров</td>
								</tr>
								<tr class="title">
									<td class="graphMain bordered">Состояние группы товаров</td>
									<td class="graphMain bordered">Количество товаров в группе</td>
								</tr>
								<xsl:for-each select="ata_findcr:CarnetInfo">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ata_findcr:CarnetInfoType -->
	<xsl:template match="ata_findcr:CarnetInfo">
		<xsl:variable name="kol_vo" select="count(ata_findcr:GoodsGroupInfo)"/>
		<tr>
			<td class="graphMain bordered" style="vertical-align: middle" rowspan="{$kol_vo}">
				<xsl:value-of select="ata_findcr:CarnetNumber"/>
			</td>
			<td class="graphMain bordered" style="vertical-align: middle" rowspan="{$kol_vo}">
				<xsl:value-of select="ata_findcr:Holder"/>
			</td>
			<td class="graphMain bordered" style="vertical-align: middle" rowspan="{$kol_vo}">
				<xsl:value-of select="ata_findcr:IntendedUse"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_findcr:GoodsGroupInfo[position()=1]/ata_findcr:GoodsGroupStatus"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_findcr:GoodsGroupInfo[position()=1]/ata_findcr:GoodsQuantity"/>
			</td>
		</tr>
		<xsl:for-each select="ata_findcr:GoodsGroupInfo[position() &gt; 1]">
			<tr>	
				<td class="graphMain bordered">
					<xsl:value-of select="ata_findcr:GoodsGroupStatus"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="ata_findcr:GoodsQuantity"/>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
