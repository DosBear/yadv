<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:pia="urn:customs.ru:Information:CustomsDocuments:PIAirInformationCU:5.12.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0">
	<!-- Шаблон для типа PIAirInformationCUType -->
	<xsl:template match="pia:PIAirInformationCU">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									/*white-space: nowrap;*/
									}

									div.page {
									/*width: 190mm;*/
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 8mm;
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
										<b>Предварительная информация о товарах, ввозимых на таможенную территорию Евразийского экономического союза воздушным транспортом</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:if test="pia:LanguageCode">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Код языка заполнения документа в соответствии с международным стандартом ISO 639-1</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="pia:LanguageCode"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время убытия из аэропорта, предшествующего аэропорту места прибытия</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="pia:PrevPointDepartureDateTime"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(pia:PrevPointDepartureDateTime,12,8)"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Планируемые (расчетные) дата и  время прибытия в аэропорт пункта пропуска через таможенную границу Евразийского экономического союза</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="pia:CheckPointArriveDateTime"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(pia:CheckPointArriveDateTime,12,8)"/>
							</td>
						</tr>
					</table>
					<xsl:if test="pia:AircraftInformation">
						<div class="title marg-top">Сведения о регистрации и национальной принадлежности воздушного судна</div>
					</xsl:if>
					<xsl:apply-templates select="pia:AircraftInformation"/>
					<xsl:if test="pia:AircraftOperator">
						<div class="title marg-top">Сведения об эксплуатанте воздушного судна</div>
					</xsl:if>
					<xsl:apply-templates select="pia:AircraftOperator"/>
					<xsl:if test="pia:FlightInformation">
						<div class="title marg-top">Сведения о рейсе отправления</div>
					</xsl:if>
					<xsl:apply-templates select="pia:FlightInformation"/>
					<xsl:if test="pia:AircraftRoute">
						<div class="title marg-top">Сведения о маршруте полета</div>
					</xsl:if>
					<xsl:apply-templates select="pia:AircraftRoute"/>
					<xsl:if test="pia:ProhibitedGoods">
						<div class="title marg-top">Сведения о наличии (отсутствии) на борту воздушного судна товаров, ввоз которых на таможенную территорию Евразийского экономического союза запрещен или ограничен</div>
					</xsl:if>
					<xsl:apply-templates select="pia:ProhibitedGoods"/>
					<xsl:if test="pia:WeaponInfo">
						<div class="title marg-top">Сведения о наличии (отсутствии) на борту воздушного судна оружия и (или) боеприпасов</div>
					</xsl:if>
					<xsl:apply-templates select="pia:WeaponInfo"/>
					<xsl:if test="pia:NarcoticInfo">
						<div class="title marg-top">Сведения о наличии (отсутствии) на борту воздушного судна лекарственных средств, в составе которых содержатся наркотические, сильнодействующие средства, психотропные и ядовитые вещества</div>
					</xsl:if>
					<xsl:apply-templates select="pia:NarcoticInfo"/>
					<xsl:if test="pia:PIAIR_GoodsShipment">
						<div class="title marg-top">Сведения о перевозке товаров</div>
					</xsl:if>
					<xsl:apply-templates select="pia:PIAIR_GoodsShipment"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CategoryCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:KATOCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:RNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITNReserv">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ITNReserv"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGINN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGOKPO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:BIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:ITN"/>
	</xsl:template>
	<!-- Шаблон для типа pia:AircraftInformationType -->
	<xsl:template match="pia:AircraftInformation">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный знак (номер) воздушного судна</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pia:AircraftRegNumber"/>
				</td>
			</tr>
		</table>
		<xsl:if test="pia:AircraftCountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение страны регистрации воздушного судна</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pia:AircraftCountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pia:AircraftOperatorType -->
	<xsl:template match="pia:AircraftOperator">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование эксплуатанта воздушного судна</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pia:AircraftOperatorName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="pia:AirlineCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код авиакомпании - эксплуатанта воздушного судна</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pia:AirlineCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pia:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение страны, в которой зарегистрирован эксплуатант воздушного судна</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pia:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pia:UITNCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификационный таможенный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pia:UITNCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pia:AircraftRouteType -->
	<xsl:template match="pia:AircraftRoute">
		<div class="title marg-top">Сведения о пункте маршрута</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered" style="width:5%;">Порядковый номер пункта маршрута </td>
					<td class="graphMain bordered">Сведения об аэропорте</td>
				</tr>
				<xsl:for-each select="pia:RoutePointAirport">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа pia:AWBNumberType -->
	<xsl:template match="pia:AWBNumber">
		<xsl:value-of select="pia:AirlineNumberCode"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="pia:DocumentNumber"/>
	</xsl:template>
	<!-- Шаблон для типа pia:PIAirOrganizationType -->
	<xsl:template match="pia:Consignee|pia:Consignor">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<br/>
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="pia:UITNCode">
			<xsl:text> УИТН </xsl:text>
			<xsl:value-of select="pia:UITNCode"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pia:ConsignmentGTDIDType -->
	<xsl:template match="pia:ConsignmentGTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date"><xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/></xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="pia:DangerousDocument">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>		
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pia:DangerousGoodsDetailsType -->
	<xsl:template match="pia:DangerousGoodsDetails">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="pia:GoodsDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pia:DangerousGoodsCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="pia:DangerousDocument">
					<xsl:for-each select="pia:DangerousDocument">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа pia:FlightInformationType -->
	<xsl:template match="pia:FlightInformation">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер рейса</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pia:AirlineCode"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="pia:FlightNumber"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата рейса по расписанию</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="pia:FlightDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа pia:AirportInformationType -->
	<xsl:template match="pia:LoadingAirport">
		<xsl:if test="pia:IATAAirportCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код ИАТА аэропорта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pia:IATAAirportCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование аэропорта</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pia:AirportName"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Название географического пункта</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="pia:PlaceName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="pia:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение страны, в которой находится аэропорт</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pia:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pia:DangerousCargoType -->
	<xsl:template match="pia:NarcoticInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак присутствия товара на борту воздушного судна</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="pia:GoodsFlag=0 or pia:GoodsFlag='false'">
							<xsl:text>отсутствует</xsl:text>
						</xsl:when>
						<xsl:when test="pia:GoodsFlag=1 or pia:GoodsFlag='true'">
							<xsl:text>присутствует</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="pia:GoodsFlag"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="pia:DangerousGoodsDetails">
			<div class="title marg-top">Сведения о наркотических веществах</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Описание товара</td>
						<td class="graphMain bordered">Код товара в соответствии с ТН ВЭД ЕАЭС</td>
						<td class="graphMain bordered">Сведения о документе, устанавливающем запреты и ограничения на ввоз товаров</td>
					</tr>
					<xsl:for-each select="pia:DangerousGoodsDetails">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pia:PIGoodsPackingInformationType -->
	<xsl:template match="pia:PackingInformation">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:PackingCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:PakingQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pia:PackageMark"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа pia:PIAIR_ConsignmentType -->
	<xsl:template match="pia:PIAIR_Consignment">
		<xsl:variable name="PIGoodsItemCount" select="count(pia:PIGoodsItem)"/>
		<tr>
			<td class="graphMain bordered" rowspan="{$PIGoodsItemCount}">
				<xsl:apply-templates select="pia:AWBNumber"/>
			</td>
			<td class="graphMain bordered" rowspan="{$PIGoodsItemCount}">
				<xsl:if test="pia:Consignee">
					<xsl:apply-templates select="pia:Consignee"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered" rowspan="{$PIGoodsItemCount}">
				<xsl:if test="pia:Consignor">
					<xsl:apply-templates select="pia:Consignor"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered" rowspan="{$PIGoodsItemCount}">
				<xsl:if test="pia:LoadingAirport">
					<xsl:apply-templates select="pia:LoadingAirport"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered" rowspan="{$PIGoodsItemCount}">
				<xsl:if test="pia:UnloadingAirport">
					<xsl:apply-templates select="pia:UnloadingAirport"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered" rowspan="{$PIGoodsItemCount}">
				<xsl:for-each select="pia:ConsignmentGTDID">
					<xsl:apply-templates select="."/>
					<xsl:if test="position()!=last()"><br/></xsl:if>
				</xsl:for-each>
			</td>
			<xsl:choose>
				<xsl:when test="$PIGoodsItemCount &gt; 0">
					<xsl:apply-templates select="pia:PIGoodsItem[1]"/>
				</xsl:when>
				<xsl:otherwise>
					<td class="graphMain bordered"></td>
					<td class="graphMain bordered"></td>
					<td class="graphMain bordered"></td>
					<td class="graphMain bordered"></td>
					<td class="graphMain bordered"></td>
					<!--td class="graphMain bordered"></td>
					<td class="graphMain bordered"></td-->
				</xsl:otherwise>
			</xsl:choose>
		</tr>
		<xsl:for-each select="pia:PIGoodsItem[ position() != 1]">
			<tr>
				<xsl:apply-templates select="."/>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа pia:PIAIR_GoodsShipmentType -->
	<xsl:template match="pia:PIAIR_GoodsShipment">
		<!--div class="title marg-top">Сведения о товарной партии</div-->
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered" rowspan="2">Номер грузовой авиа- накладной</td>
					<td class="graphMain bordered" rowspan="2">Получатель</td>
					<td class="graphMain bordered" rowspan="2">Отправитель</td>
					<td class="graphMain bordered" rowspan="2">Аэропорт (пункт) погрузки</td>
					<td class="graphMain bordered" rowspan="2">Аэропорт (пункт) разгрузки</td>
					<td class="graphMain bordered" rowspan="2">Сведения о номере ДТ</td>
					<td class="graphMain bordered" colspan="5">Детализированные сведения о товаре</td>
				</tr>
				<tr class="title">
					<td class="graphMain bordered">Номер товара в ПИ</td>
					<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
					<td class="graphMain bordered">Описание товара</td>
					<td class="graphMain bordered">Вес товара брутто (кг)</td>
					<td class="graphMain bordered">Вес товара нетто (кг)</td>
					<!--td class="graphMain bordered">Объем, занимаемый товаром без указания единиц измерения</td>
					<td class="graphMain bordered">Код единицы измерения объема</td-->
				</tr>
				<xsl:for-each select="pia:PIAIR_Consignment">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа pia:PIAWGoodsPackagingType -->
	<xsl:template match="pia:PIAWGoodsPackaging">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Общее количество грузовых мест, занятых товаром</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(pia:PakageQuantity, '.', ',')"/>
				</td>
			</tr>
		</table>
		<xsl:if test="pia:PakageTypeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код наличия упаковки товара: 0 - Без упаковки; 1 - С упаковкой; 2 - Без упаковки в оборудованных емкостях транспортного средства</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="pia:PakageTypeCode=0">
								<xsl:text>Без упаковки</xsl:text>
							</xsl:when>
							<xsl:when test="pia:PakageTypeCode=1">
								<xsl:text>С упаковкой</xsl:text>
							</xsl:when>
							<xsl:when test="pia:PakageTypeCode=2">
								<xsl:text>Без упаковки в оборудованных емкостях транспортного средства</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="pia:PakageTypeCode"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pia:PakagePartQuantity">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Количество грузовых мест, частично занятых товаром</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(pia:PakagePartQuantity, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pia:RBCargoKind">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вид грузовых мест</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pia:RBCargoKind"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pia:PackageCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида груза в соответствии с классификатором видов груза, упаковки и упаковочных материалов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pia:PackageCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="pia:PackingInformation">
			<div class="title marg-top">Сведения о виде груза и упаковке товара</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Код вида упаковки товаров в соответствии с классификатором видов груза, упаковки и упаковочных материалов</td>
						<td class="graphMain bordered">Количество упаковок</td>
						<td class="graphMain bordered">Маркировка грузовых мест</td>
					</tr>
					<xsl:for-each select="pia:PackingInformation">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pia:PIGoodsItemType -->
	<xsl:template match="pia:PIGoodsItem">
		<td class="graphMain bordered" style="width:50%">
			<xsl:value-of select="pia:GoodsNumeric"/>
		</td>
		<td class="bordered graphMain" style="width:50%">
			<xsl:value-of select="pia:GoodsTNVEDCode"/>
		</td>
		<td class="graphMain bordered" style="width:50%">
			<xsl:for-each select="pia:GoodsDescription">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</td>
		<td class="bordered graphMain" style="width:50%">
			<xsl:value-of select="translate(pia:GrossWeightQuantity, '.', ',')"/>
		</td>
		<td class="bordered graphMain" style="width:50%">
			<xsl:value-of select="translate(pia:NetWeightQuantity, '.', ',')"/>
		</td>
		<!--td class="bordered graphMain" style="width:50%">
			<xsl:value-of select="translate(pia:GoodsVolume, '.', ',')"/>
		</td>
		<td class="bordered graphMain" style="width:50%">
			<xsl:value-of select="pia:VolumeUnitQualifierCode"/>
		</td-->
	</xsl:template>
	<!-- Шаблон для типа pia:DangerousCargoType -->
	<xsl:template match="pia:ProhibitedGoods">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак присутствия товара на борту воздушного судна:</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="pia:GoodsFlag=0 or pia:GoodsFlag='false'">
							<xsl:text>отсутствует</xsl:text>
						</xsl:when>
						<xsl:when test="pia:GoodsFlag=1 or pia:GoodsFlag='true'">
							<xsl:text>присутствует</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="pia:GoodsFlag"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="pia:DangerousGoodsDetails">
			<div class="title marg-top">Сведения о товарах, запрещенных или ограниченных к перемещению</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Описание товара</td>
						<td class="graphMain bordered">Код товара в соответствии с ТН ВЭД ЕАЭС</td>
						<td class="graphMain bordered">Сведения о документе, устанавливающем запреты и ограничения на ввоз товаров</td>
					</tr>
					<xsl:for-each select="pia:DangerousGoodsDetails">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pia:RoutePointType -->
	<xsl:template match="pia:RoutePointAirport">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(pia:PointNumber, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="pia:RouteAirport"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа pia:UnloadingAirportType -->
	<xsl:template match="pia:UnloadingAirport|pia:LoadingAirport|pia:RouteAirport">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">; </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа pia:DangerousCargoType -->
	<xsl:template match="pia:WeaponInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Признак присутствия товара на борту воздушного судна:</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="pia:GoodsFlag=0 or pia:GoodsFlag='false'">
							<xsl:text>отсутствует</xsl:text>
						</xsl:when>
						<xsl:when test="pia:GoodsFlag=1 or pia:GoodsFlag='true'">
							<xsl:text>присутствует</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="pia:GoodsFlag"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="pia:DangerousGoodsDetails">
			<div class="title marg-top">Сведения об оружии и боеприпасах</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Описание товара</td>
						<td class="graphMain bordered">Код товара в соответствии с ТН ВЭД ЕАЭС</td>
						<td class="graphMain bordered">Сведения о документе, устанавливающем запреты и ограничения на ввоз товаров</td>
					</tr>
					<xsl:for-each select="pia:DangerousGoodsDetails">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="gtd_date">
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
