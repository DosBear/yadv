<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gclc_inq="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCalculationInquiry:5.13.3" xmlns:grn_cat="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCommonAggregateTypesCust:5.13.1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/gclc_inq:GuaranteeCalculationInquiry">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title>Запрос сведений на расчет суммы Обеспечения</title>
				<meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
				<style type="text/css">
				body {
					text-align: left;
						background: #ffffff
						}
						   
						div.page {
						border: solid 1pt #000000;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding: 10mm;
						padding-left: 15mm;
						background: #ffffff;
						}

						table { 
						width:180mm 
						border: solid  2pt #ffffff;
						border-collapse: collapse; 
						cellspacing:0;
						}
							
						.bheader {
						border: solid 1pt #bbbbbb;
						padding-left:	5pt;
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 11pt;
						font-weight: bold;
						background: #CAE1FF
               <!--#fff0f5-->;
						}			
						
					    .b0 {
						border: solid 1pt #bbbbbb;
					    padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						background: #ffffff;
   					    }
					    
					    .b1 {
						border: solid 1pt #bbbbbb;
					    text-indent: 20pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;
						}
						
					    .b1h {
						border: solid 1pt #bbbbbb;
					    text-indent: 20pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						background: #ffffff;
						}
						
						.b2 {
						border: solid 1pt #bbbbbb;
					    text-indent: 40pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;
						}
						
						
						.b3 {
						border: solid 1pt #bbbbbb;
					    text-indent: 60pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;					
						}
						
						.b4 {
						border: solid 1pt #bbbbbb;
					    text-indent: 80pt;	
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;						
						}
						
						.btext {
						border: solid 1pt #bbbbbb;
					    padding-left:	5pt;
					    padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						background: #ffffff;
						}
				</style>
			</head>
			<body>
				<div class="page">
					<h2>Запрос на расчет суммы Обеспечения</h2>
					<table class="table" style="width:180mm">
						<tr>
							<th class="bheader" style="width:100mm;">Поле</th>
							<th class="bheader" style="width:50mm;">Значение</th>
						</tr>
						<!--<tr>
						<td style="width:80mm;" class="b1">Служебный идентификатор вида документа</td>
						<td style="width:100mm;" class="btext">
							<xsl:value-of select="gclc_inq:DocumentModeID"/>
						</td>
					</tr>-->
						<!--	<tr>
						<td style="width:80mm;" class="b1">Уникальный идентификатор документа</td>
						<td style="width:100mm;" class="btext">
							<xsl:value-of select="cat_ru:DocumentID"/>
						</td>
					</tr>
					<tr>
						<td style="width:80mm;" class="b1">Уникальный идентификатор исходного документа</td>
						<td style="width:100mm;" class="btext">
							<xsl:if test="cat_ru:RefDocumentID"><xsl:value-of select="cat_ru:RefDocumentID"/></xsl:if>
						</td>
					</tr>-->
						<tr>
							<td class="b1" style="width:80mm;">Дата и время формирования электронного документа</td>
							<td class="btext" style="width:100mm;">
								<!--<xsl:value-of select="grn_cat:DocumentDateTime"/>-->
								<xsl:call-template name="date_time">
									<xsl:with-param name="dateTimeIn" select="gclc_inq:DocumentDateTime"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="b1" style="width:80mm;">Код таможенной процедуры</td>
							<td class="btext" style="width:100mm;">
								<xsl:value-of select="gclc_inq:CustomsProcedure"/>
							</td>
						</tr>
						<tr>
							<td class="b1" style="width:80mm;">Особенность</td>
							<td class="btext" style="width:100mm;">
								<xsl:choose>
									<xsl:when test="gclc_inq:DocSign='1'">Физические лица</xsl:when>
									<xsl:otherwise>Без особенностей</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td class="b1" style="width:80mm;">Дата проверки</td>
							<td class="btext" style="width:100mm;">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="gclc_inq:CheckDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="b1" style="width:80mm;">Номер ДТ</td>
							<td class="btext" style="width:100mm;">
								<xsl:apply-templates select="gclc_inq:DTNumber"/>
							</td>
						</tr>
						<xsl:if test="gclc_inq:Comments">
							<tr>
								<td class="b1" style="width:80mm;">Комментарии о применении льгот/преференций</td>
								<td class="btext" style="width:100mm;">
									<xsl:value-of select="gclc_inq:Comments"/>
								</td>
							</tr>
						</xsl:if>
						<!--Код таможенного органа-->
						<tr>
							<tr>
								<td class="b0" style="width:80mm;">Сведения о таможенном органе</td>
								<td class="btext" style="width:100mm;">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="b1" style="width:80mm;">Код</td>
								<td class="btext" style="width:100mm;">
									<xsl:value-of select="gclc_inq:CustomsOffice/cat_ru:Code"/>
								</td>
							</tr>
							<xsl:if test="gclc_inq:CustomsOffice/cat_ru:OfficeName">
								<tr>
									<td class="b1" style="width:80mm;">Наименование</td>
									<td class="btext" style="width:100mm;">
										<xsl:value-of select="gclc_inq:CustomsOffice/cat_ru:OfficeName"/>
									</td>
								</tr>
							</xsl:if>
						</tr>
						<!--Должностное лицо-->
						<tr>
							<tr>
								<td class="b0" style="width:80mm;">Сведения о должностном лице</td>
								<td class="btext" style="width:100mm;">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="b1" style="width:80mm;">Ф.И.О</td>
								<td class="btext" style="width:100mm;">
									<xsl:value-of select="gclc_inq:CustomsOfficial/cat_ru:PersonName"/>
								</td>
							</tr>
							<xsl:if test="gclc_inq:CustomsOfficial/cat_ru:LNP">
								<tr>
									<td class="b1" style="width:80mm;">ЛНП</td>
									<td class="btext" style="width:100mm;">
										<xsl:value-of select="gclc_inq:CustomsOfficial/cat_ru:LNP"/>
									</td>
								</tr>
							</xsl:if>
						</tr>
						<!--Страны-->
						<xsl:if test="gclc_inq:TradeCountryCode or gclc_inq:DispatchCountryCode or gclc_inq:DestinationCountryCode">
							<tr>
								<td class="b0" style="width:80mm;">Страны</td>
								<td class="btext" style="width:100mm;">
									<br/>
								</td>
							</tr>
							<xsl:if test="gclc_inq:TradeCountryCode">
								<tr>
									<td class="b1" style="width:80mm;">Торгующая страна</td>
									<td class="btext" style="width:100mm;">
										<xsl:value-of select="gclc_inq:TradeCountryCode"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gclc_inq:DispatchCountryCode">
								<tr>
									<td class="b1" style="width:80mm;">Страна оправления</td>
									<td class="btext" style="width:100mm;">
										<xsl:value-of select="gclc_inq:DispatchCountryCode"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="gclc_inq:DestinationCountryCode">
								<tr>
									<td class="b1" style="width:80mm;">Страна назначения</td>
									<td class="btext" style="width:100mm;">
										<xsl:value-of select="gclc_inq:DestinationCountryCode"/>
									</td>
								</tr>
							</xsl:if>
						</xsl:if>
						<!--Ранее уплаченные денежные средства-->
						<xsl:if test="gclc_inq:AmountPaid">
							<tr>
								<td class="b0" style="width:80mm;">Уплаченные ранее суммы</td>
								<td class="btext" style="width:100mm;">
									<br/>
								</td>
							</tr>
							<xsl:for-each select="gclc_inq:AmountPaid">
								<tr>
									<tr>
										<td class="b2" style="width:80mm;">Сумма</td>
										<td class="btext" style="width:100mm;">
											<xsl:value-of select="grn_cat:Amount"/>
											<xsl:if test="grn_cat:CurrencyCode">
												<xsl:text> </xsl:text>
												<xsl:value-of select="grn_cat:CurrencyCode"/>
											</xsl:if>
											<xsl:if test="grn_cat:CUCustomsPaymentCode">
												<xsl:text> (</xsl:text>
												<xsl:value-of select="grn_cat:CUCustomsPaymentCode"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
									</tr>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<!--Товарная часть запроса-->
						<tr>
							<td class="b0" style="width:80mm;">Товары</td>
							<td class="btext" style="width:100mm;">
								<br/>
							</td>
						</tr>
						<xsl:for-each select="gclc_inq:GoodsInfo">
							<!--<tr>
							<td style="width:80mm;" class="b0">Товарная часть запроса</td>
							<td style="width:100mm;" class="btext">
								<br></br>
							</td>
						</tr>-->
							<!--Товар текущей проверки-->
							<xsl:for-each select="gclc_inq:CheckedItem">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
							<!--Корректируемый товар-->
							<xsl:if test="gclc_inq:CorrectedItem">
								<xsl:for-each select="gclc_inq:CorrectedItem">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа SupplementaryQuantityType -->
	<xsl:template match="gclc_inq:SupplementaryQuantity|gclc_inq:AddSupplementaryQuantity">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа CostType -->
	<xsl:template match="gclc_inq:Cost">
		<xsl:value-of select="gclc_inq:UnitPrice"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="gclc_inq:CurrencyCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="gclc_inq:MeasureUnitQualifierName"/>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="gclc_inq:MeasureUnitQualifierCode"/>
		<xsl:text>)</xsl:text>
	</xsl:template>
	<!-- Шаблон для типа GuaranteeGoodsType -->
	<xsl:template match="gclc_inq:CheckedItem|gclc_inq:CorrectedItem">
		<xsl:choose>
			<xsl:when test="name(.)='CheckedItem'">
				<tr>
					<td class="b0" style="width:80mm;background-color:#aaaaaa;">Заявленный товар</td>
					<td class="btext" style="width:100mm;background-color:#aaaaaa;">
						<br/>
					</td>
				</tr>
			</xsl:when>
			<xsl:when test="name(.)='CorrectedItem'">
				<tr>
					<td class="b0" style="width:80mm;background-color:#dddddd">Корректируемый товар</td>
					<td class="btext" style="width:100mm;background-color:#dddddd">
						<br/>
					</td>
				</tr>
			</xsl:when>
		</xsl:choose>
		<tr>
			<td class="b1" style="width:80mm;">Номер товара по порядку</td>
			<td class="btext" style="width:100mm;">
				<xsl:value-of select="gclc_inq:Numeric"/>
			</td>
		</tr>
		<xsl:if test="gclc_inq:NumericDT">
			<tr>
				<td class="b1" style="width:80mm;">Номер товара в ДТ/ТД</td>
				<td class="btext" style="width:100mm;">
					<xsl:value-of select="gclc_inq:NumericDT"/>
				</td>
			</tr>
		</xsl:if>
		<tr>
			<td class="b1" style="width:80mm;">Код товара ТН ВЭД</td>
			<td class="btext" style="width:100mm;">
				<xsl:value-of select="gclc_inq:TNVEDCode"/>
			</td>
		</tr>
		<xsl:if test="gclc_inq:OriginCountry">
			<tr>
				<td class="b1" style="width:80mm;">Код страны происхождения</td>
				<td class="btext" style="width:100mm;">
					<xsl:value-of select="gclc_inq:OriginCountry"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="gclc_inq:ObligationCode">
			<tr>
				<td class="b1" style="width:80mm;">Код обязательства</td>
				<td class="btext" style="width:100mm;">
					<xsl:value-of select="gclc_inq:ObligationCode"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="gclc_inq:WeightQuantity">
			<tr>
				<td class="b1" style="width:80mm;">Вес товара, нетто, кг</td>
				<td class="btext" style="width:100mm;">
					<xsl:value-of select="gclc_inq:WeightQuantity"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="gclc_inq:NetWeightQuantity2">
			<tr>
				<td class="b1" style="width:80mm;">Вес товара, нетто без учета всех видов упаковки, кг</td>
				<td class="btext" style="width:100mm;">
					<xsl:value-of select="gclc_inq:NetWeightQuantity2"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="gclc_inq:GrossWeightQuantity">
			<tr>
				<td class="b1" style="width:80mm;">Вес товара, брутто, кг</td>
				<td class="btext" style="width:100mm;">
					<xsl:value-of select="gclc_inq:GrossWeightQuantity"/>
				</td>
			</tr>
		</xsl:if>
		<!--Кол-во товара 1-->
		<xsl:if test="gclc_inq:SupplementaryQuantity">
			<tr>
				<td class="b1" style="width:80mm;">Кол-во товара в ДЕИ</td>
				<td class="btext" style="width:100mm;">
					<xsl:for-each select="gclc_inq:SupplementaryQuantity">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<!--Кол-во товара 2-->
		<xsl:if test="gclc_inq:AddSupplementaryQuantity">
			<tr>
				<td class="b1" style="width:80mm;">Кол-во товара в единице, отличной от ОИ и ДЕИ</td>
				<td class="btext" style="width:100mm;">
					<xsl:for-each select="gclc_inq:AddSupplementaryQuantity">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<!--Стоимость товара-->
		<!--tr>
			<td class="b1" style="width:80mm;">Стоимость товара</td>
			<td class="btext" style="width:100mm;">
				<xsl:for-each select="gclc_inq:Cost">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
		</tr-->
		<!--Таможенная стоимость товара-->
		<xsl:if test="gclc_inq:CustomsCost">
			<tr>
				<td class="b1" style="width:80mm;">Таможенная стоимость товара</td>
				<td class="btext" style="width:100mm;">
					<xsl:value-of select="gclc_inq:CustomsCost"/>
					<xsl:if test="gclc_inq:CostCurrencyCode"> (<xsl:value-of select="gclc_inq:CostCurrencyCode"/>)</xsl:if>
				</td>
			</tr>
		</xsl:if>
		<!--Максимальная розничная цена табачных изделий-->
		<xsl:if test="gclc_inq:TobaccoCost">
			<tr>
				<td class="b1" style="width:80mm;">Максимальная розничная цена табачных изделий</td>
				<td class="btext" style="width:100mm;">
					<xsl:value-of select="gclc_inq:TobaccoCost"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="gclc_inq:QuantityPack">
			<tr>
				<td class="b1" style="width:80mm;">Количество сигарет в упаковке</td>
				<td class="btext" style="width:100mm;">
					<xsl:value-of select="gclc_inq:QuantityPack"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:apply-templates select="gclc_inq:Preferencii"/>
		<xsl:if test="gclc_inq:RateChoice">
			<tr>
				<td class="b1" style="width:80mm;">
					<b>Платежи по товару</b>
				</td>
				<td class="btext" style="width:100mm;">
					<br/>
				</td>
			</tr>
			<xsl:apply-templates select="gclc_inq:RateChoice"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gclc_inq:RateChoice">
		<tr>
			<td class="b1" style="width:80mm;background-color:#eeeeee">Код вида платежа</td>
			<td class="btext" style="width:100mm;background-color:#eeeeee">
				<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
			</td>
		</tr>
		<tr>
			<td class="b1" style="width:80mm;">Основа начисления</td>
			<td class="btext" style="width:100mm;">
				<xsl:value-of select="catESAD_cu:TaxBase"/>
			</td>
		</tr>
		<tr>
			<td class="b1" style="width:80mm;">Код валюты основы начисления</td>
			<td class="btext" style="width:100mm;">
				<xsl:value-of select="catESAD_cu:TaxBaseCurrencyCode"/>
			</td>
		</tr>
		<tr>
			<td class="b1" style="width:80mm;">Ставка</td>
			<td class="btext" style="width:100mm;">
				<xsl:value-of select="catESAD_cu:Rate"/>
				<xsl:if test="catESAD_cu:RateTypeCode='%'">
					<xsl:text> %</xsl:text>
				</xsl:if>
				<xsl:if test="catESAD_cu:RateTypeCode='*'">
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="catESAD_cu:RateCurrencyCode"/>
					<xsl:if test="catESAD_cu:RateTNVEDQualifierCode or catESAD_cu:WeightingFactor">
						<xsl:text>/</xsl:text>
						<xsl:if test="catESAD_cu:WeightingFactor">
							<xsl:value-of select="catESAD_cu:WeightingFactor"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:apply-templates select="catESAD_cu:RateTNVEDQualifierCode"/>
					</xsl:if>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="b1" style="width:80mm;">Сумма платежа</td>
			<td class="btext" style="width:100mm;">
				<xsl:value-of select="catESAD_cu:PaymentAmount"/>
			</td>
		</tr>
		<tr>
			<td class="b1" style="width:80mm;">Код валюты платежа</td>
			<td class="btext" style="width:100mm;">
				<xsl:value-of select="catESAD_cu:PaymentCurrencyCode"/>
			</td>
		</tr>
		<tr>
			<td class="b1" style="width:80mm;">Код особенностей уплаты</td>
			<td class="btext" style="width:100mm;">
				<xsl:value-of select="catESAD_cu:PaymentCode"/>
			</td>
		</tr>
		<tr>
			<td class="b1" style="width:80mm;">Полная строка ставки</td>
			<td class="btext" style="width:100mm;">
				<xsl:value-of select="catESAD_cu:Rate"/>
				<xsl:if test="catESAD_cu:RateTypeCode='%'">
					<xsl:text> %</xsl:text>
				</xsl:if>
				<xsl:if test="catESAD_cu:RateTypeCode='*'">
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="catESAD_cu:RateCurrencyCode"/>
					<xsl:if test="catESAD_cu:RateTNVEDQualifierCode or catESAD_cu:WeightingFactor">
						<xsl:text>/</xsl:text>
						<xsl:if test="catESAD_cu:WeightingFactor">
							<xsl:value-of select="catESAD_cu:WeightingFactor"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:apply-templates select="catESAD_cu:RateTNVEDQualifierCode"/>
					</xsl:if>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="gclc_inq:Preferencii">
		<xsl:if test="catESAD_cu:CustomsDuty">
			<tr>
				<td class="b1" style="width:80mm;">Преференция (таможенная пошлина)</td>
				<td class="btext" style="width:100mm;">
					<xsl:value-of select="catESAD_cu:CustomsDuty"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="catESAD_cu:Excise">
			<tr>
				<td class="b1" style="width:80mm;">Преференция (акциз)</td>
				<td class="btext" style="width:100mm;">
					<xsl:value-of select="catESAD_cu:Excise"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="catESAD_cu:Rate">
			<tr>
				<td class="b1" style="width:80mm;">Преференция (НДС)</td>
				<td class="btext" style="width:100mm;">
					<xsl:value-of select="catESAD_cu:Rate"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<xsl:template match="gclc_inq:DTNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="gclc_inq:AddNumber"/>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
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
	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateTimeIn,12,5)"/>
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
	<xsl:template match="catESAD_cu:RateCurrencyCode|catESAD_cu:RateCurrencyCode2">
		<xsl:choose>
			<xsl:when test=".='643'">руб</xsl:when>
			<xsl:when test=".='840'">долл</xsl:when>
			<xsl:when test=".='978'">евро</xsl:when>
			<xsl:otherwise>
				<xsl:text>(код:</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>) </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="catESAD_cu:RateTNVEDQualifierCode|catESAD_cu:RateTNVEDQualifierCode2">
		<xsl:choose>
			<xsl:when test=".='006'">м</xsl:when>
			<xsl:when test=".='055'">кв.м</xsl:when>
			<xsl:when test=".='111'">куб.см</xsl:when>
			<xsl:when test=".='112'">л</xsl:when>
			<xsl:when test=".='113'">куб.м</xsl:when>
			<xsl:when test=".='114'">1000 куб.м</xsl:when>
			<xsl:when test=".='117'">т. полной массы</xsl:when>
			<xsl:when test=".='118'">куб.м полного объема кузова</xsl:when>
			<xsl:when test=".='130'">1000 л</xsl:when>
			<xsl:when test=".='162'">метрический карат</xsl:when>
			<xsl:when test=".='163'">г</xsl:when>
			<xsl:when test=".='166'">кг</xsl:when>
			<xsl:when test=".='168'">т. нетто</xsl:when>
			<xsl:when test=".='185'">грузоподъемность в т.</xsl:when>
			<xsl:when test=".='214'">кВт</xsl:when>
			<xsl:when test=".='246'">1000 кВт * ч</xsl:when>
			<xsl:when test=".='251'">л.с.</xsl:when>
			<xsl:when test=".='305'">кюри</xsl:when>
			<xsl:when test=".='306'">г. делящихся изотопов</xsl:when>
			<xsl:when test=".='715'">пара</xsl:when>
			<xsl:when test=".='796'">шт.</xsl:when>
			<xsl:when test=".='797'">100 шт.</xsl:when>
			<xsl:when test=".='798'">1000 шт.</xsl:when>
			<xsl:when test=".='831'">л чистого (100%) спирта</xsl:when>
			<xsl:when test=".='841'">кг пероксида водорода</xsl:when>
			<xsl:when test=".='845'">кг сухого на 90% вещества</xsl:when>
			<xsl:when test=".='852'">кг оксида калия</xsl:when>
			<xsl:when test=".='859'">кг гидроксида калия</xsl:when>
			<xsl:when test=".='861'">кг азота</xsl:when>
			<xsl:when test=".='863'">кг гидроксида натрия</xsl:when>
			<xsl:when test=".='865'">кг пятиоксида фосфора</xsl:when>
			<xsl:when test=".='867'">кг урана</xsl:when>
			<xsl:otherwise>
				<xsl:text>(код ед.изм.:</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>)</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
