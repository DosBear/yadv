<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:erslt="urn:customs.ru:Information:CustomsDocuments:EBVRResult:5.10.0">
	<!-- Шаблон для типа EBVRResultType -->
	<xsl:template match="erslt:EBVRResult">
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
										<b>Результат поиска в ЕБВР</b>
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
					<xsl:if test="erslt:ResultInfo">
						<div class="title marg-top">Результат поиска по товару</div>
						<table class="w190">
							<tr>
								<td class="title bordered" style="width:50%">Количество отобранных сообщений</td>
								<td class="title bordered" style="width:50%">Ссылка для просмотра</td>
							</tr>
							<xsl:for-each select="erslt:ResultInfo">
								<tr>
									<td class="bordered" style="width:50%"><xsl:value-of select="erslt:RiskMSG"/></td>
									<td class="bordered" style="width:50%"><xsl:value-of select="erslt:EBVR_URL"/></td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<xsl:if test="erslt:ResultAddInfo">
						<div class="title marg-top">Результат дополнения записей ЕБВР</div>
						<table class="w190">
							<tr>
								<td class="title bordered" style="width:50%">Результат обработки запроса</td>
								<td class="title bordered" style="width:50%">Текстовое описание ошибки</td>
							</tr>
							<xsl:for-each select="erslt:ResultAddInfo">
								<tr>
									<td class="bordered" style="width:50%"><xsl:value-of select="erslt:ResultCode"/></td>
									<td class="bordered" style="width:50%">
									<xsl:for-each select="erslt:ResultDescription"><xsl:value-of select="."/></xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
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