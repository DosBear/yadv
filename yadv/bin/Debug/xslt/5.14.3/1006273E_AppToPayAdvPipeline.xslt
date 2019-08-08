<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:AtPAP="urn:customs.ru:Information:CustomsDocuments:AppToPayAdvPipeline:5.14.3" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.14.3" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
	<!-- Шаблон для типа AppToPayAdvPipelineType -->
	<xsl:template match="AtPAP:AppToPayAdvPipeline">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
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



                  .bordered { border-collapse: collapse; font-size:8pt;}
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
                  .graph8{font-size: 8pt;}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr valign="top">
								<td style="width:66%"/>
								<td style="width:1%">В</td>
								<td style="border-bottom:1px solid black;width:33%;" align="center">
									<xsl:value-of select="AtPAP:CustomsRequisites/cat_ru:OfficeName"/>
									<xsl:if test="AtPAP:CustomsRequisites/cat_ru:OfficeName"> (</xsl:if>
									<xsl:value-of select="AtPAP:CustomsRequisites/cat_ru:Code"/>
									<xsl:if test="AtPAP:CustomsRequisites/cat_ru:OfficeName">)</xsl:if>
								</td>
							</tr>
							<tr>
								<td/>
								<td/>
								<td class="graph8" align="center">(наименование таможенного органа)</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Заявление о зачете авансовых платежей в счет исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых и компенсационных пошлин в отношении товаров, перемещаемых трубопроводным транспортом</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table style="margin:0;">
						<tbody>
							<tr valign="top">
								<td style="width:10%" rowspan="2"/>
								<td class="bordered" rowspan="2" style="width:50%">
									<b>14</b> Декларант <br/>
									<xsl:apply-templates mode="org" select="AtPAP:AtPAPDeclarant"/>
								</td>
								<td class="bordered" style="width:40%">
									<b>А</b> Номер ВТД<br/>
									<xsl:apply-templates mode="gtd_num" select="AtPAP:GtdRegistryNumber"/>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered">
									<b>7</b> Справочный номер<br/>
									ВТД <xsl:value-of select="AtPAP:DeclarationKind"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table style="margin:0;">
						<tbody>
							<xsl:for-each select="AtPAP:AtPAPGoodsShipment">
								<tr valign="top">
									<td class="bordered" style="width:5%">
										<b>32</b> Товар<br/>
									№ <xsl:value-of select="AtPAP:AtPAPGoods/AtPAP:GoodsNumeric"/>
									</td>
									<td class="bordered" style="width:7%">
										<b>47</b> Исчисление платежей
								</td>
									<td class="bordered" style="width: 48%;padding:0;">
										<xsl:apply-templates mode="payments" select="."/>
									</td>
									<td class="bordered" style="width:40%;padding:0;">
										<table>
											<tbody>
												<tr>
													<td style="border-bottom: 1px solid black;font-size: 8pt;">
														<b>38</b> Вес нетто (кг) / <b>45</b> Таможенная стоимость<br/>
														<xsl:value-of select="AtPAP:AtPAPGoods/AtPAP:NetWeightQuantity"/>
														<xsl:text> / </xsl:text>
														<xsl:value-of select="AtPAP:AtPAPGoods/AtPAP:CustomsCost"/>
													</td>
												</tr>
												<tr>
													<td style="font-size: 8pt;">
														<b>B</b> Подробности подсчета<br/>
														<xsl:for-each select="AtPAP:AtPAPPayments">
															<xsl:if test="position() > 1">
																<br/>
															</xsl:if>
															<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
															<span class="graph">-</span>
															<xsl:if test="catESAD_cu:PaymentAmount">
																<xsl:value-of select="format-number(catESAD_cu:PaymentAmount,'0.00')"/>
															</xsl:if>
															<xsl:if test="catESAD_cu:PaymentCurrencyCode">
																<span class="graph">-</span>
																<xsl:value-of select="catESAD_cu:PaymentCurrencyCode"/>
															</xsl:if>
															<xsl:for-each select="AtPAP:PaymentDocument">-<xsl:value-of select="cat_ru:PrDocumentNumber"/>
																<xsl:if test="cat_ru:PrDocumentDate">
																	<span class="graph">-</span>
																	<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
																	</xsl:call-template>
																</xsl:if>
															</xsl:for-each>
															<xsl:if test="AtPAP:PaymentWayCode">-<xsl:value-of select="AtPAP:PaymentWayCode"/>
															</xsl:if>
															<xsl:if test="AtPAP:RFOrganizationFeatures">
																<xsl:text>-</xsl:text>
																<xsl:value-of select="AtPAP:RFOrganizationFeatures/cat_ru:INN"/>
																<xsl:text> </xsl:text>
																<xsl:value-of select="AtPAP:RFOrganizationFeatures/cat_ru:KPP"/>
															</xsl:if>
															<xsl:if test="AtPAP:RKOrganizationFeatures">-<xsl:value-of select="AtPAP:RKOrganizationFeatures/cat_ru:BIN"/>
																<xsl:value-of select="AtPAP:RKOrganizationFeatures/cat_ru:IIN"/>
															</xsl:if>
															<xsl:if test="AtPAP:RBOrganizationFeatures">-<xsl:value-of select="AtPAP:RBOrganizationFeatures/cat_ru:UNP"/>
																<xsl:value-of select="AtPAP:RBOrganizationFeatures/cat_ru:RBIdentificationNumber"/>
															</xsl:if>
															<br/>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="width:40%; border-bottom: 1px solid black;"></td>
								<td style="width:20%"></td>
								<td style="width:40%; border-bottom: 1px solid black;font-size: 9pt;" align="center">
									<xsl:value-of select="AtPAP:FilledPerson/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="AtPAP:FilledPerson/cat_ru:PersonMiddleName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="AtPAP:FilledPerson/cat_ru:PersonSurname"/>
								</td>
							</tr>
							<tr align="center" valign="top">
								<td style="font-size: 8pt;">(подпись руководителя организации или уполномоченного от имени организации лица либо индивидуального предпринимателя)</td>
								<td></td>
								<td style="font-size: 8pt;">(имя, отчество (при наличии), фамилия)</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="*" mode="payments">
		<table class="addInfo" style="width: 100%;margin:0;">
			<tr valign="top">
				<td class="graph bordered">Вид</td>
				<td class="graph bordered">Основа начисления</td>
				<td class="graph bordered">Ставка</td>
				<td class="graph bordered">Сумма</td>
				<td class="graph bordered">СП</td>
			</tr>
			<xsl:apply-templates select="AtPAP:AtPAPCustomsPaymentCalculation" mode="paymentsDetails"/>
		</table>
	</xsl:template>
	<xsl:template mode="paymentsDetails" match="*">
		<tr valign="top">
			<td class="bordered">
				<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
			</td>
			<td class="bordered">
				<xsl:if test="catESAD_cu:TaxBase">
					<xsl:value-of select="catESAD_cu:TaxBase"/>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:value-of select="catESAD_cu:NumberGroup"/>
			</td>
			<td class="bordered">
				<xsl:value-of select="catESAD_cu:Rate"/>
				<xsl:if test="catESAD_cu:PaymentModeCode != 10">
					<xsl:text> </xsl:text>
					<xsl:choose>
						<xsl:when test="catESAD_cu:RateTypeCode = '*'">
							<xsl:value-of select="catESAD_cu:RateTNVEDQualifierCode"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="catESAD_cu:Rate">%</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="catESAD_cu:NumberDays">
					<xsl:text>x</xsl:text>
					<xsl:value-of select="catESAD_cu:NumberDays"/>
				</xsl:if>
			</td>
			<td class="bordered">
				<xsl:if test="catESAD_cu:PaymentAmount">
					<xsl:value-of select="format-number(catESAD_cu:PaymentAmount,'0.00')"/>
				</xsl:if>
			</td>
			<td class="bordered">
				<xsl:value-of select="catESAD_cu:PaymentCode"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="*" mode="gtd_num">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph">(</span>
			<xsl:value-of select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<xsl:if test="RUDECLcat:SubjectAdditionalCode='1'"> 'контрагент'</xsl:if>
		<xsl:if test="RUDECLcat:SubjectAdditionalCode='2'"> 'РАЗНЫЕ ПО СПИСКУ'</xsl:if>
		<br/>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="ru_address" select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails/cat_ru:E_mail">
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<xsl:text>; </xsl:text>
			</xsl:if>
			<xsl:for-each select="RUScat_ru:CommunicationDetails/cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectBranch">
			<br/>
			<xsl:value-of select="RUScat_ru:SubjectBranch/cat_ru:OrganizationName"/>
			<br/>
			<xsl:if test="RUScat_ru:SubjectBranch/RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="ru_address" select="RUScat_ru:SubjectBranch/RUScat_ru:SubjectAddressDetails"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
			<br/>
			<xsl:text>№ </xsl:text>
			<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
				<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
		</xsl:if>
		<br/>
		<xsl:apply-templates mode="spaceSeparated" select="RUScat_ru:IdentityCard"/>
	</xsl:template>
	<xsl:template match="*" mode="spaceSeparated">
		<xsl:for-each select="*">
			<xsl:if test="position() > 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
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
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
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
