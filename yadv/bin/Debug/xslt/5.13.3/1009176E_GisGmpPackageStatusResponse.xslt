<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ps_resp="urn:customs.ru:Information:SQDocuments:GisGmpPackageStatusResponse:5.13.1">
	<!-- Шаблон для типа GisGmpPackageStatusResponseType -->
	<xsl:template match="ps_resp:GisGmpPackageStatusResponse">
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
										<b>Статус обработки пакета (ответ)</b>
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
					<xsl:if test="ps_resp:PackageProcessResult">
						<div class="title marg-top">Результат обработки пакета запросов</div>
					</xsl:if>
					<xsl:apply-templates select="ps_resp:PackageProcessResult"/>
					<xsl:if test="ps_resp:RequestProcessResult">
						<div class="title marg-top">Результат обработки запроса</div>
					</xsl:if>
					<xsl:apply-templates select="ps_resp:RequestProcessResult"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ps_resp:EntityProcessResultType -->
	<xsl:template match="ps_resp:EntityProcessResult">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="ps_resp:ResultCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ps_resp:ResultDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ps_resp:ResultData"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ps_resp:entityId"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ps_resp:PackageProcessResultType -->
	<xsl:template match="ps_resp:PackageProcessResult">
		<div class="title marg-top">Результат обработки элемента пакета</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered">Код результата обработки</td>
					<td class="graphMain bordered">Описание результата обработки</td>
					<td class="graphMain bordered">Данные результата обработки</td>
					<td class="graphMain bordered">Идентификатор импортированного начисления</td>
				</tr>
				<xsl:for-each select="ps_resp:EntityProcessResult">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ps_resp:ResultInfoType -->
	<xsl:template match="ps_resp:RequestProcessResult">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код результата обработки</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ps_resp:ResultCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="ps_resp:ResultDescription">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание результата обработки</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="ps_resp:ResultDescription">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="ps_resp:ResultData">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Данные результата обработки</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="ps_resp:ResultData">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
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
