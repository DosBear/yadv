<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:chr="urn:customs.ru:Information:ExchangeDocuments:ChangeRoute:5.11.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ChangeRouteType -->
	<xsl:template match="chr:ChangeRoute">
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
										<b>Заявление на изменение маршрута</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="chr:InitialRoute"/>
					<xsl:if test="chr:InitialRoute">
						<div class="title marg-top">Исходный маршрут</div>
					</xsl:if>
					<xsl:apply-templates select="chr:InitialRoute"/>
					<xsl:if test="chr:NewRoute"/>
					<xsl:if test="chr:NewRoute">
						<div class="title marg-top">Новый маршрут</div>
					</xsl:if>
					<xsl:apply-templates select="chr:NewRoute"/>
					<xsl:if test="chr:Reason">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Причины изменения маршрута</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="chr:Reason"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="chr:TDTSNumber">
						<div class="title marg-top">Регистрационный номер ТДТС</div>
					</xsl:if>
					<xsl:apply-templates select="chr:TDTSNumber"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа chr:DestinationType -->
	<xsl:template match="chr:Destination">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="chr:DestinationPlace"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="chr:DestinationCountry"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="chr:DestinationCountryCode"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа chr:FlightInfoType -->
	<xsl:template match="chr:FlightInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер рейса.</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="chr:FlightNumber"/>
				</td>
			</tr>
		</table>
		<xsl:if test="chr:FlightDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата рейса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="chr:FlightDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="chr:FlightTime">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Время вылета рейса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="substring(chr:FlightTime, 1,8)"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа chr:RouteType -->
	<xsl:template match="chr:InitialRoute">
		<div class="title marg-top">Место назначения</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered">Пункт назначения</td>
					<td class="graphMain bordered">Страна назначения. Краткое название страны в соответствии с классификатором стран мира</td>
					<td class="graphMain bordered">Страна назначения. Буквенный код страны в соответствии с классификатором стран мира</td>
				</tr>
				<xsl:for-each select="chr:Destination">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
		<xsl:if test="chr:FlightInfo"/>
		<xsl:if test="chr:FlightInfo">
			<div class="title marg-top">Сведения о рейсе</div>
		</xsl:if>
		<xsl:apply-templates select="chr:FlightInfo"/>
	</xsl:template>
	<!-- Шаблон для типа chr:RouteType -->
	<xsl:template match="chr:NewRoute">
		<div class="title marg-top">Место назначения</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered">Пункт назначения</td>
					<td class="graphMain bordered">Страна назначения. Краткое название страны в соответствии с классификатором стран мира</td>
					<td class="graphMain bordered">Страна назначения. Буквенный код страны в соответствии с классификатором стран мира</td>
				</tr>
				<xsl:for-each select="chr:Destination">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
		<xsl:if test="chr:FlightInfo"/>
		<xsl:if test="chr:FlightInfo">
			<div class="title marg-top">Сведения о рейсе</div>
		</xsl:if>
		<xsl:apply-templates select="chr:FlightInfo"/>
	</xsl:template>
	<!-- Шаблон для типа chr:ETDTSNumberType -->
	<xsl:template match="chr:TDTSNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код вида транспорта</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="chr:TransportModeCode"/>
				</td>
			</tr>
		</table>
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
