<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ns1="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:erqst="urn:customs.ru:Information:CustomsDocuments:EBVRRequest:5.12.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0">
	<!-- Шаблон для типа EBVRRequestType -->
	<xsl:template match="erqst:EBVRRequest">
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
										<b>Информация КПС "Постконтроль" для проведения поиска в ЕБВР</b>
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
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата формирования запроса в ЕБВР</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="erqst:DateRequest"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Параметры поиска по товару.</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Код ТН ВЭД товара</td>
								<td class="graphMain bordered">Заявленный код товара в соответствии с Классификатором дополнительной таможенной информации для РФ и РК</td>
								<td class="graphMain bordered">Код страны происхождения товара</td>
								<td class="graphMain bordered">ИНН налогоплательщика</td>
								<td class="graphMain bordered">Информация о товаре</td>
							</tr>
							<xsl:for-each select="erqst:RequestInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа erqst:GoodsInformationType -->
	<xsl:template match="erqst:GoodsInformation">
		<xsl:if test="erqst:Manufacturer">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Производитель товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="erqst:Manufacturer"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="erqst:Marking">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Артикул товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="erqst:Marking"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="erqst:Model">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Модель товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="erqst:Model"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="erqst:TradeMark">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Товарный знак</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="erqst:TradeMark"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа erqst:RequestInfoType -->
	<xsl:template match="erqst:RequestInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="erqst:TNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="erqst:AddTNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="erqst:OriginCountryCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="erqst:INN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="erqst:GoodsInformation">
					<xsl:apply-templates select="erqst:GoodsInformation"/>
				</xsl:if>
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
</xsl:stylesheet>
