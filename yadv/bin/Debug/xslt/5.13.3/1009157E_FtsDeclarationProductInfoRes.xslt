<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fdpi="urn:customs.ru:Information:SQDocuments:FtsDeclarationProductInfoRes:5.13.1">
	<!-- Шаблон для типа FtsDeclarationProductInfoResType -->
	<xsl:template match="fdpi:FtsDeclarationProductInfoRes">
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
										<b>Предоставление сведений о товаре, содержащихся в таможенной декларации на товары и ТПО (ответ)</b>
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
							<td class="annot graphMain" style="width:50%">Номер ДТ</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fdpi:DTNumber"/></td>
						</tr>
					</table>
					<div class="title marg-top">Сведения о товарах</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Наименование (торговое, коммерческое или традиционное наименование) товара</td>
								<td class="graphMain bordered">Код страны происхождения</td>
								<td class="graphMain bordered">Вес нетто (кг)</td>
								<td class="graphMain bordered">Кол-во товара в ДЕИ</td>
								<td class="graphMain bordered">Дата выпуска груза</td>
							</tr>
							<xsl:for-each select="fdpi:ProductInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="fdpi:DTNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="fdpi:ProductCount">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа fdpi:ProductInfoType -->
	<xsl:template match="fdpi:ProductInfo">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="fdpi:ProductName"/></td>
			<td class="graphMain bordered"><xsl:value-of select="fdpi:CountryCode"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(fdpi:Weight, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="fdpi:ProductCount"/></td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="fdpi:ReleaseDate"/>
				</xsl:call-template>
			</td>
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
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
