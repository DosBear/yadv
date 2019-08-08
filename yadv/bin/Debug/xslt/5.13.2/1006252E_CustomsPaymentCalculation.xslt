<?xml version="1.0" encoding="utf-8"?>
<!-- На основании формы в Решении Коллегии ЕЭК от 07.11.2017 № 137 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cpc="urn:customs.ru:Information:CustomsDocuments:CustomsPaymentCalculation:5.13.2" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.13.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа CustomsPaymentCalculationType -->
	<xsl:template match="cpc:CustomsPaymentCalculation">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					/*font-family: Arial;*/
					font-size: 11pt;
					}

					div
					{
					/*white-space: nowrap;*/
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
					margin: 0;
					font-size: 11pt;
					}

					/*table.border tr td
					{
					border: 1px solid gray;
					}*/

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
					/*td.bordered
					{
					border: solid 1px windowtext;
					}*/

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}

					.bordered td{
						border-collapse: collapse;
						border: 1px solid black;
					}
					
				</style>
			</head>
			<body>
				<div class="page">
					<h3 align="center">РАСЧЕТ<br/>таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</h3>
					<table class="bordered">
					
						<tr>
							<td rowspan="5" style="width:40%;">
								ОСНОВНОЙ ЛИСТ
							</td>
							<td colspan="2" style="width:30%;">
								1. РТП<br/>
								<xsl:apply-templates mode="DTNumber" select="cpc:CPCID"/>
								<xsl:if test="cpc:CPCID/cpc:Code">
									<xsl:text>/</xsl:text>
									<xsl:value-of select="cpc:CPCID/cpc:Code"/>
								</xsl:if>
							</td>
							<td rowspan="4" style="width:30%">
								<xsl:value-of select="cpc:EECEDocHeaderAddInfo/RUScat_ru:EDocCode"/>
								<br/>
								<xsl:text>создан</xsl:text>
								<br/>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="cpc:EECEDocHeaderAddInfo/RUScat_ru:EDocDateTime"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:value-of select="cpc:DeclarationKindCode"/>
							</td>
							<td>
								<xsl:value-of select="cpc:EDocIndicatorCode"/>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<xsl:text>2. Количество листов</xsl:text>
							</td>
						</tr>
						<tr>
							<td>
								1
							</td>
							<td>
								<xsl:value-of select="cpc:PageQuantity"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" valign="top">
								<xsl:text>3. Всего товаров</xsl:text>
								<br/><br/>
								<xsl:value-of select="cpc:GoodsQuantity"/>
							</td>
							<td valign="top">
								<xsl:text>4. Случай, срок уплаты, день применения ставок</xsl:text>
								<br/>
								<xsl:value-of select="cpc:PaymentCalculationEventDetails/cpc:PaymentCalculationEventCode"/>
								<xsl:text>/</xsl:text>
								<xsl:call-template name="dt_date">
									<xsl:with-param name="dateIn" select="cpc:PaymentCalculationEventDetails/cpc:EndDate"/>
								</xsl:call-template>
								<xsl:text>/</xsl:text>
								<xsl:call-template name="dt_date">
									<xsl:with-param name="dateIn" select="cpc:PaymentCalculationEventDetails/cpc:DutyTaxFeeRateDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td rowspan="2" style="width: 40%;" valign="top">5. Плательщик<br/>
								<xsl:apply-templates mode="person" select="cpc:PayerDetails"/>
							</td>
							<td colspan="3" valign="top">6. Лица, несущие солидарную (субсидиарную) обязанность<br/>
								<xsl:for-each select="cpc:JointlyLiablePersonDetails">
									<xsl:apply-templates mode="person" select="."/>
									<xsl:if test="position()!=last()">
										<br/>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr valign="top">
							<td colspan="2" style="width:30%;">7. Страна происхождения<br/>
								<xsl:for-each select="cpc:GoodsShipmentDetails/cpc:OriginCountryDetails">
									<xsl:choose>
										<xsl:when test="RUScat_ru:CountryCode='EU'">Евросоюз</xsl:when>
										<xsl:when test="RUScat_ru:CountryCode='00'">Неизвестна</xsl:when>
										<xsl:when test="RUScat_ru:CountryCode='99'">Разные</xsl:when>
										<xsl:when test="RUScat_ru:CountryName"><xsl:value-of select="RUScat_ru:CountryName"/></xsl:when>
										<xsl:otherwise><xsl:value-of select="RUScat_ru:CountryCode"/></xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</td>
							<td style="width:30%">8. Общая таможенная стоимость<br/>
								<!--xsl:value-of select="cpc:GoodsShipmentDetails/cpc:CustomsValueAmount"/-->
								<xsl:value-of select="format-number(cpc:GoodsShipmentDetails/cpc:CustomsValueAmount,'#.00')"/>
							</td>
						</tr>
					</table>
					<xsl:apply-templates mode="cell9to18" select="cpc:GoodsShipmentDetails/cpc:GoodsItemDetails[1]"/>
					<xsl:variable name="count1" select="count(cpc:GoodsShipmentDetails/cpc:GoodsItemDetails[1]/cpc:GoodsItemPaymentDetails) + 2"/>
					<table class="bordered">
						<tr valign="top">
							<td colspan="4" style="width:60%">19. Исчисление платежей</td>
							<td rowspan="{$count1}" style="width:40%">20. Подробности уплаты (взыскания)<br/>
								<xsl:for-each select="cpc:GoodsShipmentDetails/cpc:FactPaymentDetails">
									<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
									<xsl:text>-</xsl:text>
									<xsl:value-of select="catESAD_cu:PaymentAmount"/>
									<xsl:text>-</xsl:text>
									<xsl:value-of select="catESAD_cu:PaymentCurrencyCode"/>
									<xsl:text>-</xsl:text>
									<xsl:value-of select="cpc:PaymentDocument/cat_ru:PrDocumentNumber"/>
									<xsl:text>-</xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cpc:PaymentDocument/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
									<xsl:text>-</xsl:text>
									<xsl:value-of select="cpc:PaymentWayCode"/>
									<xsl:if test="position()!=last()"><br/></xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr valign="top" align="center">
							<td>Вид</td>
							<td>База для исчисления</td>
							<td>Ставка</td>
							<td>Сумма</td>
						</tr>
						<xsl:apply-templates mode="cell19and21" select="cpc:GoodsShipmentDetails/cpc:GoodsItemDetails[1]/cpc:GoodsItemPaymentDetails"/>
						<xsl:variable name="count2" select="count(cpc:GoodsShipmentDetails/cpc:PaymentAmountDetails) + 2"/>
						<tr valign="top">
							<td colspan="4" style="width:60%">21. Общая сумма, подлежащая уплате (взысканию) </td>
							<td rowspan="{$count2}" style="width:40%">22. Ф.И.О. и должность
								<br/>
								<xsl:apply-templates select="cpc:CustomsPersonSignature"/>
							</td>
						</tr>
						<tr valign="top" align="center">
							<td>Вид</td>
							<td>База для исчисления</td>
							<td>Ставка</td>
							<td>Сумма</td>
						</tr>
						<xsl:apply-templates mode="cell19and21" select="cpc:GoodsShipmentDetails/cpc:PaymentAmountDetails"/>
					</table>
				</div>
				<xsl:for-each select="cpc:GoodsShipmentDetails/cpc:GoodsItemDetails[(position() + 1) mod 3 = 0]">
					<div class="page">
						<table class="bordered">
								<tr>
									<td rowspan="4" style="width:40%;">
										ДОПОЛНИТЕЛЬНЫЙ ЛИСТ
									</td>
									<td colspan="2" style="width:30%;">
										1. РТП<br/>
										<xsl:apply-templates mode="DTNumber" select="../../cpc:CPCID"/>
										<xsl:if test="../../cpc:CPCID/cpc:Code">
											<xsl:text>/</xsl:text>
											<xsl:value-of select="../../cpc:CPCID/cpc:Code"/>
										</xsl:if>
									</td>
									<td rowspan="4" style="width:30%">
										<xsl:value-of select="../../cpc:EECEDocHeaderAddInfo/RUScat_ru:EDocCode"/>
										<br/>
										<xsl:text>создан</xsl:text>
										<br/>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="../../cpc:EECEDocHeaderAddInfo/RUScat_ru:EDocDateTime"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="../../cpc:DeclarationKindCode"/>
									</td>
									<td>
										<xsl:value-of select="../../cpc:EDocIndicatorCode"/>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<xsl:text>2. Количество листов</xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="position() + 1 mod 3"/>
									</td>
									<td>
										<xsl:value-of select="../../cpc:PageQuantity"/>
									</td>
								</tr>
						</table>
						<xsl:apply-templates mode="cell9to18" select="."/>
						<xsl:apply-templates mode="cell9to18" select="following-sibling::cpc:GoodsItemDetails[1]"/>
						<xsl:apply-templates mode="cell9to18" select="following-sibling::cpc:GoodsItemDetails[2]"/>
						<xsl:variable name="count3" select="count(cpc:GoodsItemPaymentDetails) + count(following-sibling::cpc:GoodsItemDetails[1]/cpc:GoodsItemPaymentDetails) + count(following-sibling::cpc:GoodsItemDetails[2]/cpc:GoodsItemPaymentDetails)"/>
						<xsl:variable name="count4">
							<xsl:choose>
								<xsl:when test="following-sibling::cpc:GoodsItemDetails[2]"><xsl:value-of select="3"/></xsl:when>
								<xsl:when test="following-sibling::cpc:GoodsItemDetails[1]"><xsl:value-of select="2"/></xsl:when>
								<xsl:otherwise><xsl:value-of select="1"/></xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<table class="bordered">
							<tr>
								<td colspan="4" style="width:60%">19. Исчисление платежей</td>
								<td style="width:40%;border-bottom:0" valign="top">22. Ф.И.О. и должность</td>
							</tr>
							<tr valign="top" align="center">
								<td>Вид</td>
								<td>База для исчисления</td>
								<td>Ставка</td>
								<td>Сумма</td>
								<td rowspan="{$count3 + $count4}" style="width:40%;border-top:0" valign="top" align="left">
									<xsl:apply-templates select="../../cpc:CustomsPersonSignature"/>
								</td>
							</tr>
							<xsl:apply-templates mode="cell19and21" select="cpc:GoodsItemPaymentDetails"/>
							<xsl:for-each select="following-sibling::cpc:GoodsItemDetails[1]|following-sibling::cpc:GoodsItemDetails[2]">
								<tr valign="top" align="center">
									<td style="border-top:1.5pt solid black">Вид</td>
									<td style="border-top:1.5pt solid black">База для исчисления</td>
									<td style="border-top:1.5pt solid black">Ставка</td>
									<td style="border-top:1.5pt solid black">Сумма</td>
								</tr>
								<xsl:apply-templates mode="cell19and21" select="cpc:GoodsItemPaymentDetails"/>
							</xsl:for-each>
						</table>
					</div>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="cpc:CustomsPersonSignature">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring(cat_ru:PersonName,1)"/><xsl:text>.</xsl:text>
		<xsl:if test="cat_ru:PersonMiddleName"><xsl:value-of select="substring(cat_ru:PersonMiddleName,1)"/>.</xsl:if>
		&#160;<xsl:value-of select="cat_ru:PersonPost"/>
	</xsl:template>
	
	<xsl:template mode="cell19and21" match="cpc:GoodsItemPaymentDetails|cpc:PaymentAmountDetails">
		<tr valign="top">
			<td>
				<xsl:value-of select="cpc:PaymentModeCode"/>
			</td>
			<td>
				<xsl:value-of select="cpc:TaxBase"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="cpc:TaxBaseCurrencyCode"/>
			</td>
			<td>
				<xsl:apply-templates mode="rate1" select="."/>
			</td>
			<td>
				<xsl:value-of select="cpc:PaymentAmount"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="cpc:PaymentCurrencyCode"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="rate1">
		<xsl:variable name="rateval">
			<xsl:choose>
				<xsl:when test="cpc:Rate or cpc:Rate!=''">
					<xsl:value-of select="cpc:Rate"/>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="format-number($rateval,'0.######')"/>
		<xsl:choose>
			<xsl:when test="cpc:RateTypeCode='%'">%</xsl:when>
			<xsl:when test="cpc:RateTypeCode!='*' or not(cpc:RateTypeCode)">
				<xsl:choose>
					<xsl:when test="cpc:RateCurrencyCode">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="cpc:RateCurrencyCode"/>
						<xsl:if test="cpc:RateTNVEDQualifierCode">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="cpc:WeightingFactor"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="cpc:RateTNVEDQualifierCode"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>%</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template mode="cell9to18" match="cpc:GoodsItemDetails">
		<table class="bordered">
			<tr>
				<td style="width:50%">9. Описание товара</td>
				<td colspan="2" style="width:10%">10. Товар №</td>
				<td colspan="4" style="width:20%;border-bottom:0">11. Код товара</td>
				<td style="width:20%;border-bottom:0">12. Вес брутто (кг)</td>
			</tr>
			<tr valign="top">
				<td rowspan="5" style="width:50%">
					<xsl:apply-templates mode="itemDescription" select="."/>
				</td>
				<td rowspan="5" style="width:5%">
					<xsl:value-of select="RUScat_ru:GoodsNumeric"/>
				</td>
				<td rowspan="5" style="width:5%">
					<xsl:if test="cpc:GoodFeatures">МПО</xsl:if>
				</td>
				<td colspan="4" style="width:20%;border-top:0">
					<xsl:value-of select="RUScat_ru:GoodsTNVEDCode"/>
				</td>
				<td style="width:20%;border-top:0">
					<xsl:value-of select="RUScat_ru:UnifiedGrossMassMeasure"/>
				</td>
			</tr>
			<tr valign="top" style="height: 1px;">
				<td colspan="4">13. Код страны происхождения</td>
				<td rowspan="2">
					14.Вес нетто (кг)<br/>
					<xsl:value-of select="RUScat_ru:UnifiedNetMassMeasure"/>
				</td>
			</tr>
			<tr valign="top" style="height: 1px;">
				<td style="width:2%;" align="center">a</td>
				<td style="width:8%;">
					<xsl:value-of select="cpc:GoodsOriginCountryDetails/RUScat_ru:CountryCode"/>
				</td>
				<td style="width:2%;" align="center">b</td>
				<td style="width:8%;"/>
			</tr>
			<tr valign="top" style="height: 1px;">
				<td colspan="5">
					15. Предшествующий документ<br/>
					<xsl:for-each select="cpc:PrecedingDocDetails">
						<xsl:value-of select="position()"/>
						<xsl:text> / </xsl:text>
						<xsl:value-of select="cpc:PrecedingDocumentModeCode"/>
						<xsl:text> / </xsl:text>
						<xsl:choose>
							<xsl:when test="cpc:CustomsDocIdDetails">
								<xsl:apply-templates mode="DTNumber" select="cpc:CustomsDocIdDetails"/>
								<xsl:if test="cpc:CustomsDocIdDetails/cpc:Code">
									<xsl:text>/</xsl:text>
									<xsl:value-of select="cpc:CustomsDocIdDetails/cpc:Code"/>
								</xsl:if>							
							</xsl:when>
							<xsl:when test="cpc:DTMDocDetails">
								<xsl:apply-templates mode="DTNumber" select="cpc:DTMDocDetails"/>
								<xsl:if test="cpc:CustomsDocIdDetails/cpc:Code">
									<xsl:text> код ТС: </xsl:text>
									<xsl:value-of select="DTMDocDetails/cpc:TransportModeCode"/>
								</xsl:if>						
							</xsl:when>
							<xsl:when test="cpc:PIDocumentNumber"><xsl:value-of select="cpc:PIDocumentNumber"/></xsl:when>
							<xsl:when test="cpc:TIRIdDetails">
								серия <xsl:value-of select="cpc:TIRIdDetails/cpc:TIRSeries"/> № <xsl:value-of select="cpc:TIRIdDetails/cpc:TIRID"/>
							</xsl:when>
							<xsl:when test="cpc:OtherPrDocumentNumber"><xsl:value-of select="cpc:OtherPrDocumentNumber"/></xsl:when>
							<xsl:otherwise> </xsl:otherwise>
						</xsl:choose>
						<xsl:text> / </xsl:text>
						<xsl:value-of select="cpc:PrecedingDocumentGoodsNumeric"/>
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					16. Дополнительные единицы измерения<br/>
					<xsl:for-each select="cpc:AddGoodsMeasureDetails">
						<xsl:apply-templates mode="goodsQuantity" select="."/><br/>
					</xsl:for-each>
				</td>
				<td valign="top">
					17. Таможенная стоимость<br/>
					<xsl:value-of select="cpc:CustomsValueAmount"/>
				</td>
			</tr>
			<tr>
				<td colspan="8">
					18. Дополнительная информация, представленные документы<br/>
					<xsl:for-each select="cpc:PresentedDocDetails">
						<!--xsl:value-of select="position()"/>
						<xsl:text>) </xsl:text-->
						<xsl:value-of select="cpc:DocKindCode"/>
						<xsl:text>/</xsl:text>
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
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template mode="itemDescription" match="*">
		1) <xsl:apply-templates select="RUScat_ru:GoodsDescription"/>
		<br/>
		2) <xsl:for-each select="RUScat_ru:GoodsMeasureDetails">
			<xsl:apply-templates mode="goodsQuantity" select="."/>
			<xsl:if test="position()!=last()">; </xsl:if>
		</xsl:for-each>
		<br/>
		3) <xsl:apply-templates select="cpc:PipelineGoodsDetails/cpc:PlaceName"/>
		<br/>
		4) 
		<xsl:for-each select="cpc:ESADExcise">
			серия: <xsl:value-of select="catESAD_cu:ExciseSerieses"/>&#160;
			номера: <xsl:value-of select="catESAD_cu:ExciseFirstNumber"/>-<xsl:value-of select="catESAD_cu:ExciseLastNumber"/>&#160;
			кол-во: <xsl:value-of select="catESAD_cu:ExciseQuantity"/>
			<xsl:if test="position()!=last()"><br/>&#160;&#160;&#160;</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template mode="goodsQuantity" match="*">
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
	<!-- Шаблон для ЮЛ и ФЛ -->
	<xsl:template mode="person" match="*">
		<xsl:choose>
			<xsl:when test="cpc:InformationUnknownIndicator='true' or cpc:InformationUnknownIndicator=1">Не установлено</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="cat_ru:ShortName"/>
				<xsl:if test="not(cat_ru:ShortName) and cat_ru:OrganizationName">
					<xsl:value-of select="cat_ru:OrganizationName"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails">
					<br/>
					<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="cat_ru:RFOrganizationFeatures">
						<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
							<br/>ИНН: <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
							<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">/<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/></xsl:if>
						</xsl:if>
						<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
							<br/>ОГРН/ОГРНИП: <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
						</xsl:if>
					</xsl:when>
					<xsl:when test="cat_ru:RKOrganizationFeatures">
						<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:BIN"><br/>БИН: <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:BIN"/></xsl:if>
						<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:IIN"><br/>ИИН: <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:IIN"/></xsl:if>
						<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
							<br/>ИТН: <xsl:for-each select="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
								<xsl:value-of select="cat_ru:CategoryCode"/>-<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
							</xsl:for-each>
						</xsl:if>
					</xsl:when>
					<xsl:when test="cat_ru:RBOrganizationFeatures">
						<xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:UNP">
							<br/>УНП: <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
						</xsl:if>
						<xsl:if test="RUScat_ru:UITN">
							<br/>ИТН: <xsl:value-of select="RUScat_ru:UITN/RUScat_ru:UITNCode"/>
							<xsl:if test="RUScat_ru:UITN/RUScat_ru:CountryCode">/<xsl:value-of select="RUScat_ru:UITN/RUScat_ru:CountryCode"/></xsl:if>
						</xsl:if>
					</xsl:when>
					<xsl:when test="cat_ru:RAOrganizationFeatures">
						<xsl:if test="cat_ru:RAOrganizationFeatures/cat_ru:UNN">
							<br/>УНН: <xsl:value-of select="cat_ru:RAOrganizationFeatures/cat_ru:UNN"/>
						</xsl:if>
						<xsl:if test="cat_ru:RAOrganizationFeatures/cat_ru:SocialServiceNumber">
							<br/>НЗОУ: <xsl:value-of select="cat_ru:RAOrganizationFeatures/cat_ru:SocialServiceNumber"/>
						</xsl:if>
						<xsl:if test="cat_ru:RAOrganizationFeatures/cat_ru:SocialServiceCertificate">
							<br/>Справка об отсутствии НЗОУ: <xsl:value-of select="cat_ru:RAOrganizationFeatures/cat_ru:SocialServiceCertificate"/>
						</xsl:if>
					</xsl:when>
					<xsl:when test="cat_ru:KGOrganizationFeatures">
						<xsl:if test="cat_ru:KGOrganizationFeatures/cat_ru:KGINN">
							<br/>ИНН/ПИН: <xsl:value-of select="cat_ru:KGOrganizationFeatures/cat_ru:KGINN"/>
						</xsl:if>
						<xsl:if test="cat_ru:KGOrganizationFeatures/cat_ru:KGOKPO">
							<br/>ОКПО: <xsl:value-of select="cat_ru:KGOrganizationFeatures/cat_ru:KGOKPO"/>
						</xsl:if>
					</xsl:when>
					<xsl:when test="RUScat_ru:UITN"><br/>
						<br/>ИТН: <xsl:value-of select="RUScat_ru:UITN/RUScat_ru:UITNCode"/>
						<xsl:if test="RUScat_ru:UITN/RUScat_ru:CountryCode">/<xsl:value-of select="RUScat_ru:UITN/RUScat_ru:CountryCode"/></xsl:if>
					</xsl:when>
				</xsl:choose>
				<xsl:if test="RUScat_ru:IdentityCard"><br/><xsl:apply-templates select="RUScat_ru:IdentityCard"/></xsl:if>
				<xsl:if test="RUScat_ru:CommunicationDetails"><br/><xsl:apply-templates select="RUScat_ru:CommunicationDetails"/></xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:value-of select="RUScat_ru:CounryName"/>
			<xsl:if test="not(RUScat_ru:CounryName)"><xsl:value-of select="RUScat_ru:CountryCode"/></xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town or RUScat_ru:City">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
			<xsl:if test="not(RUScat_ru:Town)"><xsl:value-of select="RUScat_ru:City"/></xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText and not(RUScat_ru:Region or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room)">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:value-of select="RUScat_ru:CountryCode"/>
		<xsl:if test="cat_ru:IdentityCardName">
			<xsl:if test="RUScat_ru:CountryCode">, </xsl:if>
			<xsl:value-of select="cat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
			<xsl:if test="RUScat_ru:CountryCode or cat_ru:IdentityCardName">, </xsl:if>
			<xsl:if test="cat_ru:IdentityCardSeries">серия <xsl:value-of select="cat_ru:IdentityCardSeries"/>&#160;</xsl:if>
			<xsl:if test="cat_ru:IdentityCardNumber">№ <xsl:value-of select="cat_ru:IdentityCardNumber"/></xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<xsl:if test="RUScat_ru:CountryCode or cat_ru:IdentityCardName or cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">, </xsl:if>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
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
			<xsl:text>эл.почта: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН </xsl:text>
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
	
	<xsl:template mode="DTNumber" match="*">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="dt_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<xsl:template name="dt_date">
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
	<xsl:template match="cpc:PaymentCurrencyCode | cpc:RateCurrencyCode | cpc:TaxBaseCurrencyCode">
		<xsl:choose>
			<xsl:when test=".='643'">RUB</xsl:when>
			<xsl:when test=".='840'">USD</xsl:when>
			<xsl:when test=".='978'">EUR</xsl:when>
			<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="cpc:RateTNVEDQualifierCode">
		<xsl:choose>
			<xsl:when test=".='006'">МЕТР</xsl:when>
			<xsl:when test=".='055'">КВАДРАТНЫЙ МЕТР</xsl:when>
			<xsl:when test=".='111'">КУБИЧЕСКИЙ САНТИМЕТР</xsl:when>
			<xsl:when test=".='112'">ЛИТР</xsl:when>
			<xsl:when test=".='113'">КУБИЧЕСКИЙ МЕТР</xsl:when>
			<xsl:when test=".='114'">1000 КУБИЧЕСКИХ МЕТРОВ</xsl:when>
			<xsl:when test=".='117'">ТОННУ ПОЛНОЙ МАССЫ</xsl:when>
			<xsl:when test=".='118'">КУБИЧЕСКИЙ МЕТР ПОЛНОГО ОБЪЕМА КУЗОВА</xsl:when>
			<xsl:when test=".='130'">1000 ЛИТРОВ</xsl:when>
			<xsl:when test=".='162'">МЕТРИЧЕСКИЙ КАРАТ</xsl:when>
			<xsl:when test=".='163'">ГРАММ</xsl:when>
			<xsl:when test=".='166'">КИЛОГРАММ</xsl:when>
			<xsl:when test=".='168'">ТОННУ ВЕСА НЕТТО</xsl:when>
			<xsl:when test=".='185'">ГРУЗОПОДЪЕМНОСТЬ В ТОННАХ</xsl:when>
			<xsl:when test=".='214'">КИЛОВАТТ</xsl:when>
			<xsl:when test=".='246'">1000 КИЛОВАТТ В ЧАС</xsl:when>
			<xsl:when test=".='251'">ЛОШАДИНУЮ СИЛУ</xsl:when>
			<xsl:when test=".='305'">КЮРИ</xsl:when>
			<xsl:when test=".='306'">ГРАММ ДЕЛЯЩИХСЯ ИЗОТОПОВ</xsl:when>
			<xsl:when test=".='715'">ПАРУ</xsl:when>
			<xsl:when test=".='796'">ШТУКУ</xsl:when>
			<xsl:when test=".='797'">СТО ШТУК</xsl:when>
			<xsl:when test=".='798'">ТЫСЯЧУ ШТУК</xsl:when>
			<xsl:when test=".='831'">ЛИТР ЧИСТОГО (100%) СПИРТА</xsl:when>
			<xsl:when test=".='841'">КИЛОГРАММ ПЕРОКСИДА ВОДОРОДА</xsl:when>
			<xsl:when test=".='845'">КИЛОГРАММ СУХОГО НА 90% ВЕЩЕСТВА</xsl:when>
			<xsl:when test=".='852'">КИЛОГРАММ ОКСИДА КАЛИЯ</xsl:when>
			<xsl:when test=".='859'">КИЛОГРАММ ГИДРОКСИДА КАЛИЯ</xsl:when>
			<xsl:when test=".='861'">КИЛОГРАММ АЗОТА</xsl:when>
			<xsl:when test=".='863'">КИЛОГРАММ ГИДРОКСИДА НАТРИЯ</xsl:when>
			<xsl:when test=".='865'">КИЛОГРАММ ПЯТИОКСИДА ФОСФОРА</xsl:when>
			<xsl:when test=".='867'">КИЛОГРАММ УРАНА</xsl:when>
			<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
