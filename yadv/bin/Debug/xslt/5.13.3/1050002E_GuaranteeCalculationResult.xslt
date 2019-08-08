<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gclc_rslt="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCalculationResult:5.13.3" xmlns:grn_cat="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCommonAggregateTypesCust:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/gclc_rslt:GuaranteeCalculationResult">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title>Сведения о рассчитанном Обеспечении</title>
				<meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
				<style type="text/css">
				body {
						text-align: center;
						font-family: Arial;
						background: #ffffff
						}
						   
						div.page {
						width: 190mm;
						border: solid 1pt #000000;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding: 10mm;
						/*padding-left: 15mm;*/
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
						border: solid 1pt;
					    padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						background: #ffffff;
   					    }
					    
					    .b1 {
						border: solid 1pt;
					    /*text-indent: 20pt;	*/
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
					<h2>Результат расчета сумм обеспечения уплаты таможенных пошлин, налогов</h2>
					<br/>
					<table width="100%">
						<tbody>
							<xsl:if test="gclc_rslt:GuaranteeCalculation/gclc_rslt:GoodsAmount/gclc_rslt:CheckedAmount[gclc_rslt:Absent='true'] or gclc_rslt:GuaranteeCalculation/gclc_rslt:GoodsAmount/gclc_rslt:CheckedAmount[gclc_rslt:Absent='1'] or gclc_rslt:GuaranteeCalculation/gclc_rslt:GoodsAmount/gclc_rslt:CheckedAmount[gclc_rslt:Absent='t'] or gclc_rslt:GuaranteeCalculation/gclc_rslt:GoodsAmount/gclc_rslt:CheckedAmount[gclc_rslt:Absent='TRUE']">
								<tr>
									<td align="center">
										<font color="red" style="font-weight:bold;">Внимание, в запросе на расчет присутствуют ставки платажей, не актуальные на дату расчета!</font>
										<br/><br/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<xsl:text>Дата и время формирования электронного докумена: </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="gclc_rslt:DocumentDateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(gclc_rslt:DocumentDateTime, 12, 8)"/>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:choose>
						<xsl:when test="gclc_rslt:GuaranteeCalculation">
							<xsl:for-each select="gclc_rslt:GuaranteeCalculation">
								<table width="100%">
									<xsl:if test="gclc_rslt:TotalDeltaAmount">
										<tr>
											<td>
												<br/>
												<b>Суммы обеспечения за вычетом уже уплаченных сумм </b>
											</td>
										</tr>
										<tr>
											<td>
												<table width="50%">
													<tr>
														<td class="b1" align="center">
															<b>Код вида платежа</b>
														</td>
														<td class="b1" align="center">
															<b>Сумма обеспечения, руб</b>
														</td>
													</tr>
													<xsl:apply-templates select="gclc_rslt:TotalDeltaAmount"/>
													<tr>
														<td class="b1" align="center" style="background-color: #ccc;">Итого:</td>
														<td class="b1" align="right" style="background-color: #ccc;">
															<xsl:value-of select="format-number(sum(gclc_rslt:TotalDeltaAmount/grn_cat:Amount), '0.00')"/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td>
											<br/>
											<b>Детализация сумм обеспечения по товарам:</b>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tr valign="top">
													<td class="b1" align="center">
														<b>№</b>
													</td>
													<td class="b1" align="center">
														<b>Номер товара в ДТ/ТД</b>
													</td>
													<td class="b1" align="center">
														<b>Код товара по ТН ВЭД</b>
													</td>
													<td class="b1" align="center">
														<b>Код вида платежа</b>
													</td>
													<td class="b1" align="center">
														<b>Начисленные таможенные платежи</b>
													</td>
													<td class="b1" align="center">
														<b>Таможенные платежи, подлежащие уплате</b>
													</td>
													<td class="b1" align="center">
														<b>Сумма обеспечения</b>
													</td>
													<td class="b1" align="center">
														<b>Расчетная ставка</b>
													</td>
													<td class="b1" align="center">
														<b>Исходная ставка</b>
													</td>
												</tr>
												<xsl:apply-templates select="gclc_rslt:GoodsAmount"/>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<b>Общие суммы таможенных платежей, рассчитанные по запросу</b>
										</td>
									</tr>
									<tr>
										<td>
											<table width="50%">
												<tr>
													<td class="b1" align="center">
														<b>Код вида платежа</b>
													</td>
													<td class="b1" align="center">
														<b>Сумма, руб</b>
													</td>
												</tr>
												<xsl:apply-templates select="gclc_rslt:TotalAmount"/>
												<tr>
													<td class="b1" align="center" style="background-color: #ccc;">Итого:</td>
													<td class="b1" align="right" style="background-color: #ccc;">
														<xsl:value-of select="format-number(sum(gclc_rslt:TotalAmount/grn_cat:Amount), '0.00')"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="gclc_rslt:ReasonsImpossibility">
							<table width="100%">
								<tr>
									<td>
										<br/>
										<b>
											(код причины: <xsl:value-of select="gclc_rslt:ReasonsImpossibility/gclc_rslt:ReasonsImpossibilityCode"/>)&#160;
											<xsl:value-of select="gclc_rslt:ReasonsImpossibility/gclc_rslt:ReasonsImpossibility"/>
										</b>
									</td>
								</tr>
							</table>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
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
	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateTimeIn,12,5)"/>
	</xsl:template>
	<xsl:template match="gclc_rslt:TotalAmount | gclc_rslt:TotalDeltaAmount">
		<tr>
			<td align="center" class="b1">
				<xsl:value-of select="grn_cat:CUCustomsPaymentCode"/>
			</td>
			<td align="right" class="b1">
				<xsl:value-of select="grn_cat:Amount"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="distinctCodes">
		<xsl:param name="goods"/>
		<xsl:variable name="allcodes">
			<xsl:for-each select="$goods//grn_cat:CUCustomsPaymentCode[parent::gclc_rslt:GuaranteeAmount or parent::gclc_rslt:CheckedAmount]">
				<xsl:copy>
					<xsl:apply-templates select="@*|node()"/>
				</xsl:copy>
			</xsl:for-each>
		</xsl:variable>
		<xsl:for-each select="msxsl:node-set($allcodes)/*[not(.=preceding::*)]">
			<xsl:sort select="."/>
			<xsl:copy>
				<xsl:apply-templates select="@*|node()"/>
			</xsl:copy>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="CustomsPaymentCode">
		<xsl:param name="code"/>
		<xsl:param name="goods"/>
		
		<xsl:variable name="absent">
			<xsl:value-of select="$goods/gclc_rslt:CheckedAmount[grn_cat:CUCustomsPaymentCode = $code]/gclc_rslt:Absent"/>
		</xsl:variable>
		
		<td class="b1" align="center">
			<xsl:value-of select="$code"/>
			<xsl:choose>
				<xsl:when test="$absent='true' or $absent='1' or $absent='t' or $absent='TRUE'">
					<br/>
					<font color="red" style="font-weight:bold;">ставка не актуальна по НСИ</font>
				</xsl:when>
			</xsl:choose>
		</td>
		<td class="b1" align="right">
			<xsl:value-of select="$goods/gclc_rslt:GuaranteeAmount[grn_cat:CUCustomsPaymentCode = $code]/grn_cat:Amount"/>
		</td>
		<td class="b1" align="right">
			<xsl:value-of select="$goods/gclc_rslt:CheckedAmount[grn_cat:CUCustomsPaymentCode = $code]/grn_cat:Amount"/>
		</td>
		<td class="b1" align="right">
			<xsl:value-of select="$goods/gclc_rslt:DeltaAmount[grn_cat:CUCustomsPaymentCode = $code]/grn_cat:Amount"/>
		</td>
		<td class="b1">
			<xsl:apply-templates mode="rate" select="$goods/gclc_rslt:GuaranteeAmount[grn_cat:CUCustomsPaymentCode = $code]"/>
		</td>
		<td class="b1">
			<xsl:apply-templates mode="rate" select="$goods/gclc_rslt:CheckedAmount[grn_cat:CUCustomsPaymentCode = $code]"/>
		</td>
	</xsl:template>
	<xsl:template match="gclc_rslt:GoodsAmount">
		<!--xsl:variable name="rowCount" select="count(gclc_rslt:GuaranteeAmount) + 1"/-->
		<xsl:variable name="currentGoods" select="."/>
		<xsl:variable name="distinctCodes">
			<xsl:call-template name="distinctCodes">
				<xsl:with-param name="goods" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="rowCount" select="count(msxsl:node-set($distinctCodes)/*) + 1"/>
		<tr>
			<td class="b1" rowspan="{$rowCount}" align="center">
				<xsl:value-of select="gclc_rslt:Numeric"/>
			</td>
			<td class="b1" rowspan="{$rowCount}" align="center">
				<xsl:value-of select="gclc_rslt:NumericDT"/>
			</td>
			<td class="b1" rowspan="{$rowCount}" align="center">
				<xsl:value-of select="gclc_rslt:TNVEDCode"/>
			</td>
			<!--xsl:apply-templates select="gclc_rslt:GuaranteeAmount[1]"/-->
			<xsl:call-template name="CustomsPaymentCode">
				<xsl:with-param name="code" select="msxsl:node-set($distinctCodes)/*[1]"/>
				<xsl:with-param name="goods" select="$currentGoods"/>
			</xsl:call-template>
		</tr>
		<xsl:for-each select="msxsl:node-set($distinctCodes)/*[position() &gt; 1]">
			<tr>
				<xsl:call-template name="CustomsPaymentCode">
					<xsl:with-param name="code" select="."/>
					<xsl:with-param name="goods" select="$currentGoods"/>
				</xsl:call-template>
			</tr>
		</xsl:for-each>
		<!--xsl:for-each select="gclc_rslt:GuaranteeAmount[position() &gt; 1]">
			<tr>
				<xsl:apply-templates select="."/>
			</tr>
		</xsl:for-each-->
		<tr>
			<td class="b1" style="background-color:#ccc;" align="center">Итого:</td>
			<td class="b1" style="background-color:#ccc;" align="right">
				<xsl:value-of select="format-number(sum(gclc_rslt:GuaranteeAmount/grn_cat:Amount),'#.00')"/>
			</td>
			<td class="b1" style="background-color:#ccc;" align="right">
				<xsl:value-of select="format-number(sum(gclc_rslt:CheckedAmount/grn_cat:Amount),'#.00')"/>
			</td>
			<td class="b1" style="background-color:#ccc;" align="right">
				<xsl:value-of select="format-number(sum(gclc_rslt:DeltaAmount/grn_cat:Amount),'#.00')"/>
			</td>
			<td class="b1" style="background-color:#ccc;"/>
			<td class="b1" style="background-color:#ccc;"/>
		</tr>
	</xsl:template>
	<!--xsl:template match="gclc_rslt:GuaranteeAmount">
		<xsl:variable name="keyCode" select="grn_cat:CUCustomsPaymentCode"/>
		<td class="b1" align="center">
			<xsl:value-of select="$keyCode"/>
		</td>
		<td class="b1" align="right">
			<xsl:value-of select="grn_cat:Amount"/>
		</td>
		<td class="b1" align="right">
			<xsl:value-of select="../gclc_rslt:CheckedAmount[grn_cat:CUCustomsPaymentCode = $keyCode]/grn_cat:Amount"/>
		</td>
		<td class="b1" align="right">
			<xsl:value-of select="../gclc_rslt:DeltaAmount[grn_cat:CUCustomsPaymentCode = $keyCode]/grn_cat:Amount"/>
		</td>
		<td class="b1">
			<xsl:apply-templates mode="rate" select="."/>
		</td>
		<td class="b1">
			<xsl:apply-templates mode="rate" select="../gclc_rslt:CheckedAmount[grn_cat:CUCustomsPaymentCode = $keyCode][1]"/>
		</td>
	</xsl:template-->
	<xsl:template match="*" mode="rate">
		<!--xsl:if test="gclc_rslt:RateTypeCode='%' or not(gclc_rslt:Rate2)"-->
		<xsl:apply-templates mode="rate1" select="."/>
		<xsl:if test="gclc_rslt:Rate3">
			<xsl:if test="gclc_rslt:OperationsSign='+' or not(gclc_rslt:OperationsSign)"> + </xsl:if>
			<xsl:if test="gclc_rslt:OperationsSign='-'">- </xsl:if>
			<xsl:apply-templates mode="rate3" select="."/>
		</xsl:if>
		<xsl:if test="gclc_rslt:Rate2">
			<xsl:if test="gclc_rslt:ComparisonOperationsSign='1' or not(gclc_rslt:ComparisonOperationsSign)">, но не менее </xsl:if>
			<xsl:if test="gclc_rslt:ComparisonOperationsSign='2'">, но не более </xsl:if>
			<xsl:apply-templates mode="rate2" select="."/>
		</xsl:if>
		<!--/xsl:if-->
		<!--xsl:if test="gclc_rslt:RateTypeCode2='%'">
			<xsl:apply-templates mode="rate2" select="."/>
			<xsl:if test="gclc_rslt:Rate">
				<xsl:if test="gclc_rslt:ComparisonOperationsSign='1' or not(gclc_rslt:ComparisonOperationsSign)">, но не менее </xsl:if>
				<xsl:if test="gclc_rslt:ComparisonOperationsSign='2'">, но не более </xsl:if>
				<xsl:apply-templates mode="rate1" select="."/>
			</xsl:if>
		</xsl:if-->
		<xsl:if test="gclc_rslt:CustomsCountryCode">
			<br/>код страны применения ставки: <xsl:value-of select="gclc_rslt:CustomsCountryCode"/><br/>
		</xsl:if>
		<xsl:if test="gclc_rslt:Absent">
			<br/>признак отсутствия ставки в НСИ при расчете: 
				<xsl:choose>
					<xsl:when test="gclc_rslt:Absent='true' or gclc_rslt:Absent='1' or gclc_rslt:Absent='t' or gclc_rslt:Absent='TRUE'">Есть</xsl:when>
					<xsl:otherwise>Нет</xsl:otherwise>
				</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для ставки 1-->
	<xsl:template match="*" mode="rate1">
		<xsl:variable name="rateval">
			<xsl:choose>
				<xsl:when test="gclc_rslt:Rate or gclc_rslt:Rate!=''">
					<xsl:value-of select="gclc_rslt:Rate"/>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="format-number($rateval,'0.######')"/>
		<xsl:choose>
			<xsl:when test="gclc_rslt:RateTypeCode='%'">%</xsl:when>
			<xsl:when test="gclc_rslt:RateTypeCode!='%' or not(gclc_rslt:RateTypeCode)">
				<xsl:choose>
					<xsl:when test="gclc_rslt:RateCurrencyCode">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="gclc_rslt:RateCurrencyCode"/>
						<xsl:if test="gclc_rslt:RateTNVEDQualifierCode">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="gclc_rslt:WeightingFactor"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="gclc_rslt:RateTNVEDQualifierCode"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>%</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для ставки 2-->
	<xsl:template match="*" mode="rate2">
		<xsl:value-of select="format-number(gclc_rslt:Rate2,'0.######')"/>
		<xsl:choose>
			<xsl:when test="gclc_rslt:RateTypeCode2='%'">%</xsl:when>
			<xsl:when test="gclc_rslt:RateTypeCode2!='%' or not(gclc_rslt:RateTypeCode2)">
				<xsl:choose>
					<xsl:when test="gclc_rslt:RateCurrencyCode2">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="gclc_rslt:RateCurrencyCode2"/>
						<xsl:if test="gclc_rslt:RateTNVEDQualifierCode2">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="gclc_rslt:WeightingFactor2"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="gclc_rslt:RateTNVEDQualifierCode2"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>%</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для ставки 3-->
	<xsl:template match="*" mode="rate3">
		<xsl:value-of select="format-number(gclc_rslt:Rate3,'0.######')"/>
		<xsl:choose>
			<xsl:when test="gclc_rslt:RateTypeCode3='%'">%</xsl:when>
			<xsl:when test="gclc_rslt:RateTypeCode3!='%' or not(gclc_rslt:RateTypeCode3)">
				<xsl:choose>
					<xsl:when test="gclc_rslt:RateCurrencyCode3">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="gclc_rslt:RateCurrencyCode3"/>
						<xsl:if test="gclc_rslt:RateTNVEDQualifierCode3">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="gclc_rslt:WeightingFactor3"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="gclc_rslt:RateTNVEDQualifierCode3"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>%</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="gclc_rslt:RateCurrencyCode|gclc_rslt:RateCurrencyCode2|gclc_rslt:RateCurrencyCode3">
		<xsl:choose>
			<xsl:when test=".='643'">RUB</xsl:when>
			<xsl:when test=".='840'">USD</xsl:when>
			<xsl:when test=".='978'">EUR</xsl:when>
			<xsl:otherwise>
				<xsl:text>(код:</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>) </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="gclc_rslt:RateTNVEDQualifierCode|gclc_rslt:RateTNVEDQualifierCode2|gclc_rslt:RateTNVEDQualifierCode3">
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
			<xsl:otherwise>
				<xsl:text>(код ед.изм.:</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>)</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
