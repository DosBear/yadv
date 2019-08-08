<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:dires="urn:customs.ru:Information:SQDocuments:FtsDeclarationInfoRes:5.13.1">
	<!-- Шаблон для типа FtsDeclarationInfoResType -->
	<xsl:template match="dires:FtsDeclarationInfoRes">
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
									width: 270mm;
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
										<b>Предоставление сведений, содержащихся в таможенной декларации на товары и ТПО</b>
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
					</xsl:if>
					<div class="title marg-top">Сведения из декларации</div-->
					<br/>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Наименование продукции</td>
								<td class="graphMain bordered">Код ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered">Отправитель</td>
								<td class="graphMain bordered">Получатель</td>
								<td class="graphMain bordered">Кол-во товара в ДЕИ</td>
								<td class="graphMain bordered">Сведения о кол-ве в ЕИ, отличных от основной и дополнительной</td>
							</tr>
							<xsl:for-each select="dires:CustomDeclarationInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа dires:CustomDeclarationInfoType -->
	<xsl:template match="dires:CustomDeclarationInfo">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="dires:ProductName"/></td>
			<td class="graphMain bordered"><xsl:value-of select="dires:TNVEDCode"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="dires:Sender"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="dires:Recipient"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="dires:ProductCount"/></td>
			<td class="graphMain bordered">
				<xsl:for-each select="dires:OtherMeasureUnitInfo">
					<xsl:apply-templates select="."/>
					<xsl:if test="position()!=last()">,<br/></xsl:if>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="dires:OtherMeasureUnitInfo| dires:ProductCount">
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
	<!-- Шаблон для типа dires:RecipientType -->
	<xsl:template match="dires:Recipient">
		<xsl:value-of select="dires:RecipientName"/><br/>
		<xsl:text>ИНН: </xsl:text>
		<xsl:value-of select="dires:RecipientINN"/>
		<xsl:if test="dires:RecipientKPP">
			<xsl:text> КПП: </xsl:text>
			<xsl:value-of select="dires:RecipientKPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа dires:SenderType -->
	<xsl:template match="dires:Sender">
		<xsl:value-of select="dires:SenderName"/><br/>
		<xsl:if test="dires:SenderINN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="dires:SenderINN"/>
		</xsl:if>
		<xsl:if test="dires:SenderKPP">
			<xsl:text> КПП: </xsl:text>
			<xsl:value-of select="dires:SenderKPP"/>
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
