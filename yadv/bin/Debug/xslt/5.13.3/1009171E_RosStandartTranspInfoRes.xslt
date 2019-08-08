<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:TrInfo_req="urn:customs.ru:Information:SQDocuments:RosStandartTranspInfoRes:5.13.1">
	<!-- Шаблон для типа RosStandartTranspInfoResType -->
	<xsl:template match="TrInfo_req:RosStandartTranspInfoRes">
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
					width: 277mm;
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
										<b>Ответ на запрос копий документов, которые были выданы таможенными органами РФ при таможенном оформлении транспортных средств, номерных агрегатов</b>
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
						<xsl:if test="cat_ru:RefDocumentID">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</xsl:if>
					</table-->
					<xsl:if test="TrInfo_req:ResponseDescription">
						<div class="title marg-top">ПАРАМЕТРЫ ОТВЕТА</div>
						<xsl:apply-templates select="TrInfo_req:ResponseDescription"/>
					</xsl:if>
					<xsl:for-each select="TrInfo_req:Response">
						<div class="title marg-top">ОТВЕТ НА ЗАПРОС № <xsl:value-of select="position()"/></div>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типов cat_ru:CUBranchDescriptionType и TrInfo_req:OrganizationType -->
	<xsl:template match="TrInfo_req:BranchDescription| TrInfo_req:Consignor| TrInfo_req:Consignee| TrInfo_req:Manufacturer">
		<table class="w190">
			<tr><td class="annot graphMain" style="border-top: 1px solid silver" colspan="2"/></tr>
			<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:ShortName">
							<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
							<xsl:value-of select="cat_ru:ShortName"/>
							<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationLanguage">
				<tr>
					<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
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
			<xsl:if test="cat_ru:Address">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес организации</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cat_ru:Address"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="TrInfo_req:JuridicalAddress">
				<tr>
					<td class="annot graphMain" style="width:50%">Юридический адрес</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="TrInfo_req:JuridicalAddress"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:IdentityCard">
				<tr>
					<td class="annot graphMain" style="width:50%">Документ, удостоверяющий личность</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cat_ru:IdentityCard"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="cat_ru:Contact">
				<tr>
					<td class="annot graphMain" style="width:50%">Контактная информация</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cat_ru:Contact"/></td>
				</tr>
			</xsl:if>
		</table>
		<xsl:if test="TrInfo_req:BranchDescription">
			<div class="marg-top"><i>Сведения об обособленном подразделении</i></div>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:2%"/>
					<td class="annot graphMain" style="width:98%"><xsl:apply-templates select="TrInfo_req:BranchDescription"/></td>
				</tr>
			</table>	
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catESAD_ru:ConformanceCertificateType -->
	<xsl:template match="TrInfo_req:ConformanceCertificate">
		ID <xsl:value-of select="catESAD_ru:DocumentID"/>
		&#160;выдан:&#160;
		<xsl:if test="catESAD_ru:IssueDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="catESAD_ru:IssueDate"/>
			</xsl:call-template>
			&#160;
		</xsl:if>
		<xsl:value-of select="catESAD_ru:OrganizationName"/>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:AutomobileType -->
	<xsl:template match="TrInfo_req:DataTS">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:Model"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:Mark"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:MarkCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:OfftakeYear"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(cat_ru:EngineVolumeQuanity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:VINID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:BodyID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:EngineID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:ChassisID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:CabID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:EmergencyDeviceID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:IdentityCardNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(catESAD_cu:CarCost, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(catESAD_cu:PowerWeightQuanity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:PassedKilometerQuantity"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="TrInfo_req:Document| TrInfo_req:OtherDocument">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/></xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="TrInfo_req:JuridicalAddress| cat_ru:Address">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа TrInfo_req:ResponseType -->
	<xsl:template match="TrInfo_req:Response">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%; border-top: 2px solid black" rowspan="{count(TrInfo_req:Document)}">
					<div class="title marg-top">Реквизиты документов, которые были выданы таможенными органами РФ</div>
				</td>
				<td class="value graphMain" style="width:50%; border-top: 2px solid black">
					<xsl:apply-templates select="TrInfo_req:Document[1]"/>
				</td>
			</tr>
			<xsl:for-each select="TrInfo_req:Document[position() &gt; 1]">
				<tr>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td>
				</tr>
			</xsl:for-each>
		</table>
		<xsl:if test="TrInfo_req:Consignor">
			<div class="title marg-top">Отправитель/Экспортер</div>
			<xsl:apply-templates select="TrInfo_req:Consignor"/>
		</xsl:if>
		<xsl:if test="TrInfo_req:Consignee">
			<div class="title marg-top">Получатель/Импортер</div>
			<xsl:apply-templates select="TrInfo_req:Consignee"/>
		</xsl:if>
		<xsl:if test="TrInfo_req:Manufacturer">
			<div class="title marg-top">Производитель</div>
			<xsl:apply-templates select="TrInfo_req:Manufacturer"/>
		</xsl:if>
		<div class="title marg-top">Информация о транспортном средстве</div>
		<table class="w190">
			<xsl:for-each select="TrInfo_req:TransportInfo">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- Шаблон для типа TrInfo_req:ResponseDescriptionType -->
	<xsl:template match="TrInfo_req:ResponseDescription">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%" colspan="2">Наименование органа (организации), направляющей ответ на запрос</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="TrInfo_req:OrgSender"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:48%">Способы удостоверения лица, направившего ответ на запрос, и неизменности ответа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="TrInfo_req:WaysIdentify"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:48%">Способ направления ответа на запрос</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="TrInfo_req:TransmittingCode=1">по каналам СМЭВ</xsl:when>
						<xsl:when test="TrInfo_req:TransmittingCode=2">по каналам РСМЭВ</xsl:when>
						<xsl:when test="TrInfo_req:TransmittingCode=3">по иным электронным каналам</xsl:when>
						<xsl:when test="TrInfo_req:TransmittingCode=4">по почте</xsl:when>
						<xsl:when test="TrInfo_req:TransmittingCode=5">по факсу</xsl:when>
						<xsl:when test="TrInfo_req:TransmittingCode=6">курьером</xsl:when>
						<xsl:when test="TrInfo_req:TransmittingCode=7">другое или сочетание способов</xsl:when>
						<xsl:otherwise><xsl:value-of select="TrInfo_req:TransmittingCode"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%" colspan="2">Наименование органа (организации), в адрес которой направляется ответ</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="TrInfo_req:OrgReceiver"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%" colspan="2">Наименование запрашиваемого документа и (или) информации</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="TrInfo_req:NameRequestInfo"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%" colspan="2">Срок направления ответа на запрос</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="TrInfo_req:ReponsePeriod"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа TrInfo_req:TransportInfoType -->
	<xsl:template match="TrInfo_req:TransportInfo">
		<tr>
			<td class="annot graphMain" style="width:50%; border-top: 1px solid silver">Количество единиц ввезеных транспортных средств (шасси)</td>
			<td class="annot graphMain" style="width:50%; border-top: 1px solid silver"><xsl:value-of select="TrInfo_req:NumberOfUnits"/></td>
		</tr>
		<xsl:if test="TrInfo_req:ConformanceCertificate">
			<tr>
				<td class="annot graphMain" style="width:50%">Реквизиты одобрения типа ТС (шасси)</td>
				<td class="annot graphMain" style="width:50%"><xsl:apply-templates select="TrInfo_req:ConformanceCertificate"/></td>
			</tr>
		</xsl:if>
		<xsl:for-each select="TrInfo_req:OtherDocument">
			<tr>
				<td class="annot graphMain" style="width:50%"><xsl:if test="position()=1">Реквизиты иных документов</xsl:if></td>
				<td class="value graphMain" style="width:50%"><xsl:apply-templates select="."/></td>
			</tr>
		</xsl:for-each>
		<tr>
			<td class="annot graphMain" colspan="2">
				<table class="bordered w190">
					<tr class="title">
						<td class="graphMain bordered">Марка, модель</td>
						<td class="graphMain bordered">Наим. марки</td>
						<td class="graphMain bordered">Код марки</td>
						<td class="graphMain bordered">Год изг.</td>
						<td class="graphMain bordered">Раб. об. дв., куб. см</td>
						<td class="graphMain bordered">VIN</td>
						<td class="graphMain bordered">ID кузова</td>
						<td class="graphMain bordered">ID двигателя</td>
						<td class="graphMain bordered">ID шасси</td>
						<td class="graphMain bordered">ID кабины</td>
						<td class="graphMain bordered">ID устройства или системы вызова экстренных оперативных служб</td>
						<td class="graphMain bordered">№ удостов.</td>
						<td class="graphMain bordered">Стоимостьть</td>
						<td class="graphMain bordered">Примечание</td>
						<td class="graphMain bordered">Пробег</td>
					</tr>
					<xsl:for-each select="TrInfo_req:DataTS">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</table>
				<br/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="cat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode">(<xsl:value-of select="cat_ru:IdentityCardCode"/>) </xsl:if>
		<xsl:if test="cat_ru:IdentityCardName"><xsl:value-of select="cat_ru:IdentityCardName"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries"> серия <xsl:value-of select="cat_ru:IdentityCardSeries"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber"> № <xsl:value-of select="cat_ru:IdentityCardNumber"/></xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName"> выдан 
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
			&#160;<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
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
