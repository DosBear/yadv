<?xml version="1.0" encoding="utf-8"?>
<!-- бланк по форме в проекте приказа Минфина, письмо от Шубина А.Ю. от 25.08.2017 11:57 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.13.3" xmlns:AEO_rf2="urn:customs.ru:Information:AEO_ReportF2:5.13.3">
	<!-- Шаблон для типа AEO_ReportF2Type -->
	<xsl:template match="AEO_rf2:AEO_ReportF2">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div
					{
					/*white-space: nowrap;*/
					}

					div.page {
					width: 210mm;
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
					<table class="w190" style="width: 180mm" align="center">
						<tr class="title">
							<td class="graphMain" style="width: 23mm; font-size: medium">Отчет УЭО </td>
							<td class="value graphMain" style="width: 129mm; font-size: medium" align="center">
								<xsl:for-each select="AEO_rf2:AuthoriziedOperatorDetails">
									<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
										<xsl:value-of select="RUScat_ru:BusinessEntityTypeCode"/>
									</xsl:if>
									<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
										<xsl:if test="RUScat_ru:BusinessEntityTypeCode">, </xsl:if>
										<xsl:value-of select="cat_ru:OrganizationName"/>
										<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName"><xsl:value-of select="cat_ru:ShortName"/></xsl:if>
									</xsl:if>
									<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
										<xsl:if test="RUScat_ru:BusinessEntityTypeCode or cat_ru:OrganizationName or cat_ru:ShortName">, </xsl:if>
										<xsl:text>ИНН: </xsl:text>
										<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</xsl:if>
								</xsl:for-each>	
							</td>
							<td class="graphMain" style="width: 28mm; font-size: medium" align="right"> по Форме № 2</td>
						</tr>
						<tr>
							<td/>
							<td style="font-size: x-small" align="center">организационно-правовая форма, наименование, ИНН</td>
							<td/>
						</tr>
					</table>
					<br/>
					<xsl:for-each select="AEO_rf2:AuthoriziedOperatorDetails/RUDECLcat:AEORegistryIdDetails">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width: 45mm">свидетельство УЭО № </td>
								<td class="value graphMain" style="width: 145mm"><xsl:apply-templates select="."/></td>
							</tr>
						</table>
					</xsl:for-each>
					<table class="w190">
						<tr>
							<td class="annot graphMain">о финансовой устойчивости УЭО в <u><xsl:value-of select="AEO_rf2:YearReport"/></u> году. </td>
						</tr>
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain">
								<xsl:choose>
									<xsl:when test="AEO_rf2:ResultIndicator='true' or AEO_rf2:ResultIndicator=1">соблюдение / <s>несоблюдение</s> </xsl:when>
									<xsl:when test="AEO_rf2:ResultIndicator='false' or AEO_rf2:ResultIndicator=0"><s>соблюдение</s> / несоблюдение </xsl:when>
								</xsl:choose>
								<xsl:text> совокупного показателя финансовой устойчивости УЭО</xsl:text>
							</td>
						</tr>
					</table>
					<br/>
					<b>1. Исходные данные</b>
					<br/>
					1.1. По бухгалтерскому балансу (форма по ОКУД 0710001).
					<table class="bordered">
						<tbody>
							<tr align="center">
								<td class="graphMain bordered">№ п/п</td>
								<td class="graphMain bordered">Наименование показателя</td>
								<td class="graphMain bordered">Код</td>
								<td class="graphMain bordered">На 31 декабря <xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year"/> г.</td>
								<td class="graphMain bordered">На 31 декабря <xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Year"/> г.</td>
								<td class="graphMain bordered">На 31 декабря <xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Year"/> г.</td>
								<td class="graphMain bordered">На 31 декабря <xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Year"/> г.</td>
							</tr>
							<tr align="center">
								<td class="graphMain bordered">1</td>
								<td class="graphMain bordered">2</td>
								<td class="graphMain bordered">3</td>
								<td class="graphMain bordered">4</td>
								<td class="graphMain bordered">5</td>
								<td class="graphMain bordered">6</td>
								<td class="graphMain bordered">7</td>
							</tr>
							<tr>
								<td class="graphMain bordered">1.</td>
								<td class="graphMain bordered">Основные средства</td>
								<td class="graphMain bordered">1150</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceBasicTools"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceBasicTools"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceBasicTools"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceBasicTools"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">2.</td>
								<td class="graphMain bordered">Итого по разделу II<br/>(оборотные активы)</td>
								<td class="graphMain bordered">1200</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceWorkingCapital"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceWorkingCapital"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceWorkingCapital"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceWorkingCapital"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">3.</td>
								<td class="graphMain bordered">Уставный капитал<br/>(складочный капитал, уставный фонд, вклады товарищей)</td>
								<td class="graphMain bordered">1310</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceShareCapital"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceShareCapital"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceShareCapital"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceShareCapital"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">4.</td>
								<td class="graphMain bordered">Итого по разделу III<br/>(капитал и резервы)</td>
								<td class="graphMain bordered">1300</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceCapitalReserves"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceCapitalReserves"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceCapitalReserves"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceCapitalReserves"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">5.</td>
								<td class="graphMain bordered">Итого по разделу IV<br/>(долгосрочные обязательства)</td>
								<td class="graphMain bordered">1400</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceObligation"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceObligation"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceObligation"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceObligation"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">6.</td>
								<td class="graphMain bordered">Итого по разделу V<br/>(краткосрочные обязательства)</td>
								<td class="graphMain bordered">1500</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceShortTerm"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceShortTerm"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceShortTerm"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceShortTerm"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">7.</td>
								<td class="graphMain bordered">Баланс</td>
								<td class="graphMain bordered">1700</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Balance"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Balance"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Balance"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Balance"/></td>
							</tr>
						</tbody>
					</table>
					<br/>
					1.2. По отчету о финансовых результатах (форма по ОКУД 0710002).
					<table class="bordered">
						<tbody>
							<tr align="center">
								<td class="graphMain bordered">№ п/п</td>
								<td class="graphMain bordered">Наименование показателя</td>
								<td class="graphMain bordered">Код</td>
								<td class="graphMain bordered">На 31 декабря <xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year"/> г.</td>
								<td class="graphMain bordered">На 31 декабря <xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Year"/> г.</td>
								<td class="graphMain bordered">На 31 декабря <xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Year"/> г.</td>
								<td class="graphMain bordered">На 31 декабря <xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Year"/> г.</td>
							</tr>
							<tr align="center">
								<td class="graphMain bordered">1</td>
								<td class="graphMain bordered">2</td>
								<td class="graphMain bordered">3</td>
								<td class="graphMain bordered">4</td>
								<td class="graphMain bordered">5</td>
								<td class="graphMain bordered">6</td>
								<td class="graphMain bordered">7</td>
							</tr>
							<tr>
								<td class="graphMain bordered">8.</td>
								<td class="graphMain bordered">Чистая прибыль (убыток)</td>
								<td class="graphMain bordered">2400</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:NetProfit"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:NetProfit"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:NetProfit"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:NetProfit"/></td>
							</tr>
						</tbody>
					</table>
					<br/>
					1.3. По отчету об изменениях капитала (форма по ОКУД 0710003).
					<table class="bordered">
						<tbody>
							<tr align="center">
								<td class="graphMain bordered">№ п/п</td>
								<td class="graphMain bordered">Наименование показателя</td>
								<td class="graphMain bordered">Код</td>
								<td class="graphMain bordered">На 31 декабря <xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year"/> г.</td>
								<td class="graphMain bordered">На 31 декабря <xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Year"/> г.</td>
								<td class="graphMain bordered">На 31 декабря <xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Year"/> г.</td>
								<td class="graphMain bordered">На 31 декабря <xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Year"/> г.</td>
							</tr>
							<tr align="center">
								<td class="graphMain bordered">1</td>
								<td class="graphMain bordered">2</td>
								<td class="graphMain bordered">3</td>
								<td class="graphMain bordered">4</td>
								<td class="graphMain bordered">5</td>
								<td class="graphMain bordered">6</td>
								<td class="graphMain bordered">7</td>
							</tr>
							<tr>
								<td class="graphMain bordered">9.</td>
								<td class="graphMain bordered">Чистые активы</td>
								<td class="graphMain bordered">3600</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:NetAssets"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:NetAssets"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:NetAssets"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:NetAssets"/></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<b>2. Расчет показателей финансовой устойчивости УЭО. </b>
					<table class="bordered">
						<tbody>
							<tr align="center">
								<td class="graphMain bordered">№ п/п</td>
								<td class="graphMain bordered">Наименование показателя</td>
								<td class="graphMain bordered">
									<xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:ReportingYear">Значение показателя за <xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:ReportingYear"/> г.</xsl:when>
										<xsl:when test="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:PreviousYears">Среднее за 
											<xsl:for-each select="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:PreviousYears">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">, </xsl:if>
											</xsl:for-each>
											<xsl:text> (расчетное)</xsl:text>
										</xsl:when>
									</xsl:choose>
								</td>
								<td class="graphMain bordered">Критерий показателя (минимальный)</td>
								<td class="graphMain bordered">Значимость показателя в балльной системе</td>
								<td class="graphMain bordered">Фактическа значимость показателя (в баллах)</td>
							</tr>
							<tr align="center">
								<td class="graphMain bordered">1</td>
								<td class="graphMain bordered">2</td>
								<td class="graphMain bordered">3</td>
								<td class="graphMain bordered">4</td>
								<td class="graphMain bordered">5</td>
								<td class="graphMain bordered">6</td>
							</tr>
							<tr>
								<td class="graphMain bordered">1.</td>
								<td class="graphMain bordered">Размер чистых активов (Kча), руб.</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:NetAssets"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:NetAssets"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueNetAssets"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueNetAssets"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">2.</td>
								<td class="graphMain bordered">Размер уставного капитала (Kук), руб.</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:ShareCapital"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:ShareCapital"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueShareCapital"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueShareCapital"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">3.</td>
								<td class="graphMain bordered">Остаточная стоимость основных средств (Kос), руб.</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:BasicToolsRest"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:BasicToolsRest"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueBasicToolsRest"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueBasicToolsRest"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">4.</td>
								<td class="graphMain bordered">Коэффициент автономии (Kа)</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorAutonomy"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorAutonomy"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueIndicatorAutonomy"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueIndicatorAutonomy"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">5.</td>
								<td class="graphMain bordered">Коэффициент общей (текущей) ликвидности (Kол)</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorLiquidity"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorLiquidity"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueIndicatorLiquidity"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueIndicatorLiquidity"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">6.</td>
								<td class="graphMain bordered">Рентабельность собственного капитала (Kрск)</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorProfitability"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorProfitability"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueIndicatorProfitability"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueIndicatorProfitability"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">7.</td>
								<td class="graphMain bordered">Коэффициент финансовой устойчивости (Kфу)</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorFinancialStability"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorFinancialStability"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueIndicatorFinancialStability"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueIndicatorFinancialStability"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">8.</td>
								<td class="graphMain bordered">Коэффициент обеспеченности текущей деятельности собственными оборотными активами (Kотд)</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorUseOwnWorkCapital"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorUseOwnWorkCapital"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueIndicatorUseOwnWorkCapital"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueIndicatorUseOwnWorkCapital"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">9.</td>
								<td class="graphMain bordered">Коэффициент маневренности собственного капитала (Kмск)</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorsManeuverability"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorsManeuverability"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueIndicatorsManeuverability"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueIndicatorsManeuverability"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered">10.</td>
								<td class="graphMain bordered" colspan="3">Совокупный показатель УЭО (СП<sub>УЭО</sub>)</td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:IndicatorsAggregate"/></td>
								<td class="graphMain bordered"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:IndicatorsAggregate"/></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:apply-templates select="AEO_rf2:Signatures"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="AEO_rf2:Signatures">
		<table class="w190">
			<xsl:apply-templates select="AEO_rf2:Director"/>
			<xsl:apply-templates select="AEO_rf2:ChiefAccountant"/>
		</table>
	</xsl:template>
	<xsl:template match="AEO_rf2:ChiefAccountant| AEO_rf2:Director">
		<tr>
			<td class="annot graphMain" style="width:50mm">
				<xsl:if test="name(.)='AEO_rf2:Director'">Руководитель организации</xsl:if>
				<xsl:if test="name(.)='AEO_rf2:ChiefAccountant'">Главный бухгалтер</xsl:if>
			</td>
			<td class="value graphMain" style="width:30mm"/>
			<td class="annot graphMain" style="width:5mm"/>	
			<td class="value graphMain" style="width:70mm" align="center">
				<xsl:value-of select="cat_ru:PersonSurname"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="cat_ru:PersonName"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="cat_ru:PersonMiddleName"/>
				<xsl:if test="cat_ru:PersonPost">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="cat_ru:PersonPost"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</td>
			<td class="annot graphMain" style="width:5mm"/>
			<td class="value graphMain" style="width:30mm" align="center">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
				</xsl:call-template>
			</td>
		</tr>	
		<tr>
			<td class="annot graphMain"/>
			<td class="annot graphMain" style="font-size: x-small" align="center"><i>подпись</i></td>
			<td class="annot graphMain"/>	
			<td class="annot graphMain" style="font-size: x-small" align="center"><i>Ф.И.О.</i></td>
			<td class="annot graphMain"/>
			<td class="annot graphMain" style="font-size: x-small" align="center"><i>Дата подписания</i></td>
		</tr>	
	</xsl:template>
	<xsl:template match="RUDECLcat:AEORegistryIdDetails">
		<xsl:value-of select="RUScat_ru:DocId"/>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="RUScat_ru:AEORegistryKindCode"/>
		<xsl:text>) код типа реестра: </xsl:text>
		<xsl:value-of select="RUScat_ru:RegistryOwnerCode"/>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<xsl:text> код страны: </xsl:text>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
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
