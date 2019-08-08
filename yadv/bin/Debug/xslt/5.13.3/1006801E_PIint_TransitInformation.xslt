<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonAggregateTypes:5.13.3" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:pint="urn:customs.ru:Information:PriorInformation:PIint_TransitInformation:5.13.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа PIint_TransitInformationType -->
	<xsl:template match="pint:PIint_TransitInformation">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div
					{
					/*white-space: nowrap;*/
					}

					div.page {
					width: 270mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
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
					font-size: 10pt;
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
										<b>Уведомление о подаче предварительных сведений. Внутренний формат</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
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
					<xsl:if test="pint:PI_URN">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор товарной партии</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="pint:PI_URN"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата составления документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="pint:DocumentDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="pint:BrokerDocNumber">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Номер документа в АС брокера</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="pint:BrokerDocNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pint:BorderCustomsCode">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Код таможни на границе</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="pint:BorderCustomsCode"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pint:BorderCustomsName">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Наименование таможни на границе</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="pint:BorderCustomsName"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pint:ExpectArriveDate or pint:ExpectArriveTime">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Ожидаемая дата и время прибытия на пункт пропуска</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="pint:ExpectArriveDate"/>
									</xsl:call-template>
									&#160;<xsl:value-of select="substring(pint:ExpectArriveTime, 1,8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pint:Consignee">
						<div class="title marg-top">Грузополучатель</div>
						<xsl:apply-templates select="pint:Consignee"/>
					</xsl:if>
					<xsl:if test="pint:Carrier">
						<div class="title marg-top">Перевозчик</div>
						<xsl:apply-templates select="pint:Carrier"/>
					</xsl:if>
					<xsl:if test="pint:GoodsInformation">
						<div class="title marg-top">Информация о перевозимых товарах</div>
						<xsl:apply-templates select="pint:GoodsInformation"/>
					</xsl:if>
					<xsl:if test="pint:LicenceDocument">
						<br/>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%" rowspan="{count(pint:LicenceDocument)}">
									<div class="title marg-top">Сведения о документах обеспечения уплаты, лицензиях на перевозку товаров</div>
								</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="pint:LicenceDocument[1]"/></td>
							</tr>
							<xsl:for-each select="pint:LicenceDocument[position() &gt; 1]">
								<tr>
									<td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td>
								</tr>
							</xsl:for-each>	
						</table>
					</xsl:if>
					<xsl:if test="pint:Principal">
						<div class="title marg-top">Доверитель</div>
						<xsl:apply-templates select="pint:Principal"/>
					</xsl:if>
					<xsl:if test="pint:Consignor">
						<div class="title marg-top">Грузоотправитель</div>
						<xsl:apply-templates select="pint:Consignor"/>
					</xsl:if>
					<xsl:if test="pint:ShippingInformation">
						<div class="title marg-top">Информация о перевозке груза</div>
						<xsl:apply-templates select="pint:ShippingInformation"/>
					</xsl:if>
				</div>
			</body>
		</html>
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
	<xsl:template match="cat_ru:KGOrganizationFeatures">
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
	<xsl:template match="cat_ru:RAOrganizationFeatures">
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
			<xsl:text>Номер справки об отсутствии НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
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
	<xsl:template match="cat_ru:RFOrganizationFeatures">
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
	<xsl:template match="cat_ru:RKOrganizationFeatures">
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
	<!-- Шаблон для типа catpi_ru:GoodsMeasureQuantityType -->
	<xsl:template match="catpi_ru:GoodsMeasureQuantity">
		<xsl:value-of select="translate(catpi_ru:GoodsQuantity, '.', ',')"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="catpi_ru:MeasureUnitQualifierName"/>
		<xsl:if test="catpi_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="catpi_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:GoodsPackagingType -->
	<xsl:template match="catpi_ru:GoodsPackaging">
		<td class="graphMain bordered">
			<xsl:value-of select="translate(catpi_ru:PakageQuantity, '.', ',')"/>&#160;
			(<xsl:value-of select="catpi_ru:CargoCode"/>)&#160;
			<xsl:value-of select="catpi_ru:CargoDescription"/>
			<xsl:if test="catpi_ru:Seal"><br/>номера пломб:&#160;
				<xsl:for-each select="catpi_ru:Seal">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
			</xsl:if>
		</td>
		<td class="graphMain bordered">
			<xsl:for-each select="catpi_ru:PackingInformation">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">,<br/></xsl:if>
			</xsl:for-each>
		</td>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:GuaranteeDocumentType -->
	<xsl:template match="catpi_ru:GuaranteeDocument">
		<td class="graphMain bordered">
			<xsl:value-of select="catpi_ru:DocumentNumber"/>
		</td>
		<td class="graphMain bordered">
			<xsl:value-of select="catpi_ru:GRN"/>
		</td>
		<td class="graphMain bordered">
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="catpi_ru:IssueDate"/></xsl:call-template>
		</td>
		<td class="graphMain bordered">
			<xsl:if test="catpi_ru:NotValid4EC and (catpi_ru:NotValid4EC='true' or catpi_ru:NotValid4EC=1)">да</xsl:if>
		</td>
		<td class="graphMain bordered">
			<xsl:for-each select="catpi_ru:LimitationNonEC">
				<xsl:value-of select="catpi_ru:NotValid4Country"/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</td>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:PackingInformationType -->
	<xsl:template match="catpi_ru:PackingInformation">
		<xsl:value-of select="catpi_ru:PakingQuantity"/>&#160;
		код вида: <xsl:value-of select="catpi_ru:PackingCode"/>
		<xsl:if test="catpi_ru:PackingMark"> &#160;маркировка: <xsl:value-of select="catpi_ru:PackingMark"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:PresentedDocumentsType -->
	<xsl:template match="catpi_ru:PresentedDocuments| pint:LicenceDocument">
		<xsl:if test="catpi_ru:PresentedDocumentModeCode">(<xsl:value-of select="catpi_ru:PresentedDocumentModeCode"/>) </xsl:if>
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/></xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
		</xsl:if>
		<xsl:if test="catpi_ru:OrganizationName"> выдан <xsl:value-of select="catpi_ru:OrganizationName"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:TransportMeansType -->
	<xsl:template match="catpi_ru:ReloadTransportMeans| pint:BorderTransport">
		<td class="graphMain bordered"><xsl:value-of select="catpi_ru:TransportIdentifier"/></td>
		<td class="graphMain bordered"><xsl:value-of select="catpi_ru:TrailerIdentifier"/></td>
		<td class="graphMain bordered"><xsl:value-of select="catpi_ru:SecondTrailerIdentifier"/></td>
		<td class="graphMain bordered"><xsl:value-of select="catpi_ru:VINID"/></td>
		<td class="graphMain bordered"><xsl:value-of select="catpi_ru:TransportModeCode"/></td>
		<td class="graphMain bordered"><xsl:value-of select="catpi_ru:TransportMeansNationalityCode"/></td>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="pint:Address">
		<xsl:for-each select="./*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:TransportMeansType >
	<xsl:template match="pint:BorderTransport">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:TransportIdentifier"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:TrailerIdentifier"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:SecondTrailerIdentifier"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:VINID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:TransportModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catpi_ru:TransportMeansNationalityCode"/>
			</td>
		</tr>
	</xsl:template-->
	<!-- Шаблон для типа pint:CarrierType -->
	<xsl:template match="pint:Carrier| pint:Consignee| pint:Consignor| pint:Principal">
		<table class="w190">
			<xsl:if test="cat_ru:OrganizationLanguage">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="graphMain value" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName"> (</xsl:if>
						<xsl:value-of select="cat_ru:ShortName"/>
						<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName">)</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
				<tr>
					<td class="annot graphMain" style="width:50%">Сведения об организации</td>
					<td class="graphMain value" style="width:50%">
						<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="pint:ITN">
				<tr>
					<td class="annot graphMain" style="width:50%">ИТН</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="pint:ITN"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="pint:IdentityCard">
				<tr>
					<td class="annot graphMain" style="width:50%">Документ, удостоверяющий личность</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="pint:IdentityCard"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="pint:Address">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес организации / физического лица</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="pint:Address"/></td>
				</tr>
			</xsl:if>
		</table>	
		<xsl:if test="pint:DriverInformation">
			<div class="marg-top"><i>Информация о водителях</i></div>
			<table class="w190">
				<xsl:for-each select="pint:DriverInformation">
					<tr>
						<td class="annot graphMain" style="width:2%"><xsl:value-of select="position()"/>.</td>
						<td class="annot graphMain" style="width:48%">Ф.И.О.</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
							<xsl:value-of select="cat_ru:PersonName"/>&#160;
							<xsl:value-of select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
					<tr>
						<td class="annot graphMain" style="width:2%"/>
						<td class="annot graphMain" style="width:48%">Должность</td>
						<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PersonPost"/></td>
					</tr>
					<tr>
						<td class="annot graphMain" style="width:2%"/>
						<td class="annot graphMain" style="width:48%">Документ, удостоверяющий личность водителя</td>
						<td class="value graphMain" style="width:50%"><xsl:apply-templates select="catpi_ru:IdentityCard"/></td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа pint:DestinationType -->
	<xsl:template match="pint:Destination">
		<table class="w190">
			<xsl:if test="pint:DestinationRWStationCode or pint:DestinationRWStationName">
				<tr>
					<td class="annot graphMain" style="width:50%">Ж/Д станция назначения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pint:DestinationRWStationCode"/>&#160;
						<xsl:value-of select="pint:DestinationRWStationName"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="pint:DestinantionPlaceName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование места назначения</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="pint:DestinantionPlaceName"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="pint:Address">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес места назначения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="pint:Address"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="pint:DestinationWarehouse">
				<tr>
					<td class="annot graphMain" style="width:50%">СВХ места назначения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="pint:DestinationWarehouse"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="pint:DestinationCustoms">
				<tr>
					<td class="annot graphMain" style="width:50%">Таможня назначения</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="pint:DestinationCustoms"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:CountryInformationType -->
	<xsl:template match="pint:DestinationCountry| pint:DispatchCountry">
		(<xsl:value-of select="catpi_ru:CountryACode"/>)
		<xsl:if test="catpi_ru:CountryName"> <xsl:value-of select="catpi_ru:CountryName"/></xsl:if>
		<xsl:if test="catpi_ru:CountryPlace">
			<xsl:choose>
				<xsl:when test="name(.)='pint:DestinationCountry'"> место назначения: </xsl:when>
				<xsl:when test="name(.)='pint:DispatchCountry'"> место отгрузки: </xsl:when>
			</xsl:choose>
			<xsl:value-of select="catpi_ru:CountryPlace"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="pint:DestinationCustoms| pint:DispatchCustoms">
		<xsl:value-of select="cat_ru:Code"/>&#160;
		<xsl:value-of select="cat_ru:OfficeName"/>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:DestinationWarehouseType -->
	<xsl:template match="pint:DestinationWarehouse">
		Свидетельство о включении в реестр / Лицензия № <xsl:value-of select="catpi_ru:CertificateNumber"/>&#160;
		дата выдачи &#160;
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="catpi_ru:CertificateDate"/>
		</xsl:call-template>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:GoodsType -->
	<xsl:template match="pint:Goods">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:GoodsNumeric"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cat_ru:GoodsTNVEDCode"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="cat_ru:GoodsDescription"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(cat_ru:GrossWeightQuantity, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(cat_ru:NetWeightQuantity, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="catpi_ru:GoodsMeasureQuantity"/></td>
			<td class="graphMain bordered"><xsl:value-of select="catpi_ru:OriginCountryCode"/></td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(catpi_ru:InvoicedCost, '.', ',')"/>&#160;
				<xsl:value-of select="catpi_ru:CurrencyCode"/>
				<xsl:if test="catpi_ru:CurrencyRate"><br/>курс валюты: <xsl:value-of select="translate(catpi_ru:CurrencyRate, '.', ',')"/></xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="catpi_ru:ContainerNumbers">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
			</td>
			<xsl:apply-templates select="catpi_ru:GoodsPackaging"/>
			<td class="graphMain bordered">
				<xsl:for-each select="catpi_ru:PresentedDocuments">
					<xsl:apply-templates select="."/>
					<xsl:if test="position()!=last()"><br/></xsl:if>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа pint:GoodsInformationType -->
	<xsl:template match="pint:GoodsInformation">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Всего наименований товаров</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="pint:TotalGoodsNameQuantity"/></td>
			</tr>
			<xsl:if test="pint:ShipSpecifQuantity or pint:ShipSpecifGoodsQuantity">
				<tr>
					<td class="annot graphMain" style="width:50%">Количество отгрузочных спецификаций</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="pint:ShipSpecifQuantity"/>
						<xsl:if test="pint:ShipSpecifGoodsQuantity">
							&#160;кол-во товаров по спецификациям: <xsl:value-of select="pint:ShipSpecifGoodsQuantity"/>
						</xsl:if>
					</td>
				</tr>	
			</xsl:if>
			<xsl:if test="pint:TotalInvoicedCost or pint:CurrencyCode or pint:CurrencyRate">
				<tr>
					<td class="annot graphMain" style="width:50%">Общая фактурная стоимость</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(pint:TotalInvoicedCost, '.', ',')"/>&#160;
						<xsl:value-of select="pint:CurrencyCode"/>
						<xsl:if test="pint:CurrencyRate"> &#160;курс валюты: <xsl:value-of select="translate(pint:CurrencyRate, '.', ',')"/></xsl:if>
					</td>
				</tr>
			</xsl:if>
		</table>
		<div class="marg-top"><i>Сведения о товарах</i></div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered">№ п/п</td>
					<td class="graphMain bordered">Код товара</td>
					<td class="graphMain bordered">Описание</td>
					<td class="graphMain bordered">Вес брутто (кг)</td>
					<td class="graphMain bordered">Вес нетто (кг)</td>
					<td class="graphMain bordered">Кол-во товара в ДЕИ</td>
					<td class="graphMain bordered">Код страны</td>
					<td class="graphMain bordered">Фактурная стоимость</td>
					<td class="graphMain bordered">Номера контейнеров</td>
					<td class="graphMain bordered">Грузовые места</td>
					<td class="graphMain bordered">Упаковка</td>
					<td class="graphMain bordered">Документы</td>
				</tr>
				<xsl:for-each select="pint:Goods">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:GuaranteeType -->
	<xsl:template match="pint:Guarantee">
		<tr>
			<td class="graphMain bordered" rowspan="{count(catpi_ru:GuaranteeDocument)}"><xsl:value-of select="catpi_ru:MeasureCode"/></td>
			<xsl:choose>
				<xsl:when test="catpi_ru:GuaranteeDocument"><xsl:apply-templates select="catpi_ru:GuaranteeDocument[1]"/></xsl:when>
				<xsl:otherwise>
					<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
					<td class="graphMain bordered"/><td class="graphMain bordered"/>
				</xsl:otherwise>
			</xsl:choose>
		</tr>	
		<xsl:for-each select="catpi_ru:GuaranteeDocument[position() &gt; 1]">
			<tr>
				<xsl:apply-templates select="."/>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="pint:IdentityCard| catpi_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode">(<xsl:value-of select="cat_ru:IdentityCardCode"/>) </xsl:if>
		<xsl:if test="cat_ru:IdentityCardName"><xsl:value-of select="cat_ru:IdentityCardName"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries"> серия <xsl:value-of select="cat_ru:IdentityCardSeries"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber"> № <xsl:value-of select="cat_ru:IdentityCardNumber"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName"> выдан&#160;
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
			&#160;<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:ReloadingInfoType -->
	<xsl:template match="pint:ReloadingInfo">
		<tr>
			<td class="graphMain bordered" rowspan="{count(catpi_ru:ReloadTransportMeans)}">
				<xsl:value-of select="catpi_ru:ReloadCountryCode"/>
			</td>
			<td class="graphMain bordered" rowspan="{count(catpi_ru:ReloadTransportMeans)}">
				<xsl:value-of select="catpi_ru:ReloadCountryName"/>
			</td>
			<td class="graphMain bordered" rowspan="{count(catpi_ru:ReloadTransportMeans)}">
				<xsl:value-of select="catpi_ru:ReloadCustomsCode"/>
			</td>
			<td class="graphMain bordered" rowspan="{count(catpi_ru:ReloadTransportMeans)}">
				<xsl:value-of select="catpi_ru:ReloadCustomsName"/>
			</td>
			<td class="graphMain bordered" rowspan="{count(catpi_ru:ReloadTransportMeans)}">
				<xsl:choose>
					<xsl:when test="catpi_ru:ContainerIndicator='true'">есть</xsl:when>
					<xsl:otherwise>нет</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered" rowspan="{count(catpi_ru:ReloadTransportMeans)}">
				<xsl:value-of select="catpi_ru:ContainerID"/>
			</td>
			<xsl:choose>
				<xsl:when test="catpi_ru:ReloadTransportMeans"><xsl:apply-templates select="catpi_ru:ReloadTransportMeans[1]"/></xsl:when>
				<xsl:otherwise>
					<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
					<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
				</xsl:otherwise>
			</xsl:choose>
		</tr>
		<xsl:for-each select="catpi_ru:ReloadTransportMeans[position() &gt; 1]">
			<tr><xsl:apply-templates select="."/></tr>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа pint:ShippingInformationType -->
	<xsl:template match="pint:ShippingInformation">
		<table class="w190">
			<xsl:if test="pint:ContainerIndicator">
				<tr>
					<td class="annot graphMain" style="width:50%">Признак контейнерных перевозок</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="pint:ContainerIndicator='true' or pint:ContainerIndicator=1">да</xsl:when>
							<xsl:otherwise>нет</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Планируемый срок перевозки товаров</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="pint:DateLimit"/>
					</xsl:call-template>
				</td>
			</tr>
			<xsl:if test="pint:DispatchCustoms">
				<tr>
					<td class="annot graphMain" style="width:50%">Таможня отправления</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="pint:DispatchCustoms"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="pint:DestinationCountry">
				<tr>
					<td class="annot graphMain" style="width:50%">Страна назначения товаров</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="pint:DestinationCountry"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="pint:DispatchCountry">
				<tr>
					<td class="annot graphMain" style="width:50%">Страна отправления товаров</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="pint:DispatchCountry"/></td>
				</tr>
			</xsl:if>
		</table>
		<div class="marg-top"><i>Транспортное средство на границе</i></div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered">ИД основного ТС</td>
					<td class="graphMain bordered">ИД прицепного ТС</td>
					<td class="graphMain bordered">ИД второго прицепного ТС</td>
					<td class="graphMain bordered">VIN</td>
					<td class="graphMain bordered">Код вида ТС</td>
					<td class="graphMain bordered">Код страны принадлежности ТС</td>
				</tr>
				<xsl:for-each select="pint:BorderTransport">
					<tr><xsl:apply-templates select="."/></tr>
				</xsl:for-each>
			</tbody>
		</table>
		<xsl:if test="pint:Guarantee">
			<div class="marg-top"><i>Гарантия, меры обеспечения</i></div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered" rowspan="2">Код меры обеспечения</td>
						<td class="graphMain bordered" colspan="5">Реквизиты гарантии</td>
					</tr>
					<tr class="title">
						<td class="graphMain bordered">Номер документа</td>
						<td class="graphMain bordered">Регистрационный номер гарантии</td>
						<td class="graphMain bordered">Дата документа</td>
						<td class="graphMain bordered">Наличие ограничения для стран ЕС</td>
						<td class="graphMain bordered">Ограничение действия гарантии вне ЕС</td>
					</tr>
					<xsl:for-each select="pint:Guarantee">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="pint:ReloadingInfo">
			<div class="marg-top"><i>Информация о планируемых перегрузках товаров или других грузовых операциях в пути</i></div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered" rowspan="2">Код страны перегрузки товаров</td>
						<td class="graphMain bordered" rowspan="2">Наименование страны перегрузки товара</td>
						<td class="graphMain bordered" rowspan="2">Код таможенного органа перегрузки товаров</td>
						<td class="graphMain bordered" rowspan="2">Наименование таможенного органа перегрузки товаров</td>
						<td class="graphMain bordered" rowspan="2">Признак контейнерных перевозок</td>
						<td class="graphMain bordered" rowspan="2">Номер нового контейнера</td>
						<td class="graphMain bordered" colspan="6" align="center">Новое транспортное средство</td>
					</tr>
					<tr class="title">
						<td class="graphMain bordered">ИД основного ТС</td>
						<td class="graphMain bordered">ИД прицепного ТС</td>
						<td class="graphMain bordered">ИД второго прицепного ТС</td>
						<td class="graphMain bordered">VIN</td>
						<td class="graphMain bordered">Код вида ТС</td>
						<td class="graphMain bordered">Код страны принадлежности ТС</td>
					</tr>
					<xsl:for-each select="pint:ReloadingInfo">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="pint:TransitRoute">
			<div class="marg-top"><i>Маршрут транзита</i></div>
			<table class="w190">
				<xsl:for-each select="pint:TransitRoute">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</xsl:if>
		<xsl:if test="pint:Destination">
			<div class="marg-top"><i>Пункт назначения товаров</i></div>
			<xsl:apply-templates select="pint:Destination"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catpi_ru:TransitRouteType -->
	<xsl:template match="pint:TransitRoute">
		<tr>
			<td class="annot graphMain" style="width:2%"><xsl:value-of select="catpi_ru:TransitPointNumber"/></td>
			<td class="value graphMain"><xsl:value-of select="catpi_ru:TransitRoutePlace"/></td>
		</tr>
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
