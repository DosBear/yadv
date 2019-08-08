<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rpi="urn:customs.ru:Information:CustomsDocuments:RegPreliminary:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.14.3" xmlns:cltpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonLeafTypes:5.14.3" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.14.3">
	<!-- Шаблон для типа ReqPreliminaryType -->
	<xsl:template match="rpi:ReqPreliminary">
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
										<b>Запрос сведений о зарегистрированной предварительной информации о товарах, предполагаемых к ввозу</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
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
					</xsl:if-->
					<xsl:if test="rpi:UsageCode">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Код цели представления предварительной информации</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="rpi:UsageCode">
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
							<td class="annot graphMain" style="width:50%">Планируемая дата прибытия</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rpi:ArrivalDateTime"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="rpi:EntryCheckPointDetails">
						<div class="title marg-top">Место прибытия товаров на таможенную территорию Евразийского экономического союза</div>
						<div>
							<xsl:apply-templates select="rpi:EntryCheckPointDetails">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Код вида транспортного средства по классификатору видов транспорта и транспортировки товаров</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rpi:TransportModeCode"/>
							</td>
						</tr>
					</table>
					<xsl:if test="rpi:SeaTransportDetails">
						<div class="title marg-top">Сведения о водном транспортном средстве, прибывающем на таможенную территорию Евразийского экономического союза</div>
						<div>
							<xsl:apply-templates select="rpi:SeaTransportDetails">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="rpi:AirTransportDetails">
						<div class="title marg-top">Сведения о воздушном транспортном средстве, прибывающем на таможенную территорию Евразийского экономического союза</div>
						<div>
							<xsl:apply-templates select="rpi:AirTransportDetails">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="rpi:PICarrierInfo">
						<div class="title marg-top">Сведения о перевозчике, осуществляющем ввоз товаров на таможенную территорию Евразийского экономического союза</div>
						<div>
							<xsl:apply-templates select="rpi:PICarrierInfo">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CategoryCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KATOCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:RNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:RNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:ITNReserv"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:KGINN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="cat_ru:KGINN=ИНН">
									<xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
								</xsl:when>
								<xsl:when test="cat_ru:KGINN=ПИН">
									<xsl:text>персональный идентификационный номер</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="cat_ru:KGINN"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KGOKPO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:KGOKPO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">УНН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:UNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">НЗОУ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:SocialServiceNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceCertificate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер справки об отсутствии НЗОУ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">УНП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:UNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RBIdentificationNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OGRN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OGRN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:KPP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:BIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">БИН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:BIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИИН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:IIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITN">
				<div class="title marg-top">ИТН</div>
				<div>
					<xsl:apply-templates select="cat_ru:ITN">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа rpi:AirTransportDetailsType -->
	<xsl:template match="rpi:AirTransportDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="rpi:AirRegNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регистрационный номер воздушного судна (номер борта или название)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rpi:AirRegNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rpi:AirNationalityCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код страны принадлежности транспорта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rpi:AirNationalityCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rpi:FlightDetails">
				<div class="title marg-top">Сведения о рейсе воздушного судна</div>
				<div>
					<xsl:apply-templates select="rpi:FlightDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа rpi:EntryCheckPointDetailsType -->
	<xsl:template match="rpi:EntryCheckPointDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rpi:CustomsOfficeCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="rpi:AirportCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение аэропорта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rpi:AirportCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rpi:PortCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение морского порта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rpi:PortCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rpi:BorderCheckpointCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код пункта пропуска</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rpi:BorderCheckpointCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа rpi:FlightDetailsType -->
	<xsl:template match="rpi:FlightDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор авиакомпании, присвоенный Международной ассоциацией воздушного транспорта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rpi:AirlineId"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер рейса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rpi:FlightId"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата, за которую выполняется рейс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="rpi:FilgftDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:OrganizationBaseType -->
	<xsl:template match="rpi:PICarrierInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:ShortName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationLanguage">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationLanguage"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации</div>
				<div>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<div class="title marg-top">Сведения об организации</div>
				<div>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<div class="title marg-top">Сведения об организации</div>
				<div>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<div class="title marg-top">Сведения об организации</div>
				<div>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<div class="title marg-top">Сведения об организации</div>
				<div>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа rpi:SeaTransportDetailsType -->
	<xsl:template match="rpi:SeaTransportDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование судна</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rpi:ShipName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="rpi:ShipIMONumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИМО номер судна</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rpi:ShipIMONumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rpi:ShipTypeCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код типа судна</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rpi:ShipTypeCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="rpi:ShipDetails">
				<div class="title marg-top">Сведения о национальной регистрации водного судна</div>
				<div>
					<xsl:apply-templates select="rpi:ShipDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="rpi:VoyageId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер рейса водного судна</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="rpi:VoyageId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа rpi:ShipDetailsType -->
	<xsl:template match="rpi:ShipDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код страны регистрации (государства флага) судна</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rpi:ShipCountryCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор, присвоенный водному судну при внесении в реестр</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rpi:ShipId"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Вид реестра</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="rpi:RegistryKind=1">Государственный реестр (Государственный судовой реестр)</xsl:when>
							<xsl:when test="rpi:RegistryKind=1">Международный реестр судов</xsl:when>
							<xsl:when test="rpi:RegistryKind=1">Бербоут-чартерный реестр</xsl:when>
							<xsl:when test="rpi:RegistryKind=1">Реестр маломерных судов (судовой реестр)</xsl:when>
							<xsl:otherwise><xsl:value-of select="rpi:RegistryKind"/></xsl:otherwise>
						</xsl:choose>
						
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение порта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rpi:PortCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации судна в реестре</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="rpi:RegistrationDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
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
