<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:TrInfo_res="urn:customs.ru:Information:SQDocuments:RosStandartTranspInfoReq:5.13.1">
	<!-- Шаблон для типа RosStandartTranspInfoReqType -->
	<xsl:template match="TrInfo_res:RosStandartTranspInfoReq">
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
										<b>Запрос копий документов, которые были выданы таможенными органами РФ при таможенном оформлении транспортных средств, номерных агрегатов</b>
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
					<xsl:if test="TrInfo_res:RequestDescription">
						<div class="title marg-top">ПАРАМЕТРЫ ЗАПРОСА</div>
						<xsl:apply-templates select="TrInfo_res:RequestDescription"/>
					</xsl:if>
					<xsl:if test="TrInfo_res:Request">
						<div class="title marg-top">ЗАПРОС</div>
						<xsl:apply-templates select="TrInfo_res:Request"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типов cat_ru:CUBranchDescriptionType и TrInfo_res:OrganizationType -->
	<xsl:template match="TrInfo_res:BranchDescription| TrInfo_res:Consignee| TrInfo_res:Consignor| TrInfo_res:Manufacturer">
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
			<xsl:if test="TrInfo_res:JuridicalAddress">
				<tr>
					<td class="annot graphMain" style="width:50%">Юридический адрес</td>
					<td class="value graphMain" style="width:50%"><xsl:apply-templates select="TrInfo_res:JuridicalAddress"/></td>
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
		<xsl:if test="TrInfo_res:BranchDescription">
			<div class="marg-top"><i>Сведения об обособленном подразделении</i></div>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:2%"/>
					<td class="annot graphMain" style="width:98%"><xsl:apply-templates select="TrInfo_res:BranchDescription"/></td>
				</tr>
			</table>	
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:AutomobileType -->
	<xsl:template match="TrInfo_res:DataTS">
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
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="TrInfo_res:JuridicalAddress| cat_ru:Address">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа TrInfo_res:RequestType -->
	<xsl:template match="TrInfo_res:Request">
		<xsl:if test="TrInfo_res:Consignor">
			<div class="title marg-top">Отправитель/Экспортер</div>
			<xsl:apply-templates select="TrInfo_res:Consignor"/>
		</xsl:if>
		<xsl:if test="TrInfo_res:Consignee">
			<div class="title marg-top">Получатель/Импортер</div>
			<xsl:apply-templates select="TrInfo_res:Consignee"/>
		</xsl:if>
		<xsl:if test="TrInfo_res:Manufacturer">
			<div class="title marg-top">Сведения о производителе</div>
			<xsl:apply-templates select="TrInfo_res:Manufacturer"/>
		</xsl:if>
		<xsl:if test="TrInfo_res:TransportInfo">
			<div class="title marg-top">Наименование транспортного средства и его характеристики </div>
			<table class="w190">
				<xsl:for-each select="TrInfo_res:TransportInfo">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа TrInfo_res:RequestDescriptionType -->
	<xsl:template match="TrInfo_res:RequestDescription">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%" colspan="2">Наименование органа (организации), направляющей запрос</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="TrInfo_res:OrgSender"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:48%">Способы удостоверения лица, направившего запрос, и неизменности запроса </td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="TrInfo_res:WaysIdentify"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:2%"/>
				<td class="annot graphMain" style="width:48%">Способ направления запроса</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="TrInfo_res:TransmittingCode=1">по каналам СМЭВ</xsl:when>
						<xsl:when test="TrInfo_res:TransmittingCode=2">по каналам РСМЭВ</xsl:when>
						<xsl:when test="TrInfo_res:TransmittingCode=3">по иным электронным каналам</xsl:when>
						<xsl:when test="TrInfo_res:TransmittingCode=4">по почте</xsl:when>
						<xsl:when test="TrInfo_res:TransmittingCode=5">по факсу</xsl:when>
						<xsl:when test="TrInfo_res:TransmittingCode=6">курьером</xsl:when>
						<xsl:when test="TrInfo_res:TransmittingCode=7">другое или сочетание способов</xsl:when>
						<xsl:otherwise><xsl:value-of select="TrInfo_res:TransmittingCode"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%" colspan="2">Наименование органа (организации), в адрес которой направляется запрос</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="TrInfo_res:OrgReceiver"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%" colspan="2">Полное наименование государственной или муниципальной функции, для осуществления которой необходимо предоставление документа и (или) информации</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="TrInfo_res:ForWhat"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%" colspan="2">Указание на положения нормативного правового акта</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="TrInfo_res:OrderName"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%" colspan="2">Наименование запрашиваемого документа и (или) информации</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="TrInfo_res:NameRequestInfo"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа TrInfo_res:TransportInfoType -->
	<xsl:template match="TrInfo_res:TransportInfo">
		<tr>
			<td class="annot graphMain" style="width:3%; border-top: 1px solid silver"><xsl:value-of select="TrInfo_res:GoodsNumeric"/></td>
			<td class="annot graphMain" style="width:97%; border-top: 1px solid silver"><xsl:apply-templates select="TrInfo_res:GoodsDescription"/></td>
		</tr>	
		<xsl:if test="TrInfo_res:DataTS">
			<tr>
				<td class="annot graphMain" colspan="2">
					<div class="marg-top"><i>Сведения о ТС</i></div>
					<table class="bordered w190">
						<tr class="title">
							<td class="graphMain bordered">Марка, модель</td>
							<td class="graphMain bordered">Наименование марки</td>
							<td class="graphMain bordered">Код марки</td>
							<td class="graphMain bordered">Год изг.</td>
							<td class="graphMain bordered">Раб. об. двиг., куб. см</td>
							<td class="graphMain bordered">VIN</td>
							<td class="graphMain bordered">ID кузова</td>
							<td class="graphMain bordered">ID двигателя</td>
							<td class="graphMain bordered">ID шасси</td>
							<td class="graphMain bordered">ID кабины</td>
							<td class="graphMain bordered">ID устройства / системы вызова экстренных оперативных служб</td>
							<td class="graphMain bordered">№ удостов.</td>
							<td class="graphMain bordered">Стоимость</td>
							<td class="graphMain bordered">Примечание</td>
							<td class="graphMain bordered">Пробег</td>
						</tr>
						<xsl:for-each select="TrInfo_res:DataTS">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
					<br/>
				</td>
			</tr>
		</xsl:if>
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
