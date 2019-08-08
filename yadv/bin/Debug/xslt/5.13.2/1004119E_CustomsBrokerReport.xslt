<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cbr="urn:customs.ru:ReportingCollection:CustomsBrokerReport:5.13.1" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0">
	<!-- Шаблон для типа CustomsBrokerReportType -->
	<xsl:template match="cbr:CustomsBrokerReport">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div.page {
									width: 190mm;
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
					<h3 align="center">
							Форма отчетности о деятельности таможенного представителя 
					</h3>
					<p align="left" class="annot graphMain">
						<br/>Наименование таможенного представителя <xsl:value-of select="cbr:CustomsBroker/cat_ru:OrganizationName"/>
						<br/>Дата и номер решения о включении <br/> в реестр таможенных представителей  от 
					<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cbr:CustomsBroker/cbr:CustomsRepresCertificate/cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					№ <xsl:value-of select="cbr:CustomsBroker/cbr:CustomsRepresCertificate/cat_ru:PrDocumentNumber"/>
					</p>
					<p>
						<!-- =================== Таблица I =========================  -->
					</p>
					<table width="100%">
						<thead align="left">
							<tr>
								<th colspan="6">I. Сведения о страховых случаях, произошедших в период действия договора страхования 
								</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td class="graphMain bordered">Номер договора страхования</td>
								<td class="graphMain bordered" width="10%">Дата заключения договора страхования (период его действия)</td>
								<td class="graphMain bordered">Страховая организация</td>
								<td class="graphMain bordered" width="10%">Дата наступления страхового случая</td>
								<td class="graphMain bordered">Причина наступления страхового случая</td>
								<td class="graphMain bordered">Размер страховой выплаты</td>
							</tr>
							<tr align="center">
								<td class="graphMain bordered">1</td>
								<td class="graphMain bordered">2</td>
								<td class="graphMain bordered">3</td>
								<td class="graphMain bordered">4</td>
								<td class="graphMain bordered">5</td>
								<td class="graphMain bordered">6</td>
							</tr>
							<xsl:for-each select="cbr:InfoInsuranceCases">
								<tr>
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:InsuranceContractNumber"/>
									</td>
									<td class="graphMain bordered">
										<xsl:text>с </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cbr:InsuranceContractDateFrom"/>
										</xsl:call-template>
										<xsl:text> по </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cbr:InsuranceContractDateTo"/>
										</xsl:call-template>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:InsuranceAgency"/>
									</td>
									<td class="graphMain bordered">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cbr:InsuredEventDate"/>
										</xsl:call-template>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:ReasonInsuredEvent"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:InsurancePaymentAmount"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<p>
						<!-- =================== Таблица II =========================  -->
					</p>
					<table width="100%">
						<thead align="left">
							<tr>
								<th colspan="4">II. Сведения о банковских счетах
								</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td class="graphMain bordered">Наименование банка</td>
								<td class="graphMain bordered">Номер счета</td>
								<td class="graphMain bordered" width="15%">Дата открытия</td>
								<td class="graphMain bordered" width="15%">Дата закрытия</td>
							</tr>
							<tr align="center">
								<td class="graphMain bordered">1</td>
								<td class="graphMain bordered">2</td>
								<td class="graphMain bordered">3</td>
								<td class="graphMain bordered">4</td>
							</tr>
							<xsl:for-each select="cbr:InfoBankAccounts">
								<tr>
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:BankName"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:BankAccount"/>
									</td>
									<td class="graphMain bordered">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cbr:DateOpen"/>
										</xsl:call-template>
									</td>
									<td class="graphMain bordered">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cbr:DateClose "/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<p>
						<!-- =================== Таблица III =========================  -->
					</p>
					<table width="100%">
						<thead align="left">
							<tr>
								<th colspan="4">III. Сведения об учредителях (участниках) юридического лица
								</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td class="graphMain bordered">Наименование (учредитель - юридическое лицо) /<br/>Ф.И.О. (учредитель - физическое лицо)</td>
								<td class="graphMain bordered" width="20%">ИНН учредителя</td>
							</tr>
							<tr align="center">
								<td class="graphMain bordered">1</td>
								<td class="graphMain bordered">2</td>
							</tr>
							<xsl:for-each select="cbr:Founder">
								<tr valign="top">
									<td class="graphMain bordered">
										<xsl:value-of select="cat_ru:OrganizationName"/>
										<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
											<xsl:value-of select="cat_ru:ShortName"/>
										</xsl:if>
									</td>
									<td class="graphMain bordered" align="center">
										<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<p>
						<!-- =================== Таблица IV =========================  -->
					</p>
					<table width="100%">
						<thead align="left">
							<tr>
								<th colspan="4">IV. Сведения о стадиях процедур, проводимых в отношении таможенного представителя
								</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td class="graphMain bordered" width="25%">Реорганизация</td>
								<td class="graphMain bordered" width="25%">Принятие судом решения о приостановлении деятельности юридического лица</td>
								<td class="graphMain bordered" width="25%">Ликвидация</td>
								<td class="graphMain bordered" width="25%">Банкротство</td>
							</tr>
							<tr align="center">
								<td class="graphMain bordered">1</td>
								<td class="graphMain bordered">2</td>
								<td class="graphMain bordered">3</td>
								<td class="graphMain bordered">4</td>
							</tr>
							<xsl:for-each select="cbr:InfoStageProcedure">
								<tr>
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:Reorganization"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:DecisionSuspendOperations"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:Liquidation"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:Bankruptcy"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<p>
						<!-- =================== Таблица V =========================  -->
					</p>
					<table width="100%">
						<thead align="left">
							<tr>
								<th colspan="4">V. Сведения об опубликовании стоимости услуг таможенного представителя
								</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td class="graphMain bordered" width="50%">Адрес официального сайта таможенного представителя в сети "Интернет", на котором опубликована информация о стоимости его услуг при осуществлении деятельности в сфере таможенного дела</td>
								<td class="graphMain bordered" width="50%">Дата официального опубликования на сайте таможенного представителя информации о стоимости его услуг при осуществлении деятельности в сфере таможенного дела</td>
							</tr>
							<tr align="center">
								<td class="graphMain bordered">1</td>
								<td class="graphMain bordered">2</td>
							</tr>
							<xsl:for-each select="cbr:InternetInform">
								<tr valign="top">
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:URL"/>
									</td>
									<td class="graphMain bordered" align="center">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cbr:DatePublication"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<p/>
					<table width="100%">
						<tbody>
							<tr>
								<td class="graphMain" width="70%">Руководитель организации, либо лицо им уполномоченное</td>
								<td class="value graphMain" align="center">
									<xsl:value-of select="concat(cbr:Person/cbr:PersonSurname,' ',substring(cbr:Person/cbr:PersonName,1,1),'.',substring(cbr:Person/cbr:PersonMiddleName,1,1),'.')"/>
								</td>
							</tr>
							<tr>
								<td class="graphMain">Подпись</td>
								<td class="value graphMain"/>
							</tr>
							<tr>
								<td class="graphMain">Дата составления отчетности</td>
								<td class="value graphMain" align="center">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cbr:ReportDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="page">
					<b>
						<xsl:text>Дополнительные сведения</xsl:text>
					</b>
					<br/>
					<br/>
					Сведения об уплате штрафов, вынесенных по делам об административных правонарушениях, ответственность за которое предусмотрена статьей 16.2 и/или 16.3 КоАП:
					<table width="100%">
						<tbody>
							<tr align="center">
								<td class="graphMain bordered">Номер и дата постановления по делу об административных правонарушениях</td>
								<td class="graphMain bordered">Сумма штрафа (тыс. руб.)</td>
								<td class="graphMain bordered">Дата и номер документа, подтверждающего уплату штрафа</td>
								<td class="graphMain bordered">Уплаченная сумма (тыс. руб.)</td>
							</tr>
							<tr align="center">
								<td class="graphMain bordered">1</td>
								<td class="graphMain bordered">2</td>
								<td class="graphMain bordered">3</td>
								<td class="graphMain bordered">4</td>
							</tr>
							<xsl:for-each select="cbr:InfoPaymentFines">
								<tr>
									<td class="graphMain bordered">
										<xsl:text>№ </xsl:text>
										<xsl:value-of select="cbr:DecisionNumber"/>
										<xsl:text> от </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cbr:DecisionDate"/>
										</xsl:call-template>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:PenaltyAmount div 1000"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:ConfirmingDateNumber"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="cbr:PaidAmount div 1000"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:if test="cbr:InfoSpecialists">
						Сведения о специалистах по таможенным операциям, состоящих в штате организации:<br/>
						<table class="w190" width="100%">
							<tbody>
								<tr align="center">
									<td width="20%" class="graphMain bordered">Ф.И.О.</td>
									<td width="20%" class="graphMain bordered">Паспортные данные</td>
									<td width="20%" class="graphMain bordered">Номер КАСТО</td>
									<td width="10%" class="graphMain bordered">Дата выдачи КАСТО</td>
									<td width="20%" class="graphMain bordered">РТУ, выдавшее КАСТО</td>
									<td width="10%" class="graphMain bordered">Дата проставления отметки о прохождении повышения квалификации</td>
								</tr>
								<tr align="center">
									<td class="graphMain bordered">1</td>
									<td class="graphMain bordered">2</td>
									<td class="graphMain bordered">3</td>
									<td class="graphMain bordered">4</td>
									<td class="graphMain bordered">5</td>
									<td class="graphMain bordered">6</td>
								</tr>
								<xsl:for-each select="cbr:InfoSpecialists">
									<tr>
										<td class="graphMain bordered">
											<xsl:value-of select="cbr:PersonName"/>
										</td>
										<td class="graphMain bordered">
											<xsl:apply-templates select="cbr:IdentityCard"/>
										</td>
										<td class="graphMain bordered">
											<xsl:value-of select="cbr:RegistrationNumberCertificate/cbr:SerialNumber"/>
										</td>
										<td class="graphMain bordered">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cbr:DateIssueCertificate"/>
											</xsl:call-template>
										</td>
										<td class="graphMain bordered">
											<xsl:value-of select="cbr:RegistrationNumberCertificate/cbr:NumberManagement"/>
										</td>
										<td class="graphMain bordered">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cbr:LevelUpDate"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="cbr:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode">
			<!--xsl:value-of select="cat_ru:IdentityCardName"/><br/-->
			<xsl:if test="cat_ru:IdentityCardSeries">
				<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			</xsl:if>
			<xsl:if test="cat_ru:IdentityCardNumber">
				<xsl:text> </xsl:text>
				<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			</xsl:if>
			<xsl:if test="cat_ru:IdentityCardDate">
				<xsl:text> </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:OrganizationName"/>
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
