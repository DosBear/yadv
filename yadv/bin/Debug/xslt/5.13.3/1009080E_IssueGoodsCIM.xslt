<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:ig_cim="urn:customs.ru:Information:SQDocuments:IssueGoodsCIM:5.12.0">
	<!-- Шаблон для типа IssueGoodsCIMType -->
	<xsl:template match="ig_cim:IssueGoodsCIM">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									/*white-space: nowrap;*/
									}

									div.page {
									/*width: 190mm;*/
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
										<b>Предоставление сведений о выпускаемых маркированных товарах</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="ig_cim:GTDNumber">
						<div class="title marg-top">Регистрационный номер ДТ</div>
					</xsl:if>
					<xsl:apply-templates select="ig_cim:GTDNumber"/>
					<table class="w190">
						<tr>
							<td class="annot graphMain">
								<xsl:value-of select="ig_cim:CustomsProcedure"/>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Сведения о товаре и контрольном (идентификационном) знаке</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Номер товара по ДТ</td>
								<td class="graphMain bordered">Код товара по ТН ВЭД</td>
								<td class="graphMain bordered">Описание товара</td>
								<td class="graphMain bordered">Код валюты</td>
								<td class="graphMain bordered">Таможенная стоимость</td>
								<td class="graphMain bordered">Статистическая стоимость</td>
								<td class="graphMain bordered">Фактурная стоимость</td>
								<td class="graphMain bordered">Вес товара, брутто (кг)</td>
								<td class="graphMain bordered">Вес товара, нетто (кг)</td>
								<td class="graphMain bordered">Код страны происхождения</td>
								<td class="graphMain bordered">Количество товара в ДЕИ</td>
								<td class="graphMain bordered">Перечень идентификационных номеров</td>
								<td class="graphMain bordered">Код принятого решения</td>
								<td class="graphMain bordered">Дата принятого решения</td>
							</tr>
							<xsl:for-each select="ig_cim:IssueGoodsInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:CIMListType -->
	<xsl:template match="ig_cim:CIMList">
		<xsl:for-each select="catESAD_cu:CIMID">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><br/></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="ig_cim:GTDNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:call-template name="num_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ig_cim:IssueGoodsInfoType -->
	<xsl:template match="ig_cim:IssueGoodsInfo">
		<tr valign="top">
			<td class="bordered">
				<xsl:value-of select="ig_cim:GoodsNumeric"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="ig_cim:GoodsTNVEDCode"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="ig_cim:GoodsDescription"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="ig_cim:ContractCurrencyCode"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="translate(ig_cim:CustomsCost, '.', ',')"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="translate(ig_cim:StatisticalCost, '.', ',')"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="translate(ig_cim:InvoicedCost, '.', ',')"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="translate(ig_cim:GrossWeightQuantity, '.', ',')"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="translate(ig_cim:NetWeightQuantity, '.', ',')"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="ig_cim:OriginCountryCode"/>
			</td>
			<td class="bordered">
				<xsl:if test="ig_cim:SupplementaryGoodsQuantity">
					<xsl:apply-templates select="ig_cim:SupplementaryGoodsQuantity"/>
				</xsl:if>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="ig_cim:CIMList"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="ig_cim:DecisionCode"/>
			</td>
			<td class="bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ig_cim:DateTimeDecision"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="ig_cim:SupplementaryGoodsQuantity">
		<xsl:for-each select="*">
			<xsl:if test="local-name(.) = 'MeasureUnitQualifierCode'">(</xsl:if>
			<xsl:value-of select="."/>
			<xsl:if test="local-name(.) = 'MeasureUnitQualifierCode'">)</xsl:if>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
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
