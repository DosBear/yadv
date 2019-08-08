<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:paycd="urn:customs.ru:Information:ExchangeDocuments:PaymentConfirmDocs:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа PaymentConfirmDocsType -->
	<xsl:template match="paycd:PaymentConfirmDocs">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									font-family: Arial;
									}

									div.page {
									width: 180mm;
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
									border: 1px solid gray;
									}

									.graph {
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
									
									.graphMain
									{
									font-family: Arial;
									font-size: 10pt;
									font-weight: normal;
									}
									.graphLittle
									{
									font-family: Arial;
									font-size: 7pt;
									text-align:center;
									padding-top:0
									}
									.bb
									{
									border-bottom: solid 1pt windowtext;
									}
								
					</style>
			</head>
			<body>
				<div class="page">
					<table class="w180">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Сведения о платежных документах,<br/>подтверждающих уплату таможенных платежей</b>
										<br/>
										<br/>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="paycd:TPORegNumber">
						<div class="annot graphMain">Справочный номер ТПО:
							<xsl:call-template name="number_template">
								<xsl:with-param name="code" select="paycd:TPORegNumber/paycd:CustomsCode"/>
								<xsl:with-param name="date" select="paycd:TPORegNumber/paycd:RegistrationDate"/>
								<xsl:with-param name="number" select="paycd:TPORegNumber/paycd:DocNumber"/>
							</xsl:call-template>
						</div>
						<br/>
					</xsl:if>
					<div class="annot graphMain">
						Регистрационный  номер таможенного документа,на основании которого осуществляется таможенное декларирование:
						<xsl:choose>
							<xsl:when test="paycd:DocID/paycd:DTRegNum">
								<xsl:call-template name="number_template">
									<xsl:with-param name="code" select="paycd:DocID/paycd:DTRegNum/cat_ru:CustomsCode"/>
									<xsl:with-param name="date" select="paycd:DocID/paycd:DTRegNum/cat_ru:RegistrationDate"/>
									<xsl:with-param name="number" select="paycd:DocID/paycd:DTRegNum/cat_ru:GTDNumber"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="paycd:DocID/paycd:MPORegNum">
								<xsl:call-template name="number_template">
									<xsl:with-param name="code" select="paycd:DocID/paycd:MPORegNum/paycd:CustomsCode"/>
									<xsl:with-param name="date" select="paycd:DocID/paycd:MPORegNum/paycd:RegistrationDate"/>
									<xsl:with-param name="number" select="paycd:DocID/paycd:MPORegNum/paycd:MPO_Number"/>
								</xsl:call-template>
							</xsl:when>
						</xsl:choose>
						<br/>
						<br/>
					</div>
					<xsl:if test="paycd:PaymentDocument">
						<div>
							<div class="graphMain">Платежные документы:</div>
							<br/>
							<table class="bordered w180">
								<tbody>
									<tr class="title">
										<td class="graphMain bordered">№ п/п</td>
										<td class="graphMain bordered">Документ</td>
										<td class="graphMain bordered">Сумма платежей</td>
										<td class="graphMain bordered">Исходная сумма</td>
										<td class="graphMain bordered">Способ платежа</td>
										<td class="graphMain bordered">Код  валюты</td>
									</tr>
									<xsl:for-each select="paycd:PaymentDocument">
										<tr>
											<td class="graphMain bordered">
												<xsl:value-of select="position()"/>
											</td>
											<td class="graphMain bordered">
												<xsl:value-of select="cat_ru:PrDocumentName"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</td>
											<td class="graphMain bordered">
												<xsl:value-of select="paycd:Amount"/>
											</td>
											<td class="graphMain bordered">
												<xsl:value-of select="paycd:TotalAmount"/>
											</td>
											<td class="graphMain bordered">
												<xsl:value-of select="paycd:PaymentMethodCode"/>
											</td>
											<td class="graphMain bordered">
												<xsl:value-of select="paycd:CurrencyCode"/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
						<br/>
					</xsl:if>
					<xsl:if test="paycd:OrderPayment">
						<div class="graphMain">
							<xsl:apply-templates select="paycd:OrderPayment"/>
						</div>
					</xsl:if>
					<xsl:if test="paycd:Payer">
						<xsl:apply-templates select="paycd:Payer"/>
						<table class="w180">
							<xsl:if test="paycd:Payer/RUScat_ru:SubjectAddressDetails">
								<tr>
									<td style="width:60mm" class="graphMain">Адрес</td>
									<td class="graphMain bb" style="width:130mm">
										<xsl:for-each select="paycd:Payer/RUScat_ru:SubjectAddressDetails">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="paycd:Payer/RUScat_ru:CommunicationDetails">
								<tr>
									<td style="width:60mm" class="graphMain">Контакты</td>
									<td class="graphMain bb" style="width:130mm">
										<xsl:if test="paycd:Payer/RUScat_ru:CommunicationDetails/cat_ru:Phone">
											тел.
											<xsl:for-each select="paycd:Payer/RUScat_ru:CommunicationDetails/cat_ru:Phone">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text>, </xsl:text>
												</xsl:if>
											</xsl:for-each>;
										</xsl:if>
										<xsl:if test="paycd:Payer/RUScat_ru:CommunicationDetails/cat_ru:Fax">
											<xsl:text>факс: </xsl:text>
											<xsl:value-of select="paycd:Payer/RUScat_ru:CommunicationDetails/cat_ru:Fax"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td style="width:60mm" class="graphMain">Номер таможенной платежной карты</td>
								<td class="graphMain bb" valign="bottom" style="width:130mm">
									<xsl:value-of select="paycd:Payer/paycd:CardNumber"/>
								</td>
							</tr>
							<tr>
								<td style="width:60mm" class="graphLittle"/>
								<td class="graphLittle" style="width:130mm">
									(номер таможенной платежной карты, с использованием который был осуществлен платеж)
								</td>
							</tr>
						</table>
						<table class="w180">
							<tr>
								<td class="graphMain" style="width:65mm">
								Документ, удостоверяющий личность
							</td>
								<td class="graphMain bb" style="width:125mm">
									<xsl:apply-templates select="paycd:Payer/RUScat_ru:IdentityCard"/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle" style="width:65mm">

							</td>
								<td class="graphLittle" style="width:125mm">
								(документ, удостоверяющий личность)
							</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="paycd:Comment">
						<br/>
						<table class="w180">
							<tr>
								<td class="annot graphMain" style="width:50%">Примечание: <xsl:value-of select="paycd:Comment"/>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="paycd:Payer">
		<table class="w180" style="margin-top:5mm">
			<tr>
				<td class="graphMain" style="width:48mm">
							Реквизиты плательщика
				</td>
				<td class="graphMain bb" style="width:142mm">
					<xsl:value-of select="cat_ru:OrganizationName"/>
					<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
						<xsl:value-of select="cat_ru:ShortName"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
			</tr>
		</table>
		<table class="w180">
			<tr>
				<td style="width:10mm" class="graphMain">
					ИНН
				</td>
				<td style="width:40mm" class="graphMain bb">
					<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</td>
				<td style="width:10mm"/>
				<td style="width:10mm" class="graphMain">
					КПП
				</td>
				<td style="width:40mm" class="graphMain bb">
					<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				</td>
				<td style="width:10mm"/>
				<td/>
			</tr>
			<tr>
				<td style="width:10mm" class="graphLittle">
				</td>
				<td style="width:40mm" class="graphLittle">
					<xsl:text>(ИНН)</xsl:text>
				</td>
				<td style="width:10mm" class="graphLittle"/>
				<td style="width:10mm" class="graphLittle">
				</td>
				<td style="width:40mm" class="graphLittle">
					<xsl:text>(КПП)</xsl:text>
				</td>
				<td style="width:10mm" class="graphLittle"/>
				<td/>
			</tr>
		</table>
	</xsl:template>
	<!--Документ, удостоверяющий личность-->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="RUScat_ru:IdentityCardCode">
			Код вида документа: <xsl:value-of select="RUScat_ru:IdentityCardCode"/>,
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			Серия и номер:
			<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
			<xsl:text>, выдан </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--Сумма авансовых платежей-->
	<xsl:template match="paycd:OrderPayment">Сумма авансовых платежей, подлежащих списанию с лицевого счета по распоряжению плательщика:<xsl:value-of select="RUScat_ru:Amount"/>&#160;<xsl:value-of select="RUScat_ru:CurrencyCode"/>
	</xsl:template>
	<xsl:template match="*" mode="commaSeparated">
		<xsl:if test="position() > 1">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="spaceSeparated">
		<xsl:if test="position() > 1">
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<!--Шаблон номера-->
	<xsl:template name="number_template">
		<xsl:param name="code"/>
		<xsl:param name="date"/>
		<xsl:param name="number"/>
		<xsl:value-of select="$code"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gdt_date">
			<xsl:with-param name="dateIn" select="$date"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$number"/>
	</xsl:template>
	<xsl:template name="gdt_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,1,4)"/>
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
