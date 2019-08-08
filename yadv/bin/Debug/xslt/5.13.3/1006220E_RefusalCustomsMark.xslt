<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rsfacm="urn:customs.ru:Information:CustomsDocuments:RefusalActCustomsMark:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа RefusalCustomsMarkType -->
	<xsl:template match="rsfacm:RefusalCustomsMark">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
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
										<b>Таможенные отметки к заявлению на помещение товаров под таможенную процедуру отказа в пользу государства</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="rsfacm:Customs">
						<div class="title marg-top">Уполномоченный таможенный орган</div>
					</xsl:if>
					<xsl:apply-templates select="rsfacm:Customs"/>
					<div class="title marg-top">Таможенные отметки </div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Тип решения таможенного органа</td>
								<td class="graphMain bordered">Дата проставления таможенных отметок</td>
								<td class="graphMain bordered">Должностное лицо таможенного органа</td>
							</tr>
							<xsl:for-each select="rsfacm:CustomsMark">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="rsfacm:RefusalReasons">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Причины невозможности выдачи разрешения</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="rsfacm:RefusalReasons">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CUCustomsType -->
	<xsl:template match="rsfacm:Customs">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:Code"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:OfficeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OfficeName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:CustomsCountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код государства - члена Таможенного союза</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CustomsCountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rsfacm:CustomsMarkType -->
	<xsl:template match="rsfacm:CustomsMark">
		<tr>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="rsfacm:CustomsDecision=1">
						<xsl:text>разрешение на помещение под процедуру</xsl:text>
					</xsl:when>
					<xsl:when test="rsfacm:CustomsDecision=2">
						<xsl:text>отказ в выдаче разрешения</xsl:text>
					</xsl:when>
					<xsl:when test="rsfacm:CustomsDecision=3">
						<xsl:text>иное</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="rsfacm:CustomsDecision"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="rsfacm:ComposeDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="rsfacm:CustomsPerson"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="rsfacm:CustomsPerson">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:30%">ФИО</td>
				<td class="value graphMain">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:LNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:30%">ЛНП</td>
					<td class="value graphMain">
						<xsl:value-of select="cat_ru:LNP"/>
					</td>
				</tr>
			</table>
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
