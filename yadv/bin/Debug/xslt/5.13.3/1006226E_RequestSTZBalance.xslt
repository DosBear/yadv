<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rstzb="urn:customs.ru:Information:CustomsDocuments:RequestSTZBalance:5.12.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа RequestSTZBalanceType -->
	<xsl:template match="rstzb:RequestSTZBalance">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div.page {
									width: 260mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
									background: #ffffff;
									border: solid 1pt #000000;
									font-family: Arial;
									font-size: 9pt;
									}

									.marg-top
									{
									margin-top:5mm;
									}

									.marg-t1
									{
									margin-top:8mm;
									margin-bottom:3mm;
									font-size: 11pt;
									}

									table
									{
									width: 100%;
									border: 0;
									empty-cells: show;
									border-collapse: collapse;
									margin-top: 1px;
									font-family: Arial;
									font-size: 9pt;

									}

									table.border tr td
									{
									border: 1px solid gray;
									}

									.graph {
									font-family: Arial;
									font-size: 9pt;
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
						<tr>
							<td align="center" class="graphMain">
								<font size="4">
									<b>Запрос об остатках сырья для переработки по предшествующим ДТ / Запрос на списание остатков сырья</b>
								</font>
							</td>
						</tr>
					</table>
					<xsl:if test="rstzb:DTRegNumber">
						<div class="title marg-t1">Регистрационный номер текущей ДТ</div>
						<xsl:apply-templates select="rstzb:DTRegNumber"/>
					</xsl:if>
					<div class="title marg-t1">Товары текущей ДТ</div>
					<xsl:for-each select="rstzb:DTGoods">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rstzb:DTGoodsType -->
	<xsl:template match="rstzb:DTGoods">
		<table class="bordered w190">
			<tbody>
				<tr class="title" bgcolor="#e3e3e3">
					<td colspan="8">Товар: <xsl:value-of select="rstzb:GoodsNumeric"/></td>
				</tr>	
				<tr>
					<td colspan="8"/>
				</tr>	
				<tr class="title">
					<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
					<td class="graphMain bordered">Описание товара текущей ДТ</td>
					<td class="graphMain bordered">Процедура</td>
					<td class="graphMain bordered">Вес товара, нетто (кг)</td>
					<td class="graphMain bordered">Количество товара в ДЕИ</td>
					<td class="graphMain bordered"> Исчисление таможенных платежей</td>
					<td class="graphMain bordered">Дата принятия решения по товару</td>
					<td class="graphMain bordered">Код решения по товару</td>
				</tr>
				<tr>
					<td class="graphMain bordered">
						<xsl:value-of select="rstzb:GoodsTNVEDCode"/>
					</td>
					<td class="graphMain bordered">
						<xsl:for-each select="rstzb:GoodsDescription"><xsl:value-of select="."/></xsl:for-each>
					</td>
					<td class="graphMain bordered">
						<xsl:if test="rstzb:ESADCustomsProcedure">
							<xsl:apply-templates select="rstzb:ESADCustomsProcedure"/>
						</xsl:if>
					</td>
					<td class="graphMain bordered">
						<xsl:value-of select="translate(rstzb:NetWeightQuantity, '.', ',')"/>
					</td>
					<td class="graphMain bordered">
						<xsl:if test="rstzb:SupplementaryGoodsQuantity">
							<xsl:apply-templates select="rstzb:SupplementaryGoodsQuantity"/>
						</xsl:if>
					</td>
					<td class="graphMain bordered">
						<xsl:value-of select="translate(rstzb:CustomsCost, '.', ',')"/>
					</td>
					<td class="graphMain bordered">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="rstzb:ReleaseDate"/>
						</xsl:call-template>
					</td>
					<td class="graphMain bordered">
						<xsl:value-of select="rstzb:DecisionCode"/>
					</td>
				</tr>
			</tbody>
		</table>
		<xsl:if test="rstzb:ESADout_CUCustomsPaymentCalculation">
			<div class="title marg-top"> Исчисление таможенных платежей</div>
			<xsl:call-template name="CustomsPaymentCalculation"/>
		</xsl:if>
		<xsl:if test="rstzb:PrecedingQuantity">
			<div class="title marg-top">Количество товара в предшествующих ДТ</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<tr>
							<td class="graphMain bordered">Регистрационный номер предшествующей ДТ</td>
							<td class="graphMain bordered">Порядковый номер строки в графе 40 текущей ДТ</td>
							<td class="graphMain bordered">Номер товара в предшествующей ДТ</td>
							<td class="graphMain bordered">Таможенная стоимость товара, указанная в предшествующей ДТ</td>
							<td class="graphMain bordered">Вес нетто товара, вошедшего в состав декларируемого товара</td>
							<td class="graphMain bordered">Количество товара, использованного при изготовлении декларируемого товара в дополнительной единице измерения</td>
						</tr>
					</tr>
					<xsl:for-each select="rstzb:PrecedingQuantity">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template name="CustomsPaymentCalculation">
		<table class="bordered w190">
			<tr class="title">
				<td class="graphMain bordered" rowspan="2" style="vertical-align: middle">Код<br/>вида<br/>платежа</td>
				<td class="graphMain bordered" rowspan="2" style="vertical-align: middle">Сумма платежа</td>
				<td class="graphMain bordered" rowspan="2" style="vertical-align: middle">Основа начисления</td>
				<td class="graphMain bordered" colspan="3" align="center">Ставка</td>
				<td class="graphMain bordered" rowspan="2" style="vertical-align: middle">Дата применения ставки</td>
				<td class="graphMain bordered" rowspan="2" style="vertical-align: middle">Код способа</td>
				<!--td class="graphMain bordered">Количество дней</td>
				<td class="graphMain bordered">Число этапов</td>
				<td class="graphMain bordered">Число полных и неполных календарных месяцев</td>
				<td class="graphMain bordered">Тарифный коэффициент</td-->
				<td class="graphMain bordered" rowspan="2" style="vertical-align: middle">Поряд-<br/>ковый номер строки из гр.40</td>
				<!--td class="graphMain bordered">Номер группы. Для РФ</td-->
			</tr>
			<tr class="title">
				<td class="graphMain bordered" style="vertical-align: middle">Знак операции</td>
				<td class="graphMain bordered" style="vertical-align: middle">Ставка</td>
				<td class="graphMain bordered" style="vertical-align: middle">Результат сравнения</td>
			</tr>
			<xsl:for-each select="rstzb:ESADout_CUCustomsPaymentCalculation">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="rstzb:DTRegNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gdt">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:ESADCustomsProcedureType -->
	<xsl:template match="rstzb:ESADCustomsProcedure">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><br/></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:CUCustomsPaymentCalculationType -->
	<xsl:template match="rstzb:ESADout_CUCustomsPaymentCalculation">
		<xsl:variable name="kol_vo" select="1+count(catESAD_cu:Rate2)+count(catESAD_cu:Rate3)"/>
		<xsl:variable name="kkk" select="1+count(catESAD_cu:Rate3)"/>
		<tr>
			<td class="graphMain bordered" rowspan="{$kol_vo}">
				<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
			</td>
			<td class="graphMain bordered" rowspan="{$kol_vo}">
				<xsl:value-of select="translate(catESAD_cu:PaymentAmount, '.', ',')"/>
				<xsl:if test="catESAD_cu:PaymentCurrencyCode">
					<xsl:apply-templates select="catESAD_cu:PaymentCurrencyCode"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered" rowspan="{$kol_vo}">
				<xsl:value-of select="translate(catESAD_cu:TaxBase, '.', ',')"/>
				<xsl:if test="catESAD_cu:TaxBaseCurrencyCode">
					<xsl:apply-templates select="catESAD_cu:TaxBaseCurrencyCode"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered" align="center"/>
			<td class="graphMain bordered">
				<!--xsl:choose>
					<xsl:when test="catESAD_cu:RateTypeCode='%'">адвалорная</xsl:when>
					<xsl:when test="catESAD_cu:RateTypeCode='S'">РК</xsl:when>
					<xsl:when test="catESAD_cu:RateTypeCode='*'">специфическая</xsl:when>
					<xsl:otherwise><xsl:value-of select="catESAD_cu:RateTypeCode"/></xsl:otherwise>
				</xsl:choose-->
				<xsl:apply-templates mode="rate1" select="."/>
			</td>
			<td class="graphMain bordered" rowspan="{$kkk}">
				<xsl:if test="catESAD_cu:ComparisonResult='1' or catESAD_cu:ComparisonResult='true'">
					применяется основная ставка</xsl:if>
			</td>
			<td class="graphMain bordered" rowspan="{$kol_vo}">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="catESAD_cu:RateUseDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered" rowspan="{$kol_vo}">
				<xsl:value-of select="catESAD_cu:PaymentCode"/>
			</td>
			<td class="graphMain bordered" rowspan="{$kol_vo}">
				<xsl:value-of select="translate(catESAD_cu:LineNumber, '.', ',')"/>
			</td>
			<!--td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:NumberDays"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:NumberStages"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:NumberMonths"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(catESAD_cu:TariffRate, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:NumberGroup"/>
			</td-->
		</tr>
		<xsl:if test="catESAD_cu:Rate3">
			<tr>
				<td class="graphMain bordered" align="center">
					<xsl:value-of select="catESAD_cu:OperationsSign"/>
				</td>
				<td class="graphMain bordered">
					<!--xsl:choose>
						<xsl:when test="catESAD_cu:RateTypeCode3='%'">адвалорная</xsl:when>
						<xsl:when test="catESAD_cu:RateTypeCode3='S'">РК</xsl:when>
						<xsl:when test="catESAD_cu:RateTypeCode3='*'">специфическая</xsl:when>
						<xsl:otherwise><xsl:value-of select="catESAD_cu:RateTypeCode3"/></xsl:otherwise>
					</xsl:choose-->
					<xsl:apply-templates mode="rate3" select="."/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="catESAD_cu:Rate2">
			<tr>
				<td class="graphMain bordered" align="center">
				<xsl:choose>
					<xsl:when test="catESAD_cu:ComparisonOperationsSign='1' or not(catESAD_cu:ComparisonOperationsSign)">
						но не менее</xsl:when>
					<xsl:when test="catESAD_cu:ComparisonOperationsSign='2'">но не более</xsl:when>
					<xsl:otherwise><xsl:value-of select="catESAD_cu:ComparisonOperationsSign"/></xsl:otherwise>
				</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<!--xsl:choose>
						<xsl:when test="catESAD_cu:RateTypeCode2='%'">адвалорная</xsl:when>
						<xsl:when test="catESAD_cu:RateTypeCode2='S'">РК</xsl:when>
						<xsl:when test="catESAD_cu:RateTypeCode2='*'">специфическая</xsl:when>
						<xsl:otherwise><xsl:value-of select="catESAD_cu:RateTypeCode2"/></xsl:otherwise>
					</xsl:choose-->
					<xsl:apply-templates mode="rate2" select="."/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="catESAD_cu:ComparisonResult='0' or catESAD_cu:ComparisonResult='false'">
						применяется альтернативная ставка</xsl:if>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rstzb:PrecedingQuantityType -->
	<xsl:template match="rstzb:PrecedingQuantity">
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="rstzb:DTRegNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rstzb:LineNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rstzb:PrecedingDocumentGoodsNumeric"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rstzb:CustomsCost, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(rstzb:NetWeightQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="rstzb:SupplementaryGoodsQuantity">
					<xsl:apply-templates select="rstzb:SupplementaryGoodsQuantity"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="rstzb:SupplementaryGoodsQuantity">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="russian_date_gdt">
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
	<!-- Шаблон для ставки 1-->
	<xsl:template match="*" mode="rate1">
		<xsl:variable name="rateval">
			<xsl:choose>
				<xsl:when test="catESAD_cu:Rate or catESAD_cu:Rate!=''">
					<xsl:value-of select="catESAD_cu:Rate"/>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="format-number($rateval,'0.######')"/>
		<xsl:choose>
			<xsl:when test="catESAD_cu:RateTypeCode='%'">%</xsl:when>
			<xsl:when test="catESAD_cu:RateTypeCode!='%' or not(catESAD_cu:RateTypeCode)">
				<xsl:choose>
					<xsl:when test="catESAD_cu:RateCurrencyCode">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="catESAD_cu:RateCurrencyCode"/>
						<xsl:if test="catESAD_cu:RateTNVEDQualifierCode">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="catESAD_cu:WeightingFactor"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="catESAD_cu:RateTNVEDQualifierCode"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>%</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для ставки 2-->
	<xsl:template match="*" mode="rate2">
		<xsl:value-of select="format-number(catESAD_cu:Rate2,'0.######')"/>
		<xsl:choose>
			<xsl:when test="catESAD_cu:RateTypeCode2='%'">%</xsl:when>
			<xsl:when test="catESAD_cu:RateTypeCode2!='%' or not(catESAD_cu:RateTypeCode2)">
				<xsl:choose>
					<xsl:when test="catESAD_cu:RateCurrencyCode2">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="catESAD_cu:RateCurrencyCode2"/>
						<xsl:if test="catESAD_cu:RateTNVEDQualifierCode2">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="catESAD_cu:WeightingFactor2"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="catESAD_cu:RateTNVEDQualifierCode2"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>%</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для ставки 3-->
	<xsl:template match="*" mode="rate3">
		<xsl:value-of select="format-number(catESAD_cu:Rate3,'0.######')"/>
		<xsl:choose>
			<xsl:when test="catESAD_cu:RateTypeCode3='%'">%</xsl:when>
			<xsl:when test="catESAD_cu:RateTypeCode3!='%' or not(catESAD_cu:RateTypeCode3)">
				<xsl:choose>
					<xsl:when test="catESAD_cu:RateCurrencyCode3">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="catESAD_cu:RateCurrencyCode3"/>
						<xsl:if test="catESAD_cu:RateTNVEDQualifierCode3">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="catESAD_cu:WeightingFactor3"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="catESAD_cu:RateTNVEDQualifierCode3"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>%</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для валюты-->
	<xsl:template match="catESAD_cu:RateCurrencyCode| catESAD_cu:RateCurrencyCode2| catESAD_cu:RateCurrencyCode3| catESAD_cu:PaymentCurrencyCode| catESAD_cu:TaxBaseCurrencyCode">
		<xsl:choose>
			<xsl:when test=".='643'"> RUB</xsl:when>
			<xsl:when test=".='840'"> USD</xsl:when>
			<xsl:when test=".='978'"> EUR</xsl:when>
			<xsl:otherwise>
				<xsl:text> (код:</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>) </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для единицы измерения-->
	<xsl:template match="catESAD_cu:RateTNVEDQualifierCode| catESAD_cu:RateTNVEDQualifierCode2| catESAD_cu:RateTNVEDQualifierCode3">
		<xsl:choose>
			<xsl:when test=".='006'"> МЕТР</xsl:when>
			<xsl:when test=".='055'"> КВАДРАТНЫЙ МЕТР</xsl:when>
			<xsl:when test=".='111'"> КУБИЧЕСКИЙ САНТИМЕТР</xsl:when>
			<xsl:when test=".='112'"> ЛИТР</xsl:when>
			<xsl:when test=".='113'"> КУБИЧЕСКИЙ МЕТР</xsl:when>
			<xsl:when test=".='114'"> 1000 КУБИЧЕСКИХ МЕТРОВ</xsl:when>
			<xsl:when test=".='117'"> ТОННУ ПОЛНОЙ МАССЫ</xsl:when>
			<xsl:when test=".='118'"> КУБИЧЕСКИЙ МЕТР ПОЛНОГО ОБЪЕМА КУЗОВА</xsl:when>
			<xsl:when test=".='130'"> 1000 ЛИТРОВ</xsl:when>
			<xsl:when test=".='162'"> МЕТРИЧЕСКИЙ КАРАТ</xsl:when>
			<xsl:when test=".='163'"> ГРАММ</xsl:when>
			<xsl:when test=".='166'"> КИЛОГРАММ</xsl:when>
			<xsl:when test=".='168'"> ТОННУ ВЕСА НЕТТО</xsl:when>
			<xsl:when test=".='185'"> ГРУЗОПОДЪЕМНОСТЬ В ТОННАХ</xsl:when>
			<xsl:when test=".='214'"> КИЛОВАТТ</xsl:when>
			<xsl:when test=".='246'"> 1000 КИЛОВАТТ В ЧАС</xsl:when>
			<xsl:when test=".='251'"> ЛОШАДИНУЮ СИЛУ</xsl:when>
			<xsl:when test=".='305'"> КЮРИ</xsl:when>
			<xsl:when test=".='306'"> ГРАММ ДЕЛЯЩИХСЯ ИЗОТОПОВ</xsl:when>
			<xsl:when test=".='715'"> ПАРУ</xsl:when>
			<xsl:when test=".='796'"> ШТУКУ</xsl:when>
			<xsl:when test=".='797'"> СТО ШТУК</xsl:when>
			<xsl:when test=".='798'"> ТЫСЯЧУ ШТУК</xsl:when>
			<xsl:when test=".='831'"> ЛИТР ЧИСТОГО (100%) СПИРТА</xsl:when>
			<xsl:when test=".='841'"> КИЛОГРАММ ПЕРОКСИДА ВОДОРОДА</xsl:when>
			<xsl:when test=".='845'"> КИЛОГРАММ СУХОГО НА 90% ВЕЩЕСТВА</xsl:when>
			<xsl:when test=".='852'"> КИЛОГРАММ ОКСИДА КАЛИЯ</xsl:when>
			<xsl:when test=".='859'"> КИЛОГРАММ ГИДРОКСИДА КАЛИЯ</xsl:when>
			<xsl:when test=".='861'"> КИЛОГРАММ АЗОТА</xsl:when>
			<xsl:when test=".='863'"> КИЛОГРАММ ГИДРОКСИДА НАТРИЯ</xsl:when>
			<xsl:when test=".='865'"> КИЛОГРАММ ПЯТИОКСИДА ФОСФОРА</xsl:when>
			<xsl:when test=".='867'"> КИЛОГРАММ УРАНА</xsl:when>
			<xsl:otherwise>
				<xsl:text> (код ед.изм.:</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>)</xsl:text>
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
