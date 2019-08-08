<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.12.0" xmlns:air_chl="urn:customs.ru:Information:TransportDocuments:AirChangeList:5.13.4">
	<!-- Шаблон для типа AirChangeListType -->
	<xsl:template match="air_chl:AirChangeList">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
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
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



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
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Лист изменений между предварительным и фактическим пакетом документов по перевозке воздушным транспортом</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="air_chl:AircraftChange">
						<div class="title marg-top">Изменения произошедшие в воздушном судне</div>
						<div>
							<xsl:apply-templates select="air_chl:AircraftChange">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="air_chl:ConsignmentChange">
						<div class="title marg-top">Изменения, произошедшие в товарных партиях</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Уникальный идентификатор товарной партии</td>
									<td class="graphMain bordered">Тип изменения товарной партии</td>
									<td class="graphMain bordered">Дополнительная информация</td>
								</tr>
								<xsl:for-each select="air_chl:ConsignmentChange">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="air_chl:GoodsChange">
						<div class="title marg-top">Изменения, произошедшие в товарах</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Уникальный идентификатор товара</td>
									<td class="graphMain bordered">Тип изменения товара</td>
									<td class="graphMain bordered">Дополнительная информация</td>
								</tr>
								<xsl:for-each select="air_chl:GoodsChange">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа air_chl:AircraftChangeType -->
	<xsl:template match="air_chl:AircraftChange">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="air_chl:FlightInfo">
				<div class="title marg-top">Сведения о рейсе</div>
				<div>
					<xsl:apply-templates select="air_chl:FlightInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="air_chl:Info">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дополнительная информация</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="air_chl:Info">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Произошло изменение в списке пассажиров:</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="air_chl:PassangerChanges='true' or air_chl:PassangerChanges=1">
								<xsl:text>Да</xsl:text>
							</xsl:when>
							<xsl:when test="air_chl:PassangerChanges='false' or air_chl:PassangerChanges=0">
								<xsl:text>Нет</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="air_chl:PassangerChanges"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Произошло изменение в маршруте:</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="air_chl:RouteChanges='true' or air_chl:RouteChanges=1">
								<xsl:text>Да</xsl:text>
							</xsl:when>
							<xsl:when test="air_chl:RouteChanges='false' or air_chl:RouteChanges=0">
								<xsl:text>Нет</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="air_chl:RouteChanges"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Произошло изменение в списке экипажа:</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="air_chl:CrewChanges='true' or air_chl:CrewChanges=1">
								<xsl:text>Да</xsl:text>
							</xsl:when>
							<xsl:when test="air_chl:CrewChanges='false' or air_chl:CrewChanges=0">
								<xsl:text>Нет</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="air_chl:CrewChanges"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Произошло изменение в списке бортовых припасов:</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="air_chl:StoreChanges='true' or air_chl:StoreChanges=1">
								<xsl:text>Да</xsl:text>
							</xsl:when>
							<xsl:when test="air_chl:StoreChanges='false' or air_chl:StoreChanges=0">
								<xsl:text>Нет</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="air_chl:StoreChanges"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Произошло изменение в списке запрещенных/ограниченных ко ввозу товарах:</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="air_chl:ProhibitedChanges='true' or air_chl:ProhibitedChanges=1">
								<xsl:text>Да</xsl:text>
							</xsl:when>
							<xsl:when test="air_chl:ProhibitedChanges='false' or air_chl:ProhibitedChanges=0">
								<xsl:text>Нет</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="air_chl:ProhibitedChanges"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Произошло изменение в списке разрешительных документов:</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="air_chl:DocChanges='true' or air_chl:DocChanges=1">
								<xsl:text>Да</xsl:text>
							</xsl:when>
							<xsl:when test="air_chl:DocChanges='false' or air_chl:DocChanges=0">
								<xsl:text>Нет</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="air_chl:DocChanges"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа air_chl:AirportInfoType -->
	<xsl:template match="air_chl:ArrivalAirport">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="air_chl:AirportName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Название аэропорта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="air_chl:AirportName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код ИАТА</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="air_chl:IATACode"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа air_chl:ConsignmentChangeType -->
	<xsl:template match="air_chl:ConsignmentChange">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор товарной партии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="air_chl:ConsignmentId"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Тип изменения товарной партии</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="air_chl:ChangeType=0">
								<xsl:text>Объект был добавлен</xsl:text>
							</xsl:when>
							<xsl:when test="air_chl:ChangeType=1">
								<xsl:text>Объект был исправлен</xsl:text>
							</xsl:when>
							<xsl:when test="air_chl:ChangeType=2">
								<xsl:text>Объект был удален</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="air_chl:ChangeType"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="air_chl:Info">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дополнительная информация</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="air_chl:Info">
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
	</xsl:template>
	<!-- Шаблон для типа air_chl:AirportInfoType -->
	<xsl:template match="air_chl:DepatureAirport">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="air_chl:AirportName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Название аэропорта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="air_chl:AirportName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код ИАТА</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="air_chl:IATACode"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа air_chl:FlightInfoType -->
	<xsl:template match="air_chl:FlightInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер рейса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="air_chl:FlightNumber"/>
					</td>
				</tr>
			</table>
			<xsl:if test="air_chl:Mark">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Марка воздушного судна</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="air_chl:Mark"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="air_chl:AirPlaneRegNum">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регистрационный номер воздушного судна</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="air_chl:AirPlaneRegNum"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата рейса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="air_chl:FlightDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
			<xsl:if test="air_chl:FlightTime">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Время вылета рейса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="substring(air_chl:FlightTime, 1,8)"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="air_chl:DepatureAirport">
				<div class="title marg-top">Аэропорт вылета</div>
				<div>
					<xsl:apply-templates select="air_chl:DepatureAirport">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="air_chl:ArrivalAirport">
				<div class="title marg-top">Аэропорт прилета</div>
				<div>
					<xsl:apply-templates select="air_chl:ArrivalAirport">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа air_chl:GoodsChangeType -->
	<xsl:template match="air_chl:GoodsChange">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="air_chl:GoodsId"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Тип изменения товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="air_chl:ChangeType=0">
								<xsl:text>Объект был добавлен</xsl:text>
							</xsl:when>
							<xsl:when test="air_chl:ChangeType=1">
								<xsl:text>Объект был исправлен</xsl:text>
							</xsl:when>
							<xsl:when test="air_chl:ChangeType=2">
								<xsl:text>Объект был удален</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="air_chl:ChangeType"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="air_chl:Info">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дополнительная информация</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="air_chl:Info">
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
