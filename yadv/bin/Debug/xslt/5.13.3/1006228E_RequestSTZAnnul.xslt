<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rstza="urn:customs.ru:Information:CustomsDocuments:RequestSTZAnnul:5.12.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа RequestSTZAnnulType -->
	<xsl:template match="rstza:RequestSTZAnnul">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: nowrap;
									}

									div.page {
									/*width: 297mm;*/
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
										<b>Запрос об изменении статуса ДТ</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="rstza:DTRegNumber">
						<div class="title marg-top">Регистрационный номер ДТ</div>
					</xsl:if>
					<xsl:apply-templates select="rstza:DTRegNumber"/>
					<div class="title marg-top">Товары ДТ</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Номер товара в ДТ</td>
								<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered">Описание товара текущей ДТ</td>
								<td class="graphMain bordered">Процедура</td>
								<td class="graphMain bordered">Вес товара, нетто (кг)</td>
								<td class="graphMain bordered">Количество товара в ДЕИ</td>
								<td class="graphMain bordered">Таможенная стоимость товара</td>
								<td class="graphMain bordered">Дата принятия решения по товару</td>
								<td class="graphMain bordered">Код решения по товару</td>
							</tr>
							<xsl:for-each select="rstza:DTGoods">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rstza:DTGoodsType -->
	<xsl:template match="rstza:DTGoods">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rstza:GoodsNumeric"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rstza:GoodsTNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="rstza:GoodsDescription">
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="rstza:ESADCustomsProcedure/*">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()"><br/></xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rstza:NetWeightQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="rstza:SupplementaryGoodsQuantity/*">
					<xsl:if test="local-name(.) = 'MeasureUnitQualifierCode'">(</xsl:if>
					<xsl:value-of select="."/>
					<xsl:if test="local-name(.) = 'MeasureUnitQualifierCode'">)</xsl:if>
					<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rstza:CustomsCost, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rstza:ReleaseDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rstza:DecisionCode"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="rstza:DTRegNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gdt">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="russian_date_gdt">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
