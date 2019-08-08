<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:nofa="urn:customs.ru:Information:TransportDocuments:Railway:NotifFactArrival:5.14.3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>&#160;<xsl:value-of select="substring($dateIn,12,8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="nofa:NotifFactArrival">
		<html>
			<head>
				<title>Уведомление</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
					
                    body {
						background: #cccccc;
                    }

                    div.page {
                        width: 180mm;
                        margin: auto;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        /*padding-left: 20mm;*/
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }
                    
                    table {
						width: 100%;
						margin-top: 15px;
                    }
                    
                    th {
						font-size: 13pt;
                    }
                   </style>
			</head>
			<body>
				<div class="page">
					<h2 align="center">Уведомление о фактической подаче железнодорожного состава на ЖДПП (<xsl:choose>
							<xsl:when test="nofa:DocumentSign='0'">Убытие</xsl:when>
							<xsl:otherwise>Прибытие</xsl:otherwise>
						</xsl:choose>)</h2>
					<xsl:if test="nofa:URN">
						<p>
						Номер пакета электронных документов
						<xsl:value-of select="nofa:URN"/>
						</p>
					</xsl:if>
					<p>
						<xsl:choose>
							<xsl:when test="nofa:DocumentSign='0'">Дата убытия </xsl:when>
							<xsl:otherwise>Дата прибытия </xsl:otherwise>
						</xsl:choose>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="nofa:NotifDate"/>
						</xsl:call-template>
					</p>
					<table>
						<tbody>
							<xsl:if test="nofa:Customs/cat_ru:OfficeName">
								<tr align="left">
									<th colspan="2">Таможенный орган</th>
								</tr>
								<tr>
									<td style="width:40%">Наименование таможенного органа</td>
									<td>
										<xsl:value-of select="nofa:Customs/cat_ru:OfficeName"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>Код таможенного органа</td>
								<td>
									<xsl:value-of select="nofa:Customs/cat_ru:Code"/>
								</td>
							</tr>
							<xsl:if test="nofa:Customs/cat_ru:CustomsCountryCode">
								<tr>
									<td>Код государства члена Таможенного союза</td>
									<td>
										<xsl:value-of select="nofa:Customs/cat_ru:CustomsCountryCode"/>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr align="left">
								<th colspan="2">Станция отправления</th>
							</tr>
							<tr>
								<td style="width:40%">Наименование станции</td>
								<td>
									<xsl:value-of select="nofa:DepartureStation/nofa:RailwayStationName"/>
								</td>
							</tr>
							<tr>
								<td>Код станции</td>
								<td>
									<xsl:value-of select="nofa:DepartureStation/nofa:RailwayStationCode"/>
								</td>
							</tr>
							<xsl:if test="nofa:DepartureStation/nofa:RailwayCode">
								<tr>
									<td>Код железной дороги</td>
									<td>
										<xsl:value-of select="nofa:DepartureStation/nofa:RailwayCode"/>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr align="left">
								<th colspan="2">Станция назначения</th>
							</tr>
							<tr>
								<td style="width:40%">Наименование станции</td>
								<td>
									<xsl:value-of select="nofa:DestinationStation/nofa:RailwayStationName"/>
								</td>
							</tr>
							<tr>
								<td>Код станции</td>
								<td>
									<xsl:value-of select="nofa:DestinationStation/nofa:RailwayStationCode"/>
								</td>
							</tr>
							<xsl:if test="nofa:DestinationStation/nofa:RailwayCode">
								<tr>
									<td>Код железной дороги.</td>
									<td>
										<xsl:value-of select="nofa:DestinationStation/nofa:RailwayCode"/>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<xsl:if test="nofa:Transport">
						<table>
							<tbody align="left">
								<th style="width:40%">Сведения о транспортных средствах</th>
								<xsl:for-each select="nofa:Transport">
									<tr>
										<xsl:apply-templates select="."/>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="nofa:Seal">
						<table>
							<tbody align="left">
								<th colspan="2">Сведения о средствах идентификации</th>
								<xsl:for-each select="nofa:Seal">
									<tr>
										<td style="width:40%">Тип средства идентификации</td>
										<td>
											<xsl:choose>
												<xsl:when test="nofa:IdentKind='1'">Пломба</xsl:when>
												<xsl:when test="nofa:IdentKind='2'">Печать</xsl:when>
												<xsl:otherwise>Иное</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td style="width:40%">Номер наложенного средста идентификации</td>
										<td>
											<xsl:value-of select="nofa:IdentNumber"/>
										</td>
									</tr>
									<xsl:if test="nofa:Quantity">
										<tr>
											<td style="width:40%">Количество</td>
											<td>
												<xsl:value-of select="nofa:Quantity"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="nofa:IdentDesc">
										<tr>
											<td style="width:40%">Примечание</td>
											<td>
												<xsl:value-of select="nofa:IdentDesc"/>
											</td>
										</tr>
									</xsl:if>
									<tr/>
									<tr/>
									<tr/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="nofa:TD">
						<table>
							<tbody align="left">
								<th style="width:40%">Регистрационный номер транзитной декларации</th>
								<td>
									<xsl:apply-templates select="nofa:TD"/>
								</td>
								<br/>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="nofa:Transport">
		<table>
			<tbody align="left">
				<xsl:if test="cat_ru:VIN">
					<tr>
						<td style="width:40%">Номер шасси </td>
						<td>
							<xsl:value-of select="cat_ru:VIN"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="cat_ru:TransportKindCode">
					<tr>
						<td style="width:40%">Код типа ТС </td>
						<td>
							<xsl:value-of select="cat_ru:TransportKindCode"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="cat_ru:TransportMarkCode">
					<tr>
						<td style="width:40%">Код марки ТС </td>
						<td>
							<xsl:value-of select="cat_ru:TransportMarkCode"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="cat_ru:TransportIdentifier">
					<tr>
						<td style="width:40%">Идентификатор ТС</td>
						<td>
							<xsl:value-of select="cat_ru:TransportIdentifier"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="cat_ru:TransportMeansNationalityCode">
					<tr>
						<td style="width:40%">Код страны принадл. ТС</td>
						<td>
							<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="cat_ru:ActiveTransportIdentifier">
					<tr>
						<td style="width:40%">Идентификатор активного ТС</td>
						<td>
							<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="cat_ru:TransportRegNumber">
					<tr>
						<td style="width:40%">№ свид. о рег. ТС</td>
						<td>
							<xsl:value-of select="cat_ru:TransportRegNumber"/>
						</td>
					</tr>
				</xsl:if>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="nofa:TD">
		<xsl:value-of select="cat_ru:CustomsCode"/> / 
	<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/> / 
	<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
</xsl:stylesheet>
