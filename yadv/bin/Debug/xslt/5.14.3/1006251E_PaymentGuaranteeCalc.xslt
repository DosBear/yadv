<?xml version="1.0" encoding="utf-8"?>
<!-- На основании формы в Решении ЕЭК от 04.09.2017 № 112  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pgc="urn:customs.ru:Information:CustomsDocuments:PaymentGuaranteeCalc:5.14.3" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.14.3" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.14.3" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа PaymentGuaranteeCalcType -->
	<xsl:template match="pgc:PaymentGuaranteeCalc">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
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
					<h3 align="center">Р А С Ч Е Т<br/>
							размера обеспечения исполнения обязанности по уплате таможенных пошлин,<br/>
							налогов, специальных, антидемпинговых, компенсационных пошлин</h3>
					<xsl:call-template name="header1to3">
						<xsl:with-param name="baseOrAdd" select="0"/>
						<xsl:with-param name="cell1" select="pgc:GTDID"/>
						<xsl:with-param name="cell1_2" select="pgc:EDocIndicatorCode"/>
						<xsl:with-param name="cell2" select="'1'"/>
						<xsl:with-param name="cell2_2" select="pgc:PageQuantity"/>
						<xsl:with-param name="cell3" select="pgc:Quantity"/>
					</xsl:call-template>
					<xsl:apply-templates mode="cell4to15" select="pgc:GoodsShipment/pgc:GoodsItemDetails[1]"/>
					<table>
						<tr valign="top">
							<td class="bordered" style="width:50%;border-top:0;">16. Размер обеспечения по всем товарам<br/>
								<xsl:for-each select="pgc:GoodsShipment/pgc:GuaranteeDetails/pgc:GuaranteeAmountDetails">
									<xsl:for-each select="*">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()"><xsl:text>-</xsl:text></xsl:if>
									</xsl:for-each>
									<xsl:if test="position()!=last()"><br/></xsl:if>
								</xsl:for-each>
							</td>
							<td class="bordered" style="width:50%;border-top:0;" rowspan="2">18. Ф.И.О., должность, дата<br/>
								<xsl:apply-templates select="pgc:CustomsPersonSignature"/>
							</td>
						</tr>
						<tr valign="top">
							<td class="bordered">17. Итого размер обеспечения<br/>
								<xsl:for-each select="pgc:GoodsShipment/pgc:GuaranteeDetails/pgc:TotalGuaranteeNAmount">
									<xsl:value-of select="RUScat_ru:Amount"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="RUScat_ru:CurrencyCode"/>
									<xsl:if test="position()!=last()"><br/></xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</table>
				</div>
				<xsl:for-each select="pgc:GoodsShipment/pgc:GoodsItemDetails[(position()+1) mod 3 = 0]">
					<div class="page">
						<xsl:call-template name="header1to3">
							<xsl:with-param name="baseOrAdd" select="1"/>
							<xsl:with-param name="cell1" select="../../pgc:GTDID"/>
							<xsl:with-param name="cell1_2" select="../../pgc:EDocIndicatorCode"/>
							<xsl:with-param name="cell2" select="pgc:PageOrdinal"/>
							<xsl:with-param name="cell2_2" select="../../pgc:PageQuantity"/>
							<xsl:with-param name="cell3" select="../../pgc:Quantity"/>
						</xsl:call-template>
						<xsl:apply-templates mode="cell4to15" select="."/>
						<xsl:apply-templates mode="cell4to15" select="following-sibling::pgc:GoodsItemDetails[1]"/>
						<xsl:apply-templates mode="cell4to15" select="following-sibling::pgc:GoodsItemDetails[2]"/>
						<table>
							<tr valign="top">
								<td class="bordered" style="width:50%;border-top:0;"></td>
								<td class="bordered" style="width:50%;border-top:0;" rowspan="2">18. Ф.И.О., должность, дата<br/>
									<xsl:apply-templates select="../../pgc:CustomsPersonSignature"/>
								</td>
							</tr>
						</table>
					</div>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="pgc:CustomsPersonSignature">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring(cat_ru:PersonName,1)"/>
		<xsl:text>.</xsl:text>
		<xsl:if test="cat_ru:PersonMiddleName"><xsl:value-of select="substring(cat_ru:PersonMiddleName,1)"/>.</xsl:if>
		<xsl:if test="cat_ru:PersonPost or RUScat_ru:LNP or RUScat_ru:CustomsCode">
			<br/><xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:if test="RUScat_ru:LNP"> ЛНП: <xsl:value-of select="RUScat_ru:LNP"/></xsl:if>
			<xsl:if test="RUScat_ru:CustomsCode"> (код ТО: <xsl:value-of select="RUScat_ru:CustomsCode"/>)</xsl:if>
		</xsl:if>
		<xsl:if test="pgc:IssueDate">
			<br/>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="pgc:IssueDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template mode="cell4to15" match="pgc:GoodsItemDetails">
		<table>
			<tr valign="top">
				<td class="bordered" style="width:50%;border-top:0;border-bottom:0;">4. Описание товара</td>
				<td class="bordered" colspan="2" style="width:13%;border-top:0;">5. Товар №</td>
				<td class="bordered" colspan="3" style="width:37%;border-top:0;border-bottom:0;">6. Код товара</td>
			</tr>
			<tr valign="top">
				<td class="bordered" rowspan="3" style="width:50%;border-top:0;">
					<xsl:apply-templates select="RUScat_ru:GoodsDescription"/>
				</td>
				<td class="bordered" style="width:7%">
					<xsl:value-of select="RUScat_ru:GoodsNumeric"/>
				</td>
				<td class="bordered" style="width:6%">
					<xsl:value-of select="pgc:DTConsignmentItemOrdinal"/>
				</td>
				<td class="bordered" colspan="3" style="width:37%;border-top:0;">
					<xsl:value-of select="RUScat_ru:GoodsTNVEDCode"/>
				</td>
			</tr>
			<tr valign="top">
				<td class="bordered" colspan="2" style="width:13%">
					7. Код страны происхождения<br/>
					<xsl:value-of select="pgc:OriginCountryDetails/RUScat_ru:CountryCode"/>
				</td>
				<td class="bordered" style="width:11%">
					8. Льготы и преференции<br/>
					<xsl:apply-templates select="pgc:PreferenceDetails"/>
				</td>
				<td class="bordered" style="width:10%">
					9. Вес нетто (кг)<br/>
					<xsl:value-of select="RUScat_ru:UnifiedNetMassMeasure"/>
				</td>
				<td class="bordered" style="width:16%">
					10.Дополнительная единица<br/>
					<xsl:for-each select="RUScat_ru:GoodsMeasureDetails">
						<xsl:apply-templates mode="quantityMeasure" select="."/>
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td class="bordered" colspan="3">11. Таможенная стоимость<br/>
					<xsl:value-of select="pgc:ReasonCalculationPayment"/>
				</td>
				<td class="bordered" colspan="2">12. Код проверки<br/>
					<xsl:for-each select="pgc:CustomsCheckCodeDetails/*">
						<xsl:choose>
							<xsl:when test=".='true' or .=1">1</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="position()!=last()">/</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td class="bordered" colspan="6" valign="top">13. Дополнительная информация, представленные документы<br/>
					<xsl:for-each select="pgc:PresentedDocDetails">
						<xsl:value-of select="pgc:DocKindCode"/>
						<xsl:text> / </xsl:text>
						<xsl:value-of select="cat_ru:PrDocumentName"/>
						<xsl:if test="cat_ru:PrDocumentNumber">
							<xsl:text> № </xsl:text>
							<xsl:value-of select="cat_ru:PrDocumentNumber"/>
						</xsl:if>
						<xsl:if test="cat_ru:PrDocumentDate">
							<xsl:text> от </xsl:text>
							<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
						</xsl:if>
						<xsl:text> / </xsl:text>
						<xsl:for-each select="pgc:InformationSourceDetails">
							<xsl:value-of select="pgc:InformationSourceName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="pgc:DetailsResourceId"/>
						</xsl:for-each>
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</td>
			</tr>
			<tr valign="top">
				<td class="bordered" style="width:50%;padding: 0;">14. Исчисление платежей<br/>
					<table style="font-size:10pt;">
						<tr valign="top">
							<td class="bordered" style="width:3%;border-left:0;">Вид</td>
							<td class="bordered" style="width:15%;">База для исчисления</td>
							<td class="bordered" style="width:15%;">Ставка</td>
							<td class="bordered" style="width:15%;">Сумма</td>
							<td class="bordered" style="width:2%;border-right:0">СП</td>
						</tr>
						<xsl:for-each select="pgc:GoodsItemPaymentDetails">
							<tr valign="top">
								<td class="bordered" style="border-left:0;border-bottom:0;">
									<xsl:value-of select="RUDECLcat:PaymentModeCode"/>
								</td>
								<td class="bordered" style="border-bottom:0;word-break:break-all">
									<xsl:value-of select="RUDECLcat:TaxBase"/>
									<xsl:text> </xsl:text>
									<xsl:choose>
										<xsl:when test="RUDECLcat:TaxBaseCurrencyCode"><xsl:apply-templates select="RUDECLcat:TaxBaseCurrencyCode"/></xsl:when>
										<xsl:when test="RUDECLcat:TaxBaseQualifierCode"><xsl:value-of select="RUDECLcat:TaxBaseQualifierCode"/></xsl:when>
									</xsl:choose>
								</td>
								<td class="bordered" style="border-bottom:0;">
									<xsl:apply-templates mode="rate1" select="."/>
								</td>
								<td class="bordered" style="border-bottom:0;word-break:break-all">
									<xsl:value-of select="RUDECLcat:PaymentAmount"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="RUDECLcat:PaymentCurrencyCode"/>
								</td>
								<td class="bordered" style="border-right:0;border-bottom:0;">
									<xsl:value-of select="RUDECLcat:PaymentCode"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</td>
				<td class="bordered" style="width:50%;padding:0;" colspan="5">15. Размер обеспечения
					<table style="font-size:10pt;">
						<tr valign="top">
							<td class="bordered" style="width:3%;border-left:0;">Вид</td>
							<td class="bordered" style="width:16%;">Сумма</td>
							<td class="bordered" style="width:16%;">Предыдущая<br/>сумма</td>
							<td class="bordered" style="width:15%;border-right:0">Изменения</td>
						</tr>
						<xsl:for-each select="pgc:GoodsItemGuaranteeDetails">
							<tr valign="top">
								<td class="bordered" style="border-left:0;border-bottom:0;">
									<xsl:value-of select="pgc:CustomsTaxModeCode"/>
								</td>
								<td class="bordered" style="border-bottom:0;word-break:break-all;">
									<xsl:value-of select="pgc:PaymentAmount"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="pgc:PaymentCurrencyCode"/>
								</td>
								<td class="bordered" style="border-bottom:0;word-break:break-all;">
									<xsl:value-of select="pgc:PreviousPaymentAmount"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="pgc:PreviousPaymentCurrencyCode"/>
								</td>
								<td class="bordered" style="border-right:0;border-bottom:0;word-break:break-all;">
									<xsl:value-of select="pgc:DifferencePaymentAmount"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="pgc:DifferencePaymentCurrencyCode"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="*" mode="rate1">
		<xsl:variable name="rateval">
			<xsl:choose>
				<xsl:when test="RUDECLcat:Rate or RUDECLcat:Rate !=''">
					<xsl:value-of select="RUDECLcat:Rate"/>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="format-number($rateval,'0.######')"/>
		<xsl:choose>
			<xsl:when test="RUDECLcat:RateTypeCode='%'">%</xsl:when>
			<xsl:when test="RUDECLcat:RateTypeCode!='%' or not(RUDECLcat:RateTypeCode)">
				<xsl:choose>
					<xsl:when test="RUDECLcat:RateCurrencyCode">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="RUDECLcat:RateCurrencyCode"/>
						<xsl:if test="RUDECLcat:RateTNVEDQualifierCode or RUDECLcat:RateTNVEDQualifierCode">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="RUDECLcat:WeightingFactor"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="RUDECLcat:RateTNVEDQualifierCode"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>%</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="pgc:PreferenceDetails">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">-</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="header1to3">
		<xsl:param name="baseOrAdd" select="0"/>
		<xsl:param name="cell1"/>
		<xsl:param name="cell1_2"/>
		<xsl:param name="cell2"/>
		<xsl:param name="cell2_2"/>
		<xsl:param name="cell3"/>
		<table>
			<tr valign="top">
				<td class="bordered" colspan="2" style="width:50%">1. Номер декларации на товары</td>
				<td class="bordered" colspan="2" style="width:13%">2. Кол-во листов</td>
				<td class="bordered" style="width:11%;border-bottom:0">3. Всего товаров</td>
				<td class="bordered" rowspan="2" style="width:26%" align="center" valign="middle">
					<xsl:choose>
						<xsl:when test="$baseOrAdd=0">ОСНОВНОЙ ЛИСТ</xsl:when>
						<xsl:otherwise>ДОБАВОЧНЫЙ ЛИСТ</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="bordered" style="width:45%"><xsl:apply-templates mode="GTD_number" select="$cell1"/></td>
				<td class="bordered"><xsl:value-of select="$cell1_2"/></td>
				<td class="bordered" style="width:7%"><xsl:value-of select="$cell2"/></td>
				<td class="bordered" style="width:6%"><xsl:value-of select="$cell2_2"/></td>
				<td class="bordered" style="border-top:0"><xsl:value-of select="$cell3"/></td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template mode="GTD_number" match="*">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="GTD_date"><xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/></xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>

	<xsl:template mode="quantityMeasure" match="*">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
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
	
	<xsl:template name="GTD_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
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
	<xsl:template match="pgc:PaymentCurrencyCode | pgc:PreviousPaymentCurrencyCode | pgc:DifferencePaymentCurrencyCode | pgc:TaxBaseCurrencyCode | RUDECLcat:RateCurrencyCode | RUScat_ru:CurrencyCode">
		<!--xsl:choose>
			<xsl:when test=".='643'">RUB</xsl:when>
			<xsl:when test=".='840'">USD</xsl:when>
			<xsl:when test=".='978'">EUR</xsl:when>
			<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
		</xsl:choose-->
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="RUDECLcat:RateTNVEDQualifierCode">
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
