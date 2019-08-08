<?xml version="1.0" encoding="utf-8"?>
<!-- бланк по форме Приказа ФТС от 20.12.2018 № 2077 -->
<xsl:stylesheet version="1.0" xmlns:svg="http://www.w3.org/2000/svg"  xmlns:xlink="http://www.w3.org/1999/xlink"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.14.0" xmlns:AEO_rf2="urn:customs.ru:Information:AEO_ReportF2:5.14.0">
  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   	<!-- Шаблон для типа AEO_ReportF2Type -->
	<xsl:template match="AEO_rf2:AEO_ReportF2">
		<html>
			<head>
<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<style>
					body {
					background: #cccccc;
					}

					div
					{
					/*white-space: nowrap;*/
					}

					div.page {
					width: 267mm;
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

					.bg {position: relative;}
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:variable name="img_crosscell">
						<xsl:value-of select="'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAIAAAD/gAIDAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALaSURBVHhe7dpZcsMgDAbgHKSPvf/NeoY2mWSc
1Avafi0sfhbC+gYwCdx+vr5/18MQuEPd7mHLi7R6Ej2wllcbaxtML6zldeX1Oe3eWMvr6LVboP5h
La9Pr+NSvsdaXo1F/ARreV1tD86xZvZqbKQuseb0am85W1izeZGbcwJrHi9S6r2DZ25hyZ8FnQZw
pLhYY48vppQAa1QvvpQMazwvkZQYayQvqZQGawwvhZQSq3cvnZQeq18vtZQJq0cvi5QVqy8voxQA
qxcvuxQGq74XRAqGVdkLJYXEqukFlAJjVfPCSuGx6njBpVywKnh5SHlh5Xo5STliZXn5SflixXu5
SrljRXp5S0VgxXgFSAVheXvFSMVh+XmFSYVieXhFSkVjYb2CpRKwUF7xUjlYdq8UqTQsi1eWVCaW
zitRKhlL6pUrlY/F90qXKoHF8aogVQWr7VVEqhDWlVcdqVpYR69SUuWwPr2qSVXEenoVlFpYdwHB
Q9+DFyRDhG5jquDgqoW1A6rmVQjrlKaUVxWsBkodrxJYJAcZgFgt6Rz5WEwIZhhdsSEiGUtEIAo2
mFw2zcRSFK9oAlRLw1KXrW5oV8vBMhZsbK5WS8CClApJIlWLxgIWCUzFVAvFgpcHT9hWi8NyKswp
7alaEJZrSa7JP9UisAKKCegi4s+/mDLa50PM9ZsM8x1ZYVLPOr27c8TyfvXTgeDaqReW60u354tf
1y5Yfq9LLiuu8xGPlS7l5wXGKiLl5IXEKiXl4QXDKigF98JglZXCegGwiksBvaxYXUihvExYHUlB
vPRY3UnZvZRYnUoZvTRYXUtZvMRYA0ipvWRYw0jpvARYg0kpvLhYQ0pJvVhYA0uJvGis4aX4XgTW
JFJMrxbWVFIcr0usCaVIr3OsaaXaXidYk0s1vPZYS2o7bTtS/MNaUrtzyR3IG2tJkfcBXlhLqnHW
veE8sJYUeSvgSXRbUqTU9n38A+DPVw6P+zXcAAAAAElFTkSuQmCC'"/>
					</xsl:variable>				
					<table style="width: 100%" align="center">
						<tr class="title">
							<td class="graphMain" style="font-size: medium" align="center">Отчет уполномоченного экономического оператора по форме № 2</td>
						</tr>
						<tr class="title">
							<td><br/></td>
						</tr>
						<tr class="title">
							<td class="value graphMain" style="font-size: medium" align="center">
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
										<xsl:text>, КПП: </xsl:text>
										<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</xsl:if>
								</xsl:for-each>	
							</td>
						</tr>
						<tr>
							<td style="font-size: x-small" align="center">организационно-правовая форма, наименование, идентификационный номер налогоплательщика (ИНН)/код причины постановки на учет (КПП)</td>
						</tr>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot graphMain" style="width: 15%">свидетельство от </td>
							<td class="value graphMain" style="width: 10%" align="center">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="AEO_rf2:AuthoriziedOperatorDetails/AEO_rf2:DateIssued"/>
								</xsl:call-template>
							</td>
							<td class="annot graphMain" style="width: 5%" align="center">№</td>
							<td class="value graphMain" style="width: 70%">
								<xsl:for-each select="AEO_rf2:AuthoriziedOperatorDetails/RUDECLcat:AEORegistryIdDetails">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<br/>
					<table style="width: 100%">
						<tr>
							<td class="annot graphMain" style="width: 24%">о финансовой устойчивости в</td>
							<td class="value graphMain" style="width: 15%" align="center">
								<xsl:value-of select="AEO_rf2:YearReport"/>
							</td>
							<td class="annot graphMain" style="width: 2%" align="center"/>
							<td class="annot graphMain" style="width: 59%" align="left">году. </td>
						</tr>
					</table>
					<br/>
					<br/>
					<table class="w190">
						<tr>
							<td class="graphMain bordered" width="50%" style="padding-left:5pt;">   Финансовая устойчивость установленным требованиям</td>
							<td class="graphMain annot" width="7%"/>
							<td class="graphMain bordered" width="15%" style="padding-left:5pt;">соответствует</td>
							<td class="graphMain bordered" width="3%" align="center">
								<xsl:if test="AEO_rf2:ResultIndicator='true' or AEO_rf2:ResultIndicator=1"><b>V</b></xsl:if>
							</td>
							<td class="graphMain annot" width="7%"/>
							<td class="graphMain bordered" width="15%" style="padding-left:5pt;">не  соответствует</td>
							<td class="graphMain bordered" width="3%" align="center">
								<xsl:if test="not(AEO_rf2:ResultIndicator='true' or AEO_rf2:ResultIndicator=1)"><b>V</b></xsl:if>
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
								<td class="graphMain bordered" width="4%">№№ п/п</td>
								<td class="graphMain bordered" width="29%">Наименование показателя</td>
								<td class="graphMain bordered" width="7%">Код</td>
								<td class="graphMain bordered" width="15%">На 31 декабря 
									<xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year),3,2)"/></u> г.
										</xsl:when>
										<xsl:otherwise><xsl:text>______</xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="graphMain bordered" width="15%">На 31 декабря 
									<xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Year),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Year),3,2)"/></u> г.
										</xsl:when>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 1),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 1),3,2)"/></u> г.
										</xsl:when>
										<xsl:otherwise><xsl:text>______</xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="graphMain bordered" width="15%">На 31 декабря 
									<xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Year),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Year),3,2)"/></u> г.
										</xsl:when>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 2),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 2),3,2)"/></u> г.
										</xsl:when>
										<xsl:otherwise><xsl:text>______</xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="graphMain bordered" width="15%">На 31 декабря 
									<xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Year),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Year),3,2)"/></u> г.
										</xsl:when>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 3),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 3),3,2)"/></u> г.
										</xsl:when>
										<xsl:otherwise><xsl:text>______</xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
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
								<td class="graphMain bordered" align="center">1.</td>
								<td class="graphMain bordered">Основные средства</td>
								<td class="graphMain bordered" align="center">1150</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceBasicTools">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceBasicTools,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceBasicTools">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceBasicTools,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceBasicTools">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceBasicTools,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<xsl:choose>
									<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceBasicTools">
										<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
											<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceBasicTools,'#,###'), ',', ' '), '.', ',')"/>
										</td>
									</xsl:when>
									<xsl:when test="not(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceWorkingCapital) and not(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceShareCapital)">
										<td class="graphMain bordered" rowspan="3" style="min-height: 100%;max-height: 100%;height: 100%;">
											<table style="min-height: 100%;max-height: 100%;height: 100%;min-width: 100%;max-width: 100%;width: 100%;">
													<tr>
														<td class="bg">
															<img style="min-height: 100%;max-height: 100%;height: 100%;min-width: 100%;max-width: 100%;width: 100%;">
																<xsl:attribute name="src">
																	<xsl:value-of select="concat('data:image/png;base64,',$img_crosscell)"/>
																</xsl:attribute>
															</img> 
														</td>
													</tr>
											</table>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td class="graphMain bordered"/>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">2.</td>
								<td class="graphMain bordered">Итого по разделу II<br/>(оборотные активы)</td>
								<td class="graphMain bordered" align="center">1200</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceWorkingCapital">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceWorkingCapital,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceWorkingCapital">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceWorkingCapital,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceWorkingCapital">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceWorkingCapital,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<xsl:choose>
									<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceWorkingCapital">
										<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
											<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceWorkingCapital,'#,###'), ',', ' '), '.', ',')"/>
										</td>
									</xsl:when>
									<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceBasicTools or AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceShareCapital">
										<td class="graphMain bordered"/>
									</xsl:when>
								</xsl:choose>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">3.</td>
								<td class="graphMain bordered">Уставный капитал<br/>(складочный капитал, уставный фонд, вклады товарищей)</td>
								<td class="graphMain bordered" align="center">1310</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceShareCapital">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceShareCapital,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceShareCapital">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceShareCapital,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceShareCapital">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceShareCapital,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<xsl:choose>
									<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceShareCapital">
										<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
											<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceShareCapital,'#,###'), ',', ' '), '.', ',')"/>
										</td>
									</xsl:when>
									<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceBasicTools or AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceWorkingCapital">
										<td class="graphMain bordered"/>
									</xsl:when>
								</xsl:choose>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">4.</td>
								<td class="graphMain bordered">Итого по разделу III<br/>(капитал и резервы)</td>
								<td class="graphMain bordered" align="center">1300</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceCapitalReserves">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceCapitalReserves,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceCapitalReserves">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceCapitalReserves,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceCapitalReserves">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceCapitalReserves,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceCapitalReserves">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceCapitalReserves,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">5.</td>
								<td class="graphMain bordered">Итого по разделу IV<br/>(долгосрочные обязательства)</td>
								<td class="graphMain bordered" align="center">1400</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceObligation">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceObligation,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceObligation">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceObligation,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceObligation">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceObligation,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<xsl:choose>
									<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceObligation">
										<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
											<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceObligation,'#,###'), ',', ' '), '.', ',')"/>
										</td>
									</xsl:when>
									<xsl:when test="not(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceShortTerm) and not(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Balance)">
										<td class="graphMain bordered" rowspan="3" style="min-height: 100%;max-height: 100%;height: 100%;">
											<table style="min-height: 100%;max-height: 100%;height: 100%;min-width: 100%;max-width: 100%;width: 100%;">
													<tr>
														<td class="bg">
															<img style="min-height: 100%;max-height: 100%;height: 100%;min-width: 100%;max-width: 100%;width: 100%;">
																<xsl:attribute name="src">
																	<xsl:value-of select="concat('data:image/png;base64,',$img_crosscell)"/>
																</xsl:attribute>
															</img> 
														</td>
													</tr>
											</table>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td class="graphMain bordered"/>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">6.</td>
								<td class="graphMain bordered">Итого по разделу V<br/>(краткосрочные обязательства)</td>
								<td class="graphMain bordered" align="center">1500</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceShortTerm">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:BalanceShortTerm,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceShortTerm">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:BalanceShortTerm,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceShortTerm">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:BalanceShortTerm,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<xsl:choose>
									<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceShortTerm">
										<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
											<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceShortTerm,'#,###'), ',', ' '), '.', ',')"/>
										</td>
									</xsl:when>
									<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceObligation or AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Balance">
										<td class="graphMain bordered"/>
									</xsl:when>
								</xsl:choose>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">7.</td>
								<td class="graphMain bordered">Баланс</td>
								<td class="graphMain bordered" align="center">1700</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Balance">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Balance,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Balance">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Balance,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Balance">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Balance,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<xsl:choose>
									<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Balance">
										<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
											<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Balance,'#,###'), ',', ' '), '.', ',')"/>
										</td>
									</xsl:when>
									<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceObligation or AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:BalanceShortTerm">
										<td class="graphMain bordered"/>
									</xsl:when>
								</xsl:choose>
							</tr>
						</tbody>
					</table>
					<br/>
					1.2. По отчету о финансовых результатах (форма по ОКУД 0710002).
					<table class="bordered">
						<tbody>
							<tr align="center">
								<td class="graphMain bordered" width="4%">№№ п/п</td>
								<td class="graphMain bordered" width="29%">Наименование показателя</td>
								<td class="graphMain bordered" width="7%">Код</td>
								<td class="graphMain bordered" width="15%">На 31 декабря 
									<xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year),3,2)"/></u> г.
										</xsl:when>
										<xsl:otherwise><xsl:text>______</xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="graphMain bordered" width="15%">На 31 декабря 
									<xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Year),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Year),3,2)"/></u> г.
										</xsl:when>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 1),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 1),3,2)"/></u> г.
										</xsl:when>
										<xsl:otherwise><xsl:text>______</xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="graphMain bordered" width="15%">На 31 декабря 
									<xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Year),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Year),3,2)"/></u> г.
										</xsl:when>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 2),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 2),3,2)"/></u> г.
										</xsl:when>
										<xsl:otherwise><xsl:text>______</xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="graphMain bordered" width="15%">На 31 декабря 
									<xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Year),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Year),3,2)"/></u> г.
										</xsl:when>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 3),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 3),3,2)"/></u> г.
										</xsl:when>
										<xsl:otherwise><xsl:text>______</xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
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
								<td class="graphMain bordered" align="center">8.</td>
								<td class="graphMain bordered">Чистая прибыль (убыток)</td>
								<td class="graphMain bordered" align="center">2400</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:NetProfit">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:NetProfit,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:NetProfit">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:NetProfit,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:NetProfit">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:NetProfit,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:NetProfit">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:NetProfit,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					1.3. По отчету об изменениях капитала (форма по ОКУД 0710003).
					<table class="bordered">
						<tbody>
							<tr align="center">
								<td class="graphMain bordered" width="4%">№№ п/п</td>
								<td class="graphMain bordered" width="29%">Наименование показателя</td>
								<td class="graphMain bordered" width="7%">Код</td>
								<td class="graphMain bordered" width="15%">На 31 декабря 
									<xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year),3,2)"/></u> г.
										</xsl:when>
										<xsl:otherwise><xsl:text>______</xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="graphMain bordered" width="15%">На 31 декабря 
									<xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Year),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:Year),3,2)"/></u> г.
										</xsl:when>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 1),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 1),3,2)"/></u> г.
										</xsl:when>
										<xsl:otherwise><xsl:text>______</xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="graphMain bordered" width="15%">На 31 декабря 
									<xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Year),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:Year),3,2)"/></u> г.
										</xsl:when>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 2),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 2),3,2)"/></u> г.
										</xsl:when>
										<xsl:otherwise><xsl:text>______</xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="graphMain bordered" width="15%">На 31 декабря 
									<xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Year),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:Year),3,2)"/></u> г.
										</xsl:when>
										<xsl:when test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year">
											<xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 3),1,2)"/>
											<u><xsl:value-of select="substring(string(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:Year - 3),3,2)"/></u> г.
										</xsl:when>
										<xsl:otherwise><xsl:text>______</xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
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
								<td class="graphMain bordered" align="center">9.</td>
								<td class="graphMain bordered">Чистые активы</td>
								<td class="graphMain bordered" align="center">3600</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:NetAssets">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:ReportingYear/AEO_rf2:NetAssets,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:NetAssets">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[1]/AEO_rf2:NetAssets,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:NetAssets">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[2]/AEO_rf2:NetAssets,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:NetAssets">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_1/AEO_rf2:PreviousYears[3]/AEO_rf2:NetAssets,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<b>2. Расчет показателей финансовой устойчивости</b>
					<table class="bordered">
						<tbody>
							<tr align="center">
								<td class="graphMain bordered" width="4%">№ п/п</td>
								<td class="graphMain bordered" width="36%">Наименование показателя</td>
								<td class="graphMain bordered" width="15%">Cреднее значение показателя (расчетное)
									<!--xsl:choose>
										<xsl:when test="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:ReportingYear">Значение показателя за <xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:ReportingYear"/> г.</xsl:when>
										<xsl:when test="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:PreviousYears">Среднее за 
											<xsl:for-each select="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:PreviousYears">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">, </xsl:if>
											</xsl:for-each>
											<xsl:text> (расчетное)</xsl:text>
										</xsl:when>
									</xsl:choose-->
								</td>
								<td class="graphMain bordered" width="15%">Критерий показателя (минимальный)</td>
								<td class="graphMain bordered" width="15%">Значимость показателя в балльной системе</td>
								<td class="graphMain bordered" width="15%">Фактическая значимость показателя (в баллах)</td>
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
								<td class="graphMain bordered" align="center">1.</td>
								<td class="graphMain bordered">Размер чистых активов (Kча), руб.</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:NetAssets">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:NetAssets,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:NetAssets">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:NetAssets,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueNetAssets"/></td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueNetAssets"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">2.</td>
								<td class="graphMain bordered">Размер уставного капитала (Kук), руб.</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:ShareCapital">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:ShareCapital,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:ShareCapital">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:ShareCapital,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueShareCapital"/></td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueShareCapital"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">3.</td>
								<td class="graphMain bordered">Остаточная стоимость основных средств (Kос), руб.</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:BasicToolsRest">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:BasicToolsRest,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:BasicToolsRest">
										<xsl:value-of select="translate(translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:BasicToolsRest,'#,###'), ',', ' '), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueBasicToolsRest"/></td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueBasicToolsRest"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">4.</td>
								<td class="graphMain bordered">Коэффициент автономии (Kа)</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorAutonomy">
										<xsl:value-of select="translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorAutonomy,'0.00'), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorAutonomy">
										<xsl:value-of select="translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorAutonomy,'0.00'), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueIndicatorAutonomy"/></td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueIndicatorAutonomy"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">5.</td>
								<td class="graphMain bordered">Коэффициент общей (текущей) ликвидности (Kол)</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorLiquidity">
										<xsl:value-of select="translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorLiquidity,'0.00'), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorLiquidity">
										<xsl:value-of select="translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorLiquidity,'0.00'), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueIndicatorLiquidity"/></td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueIndicatorLiquidity"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">6.</td>
								<td class="graphMain bordered">Рентабельность собственного капитала (Kрск)</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorProfitability">
										<xsl:value-of select="translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorProfitability,'0.00'), '.', ',')"/>%
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorProfitability">
										<xsl:value-of select="translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorProfitability,'0.00'), '.', ',')"/>%
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueIndicatorProfitability"/></td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueIndicatorProfitability"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">7.</td>
								<td class="graphMain bordered">Коэффициент финансовой устойчивости (Kфу)</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorFinancialStability">
										<xsl:value-of select="translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorFinancialStability,'0.00'), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorFinancialStability">
										<xsl:value-of select="translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorFinancialStability,'0.00'), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueIndicatorFinancialStability"/></td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueIndicatorFinancialStability"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">8.</td>
								<td class="graphMain bordered">Коэффициент обеспеченности текущей деятельности собственными оборотными активами (Kотд)</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorUseOwnWorkCapital">
										<xsl:value-of select="translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorUseOwnWorkCapital,'0.00'), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorUseOwnWorkCapital">
										<xsl:value-of select="translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorUseOwnWorkCapital,'0.00'), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueIndicatorUseOwnWorkCapital"/></td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueIndicatorUseOwnWorkCapital"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">9.</td>
								<td class="graphMain bordered">Коэффициент маневренности собственного капитала (Kмск)</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorsManeuverability">
										<xsl:value-of select="translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:ColumnIndicators/AEO_rf2:IndicatorsManeuverability,'0.00'), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="right" style="padding-right: 5pt;">
									<xsl:if test="AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorsManeuverability">
										<xsl:value-of select="translate(format-number(AEO_rf2:TableF2_2/AEO_rf2:MinColumnIndicators/AEO_rf2:IndicatorsManeuverability,'0.00'), '.', ',')"/>
									</xsl:if>
								</td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:ValueIndicatorsManeuverability"/></td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:ValueIndicatorsManeuverability"/></td>
							</tr>
							<tr>
								<td class="graphMain bordered" align="center">10.</td>
								<td class="graphMain bordered" colspan="3">Совокупный показатель УЭО (СП<sub>УЭО</sub>)</td>
								<td class="graphMain bordered" align="center">не менее <xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:MinValueIndicators/AEO_rf2:IndicatorsAggregate"/></td>
								<td class="graphMain bordered" align="center"><xsl:value-of select="AEO_rf2:TableF2_2/AEO_rf2:ActualValueIndicators/AEO_rf2:IndicatorsAggregate"/></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:apply-templates select="AEO_rf2:Signatures"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа AEO_rf2:SignatureType -->
	<xsl:template match="AEO_rf2:Signatures">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Руководитель организации<br/>(или им уполномоченное должностное лицо)</td>
				<td class="value graphMain" style="width:20%"/>
				<td class="annot graphMain" style="width:5%"/>	
				<td class="value graphMain" valign="bottom" style="width:35%; vertical-align: bottom;" align="center">
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
			</tr>	
			<tr>
				<td class="annot graphMain"/>
				<td class="annot graphMain" style="font-size: x-small" align="center"><i>подпись</i></td>
				<td class="annot graphMain"/>	
				<td class="annot graphMain" style="font-size: x-small" align="center"><i>фамилия, имя, отчество (при наличии)</i></td>
			</tr>	
		</table>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu::AEORegistryIdDetailsType -->
	<xsl:template match="RUDECLcat:AEORegistryIdDetails">
		<xsl:value-of select="catESAD_cu:DocId"/>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="catESAD_cu:AEORegistryKindCode"/>
		<xsl:text>) код типа реестра: </xsl:text>
		<xsl:value-of select="catESAD_cu:RegistryOwnerCode"/>
		<xsl:if test="catESAD_cu:CountryA2Code">
			<xsl:text> код страны: </xsl:text>
			<xsl:value-of select="catESAD_cu:CountryA2Code"/>
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
