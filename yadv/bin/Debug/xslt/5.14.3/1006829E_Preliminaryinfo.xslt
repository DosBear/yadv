<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pri="urn:customs.ru:Information:CustomsDocuments:Preliminaryinfo:5.14.3" xmlns:catpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonAggregateTypes:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateTimeIn,12,5)"/>
	</xsl:template>
	<xsl:template match="pri:Preliminaryinfo">
		<html>
			<head>
				<title>Сведения о зарегистрированной предварительной информации о товарах, предполагаемых к ввозу</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
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


				div.album_page {
				width: 297mm;
				margin: auto;
				margin-top: 6pt;
				margin-bottom: 6pt;
				padding: 10mm;
				padding-left: 20mm;
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
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  vertical-align:bottom;
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
				<div class="album_page">
					<table width="100%">
						<tbody>
							<tr>
								<td align="center" class="annot graphMain title">
									<font size="5">
										<xsl:choose>
											<xsl:when test="pri:DocType='0'">
												<xsl:text>Информация о регистрации Предварительной информации</xsl:text>
											</xsl:when>
											<xsl:when test="pri:DocType='2'">
												<xsl:text>Перечень Предварительной информации по запросу</xsl:text>
											</xsl:when>
										</xsl:choose>
									</font>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<xsl:for-each select="pri:PreliminaryType">
								<tr>
									<td class="annot graphMain" bgcolor="#D3D3D3">
										<table>
											<tbody>
												<tr align="left">
													<td>
														<xsl:text>№ </xsl:text>
														<span class="value">
															<b>
																<xsl:value-of select="position()"/>
															</b>
														</span>
													</td>
													<td align="right">
														<xsl:text>Статус: </xsl:text>
														<span class="value">
															<b>
																<xsl:choose>
																	<xsl:when test="pri:Status='1'">
																		<xsl:text>Зарегистрирован</xsl:text>
																	</xsl:when>
																	<xsl:when test="pri:Status='2'">
																		<xsl:text>Аннулирован</xsl:text>
																	</xsl:when>
																</xsl:choose>
															</b>
														</span>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%" class="annot graphMain">
											<tbody>
												<tr>
													<td class="bordered" width="25%">
														<xsl:text>Регистрационный номер ПИ: </xsl:text>
														<br/>
														<span class="value">
															<xsl:apply-templates select="pri:RegNumber" mode="PI"/>
														</span>
													</td>
													<td class="bordered" width="25%">
														<xsl:text>Системный идентификатор ПИ: </xsl:text>
														<br/>
														<span class="value">
															<xsl:value-of select="pri:PI_RegID"/>
														</span>
													</td>
													<td class="bordered" width="25%">
														<xsl:text>Код цели представления ПИ: </xsl:text>
														<br/>
														<span class="value">
															<xsl:for-each select="pri:UsageCode">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">
																	<xsl:text>, </xsl:text>
																</xsl:if>
															</xsl:for-each>
														</span>
													</td>
													<td class="bordered" width="25%">
														<xsl:text>Планируемые дата и время прибытия: </xsl:text>
														<br/>
														<span class="value">
															<xsl:call-template name="date_time">
																<xsl:with-param select="pri:ArrivalDateTime" name="dateTimeIn"/>
															</xsl:call-template>
														</span>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<xsl:if test="pri:EntryCheckPointDetails">
									<tr>
										<td>
											<table class="annot graphMain">
												<tbody>
													<tr class="annot graphMain">
														<td colspan="4" align="center">
															<b>
																<font size="4">
																	<xsl:text>Место прибытия товаров на таможенную территорию Евразийского экономического союза</xsl:text>
																</font>
															</b>
														</td>
													</tr>
													<xsl:for-each select="pri:EntryCheckPointDetails">
														<tr>
															<td class="bordered" width="25%">
																<xsl:text>Код таможенного органа: </xsl:text>
																<br/>
																<span class="value">
																	<xsl:value-of select="pri:CustomsOfficeCode"/>
																</span>
															</td>
															<td class="bordered" width="25%">
																<xsl:text>Кодовое обозначение аэропорта: </xsl:text>
																<br/>
																<span class="value">
																	<xsl:value-of select="pri:AirportCode"/>
																</span>
															</td>
															<td class="bordered" width="25%">
																<xsl:text>Кодовое обозначение морского порта: </xsl:text>
																<br/>
																<span class="value">
																	<xsl:value-of select="pri:PortCode"/>
																</span>
															</td>
															<td class="bordered" width="25%">
																<xsl:text>Наименование и код пункта пропуска: </xsl:text>
																<br/>
																<span class="value">
																	<xsl:value-of select="pri:BorderCheckpointName"/>
																	<xsl:if test="pri:BorderCheckpointCode">
																		<xsl:if test="pri:BorderCheckpointName">
																			<xsl:text> (</xsl:text>
																		</xsl:if>
																		<xsl:value-of select="pri:BorderCheckpointCode"/>
																		<xsl:if test="pri:BorderCheckpointName">
																			<xsl:text>)</xsl:text>
																		</xsl:if>
																	</xsl:if>
																</span>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td align="right" class="annot graphMain">
										<xsl:text>Код вида транспортного средства по классификатору видов транспорта и транспортировки товаров:  </xsl:text>
										<span class="value">
											<xsl:value-of select="pri:TransportModeCode"/>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="center" class="title">
										<font size="4">
											<xsl:choose>
												<xsl:when test="pri:SeaTransportDetails">
													<xsl:text>Сведения о водном транспортном средстве, прибывающем на таможенную территорию Евразийского экономического союза</xsl:text>
													<xsl:apply-templates select="pri:SeaTransportDetails"/>
												</xsl:when>
												<xsl:when test="pri:AirTransportDetails">
													<xsl:text>Сведения о воздушном транспортном средстве, прибывающем на таможенную территорию Евразийского экономического союза</xsl:text>
													<xsl:apply-templates select="pri:AirTransportDetails"/>
												</xsl:when>
											</xsl:choose>
										</font>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<xsl:if test="pri:PICarrierInfo">
									<tr align="center" class="title">
										<td>
											<font size="4">
												<xsl:text>Сведения о перевозчике, осуществляющем ввоз товаров на таможенную территорию Евразийского экономического союза</xsl:text>
											</font>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="pri:PICarrierInfo"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<br/>
										<br/>
										<br/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="pri:SeaTransportDetails">
		<table class="annot graphMain">
			<tbody>
				<tr>
					<td width="25%" class="bordered">Наименование судна: <br/>
						<span class="value">
							<xsl:value-of select="pri:ShipName"/>
						</span>
					</td>
					<td width="25%" class="bordered">Код страны принадлежности:<br/>
						<span class="value">
							<xsl:value-of select="pri:NationalityCode"/>
						</span>
					</td>
					<td width="25%" class="bordered">ИМО номер судна: <br/>
						<span class="value">
							<xsl:value-of select="pri:ShipIMONumber"/>
						</span>
					</td>
					<td width="25%" class="bordered">Тип судна: <br/>
						<span class="value">
							<xsl:value-of select="pri:ShipType"/>
						</span>
					</td>
				</tr>
				<tr>
					<td class="bordered">Код типа судна:<br/>
						<span class="value">
							<xsl:value-of select="pri:ShipTypeCode"/>
						</span>
					</td>
					<td class="bordered">Код страны регистрации (государства флага) судна:<br/>
						<span class="value">
							<xsl:value-of select="pri:ShipDetails/pri:ShipCountryCode"/>
						</span>
					</td>
					<td class="bordered">Идентификатор, присвоенный водному судну при внесении в реестр:<br/>
						<span class="value">
							<xsl:value-of select="pri:ShipDetails/pri:ShipId"/>
						</span>
					</td>
					<td class="bordered">Вид реестра:<br/>
						<span class="value">
							<xsl:choose>
								<xsl:when test="pri:ShipDetails/pri:RegistryKind='1'">
									<xsl:text>Государственный реестр (Государственный судовой реестр)</xsl:text>
								</xsl:when>
								<xsl:when test="pri:ShipDetails/pri:RegistryKind='2'">
									<xsl:text>Международный реестр судов</xsl:text>
								</xsl:when>
								<xsl:when test="pri:ShipDetails/pri:RegistryKind='3'">
									<xsl:text>Бербоут-чартерный реестр</xsl:text>
								</xsl:when>
								<xsl:when test="pri:ShipDetails/pri:RegistryKind='4'">
									<xsl:text>Реестр маломерных судов (судовой реестр)</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="pri:ShipDetails/pri:RegistryKind"/>
								</xsl:otherwise>
							</xsl:choose>
						</span>
					</td>
				</tr>
				<tr>
					<td class="bordered">Кодовое обозначение порта:<br/>
						<span class="value">
							<xsl:value-of select="pri:ShipDetails/pri:PortCode"/>
						</span>
					</td>
					<td class="bordered">Дата регистрации судна:<br/>
						<span class="value">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="pri:ShipDetails/pri:RegistrationDate"/>
							</xsl:call-template>
						</span>
					</td>
					<td colspan="2" class="bordered">Номер рейса водного судна:<br/>
						<span class="value">
							<xsl:value-of select="pri:VoyageId"/>
						</span>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="pri:PICarrierInfo">
		<table class="annot graphMain">
			<tbody>
				<xsl:if test="cat_ru:OrganizationName">
					<tr>
						<td class="bordered" colspan="4">Наименование организации / ФИО физ лица: <span style="width:5mm"/>
							<span class="value">
								<xsl:value-of select="cat_ru:OrganizationName"/>
								<xsl:if test="cat_ru:ShortName">
									<xsl:if test="cat_ru:OrganizationName">
										<xsl:text> (</xsl:text>
									</xsl:if>
									<xsl:value-of select="cat_ru:ShortName"/>
									<xsl:if test="cat_ru:OrganizationName">
										<xsl:text>)</xsl:text>
									</xsl:if>
								</xsl:if>
							</span>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
					<tr>
						<td class="bordered" colspan="4">
							<xsl:text>Сведения об организации: </xsl:text>
							<span style="width:5mm"/>
							<span class="value">
								<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
								<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
								<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
								<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
								<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
							</span>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="RUScat_ru:BusinessEntityTypeCode or RUScat_ru:BusinessEntityTypeName or RUScat_ru:UITN or RUScat_ru:PersonId">
					<tr>
						<td width="25%" class="bordered">
							<xsl:text>ОПФ:</xsl:text>
							<br/>
							<span class="value">
								<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
							</span>
						</td>
						<td width="25%" class="bordered">
							<xsl:text>Код ОПФ:</xsl:text>
							<br/>
							<span class="value">
								<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
							</span>
						</td>
						<td width="25%" class="bordered">
							<xsl:text>УИТН:</xsl:text>
							<br/>
							<span class="value">
								<xsl:apply-templates select="RUScat_ru:UITN"/>
							</span>
						</td>
						<td width="25%" class="bordered">
							<xsl:text>Уникальный идентификатор физического лица:</xsl:text>
							<br/>
							<span class="value">
								<xsl:value-of select="RUScat_ru:PersonId"/>
							</span>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="RUScat_ru:IdentityCard">
					<xsl:for-each select="RUScat_ru:IdentityCard">
						<tr>
							<td width="25%" class="bordered">
								<xsl:text>Документ, удостоверяющий личность:</xsl:text>
								<br/>
								<span class="value">
									<xsl:value-of select="RUScat_ru:IdentityCardName"/>
									<xsl:if test="RUScat_ru:IdentityCardName">
										<xsl:if test="RUScat_ru:IdentityCardCode">
											<xsl:text> (</xsl:text>
										</xsl:if>
										<xsl:value-of select="RUScat_ru:IdentityCardCode"/>
										<xsl:if test="RUScat_ru:FullIdentityCardName">
											<xsl:text> - </xsl:text>
											<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
										</xsl:if>
										<xsl:if test="RUScat_ru:IdentityCardCode">
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:if>
								</span>
							</td>
							<td width="25%" class="bordered">
								<xsl:text>Серия:</xsl:text>
								<br/>
								<span class="value">
									<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
								</span>
							</td>
							<td width="25%" class="bordered">
								<xsl:text>Номер:</xsl:text>
								<br/>
								<span class="value">
									<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
								</span>
							</td>
							<td width="25%" class="bordered">
								<xsl:text>Выдан:</xsl:text>
								<br/>
								<span class="value">
									<xsl:call-template name="russian_date">
										<xsl:with-param select="RUScat_ru:IdentityCardDate" name="dateIn"/>
									</xsl:call-template>
									<xsl:text>&#160;</xsl:text>
									<xsl:value-of select="RUScat_ru:OrganizationName"/>
									<xsl:if test="RUScat_ru:IssuerCode">
										<xsl:if test="RUScat_ru:OrganizationName|RUScat_ru:IdentityCardDate">
											<xsl:text> (</xsl:text>
										</xsl:if>
										<xsl:value-of select="RUScat_ru:IssuerCode"/>
										<xsl:if test="RUScat_ru:OrganizationName|RUScat_ru:IdentityCardDate">
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:if>
									<xsl:text>&#160;</xsl:text>
									<xsl:value-of select="RUScat_ru:CountryCode"/>
								</span>
							</td>
						</tr>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<xsl:if test="RUScat_ru:AddressKindCode or RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">
						<tr>
							<td class="bordered" width="25%">
						Вид адреса:<br/>
								<span class="value">
									<xsl:choose>
										<xsl:when test="RUScat_ru:AddressKindCode='1'">
											<xsl:text>Адрес регистрации</xsl:text>
										</xsl:when>
										<xsl:when test="RUScat_ru:AddressKindCode='2'">
											<xsl:text>Фактический адрес</xsl:text>
										</xsl:when>
										<xsl:when test="RUScat_ru:AddressKindCode='3'">
											<xsl:text>Почтовый арес</xsl:text>
										</xsl:when>
									</xsl:choose>
								</span>
							</td>
							<td class="bordered" width="25%">
						Почтовый индекс <br/>
								<span class="value">
									<xsl:value-of select="RUScat_ru:PostalCode"/>
								</span>
							</td>
							<td class="bordered" width="25%">
						Буквенный код страны <br/>
								<span class="value">
									<xsl:value-of select="RUScat_ru:CountryCode"/>
								</span>
							</td>
							<td class="bordered" width="25%">
						Краткое наименование страны <span style="width:5mm"/>
								<span class="value">
									<xsl:value-of select="RUScat_ru:CounryName"/>
								</span>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="RUScat_ru:District or RUScat_ru:Region or RUScat_ru:City or RUScat_ru:Town or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">
						<tr>
							<td class="bordered" width="25%">Область (регион, штат, провинция и т.п.)<br/>
								<span class="value">
									<xsl:value-of select="RUScat_ru:Region"/>
								</span>
							</td>
							<td class="bordered" width="25%">Район<br/>
								<span class="value">
									<xsl:value-of select="RUScat_ru:District"/>
								</span>
							</td>
							<td class="bordered" width="25%">Населенный пункт / Город<br/>
								<span class="value">
									<xsl:value-of select="RUScat_ru:Town"/>
									<xsl:if test="RUScat_ru:City">
										<xsl:if test="RUScat_ru:Town"/>
										<xsl:text> / </xsl:text>
									</xsl:if>
									<xsl:value-of select="RUScat_ru:City"/>
								</span>
							</td>
							<td class="bordered" width="25%">Улица, номер дома, номер офиса <br/>
								<span class="value">
									<xsl:for-each select="RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="RUScat_ru:OKPOID or RUScat_ru:OKATOCode or RUScat_ru:KLADR or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
					<tr>
						<td class="bordered" width="25%">ОКТМО / ОКАТО:<br/>
							<span class="value">
								<xsl:value-of select="RUScat_ru:OKTMO"/>
							</span>
							<xsl:if test="RUScat_ru:OKTMO and RUScat_ru:OKATO"> / </xsl:if>
							<span class="value">
								<xsl:value-of select="RUScat_ru:OKATO"/>
							</span>
						</td>
						<td class="bordered" width="25%">Код КЛАДР:<br/>
							<span class="value">
								<xsl:value-of select="RUScat_ru:KLADR"/>
							</span>
						</td>
						<td class="bordered" width="25%">Код единицы административно-территориального деления:<br/>
							<span class="value">
								<xsl:value-of select="RUScat_ru:TerritoryCode"/>
							</span>
						</td>
						<td class="bordered" width="25%">Номер абонентского ящика:<br/>
							<span class="value">
								<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
							</span>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="RUScat_ru:CommunicationDetails">
					<tr>
						<td class="bordered" width="25%">№ телефона:<br/>
							<span class="value">
								<xsl:for-each select="RUScat_ru:CommunicationDetails/cat_ru:Phone">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</span>
						</td>
						<td class="bordered" width="25%">№ факса:<br/>
							<span class="value">
								<xsl:value-of select="RUScat_ru:CommunicationDetails/cat_ru:Fax"/>
							</span>
						</td>
						<td class="bordered" width="25%">№ телекса: <br/>
							<span class="value">
								<xsl:value-of select="RUScat_ru:CommunicationDetails/cat_ru:Telex"/>
							</span>
						</td>
						<td class="bordered" width="25%">Эл. почта:<br/>
							<span class="value">
								<xsl:for-each select="RUScat_ru:CommunicationDetails/cat_ru:E_mail">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</span>
						</td>
					</tr>
				</xsl:if>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="pri:AirTransportDetails">
		<table class="annot graphMain">
			<tbody>
				<tr>
					<td width="25%" class="bordered">Регистрационный номер воздушного судна (номер борта или название): <br/>
						<span class="value">
							<xsl:value-of select="pri:AirRegNumber"/>
						</span>
						<xsl:if test="pri:AirNationalityCode">
							<br/>Код страны принадлежности:<span class="value">
								<xsl:value-of select="pri:AirNationalityCode"/>
							</span>
						</xsl:if>
					</td>
					<td width="25%" class="bordered">Дата, за которую выполняется рейс: <span class="value">
							<xsl:call-template name="russian_date">
								<xsl:with-param select="pri:FlightDetails/pri:FilgftDate" name="dateIn"/>
							</xsl:call-template>
						</span>
					</td>
					<td width="25%" class="bordered">Код авиакомпании ИАТА:<br/>
						<span class="value">
							<xsl:value-of select="pri:FlightDetails/pri:AirlineId"/>
						</span>
					</td>
					<td width="25%" class="bordered">Номер рейса:<br/>
						<span class="value">
							<xsl:value-of select="pri:FlightDetails/pri:FlightId"/>
						</span>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures| RUScat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures| RUScat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures| RUScat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures| RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures| RUScat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:text>код объекта: </xsl:text>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<xsl:text> код справочника: </xsl:text>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="RUScat_ru:IdentityCardCode or RUScat_ru:IdentityCardName">
			<xsl:value-of select="RUScat_ru:IdentityCardCode"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="RUScat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			<xsl:text>серия </xsl:text>
			<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RUSIdentityCardDate or RUScat_ru:OrganizationName or RUScat_ru:IssuerCode">выдан </xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:IssuerCode">
			<xsl:value-of select="RUScat_ru:OrganizationName"/>
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/>
			</xsl:if>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId"> выдан <xsl:value-of select="RUScat_ru:AuthorityId"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text> Вид адреса - </xsl:text>
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
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="PI" match="*">
		<xsl:value-of select="catpi_ru:CountryCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="catpi_ru:Date"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="catpi_ru:PINumber"/>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
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