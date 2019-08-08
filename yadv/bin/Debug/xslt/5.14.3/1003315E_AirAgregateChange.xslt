<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.14.3" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.14.3" xmlns:aach="urn:customs.ru:Information:TransportDocuments:Air:AirAgregateChange:5.14.3">
 <!-- Шаблон для типа AirAgregateChangeType -->
<xsl:template match="aach:AirAgregateChange">
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
										width: 287mm;
										margin: 10px auto;
										margin-top: 6pt;
										margin-bottom: 6pt;
										padding: 10mm 5mm 5mm 5mm;
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
										vertical-align:middle;
										}
										td.value.graphMain
										{
										vertical-align:middle;
										}
			</style>
		</head>
		<body>
			<div class="page">
				<table class="w190">
					<tbody>
						<tr>
							<td align="center" class="graphMain"><font size="4"><b>Замена агрегатов на воздушном судне</b></font></td>
						</tr>
					</tbody>
				</table>
				<xsl:if test="aach:RegistrationInfo">
					<div class="title marg-top">Сведения о составлении документа</div>
					<xsl:apply-templates select="aach:RegistrationInfo" />
				</xsl:if>
				<xsl:if test="aach:AirAgChFlightInfo">
					<div class="title marg-top">Сведения о рейсе</div>
					<xsl:apply-templates select="aach:AirAgChFlightInfo" />
				</xsl:if>
				<div class="title marg-top">Сведения о замене оборудования</div>
				<table class="bordered w190">
					<tbody>
						<tr class="title" bgcolor="silver" valign="middle">
							<td class="graphMain bordered">Аэропорт, в котором производилась замена агрегата</td>
							<td class="graphMain bordered">Порядковый номер записи</td>
							<td class="graphMain bordered">Наименование оборудования</td>
							<td class="graphMain bordered">Собственник оборудования</td>
							<td class="graphMain bordered">Партийный номер</td>
							<td class="graphMain bordered">Серийный номер</td>
							<td class="graphMain bordered">Количество</td>
							<td class="graphMain bordered">Тип материала</td>
							<td class="graphMain bordered">Сертификат</td>
							<td class="graphMain bordered">Состояние</td>
							<td class="graphMain bordered">Дата</td>
							<td class="graphMain bordered">Причина демонтажа</td>
						</tr>
						<xsl:for-each select="aach:AgregateChangeInfo">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</tbody>
				</table>
			</div>
		</body>
	</html>
</xsl:template>
<!-- Шаблон для типа aach:AgregateChangeInfoType -->
<xsl:template match="aach:AgregateChangeInfo">
	<xsl:param name="row">
		<xsl:choose>
			<xsl:when test="aach:MountedAgr and aach:DismantledAgr"><xsl:value-of select="count(aach:MountedAgr/aach:AgregateName)+count(aach:DismantledAgr/aach:AgregateName)+2"/></xsl:when>
			<xsl:when test="aach:MountedAgr or aach:DismantledAgr"><xsl:value-of select="count(//aach:AgregateName) +1"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="number('1')"/></xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<tr>
		<td class="graphMain bordered" rowspan="{$row}"><xsl:apply-templates select="aach:AirportChange" /></td>
		<xsl:choose>
			<xsl:when test="aach:MountedAgr">
				<td class="graphMain bordered" colspan="11" bgcolor="#e3e3e3">Установленное оборудование</td>
			</xsl:when>
			<xsl:when test="not(aach:MountedAgr) and aach:DismantledAgr">
				<td class="graphMain bordered" colspan="11" bgcolor="#e3e3e3">Демонтированное оборудование</td>
			</xsl:when>
			<xsl:when test="not(aach:MountedAgr) and not(aach:DismantledAgr)">
				<td class="graphMain bordered" colspan="11" bgcolor="#e3e3e3"/>
			</xsl:when>
		</xsl:choose>
	</tr>
	<xsl:if test="aach:MountedAgr">
		<xsl:for-each select="aach:MountedAgr">
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="aach:MountedAgr and aach:DismantledAgr">
		<tr>
			<td class="graphMain bordered" colspan="11" bgcolor="#e3e3e3">Демонтированное оборудование</td>
		</tr>
	</xsl:if>
	<xsl:if test="aach:DismantledAgr">
		<xsl:for-each select="aach:DismantledAgr">
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:if>
</xsl:template>
<!-- Шаблон для типа aach:AirAgChFlightInfoType -->
<xsl:template match="aach:AirAgChFlightInfo">
	<table class="w190">
		<tr>
			<td class="annot graphMain" style="width:50%">Номер рейса</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="catTrans_ru:FlightNumber" /></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Дата рейса</td>
			<td class="value graphMain" style="width:50%">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="catTrans_ru:FlightDate" />
				</xsl:call-template>
			</td>
		</tr>
		<xsl:if test="catTrans_ru:Mark">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип воздушного судна</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="catTrans_ru:Mark" /></td>
			</tr>
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Бортовой номер воздушного судна</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="catTrans_ru:AirPlaneRegNum" /></td>
		</tr>
		<xsl:if test="catTrans_ru:FlightTime">
			<tr>
				<td class="annot graphMain" style="width:50%">Время вылета рейса</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="substring(catTrans_ru:FlightTime, 1,8)" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="catTrans_ru:DepartureAirport">
			<tr>
				<td class="annot graphMain" style="width:50%">Аэропорт отправления</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="catTrans_ru:DepartureAirport" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="aach:ArrivalAirport">
			<tr>
				<td class="annot graphMain" style="width:50%">Аэропорт назначения</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="aach:ArrivalAirport" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="aach:CarrierName">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование перевозчика</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="aach:CarrierName" /></td>
			</tr>
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Двухсимвольный код  перевозчика</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="aach:CarrierCode" /></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Собственник ВС</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="aach:AirCompanyName" /></td>
		</tr>
	</table>
	<xsl:if test="aach:RoutingInfo">
		<div class="title marg-top">Информация о маршруте</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title" bgcolor="silver">
					<td class="graphMain bordered">Номер записи</td>
					<td class="graphMain bordered">Аэропорт отправления</td>
					<td class="graphMain bordered">Аэропорт назначения</td>
				</tr>
				<xsl:for-each select="aach:RoutingInfo">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:if>
</xsl:template>
<!-- Шаблон для типа aach:MountedAgrType -->
<xsl:template match="aach:MountedAgr|aach:DismantledAgr">
	<tr>
		<td class="graphMain bordered"><xsl:value-of select="aach:NumPP" /></td>
		<td class="graphMain bordered"><xsl:value-of select="aach:AgregateName" /></td>
		<td class="graphMain bordered"><xsl:value-of select="aach:AgregateOwner" /></td>
		<td class="graphMain bordered"><xsl:value-of select="aach:PartyUnitNumber" /></td>
		<td class="graphMain bordered"><xsl:value-of select="aach:SerialUnitNumber" /></td>
		<xsl:choose>
			<xsl:when test="name(.)='aach:MountedAgr'">
				<td class="graphMain bordered"><xsl:value-of select="aach:MountedAgrQuantity" /></td>
				<td class="graphMain bordered"><xsl:value-of select="aach:MaterialType" /></td>
				<td class="graphMain bordered"><xsl:value-of select="aach:Certificate" /></td>
				<td class="graphMain bordered"><xsl:value-of select="aach:AgrCondition" /></td>
				<td class="graphMain bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="aach:MountedAgrDate" />
					</xsl:call-template>
				</td>
				<td class="graphMain bordered"/>
			</xsl:when>
			<xsl:when test="name(.)='aach:DismantledAgr'">
				<td class="graphMain bordered"/>
				<td class="graphMain bordered"/>
				<td class="graphMain bordered"/>
				<td class="graphMain bordered"/>
				<td class="graphMain bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="aach:DismantledAgrDate" />
					</xsl:call-template>
				</td>
				<td class="graphMain bordered"><xsl:value-of select="aach:Reason" /></td>
			</xsl:when>
		</xsl:choose>
	</tr>
</xsl:template>
<!-- Шаблон для типа aach:RegistrationInfoType -->
<xsl:template match="aach:RegistrationInfo">
	<table class="w190">
		<xsl:if test="aach:LNG">
			<tr>
				<td class="annot graphMain" style="width:50%">Код языка документа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="aach:LNG" /></td>
			</tr>
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Дата составления документа</td>
			<td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="aach:DocumentDate" /></xsl:call-template></td>
		</tr>
		<xsl:if test="aach:PlaceCreateDoc">
			<tr>
				<td class="annot graphMain" style="width:50%">Место составления документа</td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="aach:PlaceCreateDoc" /></td>
			</tr>
		</xsl:if>
		<tr>
			<td class="annot graphMain" style="width:50%">Серийный номер документа</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="aach:DocumentNumber" /></td>
		</tr>
	</table>
</xsl:template>
<!-- Шаблон для типа catTrans_ru:AirportType -->
<xsl:template match="aach:RIAirportFrom|aach:RIAirportTo|aach:AirportChange|catTrans_ru:DepartureAirport|aach:PlaceCreateDoc|aach:ArrivalAirport">
	<xsl:if test="catTrans_ru:Name">
		<xsl:value-of select="catTrans_ru:Name" />
		<xsl:text> </xsl:text>
	</xsl:if>
	<xsl:text>(Код ИАТА: </xsl:text>
	<xsl:value-of select="catTrans_ru:IATACode" />
	<xsl:text>)</xsl:text>
</xsl:template>
<!-- Шаблон для типа aach:RoutingInfoType -->
<xsl:template match="aach:RoutingInfo">
	<tr>
		<td class="graphMain bordered" width="10%"><xsl:value-of select="translate(aach:NumPP, '.', ',')" /></td>
		<td class="graphMain bordered" width="45%"><xsl:apply-templates select="aach:RIAirportFrom" /></td>
		<td class="graphMain bordered" width="45%"><xsl:apply-templates select="aach:RIAirportTo" /></td></tr>
</xsl:template>
<!-- Шаблон для преобразования даты -->
<xsl:template name="russian_date">
	<xsl:param name="dateIn" />
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,6,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,1,4)" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>