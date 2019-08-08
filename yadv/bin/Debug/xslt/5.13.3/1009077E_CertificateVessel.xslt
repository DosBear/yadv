<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ Министерства транспорта РФ №87 от 21.06.2006, Приложение № 9 (регистрация судна) и Приложение № 10 (об исключении судна) к Правилам регистрации судов и прав на них в морских торговых портах (в редакции приказа Минтранса РФ от 30.10.2007 № 153) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:cerv="urn:customs.ru:Information:SQDocuments:CertificateVessel:5.13.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа CertificateVesselType -->
	<xsl:template match="cerv:CertificateVessel">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>
					<xsl:choose>
						<xsl:when test="cerv:RegistrationStatus='1'">Свидетельство о регистрации судна в Российском международном реестре судов</xsl:when>
						<xsl:when test="cerv:RegistrationStatus='2'">Свидетельство об исключении судна из реестра</xsl:when>
						<xsl:otherwise>Свидетельство о регистрации судна / исключении судна из реестра</xsl:otherwise>
					</xsl:choose>
				</title>
				<style>
					body {
					background: #cccccc;
					font-family: 'Courier New';
					}

					div.page {
					width: 210mm;
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
					}

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}

					.graph8 {
					font-size: 8pt;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tr>
							<td align="center" class="graphMain">
								<font size="4">
									<b>РОССИЙСКАЯ ФЕДЕРАЦИЯ<br/><br/>
										СВИДЕТЕЛЬСТВО<br/>
										<xsl:choose>
											<xsl:when test="cerv:RegistrationStatus='1'">
												о регистрации судна (подтверждении регистрации судна)<br/>в Российском международном реестре судов
											</xsl:when>
											<xsl:when test="cerv:RegistrationStatus='2'">
												об исключении судна из
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="cerv:RegistrationStatus"/>
											</xsl:otherwise>
										</xsl:choose>
									</b>
								</font>
							</td>
						</tr>
					</table>
					<br/>
					<xsl:if test="cerv:RegistrationStatus='1'">
						<table class="w190">
							<tr>
								<td>На основании данных, внесенных в Российский международный реестр судов под № <u>&#160;<xsl:value-of select="cerv:RegistrationNumber"/>&#160;</u> от <u>&#160;<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cerv:IssueDateDoc"/></xsl:call-template>г.&#160;</u> настоящим удостоверяется, что судно</td>
							</tr>
							<tr>
								<td style="border-bottom:1px solid;" align="center">
									<xsl:value-of select="cerv:Vessel/cerv:RegName"/>
									<xsl:if test="not(cerv:Vessel/cerv:RegName)"><xsl:value-of select="cerv:Vessel/cerv:Name"/></xsl:if>
								</td>
							</tr>
							<tr>
								<td class="graph8" width="45%" align="center">(название судна)</td>
							</tr>
							<tr>
								<td style="border-bottom:1px solid;" align="center">
									запись №  <xsl:value-of select="cerv:Register/cerv:NumberRegister"/>&#160;
									внесена&#32;
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cerv:Register/cerv:DateRegister"/>
									</xsl:call-template>г.
								</td>
							</tr>
							<tr>
								<td class="graph8" width="50%" align="center">(реквизиты документов)</td>
							</tr>
							<tr>
								<td style="border-bottom:1px solid" width="100%" align="center">&#160;</td>
							</tr>
							<tr>
								<td class="graph8" align="center">(зарегистрировано, подтверждена регистрация)</td>
							</tr>
							<tr>
								<td>в Российском международном реестре судов на собственника (судовладельца)</td>
							</tr>
							<tr>
								<td style="border-bottom:1px solid;" align="center"><xsl:apply-templates select="cerv:Shipowner"/></td>
							</tr>
							<tr>
								<td class="graph8" align="center">(полный юридический адрес, ИНН, ОГРН собственника/судовладельца)</td>
							</tr>
						</table>
						<br/>
						<table class="w190">
							<tr>
								<td style="width:50%">Настоящее свидетельство действительно до<!-- 31 марта--></td>
								<td style="border-bottom: 1px solid;" align="center">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cerv:PeriodDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td style="width:50%"/>
								<td class="graph8" align="center">
									(указывается год, следующий за годом регистрации судна, или год, следующий за годом последнего подтверждени регистрации)
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cerv:RegistrationStatus='2'">
						<table class="w190">
							<tr>
								<td style="border-bottom:1px solid;">&#160;</td>
							</tr>
							<tr>
								<td class="graph8" align="center">(наименование реестра)</td>
							</tr>
							<tr>
								<td>
								<br/>На основании данных, внесенных в 
								<u>&#160;<xsl:value-of select="cerv:Register/cerv:NumberRegister"/>&#160;</u> 
								от <u>&#160;<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cerv:Register/cerv:DateRegister"/></xsl:call-template> г.&#160;</u> 
								под № <u>&#160;<xsl:value-of select="cerv:RegistrationNumber"/>&#160;</u> 
								от <u>&#160;<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cerv:IssueDateDoc"/></xsl:call-template>г.&#160;</u> 
								настоящим удостоверяется, что судно</td>
							</tr>
							<tr style="border-bottom:1px solid;" align="center">
								<td>
									<xsl:value-of select="cerv:Vessel/cerv:RegName"/>
									<xsl:if test="not(cerv:Vessel/cerv:RegName)"><xsl:value-of select="cerv:Vessel/cerv:Name"/></xsl:if>
								</td>
							</tr>
							<tr>
								<td class="graph8" align="center">(название судна)</td>
							</tr>
							<tr style="border-bottom:1px solid;" align="center">
								<td>&#160;</td>
							</tr>
							<tr>
								<td class="graph8" align="center">(реквизиты документов, на основании которых судно исключено из реестра)</td>
							</tr>
						</table>
						<table class="w190">
							<tr>
								<td style="width:40%">
									<xsl:if test="cerv:DateExclusion">
										c&#32; 
										<u><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cerv:DateExclusion"/></xsl:call-template>г.</u>
										&#160;
									</xsl:if>
									исключено из
								</td>
								<td style="border-bottom:1px solid;">&#160;</td>
							</tr>
							<tr>
								<td style="width:15%"/>
								<td class="graph8" align="center">(наименование реестра)</td>
							</tr>
							<tr>
								<td colspan="2">с прекращением всех зарегистрированных прав и обременений.</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td><br/>Капитан морского порта</td>
						</tr>
						<tr>
							<td style="border-bottom:1px solid;" align="center"><xsl:value-of select="cerv:RegPort"/></td>
						</tr>
						<tr>
							<td class="graph8" align="center">(наименование морского порта)</td>
						</tr>
						<tr>
							<td align="center" style="border-bottom:1px solid;"><xsl:apply-templates select="cerv:Captain"/></td>
						</tr>
						<tr>
							<td class="graph8" align="center">(подпись, инициалы, фамилия)</td>
						</tr>
					</table>
					<br/><br/>
					М.П.<br/><br/>
					"____" _________________ 20__г.
				</div>
				<div class="page">
					<h3 align="center">ДОПОЛНИТЕЛЬНЫЕ СВЕДЕНИЯ</h3>
					<table class="w190">
						<tr>
							<td style="width:40%; border:1px solid gray;">Идентификатор документа по БД РД</td>
							<td style="width:60%; border:1px solid gray;"><xsl:value-of select="cerv:BDRDID"/></td>
						</tr>
						<tr>
							<td style="width:40%; border:1px solid gray;">Реквизиты судна</td>
							<td style="width:60%; border:1px solid gray;"><xsl:apply-templates select="cerv:Vessel"/></td>
						</tr>
						<xsl:if test="cerv:Shipowner/RUScat_ru:IdentityCard or cerv:Shipowner/RUScat_ru:Contact">
							<tr>
								<td style="width:40%; border:1px solid gray;">Доп. сведения о судовладельце</td>
								<td style="width:60%; border:1px solid gray;">
									<xsl:apply-templates select="cerv:Shipowner/RUScat_ru:IdentityCard"/>
									<xsl:if test="cerv:Shipowner/RUScat_ru:IdentityCard and cerv:Shipowner/RUScat_ru:Contact"><br/></xsl:if>
									<xsl:apply-templates select="cerv:Shipowner/RUScat_ru:Contact"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="cerv:PreviousRegistration">
							<tr>
								<td style="width:40%; border:1px solid gray;">Информация о предыдущей регистрации</td>
								<td style="width:60%; border:1px solid gray;">
									<i>Порт предыдущей регистрации: </i><xsl:value-of select="cerv:PreviousRegistration/cerv:PreviousPort"/><br/>
									<i>Дата аннулирования: </i>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cerv:PreviousRegistration/cerv:CancelDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="cerv:Shipowner">
		<xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:ShortName">
			<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
			<xsl:if test="not(RUScat_ru:OrganizationName)"><xsl:value-of select="RUScat_ru:ShortName"/></xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Address">
			<xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:ShortName">,&#160;</xsl:if>
			<xsl:apply-templates select="RUScat_ru:Address"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:RFOrganizationFeatures">
			<xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:ShortName or RUScat_ru:Address">,&#160;</xsl:if>
			<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationFullDatas">
			<xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:ShortName or RUScat_ru:Address or RUScat_ru:RFOrganizationFeatures">,&#160;</xsl:if>
			<xsl:apply-templates select="RUScat_ru:OrganizationFullDatas"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cerv:Vessel">
		<i>Идентификационный номер ИМО: </i><xsl:value-of select="cerv:IMO"/><br/>
		<i>Наименование судна: </i><xsl:value-of select="cerv:Name"/><br/>
		<xsl:if test="cerv:RegName"><i>Наименование судна на момент регистрации: </i><xsl:value-of select="cerv:RegName"/><br/></xsl:if>
		<xsl:if test="cerv:PreviousName"><i>Прежнее наименование судна: </i><xsl:value-of select="cerv:PreviousName"/><br/></xsl:if>
		<xsl:if test="cerv:TypeVessel"><i>Тип судна: </i><xsl:apply-templates select="cerv:TypeVessel"/><br/></xsl:if>
		<i>Год постройки судна: </i><xsl:value-of select="cerv:Year"/><br/>
		<i>Флаг: </i><xsl:value-of select="cerv:Flag"/>
	</xsl:template>
	
	<!-- Шаблон для типа RUScat_ru:AddressType -->
	<xsl:template match="RUScat_ru:Address">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="not(RUScat_ru:CounryName)"><xsl:value-of select="RUScat_ru:CountryCode"/></xsl:if>
			<xsl:value-of select="RUScat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town or RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
			<xsl:if test="not(RUScat_ru:Town)"><xsl:value-of select="RUScat_ru:City"/></xsl:if>
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
		<xsl:if test="RUScat_ru:AddressText and not(RUScat_ru:PostalCode or RUScat_ru:Region or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room)">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<!--xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:ContactType -->
	<xsl:template match="RUScat_ru:Contact">
		<i>Контактная информация:</i><br/>
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
			<xsl:text>адрес эл. почты: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:IdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<i>Документ, удостоверяющий личность судовладельца:</i><br/>
		<xsl:if test="cat_ru:IdentityCardCode or RUScat_ru:FullIdentityCardName">
			(<xsl:value-of select="cat_ru:IdentityCardCode"/>
			<xsl:if test="RUScat_ru:FullIdentityCardName">&#160;<xsl:value-of select="RUScat_ru:FullIdentityCardName"/></xsl:if>)
		</xsl:if>		
		<xsl:if test="cat_ru:IdentityCardName">
			<xsl:text> </xsl:text>	
			<xsl:value-of select="cat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<xsl:text>серия </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			<xsl:text> </xsl:text>
		</xsl:if>				
		<xsl:if test="cat_ru:IdentityCardNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName or RUScat_ru:IssuerCode">выдан </xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName or RUScat_ru:IssuerCode">
			&#160;<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">&#160;ID органа гос.власти: <xsl:value-of select="RUScat_ru:AuthorityId"/></xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">&#160;код страны: <xsl:value-of select="RUScat_ru:CountryCode"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:INN">
			ИНН <xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<xsl:if test="cat_ru:INN">, </xsl:if>
			ОГРН <xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="cerv:Captain">
		<xsl:value-of select="concat(substring(cat_ru:PersonName, 1, 1),'.')"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:value-of select="concat(substring(cat_ru:PersonMiddleName, 1, 1), '.')"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonSurname"/>
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
