<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:edcnt="urn:customs.ru:Information:ExchangeDocuments:ED_Container:5.13.1" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ED_ContainerType -->
	<xsl:template match="edcnt:ED_Container">
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
										<b>Документ-контейнер. Предназначен для пакетной передачи документов. </b>
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
					<xsl:if test="edcnt:FullSetIndicator">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Признак полноты комплекта документов</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="edcnt:FullSetIndicator='true' or edcnt:FullSetIndicator=''">полный пакет</xsl:when>
										<xsl:otherwise>нет</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<!--xsl:if test="edcnt:Xindicator">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Резерв. Используется в электронном представлении сведений.</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="edcnt:Xindicator">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<div class="title marg-top">Документ</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Порядок обработки документа</td>
								<td class="graphMain bordered">Версия альбома форматов, в которой создан документ</td>
								<td class="graphMain bordered">Дата альбома форматов</td>
								<!--td class="graphMain bordered">Документ</td-->
							</tr>
							<xsl:for-each select="edcnt:ContainerDoc">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа edcnt:ContainerDocType -->
	<xsl:template match="edcnt:ContainerDoc">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="edcnt:Order"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="edcnt:AFVersion"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="edcnt:AFDate"/>
				</xsl:call-template>
			</td>
			<!--td class="graphMain bordered">
				<xsl:apply-templates select="edcnt:DocBody"/>
			</td-->
		</tr>
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
