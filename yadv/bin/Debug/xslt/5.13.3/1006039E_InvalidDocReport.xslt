<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:idr="urn:customs.ru:Information:InvalidDocReport:5.12.0">
	<!-- Шаблон для типа InvalidDocReportType -->
	<xsl:template match="idr:InvalidDocReport">
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
										<b>Данные по недействительному документу из 44 гр.ДТ для построения формы стат.отчетности №35-ТНР</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:apply-templates select="idr:DTNumber"/>
					<xsl:if test="idr:CustomsModeCode">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Код таможенной процедуры</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="idr:CustomsModeCode"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="idr:DispatchCountryCode">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Код страны отправления (графа 15а ДТ, поле G15A)</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="idr:DispatchCountryCode"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="idr:DispatchCountryName">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Наименование страны отправления (графа 15 ДТ, поле G15)</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="idr:DispatchCountryName"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="idr:Declarant_INN">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">ИНН декларанта (графа 14 ДТ, поле G141)</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="idr:Declarant_INN"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="idr:InvalidDocument">
						<div class="title marg-top">Сведения о недействительном документе</div>
					</xsl:if>
					<xsl:apply-templates select="idr:InvalidDocument"/>
					<div class="title marg-top">Сведения о товаре</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Номер товара по ДТ (графа 31 ДТ, поле G32)</td>
								<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС (графа 33 ДТ, поле G33)</td>
								<td class="graphMain bordered">Вес товара (графа 38 ДТ, поле G38)  (кг)</td>
								<td class="graphMain bordered">Сведения об изготовителе продукции (графа 31 ДТ, поле G31_11)</td>
								<td class="graphMain bordered">Код страны происхождения (графа 34 ДТ, поле G34) </td>
							</tr>
							<xsl:for-each select="idr:GoodsInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="idr:DTNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер ДТ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:call-template name="DT_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа idr:GoodsInfoType -->
	<xsl:template match="idr:GoodsInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="idr:GoodsNumeric"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="idr:GoodsTNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(idr:NetWeightQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="idr:Manufacturer"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="idr:OriginCountryCode"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа idr:InvalidDocumentType -->
	<xsl:template match="idr:InvalidDocument">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код недействительного документа (графа 44 ДТ)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="idr:PresentedDocumentModeCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер недействительного документа (графа 44 ДТ)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="idr:PrDocumentNumber"/>
				</td>
			</tr>
		</table>
		<xsl:if test="idr:PrDocumentDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата недействительного документа </td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="idr:PrDocumentDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="DT_date">
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
