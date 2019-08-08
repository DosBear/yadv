<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:cltComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonLeafTypesCust:5.8.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:mrec="urn:customs.ru:Information:ExchangeDocuments:MPOPayerReceipt:5.14.0" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.14.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа MPOPayerReceiptType -->
	<xsl:template match="mrec:MPOPayerReceipt">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									font-family: Arial;
									font-size: 10pt;
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
									
									div.pageAlbum {
									width: 277mm;
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
									.comment{
										font-size:7pt;
									}
									.center
									{
									text-align:center;
									}
									.graphMain {
									font-family: Arial;
									font-size: 10pt;
									font-weight: normal;
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
										<b>Квитанция</b>
									</font>
								</td>
							</tr>
							<tr>
								<td class="value" align="center">
									<xsl:apply-templates select="mrec:MPO_Registration"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="comment">(справочный номер квитанции)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr valign="top">
												<td class="graphMain" width="10%">Таможня: </td>
												<td class="graphMain value">
													<xsl:for-each select="mrec:Customs/*">
														<xsl:value-of select="."/>
														<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
													</xsl:for-each>
												</td>
												<td class="graphMain" width="17%"><xsl:text> таможенный пост </xsl:text></td>
												<td class="graphMain value">
													<xsl:for-each select="mrec:CustomsPost/*">
														<xsl:value-of select="."/>
														<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
													</xsl:for-each>
												</td>
											</tr>
											<tr align="center">
												<td></td>
												<td class="comment">(наименование таможни)</td>
												<td></td>
												<td class="comment">(наименование таможенного поста)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					
					<xsl:apply-templates select="mrec:Payee"/>
					<br/>
					<xsl:apply-templates select="mrec:Payer"/>
					<br/>
					<xsl:apply-templates select="mrec:AuthorizedOperator"/>
					<br/>
					<table class="w190">
						<tbody>
							<tr align="center" valign="top">
								<td class="graphMain bordered">Описание товара</td>
								<td class="graphMain bordered">Код товара</td>
								<td class="graphMain bordered">Стоимость товара<br/>(руб.)</td>
								<td class="graphMain bordered">Вес товара<br/>(кг.)</td>
								<td class="graphMain bordered">Количество товара</td>
							</tr>
							<tr align="center" valign="top">
								<td class="graphMain bordered">1</td>
								<td class="graphMain bordered">2</td>
								<td class="graphMain bordered">3</td>
								<td class="graphMain bordered">4</td>
								<td class="graphMain bordered">5</td>
							</tr>
							<xsl:for-each select="mrec:PayTNVED">
								<tr valign="top">
									<td class="graphMain bordered">
										<xsl:apply-templates select="mpco:GoodDescription"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="mpco:TNVEDCode"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="mpco:CostRUS"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="mpco:GrossWeight"/>
									</td>
									<td class="graphMain bordered">
										<xsl:apply-templates select="mpco:GoodsQuantity"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr valign="top" align="center">
								<td class="graphMain bordered">Код вида платежа</td>
								<td class="graphMain bordered">Наименование платежа</td>
								<td class="graphMain bordered">КБК</td>
								<td class="graphMain bordered">Основа начисления</td>
								<td class="graphMain bordered">Ставка</td>
								<td class="graphMain bordered">Сумма таможенных платежей</td>
							</tr>
							<tr valign="top" align="center">
								<td class="graphMain bordered">1</td>
								<td class="graphMain bordered">2</td>
								<td class="graphMain bordered">3</td>
								<td class="graphMain bordered">4</td>
								<td class="graphMain bordered">5</td>
								<td class="graphMain bordered">6</td>
							</tr>
							<xsl:for-each select="mrec:Paying">
								<tr valign="top" align="center">
									<td class="graphMain bordered">
										<xsl:value-of select="mrec:PaymentModeCode"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="mrec:PaymentName"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="mrec:CBC"/>
									</td>
									<td class="graphMain bordered">
										<xsl:choose>
											<xsl:when test="mrec:TaxBase/mpco:TaxBaseKind=0">
												<xsl:value-of select="mrec:TaxBase/mpco:TaxBaseEuro"/><xsl:text> евро</xsl:text>
											</xsl:when>
											<xsl:when test="mrec:TaxBase/mpco:TaxBaseKind=1">
												<xsl:value-of select="mrec:TaxBase/mpco:TaxBaseWeight"/><xsl:text> кг</xsl:text>
											</xsl:when>
										</xsl:choose>
									</td>
									<td class="graphMain bordered">
										<xsl:choose>
											<xsl:when test="mrec:TaxBase/mpco:TaxBaseKind=0">
												<xsl:value-of select="mrec:TaxBase/mpco:RateEuro"/>
											</xsl:when>
											<xsl:when test="mrec:TaxBase/mpco:TaxBaseKind=1">
												<xsl:value-of select="mrec:TaxBase/mpco:RateWeight"/>
											</xsl:when>
										</xsl:choose>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="mrec:Amount"/>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td class="graphMain bordered" colspan="5" align="right">Итого:</td>
								<td class="graphMain bordered">
									<xsl:value-of select="mrec:Amount"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="mrec:CurrencyRate"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="pageAlbum">
					<table>
						<tbody>
							<tr align="center">
								<td class="graphMain">
									<font size="4">
										<b>Дополнительные сведения</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:if test="mrec:MPO_ID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">ID МПО / уникальный номер записи в реестре МПО</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mrec:MPO_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mrec:ReservationID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Идентификатор резервирования денежных средств для целей уплаты таможенных платежей</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mrec:ReservationID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mrec:PayTNVED">
						<div class="title marg-top">Расчет совокупного платежа</div>
					</xsl:if>
					<xsl:for-each select="mrec:PayTNVED">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Номер товара по порядку</td>
								<td class="value graphMain" style="width:50%">
									<b><xsl:value-of select="mpco:ListNumeric"/></b>
								</td>
							</tr>
						</table>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<tr>
										<td class="graphMain bordered">Код вида</td>
										<td class="graphMain bordered">Основа начисления</td>
										<td class="graphMain bordered">Код валюты основы (адв. ставка)</td>
										<td class="graphMain bordered">Код ЕИ основы (спец. ставка)</td>
										<td class="graphMain bordered">Вид ставки</td>
										<td class="graphMain bordered">Ставка</td>
										<td class="graphMain bordered">Код ЕИ ставки (спец. ставка)</td>
										<td class="graphMain bordered">Код валюты ставки (спец. ставка)</td>
										<td class="graphMain bordered">Вес. коэф. ЕИ (спец. ставка)</td>
										<td class="graphMain bordered">Дата применения ставки</td>
										<td class="graphMain bordered">Код</td>
										<td class="graphMain bordered">Сумма</td>
										<td class="graphMain bordered">Код валюты суммы платежа</td>
									</tr>
								</tr>
								<xsl:for-each select="mrec:PaymentModeCode">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
						<xsl:if test="position()!=last()"><br/></xsl:if>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="mrec:PaymentModeCode">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="mpco:PaymentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(mpco:TaxBase, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpco:TaxBaseCurrencyCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpco:TaxBaseQualifierCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="mpco:RateTypeCode=адвалорная">
						<xsl:text>"%"</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:RateTypeCode=специфическая">
						<xsl:text>"*"</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="mpco:RateTypeCode"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(mpco:Rate, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpco:RateTNVEDQualifierCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpco:RateCurrencyCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(mpco:WeightingFactor, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="mpco:RateUseDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpco:PaymentCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(mpco:PaymentAmount, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpco:PaymentCurrencyCode"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="mpco:GoodsQuantity">
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
	<xsl:template match="mrec:Payer">
		<table class="w190 mt">
			<tr>
				<td class="graphMain" style="width:20mm">Плательщик:</td>
				<td class="graphMain" style="width:160mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="cat_ru:OrganizationName"/>
					<xsl:if test="not(cat_ru:OrganizationName)"><xsl:value-of select="cat_ru:ShortName"/></xsl:if>
				</td>
			</tr>
			<tr>
				<td class="comment"/>
				<td class="comment center">(Ф.И.О. плательщика)</td>
			</tr>
		</table>
		<xsl:if test="*[local-name()='RFOrganizationFeatures']/cat_ru:INN or *[local-name()='RFOrganizationFeatures']/cat_ru:KPP">
			<table class="w190">
				<tr>
					<td class="graphMain" style="width:10mm">ИНН</td>
					<td class="graphMain center" style="width:50mm;border-bottom:solid 1pt #000000">
						<xsl:value-of select="*[local-name()='RFOrganizationFeatures']/cat_ru:INN"/>
					</td>
					<td class="graphMain center" style="width:35mm"> реквизиты паспорта </td>
					<td class="graphMain center" style="width:85mm;border-bottom:solid 1pt #000000">
						<xsl:apply-templates select="cat_ru:IdentityCard" />
					</td>
				</tr>
				<tr>
					<td class="comment"/>
					<td class="comment center">(ИНН плательщика)</td>
					<td class="comment"/>
					<td class="comment center">(реквизиты паспорта плательщика)</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template match="mrec:Payee">
		<table class="w190 mt">
			<tr>
				<td class="graphMain" style="width:20mm">Получатель:</td>
				<td class="graphMain center" style="width:160mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:OrganizationName"/>
				</td>
			</tr>
			<tr>
				<td class="commetn"/>
				<td class="comment center">(наименование получателя)</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:10mm">ИНН</td>
				<td class="graphMain center" style="width:80mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:INN"/>
				</td>
				<td class="graphMain center" style="width:15mm">КПП</td>
				<td class="graphMain center" style="width:75mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:KPP"/>
				</td>
			</tr>
			<tr>
				<td class="comment"/>
				<td class="comment center">(ИНН получателя)</td>
				<td class="comment"/>
				<td class="comment center">(КПП получателя)</td>
			</tr>
		</table>
		<xsl:apply-templates select="catComFin_ru:Bank" />
	</xsl:template>
	<xsl:template match="mrec:AuthorizedOperator">
		<table class="w190 mt">
			<tr>
				<td class="graphMain" style="width:45mm">Уполномоченный оператор:</td>
				<td class="graphMain center" style="width:135mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="cat_ru:OrganizationName"/>
				</td>
			</tr>
			<tr>
				<td class="commetn"/>
				<td class="comment center">(наименование уполномоченого оператора)</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:10mm">ИНН</td>
				<td class="graphMain center" style="width:80mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="*[local-name()='RFOrganizationFeatures']/cat_ru:INN"/>
				</td>
				<td class="graphMain center" style="width:15mm">КПП</td>
				<td class="graphMain center" style="width:75mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="*[local-name()='RFOrganizationFeatures']/cat_ru:KPP"/>
				</td>
			</tr>
			<tr>
				<td class="comment"/>
				<td class="comment center">(ИНН уполномоченого оператора)</td>
				<td class="comment"/>
				<td class="comment center">(КПП уполномоченого оператора)</td>
			</tr>
		</table>
		<xsl:apply-templates select="catComFin_ru:Bank" />
	</xsl:template>
	<xsl:template match="catComFin_ru:Bank">
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:30mm">Банк получателя</td>
				<td class="graphMain center" style="width:100mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:BankName"/>
				</td>
				<td class="graphMain center" style="width:10mm">БИК</td>
				<td class="graphMain center" style="width:40mm;border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:BIC"/>
				</td>
			</tr>
			<tr>
				<td class="comment"/>
				<td class="comment center">(наименование банка получателя)</td>
				<td class="comment"/>
				<td class="comment center">(БИК банка получателя)</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="graphMain" style="width:30mm">Счет получателя</td>
				<td class="graphMain center" style="width:160mm; border-bottom:solid 1pt #000000">
					<xsl:value-of select="catComFin_ru:PersonalAccount"/>
				</td>
			</tr>
			<tr>
				<td class="comment"/>
				<td class="comment center">(счет органа Федерального казначейства)</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="cat_ru:IdentityCard">
		<xsl:for-each select="cat_ru:IdentityCardSeries|cat_ru:IdentityCardNumber|cat_ru:IdentityCardDate|cat_ru:OrganizationName">
			<xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="mrec:MPO_Registration">
		<xsl:value-of select="mpco:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="MPO_date" select="mpco:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="mpco:MPO_Number"/>
	</xsl:template>
	<xsl:template mode="MPO_date" match="*">
		<xsl:variable name="dateIn" select="."/>
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
</xsl:stylesheet>
