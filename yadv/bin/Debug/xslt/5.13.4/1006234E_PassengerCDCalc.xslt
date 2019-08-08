<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:pcdc="urn:customs.ru:Information:CustomsDocuments:PassengerCDCalc:5.12.0">
	<!-- Шаблон для типа PCDCalсType -->
	<xsl:template match="pcdc:PassengerCDCalc">
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
										<b>Пассажирская таможенная декларация. Расчет платежей</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:for-each select="pcdc:GoodsPayments">
						<xsl:variable name="goodsPaymentsPosition">
							<xsl:value-of select="position()"/>
						</xsl:variable>
						<!--table class="w190">
							<tbody>
								<tr>
									<td align="left" class="graphMain">
										<font size="4">
											<b>Наименование взимаемых платежей</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table-->
						<table>
							<tbody>
								<tr valign="top">
									<td class="graph" rowspan="3" style="border:1px solid;"><b>Наименование взимаемых платежей</b></td>
									<td class="graph" colspan="3" style="border:1px solid;">
										<b>Код товара 
											<xsl:value-of select="pcdc:GoodsTNVEDCode"/>
										</b>
									</td>
								</tr>
								<tr>
									<td class="graph" colspan="3" style="border:1px solid;">Стоимость товаров</td>
								</tr>
								<tr>
									<td class="graph" style="border:1px solid;">
												в валюте платежа
								</td>
									<td class="graph" style="border:1px solid;">
												в долларах США
								</td>
									<td class="graph" style="border:1px solid;">
												в евро
								</td>
								</tr>
								<tr valign="top">
									<td class="graph" style="border:1px solid;">
										<xsl:for-each select="pcdc:PaymentInfo">
											<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
											<xsl:text> </xsl:text> 
											<xsl:value-of select="pcdc:PaymentModeName"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td class="graph" style="border:1px solid;">
										<xsl:value-of select="pcdc:Cost"/>
									</td>
									<td class="graph" style="border:1px solid;">
										<xsl:value-of select="pcdc:DollarCost"/>
									</td>
									<td class="graph" style="border:1px solid;">
										<xsl:value-of select="pcdc:EuroCost"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<!--table class="w190">
							<tbody>
								<tr>
									<td align="left" class="graphMain">
										<font size="4">
											<b>Платежи</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table-->
						<xsl:variable name="paymentInfoCount">
							<xsl:value-of select="count(pcdc:PaymentInfo)"/>
						</xsl:variable>
						<table>
							<tbody>
								<tr align="center" valign="top">
									<td class="graph" style="border:1px solid;" rowspan="{$paymentInfoCount + 3}">
										П<br/>л<br/>а<br/>т<br/>е<br/>ж<br/>и
									</td>
									<td class="graph" style="border:1px solid;">Вид</td>
									<td class="graph" style="border:1px solid;">Основа начисления</td>
									<td class="graph" style="border:1px solid;">Ставка</td>
									<td class="graph" style="border:1px solid;">Исчисленная сумма</td>
									<td class="graph" style="border:1px solid;">СП</td>
									<td class="graph" style="border:1px solid;">Подробности уплаты</td>
								</tr>
								<xsl:for-each select="pcdc:PaymentInfo">
									<tr>
										<td class="graph" style="border:1px solid;">
											<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
										</td>
										<td class="graph" style="border:1px solid;">
											<xsl:value-of select="catESAD_cu:TaxBase"/>
										</td>
										<td class="graph" style="border:1px solid;">
											<xsl:value-of select="catESAD_cu:Rate"/>
										</td>
										<td class="graph" style="border:1px solid;">
											<xsl:value-of select="catESAD_cu:PaymentAmount"/>
										</td>
										<td class="graph" style="border:1px solid;">
											<xsl:value-of select="catESAD_cu:PaymentCode"/>
										</td>
										<xsl:if test="position() = 1">
											<td class="graph" style="border:1px solid;">
												<xsl:if test="last() &gt; 1">
													<xsl:attribute name="rowspan"><xsl:value-of select="last()"/></xsl:attribute>
												</xsl:if>
												<xsl:if test="$goodsPaymentsPosition = 1">
													<xsl:for-each select="../../pcdc:PaymentsDetails">
														<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
														<xsl:text> - </xsl:text>
														<xsl:value-of select="format-number(catESAD_cu:PaymentAmount,'0.00')"/>
														<xsl:text> - </xsl:text>
														<xsl:value-of select="catESAD_cu:PaymentCurrencyCode"/>
														<xsl:text> - </xsl:text>
														<xsl:value-of select="pcdc:PaymentDocument/cat_ru:PrDocumentNumber"/>
														<xsl:text> </xsl:text>
														<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="pcdc:PaymentDocument/cat_ru:PrDocumentDate"/></xsl:call-template>
														<xsl:if test="position()!=last()"><br/></xsl:if>
													</xsl:for-each>
												</xsl:if>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
								<tr>
									<td rowspan="2" class="graph" style="border:1px solid;">Всего подлежит уплате</td>
									<td class="graph" style="border:1px solid;">цифрами</td>
									<td class="graph" style="border:1px solid;" colspan="4">
										<xsl:if test="position()=1">
											<xsl:value-of select="../pcdc:Amount"/>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="graph" style="border:1px solid;">прописью</td>
									<td class="graph" style="border:1px solid;" colspan="4"/>
								</tr>
							</tbody>
						</table>
						<xsl:if test="position()!=last()">
							<br/><br/>
						</xsl:if>
					</xsl:for-each>
				</div>
			</body>
		</html>
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
