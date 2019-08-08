<?xml version="1.0" encoding="UTF-8"?>
<!-- Форма ТС: Решение Коллегии Евразийской экономической комиссии от 25 декабря 2012 г. N 293 (с учётом изменений, внесенных Решением Коллегии ЕЭК № 154 от 15.11.2016 г.) -->
<!-- дата опубликования Решения Коллегии ЕЭК № 154 от 15.11.2016 г. - 22.11.2016 г. (вступило в силу через 30 дней (22.12.2016)-->
<!-- Форма Росстандарта: Постановления Госстандарта России от 17.03.98 № 11 “Об утверждении положения о системе сертификации ГОСТ Р” (ред. от 22.04.02) и № 12 «Об утверждении правил по сертификации “Система сертификации ГОСТ Р. Формы основных документов, применяемых в системе”» (ред. от 24.11.05). -->
<xsl:stylesheet exclude-result-prefixes="cos catSert_ru cat_ru" version="1.0" xmlns:catSert_ru="urn:customs.ru:Information:SertifDocuments:SertifCommonAggregateTypesCust:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cos="urn:customs.ru:Information:SertifDocuments:ConformanceSertif:5.14.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
	<xsl:template mode="withComma" match="*">
		<xsl:value-of select="."/>
		<xsl:text>, </xsl:text>
	</xsl:template>
	<xsl:template name="Address">
		<br/>
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text> Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:value-of select="cat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CounryName">
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode"> (<xsl:value-of select="RUScat_ru:CountryCode"/>)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">
			<xsl:if test="cat_ru:PostalCode">, </xsl:if>
			<xsl:if test="cat_ru:CounryName">
				<xsl:value-of select="cat_ru:CounryName"/>
			</xsl:if>
			<xsl:if test="cat_ru:CountryCode"> (<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="cat_ru:Region"/>
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
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">
			<xsl:if test="cat_ru:PostalCode or cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City or cat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="cat_ru:TerritoryCode"/>
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
		<!--xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode"-->
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO">
			<xsl:text> (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/>
			</xsl:if>
			<!--xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOGUID"/></xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOID"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if-->
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cos:ConformanceSertif">
		<html>
			<head>
				<title>Сертификат соответствия</title>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						/*height: 297mm;*/
						width: 210mm;
						max-width: 210mm;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding:	10mm;
						/*padding-left:	20mm;*/
						background: #ffffff;
						border: solid 1pt #000000;
						}

					.marg-top
						{
						margin-top:3mm;
						font-family: Times New Roman;
						font-weight: bold;
						}

					.marg-t1
						{
						margin-top:2mm;
						margin-bottom:3mm;
						font-family: Impact;
						font-size: 18pt;
						}

					.marg-t2
						{
						margin-top:2mm;
						margin-bottom:2mm;
						font-family: Times New Roman;
						font-size: 14pt;
						font-weight: bold;
						}

					.status
						{
						color: red;
						font-weight: bold;
						}

					.bordered {
						border: solid 1pt #000000;
						padding-top:4pt;
						padding-bottom:4pt;
						padding-left:4pt;
						padding-right:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						
					.underlined {
						border-bottom: solid 0.8pt #000000;
						}
						
					p.NumberDate {
						font-weight: bold;
						}
						
					.graph {
						font-family: Arial;
						font-size: 8pt;
						}
					td {
						font-family:Courier New;
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
					.remark {
						text-align:right;
						text-decoration: underline;
					}
					.value{
						border-bottom: solid 1px black;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table style="border-left:solid 1pt #000000;border-top:solid 1pt #000000;border-right:solid 1pt #000000; border-bottom:solid 1pt #000000;" width="100%">
						<tr>
							<xsl:choose>
								<xsl:when test="cos:CertificateSign=0">
									<td align="center" class="graph">
										<div class="marg-t1" style="color: silver">
											<xsl:choose>
												<xsl:when test="number(translate(cos:BeginDate,'-','')) &gt;= number('20161222')">ЕВРАЗИЙСКИЙ ЭКОНОМИЧЕСКИЙ СОЮЗ</xsl:when>
												<xsl:otherwise>ТАМОЖЕННЫЙ СОЮЗ</xsl:otherwise>
											</xsl:choose>
										</div>
									</td>
								</xsl:when>
								<xsl:when test="cos:CertificateSign=1">
									<td align="center" class="value graph">
										<div class="marg-t2" style="color: silver">СИСТЕМА СЕРТИФИКАЦИИ ГОСТ Р<br/>ГОССТАНДАРТ РОССИИ</div>
									</td>
								</xsl:when>
							</xsl:choose>
						</tr>
						<tr>
							<td align="center" class="graph">
								<div class="marg-t1" style="text-shadow: 1px 1px 2px silver">СЕРТИФИКАТ СООТВЕТСТВИЯ</div>
							</td>
						</tr>
						<tr>
							<td align="center" class="graph">
								<table>
									<tr>
										<td align="center" class="graph" style="width:40mm" rowspan="3">
											<xsl:choose>
												<xsl:when test="cos:CertificateSign=0">
													<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAMAAAAp4XiDAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDoAABSCAABFVgAADqXAAAXb9daH5AAAAMAUExURQAAAP///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGd27GMAAAACdFJOU/8A5bcwSgAAAFFJREFUeNrsVkEOACAIgtb/v0y3mvPQ6mSmN9w4oDAlcVoNQSkdADQhDfIdRtZyK38qw2YOsbUU5WfKcrKMXZU6lbX9oryYSl/KeF6Z6FMaAwAdpQlx0OI7gAAAAABJRU5ErkJggg==" alt=""/>
												</xsl:when>
												<xsl:when test="cos:CertificateSign=1">
													<img src="data:image/png;base64,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" alt=""/>
												</xsl:when>
											</xsl:choose>
										</td>
										<td align="center" class="graph" style="width:30mm" rowspan="3"/>
										<td class="graph" style="width:120mm" valign="bottom">
											<b>
												<xsl:text>№ </xsl:text>
												<xsl:if test="cos:CertificateSign=0">
													<xsl:choose>
														<xsl:when test="number(translate(cos:BeginDate,'-','')) &gt;= number('20161222')">ЕАЭС </xsl:when>
														<xsl:otherwise>ТС </xsl:otherwise>
													</xsl:choose>
												</xsl:if>
											</b>
											<u>
												<xsl:if test="cos:CertificateSign=0">
													<xsl:value-of select="cos:RegistrationNumber/cos:CustomsCountryCode"/>
													<xsl:text>/</xsl:text>
												</xsl:if>
												<xsl:value-of select="cos:RegistrationNumber/cos:SertifNumber"/>
											</u>
											<b>
												<xsl:text> от </xsl:text>
											</b>
											<u>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cos:RegistrationDate"/>
												</xsl:call-template>
											</u>
											<span class="status">
												<xsl:choose>
													<xsl:when test="cos:Status='2'"> (действие приостановлено)</xsl:when>
													<xsl:when test="cos:Status='3'"> (действие временно приостановлено)</xsl:when>
													<xsl:when test="cos:Status='5'"> (действие прекращено)</xsl:when>
													<xsl:when test="cos:Status='7'"> (действие аннулировано)</xsl:when>
													<xsl:when test="cos:Status='8'"> (в архиве)</xsl:when>
													<xsl:when test="cos:Status='9'"> (не опубликован)</xsl:when>
													<xsl:when test="cos:Status='10'"> (исключен из реестра)</xsl:when>
												</xsl:choose>
											</span>
										</td>
									</tr>
									<tr>
										<td class="graph" valign="bottom">
											<xsl:if test="cos:CertificateSign=1">
												<b>
													<xsl:text>Срок действия с </xsl:text>
												</b>
												<u>
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="cos:BeginDate"/>
													</xsl:call-template>
												</u>
												<xsl:if test="cos:EndDate">
													<b>
														<xsl:text> по </xsl:text>
													</b>
													<u>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="cos:EndDate"/>
														</xsl:call-template>
													</u>
												</xsl:if>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="graph" valign="bottom">
											<b>
												<xsl:text>Серия </xsl:text>
											</b>
											<u>
												<xsl:value-of select="cos:FormNumber/cos:CustomsCountryCode"/>
											</u>
											<b>
												<xsl:text> Номер </xsl:text>
											</b>
											<u>
												<xsl:value-of select="cos:FormNumber/cos:Number"/>
											</u>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<xsl:if test="cos:SertifOrganization">
							<tr>
								<td class="graph">
									<div class="marg-top">ОРГАН ПО СЕРТИФИКАЦИИ</div>
									<xsl:value-of select="cos:SertifOrganization/cat_ru:OrganizationName"/> 
							<xsl:if test="cos:SertifOrganization/cat_ru:RFOrganizationFeatures">
										<xsl:value-of select="cos:SertifOrganization/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
								<xsl:value-of select="cos:SertifOrganization/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
								<xsl:value-of select="cos:SertifOrganization/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
							</xsl:if>
									<xsl:text> </xsl:text>
									<xsl:value-of select="cos:SertifOrganization/catSert_ru:OKPOID"/>
									<xsl:text> </xsl:text>
									<xsl:if test="cos:SertifOrganization/cat_ru:RBOrganizationFeatures">
										<xsl:value-of select="cos:SertifOrganization/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/> 
							</xsl:if>
									<xsl:if test="cos:SertifOrganization/cat_ru:RKOrganizationFeatures">
										<xsl:value-of select="cos:SertifOrganization/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/> 
								<xsl:value-of select="cos:SertifOrganization/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/> 
								<xsl:value-of select="cos:SertifOrganization/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/<xsl:value-of select="cos:SertifOrganization/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/<xsl:value-of select="cos:SertifOrganization/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/<xsl:value-of select="cos:SertifOrganization/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:if test="cos:SertifOrganization/catSert_ru:LegalAddress">
										<br/>Юридический адрес: 
									</xsl:if>
									<xsl:for-each select="cos:SertifOrganization/catSert_ru:LegalAddress">
										<xsl:call-template name="Address"/> 
									</xsl:for-each>
									<xsl:if test="cos:SertifOrganization/catSert_ru:FactAddress">
										<br/>Фактический адрес: 
									</xsl:if>
									<xsl:for-each select="cos:SertifOrganization/catSert_ru:FactAddress">
										<xsl:call-template name="Address"/> 
									</xsl:for-each>
									<!--xsl:value-of select="cos:SertifOrganization/cat_ru:OGRN"/--> 
									<xsl:if test="cos:SertifOrganization/catSert_ru:LegalAddress or cos:SertifOrganization/catSert_ru:FactAddress">
										<br/>
									</xsl:if>
									<xsl:apply-templates mode="withComma" select="cos:SertifOrganization/catSert_ru:Phone"/> 
							<xsl:apply-templates mode="withComma" select="cos:SertifOrganization/catSert_ru:Fax"/> 
							<xsl:apply-templates mode="withComma" select="cos:SertifOrganization/catSert_ru:Email"/> 
							<xsl:if test="cos:SertifOrganization/cos:HeadOfTheOrganization">
										<br/>ФИО руководителя органа по сертификации: 
								<xsl:value-of select="cos:SertifOrganization/cos:HeadOfTheOrganization"/>
									</xsl:if>
									<br/>
							Сертификат <xsl:value-of select="cos:SertifOrganization/cos:OrganizationNumber"/> 
							<xsl:value-of select="cos:SertifOrganization/cos:FieldOfAction"/> 
							 от 
							<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cos:SertifOrganization/cos:CertificateDate"/>
									</xsl:call-template> 
							<xsl:if test="cos:SertifOrganization/cos:CertificateOrg">
										<br/>Орган, аккредитовавший орган по сертификации:
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cos:SertifOrganization/cos:CertificateOrg/cat_ru:OrganizationName"/>
									</xsl:if>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="graph">
								<div class="marg-top">ЗАЯВИТЕЛЬ</div>
								<xsl:value-of select="cos:SertifRecipient/cat_ru:OrganizationName"/> 
							<xsl:apply-templates mode="withComma" select="cos:SertifRecipient/catSert_ru:Phone"/> 
							<xsl:apply-templates mode="withComma" select="cos:SertifRecipient/catSert_ru:Fax"/> 

								<xsl:if test="cos:SertifRecipient/catSert_ru:LegalAddress">
									<br/>Юридический адрес: 
								</xsl:if>
								<xsl:for-each select="cos:SertifRecipient/catSert_ru:LegalAddress">
									<xsl:call-template name="Address"/> 
								</xsl:for-each>
								<xsl:if test="cos:SertifRecipient/catSert_ru:FactAddress">
									<br/>Фактический адрес: 
								</xsl:if>
								<xsl:for-each select="cos:SertifRecipient/catSert_ru:FactAddress">
									<xsl:call-template name="Address"/> 
								</xsl:for-each>
								<xsl:if test="cos:SertifRecipient/catSert_ru:LegalAddress or cos:SertifRecipient/catSert_ru:FactAddress">
									<br/>
								</xsl:if>
								<xsl:value-of select="cos:SertifRecipient/catSert_ru:Email"/> 
							<xsl:if test="cos:SertifRecipient/cat_ru:RFOrganizationFeatures">
									<xsl:value-of select="cos:SertifRecipient/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
								<xsl:value-of select="cos:SertifRecipient/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
								<xsl:value-of select="cos:SertifRecipient/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
							</xsl:if>
								<xsl:if test="cos:SertifRecipient/cat_ru:RBOrganizationFeatures">
									<xsl:value-of select="cos:SertifRecipient/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/> 
							</xsl:if>
								<xsl:if test="cos:SertifRecipient/cat_ru:RKOrganizationFeatures">
									<xsl:value-of select="cos:SertifRecipient/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/> 
								<xsl:value-of select="cos:SertifRecipient/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/> 
								<xsl:value-of select="cos:SertifRecipient/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/<xsl:value-of select="cos:SertifRecipient/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/<xsl:value-of select="cos:SertifRecipient/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/<xsl:value-of select="cos:SertifRecipient/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
								</xsl:if>
								<xsl:for-each select="cos:SertifRecipient">
									<xsl:if test="cos:SertifRecipientCategory">
										<br/>
										<xsl:choose>
											<xsl:when test="cos:SertifRecipientCategory=1">Изготовитель</xsl:when>
											<xsl:when test="cos:SertifRecipientCategory=2">Поставщик</xsl:when>
											<xsl:when test="cos:SertifRecipientCategory=3">Продавец</xsl:when>
											<xsl:when test="cos:SertifRecipientCategory=4">Уполномоченное изготовителем лицо</xsl:when>
											<xsl:when test="cos:SertifRecipientCategory=5">Исполнитель</xsl:when>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="cos:OrganizationHead">
										<br/>
										<xsl:text>ФИО руководителя: </xsl:text>
										<xsl:apply-templates select="cos:OrganizationHead"/>
									</xsl:if>
									<xsl:if test="cos:OPF">
										<br/>
										<xsl:text>организационно-правовая форма: </xsl:text>
										<xsl:value-of select="cos:OPF"/>
									</xsl:if>
									<xsl:if test="cos:Organ">
										<br/>
										<xsl:text>регистрирующий орган: </xsl:text>
										<xsl:value-of select="cos:Organ"/>
									</xsl:if>
									<xsl:if test="cos:RegistryDate">
										<br/>
										<xsl:text>дата регистрации: </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cos:RegistryDate"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="cos:Egr">
										<br/>
										<xsl:text>ЕГР </xsl:text>
										<xsl:value-of select="cos:Egr"/>
									</xsl:if>
									<xsl:if test="cos:SNILS">
										<br/>
										<xsl:text>СНИЛС </xsl:text>
										<xsl:value-of select="cos:SNILS"/>
									</xsl:if>
									<xsl:if test="cos:SertifRecipientModeCode">
										<br/>
										<xsl:choose>
											<xsl:when test="cos:SertifRecipientModeCode='Ul' or cos:SertifRecipientModeCode='Ю'">Юридическое лицо</xsl:when>
											<xsl:when test="cos:SertifRecipientModeCode='Fl' or cos:SertifRecipientModeCode='Ф'">Физическое лицо</xsl:when>
											<xsl:when test="cos:SertifRecipientModeCode='Al'">Иностранное юридическое лицо</xsl:when>
											<xsl:when test="cos:SertifRecipientModeCode='Fp'">Индивидуальный предприниматель</xsl:when>
											<xsl:when test="cos:SertifRecipientModeCode='Aa'">Уполномоченное иностр. изг. лицо</xsl:when>
										</xsl:choose>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="graph">
								<div class="marg-top">ИЗГОТОВИТЕЛЬ</div>
								<xsl:value-of select="cos:ManufacturerInf/cat_ru:OrganizationName"/> 
							<xsl:apply-templates mode="withComma" select="cos:ManufacturerInf/catSert_ru:Phone"/> 
							<xsl:apply-templates mode="withComma" select="cos:ManufacturerInf/catSert_ru:Fax"/> 
								<xsl:if test="cos:ManufacturerInf/catSert_ru:LegalAddress">
									<br/>Юридический адрес: 
								</xsl:if>
								<xsl:for-each select="cos:ManufacturerInf/catSert_ru:LegalAddress">
									<xsl:call-template name="Address"/> 
								</xsl:for-each>
								<xsl:if test="cos:ManufacturerInf/catSert_ru:FactAddress">
									<br/>Фактический адрес: 
								</xsl:if>
								<xsl:for-each select="cos:ManufacturerInf/catSert_ru:FactAddress">
									<xsl:call-template name="Address"/> 
								</xsl:for-each>
								<xsl:if test="cos:ManufacturerInf/catSert_ru:LegalAddress or cos:ManufacturerInf/catSert_ru:FactAddress">
									<br/>
								</xsl:if>
								<xsl:if test="cos:ManufacturerInf/catSert_ru:Email">
									<xsl:value-of select="cos:ManufacturerInf/catSert_ru:Email"/> 
								</xsl:if>
								<xsl:if test="cos:ManufacturerInf/cat_ru:RFOrganizationFeatures">
									<xsl:value-of select="cos:ManufacturerInf/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
									<xsl:value-of select="cos:ManufacturerInf/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
									<xsl:value-of select="cos:ManufacturerInf/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
								</xsl:if>
								<xsl:if test="cos:ManufacturerInf/cat_ru:RBOrganizationFeatures">
									<xsl:value-of select="cos:ManufacturerInf/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/> 
								</xsl:if>
								<xsl:if test="cos:ManufacturerInf/cat_ru:RKOrganizationFeatures">
									<xsl:value-of select="cos:ManufacturerInf/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/> 
									<xsl:value-of select="cos:ManufacturerInf/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/> 
									<xsl:value-of select="cos:ManufacturerInf/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/<xsl:value-of select="cos:ManufacturerInf/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/<xsl:value-of select="cos:ManufacturerInf/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/<xsl:value-of select="cos:ManufacturerInf/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
								</xsl:if>
								<xsl:if test="cos:ManufacturerInf/cos:ManufacturerOrgModeCode">
									<xsl:choose>
										<xsl:when test="cos:ManufacturerInf/cos:ManufacturerOrgModeCode='Ul'">Юридическое лицо</xsl:when>
										<xsl:when test="cos:ManufacturerInf/cos:ManufacturerOrgModeCode='Fp'">Индивидуальный предприниматель</xsl:when>
										<xsl:when test="cos:ManufacturerInf/cos:ManufacturerOrgModeCode='Al'">Иностранное юридическое лицо</xsl:when>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="cos:ManufacturerInf/cos:OPF">
									<br/>
									<xsl:text>организационно-правовая форма: </xsl:text>
									<xsl:value-of select="cos:ManufacturerInf/cos:OPF"/>
								</xsl:if>
								<xsl:if test="cos:ManufacturerInf/cos:Appends">
									<br/>
									<xsl:apply-templates select="cos:ManufacturerInf/cos:Appends"/>
								</xsl:if>
								<xsl:if test="cos:ManufacturerInf/cos:SubdivisionInfo">
									<br/>Филиалы:
									<xsl:for-each select="cos:ManufacturerInf/cos:SubdivisionInfo">
										<xsl:value-of select="cat_ru:OrganizationName"/> 
										<xsl:if test="cat_ru:ShortName">
											<xsl:value-of select="cat_ru:ShortName"/> </xsl:if>
										<xsl:if test="cat_ru:OrganizationLanguage">
											<xsl:value-of select="cat_ru:OrganizationLanguage"/> </xsl:if>
										<xsl:if test="cat_ru:RFOrganizationFeatures">
											<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
											<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
											<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
										</xsl:if>
										<xsl:if test="cat_ru:RBOrganizationFeatures">
											<xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/> 
											<xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:RBIdentificationNumber"/> 
										</xsl:if>
										<xsl:if test="cat_ru:RKOrganizationFeatures">
											<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:BIN"/> 
											<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:IIN"/> 
											<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
										</xsl:if>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:for-each select="cos:Address">
											<xsl:call-template name="Address"/>
										</xsl:for-each>
										<xsl:if test="cos:Appends">
											<br/>
											<xsl:apply-templates select="cos:Appends"/>
										</xsl:if>
										<xsl:variable name="coun" select="count(//cos:SubdivisionInfo)"/>
										<xsl:if test="($coun)>1">; </xsl:if>
									</xsl:for-each>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="graph">
								<div class="marg-top">ПРОДУКЦИЯ</div>
								<xsl:for-each select="cos:Goods">
									<xsl:if test="cos:AppendNumber">
										<xsl:text> прил. № </xsl:text>
										<xsl:value-of select="cos:AppendNumber"/>
										<xsl:text>; </xsl:text>
									</xsl:if>
									<xsl:if test="AppendsFormNumber">
										&#160;бланк <xsl:value-of select="cos:AppendsFormNumber"/>
										<xsl:text>; </xsl:text>
									</xsl:if>
									<xsl:for-each select="cos:GoodsDescription">
										<xsl:value-of select="."/>
									</xsl:for-each>
									<xsl:if test="cos:SeriesSign">
										<xsl:text>; </xsl:text>
										<xsl:choose>
											<xsl:when test="cos:SeriesSign='1'">единичное изделие</xsl:when>
											<xsl:when test="cos:SeriesSign='2'">партия</xsl:when>
											<xsl:when test="cos:SeriesSign='3'">серийный выпуск</xsl:when>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="cos:ProductCode">
										<xsl:text>; код по ОК005: </xsl:text>
										<xsl:for-each select="cos:ProductCode">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="cos:PartySize">
										<xsl:text>; размер партии </xsl:text>
										<xsl:value-of select="cos:PartySize"/>
									</xsl:if>
									<xsl:if test="cos:SerialNumber">
										<xsl:text>; </xsl:text>
										<xsl:apply-templates select="cos:SerialNumber"/>
									</xsl:if>
									<xsl:if test="cos:SeriesSign!='3'">
										<xsl:text>; </xsl:text>
										<xsl:for-each select="cos:ShippingDocuments">
											<xsl:for-each select="*">
												<xsl:choose>
													<xsl:when test="local-name(.)='PrDocumentDate'"> от <xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="."/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="."/>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:if test="position()!=last()">
													<xsl:text> </xsl:text>
												</xsl:if>
											</xsl:for-each>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="cos:TechnicalRegulations">
										<xsl:text>; </xsl:text>
										<xsl:value-of select="cos:TechnicalRegulations"/>
									</xsl:if>
									<xsl:if test="cos:ProductTypeInfo">
										<xsl:text>; </xsl:text>
										<xsl:value-of select="cos:ProductTypeInfo"/>
									</xsl:if>
									<xsl:if test="cos:Ekps">
										<xsl:text>; ЕКПС </xsl:text>
										<xsl:value-of select="cos:Ekps"/>
									</xsl:if>
									<xsl:if test="cos:GoodsOKPD2">
										<xsl:text>; код по ОКПД2: </xsl:text>
										<xsl:for-each select="cos:GoodsOKPD2">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="cos:ContractInfo">
										<xsl:text>; контракт: </xsl:text>
										<xsl:apply-templates select="cos:ContractInfo"/>
									</xsl:if>
									<xsl:if test="cos:OtherInfo">
										<xsl:text>; </xsl:text>
										<xsl:apply-templates select="cos:OtherInfo"/>
									</xsl:if>
									<xsl:if test="position()!=last()">
										<br/>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="graph">
								<div class="marg-top">КОД ТН ВЭД
									<xsl:if test="cos:CertificateSign=0">
										<xsl:choose>
											<xsl:when test="number(translate(cos:BeginDate,'-','')) &gt;= number('20161222')"> ЕАЭС</xsl:when>
											<xsl:otherwise> ТС</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</div>
								<xsl:for-each select="cos:Goods/cos:GoodsTNVEDCode">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<xsl:if test="cos:CertifNormDoc">
							<tr>
								<td class="graph">
									<div class="marg-top">СООТВЕТСТВУЕТ ТРЕБОВАНИЯМ</div>
									<xsl:for-each select="cos:CertifNormDoc">
										<xsl:for-each select="cos:DocsDescription">
											<span class="graph">
												<xsl:value-of select="."/>
											</span>
											<!--xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if-->
										</xsl:for-each>
										<xsl:if test="cos:DocumentInfo">
											<span class="graph"> утвержден документом: 
											<xsl:value-of select="cos:DocumentInfo"/>
											</span>
										</xsl:if>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
									<!--<xsl:if test="(cos:NationalDocs) or (cos:FederalDocs)">
											<br/>см. приложение</xsl:if>-->
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="cos:GroundDocs">
							<tr>
								<td class="graph">
									<div class="marg-top">СЕРТИФИКАТ ВЫДАН НА ОСНОВАНИИ</div>
									<xsl:for-each select="cos:GroundDocs">
										<xsl:if test="cat_ru:PrDocumentName">
											<xsl:value-of select="cat_ru:PrDocumentName"/>
										</xsl:if>
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
										<xsl:if test="(cos:OrganizationName) or (cos:OrganizationNumber)">
											<xsl:text> выдан </xsl:text>
											<xsl:value-of select="cos:OrganizationName"/>
											<xsl:if test="cos:OrganizationNumber">
												<xsl:text> № </xsl:text>
												<xsl:value-of select="cos:OrganizationNumber"/>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cos:OrganizationAddress"/>
										</xsl:if>
										<xsl:if test="(cos:BeginDate) or (cos:EndDate)">
											<xsl:text>. Действует</xsl:text>
											<xsl:if test="cos:BeginDate">
												<xsl:text> с </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cos:BeginDate"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="cos:EndDate">
												<xsl:text> по  </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cos:EndDate"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
										<xsl:if test="cos:DocumentsFullName">
											<xsl:text>; </xsl:text>
											<xsl:apply-templates select="cos:DocumentsFullName"/>
										</xsl:if>
										<xsl:if test="cos:Shema">
											<xsl:text>; схема сертификации: </xsl:text>
											<xsl:value-of select="cos:Shema"/>
										</xsl:if>
										<xsl:if test="cos:BasisProduce">
											<xsl:text>; основание выдачи сертификата: </xsl:text>
											<xsl:apply-templates select="cos:BasisProduce"/>
										</xsl:if>
										<xsl:if test="cos:Documents">
											<xsl:text>; прочие документы: </xsl:text>
											<xsl:apply-templates select="cos:Documents"/>
										</xsl:if>
										<xsl:if test="cos:OtherInfo">
											<xsl:text>; прочая информация: </xsl:text>
											<xsl:apply-templates select="cos:OtherInfo"/>
										</xsl:if>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="graph" colspan="3">
								<xsl:if test="cos:AddSertifInf">
									<div class="marg-top">ДОПОЛНИТЕЛЬНАЯ ИНФОРМАЦИЯ</div>
									<xsl:for-each select="cos:AddSertifInf">
										<xsl:value-of select="."/>
										<xsl:text> </xsl:text>
									</xsl:for-each>
								</xsl:if>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
							</td>
						</tr>
						<tr>
							<td align="left" class="graph">
								<table>
									<xsl:if test="cos:CertificateSign=0">
										<tr>
											<td align="left" class="graph" style="width:40mm;">
												<div class="marg-top">СРОК ДЕЙСТВИЯ</div>
											</td>
											<td align="left" class="graph" style="width:30mm;">
													с  <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cos:BeginDate"/>
												</xsl:call-template>
											</td>
											<td align="left" class="graph" style="width:30mm;">
													по 
													<xsl:if test="cos:EndDate">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="cos:EndDate"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td align="left" class="graph" colspan="2" style="width:90mm;">
												<xsl:text disable-output-escaping="yes">включительно</xsl:text>
											</td>
										</tr>
									</xsl:if>
									<xsl:for-each select="cos:ProlongCertificate">
										<xsl:if test="position()=1">
											<tr>
												<td colspan="5" class="graph">
													<div class="marg-top">ПРОДЛЕН</div>
												</td>
											</tr>
										</xsl:if>
										<tr>
											<td align="left" class="graph" style="width:40mm;">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp; №</xsl:text>
												<xsl:value-of select="cos:Number"/>
												<xsl:text> от </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cos:DateNumber"/>
												</xsl:call-template>
											</td>
											<td align="left" class="graph" style="width:30mm;">
												<xsl:text>c </xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cos:BeginDate"/>
												</xsl:call-template>
											</td>
											<td align="left" class="graph" style="width:30mm;">
														по<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
												<xsl:if test="cos:EndDate">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="cos:EndDate"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td align="left" class="graph" style="width:40mm;">
												<xsl:apply-templates select="cos:ReasonDescription"/>
											</td>
											<td align="right" class="graph" style="width:50mm;"/>
										</tr>
										<tr>
											<td align="right" class="graph" style="width:40mm;">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
											</td>
											<td align="right" class="graph" style="width:30mm;">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
											</td>
											<td align="right" class="graph" style="width:30mm;">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
											</td>
											<td align="right" class="graph" colspan="2" style="width:90mm;">
														подписал
														<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
												<xsl:for-each select="cos:ProlongSign">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
													<xsl:value-of select="cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="cat_ru:PersonMiddleName"/>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="cos:SuspendedInfo">
										<xsl:if test="position()=1">
											<tr>
												<td colspan="5" class="graph">
													<div class="marg-top">ПРИОСТАНОВЛЕН</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<xsl:for-each select="cos:RevivedInfo">
										<xsl:if test="position()=1">
											<tr>
												<td colspan="5" class="graph">
													<div class="marg-top">ВОЗОБНОВЛЕН</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<xsl:for-each select="cos:DiscontinuedInfo">
										<xsl:if test="position()=1">
											<tr>
												<td colspan="5" class="graph">
													<div class="marg-top">ПРЕКРАЩЕН</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</table>
							</td>
						</tr>
						<tr>
							<td class="graph" style="width:100%">
								<br/>
								<table border="0">
									<tr>
										<td class="graph" style="width:30mm;" valign="middle" align="center">
													М.П.
									</td>
										<td class="graph" style="width:160mm">
											<xsl:call-template name="end">
												<xsl:with-param name="root" select="cos:DocumentSignature"/>
											</xsl:call-template>
											<xsl:for-each select="cos:ExpertSignature">
												<xsl:call-template name="end">
													<xsl:with-param name="root" select="."/>
												</xsl:call-template>
											</xsl:for-each>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<xsl:if test="cos:CertificateKind or cos:CertifNormDoc or cos:FederalDocs or cos:AppendInfo or cos:Goods/cos:DocManufacturedInfo">
					<div class="page">
						<div class="marg-t2">ДОПОЛНИТЕЛЬНЫЕ СВЕДЕНИЯ</div>
						<br/>
						<table class="w190">
							<tr valign="top">
								<td class="graphMain" style="width:50%">Тип реестра, содержащего сертификат</td>
								<td class="graph value" style="width:50%">
									<xsl:choose>
										<xsl:when test="cos:CertificateKind=0">Реестр сертификатов соответствия продукции требованиям технических регламентов Таможенного Союза</xsl:when>
										<xsl:when test="cos:CertificateKind=1">Реестр сертификатов соответствия продукции требованиям технических регламентов Российской Федереации</xsl:when>
										<xsl:when test="cos:CertificateKind=2">Реестр сертификатов соответствия продукции единого перечня Таможенного Союза</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<xsl:if test="cos:CertifNormDoc">
								<tr valign="top">
									<td class="graphMain" style="width:50%">Сведения о нормативных документах, на соответствие которым произведена сертификация (ГОСТЫ, пункты ГОСТов)</td>
									<td class="graph value" style="width:50%">
										<xsl:for-each select="cos:CertifNormDoc">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">;<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="cos:FederalDocs">
								<tr valign="top">
									<td class="graphMain" style="width:50%">Сведения о документах федеральных  органов, устанавливающих  требования для военной продукции</td>
									<td class="graph value" style="width:50%">
										<xsl:for-each select="cos:FederalDocs">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">;<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<tr valign="top">
								<td class="graphMain" style="width:50%">Сведения о приложениях</td>
								<td class="graph value" style="width:50%">
									<xsl:for-each select="cos:AppendInfo">
										<xsl:if test="cos:AppendNumber">
											<xsl:text>прил. № </xsl:text>
											<xsl:value-of select="cos:AppendNumber"/>
											<xsl:if test="cos:AppendsFormNumber"> (бланк <xsl:value-of select="cos:AppendsFormNumber"/>)</xsl:if>
										</xsl:if>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cos:Append"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cos:CertInfo"/>
										<xsl:if test="position()!=last()">;<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr valign="top">
								<td class="graphMain" style="width:50%">Сведения о документах, на основании которых изготовлена продукция</td>
								<td class="graph value" style="width:50%">
									<xsl:for-each select="cos:Goods">
										<xsl:for-each select="cos:DocManufacturedInfo">
											<xsl:text>Обозначение документов: </xsl:text>
											<xsl:apply-templates select="cos:NormDocs"/>
											<xsl:text> Тех.регламент: </xsl:text>
											<xsl:apply-templates select="cos:TechReg"/>
											<xsl:text> Доп.сведения: </xsl:text>
											<xsl:apply-templates select="cos:TechRegOtherInfo"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="cos:OrganizationHead">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cos:CertifNormDoc| cos:FederalDocs">
		<xsl:for-each select="cos:DocsDescription">
			<xsl:value-of select="."/>
		</xsl:for-each>
		<xsl:if test="cos:Identifier">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cos:Identifier"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="cos:DocumentInfo">
			<xsl:text> утвержден нормативным документом: </xsl:text>
			<xsl:value-of select="cos:DocumentInfo"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="cos:Appends"/>
	</xsl:template>
	<xsl:template match="cos:Appends">
		<xsl:if test="cos:AppendNumber">
			<xsl:text>прил. № </xsl:text>
			<xsl:value-of select="cos:AppendNumber"/>
			<xsl:if test="cos:AppendsFormNumber"> (бланк <xsl:value-of select="cos:AppendsFormNumber"/>)</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="catSert_ru:LegalAddress | cos:FactAddress | cos:OrganizationAddress">
		<xsl:if test="cat_ru:CountryCode">
			<xsl:value-of select="cat_ru:CountryCode"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:value-of select="cat_ru:Region"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:value-of select="cat_ru:City"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>.
	</xsl:template>
	<xsl:template match="cos:Contract | cos:Invoice|cos:ContractInfo">
		<xsl:if test="cat_ru:PrDocumentNumber">№<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от  </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="end">
		<xsl:param name="root"/>
		<xsl:for-each select="$root">
			<table border="0">
				<tr>
					<td class="graph" rowspan="2" style="width:50mm;">
						<xsl:choose>
							<xsl:when test="name(.)='cos:DocumentSignature'">
								<b>Руководитель (уполномоченное лицо) органа по сертификации</b>
							</xsl:when>
							<xsl:when test="name(.)='cos:ExpertSignature'">
								<b>Экспер-аудитор (эксперт)</b>
							</xsl:when>
						</xsl:choose>
					</td>
					<td class="value graph" style="width:40mm">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
					<td class="graph" style="width:5mm;" rowspan="2">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
					<td class="value graph" style="width:75mm" align="center">
						<xsl:value-of select="substring(cat_ru:PersonName, 1, 1)"/>
						<xsl:text>. </xsl:text>
						<xsl:if test="cat_ru:PersonMiddleName">
							<xsl:value-of select="substring(cat_ru:PersonMiddleName, 1, 1)"/>
							<xsl:text>. </xsl:text>
						</xsl:if>
						<xsl:value-of select="cat_ru:PersonSurname"/>
					</td>
				</tr>
				<tr>
					<td align="center" class="graphLittle">
						<i>подпись</i>
					</td>
					<td align="center" class="graphLittle">
						<i>инициалы, фамилия</i>
					</td>
				</tr>
			</table>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cos:SuspendedInfo|cos:RevivedInfo|cos:DiscontinuedInfo">
		<tr>
			<td align="left" class="graph" style="width:40mm;">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;№ </xsl:text>
				<xsl:value-of select="cos:Number|cos:NumberDiscontinued"/>
				<xsl:if test="cos:DateNumber|cos:DateNumberDiscontinued">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cos:DateNumber|cos:DateNumberDiscontinued"/>
					</xsl:call-template>
				</xsl:if>
			</td>
			<td align="left" class="graph" style="width:30mm;">
				<xsl:if test="cos:Date|cos:DateBegin|cos:DateNumberDiscontinued">
					<xsl:text>c</xsl:text>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cos:Date|cos:DateBegin|cos:DateNumberDiscontinued"/>
					</xsl:call-template>
				</xsl:if>
			</td>
			<td align="left" class="graph" style="width:30mm;">
				<xsl:if test="cos:EndDate">
				по<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cos:EndDate"/>
					</xsl:call-template>
				</xsl:if>
			</td>
			<td align="left" class="graph" style="width:40mm;">
				<xsl:apply-templates select="cos:ReasonDescription"/>
				<xsl:choose>
					<xsl:when test="cos:ReasonCode='1'"> (по заявлению)</xsl:when>
					<xsl:when test="cos:ReasonCode='2'"> (по предписанию)</xsl:when>
				</xsl:choose>
			</td>
			<td align="right" class="graph" style="width:50mm;">
				<xsl:if test="cos:DateOrder">
					<xsl:text>дата решения: </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cos:DateOrder"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="cos:AnnulmentType">
					<xsl:value-of select="cos:AnnulmentType"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
