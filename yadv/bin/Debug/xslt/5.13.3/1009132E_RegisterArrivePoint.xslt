<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.13.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:aclt_ru="urn:customs.ru:ArriveCommonLeafTypes:5.13.1" xmlns:acat_ru="urn:customs.ru:ArriveCommonAggregateTypes:5.13.3" xmlns:regap="urn:customs.ru:Information:SQDocuments:RegisterArrivePoint:5.13.3">
	<!-- Шаблон для типа RegisterArrivePointType -->
	<xsl:template match="regap:RegisterArrivePoint">
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
									padding: 10mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									.marg-top
									{
									margin-top:3mm;
									}

									.marg-t1
									{
									margin-top:8mm;
									margin-bottom:3mm;
									font-family: Arial;
									font-size: 12pt;
									font-variant: small-caps;
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
										<b>Общий реестр мест прибытия (убытия) товаров</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="regap:EECEDocHeaderAddInfo">
						<div class="title marg-t1">Дополнительные технологические реквизиты электронного документа (сведений)</div>
						<xsl:apply-templates select="regap:EECEDocHeaderAddInfo"/>
					</xsl:if>
					<div class="title marg-t1">Сведения об объекте реестра мест прибытия (убытия) товаров</div>
					<table class="bordered w190">
						<xsl:for-each select="regap:RegisterArrivePointDetails">
							<tr class="title" bgcolor="silver">
								<td class="graphMain bordered">
									<xsl:text>  </xsl:text>
									<xsl:value-of select="regap:ArrivePointPADCode"/>
									<xsl:text>-</xsl:text>
									<xsl:value-of select="regap:RegisterCountryCode"/>
									<xsl:text>-</xsl:text>
									<xsl:value-of select="regap:ArriveCustomsDetails/regap:CustomsOfficeCode"/>
									<xsl:text>-</xsl:text>
									<xsl:value-of select="regap:ArriveCustomsDetails/regap:ArrivePointLocationDetails/regap:ArrivePointSequenceCode"/>
								</td>
							</tr>	
							<xsl:apply-templates select="."/>
							<tr>
								<td class="annot graphMain"><br/></td>
							</tr>	
						</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:PeriodDetailsType -->
	<xsl:template match="RUScat_ru:ValidityPeriodDetails">
		<xsl:if test="RUScat_ru:StartDateTime">
			<xsl:text>с </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:StartDateTime"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring(RUScat_ru:StartDateTime, 12, 5)"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:EndDateTime">
			<xsl:text>по </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:EndDateTime"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring(RUScat_ru:EndDateTime, 12, 5)"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="acat_ru:AddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text> Вид адреса: </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode">
			<br/>
			<xsl:text>(</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOGUID"/></xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOID"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа acat_ru:GeoCoordinateDetailsType -->
	<xsl:template match="acat_ru:GeoCoordinateDetails">
		<xsl:text>широта: </xsl:text>
		<xsl:value-of select="translate(acat_ru:LatitudeMeasure, '.', ',')"/>
		<xsl:text> долгота: </xsl:text>
		<xsl:value-of select="translate(acat_ru:LongitudeMeasure, '.', ',')"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:PeriodDetailsType -->
	<xsl:template match="acat_ru:PeriodDetails">
		<xsl:if test="RUScat_ru:StartDateTime">
			<xsl:text>с </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:StartDateTime"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring(RUScat_ru:StartDateTime, 12, 5)"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:EndDateTime">
			<xsl:text>по </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:EndDateTime"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring(RUScat_ru:EndDateTime, 12, 5)"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа acat_ru:WorkScheduleDetailsType -->
	<xsl:template match="acat_ru:WorkScheduleDetails">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="acat_ru:WorkSheduleCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="acat_ru:WorkSheduleDescriptionText"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="acat_ru:PeriodDetails">
					<xsl:apply-templates select="acat_ru:PeriodDetails"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="acat_ru:WorkTimeDetails">
					<div class="title marg-top">Подробная информация о времени работы</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<tr>
									<td class="graphMain bordered">Кодовое обозначение дня недели</td>
									<td class="graphMain bordered">Подробная информация о часах работы</td>
									<td class="graphMain bordered">Дополнительная информация о часах работы (включая перерывы и выходные дни)</td>
								</tr>
							</tr>
							<xsl:for-each select="acat_ru:WorkTimeDetails">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа acat_ru:WorkTimeDetailsType -->
	<xsl:template match="acat_ru:WorkTimeDetails">
			<td class="graphMain bordered" style="border-right: 0px">
				<xsl:choose>
					<xsl:when test="acat_ru:WeekDayCode=1">понедельник</xsl:when>
					<xsl:when test="acat_ru:WeekDayCode=2">вторник</xsl:when>
					<xsl:when test="acat_ru:WeekDayCode=3">среда</xsl:when>
					<xsl:when test="acat_ru:WeekDayCode=4">четверг</xsl:when>
					<xsl:when test="acat_ru:WeekDayCode=5">пятница</xsl:when>
					<xsl:when test="acat_ru:WeekDayCode=6">суббота</xsl:when>
					<xsl:when test="acat_ru:WeekDayCode=7">воскресенье</xsl:when>
				</xsl:choose>
			</td>
			<td class="graphMain bordered" style="border-right: 0px; border-left: 0px"><xsl:apply-templates select="acat_ru:WorkTimeHourDetails"/></td>
			<td class="graphMain bordered" style="border-left: 0px"><xsl:for-each select="acat_ru:WorkTimeHourDescriptionText"><xsl:value-of select="."/></xsl:for-each></td>
	</xsl:template>
	<!-- Шаблон для типа acat_ru:WorkTimeHourDetailsType -->
	<xsl:template match="acat_ru:WorkTimeHourDetails">
		<xsl:value-of select="substring(acat_ru:StartingTime, 1,5)"/>
		<xsl:text> - </xsl:text>
		<xsl:value-of select="substring(acat_ru:EndingTime, 1,5)"/>
	</xsl:template>
	<!-- Шаблон для типа acat_ru:ArrivalDepartureAddressDetailsType -->
	<xsl:template match="regap:ArrivalDepartureAddressDetails">
		<xsl:if test="acat_ru:AddressDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Адрес регистрации</td>
					<td class="value graphMain" style="width:60%"><xsl:apply-templates select="acat_ru:AddressDetails"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="acat_ru:GeoCoordinateDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Сведения о географических координатах объекта</td>
					<td class="value graphMain" style="width:60%"><xsl:apply-templates select="acat_ru:GeoCoordinateDetails"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа regap:ArriveCustomsDetailsType -->
	<xsl:template match="regap:ArriveCustomsDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Таможенный орган места прибытия (убытия) товаров</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="regap:CustomsOfficeCode"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="regap:CustomsOfficeName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="regap:TransportModeCode or regap:TransportModeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Вид транспортного средства</td>
					<td class="value graphMain" style="width:60%">
						<xsl:if test="regap:TransportModeCode">
							<xsl:text>(</xsl:text>
							<xsl:value-of select="regap:TransportModeCode"/>
							<xsl:text>) </xsl:text>
						</xsl:if>	
						<xsl:value-of select="regap:TransportModeName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="regap:ArrivePointLocationDetails">
			<div class="title marg-top">Сведения о местах совершения таможенных операций</div>
			<xsl:apply-templates select="regap:ArrivePointLocationDetails"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа regap:ArrivePointLocationDetailsType -->
	<xsl:template match="regap:ArrivePointLocationDetails">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Порядковый номер места прибытия (убытия) товаров в пределах одного таможенного органа</td>
				<td class="value graphMain" style="width:60%"><xsl:value-of select="regap:ArrivePointSequenceCode"/></td>
			</tr>
			<xsl:if test="regap:CustomsOperationText">
				<tr>
					<td class="annot graphMain" style="width:40%">Сведения об ограничениях по совершению таможенных операций</td>
					<td class="graphMain value" style="width:60%">
						<xsl:for-each select="regap:CustomsOperationText">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="regap:StartActivityDate or regap:EndActivityDate">
				<tr>
					<td class="annot graphMain" style="width:40%">Осуществляет деятельность в период</td>
					<td class="value graphMain" style="width:60%">
						<xsl:if test="regap:StartActivityDate">
							<xsl:text>с </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="regap:StartActivityDate"/>
							</xsl:call-template>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:if test="regap:EndActivityDate">
							<xsl:text>по </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="regap:EndActivityDate"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:apply-templates select="regap:ResourceItemStatusDetails"/>
		</table>
		<xsl:if test="regap:ArrivalDepartureAddressDetails">
			<div class="title marg-top">Сведения об адресе места совершения таможенных операций</div>
			<xsl:apply-templates select="regap:ArrivalDepartureAddressDetails"/>
		</xsl:if>
		<xsl:if test="regap:ArrivePointLocationWorkDetails">
			<div class="title marg-top">Режим работы подразделения таможенного органа</div>
			<xsl:apply-templates select="regap:ArrivePointLocationWorkDetails"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа acat_ru:ArrivePointLocationWorkDetailsType -->
	<xsl:template match="regap:ArrivePointLocationWorkDetails">
		<xsl:variable name="kol_str" select="count(acat_ru:WorkScheduleDetails/acat_ru:WorkTimeDetails)"/>
		<table class="bordered w190">
			<tr class="title">
				<td class="graphMain bordered">Время работы</td>
				<td class="graphMain bordered">График работы</td>
				<td class="graphMain bordered">Период действия события / документа</td>
				<td class="graphMain bordered" colspan="3">Подробная информация о времени работы</td>
			</tr>
			<tr>
				<td class="graphMain bordered" rowspan="{$kol_str}">
					<xsl:text>(код: </xsl:text>
					<xsl:value-of select="acat_ru:WorkTimeCode"/>
					<xsl:text>) </xsl:text>
					<xsl:value-of select="acat_ru:WorkTimeDescriptionText"/>
				</td>
				<xsl:choose>
					<xsl:when test="acat_ru:WorkScheduleDetails">
						<xsl:for-each select="acat_ru:WorkScheduleDetails[1]">
							<td class="graphMain bordered" rowspan="{count(acat_ru:WorkTimeDetails)}">
								<xsl:text>(код: </xsl:text>
								<xsl:value-of select="acat_ru:WorkSheduleCode"/>
								<xsl:text>) </xsl:text>
								<xsl:value-of select="acat_ru:WorkSheduleDescriptionText"/>
							</td>
							<td class="graphMain bordered" rowspan="{count(acat_ru:WorkTimeDetails)}">
								<xsl:apply-templates select="acat_ru:PeriodDetails"/>
							</td>
							<xsl:choose>
								<xsl:when test="acat_ru:WorkTimeDetails"><xsl:apply-templates select="acat_ru:WorkTimeDetails[1]"/></xsl:when>
								<xsl:otherwise><td class="graphMain bordered" colspan="3"/></xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<td class="graphMain bordered"/>
						<td class="graphMain bordered"/>
						<td class="graphMain bordered" colspan="3"/>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<xsl:for-each select="acat_ru:WorkScheduleDetails[1]/acat_ru:WorkTimeDetails[position() &gt; 1]">
				<tr><xsl:apply-templates select="."/></tr>
			</xsl:for-each>
			<xsl:for-each select="acat_ru:WorkScheduleDetails[position() &gt; 1]">
				<tr>
					<td class="graphMain bordered" rowspan="{count(acat_ru:WorkTimeDetails)}">
						<xsl:text>(код: </xsl:text>
						<xsl:value-of select="acat_ru:WorkSheduleCode"/>
						<xsl:text>) </xsl:text>
						<xsl:value-of select="acat_ru:WorkSheduleDescriptionText"/>
					</td>
					<td class="graphMain bordered" rowspan="{count(acat_ru:WorkTimeDetails)}">
						<xsl:apply-templates select="acat_ru:PeriodDetails"/>
					</td>
					<xsl:choose>
						<xsl:when test="acat_ru:WorkTimeDetails"><xsl:apply-templates select="acat_ru:WorkTimeDetails[1]"/></xsl:when>
						<xsl:otherwise><td class="graphMain bordered" colspan="3"/></xsl:otherwise>
					</xsl:choose>
				</tr>
				<xsl:for-each select="acat_ru:WorkTimeDetails[position() &gt; 1]">
					<tr><xsl:apply-templates select="."/></tr>
				</xsl:for-each>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:EECEDocHeaderAddInfoType -->
	<xsl:template match="regap:EECEDocHeaderAddInfo">
		<xsl:if test="RUScat_ru:InfEnvelopeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Кодовое обозначение сообщения общего процесса</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:InfEnvelopeCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Кодовое обозначение электронного документа (сведений) в соответствии с реестром структур электронных документов и сведений</td>
				<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:EDocCode"/></td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Дата и время создания электронного документа (сведений)</td>
				<td class="value graphMain" style="width:60%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="RUScat_ru:EDocDateTime"/>
					</xsl:call-template>
					<xsl:text> </xsl:text>
					<xsl:value-of select="substring(RUScat_ru:EDocDateTime, 12, 8)"/>
				</td>
			</tr>
		</table>
		<xsl:if test="RUScat_ru:LanguageCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Кодовое обозначение языка</td>
					<td class="value graphMain" style="width:60%"><xsl:value-of select="RUScat_ru:LanguageCode"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа regap:RegisterArrivePointDetailsType -->
	<xsl:template match="regap:RegisterArrivePointDetails">
		<tr>
			<td class="annot graphMain">
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:40%">Кодовое обозначение страны, предоставившей информацию</td>
						<td class="value graphMain" style="width:60%"><xsl:value-of select="regap:RegisterCountryCode"/></td>
					</tr>
					<xsl:if test="regap:ArrivePointName">
						<tr>
							<td class="annot graphMain" style="width:40%">Наименование места прибытия (убытия) товаров</td>
							<td class="value graphMain" style="width:60%"><xsl:value-of select="regap:ArrivePointName"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="regap:BorderCheckPointCode or regap:BorderCheckPointName">
						<tr>
							<td class="annot graphMain" style="width:40%">Пункт пропуска</td>
							<td class="value graphMain" style="width:60%">
								<xsl:value-of select="regap:BorderCheckPointCode"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="regap:BorderCheckPointName"/>
							</td>
						</tr>
					</xsl:if>
				</table>
				<br/>
			</td>
		</tr>
		<xsl:if test="regap:ArriveCustomsDetails">
			<tr class="title" bgcolor="#e3e3e3">
				<td class="annot graphMain">Сведения о таможенном органе, совершающем таможенные операции, в месте прибытия (убытия) товаров</td>
			</tr>
			<tr>
				<td class="annot graphMain"><xsl:apply-templates select="regap:ArriveCustomsDetails"/></td>
			</tr>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:ResourceItemStatusDetailsType -->
	<xsl:template match="regap:ResourceItemStatusDetails">
		<xsl:if test="RUScat_ru:ValidityPeriodDetails">
			<tr>
				<td class="annot graphMain" style="width:40%">Период действия записи общего ресурса</td>
				<td class="value graphMain" style="width:60%"><xsl:apply-templates select="RUScat_ru:ValidityPeriodDetails"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:UpdateDateTime">
			<tr>
				<td class="annot graphMain" style="width:40%">Дата и время обновления записи</td>
				<td class="value graphMain" style="width:60%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="RUScat_ru:UpdateDateTime"/>
					</xsl:call-template>
					<xsl:text> </xsl:text>
					<xsl:value-of select="substring(RUScat_ru:UpdateDateTime, 12, 8)"/>
				</td>
			</tr>
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
