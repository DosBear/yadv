<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:passm="urn:customs.ru:Information:TransportDocuments:Air:PassengerManifest:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="passm:PassengerManifest">
		<html>
			<head>
				<title>Пассажирская ведомость / PASSENGER MANIFEST</title>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<style type="text/css">
					body {
					text-align: center;
					background: #cccccc;
					}
					div.page {
					width: 210mm;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding:	10mm;
					padding-left:	10mm;
					background: #ffffff;
					border: solid .5pt #000000;
					}
					td {
					font-family:Courier;
					vertical-align: top;
					overflow: hidden;
					}
					.normal{
					font-weight: normal;
					font-family:Courier;
					}
					.bold{
					font-weight: bold;
					font-family:Courier;
					}
					.italic{
					font-style: italic;
					font-family:Courier;
					}
					.graph {
					font-family: Arial;
					font-size: 8pt;
					}
					.graphMain {
					font-family: Arial;
					font-size: 9pt;
					font-weight: bold;
					}
					.graphLittle {
					font-family: Arial;
					font-size: 7pt;
					}
					.graph8Bold {
					font-family: Arial;
					font-size: 8pt;
					font-weight: bold;
					}
					.bordered {
					border-bottom: solid 1pt #000000;
					font-weight: bold;
					}
					.bordered2 {
					border-bottom: solid 1pt #000000;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:if test="passm:TransportKind = 2">
						<table border="0" style="width:190mm">
							<tbody>
								<tr>
									<td align="left" colspan="3">
										<xsl:value-of select="passm:ShipName"/>
									</td>
									<td align="right" colspan="2">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="passm:ManifestDate"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td align="left" colspan="5">
										<br/>PORT: <xsl:value-of select="passm:Port"/>
									</td>
								</tr>
								<tr>
									<td align="left" colspan="5">
										AGENT: <xsl:value-of select="passm:Agent"/>
									</td>
								</tr>
								<xsl:if test="passm:AirNationalityCode">
									<tr>
										<td align="left" colspan="4">
											
												AIR NATIONALITY CODE/Код страны: <xsl:value-of select="passm:AirNationalityCode"/>
											
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="passm:TotalCrewNumber">
									<tr>
										<td align="left" colspan="4">
											
												TOTAL CREW NUMBER/Количество членов экипажа: <xsl:value-of select="passm:TotalCrewNumber"/>
											
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="passm:RoutingInfo">
									<tr>
										<td align="center" colspan="4">
											<span style="font-weight:bold;  ">
												<br/>
												ROUTING INFO/Информация о маршруте
											</span>
										</td>
									</tr>
									<tr>
										<td align="left" colspan="4">
											<table width="100%">
												<tr>
													<td align="center"></td>
													<td align="center" class="bordered">CARRIER</td>
													<td align="center" class="bordered">CODE</td>
													<td align="center" class="bordered">FLIGHT</td>
													<td align="center" class="bordered">DATE</td>
													<td align="center" class="bordered">AIRPORT</td>
													<td align="center" class="bordered">IATA CODE</td>
												</tr>
												<xsl:for-each select="passm:RoutingInfo">
													<tr>
														<td align="center">
															<xsl:value-of select="catTrans_ru:NumPP"/>
														</td>
														<td align="center">
															<xsl:value-of select="catTrans_ru:CarrierName"/>
														</td>
														<td align="center">
															<xsl:value-of select="catTrans_ru:CarrierCode"/>
														</td>
														<td align="center">
															<xsl:value-of select="catTrans_ru:FlightNumber"/>
														</td>
														<td align="center">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="catTrans_ru:FlightDate" />
															</xsl:call-template>
														</td>
														<td align="center">
															<xsl:value-of select="catTrans_ru:Airport/catTrans_ru:Name"/>
														</td>
														<td align="center">
															<xsl:value-of select="catTrans_ru:Airport/catTrans_ru:IATACode"/>
														</td>
													</tr>
												</xsl:for-each>
											</table>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td align="center" colspan="5">
										<span style="font-weight:bold;  ">
											<br/>
											PASSENGER LIST<br/>
										</span>
									</td>
								</tr>
								<tr>
									<td align="center">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="bordered">
										NAME-SURNAME
									</td>
									<td align="center" class="bordered">
										DATE OF BIRTH / PLACE
									</td>
									<td align="center" class="bordered">
										NATIONALITY
									</td>
									<td align="center" class="bordered">
										PASSPORT N0
									</td>
									<td align="center" class="bordered">
										LUGGAGE TAG
									</td>
								</tr>
								<xsl:for-each select="passm:PassengerInfo">
									<tr>
										<td align="center">
											<xsl:value-of select="position()"/>
										</td>
										<td align="center">
											<xsl:value-of select="passm:PersonName"/>
										</td>
										<td align="center">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="passm:BirthDate"/>
											</xsl:call-template> /
											<xsl:value-of select="passm:BirthPlace"/>
										</td>
										<td align="center">
											<xsl:value-of select="passm:Nationality"/>
										</td>
										<td align="center">
											<xsl:value-of select="passm:IdentityCard/RUScat_ru:IdentityCardSeries"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="passm:IdentityCard/RUScat_ru:IdentityCardNumber"/>
										</td>
										<td>
											<xsl:for-each select="passm:LuggageTag">
												<xsl:value-of select="passm:LuggageNumber"/>
												<br/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td align="left" colspan="6">
										<span class="graph">LUGGAGE PLACES / Общее количество мест багажа: </span>
										<span class="graph">
											<xsl:value-of select="passm:LuggagePlaces"/>
										</span>
									</td>
								</tr>
								<tr>
									<td align="left" colspan="6">
										<span class="graph">LUGGAGE WEIGHT / Общий вес багажа: </span>
										<span class="graph">
											<xsl:value-of select="passm:LuggageWeight"/>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="passm:TransportKind = 1">
						<table border="0" style="width:190mm">
							<tbody>
								<tr>
									<td align="center" colspan="4">
										AEROFLOT<br/> PASSENGER MANIFEST
									</td>
								</tr>
								<tr>
									<td align="center" class="bordered2" colspan="4">
										FLIGHT / DATE - <xsl:value-of select="passm:FlightInfo/catTrans_ru:FlightNumber"/>
										<xsl:text> </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="passm:FlightInfo/catTrans_ru:FlightDate"/>
										</xsl:call-template>
										<xsl:text> </xsl:text>
										AC REG - <xsl:value-of select="passm:FlightInfo/catTrans_ru:Mark"/>
									</td>
								</tr>
								<tr>
									<td align="left" colspan="4">
										<xsl:value-of select="passm:FlightInfo/catTrans_ru:DepartureAirport/catTrans_ru:Name"/>
									</td>
								</tr>
								<tr>
									<td align="left" colspan="4">
										<xsl:value-of select="passm:DestinationAirport/catTrans_ru:Name"/>
									</td>
								</tr>
								<tr>
									<td align="left" colspan="4">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<xsl:if test="passm:AirNationalityCode">
									<tr>
										<td align="left" colspan="4">
											<span class="graph">
												AIR NATIONALITY CODE/Код страны: <xsl:value-of select="passm:AirNationalityCode"/>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="passm:TotalCrewNumber">
									<tr>
										<td align="left" colspan="4">
											<span class="graph">
												TOTAL CREW NUMBER/Количество членов экипажа: <xsl:value-of select="passm:TotalCrewNumber"/>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="passm:RoutingInfo">
									<tr>
										<td align="left" colspan="4">
											<span class="graph">
												ROUTING INFO/Информация о маршруте
											</span>
										</td>
									</tr>
									<tr>
										<td align="left" colspan="4">
											<table style="width:100%">
												<tr>
													<td align="center">NUMBER</td>
													<td align="center">CARRIER</td>
													<td align="center">CODE</td>
													<td align="center">FLIGHT</td>
													<td align="center">DATE</td>
													<td align="center">AIRPORT</td>
													<td align="center">IATA CODE</td>
												</tr>
											<xsl:for-each select="passm:RoutingInfo">
												<tr>
													<td align="center">
														<xsl:value-of select="catTrans_ru:NumPP"/>
													</td>
													<td align="center">
														<xsl:value-of select="catTrans_ru:CarrierName"/>
													</td>
													<td align="center">
														<xsl:value-of select="catTrans_ru:CarrierCode"/>
													</td>
													<td align="center">
														<xsl:value-of select="catTrans_ru:FlightNumber"/>
													</td>
													<td align="center">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="catTrans_ru:FlightDate" />
														</xsl:call-template>
													</td>
													<td align="center">
														<xsl:value-of select="catTrans_ru:Airport/catTrans_ru:Name"/>
													</td>
													<td align="center">
														<xsl:value-of select="catTrans_ru:Airport/catTrans_ru:IATACode"/>
													</td>
												</tr>
											</xsl:for-each>
											</table>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td align="left">
										<span class="graph">FACT PASS. NUM/ Фактическое кол-во пассажиров </span>
										<span class="graph">
											<xsl:value-of select="passm:FactPassNumber"/>
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<table style="font-size:9pt;table-layout:fixed;width:19cm">
											<tr>
												<td align="center" width="28.3pt">
													SEAT
												</td>
												<td align="center" width="28.3pt">
													SEX
												</td>
												<td align="left" width="140pt">
													NAME
												</td>
												<td align="center" width="65pt">
													NATIONAL/<br/>DOC N0
												</td>
												<td align="center" width="77pt">
													LUGGAGE<br/>TAG
												</td>
												<td align="center" width="40pt">
													PLACES
												</td>
												<td align="center" width="47pt">
													GROSS<br/>WEIGHT
												</td>
												<td align="center" width="95pt">
													AIRPORT<br/>DEP./DEST.
												</td>
												<td align="center" width="95pt">
													PORT<br/>DEP./DEST.
												</td>
												<td align="center" width="47pt">
													DISABLED
												</td>
												<td align="center" width="47pt">
													TRANSFER<br/>LUGGAGE
												</td>
												<td align="center" width="47pt">
													SPECIAL<br/>LUGGAGE
												</td>
											</tr>
											<xsl:for-each select="passm:PassengerInfo">
												<xsl:variable name="bg">
													<xsl:choose>
														<xsl:when test="position() mod 2 != 0">#EAE9E9</xsl:when>
														<xsl:otherwise>white</xsl:otherwise>
													</xsl:choose>
												</xsl:variable>
												<tr style="background-color:{$bg}">
													<td align="center">
														<xsl:value-of select="passm:SeatNumber"/>
													</td>
													<td align="center">
														<xsl:value-of select="passm:Sex"/>
													</td>
													<td align="left">
														<xsl:value-of select="passm:PersonName"/>
													</td>
													<td align="center">
														<xsl:value-of select="passm:Nationality"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="passm:IdentityCard/RUScat_ru:IdentityCardSeries"/>
														<xsl:value-of select="passm:IdentityCard/RUScat_ru:IdentityCardNumber"/>
													</td>
													<td align="center">
														<xsl:for-each select="passm:LuggageTag/passm:LuggageNumber">
															<xsl:value-of select="."/><br/>
														</xsl:for-each>
													</td>
													<td align="center"><xsl:value-of select="passm:PlacesQuantity"/></td>
													<td align="center"><xsl:value-of select="passm:GrossWeightQuantity"/></td>
													<td><xsl:value-of select="passm:DepartureAirport/catTrans_ru:Name"/>/<br/><xsl:value-of select="passm:DestinationAirport/catTrans_ru:Name"/></td>
													<td><xsl:value-of select="passm:DeparturePort"/>/<br/><xsl:value-of select="passm:DestinationPort"/></td>
													<td align="center">
														<xsl:if test="passm:TransferInvalid='true' or passm:TransferInvalid='t' or passm:TransferInvalid='1'">X</xsl:if>
													</td>
													<td align="center">
														<xsl:if test="passm:TransferLuggage='true' or passm:TransferLuggage='t' or passm:TransferLuggage='1'">X</xsl:if>
													</td>
													<td align="center">
														<xsl:if test="passm:SpecialLuggage='true' or passm:SpecialLuggage='t' or passm:SpecialLuggage='1'">X</xsl:if>
													</td>
												</tr>
											</xsl:for-each>
										</table>
									</td>
								</tr>
								<tr>
									<td align="left">
										<span class="graph">LUGGAGE PLACES / Общее количество мест багажа </span>
										<span class="graph">
											<xsl:value-of select="passm:LuggagePlaces"/>
										</span>
									</td>
								</tr>
								<tr>
									<td align="left">
										<span class="graph">LUGGAGE WEIGHT / Общий вес багажа </span>
										<span class="graph">
											<xsl:value-of select="passm:LuggageWeight"/>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
