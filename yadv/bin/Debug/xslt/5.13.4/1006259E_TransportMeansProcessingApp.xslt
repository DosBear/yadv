<?xml version="1.0" encoding="utf-8" ?>
<!-- Решение Коллегии ЕЭК № 185 от 19 декабря 2017 г - О структуре и формате ЗСО
  Решение Коллегии ЕЭК № 178 от 19 декабря 2017 г - О ЗСО -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tmpa="urn:customs.ru:Information:CustomsDocuments:TransportMeansProcessingApp:5.13.3" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.13.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3">

<!-- Шаблон для типа TransportMeansProcessingAppType -->
<xsl:template match="tmpa:TransportMeansProcessingApp">
<html>
	<head>
		<style>
			body {
			background: #cccccc;
			}

			div
			{
			white-space: nowrap;
			}

			div.page {
			width: 210mm;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
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
			cellpadding: 5;
			}

			table.border tr td
			{
			border: 1px solid windowtext;
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

			td.bordered_without_top
			{
				border-collapse: collapse;
				border-right: solid 1px windowtext;
				border-top: none;
				border-bottom: solid 1px windowtext;
				border-left: solid 1px windowtext;
			}

			td.bordered_without_bottom
			{
				border-collapse: collapse;
				border-right: solid 1px windowtext;
				border-top: solid 1px windowtext;
				border-bottom: none;
				border-left: solid 1px windowtext;
			}

			td.bordered_top_right
			{
				border-collapse: collapse;
				border-right: solid 1px windowtext;
				border-top: solid 1px windowtext;
				border-bottom: none;
				border-left: none;
			}

			td.bordered_top_right_bottom
			{
				border-collapse: collapse;
				border-right: solid 1px windowtext;
				border-top: solid 1px windowtext;
				border-bottom: solid 1px windowtext;
				border-left: none;
			}

			td.bordered_right_bottom
			{
				border-collapse: collapse;
				border-right: solid 1px windowtext;
				border-top: none;
				border-bottom: solid 1px windowtext;
				border-left: none;
			}

			td.bordered_bottom
			{
				border-collapse: collapse;
				border-right: none;
				border-top: none;
				border-bottom: solid 1px windowtext;
				border-left: none;
			}

			td.bordered_top_bottom
			{
				border-collapse: collapse;
				border-right: none;
				border-top: solid 1px windowtext;
				border-bottom: solid 1px windowtext;
				border-left: none;
			}


			.graphMain
			{
			font-family: Arial;
			font-size: 9pt;
			}

			td.graphMain
			{
			vertical-align:top;
			}
			td.value.graphMain
			{
			vertical-align:top;
			}

			.graphHeader
			{
			font-family: Arial;
			font-size: small;
			font-weight:bold;
			}

			td.graphHeader
			{
			vertical-align:top;
			}
			td.value.graphHeader
			{
			vertical-align:bottom;
			}

			.normal
			{
			font-size: 9pt;
			font-family:Arial;
			}			

			.bold
			{
			font-weight: bold;
			font-family:Arial;
			font-size: 9pt;
			}			

			.italic
			{
			font-style: italic;
			font-family:Arial;
			font-size: 8pt;
			}			

		</style>
	</head>
	<body>
		<div class="page">

			<table>
				<col width="54%" valign="top"/>
				<col width="28%" valign="top"/>
				<col width="18%" valign="top"/>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3" class="bordered" align="center">
							<span class="bold">ЗАЯВЛЕНИЕ<br/>о совершении операций в отношении находящихся за пределами таможенной
								территории Евразийского экономического союза транспортных средств международной перевозки, являющихся 
								товарами, помещенными под таможенную процедуру временного ввоза (допуска)
							</span>
						</td>
					</tr>
					<tr>
						<td class="bordered" style="word-break: break-all"><span class="bold">1. Декларант</span>
							<span class="normal">
								<xsl:apply-templates select="tmpa:Declarant" />
							</span>	
						</td>
						<td  colspan="2" class="bordered"><span class="bold">А</span>
							<span class="normal">
								<br/>
							</span>	
						</td>
					</tr>
					<xsl:for-each select="tmpa:GoodsShipment/tmpa:GoodsItemDetails">
						<tr>
							<td rowspan="3" class="bordered">
								<span class="bold">2. Описание товара</span>
								<span class="normal">
									<br/>1: 
									<xsl:for-each select="RUScat_ru:GoodsDescription">
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<br/>2: 
									<xsl:for-each select="tmpa:AddGoodsMeasureDetails">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">; </xsl:if>
									</xsl:for-each>
								</span>
							</td>
							<td  colspan="2" class="bordered">
								<span class="bold">3. Код товара</span>
								<span class="normal">
									<br/>
									<xsl:if test="RUScat_ru:GoodsTNVEDCode">
										<xsl:value-of select="RUScat_ru:GoodsTNVEDCode" />
									</xsl:if>
								</span>
							</td>
						</tr>
						<tr>
							<td  colspan="2" class="bordered">
								<span class="bold">4. Предшествующий документ</span>
								<span class="normal">
									<br/>
									<xsl:apply-templates select="tmpa:PrecedingDocDetails"/>
								</span>
							</td>
						</tr>
						<tr>
							<td  class="bordered">
								<span class="bold">5. Стоимость операций</span>
								<span class="normal">
									<br/>
									<xsl:for-each select="tmpa:CAValueAmount">
										<xsl:value-of  select="translate(translate(format-number(RUScat_ru:Amount, '#,###.00'),',',' '),'.',',')"/>
										/
										<xsl:value-of select="RUScat_ru:CurrencyCode" />
									</xsl:for-each>
								</span>
							</td>
							<td  class="bordered">
								<span class="bold">5а.Таможенная стоимость</span>
								<span class="normal">
									<br/>
									<xsl:if test="tmpa:CustomsValueAmount">
										<xsl:for-each select="tmpa:CustomsValueAmount">
											<xsl:value-of  select="translate(translate(format-number(RUScat_ru:Amount, '#,###.00'),',',' '),'.',',')"/>
											/
											<xsl:value-of select="RUScat_ru:CurrencyCode" />
										</xsl:for-each>
									</xsl:if>
								</span>
							</td>
						</tr>
						<tr>
							<td class="bordered">
								<span class="bold">6. Описание операций</span>
								<xsl:for-each select="tmpa:ProcessingDescriptionDetails">
									<span class="normal">
										<br/> 
										<xsl:for-each select="tmpa:ProcessingDescriptionText">
											<xsl:apply-templates select="."/>
										</xsl:for-each>
										, 
										<xsl:apply-templates select="tmpa:PeriodDateDetails"/>
									</span>
								</xsl:for-each>
							</td>
							<td  colspan="2" class="bordered">
								<span class="bold">7. Представленные документы</span>
								<span class="normal">
									<br/>
									<xsl:for-each select="tmpa:PresentedDocDetails">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="tmpa:GoodsShipment">
						<tr>
							<td rowspan="2" class="bordered">
								<span class="bold">8. Исчисление платежей</span>
								<span class="normal">
									<br/>
									<table style="word-break: break-all" width="100%">
										<col width="12%" valign="top"/>
										<col width="41%" valign="top"/>
										<col width="19%" valign="top"/>
										<col width="19%" valign="top"/>
										<col width="9%" valign="top"/>
										<tbody>
											<tr class="italic" align="center">
												<td class="bordered_top_right_bottom">Вид</td>
												<td class="bordered_top_right_bottom">Основа начисления</td>
												<td class="bordered_top_right_bottom">Ставка</td>
												<td class="bordered_top_right_bottom">Сумма</td>
												<td class="bordered_top_bottom">СП</td>
											</tr>
											<xsl:for-each select="tmpa:GoodsItemDetails/tmpa:GoodsItemPaymentDetails">
												<tr class="normal">
													<td class="bordered_right_bottom" align="center"><xsl:value-of select="RUDECLcat:PaymentModeCode" /></td>
													<td class="bordered_right_bottom">
														<xsl:if test="RUDECLcat:TaxBase">
															<xsl:value-of select="RUDECLcat:TaxBase" />&#160;
														</xsl:if>
														<xsl:value-of select="RUDECLcat:TNVEDGroup" />
													</td>
													<td class="bordered_right_bottom">
														<xsl:value-of select="RUDECLcat:Rate"/>
														<xsl:if test="RUDECLcat:PaymentModeCode != 10">
															&#160;
															<xsl:choose>
																<xsl:when test="RUDECLcat:RateTypeCode = '*'">	
																	<xsl:value-of select="RUDECLcat:RateTNVEDQualifierCode"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:if test="RUDECLcat:Rate">%</xsl:if>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:if>
													</td>
													<td class="bordered_right_bottom">
														<xsl:if test="RUDECLcat:PaymentAmount">
															<xsl:value-of select="format-number(RUDECLcat:PaymentAmount,'0.00')"/>
														</xsl:if>													
													</td>
													<td class="bordered_bottom" align="center">
														<xsl:value-of select="RUDECLcat:PaymentCode"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</span>
							</td>
							<td  colspan="2" class="bordered">
								<span class="bold">9. Подробности подсчета</span>
								<span class="normal">
									<br/>
									<xsl:for-each select="tmpa:FactPaymentDetails">
										<xsl:apply-templates select="." />
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
					</xsl:for-each>
					<tr>
						<td  colspan="2" class="bordered">
							<span class="bold">10. Ф. И. О., должность, дата</span>
							<span class="normal">
								<br/>
								<xsl:apply-templates select="tmpa:SigningDetails"/>
							</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>
</xsl:template>

<!-- Шаблон для типа RUDECLcat:SimplePresentedDocDetailsType -->
<xsl:template match="tmpa:FactPaymentDetails">
	<span class="normal">
		<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
	</span>
	<span class="normal">-</span>
	<span class="normal">
		<xsl:value-of select="format-number(catESAD_cu:PaymentAmount,'0.00')"/>
	</span>
	<xsl:if test="catESAD_cu:PaymentCurrencyCode">
		<span class="normal">-</span>
		<span class="normal">
			<xsl:value-of select="catESAD_cu:PaymentCurrencyCode"/>
		</span>
	</xsl:if>
	<xsl:if test="tmpa:PaymentDocument/cat_ru:PrDocumentNumber">
		<span class="normal">-</span>
		<span class="normal">
			<xsl:value-of select="tmpa:PaymentDocument/cat_ru:PrDocumentNumber"/>
		</span>
	</xsl:if>
	<xsl:choose>
		<xsl:when test="tmpa:PaymentDate">
				<span class="normal">-</span>
				<span class="normal">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="tmpa:PaymentDate"/>
					</xsl:call-template>
				</span>
		</xsl:when>
		<xsl:otherwise>
			<xsl:if test="tmpa:PaymentDocument/cat_ru:PrDocumentDate">
				<span class="normal">-</span>
				<span class="normal">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="tmpa:PaymentDocument/cat_ru:PrDocumentDate"/>
					</xsl:call-template>
				</span>
			</xsl:if>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:if test="tmpa:PaymentDocument/cat_ru:PrDocumentNumber">
		<span class="normal">-</span>
		<span class="normal">
			<xsl:value-of select="tmpa:PaymentDocument/cat_ru:PrDocumentNumber"/>
		</span>
	</xsl:if>
	<xsl:if test="tmpa:PaymentWayCode">
		<span class="normal">-</span>
		<span class="normal">
			<xsl:value-of select="tmpa:PaymentWayCode"/>
		</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUDECLcat:SimplePresentedDocDetailsType -->
<xsl:template match="tmpa:PresentedDocDetails">
	<span class="normal">
		<xsl:if test="RUDECLcat:DocKindCode">
			<xsl:value-of select="RUDECLcat:DocKindCode"/>
			<xsl:if test="cat_ru:PrDocumentNumber or cat_ru:PrDocumentDate">
				/
			</xsl:if>	
		</xsl:if>	
	</span>
	<xsl:if test="cat_ru:PrDocumentNumber">
		<span class="italic">№ </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</span>
	</xsl:if>	
	<xsl:if test="cat_ru:PrDocumentDate">
		<span class="italic"> от </span>
		<span class="normal">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</span>
	</xsl:if>	
</xsl:template>

<!-- Шаблон для типа RUScat_ru:PeriodDetailsType -->
<xsl:template match="tmpa:PeriodDateDetails">
	<span class="italic">период</span>
	<xsl:if test="RUScat_ru:StartDateTime">
		<span class="italic"> с </span>
		<span class="normal">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:StartDateTime"/>
			</xsl:call-template>&#160;
			<xsl:value-of select="substring(RUScat_ru:StartDateTime, 12, 5)"/>
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:EndDateTime">
		<span class="italic"> по </span>
		<span class="normal">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:EndDateTime"/>
			</xsl:call-template>&#160;
			<xsl:value-of select="substring(RUScat_ru:EndDateTime, 12, 5)"/>
		</span>
	</xsl:if>
</xsl:template>


<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
<xsl:template match="tmpa:AddGoodsMeasureDetails">
	<span class="normal">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		/
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
	</span>	
	<xsl:if test="cat_ru:MeasureUnitQualifierCode">
		<span class="normal">
			/
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
		</span>	
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUDECLcat:PrecedingDocDetailsType -->
<xsl:template match="tmpa:PrecedingDocDetails">
	<xsl:if test="RUDECLcat:LineId">
		<span class="italic">ID записи</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:LineId"/>
		</span>	
	</xsl:if>
	<xsl:if test="RUDECLcat:PrecedingDocumentModeCode">
		<xsl:if test="RUDECLcat:LineId">
			<span class="normal"> / </span>
		</xsl:if>
		<span class="italic">Код вида</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:PrecedingDocumentModeCode"/>
		</span>	
	</xsl:if>
	<xsl:if test="RUDECLcat:PrecedingDocumentName">
		<xsl:if test="RUDECLcat:LineId or RUDECLcat:PrecedingDocumentModeCode">
			<span class="normal"> / </span>
		</xsl:if>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:PrecedingDocumentName"/>
		</span>	
	</xsl:if>
	<xsl:if test="RUDECLcat:PrecedingDocumentGoodsNumeric">
		<xsl:if test="RUDECLcat:LineId or RUDECLcat:PrecedingDocumentModeCode or RUDECLcat:PrecedingDocumentName">
			<span class="normal"> / </span>
		</xsl:if>
		<span class="italic">№ п/п товара</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:PrecedingDocumentGoodsNumeric"/>
		</span>	
	</xsl:if>
	<xsl:if test="RUDECLcat:CustomsDocIdDetails">
			<span class="normal"> / </span>
		<xsl:apply-templates select="RUDECLcat:CustomsDocIdDetails"/>
	</xsl:if>
	<xsl:if test="RUDECLcat:DTMDocDetails">
			<span class="normal"> / </span>
		<xsl:apply-templates select="RUDECLcat:DTMDocDetails"/>
	</xsl:if>
	<xsl:if test="RUDECLcat:PIDocumentNumber">
			<span class="normal"> / </span>
		<span class="italic">Рег.№ ПИ</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:PIDocumentNumber"/>
		</span>	
	</xsl:if>
	<xsl:if test="RUDECLcat:TIRIdDetails">
			<span class="normal"> / </span>
		<xsl:apply-templates select="RUDECLcat:TIRIdDetails"/>
	</xsl:if>
	<xsl:if test="RUDECLcat:OtherPrDocumentNumber">
			<span class="normal"> / </span>
		<span class="italic">Иной док.</span>
		<span class="normal">: </span>
		<span class="italic">№ </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:OtherPrDocumentNumber"/>
		</span>	
		<xsl:if test="RUDECLcat:OtherPrDocumentDate">
			<span class="italic"> от </span>
			<span class="normal">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="RUDECLcat:OtherPrDocumentDate" />
				</xsl:call-template>
			</span>	
		</xsl:if>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUDECLcat:CustomDocIDType -->
<xsl:template match="RUDECLcat:CustomsDocIdDetails">
	<span class="italic">ДТ</span>
	<span class="normal">: </span>
	<span class="normal">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="gtd_date" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</span>
	<xsl:if test="RUDECLcat:Code">
		<span class="normal">, </span>
		<span class="italic">№ изм. и(или) доп.</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:Code"/>
		</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUDECLcat:DTMDocDetailsType -->
<xsl:template match="RUDECLcat:DTMDocDetails">
	<span class="italic">ТДТС</span>
	<span class="normal">: </span>
	<span class="normal">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="gtd_date" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</span>
	<xsl:if test="RUDECLcat:TransportModeCode">
		<span class="normal">, </span>
		<span class="italic">код вида ТС</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:TransportModeCode"/>
		</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUDECLcat:TIRIdDetailsType -->
<xsl:template match="RUDECLcat:TIRIdDetails">
	<span class="italic">МДП </span>
	<span class="normal">: </span>
	<span class="italic">серия</span>
	<span class="normal">: </span>
	<span class="normal">
		<xsl:value-of select="RUDECLcat:TIRSeries"/>
	</span>
	<span class="italic"> №</span>
	<span class="normal">: </span>
	<span class="normal">
		<xsl:value-of select="RUDECLcat:TIRID"/>
	</span>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:EECGoodsManufacturerDetailsType -->
<!--xsl:template match="RUDECLcat:CommodityDescriptionDetails">
	<br/>
	<xsl:if test="RUScat_ru:ManufacturerName">
		<br/>
		<span class="italic">Производитель</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:ManufacturerName" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:TradeMarkName">
		<br/>
		<span class="italic">Товарный знак</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:TradeMarkName" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:ProductionPlaceName">
		<br/>
		<span class="italic">Место происхождения</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:ProductionPlaceName" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:ProductMarkName">
		<br/>
		<span class="italic">Марка</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:ProductMarkName" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:ProductModelName">
		<br/>
		<span class="italic">Модель</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:ProductModelName" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:ProductId">
		<br/>
		<span class="italic">Артикул</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:ProductId" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:ProductSortName">
		<br/>
		<span class="italic">Сорт</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:ProductSortName" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:StandardName">
		<br/>
		<span class="italic">Стандарт</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUDECLcat:StandardName" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:ProductInstanceId">
		<br/>
		<span class="italic">Серийный номер</span>
		<span class="normal">: </span>
		<span class="normal">
		<xsl:call-template name="RUDECLcat:ProductInstanceId" />
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:ManufactureDate">
		<br/>
		<span class="italic">Дата производства</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUDECLcat:ManufactureDate" />
			</xsl:call-template>
		</span>
	</xsl:if>
	<xsl:if test="RUDECLcat:IPObjectRegistryIdDetails">
		<br/>
		<br/>
		<span class="italic">Регистрационный номер ОИС</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:for-each select="RUDECLcat:IPObjectRegistryIdDetails">
				<br/>
				<xsl:if test="catESAD_cu:DocumentModeCode">
					<xsl:choose>
						<xsl:when test="catESAD_cu:DocumentModeCode = '1'">
							<span class="normal"> единый реестр, </span>
						</xsl:when>
						<xsl:when test="catESAD_cu:DocumentModeCode = '2'">
							<span class="normal"> национальный реестр, </span>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="catESAD_cu:CountryCode">
					<xsl:value-of select="catESAD_cu:CountryCode" />
					<span class="normal">, </span>
				</xsl:if>
				<xsl:if test="catESAD_cu:IPORegistryNumber">
					<span class="normal">№ </span>
					<xsl:value-of select="catESAD_cu:IPORegistryNumber" />
				</xsl:if>
			</xsl:for-each>
		</span>
	</xsl:if>
</xsl:template-->

<!-- Шаблон для типа RUDECLcat:RepresentativePersonDetailsType строка -->
<!--xsl:template match="RUDECLcat:RepresentativePersonDetails">
	<span class="normal">
		<xsl:apply-templates select="RUDECLcat:SigningDetails" />
	</span>
	<xsl:if test="RUDECLcat:IdentityDocV3Details">
		<br/>
		<xsl:apply-templates select="RUDECLcat:IdentityDocV3Details" />
	</xsl:if>
	<xsl:if test="RUDECLcat:PowerOfAttorneyDetails">
		<br/>
		<span class="italic">Документ, удостоверяющий полномочия</span>
		<span class="normal">: </span>
		<br/>
		<xsl:apply-templates select="RUDECLcat:PowerOfAttorneyDetails" />
	</xsl:if>
</xsl:template-->

<!-- Шаблон для типа RUScat_ru:SigningDetailsType строка -->
<xsl:template match="tmpa:SigningDetails">
	<span class="normal">
		<xsl:value-of select="cat_ru:PersonSurname"/> 
	</span>
	<span class="normal">&#160;</span>
	<span class="normal">
		<xsl:value-of select="cat_ru:PersonName"/>
	</span>
	<xsl:if test="cat_ru:PersonMiddleName">
		<span class="normal">&#160;</span>
		<span class="normal">
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</span>
	</xsl:if>
	<xsl:if test="cat_ru:PersonPost">
		<span class="normal">, </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:PersonPost"/>
		</span>
	</xsl:if>
	<br/>
	<xsl:if test="RUScat_ru:SigningDate">
		<span class="normal">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:SigningDate" />
			</xsl:call-template>
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:CommunicationDetails">
		<span class="normal">
			<xsl:for-each select="RUScat_ru:CommunicationDetails">
				<xsl:call-template name="CommunicationDetails"/>
			</xsl:for-each>
		</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:ContactType строка -->
<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
	<br/>
	<xsl:if test="cat_ru:Phone">
		<span class="normal">Тел: </span>
		<span class="normal">
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<span class="normal">, </span>
			</xsl:for-each>
		</span>
	</xsl:if>
	<xsl:if test="cat_ru:Fax">
		<span class="normal">Факс: </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:Fax"/>
			<span class="normal">, </span>
		</span>
	</xsl:if>
	<xsl:if test="cat_ru:Telex">
		<span class="normal">Телекс: </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:Telex"/>
			<span class="normal">, </span>
		</span>
	</xsl:if>
	<xsl:if test="cat_ru:E_mail">
		<span class="normal">Email: </span>
		<span class="normal">
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<span class="normal">, </span>
			</xsl:for-each>
		</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:RUAddressType -->
<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails">
	<xsl:if test="RUScat_ru:AddressKindCode">
		<span class="italic"> (код вида адреса</span>
		<span class="normal">: </span> 
		<span class="normal"><xsl:value-of select="RUScat_ru:AddressKindCode" /></span> 
		<span class="normal">) </span>
	</xsl:if>
	<span class="normal">: </span> 
	<xsl:if test="RUScat_ru:PostalCode">
		<span class="normal"><xsl:value-of select="RUScat_ru:PostalCode" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:CountryCode">
		<span class="normal"><xsl:value-of select="RUScat_ru:CountryCode" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:CounryName">
		<span class="normal"><xsl:value-of select="RUScat_ru:CounryName" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:Region">
		<span class="normal"><xsl:value-of select="RUScat_ru:Region" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:District">
		<span class="normal"><xsl:value-of select="RUScat_ru:District" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:Town">
		<span class="normal"><xsl:value-of select="RUScat_ru:Town" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:City">
		<span class="normal"><xsl:value-of select="RUScat_ru:City" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:StreetHouse">
		<span class="normal"><xsl:value-of select="RUScat_ru:StreetHouse" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:House">
		<span class="normal"><xsl:value-of select="RUScat_ru:House" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:Room">
		<span class="normal"><xsl:value-of select="RUScat_ru:Room" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:AddressText">
		<span class="normal"><xsl:value-of select="RUScat_ru:AddressText" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:OKTMO">
		<span class="normal">ОКТМО </span>
		<span class="normal"><xsl:value-of select="RUScat_ru:OKTMO" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:OKATO">
		<span class="normal">OKАTO </span>
		<span class="normal"><xsl:value-of select="RUScat_ru:OKATO" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:KLADR">
		<span class="normal">КЛАДР </span>
		<span class="normal"><xsl:value-of select="RUScat_ru:KLADR" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:AOGUID">
		<span class="normal">Глобальный идентификатор адресного объекта по ФИАС </span>
		<span class="normal"><xsl:value-of select="RUScat_ru:AOGUID" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:TerritoryCode">
		<span class="normal">Код единицы административно-территориального деления </span>
		<span class="normal"><xsl:value-of select="RUScat_ru:TerritoryCode" /></span> 
		<span class="normal">, </span>
	</xsl:if>
	<xsl:if test="RUScat_ru:PostOfficeBoxId">
		<span class="normal">а/я </span>
		<span class="normal"><xsl:value-of select="RUScat_ru:PostOfficeBoxId" /></span> 
		<span class="normal">, </span>
	</xsl:if>
</xsl:template>


<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
	<br/>
	<span class="italic">Код ОПФ: </span>
	<xsl:value-of select="RUScat_ru:UnifiedCode" />
	<xsl:if test="RUScat_ru:CodeListId">
		<span class="normal"> (</span>
		<span class="italic"> по справ. </span>
		<xsl:value-of select="RUScat_ru:CodeListId" />
		<span class="normal">)</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
<xsl:template match="RUScat_ru:IdentityCard">
	<br/>
	<span class="italic">Документ, удостоверяющий полномочия</span>
	<span class="normal">: </span>
	<br/>
	<xsl:if test="cat_ru:IdentityCardCode">
		<span class="normal">
			<xsl:value-of select="cat_ru:IdentityCardCode" />
		</span>
		<span class="normal">&#160;</span>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCardName">
		<span class="normal">
			<xsl:value-of select="cat_ru:IdentityCardName" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:FullIdentityCardName">
		<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
			<span class="normal"> (</span>
		</xsl:if>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:FullIdentityCardName" />
		</span>
		<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
			<span class="normal">)</span>
		</xsl:if>
	</xsl:if>
		
	<xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
		<br/>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCardSeries">
		<span class="normal">серия</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:IdentityCardSeries" />
		</span>
		<xsl:if test="string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">&#160;</span>
		</xsl:if>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCardNumber">
		<span class="normal">№</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="cat_ru:IdentityCardNumber" />
		</span>
	</xsl:if>
	<xsl:if test="string-length(cat_ru:IdentityCardDate) &gt; 0 or string-length(cat_ru:OrganizationName) &gt; 0">
		<!--xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
		<br/>
		<span class="italic">выдан</span>
		<span class="normal">: </span>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCardDate">
		<span class="normal">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate" />
			</xsl:call-template>
		</span>
	</xsl:if>
	<xsl:if test="cat_ru:OrganizationName">	
		<span class="normal">&#160;</span>
		<span class="normal">
			<xsl:value-of select="cat_ru:OrganizationName" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:IssuerCode">	
		<br/>
		<span class="italic">код подразделения</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:IssuerCode" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:AuthorityId">	
		<br/>
		<span class="italic">идентификатор организации</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:AuthorityId" />
		</span>
	</xsl:if>
	<xsl:if test="RUScat_ru:CountryCode">	
		<br/>
		<span class="italic">страна в уд.личности</span>
		<span class="normal">: </span>
		<span class="normal">
			<xsl:value-of select="RUScat_ru:CountryCode" />
		</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа RUScat_ru:UITN40Type -->
<xsl:template match="RUScat_ru:UITN">
	<br/>
	<span class="italic">УИТН</span>
	<span class="normal">: </span>
	<xsl:value-of select="RUScat_ru:UITNCode" />
	<xsl:if test="RUScat_ru:CountryCode">
		<span class="normal">( </span>
		<span class="italic">страна </span>
		<xsl:value-of select="RUScat_ru:CountryCode" />
		<span class="normal">)</span>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа tmpa:BrAEODeclarantDetailsType -->
<xsl:template match="tmpa:Declarant">
	<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:RKOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:RBOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:RAOrganizationFeatures" />
	<xsl:apply-templates select="cat_ru:KGOrganizationFeatures" />

	<xsl:if test="cat_ru:OrganizationName">
		<br/>
		<xsl:value-of select="cat_ru:OrganizationName" />
	</xsl:if>
	<xsl:if test="cat_ru:ShortName">
		<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
			<span class="normal"> (</span>
		</xsl:if>
		<xsl:value-of select="cat_ru:ShortName" />
		<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
			<span class="normal">)</span>
		</xsl:if>
	</xsl:if>
	<br/>

	<xsl:if test="RUScat_ru:CountryA2Code">
		<br/>
		<span class="italic">Код страны</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:CountryA2Code" />
	</xsl:if>

	<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
		<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode" />
	</xsl:if>

	<xsl:if test="RUScat_ru:BusinessEntityTypeName">
		<br/>
		<span class="italic">ОПФ</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:BusinessEntityTypeName" />
	</xsl:if>
	
	<xsl:if test="RUScat_ru:UITN">
		<xsl:apply-templates select="RUScat_ru:UITN" />
	</xsl:if>

	<xsl:if test="RUScat_ru:PersonId">
		<br/>
		<span class="italic">УИ ФЛ</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:PersonId" />
	</xsl:if>

	<xsl:if test="RUScat_ru:IdentityCard">
		<xsl:apply-templates select="RUScat_ru:IdentityCard" />
	</xsl:if>

	<xsl:if test="RUScat_ru:SubjectAddressDetails">
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
			<xsl:call-template name="Address"/>
		</xsl:for-each>
	</xsl:if>

	<xsl:if test="tmpa:RegisterDocumentIdDetails">
		<xsl:apply-templates select="tmpa:RegisterDocumentIdDetails" />
	</xsl:if>
	
</xsl:template>

<!-- Шаблон для типа RUDECLcat:RegisterDocumentIdDetailsType -->
<xsl:template match="tmpa:RegisterDocumentIdDetails">
	<br/>
	<span class="italic">св-во о включ.лица в реестр УЭО: </span>
	<xsl:if test="RUDECLcat:CountryA2Code">
		<span class="italic">страна: </span>
		<xsl:value-of select="RUDECLcat:CountryA2Code" />
		<span class="normal">, </span>
	</xsl:if>
	<span class="italic">рег №: </span>
	<xsl:value-of select="RUDECLcat:RegistrationNumberId" />
	<xsl:if test="RUDECLcat:ReregistrationCode">
		<span class="normal">, </span>
		<span class="italic">признак перерегистрации: </span>
		<xsl:value-of select="RUDECLcat:ReregistrationCode" />
	</xsl:if>
	<xsl:if test="RUDECLcat:AEORegistryKindCode">
		<span class="normal">, </span>
		<span class="italic">код типа св-ва УЭО: </span>
		<xsl:value-of select="RUDECLcat:AEORegistryKindCode" />
	</xsl:if>
</xsl:template>


<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
<xsl:template match="cat_ru:RFOrganizationFeatures">
	<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
		<br/>
		<span class="italic">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="italic">ИНН</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
				<span class="normal">/</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
				<span class="italic">КПП</span>
			</xsl:if>
			<span class="normal">: </span>
		</span>	
	</xsl:if>
	<xsl:if test="cat_ru:INN">
		<xsl:value-of select="cat_ru:INN" />
	</xsl:if>
	<xsl:if test="cat_ru:KPP">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0">
			<span class="normal"> / </span>
		</xsl:if>
		<xsl:value-of select="cat_ru:KPP" />
	</xsl:if>
	<xsl:if test="cat_ru:OGRN">
		<br/>
		<span class="italic">ОГРН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:OGRN" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:RKOrganizationFeatures -->
<xsl:template match="cat_ru:RKOrganizationFeatures">
	<xsl:if test="cat_ru:BIN">
		<br/>
		<span class="italic">БИН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:BIN" />
	</xsl:if>
	<xsl:if test="cat_ru:IIN">
		<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
			<span class="normal"> / </span>
		</xsl:if>
		<xsl:if test="string-length(cat_ru:BIN) = 0">
			<br/>
		</xsl:if>
		<span class="italic">ИИН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:IIN" />
	</xsl:if>
	<xsl:if test="cat_ru:ITN">
		<br/>
		<span class="italic">ИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:CategoryCode" />
		<span class="normal"> / </span>
		<xsl:value-of select="cat_ru:KATOCode" />
		<xsl:if test="cat_ru:RNN">
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:RNN" />
		</xsl:if>
		<xsl:if test="cat_ru:ITNReserv">
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:ITNReserv" />
		</xsl:if>
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:RBOrganizationFeatures -->
<xsl:template match="cat_ru:RBOrganizationFeatures">
	<xsl:if test="cat_ru:UNP">
		<br/>
		<span class="italic">УНП</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:UNP" />
	</xsl:if>
	<xsl:if test="cat_ru:RBIdentificationNumber">
		<br/>
		<span class="italic">ИНФЛ</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:RBIdentificationNumber" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:RAOrganizationFeatures -->
<xsl:template match="cat_ru:RAOrganizationFeatures">
	<xsl:if test="cat_ru:UNN">
		<br/>
		<span class="italic">УНН</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:UNN" />
	</xsl:if>
	<xsl:if test="cat_ru:SocialServiceNumber">
		<br/>
		<span class="italic">НЗОУ</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:SocialServiceNumber" />
	</xsl:if>
	<xsl:if test="cat_ru:SocialServiceCertificate">
		<br/>
		<span class="italic">№ справки об отсутв. НЗОУ</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:SocialServiceCertificate" />
	</xsl:if>
</xsl:template>

<!-- Шаблон для типа cat_ru:KGOrganizationFeatures -->
<xsl:template match="cat_ru:KGOrganizationFeatures">
	<xsl:if test="cat_ru:KGINN">
		<br/>
		<span class="italic">ИНН(ПИН)</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:KGINN" />
	</xsl:if>
	<xsl:if test="cat_ru:KGOKPO">
		<br/>
		<span class="italic">ОКПО</span>
		<span class="normal">: </span>
		<xsl:value-of select="cat_ru:KGOKPO" />
	</xsl:if>
</xsl:template>

<xsl:template name="russian_date">
	<xsl:param name="dateIn" />
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<span class="normal">
				<xsl:value-of select="substring($dateIn,9,2)" />
			</span>
			<span class="normal">.</span>
			<span class="normal">
				<xsl:value-of select="substring($dateIn,6,2)" />
			</span>
			<span class="normal">.</span>
			<span class="normal">
				<xsl:value-of select="substring($dateIn,1,4)" />
			</span>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="Address">
	<br/>
	<span class="italic">Адрес</span>
	<span class="normal">: </span>
	<xsl:variable name="temp">
		<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
	</xsl:variable>
	<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
</xsl:template>

<xsl:template name="CommunicationDetails">
	<br/>
	<span class="italic">Контактные данные</span>
	<span class="normal">: </span>
	<xsl:variable name="temp">
		<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
	</xsl:variable>
	<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
</xsl:template>

<xsl:template name="RUDECLcat:ProductInstanceId"> 
	<xsl:for-each select="RUDECLcat:ProductInstanceId">
		<xsl:value-of select="." />
		<xsl:if test="not(position()=last())">, </xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template mode="gtd_date" match="*">
	<xsl:param name="dateIn" select="."/>
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)"/>
			<xsl:value-of select="substring($dateIn,6,2)"/>
			<xsl:value-of select="substring($dateIn,3,2)"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>