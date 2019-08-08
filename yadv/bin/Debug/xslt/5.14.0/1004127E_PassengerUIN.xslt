<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pcdUIN="urn:customs.ru:Information:ExchangeDocuments:PassengerUIN:5.11.0">
	<!-- Шаблон для типа PassengerUINType -->
	<xsl:template match="pcdUIN:PassengerUIN">
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
										<b>Уведомление о присвоении ПТД предварительного номера </b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="pcdUIN:ControlStartDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время присвоения номера</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="pcdUIN:ControlStartDate"/></xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(pcdUIN:ControlStartDate,12,8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pcdUIN:CustomsPerson"/>
					<xsl:if test="pcdUIN:CustomsPerson">
						<div class="title marg-top">Должностное лицо</div>
					</xsl:if>
					<xsl:apply-templates select="pcdUIN:CustomsPerson"/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">UIN</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="pcdUIN:UIN_PREF"/>-<xsl:value-of select="pcdUIN:UIN_AF"/>-<xsl:value-of select="pcdUIN:UIN_YEAR"/><xsl:value-of select="pcdUIN:UIN"/>
								<!--xsl:text></xsl:text>
								<xsl:call-template name="sum_numbers">
									<xsl:with-param name="input" select="concat(pcdUIN:UIN_AF, pcdUIN:UIN_YEAR, pcdUIN:UIN)"/>
									<xsl:with-param name="sum">0</xsl:with-param>
								</xsl:call-template-->
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="sum_numbers">
		<xsl:param name="input"/>
		<xsl:param name="sum"/>
		<xsl:variable name="cur_digit" select="substring($input,1,1)"/>
		<xsl:variable name="curr_sum" select="number($sum) + number($cur_digit)"/>
		<xsl:choose>
			<xsl:when test="string-length($input) &gt; 1">
				<xsl:variable name="curr_input" select="substring($input,2)"/>
				<xsl:call-template name="sum_numbers">
					<xsl:with-param name="input" select="$curr_input"/>
					<xsl:with-param name="sum" select="$curr_sum"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="string-length(string($curr_sum)) &gt; 1">
						<xsl:call-template name="sum_numbers">
							<xsl:with-param name="input" select="string($curr_sum)"/>
							<xsl:with-param name="sum">0</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise><xsl:value-of select="$curr_sum"/></xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="pcdUIN:CustomsPerson">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фамилия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonMiddleName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Отчество</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonPost"/>
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
