<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:imb="urn:customs.ru:Information:CustomsDocuments:ImageBin:5.13.1" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ImageBinType -->
	<xsl:template match="imb:ImageBin">
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
										<b>Изображение объекта</b>
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
							<td class="annot graphMain" style="width:50%">Идентификатор информации</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="imb:ImageID"/></td>
						</tr>
						<xsl:if test="imb:DocumentInfo">
							<tr>
								<td class="annot graphMain" style="width:50%">Информация о изображении</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="imb:DocumentInfo"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="imb:MainDocumentInfo">
							<tr>
								<td class="annot graphMain" style="width:50%">Информация об основном документе</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="imb:MainDocumentInfo"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="imb:Comments">
							<tr>
								<td class="annot graphMain" style="width:50%">Комментарии к изображению</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="imb:Comments"><xsl:value-of select="."/></xsl:for-each>
								</td>
							</tr>
						</xsl:if>
					</table>
					<xsl:if test="imb:DocumentBody">
						<div class="title marg-top">Тело  документа</div>
						<xsl:apply-templates select="imb:DocumentBody"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа imb:DocBodyType -->
	<xsl:template match="imb:DocumentBody">
		<xsl:if test="imb:Type">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Формат изображения</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="imb:Type"/></td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя файла</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="imb:FileName"/></td>
			</tr>
		</table>
		<xsl:text>Данные файла  в кодировке BASE64</xsl:text>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:5%"/>
				<td class="value graphMain" style="width:95%"><xsl:value-of select="imb:FileData"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="imb:DocumentInfo| imb:MainDocumentInfo">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
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
