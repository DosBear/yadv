<?xml version="1.0" encoding="utf-8"?>
<!--
Решение Коллегии ЕЭК от 26.09.2017 г. № 128
(с учётом присланного для РФ примера (ГУИТ 2018 № 26238 ФТ ГУОТОиТК на вкл. в реестр УЭО.tif))
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:ai_aeo="urn:customs.ru:Information:RegistrationDocuments:AppInclAEORegistry:5.13.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа AppInclAEORegistryType -->
	<xsl:template match="ai_aeo:AppInclAEORegistry">
		<xsl:variable name="isRF">
			<xsl:choose>
				<xsl:when test="ai_aeo:AEOOrganization/RUScat_ru:CountryA2Code='RU'">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 210mm;
					max-width: 210mm;
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
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					.inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
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
					.bordered { border-collapse: collapse; font-size:10pt;}
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
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody>
							<tr>
								<td align="center">
									ЗАЯВЛЕНИЕ<br/>о включении в реестр уполномоченных экономических операторов
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="ai_aeo:AEOOrganization/cat_ru:OrganizationName"/>
											<xsl:if test="ai_aeo:AEOOrganization/cat_ru:ShortName">
												<xsl:text>; </xsl:text>
												<xsl:value-of select="ai_aeo:AEOOrganization/cat_ru:ShortName"/>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(полное и краткое (при наличии) наименования юридического лица)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="ai_aeo:AEOOrganization/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
											<xsl:if test="ai_aeo:AEOOrganization/cat_ru:RFOrganizationFeatures/cat_ru:INN and ai_aeo:AEOOrganization/cat_ru:RFOrganizationFeatures/cat_ru:KPP"> / </xsl:if>
											<xsl:value-of select="ai_aeo:AEOOrganization/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
											<xsl:value-of select="ai_aeo:AEOOrganization/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
											<xsl:value-of select="ai_aeo:AEOOrganization/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
											<xsl:value-of select="ai_aeo:AEOOrganization/cat_ru:RAOrganizationFeatures/cat_ru:UNN"/>
											<xsl:value-of select="ai_aeo:AEOOrganization/cat_ru:KGOrganizationFeatures/cat_ru:KGINN"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(УНН (для Республики Армения), УНП (для Республики Беларусь), БИН (для Республики Казахстан), ИНН (для Кыргызской Республики), ИНН/КПП (для Российской Федерации))'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text>просит  включить  его  в  реестр  уполномоченных  экономических  операторов (далее - реестр) с выдачей свидетельства (свидетельств)</xsl:text>
									<table>
										<tbody>
											<tr>
												<td width="20%">
													<xsl:call-template name="cert_type">
														<xsl:with-param name="bool" select="ai_aeo:AEOSertificateSign = 1"/>
														<xsl:with-param name="description" select="'первого'"/>
													</xsl:call-template>
												</td>
												<td></td>
												<td width="20%">
													<xsl:call-template name="cert_type">
														<xsl:with-param name="bool" select="ai_aeo:AEOSertificateSign = 2"/>
														<xsl:with-param name="description" select="'второго'"/>
													</xsl:call-template>
												</td>
												<td></td>
												<td width="20%">
													<xsl:call-template name="cert_type">
														<xsl:with-param name="bool" select="ai_aeo:AEOSertificateSign = 4"/>
														<xsl:with-param name="description" select="'первого и второго'"/>
													</xsl:call-template>
												</td>
												<td></td>
												<td width="20%">
													<xsl:call-template name="cert_type">
														<xsl:with-param name="bool" select="ai_aeo:AEOSertificateSign = 3"/>
														<xsl:with-param name="description" select="'третьего'"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
									<xsl:text>типа  (типов)  и  заявляет  сведения,  подтверждающие  выполнение  условий, установленных  статьей  433 Таможенного кодекса Евразийского экономического союза (далее - Кодекс).</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td colspan="6" align="center"><br/>I. Общие сведения<br/><br/></td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered" width="5%">N п/п</td>
								<td class="bordered" colspan="3">Условие включения в реестр</td>
								<td class="bordered" width="15%">Значение или отметка о соблюдении условия</td>
								<td class="bordered" width="15%">Минимальное значение</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered" colspan="3">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
							</tr>
							<tr>
								<td class="bordered" rowspan="7" valign="top" align="center">1</td>
								<td class="bordered" colspan="3">Осуществление внешнеэкономической деятельности, лет</td>
								<td class="bordered" align="center">
									<xsl:value-of select="ai_aeo:ForeignEconomicActivity"/>
								</td>
								<td class="bordered" align="center">3</td>
							</tr>
							<tr>
								<td class="bordered" colspan="5">Осуществление деятельности в сфере таможенного дела в качестве:</td>
							</tr>
							<tr>
								<td class="bordered" colspan="3" style="padding-left:7mm;">таможенного представителя, лет</td>
								<td class="bordered" align="center">
									<xsl:value-of select="ai_aeo:ImplCustRepresentative"/>
								</td>
								<td class="bordered" rowspan="3" align="center">3</td>
							</tr>
							<tr>
								<td class="bordered" colspan="3" style="padding-left:7mm;">владельца склада временного хранения, лет</td>
								<td class="bordered" align="center">
									<xsl:value-of select="ai_aeo:ImplOwnerTempWH"/>
								</td>
							</tr>
							<tr>
								<td class="bordered" colspan="3" style="padding-left:7mm;">владельца таможенного склада, лет</td>
								<td class="bordered" align="center">
									<xsl:value-of select="ai_aeo:ImplOwnerCustWH"/>
								</td>
							</tr>
							<tr>
								<td class="bordered" colspan="3" style="padding-left:7mm;">таможенного перевозчика, лет</td>
								<td class="bordered" align="center">
									<xsl:value-of select="ai_aeo:ImplCustCarrier"/>
								</td>
								<td class="bordered" align="center">2</td>
							</tr>
							<tr>
								<td class="bordered" colspan="5">в течение которых:</td>
							</tr>
							<!--расчет количетства строк-->
							<xsl:variable name="var1_1_1" select="count(ai_aeo:CntDTMovingGoods)"/>
							<xsl:variable name="var1_1_2" select="count(ai_aeo:TotalCostMovingGoods)"/>
							<xsl:variable name="var1_2" select="count(ai_aeo:CntTDMovingGoods)"/>
							<xsl:variable name="var1_3_1" select="count(ai_aeo:CntTDCustoms)"/>
							<xsl:variable name="var1_3_2" select="count(ai_aeo:TotalCostGoodsTD)"/>
							<xsl:variable name="var1_4" select="count(ai_aeo:TotalCostGoodsWH)"/>
							<xsl:variable name="var1_5" select="count(ai_aeo:CntTDCarrier)"/>
							<tr>
								<td class="bordered" rowspan="{$var1_1_1 + $var1_1_2 + $var1_2 + $var1_3_1 + $var1_3_2 + $var1_4 + $var1_5}"></td>
								<td class="bordered" rowspan="{$var1_1_1 + $var1_1_2}" align="center" valign="top" style="width:10mm;">1.1</td>
								<td class="bordered" colspan="2" rowspan="{$var1_1_1}" valign="top">при осуществлении внешнеэкономической деятельности, за исключением деятельности по оказанию услуг по перевозке товаров, за каждый год подано деклараций на товары, штук</td>
								<td class="bordered" align="center"><xsl:apply-templates mode="year_quantity" select="ai_aeo:CntDTMovingGoods[1]"/></td>
								<td class="bordered" rowspan="{$var1_1_1}" align="center" valign="middle">
									<xsl:choose>
										<xsl:when test="$isRF=1">20</xsl:when>
										<xsl:otherwise>10 *</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<xsl:apply-templates mode="year_quantity_row" select="ai_aeo:CntDTMovingGoods[position() &gt; 1]"/>
							
							<tr>
								<td class="bordered" colspan="2" rowspan="{$var1_1_2}" valign="top">суммарная стоимость перемещенных через таможенную границу Евразийского экономического союза товаров за каждый год составляет величину, эквивалентную сумме в евро **</td>
								<td class="bordered" align="center"><xsl:apply-templates mode="year_quantity" select="ai_aeo:TotalCostMovingGoods[1]"/></td>
								<td class="bordered" rowspan="{$var1_1_2}" align="center" valign="middle">
									<xsl:choose>
										<xsl:when test="$isRF=1">750 000</xsl:when>
										<xsl:otherwise>500 000 *</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<xsl:apply-templates mode="year_quantity_row" select="ai_aeo:TotalCostMovingGoods[position() &gt; 1]"/>
							
							<tr>
								<td class="bordered" rowspan="{$var1_2}" align="center" valign="top">1.2</td>
								<td class="bordered" colspan="2" rowspan="{$var1_2}" valign="top">при осуществлении внешнеэкономической деятельности по оказанию услуг по перевозке товаров за каждый год подано транзитных деклараций, штук</td>
								<td class="bordered" align="center"><xsl:apply-templates mode="year_quantity" select="ai_aeo:CntTDMovingGoods[1]"/></td>
								<td class="bordered" rowspan="{$var1_2}" align="center" valign="middle">250</td>
							</tr>
							<xsl:apply-templates mode="year_quantity_row" select="ai_aeo:CntTDMovingGoods[position() &gt; 1]"/>
							
							<tr>
								<td class="bordered" rowspan="{$var1_3_1 + $var1_3_2}" align="center" valign="top">1.3</td>
								<td class="bordered" colspan="2" rowspan="{$var1_3_1}" valign="top">при осуществлении деятельности в сфере таможенного дела в качестве таможенного представителя за каждый год подано таможенных деклараций, штук</td>
								<td class="bordered" align="center"><xsl:apply-templates mode="year_quantity" select="ai_aeo:CntTDCustoms[1]"/></td>
								<td class="bordered" rowspan="{$var1_3_1}" align="center" valign="middle">
									<xsl:choose>
										<xsl:when test="$isRF=1">300</xsl:when>
										<xsl:otherwise>200 *</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<xsl:apply-templates mode="year_quantity_row" select="ai_aeo:CntTDCustoms[position() &gt; 1]"/>
							
							<tr>
								<td class="bordered" colspan="2" rowspan="{$var1_3_2}" valign="top">суммарная стоимость товаров, заявленная в поданных таможенных декларациях, за каждый год составляет величину, эквивалентную сумме в евро **</td>
								<td class="bordered" align="center"><xsl:apply-templates mode="year_quantity" select="ai_aeo:TotalCostGoodsTD[1]"/></td>
								<td class="bordered" rowspan="{$var1_3_2}" align="center" valign="middle">
									<xsl:choose>
										<xsl:when test="$isRF=1">1 000 000</xsl:when>
										<xsl:otherwise>500 000 *</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<xsl:apply-templates mode="year_quantity_row" select="ai_aeo:TotalCostGoodsTD[position() &gt; 1]"/>
							
							<tr>
								<td class="bordered" rowspan="{$var1_4}" align="center" valign="top">1.4</td>
								<td class="bordered" colspan="2" rowspan="{$var1_4}" valign="top">при осуществлении деятельности в сфере таможенного дела в качестве владельцев складов временного хранения, таможенных складов осуществлено хранение товаров, суммарная стоимость которых за каждый год составляет величину, эквивалентную сумме в евро **</td>
								<td class="bordered" align="center"><xsl:apply-templates mode="year_quantity" select="ai_aeo:TotalCostGoodsWH[1]"/></td>
								<td class="bordered" rowspan="{$var1_4}" align="center" valign="middle">
									<xsl:choose>
										<xsl:when test="$isRF=1">8 000 000</xsl:when>
										<xsl:otherwise>500 000 *</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<xsl:apply-templates mode="year_quantity_row" select="ai_aeo:TotalCostGoodsWH[position() &gt; 1]"/>
							
							<tr>
								<td class="bordered" rowspan="{$var1_5}" align="center" valign="top">1.5</td>
								<td class="bordered" colspan="2" rowspan="{$var1_5}" valign="top">при осуществлении деятельности в сфере таможенного дела в качестве таможенного перевозчика за каждый год подано транзитных деклараций, штук</td>
								<td class="bordered" align="center"><xsl:apply-templates mode="year_quantity" select="ai_aeo:CntTDCarrier[1]"/></td>
								<td class="bordered" rowspan="{$var1_5}" align="center" valign="middle">250</td>
							</tr>
							<xsl:apply-templates mode="year_quantity_row" select="ai_aeo:CntTDCarrier[position() &gt; 1]"/>
							
							<xsl:variable name="var2_5">
								<xsl:choose>
									<xsl:when test="count(ai_aeo:EnsuringDuties/ai_aeo:OtherEnsuringDuties) = 0"><xsl:value-of select="number('1')"/></xsl:when>
									<xsl:otherwise><xsl:value-of select="count(ai_aeo:EnsuringDuties/ai_aeo:OtherEnsuringDuties)"/></xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<tr>
								<td class="bordered" rowspan="{$var2_5 + 5}" align="center" valign="top">2</td>
								<td class="bordered" colspan="5">Исполнение обязанности уполномоченного экономического оператора планируется обеспечить следующими способами (заполняется, если условие о представлении обеспечения является обязательным для включения в реестр) ***</td>
							</tr>
							<tr>
								<td class="bordered" align="center" valign="top">2.1</td>
								<td class="bordered" colspan="2" valign="top">внесение денежных средств (денег) на сумму, эквивалентную сумме в евро</td>
								<td class="bordered" align="center" valign="middle"><xsl:value-of select="ai_aeo:EnsuringDuties/ai_aeo:DepositCashSum"/></td>
								<td class="bordered" rowspan="4" align="center" valign="middle">значение, установленное статьей 436 Кодекса</td>
							</tr>
							<tr>
								<td class="bordered" align="center" valign="top">2.2</td>
								<td class="bordered" colspan="2" valign="top">банковская гарантия на сумму, эквивалентную сумме в евро</td>
								<td class="bordered" align="center" valign="middle"><xsl:value-of select="ai_aeo:EnsuringDuties/ai_aeo:BankGuaranteeSum"/></td>
							</tr>
							<tr>
								<td class="bordered" align="center" valign="top">2.3</td>
								<td class="bordered" colspan="2" valign="top">поручительство на сумму, эквивалентную сумме в евро</td>
								<td class="bordered" align="center" valign="middle"><xsl:value-of select="ai_aeo:EnsuringDuties/ai_aeo:GuaranteeSum"/></td>
							</tr>
							<tr>
								<td class="bordered" align="center" valign="top">2.4</td>
								<td class="bordered" colspan="2" valign="top">залог имущества на сумму, эквивалентную сумме в евро</td>
								<td class="bordered" align="center" valign="middle"><xsl:value-of select="ai_aeo:EnsuringDuties/ai_aeo:PledgePropertySum"/></td>
							</tr>
							<tr>
								<td class="bordered" align="center" valign="top" rowspan="{$var2_5}">2.5</td>
								<td class="bordered" align="center" valign="top">2.5.1</td>
								<td class="bordered" valign="top">
									<xsl:text>обеспечение исполнения обязанности иным способом (указать): </xsl:text> 
									<span class="value"><xsl:value-of select="ai_aeo:EnsuringDuties/ai_aeo:OtherEnsuringDuties[1]/ai_aeo:OtherEDMethod"/></span>
									<xsl:text> на сумму, эквивалентную сумме в евро</xsl:text>
								 </td>
								<td class="bordered" align="center" valign="middle"><xsl:value-of select="ai_aeo:EnsuringDuties/ai_aeo:OtherEnsuringDuties[1]/ai_aeo:OtherEDSum"/></td>
								<td class="bordered" align="center" valign="top" rowspan="{$var2_5}"></td>
							</tr>
							<xsl:for-each select="ai_aeo:EnsuringDuties/ai_aeo:OtherEnsuringDuties[position() &gt; 1]">
								<tr>
									<td class="bordered" align="center" valign="top">2.5.<xsl:value-of select="position() + 1"/></td>
									<td class="bordered" valign="top">
										<xsl:text>обеспечение исполнения обязанности иным способом (указать): </xsl:text> 
										<span class="value"><xsl:value-of select="ai_aeo:OtherEDMethod"/></span>
										<xsl:text> на сумму, эквивалентную сумме в евро</xsl:text>
									 </td>
									<td class="bordered" align="center" valign="middle"><xsl:value-of select="ai_aeo:OtherEDSum"/></td>
								</tr>
							</xsl:for-each>
							
							<tr>
								<td class="bordered" align="center" valign="top">3</td>
								<td class="bordered" colspan="3">Не исполненная в установленный срок обязанность по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, пеней, процентов во всех государствах - членах Евразийского экономического союза (далее - государства-члены) отсутствует</td>
								<td class="bordered" align="center" valign="middle"><xsl:apply-templates mode="boolSign" select="ai_aeo:NoPayCustomsSign"/></td>
								<td class="bordered" align="center" valign="middle"> - </td>
							</tr>
							
							<tr>
								<td class="bordered" align="center" valign="top">4</td>
								<td class="bordered" colspan="3">Задолженность (недоимка) в соответствии с законодательством о налогах и сборах (налоговым законодательством) государства-члена, в котором зарегистрирован заявитель, отсутствует</td>
								<td class="bordered" align="center" valign="middle"><xsl:apply-templates mode="boolSign" select="ai_aeo:NoDebtSign"/></td>
								<td class="bordered" align="center" valign="middle"> - </td>
							</tr>
							
							<tr>
								<td class="bordered" align="center" valign="top">5</td>
								<td class="bordered" colspan="3">Факты привлечения во всех государствах-членах заявителя в течение 1 года к административной ответственности за административные правонарушения, привлечение к ответственности за совершение которых законодательством государств-членов определено в качестве основания для отказа во включении в реестр, отсутствуют</td>
								<td class="bordered" align="center" valign="middle"><xsl:apply-templates mode="boolSign" select="ai_aeo:NoFactAdmOffenceSign"/></td>
								<td class="bordered" align="center" valign="middle"> - </td>
							</tr>
							
							<tr>
								<td class="bordered" align="center" valign="top">6</td>
								<td class="bordered" colspan="3">Факты привлечения во всех государствах-членах физических лиц государств-членов, являющихся акционерами заявителя, имеющими 10 и более процентов акций заявителя, его учредителями (участниками), руководителями, главными бухгалтерами, к уголовной ответственности за преступления или уголовные правонарушения, производство по которым отнесено к ведению таможенных и иных государственных органов, привлечение к ответственности за совершение которых законодательством государств-членов определено в качестве основания для отказа во включении в реестр, отсутствуют</td>
								<td class="bordered" align="center" valign="middle"><xsl:apply-templates mode="boolSign" select="ai_aeo:NoFactAttractIndividSign"/></td>
								<td class="bordered" align="center" valign="middle"> - </td>
							</tr>
							
							<tr>
								<td class="bordered" align="center" valign="top">7</td>
								<td class="bordered" colspan="3">Система учета товаров заявителя отвечает установленным законодательством государств-членов о таможенном регулировании требованиям, позволяет сопоставлять сведения, представленные таможенным органам при совершении таможенных операций, со сведениями о проведении хозяйственных операций и обеспечивает доступ (в том числе удаленный) таможенных органов к таким сведениям</td>
								<td class="bordered" align="center" valign="middle"><xsl:apply-templates mode="boolSign" select="ai_aeo:SystemCorrSign"/></td>
								<td class="bordered" align="center" valign="middle"> - </td>
							</tr>
							
							<tr>
								<td class="bordered" align="center" valign="top">8</td>
								<td class="bordered" colspan="3">Совокупный показатель финансовой устойчивости заявителя, рассчитанный в соответствии с порядком определения финансовой устойчивости юридического лица, претендующего на включение в реестр, и значений, характеризующих финансовую устойчивость и необходимых для включения в этот реестр, предусмотренным пунктом 7 статьи 433 Кодекса, баллов</td>
								<td class="bordered" align="center" valign="middle"><xsl:value-of select="ai_aeo:AggFinStabilityIndicator"/></td>
								<td class="bordered" align="center" valign="middle"> 50 </td>
							</tr>
							
							<tr>
								<td class="bordered" rowspan="5" align="center" valign="top">9</td>
								<td class="bordered" colspan="5">Сооружения, помещения (части помещений) и (или) открытые площадки (части открытых площадок), предназначенные для временного хранения товаров, находятся у заявителя:</td>
							</tr>
							<tr>
								<td class="bordered" align="center" valign="top">9.1</td>
								<td class="bordered" colspan="2" valign="top">в собственности</td>
								<td class="bordered" align="center" valign="middle"><xsl:apply-templates mode="boolSign" select="ai_aeo:StoragePlaceApp/ai_aeo:InPropertySign"/></td>
								<td class="bordered" align="center" valign="middle"> - </td>
							</tr>
							<tr>
								<td class="bordered" align="center" valign="top">9.2</td>
								<td class="bordered" colspan="2" valign="top">в хозяйственном ведении</td>
								<td class="bordered" align="center" valign="middle"><xsl:apply-templates mode="boolSign" select="ai_aeo:StoragePlaceApp/ai_aeo:InEcManagementSign"/></td>
								<td class="bordered" align="center" valign="middle"> - </td>
							</tr>
							<tr>
								<td class="bordered" align="center" valign="top">9.3</td>
								<td class="bordered" colspan="2" valign="top">в оперативном управлении</td>
								<td class="bordered" align="center" valign="middle"><xsl:apply-templates mode="boolSign" select="ai_aeo:StoragePlaceApp/ai_aeo:InOperManagementSign"/></td>
								<td class="bordered" align="center" valign="middle"> - </td>
							</tr>
							<tr>
								<td class="bordered" align="center" valign="top">9.4</td>
								<td class="bordered" colspan="2" valign="top">в аренде по договору на срок не менее 1 года</td>
								<td class="bordered" align="center" valign="middle"><xsl:apply-templates mode="boolSign" select="ai_aeo:StoragePlaceApp/ai_aeo:InRentSign"/></td>
								<td class="bordered" align="center" valign="middle"> - </td>
							</tr>
							
							<tr>
								<td class="bordered" align="center" valign="top">10</td>
								<td class="bordered" colspan="3">Требования к сооружениям, помещениям (частям помещений) и (или) открытым площадкам (частям открытых площадок), на территории которых будет осуществляться временное хранение товаров, завершение действия таможенной процедуры таможенного транзита и (или) проводиться таможенный контроль, к транспортным средствам и работникам заявителя, предусмотренные подпунктом 4 пункта 3 статьи 433 Кодекса, соблюдаются</td>
								<td class="bordered" align="center" valign="middle"><xsl:apply-templates mode="boolSign" select="ai_aeo:RequirStoragePlaceSign"/></td>
								<td class="bordered" align="center" valign="middle"> - </td>
							</tr>
							
							<tr>
								<td class="bordered" rowspan="5" align="center" valign="top">11</td>
								<td class="bordered" colspan="5">Заявитель включен в реестр (период включения на момент подачи заявления):</td>
							</tr>
							<tr>
								<td class="bordered" align="center" valign="top">11.1</td>
								<td class="bordered" colspan="2" valign="top">с выдачей свидетельства первого типа, лет</td>
								<td class="bordered" align="center" valign="middle"><xsl:value-of select="ai_aeo:InclRegister/ai_aeo:RegisterType1"/></td>
								<td class="bordered" align="center" valign="middle" rowspan="3"> 2 </td>
							</tr>
							<tr>
								<td class="bordered" align="center" valign="top">11.2</td>
								<td class="bordered" colspan="2" valign="top">с выдачей свидетельства второго типа, лет</td>
								<td class="bordered" align="center" valign="middle"><xsl:value-of select="ai_aeo:InclRegister/ai_aeo:RegisterType2"/></td>
							</tr>
							<tr>
								<td class="bordered" align="center" valign="top">11.3</td>
								<td class="bordered" colspan="2" valign="top">с выдачей свидетельства в соответствии с Таможенным кодексом Таможенного союза, лет</td>
								<td class="bordered" align="center" valign="middle"><xsl:value-of select="ai_aeo:InclRegister/ai_aeo:RegisterSertTK"/></td>
							</tr>
							<tr>
								<td class="bordered" align="center" valign="top">11.4</td>
								<td class="bordered" colspan="2" valign="top">с выдачей свидетельства второго или третьего типа</td>
								<td class="bordered" align="center" valign="middle"><xsl:apply-templates mode="boolSign" select="ai_aeo:InclRegister/ai_aeo:RegisterType2or3Sign"/></td>
								<td class="bordered" align="center" valign="middle"> - </td>
							</tr>
							
							<tr>
								<td class="bordered" align="center" valign="top">12</td>
								<td class="bordered" colspan="3" valign="top">Факт исключения из реестра в течение 1 года до даты подачи заявления отсутствует</td>
								<td class="bordered" align="center" valign="middle"><xsl:apply-templates mode="boolSign" select="ai_aeo:NoFactExclRegisterSign"/></td>
								<td class="bordered" align="center" valign="middle"> - </td>
							</tr>
							<tr>
								<td colspan="6" style="font-size:8pt;">
									<br/><br/>
									* Законодательством  о  таможенном  регулировании государства-члена, таможенному органу которого подается заявление, может быть установлено иное минимальное значение в соответствии со статьей 433 Кодекса.<br/>
									** Рассчитывается   по   курсу  валют,  установленному  центральным (национальным)   банком  государства-члена,  действующему  на  день  подачизаявления.<br/>
									*** Если    законодательством   государств-членов   о   таможенном регулировании  установлено,  что  исполнение  обязанностей  уполномоченного экономического оператора обеспечивается определенным способом (способами) в соответствии  с  пунктом  6  статьи  436 Кодекса, выбор способа обеспечения осуществляется  только  из  способов, установленных законодательством этого государства-члена.
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center">
								<td colspan="5">II. Сведения о физических лицах государств-членов,<br/>являющихся акционерами заявителя, имеющими 10 и более процентов<br/>акций заявителя, его учредителями (участниками), руководителями,<br/>главными бухгалтерами<br/><br/></td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered" width="4%">N п/п</td>
								<td class="bordered" width="24%">Фамилия, имя, отчество (при наличии) (в соответствии с документом, удостоверяющим личность)</td>
								<td class="bordered" width="24%">Дата и место рождения (в соответствии с документом, удостоверяющим личность)</td>
								<td class="bordered" width="24%">Отношение к заявителю (акционер, учредитель (участник), руководитель, главный бухгалтер)</td>
								<td class="bordered" width="24%">Примечание</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
								<td class="bordered">5</td>
							</tr>
							<xsl:for-each select="ai_aeo:Holders">
								<tr>
									<td class="bordered" align="center" valign="top">
										<xsl:value-of select="position()"/>
									</td>
									<td class="bordered" valign="top">
										<xsl:apply-templates mode="person" select="."/>
									</td>
									<td class="bordered" valign="top">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="ai_aeo:BirthDate"/>
										</xsl:call-template>
										<xsl:if test="ai_aeo:BirthPlace">
											<br/>
											<xsl:text>Местро рождения: </xsl:text>
											<xsl:apply-templates mode="address" select="ai_aeo:BirthPlace"/>
										</xsl:if>
										<xsl:if test="ai_aeo:Address">
											<br/>
											<xsl:text>Адрес места жительства: </xsl:text>
											<xsl:apply-templates mode="address" select="ai_aeo:Address"/>
										</xsl:if>
										<xsl:if test="ai_aeo:FactAddress">
											<br/>
											<xsl:text>Адрес места пребывания: </xsl:text>
											<xsl:apply-templates mode="address" select="ai_aeo:FactAddress"/>
										</xsl:if>
									</td>
									<td class="bordered" align="center" valign="top">
										<xsl:choose>
											<xsl:when test="ai_aeo:RelationToApp=1">акционер</xsl:when>
											<xsl:when test="ai_aeo:RelationToApp=2">учредитель (участник)</xsl:when>
											<xsl:when test="ai_aeo:RelationToApp=3">руководитель</xsl:when>
											<xsl:when test="ai_aeo:RelationToApp=4">главный бухгалтер</xsl:when>
											<xsl:otherwise><xsl:value-of select="cat_ru:PersonPost"/></xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="bordered" valign="top">
										<xsl:value-of select="ai_aeo:Comment"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center">
								<td colspan="6">III. Сведения о значениях показателей финансовой устойчивости<br/>и совокупного показателя финансовой устойчивости<br/><br/></td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered" width="4%">N п/п</td>
								<td class="bordered" width="40%">Наименование показателя</td>
								<td class="bordered">Среднее значение показателя за 3 года (расчетное)</td>
								<td class="bordered">Критерий показателя (минимальный)</td>
								<td class="bordered">Значимость показателя в балльной системе</td>
								<td class="bordered">Фактическая значимость показателя (в баллах)</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
								<td class="bordered">5</td>
								<td class="bordered">6</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered" align="left">Размер чистых активов</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:NetAssets/ai_aeo:AvgIndicator"/></td>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="$isRF=1">9 млн руб.</xsl:when>
										<xsl:otherwise></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="bordered">30</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:NetAssets/ai_aeo:ActualSignIdentificator"/></td>
							</tr>
							<tr align="center">
								<td class="bordered">2</td>
								<td class="bordered" align="left">Размер уставного капитала</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:ShareCapital/ai_aeo:AvgIndicator"/></td>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="$isRF=1">6 млн руб.</xsl:when>
										<xsl:otherwise></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="bordered">10</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:ShareCapital/ai_aeo:ActualSignIdentificator"/></td>
							</tr>
							<tr align="center">
								<td class="bordered">3</td>
								<td class="bordered" align="left">Остаточная стоимость основных средств</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:BasicToolsRest/ai_aeo:AvgIndicator"/></td>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="$isRF=1">6 млн руб.</xsl:when>
										<xsl:otherwise></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="bordered">10</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:BasicToolsRest/ai_aeo:ActualSignIdentificator"/></td>
							</tr>
							<tr align="center">
								<td class="bordered">4</td>
								<td class="bordered" align="left">Коэффициент автономии</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:IndicatorAutonomy/ai_aeo:AvgIndicator"/></td>
								<td class="bordered">0,30</td>
								<td class="bordered">10</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:IndicatorAutonomy/ai_aeo:ActualSignIdentificator"/></td>
							</tr>
							<tr align="center">
								<td class="bordered">5</td>
								<td class="bordered" align="left">Коэффициент общей (текущей) ликвидности</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:IndicatorLiquidity/ai_aeo:AvgIndicator"/></td>
								<td class="bordered">1,00</td>
								<td class="bordered">10</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:IndicatorLiquidity/ai_aeo:ActualSignIdentificator"/></td>
							</tr>
							<tr align="center">
								<td class="bordered">6</td>
								<td class="bordered" align="left">Рентабельность собственного капитала, процентов</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:IndicatorProfitability/ai_aeo:AvgIndicator"/></td>
								<td class="bordered">5,00</td>
								<td class="bordered">5</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:IndicatorProfitability/ai_aeo:ActualSignIdentificator"/></td>
							</tr>
							<tr align="center">
								<td class="bordered">7</td>
								<td class="bordered" align="left">Коэффициент финансовой устойчивости</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:IndicatorFinancialStability/ai_aeo:AvgIndicator"/></td>
								<td class="bordered">0,60</td>
								<td class="bordered">15</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:IndicatorFinancialStability/ai_aeo:ActualSignIdentificator"/></td>
							</tr>
							<tr align="center">
								<td class="bordered">8</td>
								<td class="bordered" align="left">Коэффициент обеспеченности текущей деятельности собственными оборотными активами</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:IndicatorUseOwnWorkCapital/ai_aeo:AvgIndicator"/></td>
								<td class="bordered">0,10</td>
								<td class="bordered">5</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:IndicatorUseOwnWorkCapital/ai_aeo:ActualSignIdentificator"/></td>
							</tr>
							<tr align="center">
								<td class="bordered">9</td>
								<td class="bordered" align="left">Коэффициент маневренности собственного капитала</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:IndicatorsManeuverability/ai_aeo:AvgIndicator"/></td>
								<td class="bordered">0,20</td>
								<td class="bordered">5</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:IndicatorsManeuverability/ai_aeo:ActualSignIdentificator"/></td>
							</tr>
							<tr align="center">
								<td class="bordered">10</td>
								<td class="bordered" align="left" colspan="4">Совокупный показатель юридического лица, претендующего на включение в реестр (минимум 50 баллов)</td>
								<td class="bordered"><xsl:value-of select="ai_aeo:FinStabIndicators/ai_aeo:IndicatorsAggregate"/></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center">
								<td colspan="4">IV. Сведения о сооружениях, помещениях (частях помещений)<br/>и (или) открытых площадках (частях открытых площадок),<br/>предназначенных для временного хранения товаров<br/><br/></td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered" width="4%">N п/п</td>
								<td class="bordered" width="50%">Адрес местонахождения объекта</td>
								<td class="bordered">Номер и дата документа, подтверждающего нахождение в собственности, хозяйственном ведении, оперативном управлении или аренде</td>
								<td class="bordered">Срок действия документа (договора аренды)</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
							</tr>
							<xsl:if test="not(ai_aeo:StoragePlaceInfo)">
								<tr valign="top">
									<td class="bordered" align="center">-</td><td class="bordered">-</td><td class="bordered">-</td><td class="bordered">-</td>
								</tr>
							</xsl:if>
							<xsl:for-each select="ai_aeo:StoragePlaceInfo">
								<tr valign="top">
									<td class="bordered" align="center">
										<xsl:value-of select="position()"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates mode="address" select="ai_aeo:StoragePlaceAddress"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates mode="document" select="ai_aeo:BasisOfUseStoragePace/ai_aeo:DocumentInfo"/>
										<xsl:if test="ai_aeo:BasisOfUseStoragePace/ai_aeo:DocumentInfo and ai_aeo:BasisOfUseStoragePace/ai_aeo:BasisOfUseCode">
											<br/>
										</xsl:if>
										<xsl:choose>
											<xsl:when test="ai_aeo:BasisOfUseStoragePace/ai_aeo:BasisOfUseCode='01'">находится в собственности</xsl:when>
											<xsl:when test="ai_aeo:BasisOfUseStoragePace/ai_aeo:BasisOfUseCode='02'">находится в аренде</xsl:when>
											<xsl:when test="ai_aeo:BasisOfUseStoragePace/ai_aeo:BasisOfUseCode='03'">находится в хозяйственном ведении</xsl:when>
											<xsl:when test="ai_aeo:BasisOfUseStoragePace/ai_aeo:BasisOfUseCode='04'">находится в оперативном управлении</xsl:when>
										</xsl:choose>
									</td>
									<td class="bordered">
										<xsl:if test="ai_aeo:BasisOfUseStoragePace/ai_aeo:DateBegin">
											<xsl:text>c </xsl:text>
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ai_aeo:BasisOfUseStoragePace/ai_aeo:DateBegin"/></xsl:call-template>
										</xsl:if>
										<xsl:if test="ai_aeo:BasisOfUseStoragePace/ai_aeo:DateEnd">
											<xsl:text> по </xsl:text>
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ai_aeo:BasisOfUseStoragePace/ai_aeo:DateEnd"/></xsl:call-template>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center">
								<td colspan="4">V. Сведения об обособленных подразделениях и (или) филиалах<br/><br/></td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered" width="4%">N п/п</td>
								<td class="bordered" width="48%">Наименование обособленного подразделения и (или) филиала (полное и краткое - при наличии)</td>
								<td class="bordered">Номер обособленного подразделения и (или) филиала, присвоенный налоговым органом (органом государственных доходов) государства-члена</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
							</tr>
							<xsl:if test="not(ai_aeo:BranchDetails)">
								<tr valign="top">
									<td class="bordered" align="center">-</td><td class="bordered">-</td><td class="bordered">-</td>
								</tr>
							</xsl:if>
							<xsl:for-each select="ai_aeo:BranchDetails">
								<tr valign="top">
									<td class="bordered" align="center">
										<xsl:value-of select="position()"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="cat_ru:OrganizationName"/>
										<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName">
											<br/>
											<xsl:value-of select="cat_ru:ShortName"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:for-each select="RUScat_ru:UITN/*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center">
								<td colspan="4">VI. Документы, подтверждающие сведения, указанные в настоящем заявлении<br/><br/></td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered" width="4%">N п/п</td>
								<td class="bordered" width="80%">Наименования документов</td>
								<td class="bordered">Количество листов</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
							</tr>
							<tr valign="top">
								<td class="bordered" align="center">1</td>
								<td class="bordered">Копии учредительных документов юридического лица</td>
								<td class="bordered" align="center">
									<xsl:call-template name="sheet_count">
										<xsl:with-param name="node" select="ai_aeo:DocsInfo/ai_aeo:CopiesFounderDocs"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" align="center">2</td>
								<td class="bordered">Документ, подтверждающий отсутствие у заявителя задолженности (недоимки) в соответствии с законодательством о налогах и сборах (налоговым законодательством) государства-члена, в котором зарегистрирован заявитель</td>
								<td class="bordered" align="center">
									<xsl:call-template name="sheet_count">
										<xsl:with-param name="node" select="ai_aeo:DocsInfo/ai_aeo:NoDebtDocs"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" align="center">3</td>
								<td class="bordered">Документы (копии документов), подтверждающие расчет значений показателей финансовой устойчивости и совокупного показателя финансовой устойчивости</td>
								<td class="bordered" align="center">
									<xsl:call-template name="sheet_count">
										<xsl:with-param name="node" select="ai_aeo:DocsInfo/ai_aeo:FinStabilityDocs"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" align="center">4</td>
								<td class="bordered">Документы, выданные компетентным органом государства-члена и подтверждающие отсутствие фактов привлечения к уголовной ответственности физических лиц государств-членов, являющихся акционерами заявителя, имеющими 10 и более процентов акций заявителя, его учредителями (участниками), руководителями, главными бухгалтерами</td>
								<td class="bordered" align="center">
									<xsl:call-template name="sheet_count">
										<xsl:with-param name="node" select="ai_aeo:DocsInfo/ai_aeo:NoFactCriminalDocs"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" align="center">5</td>
								<td class="bordered">Документы, подтверждающие наличие у заявителя системы учета товаров, отвечающей установленным законодательством государства-члена о таможенном регулировании требованиям, позволяющей сопоставлять сведения, представленные таможенным органам при совершении таможенных операций, со сведениями о проведении хозяйственных операций и обеспечивающей доступ (в том числе удаленный) таможенных органов к таким сведениям</td>
								<td class="bordered" align="center">
									<xsl:call-template name="sheet_count">
										<xsl:with-param name="node" select="ai_aeo:DocsInfo/ai_aeo:HasSystemAccGoodsDocs"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" align="center">6</td>
								<td class="bordered">Копии документов, подтверждающих наличие у заявителя, претендующего на получение свидетельства второго или третьего типа, сооружений, помещений (частей помещений) и (или) открытых площадок (частей открытых площадок), предназначенных для временного хранения товаров, завершения действия таможенной процедуры таможенного транзита и (или) проведения таможенного контроля</td>
								<td class="bordered" align="center">
									<xsl:call-template name="sheet_count">
										<xsl:with-param name="node" select="ai_aeo:DocsInfo/ai_aeo:StoragePlaceDocs"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" align="center">7</td>
								<td class="bordered">Иные документы</td>
								<td class="bordered" align="center">
									<xsl:call-template name="sheet_count">
										<xsl:with-param name="node" select="ai_aeo:DocsInfo/ai_aeo:OtherDocs"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr align="center">
								<td class="value" width="35%">
									<xsl:value-of select="ai_aeo:SigningDetails/cat_ru:PersonPost"/>
								</td>
								<td width="5%"></td>
								<td class="value"></td>
								<td width="5%"></td>
								<td class="value" width="35%">
									<xsl:for-each select="ai_aeo:SigningDetails/cat_ru:PersonSurname|ai_aeo:SigningDetails/cat_ru:PersonName|ai_aeo:SigningDetails/cat_ru:PersonMiddleName">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text> </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="descr">(должность руководителя заявителя)</td>
								<td></td>
								<td class="descr">(подпись заявителя)</td>
								<td></td>
								<td class="descr">(Ф.И.О. заявителя)</td>
							</tr>
							<tr>
								<td style="font-size:10pt;">
									<br/>
									<br/>
									<xsl:call-template name="DateStr">
										<xsl:with-param name="date" select="ai_aeo:SigningDetails/RUScat_ru:SigningDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="sheet_count">
		<xsl:param name="node"/>
		<xsl:choose>
			<xsl:when test="not($node/ai_aeo:DocsSheetNumberDocs)"> - </xsl:when>
			<xsl:otherwise><xsl:value-of select="$node/ai_aeo:DocsSheetNumberDocs"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="document" match="*">
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
	<xsl:template mode="boolSign" match="*">
		<xsl:if test=".=1 or .='true'">v</xsl:if>
	</xsl:template>
	<xsl:template mode="year_quantity_row" match="*">
		<tr>
			<td class="bordered" align="center">
				<xsl:apply-templates mode="year_quantity" select="."/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template mode="year_quantity" match="*">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> - </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="cert_type">
		<xsl:param name="bool"/>
		<xsl:param name="description"/>
		<table>
			<tbody>
				<tr>
					<td class="bordered">
						<xsl:value-of select="$description"/>
					</td>
					<td class="bordered" style="width:5mm;text-align:center;">
						<xsl:choose>
							<xsl:when test="boolean($bool)">v</xsl:when>
							<xsl:otherwise> - </xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="quantity" match="*">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="signature2ndCopy" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="35%" class="value">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td/>
					<td width="20%" class="value">
					</td>
					<td/>
					<td width="35%" class="value">
						<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName|cat_ru:OrganizationName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">(должность)</td>
					<td/>
					<td class="descr">(подпись)</td>
					<td/>
					<td class="descr">(фамилия, инициалы имени и<br/>отчества (инициал отчества<br/>указывается при наличии отчества)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="signature" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="35%"/>
					<td/>
					<td width="20%" class="value">
					</td>
					<td/>
					<td width="35%" class="value">
						<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName|cat_ru:OrganizationName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr valign="top">
					<td/>
					<td/>
					<td class="descr">(подпись)</td>
					<td/>
					<td class="descr">(фамилия, инициалы имени и<br/>отчества (инициал отчества<br/>указывается при наличии отчества)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="person" match="*">
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName"> <!--|cat_ru:PersonPost"-->
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="comma" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:PersonId"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="details" select="RUScat_ru:CommunicationDetails"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="ai_aeo:FactAddress">
			<xsl:text> факт. адрес: </xsl:text>
			<xsl:apply-templates select="ai_aeo:FactAddress" mode="address"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="details" match="*">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> т.: </xsl:text>
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
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
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
	<xsl:template match="*" mode="address">
		<xsl:for-each select="RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="month_name">
		<xsl:param name="monthIn"/>
		<xsl:choose>
			<xsl:when test="$monthIn='01'">января</xsl:when>
			<xsl:when test="$monthIn='02'">февраля</xsl:when>
			<xsl:when test="$monthIn='03'">марта</xsl:when>
			<xsl:when test="$monthIn='04'">апреля</xsl:when>
			<xsl:when test="$monthIn='05'">мая</xsl:when>
			<xsl:when test="$monthIn='06'">июня</xsl:when>
			<xsl:when test="$monthIn='07'">июля</xsl:when>
			<xsl:when test="$monthIn='08'">августа</xsl:when>
			<xsl:when test="$monthIn='09'">сентября</xsl:when>
			<xsl:when test="$monthIn='10'">октября</xsl:when>
			<xsl:when test="$monthIn='11'">ноября</xsl:when>
			<xsl:when test="$monthIn='12'">декабря</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0">
				<xsl:variable name="month" select="substring($date, 6, 2)"/>
				&#34;&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;
				<xsl:choose>
					<xsl:when test="$month=1">января</xsl:when>
					<xsl:when test="$month=2">февраля</xsl:when>
					<xsl:when test="$month=3">марта</xsl:when>
					<xsl:when test="$month=4">апреля</xsl:when>
					<xsl:when test="$month=5">мая</xsl:when>
					<xsl:when test="$month=6">июня</xsl:when>
					<xsl:when test="$month=7">июля</xsl:when>
					<xsl:when test="$month=8">августа</xsl:when>
					<xsl:when test="$month=9">сентября</xsl:when>
					<xsl:when test="$month=10">октября</xsl:when>
					<xsl:when test="$month=11">ноября</xsl:when>
					<xsl:when test="$month=12">декабря</xsl:when>
				</xsl:choose> 					
				&#160;</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/><u><xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
			</xsl:when>
			<xsl:otherwise>
				&#34;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.&#160;
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
