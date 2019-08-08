<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:debt_res="urn:customs.ru:Information:GuaranteeDocuments:DebtCalculationResult:5.13.3">
	<!-- Шаблон для типа DebtCalculationResultType -->
	<xsl:template match="debt_res:DebtCalculationResult">
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
					width: 270mm;
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
					margin-bottom:2mm;
					font-family: Verdana;
					font-size: 11pt;
					}

					.marg-topi
					{
					margin-top:3mm;
					margin-bottom:1mm;
					font-family: Verdana;
					font-size: 10pt;
					font-style:italic;
					}

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					font-family: Verdana;
					font-size: 10pt;
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
					font-size: 9pt;
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
									<font size="3">
										<b>
											<xsl:choose>
												<xsl:when test="debt_res:DocType=0">Результат расчета задолженности</xsl:when>
												<xsl:when test="debt_res:DocType=1">Результат расчета обеспечения<br/>по заявлению о выпуске до подачи</xsl:when>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
						<xsl:if test="cat_ru:RefDocumentID">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</xsl:if>
					</table-->
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Регистрационный номер исходного документа для расчета</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="debt_res:DocNumber"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время формирования электронного документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="debt_res:DocumentDateTime"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(debt_res:DocumentDateTime, 12,8)"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Код результата</td>
							<td class="value graphMain" style="width:50%">

								<xsl:choose>
									<xsl:when test="debt_res:ResultCode=0">успешный расчет</xsl:when>
									<xsl:when test="debt_res:ResultCode=1">не указано направление перемещения</xsl:when>
									<xsl:when test="debt_res:ResultCode=2">не указана дата, на которую производится расчет</xsl:when>
									<xsl:when test="debt_res:ResultCode=9">прочие ошибки</xsl:when>
									<xsl:otherwise>неизвестная ошибка (код: <xsl:value-of select="debt_res:ResultCode"/>)</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<xsl:if test="debt_res:Comment">
							<tr>
								<td class="annot graphMain" style="width:50%">Комментарий </td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="debt_res:Comment"><xsl:value-of select="."/></xsl:for-each>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Общая сумма  задолженности по платежам</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="translate(debt_res:TotalAmount, '.', ',')"/>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Расчет по товарам</div>
					<table class="bordered w190">
						<xsl:for-each select="debt_res:GoodsInfo">
							<tr class="title">
								<td class="value graphMain">Товар № <xsl:value-of select="debt_res:Numeric"/></td>
							</tr>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">
								<tr><td class="annot graphMain"><br/></td></tr>
							</xsl:if>	
						</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="debt_res:AddSupplementaryQuantity| debt_res:SupplementaryQuantity">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode and not(cat_ru:MeasureUnitQualifierName)">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа debt_res:CustomsPaymentCalculationType -->
	<xsl:template match="debt_res:CustomsPaymentCalculation">
		<xsl:param name="f_color"/>
		<td class="graphMain bordered" style="color: {$f_color}"><xsl:value-of select="debt_res:PaymentModeCode"/></td>
		<td class="graphMain bordered" style="color: {$f_color}; word-break: break-all">
			<xsl:value-of select="translate(debt_res:PaymentAmount, '.', ',')"/>
			<xsl:if test="debt_res:PaymentCurrencyCode">
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="debt_res:PaymentCurrencyCode"/>
			</xsl:if>
		</td>
		<td class="graphMain bordered" style="color: {$f_color}; word-break: break-all">
			<xsl:value-of select="translate(debt_res:TaxBase, '.', ',')"/>
			<xsl:if test="debt_res:TaxBaseCurrencyCode">
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="debt_res:TaxBaseCurrencyCode"/>
			</xsl:if>
		</td>
		<td class="graphMain bordered" style="color: {$f_color}">
			<xsl:apply-templates mode="rate" select="."/>
		</td>
		<td class="graphMain bordered" style="color: {$f_color}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="debt_res:RateUseDate"/>
			</xsl:call-template>
		</td>
		<!--td class="graphMain bordered" style="color: {$f_color}">
			<xsl:value-of select="debt_res:PaymentCode"/>
		</td>
		<td class="graphMain bordered" style="color: {$f_color}">
			<xsl:value-of select="translate(debt_res:TariffRate, '.', ',')"/>
		</td-->
		<td class="graphMain bordered" style="color: {$f_color}">
			<xsl:apply-templates select="debt_res:GoodsDescription"/>
		</td>
		<td class="graphMain bordered" style="color: {$f_color}">
			<xsl:apply-templates select="debt_res:CommentPayment"/>
		</td>
	</xsl:template>
	<!-- Шаблон для типа debt_res:GoodsInfoType -->
	<xsl:template match="debt_res:GoodsInfo">
		<tr>
			<td class="annot graphMain">
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:50%">Код результата</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="debt_res:ResultTovarCode=0">успешный расчет</xsl:when>
								<xsl:when test="debt_res:ResultTovarCode=1">в указанном диапазоне кодов ТНВЭД нет ни одного 10-значного кода ТНВЭД для расчета</xsl:when>
								<xsl:when test="debt_res:ResultTovarCode=2">отсутствие в запросе сведений о единицах измерения, являющихся основой начисления для одного и нескольких 10-значных кодов ТНВЭД диапазона</xsl:when>
								<xsl:when test="debt_res:ResultTovarCode=3">отсутствие в запросе сведений о таможенной стоимости товара, являющейся основой начисления платежей</xsl:when>
								<xsl:when test="debt_res:ResultTovarCode=4">не указана страна происхождения для товаров, подлежащих обложению специальными, антидемпинговыми, компенсационными пошлинами</xsl:when>
								<xsl:when test="debt_res:ResultTovarCode=9">прочие ошибки</xsl:when>
								<xsl:otherwise>неизвестная ошибка (код: <xsl:value-of select="debt_res:ResultTovarCode"/>)</xsl:otherwise>
							</xsl:choose>
						</td>					
					</tr>
					<tr>
						<td class="annot graphMain" style="width:50%">Комментарий по товару</td>
						<td class="value graphMain" style="width:50%">
							<xsl:for-each select="debt_res:CommentTovar"><xsl:value-of select="."/></xsl:for-each>
						</td>					
					</tr>
				</table>
				<div class="marg-topi"><u>Информация по товару из запроса</u></div>	
				<xsl:apply-templates select="debt_res:GoodsInquiryInfo"/>
				<div class="marg-topi"><u>Варианты расчета</u></div>
				<table class="bordered w190">
					<tr>
						<td class="graphMain bordered" rowspan="2" style="vertical-align:middle">Статус</td>
						<td class="graphMain bordered" rowspan="2" style="vertical-align:middle">Код ТНВЭД ЕАЭС</td>
						<td class="graphMain bordered" colspan="7">Рассчитанные таможенные платежи</td>
						<td class="graphMain bordered" rowspan="2" style="vertical-align:middle">Сумма платежей по товару</td>
						<td class="graphMain bordered" rowspan="2" style="vertical-align:middle">Комментарий по варианту расчета</td>
					</tr>
					<tr>
						<td class="graphMain bordered" style="vertical-align:middle">Вид платежа</td>
						<td class="graphMain bordered" style="vertical-align:middle">Сумма платежа</td>
						<td class="graphMain bordered" style="vertical-align:middle">Основа начисления</td>
						<td class="graphMain bordered" style="vertical-align:middle">Ставка / ставка рефинансирования</td>
						<td class="graphMain bordered" style="vertical-align:middle">Дата применения ставки</td>
						<!--td class="graphMain bordered" style="vertical-align:middle">Код особенностей уплаты таможенных и иных платежей</td>
						<td class="graphMain bordered" style="vertical-align:middle">Тарифный коэффициент</td-->
						<td class="graphMain bordered" style="vertical-align:middle">Описание товаров, для которых применима ставка</td>
						<td class="graphMain bordered" style="vertical-align:middle">Комментарий по платежу</td>
					</tr>
					<xsl:apply-templates select="debt_res:SelectedVariant"/>
					<xsl:for-each select="debt_res:UnSelectedVariants">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</table>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа debt_res:GoodsInquiryInfoType -->
	<xsl:template match="debt_res:GoodsInquiryInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Ориентировочный код товара по ТН ВЭД ЕАЭС</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="debt_res:TNVEDCode"/></td>
			</tr>
			<xsl:if test="debt_res:GoodsDescription">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание товара</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="debt_res:GoodsDescription"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="debt_res:OriginCountry">
				<tr>
					<td class="annot graphMain" style="width:50%">Код страны происхождения товара</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="debt_res:OriginCountry"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="debt_res:WeightQuantity or debt_res:NetWeightQuantity2 or debt_res:GrossWeightQuantity">
				<tr>
					<td class="annot graphMain" style="width:50%">Вес товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="debt_res:WeightQuantity"> нетто: <xsl:value-of select="translate(debt_res:WeightQuantity, '.', ',')"/> кг. </xsl:if>
						<xsl:if test="debt_res:NetWeightQuantity2"> нетто без упаковки: <xsl:value-of select="translate(debt_res:NetWeightQuantity2, '.', ',')"/>кг. </xsl:if>
						<xsl:if test="debt_res:GrossWeightQuantity"> брутто: <xsl:value-of select="translate(debt_res:GrossWeightQuantity, '.', ',')"/> кг. </xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="debt_res:SupplementaryQuantity or debt_res:AddSupplementaryQuantity">
				<tr>
					<td class="annot graphMain" style="width:50%">Количество товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="debt_res:SupplementaryQuantity"/>
						<xsl:if test="debt_res:SupplementaryQuantity and debt_res:AddSupplementaryQuantity">, </xsl:if>
						<xsl:for-each select="debt_res:AddSupplementaryQuantity">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td class="annot graphMain" style="width:50%">Таможенная стоимость товара (руб)</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(debt_res:CustomsCost, '.', ',')"/></td>
			</tr>
			<xsl:if test="debt_res:TobaccoCost">
				<tr>
					<td class="annot graphMain" style="width:50%">Максимальная розничная цена табачных изделий</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="translate(debt_res:TobaccoCost, '.', ',')"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="debt_res:CheckDate">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата, на которую в расчете производится выбор ставок и курсов валют</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="debt_res:CheckDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа debt_res:VariantCalcType -->
	<xsl:template match="debt_res:UnSelectedVariants| debt_res:SelectedVariant">
		<xsl:variable name="font_color" select="black"/>
		<!--xsl:variable name="font_color">
			<xsl:choose>
				<xsl:when test="contains(name(.),'UnSelectedVariant')">gray</xsl:when>
				<xsl:otherwise>black</xsl:otherwise>
			</xsl:choose>
		</xsl:variable-->
		<xsl:variable name="kol" select="count(debt_res:CustomsPaymentCalculation)"/>
		<tr>
			<td class="graphMain bordered" style="color: {$font_color}" rowspan="{$kol}">
				<xsl:choose>
					<xsl:when test="contains(name(.),'UnSelectedVariant')">отвергнутый вариант</xsl:when>
					<xsl:otherwise>выбранный вариант</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered" style="color: {$font_color}" rowspan="{$kol}">
				<xsl:value-of select="debt_res:TNVEDCode"/>
			</td>
			<xsl:choose>
				<xsl:when test="debt_res:CustomsPaymentCalculation">
					<xsl:apply-templates select="debt_res:CustomsPaymentCalculation[1]">
						<xsl:with-param name="f_color" select="$font_color"/>
					</xsl:apply-templates>
				</xsl:when>
				<xsl:otherwise>
					<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
					<td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/><td class="graphMain bordered"/>
					<td class="graphMain bordered"/>
				</xsl:otherwise>
			</xsl:choose>
			<td class="graphMain bordered" style="color: {$font_color}; word-break: break-all" rowspan="{$kol}">
				<xsl:value-of select="translate(debt_res:TotalTovAmount, '.', ',')"/>
			</td>
			<td class="graphMain bordered" style="color: {$font_color}" rowspan="{$kol}">
				<xsl:for-each select="debt_res:CommentVariant"><xsl:value-of select="."/></xsl:for-each>
			</td>
		</tr>
		<xsl:for-each select="debt_res:CustomsPaymentCalculation[position() &gt; 1]">
			<tr>
				<xsl:apply-templates select=".">
					<xsl:with-param name="f_color" select="$font_color"/>
				</xsl:apply-templates>
			</tr>
		</xsl:for-each>	
	</xsl:template>
	<!-- Шаблон для формирования описания ставки -->
	<xsl:template match="*" mode="rate">
			<xsl:apply-templates mode="rate1" select="."/>
			<xsl:if test="debt_res:Rate3">
				<xsl:if test="debt_res:OperationsSign='+' or not(debt_res:OperationsSign)"> + </xsl:if>
				<xsl:if test="debt_res:OperationsSign='-'">- </xsl:if>
				<xsl:apply-templates mode="rate3" select="."/>
			</xsl:if>
			<xsl:if test="debt_res:Rate2">
				<xsl:if test="debt_res:ComparisonOperationsSign='1' or not(debt_res:ComparisonOperationsSign)">, но не менее </xsl:if>
				<xsl:if test="debt_res:ComparisonOperationsSign='2'">, но не более </xsl:if>
				<xsl:apply-templates mode="rate2" select="."/>
			</xsl:if>
	</xsl:template>
	<!-- Шаблон для ставки 1-->
	<xsl:template match="*" mode="rate1">
		<xsl:variable name="rateval">
			<xsl:choose>
				<xsl:when test="debt_res:Rate and debt_res:Rate!=''"><xsl:value-of select="debt_res:Rate"/></xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="translate(format-number($rateval,'0.######'), '.', ',')"/>
		<xsl:choose>
			<xsl:when test="debt_res:RateTypeCode='%'">%</xsl:when>
			<xsl:when test="debt_res:RateTypeCode!='%' or not(debt_res:RateTypeCode)">
				<xsl:choose>
					<xsl:when test="debt_res:RateCurrencyCode">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="debt_res:RateCurrencyCode"/>
						<xsl:if test="debt_res:RateTNVEDQualifierCode">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="translate(debt_res:WeightingFactor, '.', ',')"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="debt_res:RateTNVEDQualifierCode"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>%</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для ставки 2-->
	<xsl:template match="*" mode="rate2">
		<xsl:value-of select="translate(format-number(debt_res:Rate2,'0.######'), '.', ',')"/>
		<xsl:choose>
			<xsl:when test="debt_res:RateTypeCode2='%'">%</xsl:when>
			<xsl:when test="debt_res:RateTypeCode2!='%' or not(debt_res:RateTypeCode2)">
				<xsl:choose>
					<xsl:when test="debt_res:RateCurrencyCode2">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="debt_res:RateCurrencyCode2"/>
						<xsl:if test="debt_res:RateTNVEDQualifierCode2">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="translate(debt_res:WeightingFactor2, '.', ',')"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="debt_res:RateTNVEDQualifierCode2"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>%</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для ставки 3-->
	<xsl:template match="*" mode="rate3">
		<xsl:value-of select="translate(format-number(debt_res:Rate3,'0.######'), '.', ',')"/>
		<xsl:choose>
			<xsl:when test="debt_res:RateTypeCode3='%'">%</xsl:when>
			<xsl:when test="debt_res:RateTypeCode3!='%' or not(debt_res:RateTypeCode3)">
				<xsl:choose>
					<xsl:when test="debt_res:RateCurrencyCode3">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="debt_res:RateCurrencyCode3"/>
						<xsl:if test="debt_res:RateTNVEDQualifierCode3">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="translate(debt_res:WeightingFactor3, '.', ',')"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="debt_res:RateTNVEDQualifierCode3"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>%</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для даты -->
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
	<xsl:template match="debt_res:PaymentCurrencyCode| debt_res:TaxBaseCurrencyCode| debt_res:RateCurrencyCode| debt_res:RateCurrencyCode2| debt_res:RateCurrencyCode3">
		<xsl:choose>
			<xsl:when test=".='643'">RUB</xsl:when>
			<xsl:when test=".='840'">USD</xsl:when>
			<xsl:when test=".='978'">EUR</xsl:when>
			<xsl:otherwise>
				<xsl:text>(код: </xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>) </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="debt_res:RateTNVEDQualifierCode| debt_res:RateTNVEDQualifierCode2| debt_res:RateTNVEDQualifierCode3">
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
				<xsl:text>(код ЕИ: </xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>)</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="debt_res:DocNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="debt_res:AddNumber"/>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>

	<xsl:template name="num_date">
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
	
</xsl:stylesheet>
