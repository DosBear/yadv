<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fdb="urn:customs.ru:Information:CustomsDocuments:Feedback:5.13.1">
	<!-- Шаблон для типа FeedbackType -->
	<xsl:template match="fdb:Feedback">
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
										<b>Оценка степени удовлетворенности декларанта<br/>работой таможенных органов</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<xsl:if test="fdb:TypeOperation">
							<tr>
								<td class="annot graphMain" style="width:50%">Тип оцениваемой таможенной операции</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="fdb:TypeOperation=1"><xsl:text>декларирование</xsl:text></xsl:when>
										<xsl:when test="fdb:TypeOperation=9"><xsl:text>иное</xsl:text></xsl:when>
										<xsl:otherwise><xsl:value-of select="fdb:TypeOperation"/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="fdb:DTNumber">
							<tr>
								<td class="annot graphMain" style="width:50%">Регистрационный номер ДТ</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="fdb:DTNumber"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="fdb:Value">
							<tr>
								<td class="annot graphMain" style="width:50%">Оценка по 5 балльной шкале</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(fdb:Value, '.', ',')"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="fdb:Rejection">
							<tr>
								<td class="annot graphMain" style="width:50%">Причины отказа от проведения оценки</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="fdb:Rejection"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="fdb:Comment">
							<tr>
								<td class="annot graphMain" style="width:50%">Комментарии</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="fdb:Comment"/></td>
							</tr>
						</xsl:if>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="fdb:DTNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date"><xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/></xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="gtd_date">
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
</xsl:stylesheet>
