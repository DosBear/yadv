<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_crd="urn:customs.ru:CardCommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cptt="urn:customs.ru:CustomsCardDoc:CustPayment:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа CustPaymentType -->
	<xsl:template match="cptt:CustPayment">
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
										<b>Сведения о суммах денежных средств, подлежащих уплате по декларации на товары</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_crd:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_crd:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_crd:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="cptt:ProcessID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор процедуры ЭД (GUID)</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cptt:ProcessID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cptt:Payment">
						<div class="title marg-top">Сведения о платеже</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Код вида платежа  по классификатору видов налогов, сборов и иных платежей, взимание которых возложено на таможенные органы</td>
									<td class="graphMain bordered">Сумма денежных средств, подлежащая уплате по декларации на товары</td>
									<td class="graphMain bordered">Цифровой код валюты суммы платежа</td>
									<td class="graphMain bordered">Курс валюты</td>
								</tr>
								<xsl:for-each select="cptt:Payment">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cptt:PaymentType -->
	<xsl:template match="cptt:Payment">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cptt:PaymentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(cptt:PaymentAmount, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cptt:PaymentCurrencyCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(cptt:CurrencyRate, '.', ',')"/>
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
