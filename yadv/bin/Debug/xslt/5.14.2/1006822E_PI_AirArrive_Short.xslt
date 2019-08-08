<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:piairs="urn:customs.ru:Information:PriorInformation:PI_AirArrive_Short:5.12.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.12.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа PI_AirArrive_ShortType -->
	<xsl:template match="piairs:PI_AirArrive_Short">
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
										<b>Уведомления о планируемых рейсах</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<!--tr class="title">
								<td class="graphMain bordered">уникальный идентификационный номер перевозки</td>
								<td class="graphMain bordered">Код и наименование таможенного органа</td>
								<td class="graphMain bordered">Прилет/Вылет</td>
								<td class="graphMain bordered">Сведения о транспортном средстве</td>
								<td class="graphMain bordered">Сведения о маршруте воздушного судна</td>
							</tr-->
							<xsl:for-each select="piairs:PI_AirArriveList">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="piairs:Customs">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа piairs:AirportInfoType -->
	<xsl:template match="piairs:DepartureAirport">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа piairs:CountryInfoType -->
	<xsl:template match="piairs:DepartureCountry">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа piairs:AirportInfoType -->
	<xsl:template match="piairs:DestinationAirport">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа piairs:CountryInfoType -->
	<xsl:template match="piairs:DestinationCountry">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа piairs:AirportInfoType -->
	<xsl:template match="piairs:Interim">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="piairs:AirportName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="piairs:IATACode"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа piairs:PI_AirArriveListType -->
	<xsl:template match="piairs:PI_AirArriveList">
		<tr>
			<td colspan="3">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</td>
		</tr>
		<tr class="title" bgcolor="silver">
			<td class="graphMain bordered">Код и наименование таможенного органа</td>
			<td class="graphMain bordered">Прилет/Вылет</td>
			<td class="graphMain bordered">Сведения о транспортном средстве</td>
		</tr>
		<tr>
			<!--td class="graphMain bordered">
				<xsl:value-of select="piairs:UINP"/>
			</td-->
			<td class="graphMain bordered">
				<xsl:apply-templates select="piairs:Customs"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="piairs:RoutingSign=1">
						<xsl:text>прилет</xsl:text>
					</xsl:when>
					<xsl:when test="piairs:RoutingSign=0">
						<xsl:text>вылет</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="piairs:RoutingSign"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="piairs:TransportMeans"/>
			</td>
			<!--td class="graphMain bordered">
				<xsl:apply-templates select="piairs:RoutingInfo"/>
			</td-->
		</tr>
		<tr>
			<td colspan="3" class="graphMain">
				<xsl:apply-templates select="piairs:RoutingInfo"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="piairs:ArrivalDateTime|piairs:PlannedDateTime|piairs:DepartureDateTime">
		<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring(.,12,8)"/>
	</xsl:template>
	<!-- Шаблон для типа piairs:RoutingInfoType -->
	<xsl:template match="piairs:RoutingInfo">
		<xsl:if test="piairs:ArrivalDateTime">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время прибытия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="piairs:ArrivalDateTime"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="piairs:PlannedDateTime">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Планируемые дата и время обратного въезда.выезда</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="piairs:PlannedDateTime"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="piairs:DepartureDateTime">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время убытия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="piairs:DepartureDateTime"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="piairs:DepartureAirport"/>
		<xsl:if test="piairs:DepartureAirport">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Аэропорт отправления</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="piairs:DepartureAirport"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="piairs:Interim">
			<div class="title marg-top">Следующий аэропорт</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered" style="width:70%">Название </td>
						<td class="graphMain bordered" style="width:30%">Код ИАТА</td>
					</tr>
					<xsl:for-each select="piairs:Interim">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="piairs:DestinationCountry"/>
		<xsl:if test="piairs:DestinationCountry">
			<!--div class="title marg-top">Cтрана назначения</div-->
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Cтрана назначения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="piairs:DestinationCountry"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="piairs:DepartureCountry"/>
		<xsl:if test="piairs:DepartureCountry">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Cтрана отправления</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="piairs:DepartureCountry"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="piairs:DestinationAirport"/>
		<xsl:if test="piairs:DestinationAirport">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Аэропорт назначения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="piairs:DestinationAirport"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа piairs:TransportMeansType -->
	<xsl:template match="piairs:TransportMeans">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
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
