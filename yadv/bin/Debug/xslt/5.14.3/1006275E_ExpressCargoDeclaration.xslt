<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ecd="urn:customs.ru:Information:CustomsDocuments:ExpressCargoDeclaration:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.14.3" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.14.3" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3">
	<!-- Шаблон для типа ExpressCargoDeclarationType -->
	<xsl:template match="ecd:ExpressCargoDeclaration">
		<xsl:param name="w" select="277"/>
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
                  padding: 10mm 10mm 10mm 10mm;
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
                  /*margin-top: 1px;*/
                  margin: 0px;
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
				<xsl:if test="ecd:ExpressRegistryKindCode = 'ДТЭГ'">
					<!--div class="page" style="width: {$w}mm;"-->
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td style="border-top:1px solid black;border-left:1px solid black; border-right:1px solid black;" align="center" valign="middle">Декларация на товары для экспресс-грузов</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr valign="top">
									<td class="bordered" rowspan="2">Отправитель (по общей накладной)<br/>
										<xsl:apply-templates mode="org" select="ecd:GoodsShipment/ecd:ConsignorDetails"/>
									</td>
									<td class="bordered" rowspan="2">Получатель (по общей накладной)<br/>
										<xsl:apply-templates mode="org" select="ecd:GoodsShipment/ecd:ConsigneeDetails"/>
									</td>
									<td class="bordered">A</td>
									<td class="bordered">ДТЭГ<br/>
										<xsl:value-of select="ecd:ElectronicDocumentSign"/>
									</td>
									<td class="bordered">Особенность<br/>
										<xsl:value-of select="ecd:DeclarationKind"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered">Предшествующий документ<br/>
										<xsl:apply-templates mode="reg_num" select="ecd:GoodsShipment/ecd:PrevApplicationRegNum"/>
									</td>
									<td class="bordered">Кол-во листов <xsl:value-of select="ecd:TotalSheetNumber"/>
									</td>
									<td class="bordered">Процедура<br/>
										<xsl:value-of select="ecd:CustomsModeCode"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ecd:PreviousCustomsModeCode"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center" valign="top">
									<td class="bordered" colspan="5">Общие сведения</td>
									<td class="bordered" colspan="8">Сведения о товарах</td>
									<td class="bordered" colspan="2">Сведения о документах</td>
									<td class="bordered">Примечание</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered" rowspan="2">N п/п</td>
									<td class="bordered" rowspan="2">Общая накладная</td>
									<td class="bordered" rowspan="2">Инд. накладная</td>
									<td class="bordered" rowspan="2">Инд. отправитель</td>
									<td class="bordered" rowspan="2">Инд. получатель</td>
									<td class="bordered" rowspan="2">N п/п</td>
									<td class="bordered" rowspan="2">Наименование</td>
									<td class="bordered" rowspan="2">Код ТН ВЭД ЕАЭС</td>
									<td class="bordered" rowspan="2">Кол-во</td>
									<td class="bordered" colspan="2">Вес</td>
									<td class="bordered" rowspan="2">Валюта, стоимость</td>
									<td class="bordered" rowspan="2">Таможенная стоимость</td>
									<td class="bordered" rowspan="2">Код, признак</td>
									<td class="bordered" rowspan="2">Дата, номер</td>
									<td class="bordered" rowspan="3"/>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered">брутто</td>
									<td class="bordered">нетто</td>
								</tr>
								<tr align="center">
									<td class="bordered">1</td>
									<td class="bordered">2</td>
									<td class="bordered">3</td>
									<td class="bordered">4</td>
									<td class="bordered">5</td>
									<td class="bordered">6</td>
									<td class="bordered">7</td>
									<td class="bordered">8</td>
									<td class="bordered">9</td>
									<td class="bordered">10</td>
									<td class="bordered">11</td>
									<td class="bordered">12</td>
									<td class="bordered">13</td>
									<td class="bordered">14</td>
									<td class="bordered">15</td>
								</tr>
								<xsl:for-each select="ecd:GoodsShipment/ecd:HouseShipment">
									<xsl:variable name="rowspan" select="count(ecd:GoodsItemDetails)"/>
									<tr align="center" valign="top">
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan+1"/></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="ecd:ObjectOrdinal"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="doc" select="ecd:TransportDocumentDetails"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="doc" select="ecd:HouseWaybillDetails"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="org" select="ecd:ConsignorDetails"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="org" select="ecd:ConsigneeDetails"/>
										</td>
										<xsl:if test="not(ecd:GoodsItemDetails)">
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
										</xsl:if>
										<xsl:apply-templates select="ecd:GoodsItemDetails[1]"/>
									</tr>
									<xsl:for-each select="ecd:GoodsItemDetails[position() &gt; 1]">
										<tr align="center" valign="top">
											<xsl:apply-templates select="."/>
										</tr>
									</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered" colspan="8" align="left">
											Всего по индивидуальной накладной<br/>
	(общий вес брутто, таможенная стоимость)
										</td>
										<td class="bordered">
											<xsl:apply-templates mode="quantity" select="ecd:UnifiedGrossWeightQuantity"/>
										</td>
										<td colspan="2"/>
										<td class="bordered">
											<xsl:apply-templates mode="pricevalue" select="ecd:CustomsCost"/>
										</td>
									</tr>
								</xsl:for-each>
								<tr align="center" valign="top">
									<td class="bordered" colspan="9" align="left">
											Всего по декларации на товары для экспресс-грузов<br/>
	(общий вес брутто, таможенная стоимость)
										</td>
									<td class="bordered">
										<xsl:apply-templates mode="quantity" select="ecd:GoodsShipment/ecd:UnifiedGrossWeightQuantity"/>
									</td>
									<td colspan="2"/>
									<td class="bordered">
										<xsl:apply-templates mode="pricevalue" select="ecd:GoodsShipment/ecd:CustomsCost"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr align="center" valign="top">
									<td class="bordered" colspan="6">B. Исчисление платежей</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered">Товар</td>
									<td class="bordered">Вид</td>
									<td class="bordered">База для исчисления</td>
									<td class="bordered">Код базы для исчисления</td>
									<td class="bordered">Ставка</td>
									<td class="bordered">Сумма</td>
								</tr>
								<tr align="center">
									<td class="bordered">1</td>
									<td class="bordered">2</td>
									<td class="bordered">3</td>
									<td class="bordered">4</td>
									<td class="bordered">5</td>
									<td class="bordered">6</td>
								</tr>
								<xsl:for-each select="ecd:GoodsShipment/ecd:HouseShipment">
									<xsl:variable name="party" select="."/>
									<xsl:for-each select="ecd:GoodsItemDetails">
										<xsl:variable name="partyDetails" select="."/>
										<xsl:for-each select="ecd:CustomsPaymentDetails">
											<tr align="center">
												<td class="bordered">
													<xsl:value-of select="$party/ecd:ObjectOrdinal"/>
													<xsl:text>/</xsl:text>
													<xsl:value-of select="$partyDetails/ecd:GoodsNumeric"/>
												</td>
												<td class="bordered">
													<xsl:value-of select="RUDECLcat:PaymentModeCode"/>
												</td>
												<td class="bordered">
													<xsl:value-of select="RUDECLcat:TaxBase"/>
												</td>
												<td class="bordered">
													<xsl:value-of select="RUDECLcat:TaxBaseCurrencyCode"/>
												</td>
												<td class="bordered">
													<xsl:apply-templates mode="rate1" select="."/>
												</td>
												<td class="bordered">
													<xsl:value-of select="RUDECLcat:PaymentAmount"/>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered">
											Всего по индивидуальной накладной
										</td>
										<td class="bordered"/>
										<td class="bordered"/>
										<td class="bordered"/>
										<td class="bordered"/>
										<td class="bordered"/>
									</tr>
								</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered">
											Всего по декларации на товары для экспресс-грузов
										</td>
										<td class="bordered"/>
										<td class="bordered"/>
										<td class="bordered"/>
										<td class="bordered"/>
										<td class="bordered"/>
									</tr>
									<tr>
										<td class="bordered" colspan="6">
											<div width="100%" align="center">B1. Подробности уплаты (взыскания)</div>
											<br/>
											<xsl:for-each select="ecd:GoodsShipment/ecd:FactCustomsPayment">
											
												<xsl:if test="position()!=1"><br/></xsl:if>

												<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
												<xsl:text> - </xsl:text>
												<xsl:value-of select="catESAD_cu:PaymentAmount"/>
												<xsl:text> - </xsl:text>
												<xsl:value-of select="catESAD_cu:PaymentCurrencyCode"/>
												<xsl:text> - </xsl:text>
												<xsl:choose>
													<xsl:when test="ecd:PaymentDocument/cat_ru:PrDocumentNumber">
														<xsl:value-of select="ecd:PaymentDocument/cat_ru:PrDocumentNumber"/>
													</xsl:when>
													<xsl:otherwise>00</xsl:otherwise>
												</xsl:choose>
												<xsl:text> - </xsl:text>
												<xsl:choose>
													<xsl:when test="ecd:PaymentDocument/cat_ru:PrDocumentDate">
														<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ecd:PaymentDocument/cat_ru:PrDocumentDate"/></xsl:call-template>
													</xsl:when>
													<xsl:otherwise>00</xsl:otherwise>
												</xsl:choose>
												<xsl:text> - </xsl:text>
												<xsl:value-of select="ecd:PaymentWayCode"/>
												<xsl:if test="ecd:RFOrganizationFeatures/cat_ru:INN">
													<xsl:text> - </xsl:text>
													<xsl:value-of select="ecd:RFOrganizationFeatures/cat_ru:INN"/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td class="bordered">Сведения о лице, заполнившем ДТЭГ, дата
										<br/><br/>
										<xsl:value-of select="ecd:BrokerRegistryDocDetails/RUDECLcat:DocKindCode"/>
										<br/>
										<xsl:value-of select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonMiddleName"/>
										<br/>
										<xsl:apply-templates mode="identitycard" select="ecd:SignatoryPerson/ecd:SignatoryPersonIdentityDetails"/>
										<br/>
										<xsl:value-of select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonPost"/>
										<br/>
										<xsl:value-of select="ecd:SignatoryPerson/ecd:PowerOfAttorneyDetails/catESAD_cu:DocKindCode"/>
									</td>
								</tr>
								<tr>
									<td class="bordered">C</td>
								</tr>
								<tr>
									<td class="bordered">D</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="ecd:ExpressRegistryKindCode = 'ПТДЭГ'">
					<!--div class="page" style="width: {$w}mm;"-->
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td style="border-top:1px solid black;border-left:1px solid black; border-right:1px solid black;" align="center" valign="middle">Пассажирская таможенная декларация для экспресс-грузов</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr valign="top">
									<td class="bordered" rowspan="2">Отправитель (по общей накладной)<br/>
										<xsl:apply-templates mode="org" select="ecd:GoodsShipment/ecd:ConsignorDetails"/>
									</td>
									<td class="bordered" rowspan="2">Получатель (по общей накладной)<br/>
										<xsl:apply-templates mode="org" select="ecd:GoodsShipment/ecd:ConsigneeDetails"/>
									</td>
									<td class="bordered">A</td>
									<td class="bordered">ПТДЭГ
										<table>
											<tbody>
												<tr>
													<td width="50%" style="border-right: 1px solid black;">
														<xsl:value-of select="ecd:DeclarationKindCode"/>
													</td>
													<td width="50%">
														<xsl:value-of select="ecd:ElectronicDocumentSign"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="bordered">Особенность<br/>
										<xsl:value-of select="ecd:DeclarationKind"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered">Предшествующий документ<br/>
										<xsl:apply-templates mode="reg_num" select="ecd:GoodsShipment/ecd:PrevApplicationRegNum"/>
									</td>
									<td class="bordered" colspan="2">Кол-во листов <xsl:value-of select="ecd:TotalSheetNumber"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr align="center" valign="top">
									<td class="bordered" colspan="5">Общие сведения</td>
									<td class="bordered" colspan="7">Сведения о товарах</td>
									<td class="bordered" colspan="2">Сведения о документах</td>
									<td class="bordered" rowspan="3">Примечание</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered">N п/п</td>
									<td class="bordered">Общая накладная</td>
									<td class="bordered">Инд. накладная</td>
									<td class="bordered">Инд. отправитель</td>
									<td class="bordered">Инд. получатель</td>
									<td class="bordered">N п/п</td>
									<td class="bordered">Наименование</td>
									<td class="bordered">Код ТН ВЭД ЕАЭС</td>
									<td class="bordered">Кол-во</td>
									<td class="bordered">Вес брутто</td>
									<td class="bordered">Валюта, стоимость</td>
									<td class="bordered">Валюта, стоимость в валюте государства-члена</td>
									<td class="bordered">Код, признак</td>
									<td class="bordered">Дата, номер</td>
								</tr>
								<tr align="center">
									<td class="bordered">1</td>
									<td class="bordered">2</td>
									<td class="bordered">3</td>
									<td class="bordered">4</td>
									<td class="bordered">5</td>
									<td class="bordered">6</td>
									<td class="bordered">7</td>
									<td class="bordered">8</td>
									<td class="bordered">9</td>
									<td class="bordered">10</td>
									<td class="bordered">11</td>
									<td class="bordered">12</td>
									<td class="bordered">13</td>
									<td class="bordered">14</td>
								</tr>
								<xsl:for-each select="ecd:GoodsShipment/ecd:HouseShipment">
									<xsl:variable name="rowspan" select="count(ecd:GoodsItemDetails)"/>
									<tr align="center" valign="top">
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan+1"/></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="ecd:ObjectOrdinal"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="doc" select="ecd:TransportDocumentDetails"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="doc" select="ecd:HouseWaybillDetails"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="org" select="ecd:ConsignorDetails"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="org" select="ecd:ConsigneeDetails"/>
										</td>
										<xsl:if test="not(ecd:GoodsItemDetails)">
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
										</xsl:if>
										<xsl:apply-templates select="ecd:GoodsItemDetails[1]"/>
									</tr>
									<xsl:for-each select="ecd:GoodsItemDetails[position() &gt; 1]">
										<tr align="center" valign="top">
											<xsl:apply-templates select="."/>
										</tr>
									</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered" colspan="8" align="left">
											Всего по индивидуальной накладной<br/>
	(общий вес брутто, таможенная стоимость)
										</td>
										<td class="bordered">
											<xsl:apply-templates mode="quantity" select="ecd:UnifiedGrossWeightQuantity"/>
										</td>
										<td/>
										<td class="bordered">
											<xsl:apply-templates mode="pricevalue" select="ecd:CustomsCost"/>
										</td>
									</tr>
								</xsl:for-each>
								<tr align="center" valign="top">
									<td class="bordered" colspan="9" align="left">
											Всего по пассажирской таможенной декларации для экспресс-грузов<br/>
(общий вес брутто, стоимость в валюте государства-члена)

										</td>
									<td class="bordered">
										<xsl:apply-templates mode="quantity" select="ecd:GoodsShipment/ecd:UnifiedGrossWeightQuantity"/>
									</td>
									<td/>
									<td class="bordered">
										<xsl:apply-templates mode="pricevalue" select="ecd:GoodsShipment/ecd:CustomsCost"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td class="bordered">Сведения о лице, заполнившем ПТДЭГ, дата
										<br/><br/>
										<xsl:value-of select="ecd:BrokerRegistryDocDetails/RUDECLcat:DocKindCode"/>
										<br/>
										<xsl:value-of select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonMiddleName"/>
										<br/>
										<xsl:apply-templates mode="identitycard" select="ecd:SignatoryPerson/ecd:SignatoryPersonIdentityDetails"/>
										<br/>
										<xsl:value-of select="ecd:SignatoryPerson/ecd:SigningDetails/cat_ru:PersonPost"/>
										<br/>
										<xsl:value-of select="ecd:SignatoryPerson/ecd:PowerOfAttorneyDetails/catESAD_cu:DocKindCode"/>
									</td>
								</tr>
								<tr>
									<td class="bordered">C</td>
								</tr>
								<tr>
									<td class="bordered">D</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			
			</body>
		</html>
	</xsl:template>

	<xsl:template mode="identitycard" match="*">
		<xsl:value-of select="RUScat_ru:CountryCode"/>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:if test="RUScat_ru:CountryCode">, </xsl:if>
			<xsl:value-of select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:IdentityCardName">, </xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardSeries">серия <xsl:value-of select="RUScat_ru:IdentityCardSeries"/>&#160;</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardNumber">№ <xsl:value-of select="RUScat_ru:IdentityCardNumber"/></xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">, </xsl:if>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="rate1">
		<xsl:variable name="rateval">
			<xsl:choose>
				<xsl:when test="RUDECLcat:Rate or RUDECLcat:Rate!=''">
					<xsl:value-of select="RUDECLcat:Rate"/>
				</xsl:when>
				<xsl:otherwise> 0 </xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="format-number($rateval,'0.######')"/>
		<xsl:choose>
			<xsl:when test="RUDECLcat:RateTypeCode='%'">%</xsl:when>
			<xsl:when test="RUDECLcat:RateTypeCode!='*' or not(RUDECLcat:RateTypeCode)">
				<xsl:choose>
					<xsl:when test="RUDECLcat:RateCurrencyCode">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="RUDECLcat:RateCurrencyCode"/>
						<xsl:if test="RUDECLcat:RateTNVEDQualifierCode">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="RUDECLcat:WeightingFactor"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="RUDECLcat:RateTNVEDQualifierCode"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise> % </xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="reg_num">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="ecd:GoodsItemDetails">
		<td class="bordered">
			<xsl:value-of select="ecd:GoodsNumeric"/>
		</td>
		<td class="bordered">
			<xsl:apply-templates select="ecd:GoodsDescription"/>
		</td>
		<td class="bordered">
			<xsl:value-of select="ecd:GoodsTNVEDCode"/>
		</td>
		<td class="bordered">
			<xsl:apply-templates mode="quantity" select="ecd:SupplementaryQuantity"/>
		</td>
		<td class="bordered">
			<xsl:apply-templates mode="quantity" select="ecd:GrossWeightQuantity"/>
		</td>
		<td class="bordered">
			<xsl:apply-templates mode="pricevalue" select="ecd:CAValueAmount[1]"/>
		</td>
		<td class="bordered">
			<!--xsl:apply-templates mode="pricevalue" select="ecd:CustomsCost"/-->
			<xsl:apply-templates mode="pricevalue" select="ecd:CAValueAmount[2]"/>
		</td>
		<td class="bordered">
			<xsl:value-of select="ecd:PresentedDocDetails/RUDECLcat:DocKindCode"/>
		</td>
		<td class="bordered">
			<xsl:if test="ecd:PresentedDocDetails/cat_ru:PrDocumentNumber">
				<xsl:text>№ </xsl:text>
				<xsl:value-of select="ecd:PresentedDocDetails/cat_ru:PrDocumentNumber"/>
				<br/>
			</xsl:if>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="ecd:PresentedDocDetails/cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</td>
		<td class="bordered">
			<xsl:apply-templates select="ecd:Note"/>
		</td>
	</xsl:template>
	<xsl:template match="*" mode="pricevalue">
		<xsl:value-of select="ecd:CurrencyQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:if test="ecd:CurrencyCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="ecd:CurrencyCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="quantity">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName and not(cat_ru:OrganizationName)">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
	</xsl:template>
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> т.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:if test="position()!=1">, </xsl:if>
				<xsl:value-of select="."/>
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
				<xsl:if test="position()!=1">, </xsl:if>
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<!--xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if-->
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<!--xsl:value-of select="cat_ru:PrDocumentName"/-->
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
		<xsl:if test="ecd:DocKindCode">
			<xsl:text> </xsl:text>
			<xsl:value-of select="ecd:DocKindCode"/>
		</xsl:if>
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
