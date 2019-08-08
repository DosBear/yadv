<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cat_pcd="urn:customs.ru:Information:CustomsDocuments:PassengerCDCommonAggregateTypesCust:5.12.0" xmlns:pcd_bd="urn:customs.ru:Information:CustomsDocuments:PassengerCDBasicDocument:5.12.0">
	<!--xsl:variable name="Self" select='document("")'/-->
	<xsl:include href="SumInWords.xslt"/>	
	<xsl:template match="pcd_bd:PassengerCDBasicDocument">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									@media print {
									.more {
											 page-break-before: always;
										} 
								    }
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
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<i>Лицевая сторона</i>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>ПАССАЖИРСКАЯ ТАМОЖЕННАЯ ДЕКЛАРАЦИЯ</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Основной формуляр</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td align="left" class="graphMain" style="border:2px solid;">
									<i>* Заполняется лицом, достигшим 16 - летнего возраста</i>
									<br/>
									<i>* Выбранный декларантом ответ помечается в соответствующей рамке знаком </i><span style="display:inline-block;width:1mm;"></span><span style="display:inline-block;width:4mm;height:4mm;border:1px solid;" align="center">X</span>
									<br/>
									<i>* Экземпляр оформленной декларации, который остается у физического лица, сохраняется на весь период временного въезда/выезда и предъявляется таможенным органам при возвращении.</i>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain" width="60mm"></td>
								<td align="center" class="graphMain" width="20mm">
									<div style="display:inline-block;width:4mm;height:4mm;border:1px solid;" align="center">
										<xsl:if test="pcd_bd:EnterOrExitCustomsTerritory='1'">X</xsl:if>
									</div>
									<br/><b>въезд</b>
								</td>
								<td align="center" class="graphMain" width="30mm"></td>
								<td align="center" class="graphMain" width="20mm">
									<div style="display:inline-block;width:4mm;height:4mm;border:1px solid;" align="center">
										<xsl:if test="pcd_bd:EnterOrExitCustomsTerritory='2'">X</xsl:if>
									</div>
									<br/><b>выезд</b>
								</td>
								<td align="center" class="graphMain" width="60mm">
									<xsl:if test="pcd_bd:EnterOrExitCustomsTerritory='3'">транзит</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div>
						<font size="4"><b>1. Сведения о лице:</b></font>
					</div>
					<table class="w190">
						<tbody>
							<tr style="height:4mm;">
								<td width="33%" align="center" style="border-bottom:1px solid;"><xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonSurname"/></td>
								<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;border-left:1px solid;"><xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonName"/></td>
								<td width="33%" align="center" style="border-bottom:1px solid;"><xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonMiddleName"/></td>
							</tr>
							<tr style="height:4mm;font-size:8pt;">
								<td align="center">фамилия</td>
								<td align="center">имя</td>
								<td align="center">отчество</td>
							</tr>
							<tr style="height:4mm;">
								<td width="33%" align="center" style="border-bottom:1px solid;">
									<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:CountryPermanentResidence/cat_pcd:CountryName"/>
									<!--xsl:for-each select="pcd_bd:DeclarantPerson/cat_pcd:CountryPermanentResidence/*">
										<xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
									</xsl:for-each-->
								</td>
								<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;border-left:1px solid;">
									<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:RegCountry/cat_pcd:CountryName"/>
									<!--xsl:for-each select="pcd_bd:DeclarantPerson/cat_pcd:RegCountry/*">
										<xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
									</xsl:for-each-->
								</td>
								<td width="33%" align="center" style="border-bottom:1px solid;">
									<table>
										<tbody>
											<tr>
												<td>серия</td>
												<td width="30%">
													<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonIdCard/cat_ru:IdentityCardSeries"/>
												</td>
												<td>№</td>
												<td width="50%">
													<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonIdCard/cat_ru:IdentityCardNumber"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr style="height:4mm;font-size:8pt;">
								<td align="center">страна постоянного проживания</td>
								<td align="center">гражданство/подданство</td>
								<td align="center">документ, удостоверяющий личность</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr style="height:4mm;">
								<xsl:if test="pcd_bd:DeclarantPerson/cat_pcd:INN">
									<td align="center" style="border-bottom:1px solid; border-right:1px solid;">
										<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:INN"/>
									</td>
								</xsl:if>
								<td width="45%" align="center" style="border-bottom:1px solid;">
									<xsl:value-of select="pcd_bd:CountryDeparture/cat_pcd:CountryName"/>
									<!--xsl:for-each select="pcd_bd:CountryDeparture/*">
										<xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
									</xsl:for-each-->
								</td>
								<td width="55%" align="center" style="border-bottom:1px solid;border-left:1px solid;">
									<xsl:value-of select="pcd_bd:CountryDestination/cat_pcd:CountryName"/>
									<!--xsl:for-each select="pcd_bd:CountryDestination/*">
										<xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
									</xsl:for-each-->
								</td>
							</tr>
							<tr style="height:4mm;font-size:8pt;">
								<xsl:if test="pcd_bd:DeclarantPerson/cat_pcd:INN">
									<td align="center">ИНН</td>
								</xsl:if>
								<td align="center">из какой страны прибыл (указывается страна отправления)</td>
								<td align="center">в какую страну следует (указывается страна назначения)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr>
								<td valign="top" width="50%">Со мною следуют несовершеннолетние дети</td>
								<td valign="top" width="20%">
									<xsl:call-template name="yesno"><xsl:with-param name="sign" select="pcd_bd:Children/pcd_bd:HaveSign"/></xsl:call-template>
								</td>
								<td valign="top" width="30%"><xsl:text>Количество </xsl:text><xsl:value-of select="pcd_bd:Children/pcd_bd:Quantity"/></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<font size="4"><b>Мной либо в мой адрес перемещаются следующие товары и транспортные средства, подлежащие таможенному декларированию</b></font>
					<br/>
					<font size="4"><b>2. Сведения о способе перемещения товаров и транспортных средств:</b></font>
					<table class="w190">
						<tbody>
							<tr>
								<td valign="top">2.1.</td>
								<td valign="top" width="20%">Сопровождаемый багаж</td>
								<td valign="top" width="10%">
									<xsl:call-template name="yesno"><xsl:with-param name="sign" select="pcd_bd:MovementGoodsAndTransportMeansInfo/pcd_bd:AccompaniedLuggage/pcd_bd:HaveSign"/></xsl:call-template>
								</td>
								<td valign="top">2.2.</td>
								<td valign="top" width="20%">Несопровождаемый багаж</td>
								<td valign="top" width="10%">
									<xsl:call-template name="yesno"><xsl:with-param name="sign" select="pcd_bd:MovementGoodsAndTransportMeansInfo/pcd_bd:UnaccompaniedLuggage/pcd_bd:HaveSign"/></xsl:call-template>
								</td>
								<td valign="top">2.3.</td>
								<td valign="top" width="20%">Товары, доставляемые перевозчиком</td>
								<td valign="top" width="10%">
									<xsl:call-template name="yesno"><xsl:with-param name="sign" select="pcd_bd:MovementGoodsAndTransportMeansInfo/pcd_bd:GoodsDeliveredByCarrier/pcd_bd:HaveSign"/></xsl:call-template>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>Количество мест</td>
								<td>
									<xsl:value-of select="pcd_bd:MovementGoodsAndTransportMeansInfo/pcd_bd:AccompaniedLuggage/pcd_bd:Quantity"/>
								</td>
								<td></td>
								<td>Количество мест</td>
								<td>
									<xsl:value-of select="pcd_bd:MovementGoodsAndTransportMeansInfo/pcd_bd:UnaccompaniedLuggage/pcd_bd:Quantity"/>
								</td>
								<td></td>
								<td>Количество мест</td>
								<td>
									<xsl:value-of select="pcd_bd:MovementGoodsAndTransportMeansInfo/pcd_bd:GoodsDeliveredByCarrier/pcd_bd:Quantity"/>
								</td>
							</tr>
						</tbody>
					</table>
					<font size="4"><b>3. Сведения о товарах и транспортных средствах:</b></font>
					<table class="w190">
						<tbody>
							<tr>
								<td>
									3.1. Валюта государств-членов таможенного союза, иностранная валюта,  дорожные чеки в сумме, <u>не превышающей</u> 10000 долларов США в эквиваленте
									<br/><i>(таблица заполняется по желанию физического лица)</i>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno"><xsl:with-param name="sign" select="pcd_bd:MovementCurrencyValuesInfo/pcd_bd:NotExcessLimitForeignCurSign/pcd_bd:NotExcessLimitForeignCurSign"/></xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190" style="border:1px solid;">
						<tbody>
							<tr>
								<td style="border:1px solid;" rowspan="2" width="25%" align="center" valign="top">Наименование</td>
								<td style="border:1px solid;" colspan="2" align="center" valign="top">Сумма</td>
							</tr>
							<tr>
								<td style="border:1px solid;" width="20%" align="center" valign="top">Цифрами</td>
								<td style="border:1px solid;" align="center" valign="top">Прописью</td>
							</tr>
							<xsl:for-each select="pcd_bd:MovementCurrencyValuesInfo/pcd_bd:NotExcessLimitForeignCurSign/pcd_bd:DetailsNotExcessLimitForeignCur">
								<tr>
									<td style="border:1px solid;" valign="top" align="center">
										<xsl:value-of select="pcd_bd:MoveAmount/cat_pcd:CurrencyName"/>
									</td>
									<td style="border:1px solid;" valign="top">
										<xsl:value-of select="pcd_bd:MoveAmount/cat_pcd:Amount"/>
									</td>
									<td style="border:1px solid;" valign="top">
										<xsl:call-template name="RecurseSumWords">
											<xsl:with-param name="Value" select="pcd_bd:MoveAmount/cat_pcd:Amount"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td>
									3.2. Валюта государств-членов таможенного союза, иностранная валюта, дорожные чеки в сумме, <u>превышающей</u> 10000 долларов США в эквиваленте, векселя, чеки (банковские), ценные бумаги на предъявителя
								</td>
								<td width="20%">
									<xsl:call-template name="yesno"><xsl:with-param name="sign" select="pcd_bd:MovementCurrencyValuesInfo/pcd_bd:ExcessLimitForeignCurSign"/></xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td>
									3.3. Транспортные средства
								</td>
								<td width="20%">
									<xsl:call-template name="yesno"><xsl:with-param name="sign" select="pcd_bd:TransportMeans/pcd_bd:TransportMeansHaveSign"/></xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190" style="border:2px solid;">
						<tbody>
							<tr>
								<td valign="bottom" width="15%">Рег.номер</td>
								<td valign="bottom" width="15%" style="border-bottom:1px solid;">
									<xsl:value-of select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/cat_ru:TransportIdentifier"/>
								</td>
								<td valign="bottom" width="10%" rowspan="2">Момент выпуска</td>
								<td valign="bottom" width="10%" style="border-bottom:1px solid;" rowspan="2">
									<xsl:value-of select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:OfftakeYear"/>
								</td>
								<td valign="bottom" width="20%" rowspan="2">№ кузова или идентифика-<br/>ционный №</td>
								<td valign="bottom" width="25%" style="border-bottom:1px solid;" rowspan="2">
									<xsl:value-of select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/cat_ru:ActiveTransportIdentifier"/>
								</td>
							</tr>
							<tr>
								<td valign="bottom">Вид, марка</td>
								<td valign="bottom" style="border-bottom:1px solid;">
									<xsl:value-of select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:TransportKindName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:Mark"/>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<table class="w190">
										<tbody>
											<tr>
												<td valign="bottom">Объем двигателя (куб.см)</td>
												<td valign="bottom" width="15%" style="border-bottom:1px solid;">
													<xsl:value-of select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:EngineVolumeQuanity"/>
												</td>
												<td valign="bottom">Шасси №</td>
												<td valign="bottom" width="10%" style="border-bottom:1px solid;" rowspan="2">
													<xsl:value-of select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/cat_ru:VIN"/>
												</td>
												<td valign="bottom">Таможенная стоимость</td>
												<td valign="bottom" width="15%" style="border-bottom:1px solid;" rowspan="2">
													<xsl:for-each select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:CustCost/*">
														<xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
													</xsl:for-each>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<table class="w190">
										<tbody>
											<tr>
												<td width="33%">Направление перемещения:</td>
												<td width="33%">
													<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
														<xsl:if test="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:DirectionMovement='1'">X</xsl:if>
													</div>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													ввоз
												</td>
												<td width="33%">
													<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
														<xsl:if test="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:DirectionMovement='3'">X</xsl:if>
													</div>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													временный ввоз
												</td>
											</tr>
											<tr>
												<td></td>
												<td>
													<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
														<xsl:if test="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:DirectionMovement='2'">X</xsl:if>
													</div>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													вывоз
												</td>
												<td>
													<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
														<xsl:if test="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:DirectionMovement='4'">X</xsl:if>
													</div>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													обратный вывоз
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<table class="w190">
										<tbody>
											<tr>
												<td valign="top">Снято с регистрационного учета в государстве предыдущей регистрации</td>
												<td width="20%">
													<xsl:call-template name="yesno"><xsl:with-param name="sign" select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:RemovalRegister"/></xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td valign="top">
									3.4. Товары, в отношении которых применяются запреты или ограничения
								</td>
								<td width="20%">
									<xsl:call-template name="yesno"><xsl:with-param name="sign" select="pcd_bd:Goods/pcd_bd:GoodsForbiddenHaveSign"/></xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td valign="top">
									3.5. Неделимые товары весом свыше 35 кг, товары общим весом свыше 50 кг и (или) общей таможенной стоимостью свыше 1500 евро
								</td>
								<td width="20%">
									<xsl:call-template name="yesno"><xsl:with-param name="sign" select="pcd_bd:Goods/pcd_bd:GoodsIndivisibleHaveSign"/></xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="page more">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<i>Оборотная сторона</i>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<font size="4"><b>4. Сведения о товарах, указанных в подпунктах 3.4, 3.5, товарах, подлежащих таможенному декларированию, и иных товарах по желанию физического лица:</b></font>
					<table class="w190" style="border:1px solid;">
						<tbody>
							<tr>
								<td width="5%" rowspan="2" style="border:1px solid;" align="center" valign="top">№№ п/п</td>
								<td width="35%" rowspan="2" style="border:1px solid;" align="center" valign="top">Наименование и другие отличительные признаки товара, номер и дата выдачи документа, подтверждающего соблюдение ограничений  и орган, его выдавший</td>
								<td colspan="2" style="border:1px solid;" align="center" valign="top">Вес/Количество</td>
								<td width="15%" rowspan="2" style="border:1px solid;" align="center" valign="top">Стоимость в валюте государств-членов таможенного союза, евро или долл. США</td>
							</tr>
							<tr>
								<td width="20%" style="border:1px solid;" align="center" valign="top">Цифрами</td>
								<td width="25%" style="border:1px solid;" align="center" valign="top">Прописью</td>
							</tr>
							<xsl:for-each select="pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:PassDeclGoods">
								<tr>
									<td style="border:1px solid;" align="center" valign="top">
										<xsl:value-of select="pcd_bd:GoodsNumeric"/>
									</td>
									<td style="border:1px solid;" valign="top">
										<xsl:apply-templates select="pcd_bd:GoodsDescription"/><br/>
										<xsl:for-each select="pcd_bd:PresentedDocuments">
											<xsl:value-of select="cat_ru:PrDocumentName"/>
											<xsl:if test="cat_ru:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<xsl:value-of select="cat_ru:PrDocumentNumber"/>
											</xsl:if>
											<xsl:if test="cat_ru:PrDocumentDate">
												<xsl:text> от </xsl:text>
												<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
											</xsl:if>
											<br/>
											<xsl:value-of select="pcd_bd:OrganizationName"/>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
									<td style="border:1px solid;" valign="top">
										<xsl:value-of select="pcd_bd:GoodsWeightQuantity"/>
										<xsl:text> кг</xsl:text>
										<xsl:if test="pcd_bd:GoodsWeightQuantity and pcd_bd:GoodsQuantity"> / </xsl:if>
										<xsl:value-of select="pcd_bd:GoodsQuantity/pcd_bd:Quantity"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="pcd_bd:GoodsQuantity/pcd_bd:MeasureUnitOperation"/>
									</td>
									<td style="border:1px solid;" valign="top">
										<xsl:call-template name="RecurseSumWords">
											<xsl:with-param name="Value" select="pcd_bd:GoodsWeightQuantity"/>
											<!--<xsl:with-param name="Fraction" select="1"/>-->
										</xsl:call-template>
										<xsl:if test="pcd_bd:GoodsWeightQuantity">
											<xsl:text> кг</xsl:text>
										</xsl:if>
										<xsl:if test="pcd_bd:GoodsWeightQuantity and pcd_bd:GoodsQuantity"> / </xsl:if>
										<xsl:call-template name="RecurseSumWords">
											<xsl:with-param name="Value" select="pcd_bd:GoodsQuantity/pcd_bd:Quantity"/>
											<!--<xsl:with-param name="Fraction" select="1"/>-->
										</xsl:call-template>
										<xsl:if test="pcd_bd:GoodsQuantity/pcd_bd:Quantity">
											<xsl:text> </xsl:text>
											<xsl:value-of select="pcd_bd:GoodsQuantity/pcd_bd:MeasureUnitOperation"/>
										</xsl:if>
									</td>
									<td style="border:1px solid;" valign="top">
										<xsl:value-of select="pcd_bd:GoodsCost/cat_pcd:Amount"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="pcd_bd:GoodsCost/cat_pcd:CurrencyName"/>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td colspan="2" style="border:1px solid;" valign="top">Общий вес/количество и стоимость (Итого):</td>
								<td style="border:1px solid;" valign="top">
									<xsl:value-of select="pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:GoodsWeightQuantity"/>
									<xsl:text> кг</xsl:text>
									<xsl:text> / </xsl:text>
									<xsl:value-of select="pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:GoodsQuantity/pcd_bd:Quantity"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:GoodsQuantity/pcd_bd:MeasureUnitOperation"/>
								</td>
								<td style="border:1px solid;">
									<xsl:call-template name="RecurseSumWords">
										<xsl:with-param name="Value" select="pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:GoodsWeightQuantity"/>
										<!--<xsl:with-param name="Fraction" select="1"/>-->
									</xsl:call-template>
									<xsl:if test="pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:GoodsWeightQuantity">
										<xsl:text> кг</xsl:text>
									</xsl:if>
									<xsl:if test="pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:GoodsWeightQuantity and pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:GoodsQuantity/pcd_bd:Quantity"> / </xsl:if>
									<xsl:call-template name="RecurseSumWords">
										<xsl:with-param name="Value" select="pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:GoodsQuantity/pcd_bd:Quantity"/>
										<!--<xsl:with-param name="Fraction" select="1"/>-->
									</xsl:call-template>
									<xsl:if test="pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:GoodsQuantity/pcd_bd:Quantity">
										<xsl:text> </xsl:text>
										<xsl:value-of select="pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:GoodsQuantity/pcd_bd:MeasureUnitOperation"/>
									</xsl:if>
								</td>
								<td style="border:1px solid;" valign="top">
									<xsl:value-of select="pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:GoodsCost/cat_pcd:Amount"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:GoodsCost/cat_pcd:CurrencyName"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<font size="4"><b>Мне известно, что сообщение в таможенной декларации недостоверных сведений влечет за собой ответственность в соответствии с законодательством государств-членов таможенного союза.</b></font>
					<br/><br/>
					<table class="w190">
						<tbody>
							<tr>
								<td width="15%" valign="top">
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="pcd_bd:Signer/cat_pcd:IssueDate"/></xsl:call-template>
								</td>
								<td width="15%" align="right" valign="top">Подпись лица</td>
								<td width="25%" align="left" valign="top">________________________</td>
								<td width="45%">
									<xsl:for-each select="pcd_bd:Signer">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
										<xsl:if test="cat_pcd:PersonMode">
											<br/>
											<xsl:choose>
												<xsl:when test="cat_pcd:PersonMode='1'">декларант</xsl:when>
												<xsl:when test="cat_pcd:PersonMode='2'">таможенный представитель</xsl:when>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="cat_ru:PersonPost">
											<br/>
											<xsl:value-of select="cat_ru:PersonPost"/>
										</xsl:if>
										<xsl:if test="cat_pcd:CustomsRepresCertificate">
											<br/>
											<xsl:for-each select="cat_pcd:CustomsRepresCertificate/*">
												<xsl:choose>
													<xsl:when test="contains(local-name(.), 'Date')"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template></xsl:when>
													<xsl:when test="contains(local-name(.), 'Code')">
														<xsl:choose>
															<xsl:when test=".='2'">свидетельство таможенного представителя (брокера)</xsl:when>
															<xsl:when test=".='3'">свидетельство таможенного представителя</xsl:when>
														</xsl:choose>
													</xsl:when>
													<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
												</xsl:choose>
												<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="cat_pcd:ContractRepresDecl">
											<br/>
											<xsl:for-each select="cat_pcd:ContractRepresDecl/*">
												<xsl:choose>
													<xsl:when test="contains(local-name(.), 'Date')"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template></xsl:when>
													<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
												</xsl:choose>
												<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
											</xsl:for-each>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190" style="border-top:2px dashed;">
						<tbody>
							<tr>
								<td width="25%" align="right">
									Для служебных отметок:
									<br/>
									<div style="width:25mm;height:25mm;border:1px solid;"></div>
									<br/>
									М.П.
								</td>
								<td width="5%"></td>
								<td width="70%" valign="top">
									<br/><br/>
									<xsl:value-of select="pcd_bd:CustomsMark/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="pcd_bd:CustomsMark/cat_ru:LNP"/>
									<br/>
									<xsl:apply-templates select="pcd_bd:CustomsMark/cat_pcd:Mark"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<xsl:if test="pcd_bd:MovementCurrencyValuesInfo/pcd_bd:ExcessLimitForeignCurSign='true' or pcd_bd:MovementCurrencyValuesInfo/pcd_bd:ExcessLimitForeignCurSign='1' or pcd_bd:PCDAdditionalInfo">
					<div class="page more">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<i>Лицевая сторона</i>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<div align="right" style="font-size:8pt;">Приложение к пассажирской таможенной декларации</div>
						<br/>
						<br/>
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>
												ПАССАЖИРСКАЯ ТАМОЖЕННАЯ ДЕКАРАЦИЯ
											</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="3">
											<b>Дополнительный формуляр «Декларация наличных денег и (или) денежных инструментов»</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="w190">
							<tbody>
								<tr>
									<td align="left" class="graphMain" style="border:2px solid;text-align:justify;">
										<b>
											<i>
										Формуляр заполняется физическими лицами, достигшими 16-летнего возраста, при перемещении через таможенную границу таможенного союза:
										<br/>
												<xsl:text>    </xsl:text>- наличных денежных средств (банкноты и монеты, за исключением монет из драгоценных металлов) и дорожных чеков, в сумме, превышающей в эквиваленте 10 000 долларов США;
										<br/>
												<xsl:text>    </xsl:text>- иных денежных инструментов в документарной форме (векселя, чеки (банковские), ценные бумаги на предъявителя)
										<br/>
										При заполнении формуляра указываются сведения <u>о всех</u> перемещаемых наличных денежных средствах, дорожных чеках и денежных инструментах
										</i>
										</b>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table class="w190">
							<tbody>
								<tr style="font-size:10pt;">
									<td style="border:1px solid;">
										<b>Тип декларации</b>
									</td>
									<td style="border:1px solid;">
										<div style="width:5mm;display:inline-block;">
											<xsl:if test="pcd_bd:EnterOrExitCustomsTerritory='1'"><b>X</b></xsl:if>
										</div>⁭въезд на территорию таможенного союза</td>
									<td style="border:1px solid;">
										<div style="width:5mm;display:inline-block;">
											<xsl:if test="pcd_bd:EnterOrExitCustomsTerritory='2'"><b>X</b></xsl:if>
										</div>⁭выезд с территории таможенного союза</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<div>
							<font size="4">
								<b>1. Сведения о физическом лице:</b>
							</font>
						</div>
						<table class="w190">
							<tbody>
								<tr style="height:4mm;">
									<td width="33%" align="center" style="border-bottom:1px solid;border-left:1px solid;">
										<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonSurname"/>
									</td>
									<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;border-left:1px solid;">
										<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonName"/>
									</td>
									<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;">
										<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonMiddleName"/>
									</td>
								</tr>
								<tr style="height:4mm;font-size:8pt;">
									<td align="center">фамилия</td>
									<td align="center">имя</td>
									<td align="center">отчество</td>
								</tr>
								<tr style="height:4mm;">
									<td width="33%" align="center" style="border-bottom:1px solid;border-left:1px solid;">
										<xsl:value-of select="pcd_bd:DeclarantPerson/pcd_bd:BirthPlace"/>
										<xsl:text> </xsl:text>
										<xsl:variable name="bday">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="pcd_bd:DeclarantPerson/pcd_bd:BirthDate"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:value-of select="translate($bday,'.','/')"/>
									</td>
									<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;border-left:1px solid;">
										<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:RegCountry/cat_pcd:CountryName"/>
										<!--xsl:for-each select="pcd_bd:DeclarantPerson/cat_pcd:RegCountry/*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:for-each-->
									</td>
									<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;">
										<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:CountryPermanentResidence/cat_pcd:CountryName"/>
										<!--xsl:for-each select="pcd_bd:DeclarantPerson/cat_pcd:CountryPermanentResidence/*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:for-each-->
									</td>
								</tr>
								<tr style="height:4mm;font-size:8pt;">
									<td align="center">место и дата рождения (дд/мм/гггг)</td>
									<td align="center">гражданство/подданство</td>
									<td align="center">страна постоянного проживания</td>
								</tr>
								<tr style="height:4mm;">
									<xsl:for-each select="pcd_bd:DeclarantPerson/cat_pcd:PersonIdCard">
										<td width="33%" align="center" style="border-bottom:1px solid;border-left:1px solid;">
											<xsl:value-of select="cat_ru:IdentityCardName"/>
										</td>
										<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;border-left:1px solid;">
											<xsl:value-of select="cat_ru:IdentityCardSeries"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="cat_ru:IdentityCardNumber"/>
										</td>
										<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
											</xsl:call-template>
											<xsl:text> </xsl:text>
											<xsl:value-of select="cat_ru:OrganizationName"/>
										</td>
									</xsl:for-each>
								</tr>
								<tr style="height:4mm;font-size:8pt;">
									<td align="center">тип документа, удостоверяющего личность</td>
									<td align="center">серия, №</td>
									<td align="center">дата и место выдачи документа</td>
								</tr>
								<tr style="height:4mm;">
									<td width="33%" align="center" style="border-bottom:1px solid;border-left:1px solid;">
										<xsl:for-each select="pcd_bd:DeclarantPerson/pcd_bd:Address/*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</td>
									<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;border-left:1px solid;">
										<xsl:for-each select="pcd_bd:DeclarantPerson/cat_pcd:RegAddress/*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</td>
									<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;">
										<xsl:for-each select="pcd_bd:DeclarantPerson/pcd_bd:RegDocumentReference/*">
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
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr style="height:4mm;font-size:8pt;">
									<td align="center" valign="top">адрес постоянного места жительства</td>
									<td align="center" valign="top">адрес места пребывания (регистрации) на территории таможенного союза</td>
									<td align="center" valign="top">номер и дата выдачи визы (реквизиты документа, подтверждающего право пребывания на территории таможенного союза)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<div>
							<font size="4">
								<b>2. Сведения о наличных денежных средствах и денежных инструментах</b>
							</font>
						</div>
						<br/>
						<div>
							<font size="4">
								<b>2.1 Наличные денежные средства и дорожные чеки  </b>
							</font>
						</div>
						<br/>
						<table class="w190">
							<tbody>
								<tr>
									<td style="border:1px solid;" width="33%"/>
									<td style="border:1px solid;" width="33%">Сумма</td>
									<td style="border:1px solid;" width="33%">Вид валюты</td>
								</tr>
								<xsl:variable name="notescoins">
									<xsl:choose>
										<xsl:when test="count(pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[pcd_bd:ForeignCurKind='1' or pcd_bd:ForeignCurKind='2']) &gt;= 1">
											<xsl:value-of select="count(pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[pcd_bd:ForeignCurKind='1' or pcd_bd:ForeignCurKind='2'])"/>
										</xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td style="border:1px solid">
										<xsl:attribute name="rowspan"><xsl:value-of select="$notescoins"/></xsl:attribute>
										Банкноты, монеты
									</td>
									<td style="border:1px solid">
										<xsl:value-of select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind) &lt; 3][1]/pcd_bd:MoveAmount/cat_pcd:Amount"/>
									</td>
									<td style="border:1px solid">
										<xsl:value-of select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind) &lt; 3][1]/pcd_bd:MoveAmount/cat_pcd:CurrencyName"/>
									</td>
								</tr>
								<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind) &lt; 3][position() &gt; 1]">
									<tr>
										<td style="border:1px solid">
											<xsl:value-of select="pcd_bd:MoveAmount/cat_pcd:Amount"/>
										</td>
										<td style="border:1px solid">
											<xsl:value-of select="pcd_bd:MoveAmount/cat_pcd:CurrencyName"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:variable name="checks">
									<xsl:choose>
										<xsl:when test="count(pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind)=3]) &gt;= 1">
											<xsl:value-of select="count(pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[pcd_bd:ForeignCurKind='3'])"/>
										</xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td style="border:1px solid">
										<xsl:attribute name="rowspan"><xsl:value-of select="$checks"/></xsl:attribute>
										Дорожные чеки
									</td>
									<td style="border:1px solid">
										<xsl:value-of select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind)=3][1]/pcd_bd:MoveAmount/cat_pcd:Amount"/>
									</td>
									<td style="border:1px solid">
										<xsl:value-of select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind)=3][1]/pcd_bd:MoveAmount/cat_pcd:CurrencyName"/>
									</td>
								</tr>
								<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind)=3][position() &gt; 1]">
									<tr>
										<td style="border:1px solid">
											<xsl:value-of select="pcd_bd:MoveAmount/cat_pcd:Amount"/>
										</td>
										<td style="border:1px solid">
											<xsl:value-of select="pcd_bd:MoveAmount/cat_pcd:CurrencyName"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
						<div>
							<font size="4">
								<b>2.2. Денежные инструменты, за исключением дорожных чеков <i>(векселя, чеки (банковские), ценные бумаги на предъявителя и иное)</i>
								</b>
							</font>
						</div>
						<br/>
						<table class="w190">
							<tbody>
								<tr valign="top" align="center" style="font-weight:bold;">
									<td style="border:1px solid;">Тип<br/>инструмента</td>
									<td style="border:1px solid;">Кем выпущен</td>
									<td style="border:1px solid;">Дата выпуска</td>
									<td style="border:1px solid;">Идентификационный<br/>номер (при наличии)</td>
									<td style="border:1px solid;">Количество</td>
									<td style="border:1px solid;">Стоимость </td>
								</tr>
								<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails">
									<tr valign="top">
										<td style="border:1px solid;">
											<xsl:choose>
												<xsl:when test="pcd_bd:MonetaryInstrumentKind='0'">вексель</xsl:when>
												<xsl:when test="pcd_bd:MonetaryInstrumentKind='1'">банковский чек</xsl:when>
												<xsl:when test="pcd_bd:MonetaryInstrumentKind='2'">ценные бумаги на предъявителя</xsl:when>
												<xsl:when test="pcd_bd:MonetaryInstrumentKind='3'">иное</xsl:when>
											</xsl:choose>
										</td>
										<td style="border:1px solid;">
											<xsl:value-of select="pcd_bd:WhoReleased"/>
										</td>
										<td style="border:1px solid;">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="pcd_bd:DateReleased"/>
											</xsl:call-template>
										</td>
										<td style="border:1px solid;">
											<xsl:value-of select="pcd_bd:MonetaryInstrumentNumber"/>
										</td>
										<td style="border:1px solid;">
											<xsl:value-of select="pcd_bd:Quantity"/>
										</td>
										<td style="border:1px solid;">
											<xsl:value-of select="pcd_bd:MoveAmount/cat_pcd:Amount"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="pcd_bd:MoveAmount/cat_pcd:CurrencyName"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
					<div class="page more">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<i>Оборотная сторона</i>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<div>
						<font size="4">
							<b>3. Сведения о владельце наличных денежных средств и (или) денежных инструментов</b>
						</font>
					</div>
					<table class="w190">
						<tbody>
							<tr align="center">
								<td>
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OwnerMoney/pcd_bd:OwnerMoneyKind='0' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OwnerMoney/pcd_bd:OwnerMoneyKind='0'"><b>X</b></xsl:if>
									</div>
									декларант
								</td>
								<td>
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OwnerMoney/pcd_bd:OwnerMoneyKind='1' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OwnerMoney/pcd_bd:OwnerMoneyKind='1'"><b>X</b></xsl:if>
									</div>
									другое физическое лицо
								</td>
								<td>
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OwnerMoney/pcd_bd:OwnerMoneyKind='2' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OwnerMoney/pcd_bd:OwnerMoneyKind='2'"><b>X</b></xsl:if>
									</div>
									иное лицо
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div>
						<font size="4">
							<b>3.1. Сведения о владельце наличных денежных средств и (или) денежных инструментов – указывается, если декларант не является собственником</b>
						</font>
					</div>
					<table class="w190">
						<tbody>
							<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur|pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails">
								<xsl:for-each select="pcd_bd:OwnerMoney">
									<xsl:if test="pcd_bd:OwnerMoneyKind != '0'">
										<tr valign="top">
											<td style="border:1px solid;" width="50%">Фамилия, имя для физических лиц/Наименование иного лица</td>
											<td style="border:1px solid;" width="50%">
												<xsl:value-of select="pcd_bd:OwnerMoneyName"/>
											</td>
										</tr>
										<tr valign="top">
											<td style="border:1px solid;">Адрес местожительства для физического лица/Адрес местонахождения (юридический адрес) для иных лиц</td>
											<td style="border:1px solid;">
												<xsl:for-each select="pcd_bd:OwnerMoneyAddress/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<div>
						<font size="4">
							<b>4. Сведения о происхождении наличных денежных средств и (или) денежных инструментов</b>
						</font>
					</div>
					<br/>
					<table class="w190">
						<tbody>
							<tr valign="top">
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='1' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='1'"><b>X</b></xsl:if>
									</div>
									заработная плата, доходы от предпринимательской деятельности физического лица
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='2' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='2'"><b>X</b></xsl:if>
									</div>
									дивиденды и другие доходы от участия в капитале предприятий
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='3' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='3'"><b>X</b></xsl:if>
									</div>
									доходы от реализации движимого и недвижимого имущества
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='4' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='4'"><b>X</b></xsl:if>
									</div>
									безвозмездные трансферты, полученные от физических и юридических лиц (материальная помощь, гранты и т.п.) 
								</td>
							</tr>
							<tr valign="top">
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='5' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='5'"><b>X</b></xsl:if>
									</div>
									пенсия, стипендия, социальные пособия, алименты
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='6' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='6'"><b>X</b></xsl:if>
									</div>
									доходы от аренды недвижимости и земельных участков
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='7' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='7'"><b>X</b></xsl:if>
									</div>
									заемные средства
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='8' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='8'"><b>X</b></xsl:if>
									</div>
									наследство
								</td>
							</tr>
							<tr valign="top">
								<td colspan="4">
									<br/>
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='9' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='9'"><b>X</b></xsl:if>
									</div>
									прочее (указать):
 									<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='9']|pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails[pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='9']">
										<xsl:value-of select="pcd_bd:OriginMoney/pcd_bd:OriginMoneyOther"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div>
						<font size="4">
							<b>5. Сведения о предполагаемом использовании наличных денежных средств и (или) денежных инструментов</b>
						</font>
					</div>
					<table class="w190">
						<tbody>
							<tr valign="top">
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:IntendedUseMoney[pcd_bd:IntendedUseMoneyKind='1']"><b>X</b></xsl:if>
									</div>
									текущие расходы (приобретение товаров и услуг)
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:IntendedUseMoney[pcd_bd:IntendedUseMoneyKind='2']"><b>X</b></xsl:if>
									</div>
									инвестиции, включая  приобретение недвижимости
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:IntendedUseMoney[pcd_bd:IntendedUseMoneyKind='3']"><b>X</b></xsl:if>
									</div>
									безвозмездные трансферты в пользу физических лиц (материальная помощь и т.п.)
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:IntendedUseMoney[pcd_bd:IntendedUseMoneyKind='4']"><b>X</b></xsl:if>
									</div>
									безвозмездные трансферты в пользу юридических лиц (благотворительность, пожертвования и т.п.)
								</td>
							</tr>
							<br/>
							<tr valign="top">
								<td colspan="4">
									<br/>
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:IntendedUseMoney[pcd_bd:IntendedUseMoneyKind='5']"><b>X</b></xsl:if>
									</div>
									прочее (указать):
 									<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:IntendedUseMoney[pcd_bd:IntendedUseMoneyKind='5']">
										<xsl:value-of select="pcd_bd:IntendedUseMoneyOther"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
								<br/>
							</tr>
							<br/>
						</tbody>
					</table>
					<br/>
					<div>
						<font size="4">
							<b>6. Сведения о маршруте и способе перевозке (о виде транспорта)  наличных денежных средств и (или) денежных инструментов</b>
						</font>
					</div>
					<br/>
					<table class="w190">
						<tbody>
							<tr>
								<td style="border:1px solid;">Страна убытия <xsl:value-of select="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:RMCountryDeparture/cat_pcd:CountryName"/><!--xsl:text> </xsl:text><xsl:value-of select="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:RMCountryDeparture/cat_pcd:CountryCode"/--></td>
								<td style="border:1px solid;">Страна прибытия <xsl:value-of select="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:RMCountryArrival/cat_pcd:CountryName"/><!--xsl:text> </xsl:text><xsl:value-of select="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:RMCountryArrival/cat_pcd:CountryCode"/--></td>
							</tr>
							<tr>
								<td style="border:1px solid;">Дата убытия <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:RMDateDeparture"/></xsl:call-template></td>
								<td style="border:1px solid;">Дата прибытия <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:RMDateArrival"/></xsl:call-template></td>
							</tr>
							<tr>
								<td style="border:1px solid;" colspan="2">
									Транзитные страны
									<xsl:text> </xsl:text>
									<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransitCountries">
										<xsl:value-of select="cat_pcd:CountryName"/>
										<!--xsl:for-each select="./*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last"><xsl:text> </xsl:text></xsl:if>
										</xsl:for-each-->
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr valign="top">
								<td style="border:1px solid;width:20%;">Вид транспорта, на котором декларант прибыл/убывает на территорию таможенного союза/с территории таможенного союза</td>
								<td style="border:1px solid;width:16%;text-align:center">воздушный
									<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode = '40'"><br/><br/><b>X</b></xsl:if>
								</td>
								<td style="border:1px solid;width:16%;text-align:center;">железнодорожный
																	<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode = '20'"><br/><br/><b>X</b></xsl:if>
								</td>
								<td style="border:1px solid;width:16%;text-align:center;">водный
																	<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode = '10'"><br/><br/><b>X</b></xsl:if>
								</td>
								<td style="border:1px solid;width:16%;text-align:center;">автомобильный
									<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode = '30'"><br/><br/><b>X</b></xsl:if>
								</td>
								<td style="border:1px solid;width:16%;text-align:center;">прочее
									<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode != '10' and pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode != '20' and pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode != '30' and pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode != '40'"><br/><br/><b>X</b></xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr valign="bottom">
								<td style="border:1px solid;width:50%">
									<b>Мне известно, что сообщение в таможенной декларации недостоверных сведений влечет за собой ответственность в соответствии с законодательством государств-членов таможенного союза</b>
								</td>
								<td style="border:1px solid;width:50%;">
									<table width="100%">
										<tbody>
											<tr valign="bottom">
												<td width="25%" align="right" valign="top">Подпись лица</td>
												<td width="25%" align="left" valign="top">_____________</td>
												<td width="50%">
													<xsl:for-each select="pcd_bd:Signer">
														<xsl:value-of select="cat_ru:PersonSurname"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:PersonName"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:PersonMiddleName"/>
														<xsl:if test="cat_pcd:PersonMode">
															<br/>
															<xsl:choose>
																<xsl:when test="cat_pcd:PersonMode='1'">декларант</xsl:when>
																<xsl:when test="cat_pcd:PersonMode='2'">таможенный представитель</xsl:when>
															</xsl:choose>
														</xsl:if>
													</xsl:for-each>
												</td>
											</tr>
										</tbody>
									</table>
									Дата заполнения декларации
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="pcd_bd:Signer/cat_pcd:IssueDate"/></xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr>
								<td width="25%" align="right">
									Для служебных отметок:
									<br/>
									<div style="width:25mm;height:25mm;border:1px solid;"></div>
									<br/>
									М.П.
								</td>
								<td width="5%"></td>
								<td width="70%" valign="top">
									<br/>
									<br/>
									<xsl:value-of select="pcd_bd:CustomsMark/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="pcd_bd:CustomsMark/cat_ru:LNP"/>
									<br/>
									<xsl:apply-templates select="pcd_bd:CustomsMark/cat_pcd:Mark"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="yesno">
		<xsl:param name="sign"/>
			<table>
				<tbody>
					<tr>
						<td align="center">
							<div style="display:inline-block;border:1px solid;width:4mm;height:4mm;">
								<xsl:if test="$sign='1' or $sign='true' or $sign='t'">X</xsl:if>
							</div>
						</td>
						<td align="center">
							<div style="display:inline-block;border:1px solid;width:4mm;height:4mm;">
								<xsl:if test="$sign='0' or $sign='false' or $sign='f'">X</xsl:if>
							</div>
						</td>
					</tr>
					<tr>
						<td align="center">Да</td>
						<td align="center">Нет</td>
					</tr>
				</tbody>
			</table>
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
