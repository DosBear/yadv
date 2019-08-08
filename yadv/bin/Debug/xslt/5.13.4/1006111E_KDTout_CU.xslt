<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:KDTout="urn:customs.ru:Information:CustomsDocuments:KDTout:5.13.4" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:variable name="k" select="1"/>
   <xsl:variable name="moneyNumberFormat" select="'0.00'"/>
   <xsl:template match="KDTout:GtdRegistryNumber">
      <xsl:apply-templates select="cat_ru:CustomsCode"/>
      <xsl:text> / </xsl:text>
      <xsl:apply-templates mode="dateGtdNumber" select="cat_ru:RegistrationDate"/>
      <xsl:text> / </xsl:text>
      <xsl:apply-templates select="cat_ru:GTDNumber"/>
   </xsl:template>
   <!--Графа B-->
   <xsl:template name="PaymentDetails">
      <b>B</b> ПОДРОБНОСТИ ПОДСЧЁТА<br/>
      <table style="width: 100%; border-collapse: collapse;">
         <tr>
            <th class="tt tb tr">Вид</th>
            <th class="tt tb tr">Сумма</th>
            <th class="tt tb tr">Предыдущая сумма</th>
            <th class="tt tb tr">Изменения</th>
            <th class="tt tb" style="width:45mm;">Номер и дата платёжного поручения</th>
			<th class="tt tb" style="border-left: 1pt solid #000000;width:5mm;">СУ</th>
         </tr>
         <xsl:variable name="paymentDetails" select="//KDTout:KDToutPayments/KDTout:KDToutCustomsPayment"/>
         <xsl:choose>
            <xsl:when test="count($paymentDetails) > 0">
               <xsl:apply-templates select="$paymentDetails"/>
            </xsl:when>
            <xsl:otherwise>
               <tr>
                  <td class="tb tr" style="height: 8px;"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr" style="border-right:0pt;"/>
               </tr>
               <tr>
                  <td class="tb tr" style="height: 8px;"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr" style="border-right:0pt;" />
               </tr>
            </xsl:otherwise>
         </xsl:choose>
         <tr>
            <td colspan="5">
               <!--xsl:text>Общая сумма, взысканных (излишне уплаченных) платежей.</xsl:text-->
               <xsl:text>Общая сумма, подлежащая уплате (взысканию) или возврату</xsl:text> <!-- Решение Коллегии ЕЭК № 289 от 10 декабря 2013 года-->
               <xsl:variable name="paymentAmounts" select="$paymentDetails/catESAD_cu:PaymentAmount"/>
               <xsl:variable name="paymentPrevious" select="$paymentDetails/KDTout:PaymentPrevious"/>
               <xsl:if test="count($paymentAmounts | $paymentPrevious) > 0">
                  <xsl:text>: </xsl:text>
                  <xsl:value-of select="format-number(sum($paymentAmounts) - sum($paymentPrevious), $moneyNumberFormat)"/>
               </xsl:if>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!--Информация о подробностях таможенных плажетей для графы B-->
   <xsl:template match="KDTout:KDToutPayments/KDTout:KDToutCustomsPayment">
      <tr>
         <td class="t">
            <xsl:apply-templates select="catESAD_cu:PaymentModeCode"/>
         </td>
         <td class="t">
            <xsl:apply-templates select="catESAD_cu:PaymentAmount"/>
         </td>
         <td class="t">
            <xsl:apply-templates select="KDTout:PaymentPrevious"/>
         </td>
         <td class="t">
			<xsl:if test="KDTout:ChangeAmount">
				<xsl:value-of select="format-number(KDTout:ChangeAmount,$moneyNumberFormat)"/>
			</xsl:if>
         </td>
         <td class="t" colspan="2">
           <!-- <xsl:apply-templates select="KDTout:PaymentDocument/cat_ru:PrDocumentNumber | KDTout:PaymentDocument/cat_ru:PrDocumentDate"/>-->
           <xsl:for-each select="KDTout:PaymentDocument"><xsl:apply-templates select="."/></xsl:for-each>
         </td>
      </tr>
   </xsl:template>
   <!--Дата платёжного поручения-->
   <xsl:template match="catESAD_cu:DelayPremitDate">
      <xsl:text> от </xsl:text>
      <xsl:apply-templates mode="date" select="."/>
      <xsl:text> г.</xsl:text>
   </xsl:template>
   <xsl:template match="/">
      <html>
         <head>
            <title>Корректировка декларации на товары. Внешний формат</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
							body {background: #CCCCCC; font-size: 7pt;}
							div.page {
							width: 210mm;
							margin: 10px auto;
							padding: 5mm 10mm;
							background: white;
							border: solid 1px black;
							page-break-after: always;
							}
							/*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
							@media print {div.page {border: none; margin: 0; padding: 0;}}

							//.nowrap {white-space: nowrap;}
							h1{font-size: 12pt;}
							table {width: 100%; margin: 0; border: 0; border-spacing: 0; border-collapse: collapse;}
							td, th {padding: 0; vertical-align: top; height: 8px;}
							table.addInfo {border-collapse: collapse;}
							table.addInfo th {border: 1px solid black; background-color: LightGrey;}
							table.addInfo td {border: 1px solid black;}
							hr {border: 0; border-bottom: 1px solid black; margin: 0;}
							.t {border: 1px solid black;}
							.tr, table.paymentInfo .tr {border-right: 1px solid black;}
							.tl {border-left: 1px solid black;}
							.tb, table.paymentInfo .tb {border-bottom: 1px solid black;}
							.tt {border-top: 1px solid black;}
							.b {border: 2px solid black;}
							.br {border-right: 2px solid black;}
							.bl {border-left: 2px solid black;}
							.bb {border-bottom: 2px solid black;}
							.bt {border-top: 2px solid black;}
							.db {border-bottom: 1px dashed black;}
							.dl {border-left: 1px dashed black;}
							.nopadding {padding: 0;}
							.green {background: #FFFFFF;}
							.firstCol {width: 70px; max-width: 70px;}
							table.paymentInfo {border-collapse: collapse; border: 0; width: 100%;}
							table.paymentInfo td.t {border: 1px solid black;}
							table.paymentInfo td, table.paymentInfo th {border: 0;}
							.number {text-align: center; font-size: 11pt; font-weight: bold; vertical-align: middle;}
						</style>
         </head>
         <body>
            <div class="page">
               <xsl:apply-templates select="KDTout:KDTout_CU//KDTout:KDToutGoodsShipment"/>
            </div>
            <!--Выводим товары 2 - ..., группируя их по 3 шт. на лист-->
            <xsl:variable name="allGoods" select="//KDTout:KDToutGoods"/>
            <xsl:for-each select="$allGoods">
               <xsl:if test="(position() - 1) mod 3 = 1">
                  <xsl:variable name="firstEntryPos" select="position()"/>
                  <div class="page">
                     <xsl:call-template name="td4Head"/>
                     <xsl:variable name="firstGoods" select="$allGoods[position() = $firstEntryPos]"/>
                     <xsl:variable name="secondGoods" select="$allGoods[position() = $firstEntryPos + 1]"/>
                     <xsl:variable name="thirdGoods" select="$allGoods[position() = $firstEntryPos + 2]"/>
                     <xsl:call-template name="Goods">
                        <xsl:with-param name="goods" select="$firstGoods"/>
                     </xsl:call-template>
                     <xsl:call-template name="Goods">
                        <xsl:with-param name="goods" select="$secondGoods"/>
                     </xsl:call-template>
                     <xsl:call-template name="Goods">
                        <xsl:with-param name="goods" select="$thirdGoods"/>
                     </xsl:call-template>
                     <table style="margin: 0;">
                        <tr>
                           <td class="tt tr" style="width: 72px;">
                              <b>47</b>Исчисление платежей</td>
                           <td class="tt tb tr" style="width: 45%;">
                              <xsl:call-template name="GoodsPayments">
                                 <xsl:with-param name="goods" select="$firstGoods"/>
                                 <xsl:with-param name="GoodsNumberDescription"> по первому товару</xsl:with-param>
                              </xsl:call-template>
                           </td>
                           <td class="tt tl tb tr">
                              <xsl:call-template name="GoodsPayments">
                                 <xsl:with-param name="goods" select="$secondGoods"/>
                                 <xsl:with-param name="GoodsNumberDescription"> по второму товару</xsl:with-param>
                              </xsl:call-template>
                           </td>
                        </tr>
                        <tr>
                           <td class="tr tt"/>
                           <td class="tr bb tt">
                              <xsl:call-template name="GoodsPayments">
                                 <xsl:with-param name="goods" select="$thirdGoods"/>
                                 <xsl:with-param name="GoodsNumberDescription"> по третьему товару</xsl:with-param>
                              </xsl:call-template>
                           </td>
                           <td class="tl tt"/>
                        </tr>
                     </table>
                  </div>
               </xsl:if>
            </xsl:for-each>
            <xsl:if test="//KDTout:GoodsAutomobile">
               <div class="page">
                  <xsl:apply-templates mode="automobile" select="$allGoods"/>
               </div>
            </xsl:if>
         </body>
      </html>
   </xsl:template>
   <!--Верхняя часть листа КТД-->
   <xsl:template name="td4Head">
      <table border="0" style="width: 100%; border-collapse: collapse; font-size: 7pt;">
         <tr>
            <td class="firstCol tb" rowspan="7"/>
            <td class="header nowrap" colspan="5">ДОПОЛНИТЕЛЬНЫЙ ЛИСТ К ФОРМЕ КОРРЕКТИРОВКИ</td>
            <td class="tl nowrap" colspan="6">
               <b>А</b>
               <xsl:apply-templates select="//KDTout:GtdRegistryNumber"/>
            </td>
         </tr>
         <tr>
            <td class="tb">
               <table class="inline">
                  <tr>
                     <td class="header">ДЕКЛАРАЦИИ НА ТОВАРЫ (КДТ-2)</td>
                     <td class="blankNumber" title="Номер бланка"/>
                  </tr>
               </table>
            </td>
            <td class="bl bt br" colspan="4">
               <b>1</b> ДЕКЛАРАЦИЯ</td>
            <td colspan="6"/>
         </tr>
         <tr>
            <td class="tl green">
               <table class="inline">
                  <tr>
                     <td class="nowrap" style="width: 40%;">
                        <b>2</b> Отправитель/<i>Экспортер</i>
                     </td>
                     <td class="nowrap" style="width: 40%;">
                        <!--b>8</b> Получатель-->
                     </td>
                     <td>№</td>
                  </tr>
               </table>
            </td>
            <td class="bl br" colspan="4"/>
            <td class="bl" colspan="6"/>
         </tr>
         <tr>
            <td class="tl green br tb" rowspan="3">
				<xsl:if test="//KDTout:CustomsProcedure='ЭК'">
					<!-- Отправитель -->
					<xsl:choose>
						<xsl:when test="KDTout:KDToutGoodsOrganization">
							<xsl:apply-templates mode="org" select="KDTout:KDToutGoodsOrganization"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="//KDTout:KTDoutConsignor"><xsl:apply-templates select="."/></xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>	
				</xsl:if>
               <!--xsl:apply-templates mode="org" select="//KDTout:KTDoutConsignor"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text-->
				<hr/>
				<b>8</b> Получатель<br/>
				<xsl:if test="//KDTout:CustomsProcedure='ИМ'">
					<!-- Получатель -->
					<xsl:choose>
						<xsl:when test="KDTout:KDToutGoodsOrganization">
							<xsl:apply-templates mode="org" select="KDTout:KDToutGoodsOrganization"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="//KDTout:KTDoutConsignee"><xsl:apply-templates select="."/></xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>					
				</xsl:if>
               <!--xsl:apply-templates mode="org" select="//KDTout:KTDoutConsignee"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text-->
            </td>
            <td colspan="4" style="vertical-align: bottom;">
               <table class="inline">
                  <tr>
                     <td style="width: 30%;"/>
                     <td style="width: 2%; ">
                        <b>C</b>
                     </td>
                     <td class="tr"/>
                     <td style="width: 52.9%;">
                        <b>BIS</b>
                     </td>
                  </tr>
               </table>
            </td>
            <td class="bl" colspan="6"/>
         </tr>
         <tr>
            <td colspan="2" rowspan="2" style="border-top:solid 0.8pt black;border-right:solid 0.8pt black;border-bottom:solid 1.5pt black;">
               <b>3</b> Формы</td>
            <td colspan="2" rowspan="2" style="border-top:solid 0.8pt black;border-right:solid 1.5pt black;border-bottom:solid 1.5pt black;"/>
         </tr>
      </table>
   </xsl:template>
   <!--Дополнительные сведения по внешнеторговым контрактам. Заполняется при подаче ВГТД-->
   <xsl:template match="KDTout:KDToutGoods" mode="automobile">
      <h1>Данные по транспортному средству из товара № <xsl:apply-templates select="catESAD_cu:GoodsNumeric"/>
      </h1>
      <table class="addInfo">
         <tr>
            <th>Модель</th>
            <th style="width: 1%;">Марка</th>
            <th style="width: 1%;">Год изготовления</th>
            <th style="width: 1%;">Рабочий объем двигателя, куб. см</th>
            <th>Идентиф-й № кузова</th>
            <th>Двигатель</th>
            <th>Идентиф-й № шасси (рамы)</th>
            <th>№ удостоверения</th>
            <th>Стоимость</th>
            <th>Грузоподъемность/Мощность</th>
            <th>Пробег</th>
         </tr>
         <xsl:apply-templates select="KDTout:GoodsAutomobile"/>
      </table>
   </xsl:template>
   <xsl:template match="KDTout:GoodsAutomobile">
      <tr>
         <td>
            <xsl:apply-templates select="cat_ru:Model"/>
         </td>
         <td>
            <xsl:apply-templates select="cat_ru:Mark"/>
         </td>
         <td>
            <xsl:apply-templates select="cat_ru:OfftakeYear"/>
         </td>
         <td>
            <xsl:apply-templates select="cat_ru:EngineVolumeQuanity"/>
         </td>
         <td>
            <xsl:apply-templates select="cat_ru:Mark"/>
         </td>
         <td>
            <xsl:apply-templates select="cat_ru:EngineID"/>
         </td>
         <td>
            <xsl:apply-templates select="cat_ru:ChassisID"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_cu:IdentityCardNumber"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_cu:CarCost"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_cu:PowerWeightQuanity"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_cu:PassedKilometerQuantity"/>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="*" mode="commaSeparated">
      <xsl:if test="position() > 1">
         <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:apply-templates select="."/>
   </xsl:template>
   <xsl:template match="*" mode="spaceSeparated">
      <xsl:if test="position() > 1">
         <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:apply-templates select="."/>
   </xsl:template>
   <xsl:template match="catESAD_cu:OriginCountryName">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="catESAD_cu:InvoicedCost">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="catESAD_cu:ContractCurrencyCode">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="cat_ru:MeasureUnitQualifierCode">
      <xsl:text>(</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>)</xsl:text>
   </xsl:template>
   <xsl:template match="catESAD_cu:DeliveryTerms">
      <br/>
      <xsl:if test="cat_ru:DeliveryTermsStringCode">
         <i>Код условий поставки по Инкотермс: </i>
         <xsl:apply-templates select="cat_ru:DeliveryTermsStringCode"/>
      </xsl:if>
      <xsl:if test="cat_ru:DeliveryPlace">
         <i> Описание / Название географического пункта</i>
         <xsl:apply-templates mode="spaceSeparated" select="cat_ru:DeliveryPlace"/>
      </xsl:if>
      <xsl:if test="cat_ru:TransferPlace">
         <i> Место передачи товара </i>
         <xsl:apply-templates mode="spaceSeparated" select="cat_ru:TransferPlace"/>
      </xsl:if>
      <xsl:if test="cat_ru:DeliveryTermsRBCode">
         <i> Код вида поставки товаров в соответствии с классификатором видов поставок товаров, подлежащих учету при осуществлении экспортных операций, применяемым в Республике Беларусь </i>
         <xsl:apply-templates mode="spaceSeparated" select="cat_ru:DeliveryTermsRBCode"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:PrDocumentNumber">
      <i> № </i>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="cat_ru:PrDocumentDate">
      <i> дата: </i>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="."/>
      </xsl:call-template>
   </xsl:template>

<!-- Проверка на совпадение данных с гр.14 ДТ -->
	<xsl:template match="KDTout:KTDoutConsignor| KDTout:KTDoutConsignee| KDTout:KTDoutFinancialAdjustingResponsiblePerson">
		<xsl:choose>
			<xsl:when test="KDTout:DeclarantEqualFlag='1' or KDTout:DeclarantEqualFlag='true' or KDTout:DeclarantEqualFlag='True' or KDTout:DeclarantEqualFlag='t'">СМ. ГРАФУ 14 КДТ</xsl:when>
			<xsl:otherwise><xsl:apply-templates mode="org" select="."/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
<!-- Реквизиты организации -->	
   <xsl:template match="*" mode="org">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <span class="graph">(</span>
         <xsl:value-of select="cat_ru:ShortName"/>
         <span class="graph">)</span>
      </xsl:if>
		<xsl:if test="KDTout:ContractorIndicator='1'"> 'контрагент'</xsl:if>
		<xsl:if test="KDTout:ContractorIndicator='2'"> 'РАЗНЫЕ ПО СПИСКУ'</xsl:if>
      <br/>
      <xsl:if test="cat_ru:Address/cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:Address/cat_ru:PostalCode"/>,
        </xsl:if>
      <!--<xsl:apply-templates select="cat_ru:Address/cat_ru:CountryCode | catESAD_cu:CountryCode"/>,-->
      <xsl:value-of select="cat_ru:Address/cat_ru:CounryName"/> 
        <xsl:if test="cat_ru:Address/cat_ru:Region">
         <xsl:value-of select="cat_ru:Address/cat_ru:Region"/>,
        </xsl:if>
      <xsl:if test="cat_ru:Address/cat_ru:City">
         <xsl:value-of select="cat_ru:Address/cat_ru:City"/>,
        </xsl:if>
      <xsl:value-of select="cat_ru:Address/cat_ru:StreetHouse"/>
      <xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
         <br/>
         <xsl:text>№ </xsl:text>
         <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
            <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
         </xsl:if>
         <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
            <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
         </xsl:if>
      </xsl:if>
      <br/>
      <xsl:apply-templates select="cat_ru:IdentityCard"/>
   </xsl:template>
   <!--Товарная партия-->
   <xsl:template match="KDTout:KDToutGoodsShipment">
      <table>
         <tr>
            <td class="graphMain" colspan="2" style="width:{103*$k}mm;">ФОРМА КОРРЕКТИРОВКИ ДЕКЛАРАЦИИ НА ТОВАРЫ</td>
            <td style="width:{26.4*$k}mm;"/>
            <td class="tl" style="width:{60.6*$k}mm;border-left:solid 0.8pt black;" valign="top">
               <b>А </b>
               <xsl:apply-templates select="/KDTout:KDTout_CU/KDTout:GtdRegistryNumber"/>
            </td>
         </tr>
         <tr>
            <td align="center" class="firstCol b">1</td>
            <td rowspan="3" style="border:solid 0.8pt black;background:#FFFFFF;">
               <table width="100%">
                  <tr>
                     <td>
                        <b>2</b> Отправитель/<i>Экспортер</i>
                     </td>
                     <td>
                        <xsl:text>№ </xsl:text>
                        <xsl:if test="KDTout:KTDoutConsignor/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
                           <xsl:value-of select="KDTout:KTDoutConsignor/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                        </xsl:if>
                        <xsl:if test="KDTout:KTDoutConsignor/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
                           <xsl:value-of select="KDTout:KTDoutConsignor/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                           <xsl:if test="KDTout:KTDoutConsignor/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
									/
								</xsl:if>
                        </xsl:if>
                        <xsl:if test="KDTout:KTDoutConsignor/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
                           <xsl:value-of select="KDTout:KTDoutConsignor/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                        </xsl:if>
                        <xsl:if test="KDTout:KTDoutConsignor/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                           <xsl:value-of select="KDTout:KTDoutConsignor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                           <xsl:if test="KDTout:KTDoutConsignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
									/
								</xsl:if>
                        </xsl:if>
                        <xsl:if test="KDTout:KTDoutConsignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                           <xsl:value-of select="KDTout:KTDoutConsignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">
                        <xsl:apply-templates select="KDTout:KTDoutConsignor"/>
                     </td>
                  </tr>
               </table>
            </td>
            <td class="b green">
               <b>1</b> ДЕКЛАРАЦИЯ
                    <table width="100%">
                  <tr>
                     <td align="center" class="tr" rowspan="2">
                        <xsl:apply-templates select="parent::node()/KDTout:CustomsProcedure"/>
                     </td>
                     <td align="center" class="tr" rowspan="2">
                        <xsl:apply-templates select="parent::node()/KDTout:CustomsModeCode"/>
                     </td>
                     <td align="center" rowspan="2">
                        <xsl:apply-templates select="parent::node()/KDTout:ElectronicDocumentSign"/>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="b" rowspan="9"/>
            <td class="t green">
               <table width="100%">
                  <tr>
                     <td colspan="2" style="border-right:solid 0.8pt black;">
                        <b>3</b> Формы</td>
                     <td rowspan="2">
                        <b>4</b> Отгр. спец. <br/>
                        <xsl:apply-templates select="catESAD_cu:SpecificationNumber"/>
                        <xsl:if test="catESAD_cu:SpecificationNumber and catESAD_cu:SpecificationListNumber">
                           <xsl:text> / </xsl:text>
                        </xsl:if>
                        <xsl:apply-templates select="catESAD_cu:SpecificationListNumber"/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" style="border-right:solid 0.8pt black; width:3mm"/>
                     <td align="center" style="border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
                        <xsl:apply-templates select="catESAD_cu:TotalSheetNumber"/>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="green nopadding" colspan="2">
               <table width="100%">
                  <tr>
                     <td class="t">
                        <b>5</b>
                                Всего т-ов
                                <br/>
                        <xsl:if test="catESAD_cu:TotalGoodsNumber != '0'">
                           <xsl:value-of select="catESAD_cu:TotalGoodsNumber"/>
                        </xsl:if>
                     </td>
                     <td class="t">
                        <b>6</b>
                                Всего мест
                                <br/>
                        <xsl:choose>
                           <xsl:when test="catESAD_cu:TotalPackageNumber!=''">
                              <xsl:value-of select="catESAD_cu:TotalPackageNumber"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td class="t">
                        <b>7</b>
                                Справочный номер
                                <br/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="parent::node()/KDTout:DeclarationKind"/>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td rowspan="2" style="border:solid 0.8pt black;background:#FFFFFF;">
               <table width="100%">
                  <tr>
                     <td>
                        <b>8</b>
                                Получатель
                            </td>
                     <td>
                        <xsl:text>№ </xsl:text>
                        <xsl:if test="KDTout:KTDoutConsignee/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
                           <xsl:value-of select="KDTout:KTDoutConsignee/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                        </xsl:if>
                        <xsl:if test="KDTout:KTDoutConsignee/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
                           <xsl:value-of select="KDTout:KTDoutConsignee/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>/
								</xsl:if>
                        <xsl:if test="KDTout:KTDoutConsignee/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
                           <xsl:value-of select="KDTout:KTDoutConsignee/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                        </xsl:if>
                        <xsl:if test="KDTout:KTDoutConsignee/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                           <xsl:value-of select="KDTout:KTDoutConsignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                        </xsl:if>
                        <xsl:if test="KDTout:KTDoutConsignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                           <xsl:text> / </xsl:text>
                           <xsl:value-of select="KDTout:KTDoutConsignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">
                        <xsl:apply-templates select="KDTout:KTDoutConsignee"/>
                     </td>
                  </tr>
               </table>
            </td>
            <td class="t" colspan="2" style="height: 25px;">
               <b>9</b>
                    Лицо, ответственное за финансовое урегулирование<br/>
               <xsl:if test="KDTout:KTDoutFinancialAdjustingResponsiblePerson">
				   <xsl:for-each select="KDTout:KTDoutFinancialAdjustingResponsiblePerson">
						<xsl:choose>
						<xsl:when test="KDTout:DeclarantEqualFlag='1' or KDTout:DeclarantEqualFlag='true' or KDTout:DeclarantEqualFlag='True' or KDTout:DeclarantEqualFlag='t'">СМ. ГРАФУ 14 КДТ</xsl:when>
							<xsl:otherwise>
								<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
									 <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
									 <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
									 <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
									 <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
								</xsl:if>
								<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
									 <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
								</xsl:if>
								<br/>
								<xsl:value-of select="cat_ru:OrganizationName"/>
								<xsl:if test="cat_ru:ShortName!=''">
									(
									<xsl:value-of select="cat_ru:ShortName"/>
									)
								</xsl:if>
								<br/>
								<xsl:if test="cat_ru:Address/cat_ru:PostalCode">
									 <xsl:value-of select="cat_ru:Address/cat_ru:PostalCode"/>,
								</xsl:if>
								<!--<xsl:value-of select="cat_ru:Address/cat_ru:CountryCode"/>,-->
								<xsl:value-of select="cat_ru:Address/cat_ru:CounryName"/> 
								<xsl:if test="cat_ru:Address/cat_ru:Region">
									 <xsl:value-of select="cat_ru:Address/cat_ru:Region"/>,
								</xsl:if>
								<xsl:if test="cat_ru:Address/cat_ru:City">
									 <xsl:value-of select="cat_ru:Address/cat_ru:City"/>,
								</xsl:if>
								<xsl:value-of select="cat_ru:Address/cat_ru:StreetHouse"/>
								<xsl:if test="KDTout:BranchDescription">
									<br/>
									<xsl:value-of select="KDTout:BranchDescription/cat_ru:OrganizationName"/>
									<br/>
									<xsl:if test="KDTout:BranchDescription/cat_ru:Address/cat_ru:PostalCode">
										<xsl:value-of select="KDTout:BranchDescription/cat_ru:Address/cat_ru:PostalCode"/>,
									</xsl:if>
									<!--<xsl:value-of select="KDTout:BranchDescription/cat_ru:Address/cat_ru:CountryCode"/>,-->
									<xsl:value-of select="KDTout:BranchDescription/cat_ru:Address/cat_ru:CounryName"/> 
									<xsl:if test="KDTout:BranchDescription/cat_ru:Address/cat_ru:Region">
										<xsl:value-of select="KDTout:BranchDescription/cat_ru:Address/cat_ru:Region"/>,
									</xsl:if>
									<xsl:if test="KDTout:BranchDescription/cat_ru:Address/cat_ru:City">
										<xsl:value-of select="KDTout:BranchDescription/cat_ru:Address/cat_ru:City"/>,
									</xsl:if>
									<xsl:value-of select="KDTout:BranchDescription/cat_ru:Address/cat_ru:StreetHouse"/>
								</xsl:if>
								<xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:UNP">
									 <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
								</xsl:if>
								<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:BIN">
									 <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>/
								</xsl:if>
								<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:IIN">
									 <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
								</xsl:if>
								<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
									 <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</xsl:if>
								<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
									 <xsl:text> / </xsl:text>
									 <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
								</xsl:if>
								<br/>
								<xsl:apply-templates select="cat_ru:IdentityCard"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:if>
            </td>
         </tr>
         <tr>
            <td colspan="2" style="border:solid 0.8pt black;">
               <table style="width:100%;">
                  <tr>
                     <td colspan="2" style="border-left:solid 1.5pt black;">
                        <b>10</b>
                                Стр.перв.назнач/<br/>  послед.отправл
                            </td>
                     <td colspan="2" style="border-left:solid 2pt black;border-right:solid 0.8pt black;">
                        <b>11</b>
                                Торг. страна
                            </td>
                     <td colspan="2" style="border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
                        <b>12</b>
                                Общая таможенная стоимость
                                <!--<br/>
                        <xsl:value-of select="catESAD_cu:TotalCustCost"/>-->
                     </td>
                     <td class="graph" rowspan="2" style="width:{11.8*$k}mm;border-left:solid 0.8pt black;">
                        <span class="graphNo">13</span>
                        <span class="graph"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" style="border-left:solid 1.5pt black;border-right:solid 2pt black;border-bottom:solid 1.5pt black;">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td/>
                     <td align="center" style="border-bottom:solid 1.5pt black;border-left:solid 2pt black;border-right:solid 2pt black;">
                        <xsl:choose>
                           <xsl:when test="KDTout:KDToutMainContractTerms/catESAD_cu:TradeCountryCode!=''">
                              <xsl:value-of select="KDTout:KDToutMainContractTerms/catESAD_cu:TradeCountryCode"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td style="border-right:solid 0.8pt black;">
                        <xsl:choose>
                           <xsl:when test="KDTout:KDToutMainContractTerms/catESAD_cu:RBCountryCode!=''">
                              <xsl:value-of select="KDTout:KDToutMainContractTerms/catESAD_cu:RBCountryCode"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td style="border-bottom:solid 0pt black;border-left:solid 0pt black;border-right:solid 1.5pt black;" align="center">
							 <xsl:if test="catESAD_cu:TotalCustCost">
								 <xsl:value-of select="format-number(catESAD_cu:TotalCustCost,'0.00')"/>
							 </xsl:if>
							</td>
							<td style="border-bottom:solid 0pt black;border-left:solid 0pt black;border-right:solid 0pt black;" align="center">
								<xsl:if test="KDTout:PreviousTotalCustomsAmount">
									<xsl:value-of select="format-number(KDTout:PreviousTotalCustomsAmount,'0.00')"/>
								</xsl:if>
							</td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td rowspan="2" style="border:solid 0.8pt black;">
               <table width="100%">
                  <tr>
                     <td>
                        <b>14</b>
                                Декларант
                            </td>
                     <td>
                        <xsl:text>№ </xsl:text>
                        <!--xsl:value-of select="KDTout:KTDoutDeclarant/cat_ru:OGRN"/-->
                        <xsl:if test="KDTout:KTDoutDeclarant/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
                           <xsl:value-of select="KDTout:KTDoutDeclarant/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                        </xsl:if>
                        <xsl:if test="KDTout:KTDoutDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
                           <xsl:value-of select="KDTout:KTDoutDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                           <xsl:if test="KDTout:KTDoutDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
									/
								</xsl:if>
                        </xsl:if>
                        <xsl:if test="KDTout:KTDoutDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
                           <xsl:value-of select="KDTout:KTDoutDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                        </xsl:if>
                        <xsl:if test="KDTout:KTDoutDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                           <xsl:value-of select="KDTout:KTDoutDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                           <xsl:if test="KDTout:KTDoutDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
								/
									<!--<xsl:value-of select="KDTout:KTDoutDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>-->
                           </xsl:if>
                        </xsl:if>
                        <xsl:if test="KDTout:KTDoutDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                           <xsl:value-of select="KDTout:KTDoutDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">
                        <xsl:apply-templates select="KDTout:KTDoutDeclarant"/>
                        <xsl:if test="KDTout:KTDoutDeclarant/KDTout:BranchDescription">
                           <br/>Подразделение:
                           <xsl:value-of select="KDTout:KTDoutDeclarant/KDTout:BranchDescription/cat_ru:OrganizationName"/>
                           <br/>
                           <xsl:value-of select="KDTout:KTDoutDeclarant/KDTout:BranchDescription/cat_ru:Address/cat_ru:PostalCode"/>,
                                        
                           <!--<xsl:value-of select="KDTout:KTDoutDeclarant/KDTout:BranchDescription/cat_ru:Address/cat_ru:CountryCode"/>,-->
                           <xsl:value-of select="KDTout:KTDoutDeclarant/KDTout:BranchDescription/cat_ru:Address/cat_ru:CounryName"/> 
                                        <xsl:value-of select="KDTout:KTDoutDeclarant/KDTout:BranchDescription/cat_ru:Address/cat_ru:Region"/>,
                                        <xsl:value-of select="KDTout:KTDoutDeclarant/KDTout:BranchDescription/cat_ru:Address/cat_ru:City"/>,
                                        <xsl:value-of select="KDTout:KTDoutDeclarant/KDTout:BranchDescription/cat_ru:Address/cat_ru:StreetHouse"/>
                        </xsl:if>
                     </td>
                  </tr>
               </table>
            </td>
            <td colspan="2" style="border:solid 0.8pt black;">
               <table width="100%">
                  <tr>
                     <td style="height: 25px;border-bottom:solid 1pt black;">
                        <b>15</b> Страна отправления
								<br/>
                        <xsl:value-of select="KDTout:KTDoutConsigment/catESAD_cu:DispatchCountryName"/>
                     </td>
                     <td style="width:{23.7*$k}mm;vertical-align: bottom;border-left:solid 0.8pt black;">
                        <table cellpadding="0" cellspacing="0" style="width:100%;">
                           <tr>
                              <td class="graph" colspan="4" style="width:{25.6*$k}mm;" valign="top">
                                 <span class="graphNo">15</span>
                                 <span class="graph">Код страны <br/>отпр.</span>
                              </td>
                           </tr>
                           <tr>
                              <br/>
                              <td class="graph" style="width:{2.2*$k}mm;border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;">a
                                </td>
                              <td align="center" class="graph" style="width:{9.6*$k}mm;border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;">
                                 <xsl:choose>
                                    <xsl:when test="KDTout:KTDoutConsigment/catESAD_cu:DispatchCountryCode!=''">
                                       <xsl:value-of select="KDTout:KTDoutConsigment/catESAD_cu:DispatchCountryCode"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td class="graph" style="width:{2.2*$k}mm;border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;">b
                                    </td>
                              <td align="center" class="graph" style="width:{7.6*$k}mm;border-bottom:solid 0.8pt black;">
                                 <xsl:choose>
                                    <xsl:when test="KDTout:KTDoutConsigment/catESAD_cu:RBDispatchCountryCode!=''">
                                       <xsl:value-of select="KDTout:KTDoutConsigment/catESAD_cu:RBDispatchCountryCode"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                           </tr>
                        </table>
                     </td>
                     <td style="width:{22.7*$k}mm;vertical-align: bottom;border-left:solid 0.8pt black;">
                        <table cellpadding="0" cellspacing="0" style="width:100%;">
                           <tr>
                              <td class="graph" colspan="4" style="width:{25.6*$k}mm;">
                                 <span class="graphNo">17</span>
                                 <span class="graph">Код страны назнач.</span>
                              </td>
                           </tr>
                           <tr>
                              <br/>
                              <td class="graph" style="width:{2.2*$k}mm;border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;">a
                                </td>
                              <td align="center" class="graph" style="width:{9.6*$k}mm;border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;">
                                 <xsl:choose>
                                    <xsl:when test="KDTout:KTDoutConsigment/catESAD_cu:DestinationCountryCode!=''">
                                       <xsl:value-of select="KDTout:KTDoutConsigment/catESAD_cu:DestinationCountryCode"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td class="graph" style="width:{2.2*$k}mm;border-right:solid 0.8pt black;border-bottom:solid 0.8pt black;">b
                                    </td>
                              <td align="center" class="graph" style="width:{7.6*$k}mm;border-bottom:solid 0.8pt black;">
                                 <xsl:choose>
                                    <xsl:when test="KDTout:KTDoutConsigment/catESAD_cu:RBDestinationCountryCode!=''">
                                       <xsl:value-of select="KDTout:KTDoutConsigment/catESAD_cu:RBDestinationCountryCode"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td colspan="2" style="border-right:solid 0.8pt black;border-top:solid 1pt #FFFFFF;border-left:solid 0.8pt black;border-bottom:solid 0.8pt black;">
               <table width="100%" style="border-right:solid 0pt black;border-top:solid 0pt black;border-left:solid 0pt black;border-bottom:solid 0pt black;">
                  <tr>
                     <td class="tr" style="height: 25px;border:solid 0pt black;" width="46%">
                        <b>16</b> Страна происхождения<br/>
                        <xsl:apply-templates select="catESAD_cu:OriginCountryName"/>
                     </td>
                     <td style="border-left:solid 0.8pt black;border-top:solid 0pt black;background:#FFFFFF;" width="54%">
                        <b>17</b> Страна назначения<br/>
                        <xsl:apply-templates select="KDTout:KTDoutConsigment/catESAD_cu:DestinationCountryName"/>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="t" colspan="3">
               <table width="100%">
                  <tr>
                     <td class="green" colspan="2" width="44.9%">
                        <b>18</b> Идентификация и страна регистрации трансп.средства при отправлении
                            </td>
                     <td rowspan="2" style="border-left:solid 2pt black;border-bottom:solid 1.5pt black;border-right:solid 1pt black;background:#FFFFFF;" width="10%">
                        <b>19</b> Конт.<br/>
                        <xsl:choose>
                           <xsl:when test="(number(KDTout:KTDoutConsigment/catESAD_cu:ContainerIndicator)=1) or (KDTout:KTDoutConsigment/catESAD_cu:ContainerIndicator='t') or (KDTout:KTDoutConsigment/catESAD_cu:ContainerIndicator='true')">
                                        1
                                    </xsl:when>
                           <xsl:when test="(number(KDTout:KTDoutConsigment/catESAD_cu:ContainerIndicator)=0) or (KDTout:KTDoutConsigment/catESAD_cu:ContainerIndicator='f') or (KDTout:KTDoutConsigment/catESAD_cu:ContainerIndicator='false')">
                                        0
                                    </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td colspan="3" style="border-left:solid 1pt black;" width="45%">
                        <b>20</b>
                                Условия поставки
                            </td>
                  </tr>
                  <tr>
                     <td class="green" width="34.9%">
                        <xsl:choose>
                            <xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutDepartureArrivalTransport">
                                <xsl:value-of select="KDTout:KTDoutConsigment/KDTout:KDToutDepartureArrivalTransport/KDTout:TransportMeansQuantity"/>:
								<xsl:for-each select="KDTout:KTDoutConsigment/KDTout:KDToutDepartureArrivalTransport/KDTout:TransportMeans[not(cat_ru:ActiveTransportIdentifier)]">
									<xsl:variable name="ActiveTSNum" select="cat_ru:TransportIdentifier"/>
									<xsl:value-of select="$ActiveTSNum"/>
									<xsl:for-each select="../KDTout:TransportMeans[cat_ru:ActiveTransportIdentifier=$ActiveTSNum]">
										<xsl:text>/</xsl:text>
										<xsl:value-of select="cat_ru:TransportIdentifier"/>
									</xsl:for-each>
									<xsl:if test="position()!=last()">; </xsl:if>
								</xsl:for-each>
                            </xsl:when>
							<xsl:otherwise>
								<xsl:text> </xsl:text>
							</xsl:otherwise>
						</xsl:choose>
                              
						<xsl:choose>
							<xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutDepartureArrivalTransport/KDTout:MethodTransport=1">газопровод:</xsl:when>
							<xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutDepartureArrivalTransport/KDTout:MethodTransport=2">нефтепровод:</xsl:when>
							<xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutDepartureArrivalTransport/KDTout:MethodTransport=3">нефтепродуктопровод:</xsl:when>
							<xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutDepartureArrivalTransport/KDTout:MethodTransport=4">линия электропередач:</xsl:when>
						</xsl:choose>
						
						<xsl:if test="KDTout:KTDoutConsigment/KDTout:KDToutDepartureArrivalTransport/KDTout:NameObject">
							<xsl:value-of select="KDTout:KTDoutConsigment/KDTout:KDToutDepartureArrivalTransport/KDTout:NameObject"/>
						</xsl:if>

                     </td>
                     <td align="center" style="border-left:solid 2pt black;border-bottom:solid 1.5pt black;background:#FFFFFF;" width="10%">
                        <xsl:choose>
                           <xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutDepartureArrivalTransport/cat_ru:TransportNationalityCode">
                              <xsl:value-of select="KDTout:KTDoutConsigment/KDTout:KDToutDepartureArrivalTransport/cat_ru:TransportNationalityCode"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td align="center" style="border-left:solid 1pt black;border-bottom:solid 1.5pt black;border-right:solid 2pt black;" width="15%">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td width="15%">
                        <xsl:choose>
                           <xsl:when test="KDTout:KDToutMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryTermsStringCode!=''">
                              <xsl:value-of select="KDTout:KDToutMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryTermsStringCode"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                           <xsl:when test="KDTout:KDToutMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryPlace!=''">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:for-each select="KDTout:KDToutMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryPlace">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                        <xsl:value-of select="KDTout:KDToutMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:TransferPlace"/>
                     </td>
                     <td style="border-bottom:solid 1.5pt black;border-left:solid 2pt black;" width="15%">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="green" colspan="3">
               <table width="100%">
                  <tr>
                     <td colspan="2" style="border-right:solid 1pt black;background:#FFFFFF;" width="54.5%">
                        <b>21</b>
                                Идентификация и страна регистрации активного
                                    трансп.средства на границе
                                
                            </td>
                     <td colspan="2" style="border-left:solid 1pt black;border-right:solid 0.8pt black;" width="20%">
                        <b>22</b>
                                Валюта и общая сумма по счету
                            </td>
                     <td align="center" rowspan="2" style="border-left:solid 1pt black;border-right:solid 0.8pt black;" width="10%">
                        <b>23</b>
                                Курс валюты
                                <br/>
                        <br/>
                        <xsl:value-of select="KDTout:KDToutMainContractTerms/catESAD_cu:ContractCurrencyRate"/>
                     </td>
                     <td colspan="3" style="border-left:solid 2pt black;" width="25%">
                        <b>24</b>
                                Характер сделки
                            </td>
                  </tr>
                  <tr>
                     <td class="green" width="44.5%">
                        <xsl:choose>
                           <xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutBorderTransport">
                              <xsl:value-of select="KDTout:KTDoutConsigment/KDTout:KDToutBorderTransport/KDTout:TransportMeansQuantity"/>: 
										<xsl:for-each select="KDTout:KTDoutConsigment/KDTout:KDToutBorderTransport/KDTout:TransportMeans">
                                 <xsl:if test="(cat_ru:ActiveTransportIdentifier) and not(cat_ru:TransportIdentifier) ">
                                    <xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>;
										
										</xsl:if>
                                 <xsl:if test="(cat_ru:TransportIdentifier)  ">
                                    <xsl:value-of select="cat_ru:TransportIdentifier"/>;
											</xsl:if>
                              </xsl:for-each>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                           <xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutBorderTransport/KDTout:MethodTransport=1">газопровод </xsl:when>
                           <xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutBorderTransport/KDTout:MethodTransport=2">нефтепровод </xsl:when>
                           <xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutBorderTransport/KDTout:MethodTransport=3">нефтепродуктопровод </xsl:when>
                           <xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutBorderTransport/KDTout:MethodTransport=4">линия электропередачи </xsl:when>
                        </xsl:choose>
                        <xsl:value-of select="KDTout:KTDoutConsigment/KDTout:KDToutBorderTransport/KDTout:NameObject"/>
                     </td>
                     <td align="center" style="border-bottom:solid 1.5pt black;border-left:solid 2pt black;border-right:solid 1pt black;background:#FFFFFF;" width="10%">
                        <xsl:choose>
                           <xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutBorderTransport/cat_ru:TransportNationalityCode!=''">
                              <xsl:value-of select="KDTout:KTDoutConsigment/KDTout:KDToutBorderTransport/cat_ru:TransportNationalityCode"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td align="center" style="border-left:solid 1pt black;border-bottom:solid 1.5pt black;border-right:solid 2pt black;" width="5%">
                        <xsl:choose>
                           <xsl:when test="KDTout:KDToutMainContractTerms/catESAD_cu:ContractCurrencyCode!=''">
                              <xsl:value-of select="KDTout:KDToutMainContractTerms/catESAD_cu:ContractCurrencyCode"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td align="center" style="border-right:solid 0.8pt black;" width="10%">
                        <xsl:choose>
                           <xsl:when test="KDTout:KDToutMainContractTerms/catESAD_cu:TotalInvoiceAmount!=''">
                              <xsl:value-of select="KDTout:KDToutMainContractTerms/catESAD_cu:TotalInvoiceAmount"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td align="center" style="border-left:solid 2pt black;border-bottom:solid 1.5pt black;border-right:solid 0.8pt black;" width="5%">
                        <xsl:apply-templates select="KDTout:KDToutMainContractTerms/catESAD_cu:DealNatureCode"/>
                     </td>
                     <td style="border-bottom:solid 1.5pt black;border-right:solid 2pt black;" width="5%">
                        <xsl:apply-templates select="KDTout:KDToutMainContractTerms/catESAD_cu:DealFeatureCode"/>
                     </td>
                     <td width="10%">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td style="border:solid 0.8pt black;">
               <table width="100%">
                  <tr>
                     <td class="green" colspan="2">
                        <b>25</b>
                                Вид транспорта
                            </td>
                     <td colspan="2" style="border-left:solid 2pt black;border-right:solid 0.8pt black;">
                        <b>26</b>
                                Вид транспорта
                            </td>
                     <td style="border-left:solid 0.8pt black;background:#FFFFFF;">
                        <b>27</b>
                                Место погрузки
                            </td>
                  </tr>
                  <tr>
                     <td align="center" style="border-bottom:solid 1.5pt black;border-right:solid 2pt black;background:#FFFFFF;">
                        <xsl:choose>
                           <xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutBorderTransport/cat_ru:TransportModeCode!=''">
                              <xsl:value-of select="KDTout:KTDoutConsigment/KDTout:KDToutBorderTransport/cat_ru:TransportModeCode"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td class="green">
                                на границе
                            </td>
                     <td align="center" style="border-left:solid 2pt black;border-bottom:solid 1.5pt black;border-right:solid 2pt black;">
                        <xsl:choose>
                           <xsl:when test="KDTout:KTDoutConsigment/KDTout:KDToutDepartureArrivalTransport/cat_ru:TransportModeCode!=''">
                              <xsl:for-each select="KDTout:KTDoutConsigment/KDTout:KDToutDepartureArrivalTransport/cat_ru:TransportModeCode">
                                 <xsl:value-of select="."/>
                                            ,
                                        </xsl:for-each>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td style="border-right:solid 0.8pt black;">
                                внутри страны
                            </td>
                     <td style="border-left:solid 0.8pt black;background:#FFFFFF;">
                        <!--xsl:apply-templates select="KDTout:KTDoutConsigment/KDTout:KDToutLoadingPlace"/-->
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
               </table>
            </td>
            <td colspan="2" rowspan="2" style="border:solid 0.8pt black;">
               <b>28</b>
                    Финансовые и банковские сведения
                    <br/>
            </td>
         </tr>
         <tr>
            <td align="center" style="border:solid 1.5pt black;">
                    1
                </td>
            <td style="border:solid 0.8pt black;">
               <table width="100%">
                  <tr>
                     <td style="border-right:solid 0.8pt black;">
                        <b>29</b>
                                Орган выезда/выезда
                                <br/>
                        <xsl:for-each select="KDTout:KTDoutConsigment/catESAD_cu:BorderCustomsOffice">
                           <xsl:value-of select="cat_ru:Code"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="cat_ru:OfficeName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </xsl:for-each>
                     </td>
                     <td style="border-left:solid 0.8pt black;">
                        <b>30</b>
                                Местонахождение товаров
                                <br/>
                        <xsl:for-each select="KDTout:KDTGoodsLocation">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="KDTout:InformationTypeCode"/>
                           <xsl:if test="KDTout:CustomsOffice">,
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="KDTout:CustomsOffice"/>,
									</xsl:if>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="KDTout:Address">
                              <br/>
                              <!--xsl:apply-templates mode="commaSeparated"/-->
                              <!-- изменил пространствыо имен на KDTout:  pdp -->
                              <xsl:value-of select="KDTout:Address/cat_ru:PostalCode"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="KDTout:Address/cat_ru:CountryCode"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="KDTout:Address/cat_ru:CounryName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="KDTout:Address/cat_ru:Region"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="KDTout:Address/cat_ru:City"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="KDTout:Address/cat_ru:StreetHouse"/>,
									</xsl:if>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="KDTout:LocationName">
                              <xsl:value-of select="KDTout:LocationName"/>
									</xsl:if>,
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="KDTout:GoodsLocationWarehouse">
                              <xsl:value-of select="KDTout:GoodsLocationWarehouse/cat_ru:PrDocumentName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="KDTout:GoodsLocationWarehouse/cat_ru:PrDocumentNumber"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="KDTout:GoodsLocationWarehouse/cat_ru:PrDocumentDate">
										от<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:apply-templates mode="date" select="KDTout:GoodsLocationWarehouse/cat_ru:PrDocumentDate"/>
                              </xsl:if>
                              <!--	pdp
									<xsl:value-of select="KDTout:GoodsLocationWarehouse/cat_ru:PrDocumentDate"/>
-->
                           </xsl:if>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:choose>
                              <xsl:when test="KDTout:GoodsLocationPlace">
                                 <!-- pdp-->
											<xsl:if test="KDTout:GoodsLocationPlace/catESAD_cu:NumberCustomsZone">
                                    N<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="KDTout:GoodsLocationPlace/catESAD_cu:NumberCustomsZone"/>
                                 </xsl:if>
                              </xsl:when>
                           </xsl:choose>
                           <xsl:if test="KDTout:Transport">, <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="KDTout:Transport/catESAD_cu:TransporKind"/>:<xsl:for-each select="KDTout:Transport/catESAD_cu:TransporIdentifier">
                                 <xsl:value-of select="."/>
                                 <xsl:if test="position()!=last()">;</xsl:if>
                              </xsl:for-each>
                           </xsl:if>
                           <br/>
                        </xsl:for-each>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
      </table>
      <xsl:if test="KDTout:KDToutGoods">
		<xsl:call-template name="Goods">
			<xsl:with-param name="goods" select="KDTout:KDToutGoods[position() = 1]"/>
		</xsl:call-template></xsl:if>
		<xsl:if test="not(KDTout:KDToutGoods)">
		
		<xsl:call-template name="EmptyGoods">
			<xsl:with-param name="EmpGoods" select="//KDTout:KDTout_CU"/>
		</xsl:call-template></xsl:if>
      <table>
         <tr>
            <td class="firstCol" rowspan="2" style="border-right:solid 1px black; border-top: solid 1px black; border-bottom: solid 1px black;">
               <b>47</b> Исчисление платежей
                </td>
            <td style="width: 45%;">
               <xsl:call-template name="GoodsPayments">
                  <xsl:with-param name="goods" select="KDTout:KDToutGoods[position() = 1]"/>
               </xsl:call-template>
            </td>
            <td class=" tl tr">
               <table cellpadding="1px" cellspacing="0" style="width: 100%">
                  <tr>
                     <td class="t" style="width: 50%; min-height: 15pt;">
                        <b>48</b>
                                Отсрочка платежей
                                <xsl:for-each select="//KDTout:CUDelayPayments">
                           <br/>
                           <xsl:value-of select="catESAD_cu:PaymentModeCode"/>
                           <xsl:text>-</xsl:text>
                           <xsl:apply-templates select="catESAD_cu:DelayDocumentNumber"/>
                           <xsl:text>-</xsl:text>
                           <xsl:apply-templates mode="date" select="catESAD_cu:DelayDocumentDate"/>
                           <xsl:text>-</xsl:text>
                           <xsl:apply-templates mode="date" select="catESAD_cu:DelayDate "/>
                        </xsl:for-each>
                     </td>
                     <td class="tb" style="vertical-align: top;">
                        <b>49</b>
                                Реквизиты склада
                            </td>
                  </tr>
               </table>
               <xsl:call-template name="PaymentDetails"/>
            </td>
         </tr>
      </table>
      <table>
         <tr>
            <td class="firstCol tr tb" style="width: 16px;"/>
            <td class="green tt tr">
               <table style="width: 100%;">
                  <tr>
                     <td style="width: 30%;">
                        <b>50</b> Принципал</td>
                     <td style="width: 10%;">№ 
                     </td>
                     <td style="width: 20%;">Подпись:</td>
                     <td class="dl" rowspan="4" style="width: 40%;">
                        <b>С</b>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <br/>
                     </td>
                  </tr>
                  <tr>
                     <td class="green" colspan="3">
                     </td>
                  </tr>
                  <tr>
                     <td class="green" colspan="3">
                                представленный
                     </td>
                  </tr>
                  <tr>
                     <td class="green" colspan="3">
                                Место и дата:
                            </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td colspan="6">
               <table>
                  <tr>
                     <td class="firstCol tr">
                        <b>51</b> Предпола-<br/>гаемые органы<br/>(и страна<br/>транзита</td>
                     <td class="t green"/>
                     <td class="t green"/>
                     <td class="t green"/>
                     <td class="t green"/>
                     <td class="t green"/>
                     <td class="t green"/>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td colspan="6">
               <table>
                  <tr>
                     <td rowspan="2" style="border-top:solid 0.8pt black;border-bottom:solid 0.8pt black;">
                        <b>52</b> Гарантия недействительна для
                            </td>
                     <td rowspan="2" style="border-top:solid 0.8pt black;border-bottom:solid 0.8pt black;background:#FFFFFF;">
                        <xsl:choose>
                           <xsl:when test="KDTout:Guarantee">
                              <xsl:if test="KDTout:Guarantee/catESAD_cu:PaymentWayCode">
                                 <xsl:value-of select="KDTout:Guarantee/catESAD_cu:PaymentWayCode"/>, 
										</xsl:if>
                              <xsl:value-of select="KDTout:Guarantee/catESAD_cu:Amount"/>, № 
										<xsl:value-of select="KDTout:Guarantee/catESAD_cu:DocumentNumber"/>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="KDTout:Guarantee/catESAD_cu:DocumentDate"/>
                              </xsl:call-template>
                              <xsl:if test="KDTout:Guarantee/catESAD_cu:UNP">
											 УНП <xsl:value-of select="KDTout:Guarantee/catESAD_cu:UNP"/>, 
										</xsl:if>
                              <xsl:if test="KDTout:Guarantee/catESAD_cu:BIC">
											БИК <xsl:value-of select="KDTout:Guarantee/catESAD_cu:BIC"/>, 
										</xsl:if>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </td>
                     <td style="border-right:solid 2pt black;border-top:solid 0.8pt black;background:#FFFFFF;">
                                Код
                            </td>
                     <td rowspan="2" style="border-top:solid 0.8pt black;border-bottom:solid 0.8pt black;background:#FFFFFF;">
                        <b>53</b>
                                Орган (и страна) назначения
                                <br/>
                     </td>
                  </tr>
                  <tr>
                     <td style="border-left:solid 2pt black;border-bottom:solid 1.5pt black;border-right:solid 2pt black;background:#FFFFFF;"/>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td colspan="6" style="border-top:solid 0.8pt black;">
               <table>
                  <tr>
                     <td>
                        <b>D</b>
                     </td>
                     <td/>
                     <td style="border-right:solid 0.8pt black;">
                                Печать:
                            </td>
                     <td rowspan="6" style="border-left:solid 0.8pt black;">
                        <b>54</b>
                                Место и дата
                                <br/>
                                <xsl:if test="/KDTout:KDTout_CU/KDTout:KDTFilledInfo/KDTout:ExecutionDate">
                                Дата ДТ:
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="/KDTout:KDTout_CU/KDTout:KDTFilledInfo/KDTout:ExecutionDate"/>
								</xsl:call-template>
                                <br/>
                                </xsl:if>
                        <span class="graph">Подпись и фамилия лица, заполнившего декларацию:</span>
                        <br/>
                        <xsl:for-each select="/KDTout:KDTout_CU/KDTout:KDTFilledInfo/KDTout:CustomsRepresentative">
                           <!--Пункт 1)-->
                           <span class="graph">1) </span>
										Свид. о включении в Реестр таможенных представителей № <xsl:value-of select="catESAD_cu:CustomsRepresCertificate/cat_ru:PrDocumentNumber"/>;<br/>
                           <xsl:for-each select="catESAD_cu:ContractRepresDecl">
											Договор таможенного представителя с декларантом № 
											 <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text> от 
											<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </xsl:for-each>
										; <br/>
                           <!--ИНН / КПП:
										<xsl:value-of select="cat_ru:INN"/>
										<xsl:if test="cat_ru:INN and cat_ru:KPP">/</xsl:if>
										<xsl:value-of select="cat_ru:KPP"/>-->
                           <xsl:choose>
                              <xsl:when test="catESAD_cu:RFOrganizationFeatures">
                                 <xsl:for-each select="catESAD_cu:RFOrganizationFeatures">
                                    <xsl:if test="cat_ru:OGRN">
                                       <xsl:value-of select="cat_ru:OGRN"/>
                                       <xsl:if test="cat_ru:INN">/</xsl:if>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:INN">
                                       <xsl:value-of select="cat_ru:INN"/>
                                       <xsl:if test="cat_ru:KPP">/</xsl:if>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:KPP">
			<xsl:value-of select="cat_ru:KPP"/>
                                    </xsl:if>
                                 </xsl:for-each>
                              </xsl:when>
                              <xsl:when test="catESAD_cu:RKOrganizationFeatures">
                                 <xsl:for-each select="catESAD_cu:RKOrganizationFeatures">
                                    <xsl:if test="cat_ru:BIN">
                                       <xsl:value-of select="cat_ru:BIN"/>
                                       <xsl:if test="cat_ru:IIN">/</xsl:if>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:IIN">
                                       <xsl:value-of select="cat_ru:IIN"/>
                                       <xsl:if test="cat_ru:ITN">/</xsl:if>
                                    </xsl:if>
                                    <xsl:for-each select="cat_ru:ITN">
                                       <xsl:value-of select="cat_ru:CategoryCode"/>
         <xsl:value-of select="cat_ru:KATOCode"/>/
         <xsl:value-of select="cat_ru:RNN"/>
                                       <xsl:if test="cat_ru:ITNReserv">
            /<xsl:value-of select="cat_ru:ITNReserv"/>
                                       </xsl:if>
                                    </xsl:for-each>
                                 </xsl:for-each>
                              </xsl:when>
                              <xsl:when test="catESAD_cu:RBOrganizationFeatures">
                                 <xsl:for-each select="catESAD_cu:RBOrganizationFeatures">
                                    <xsl:if test="cat_ru:UNP">
                                       <xsl:value-of select="cat_ru:UNP"/>
                                       <xsl:if test="cat_ru:RBIdentificationNumber">/</xsl:if>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RBIdentificationNumber">
                                       <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
                                    </xsl:if>
                                 </xsl:for-each>
                              </xsl:when>
                           </xsl:choose>
                        </xsl:for-each>
                        <br/>
                        <xsl:for-each select="/KDTout:KDTout_CU/KDTout:KDTFilledInfo/KDTout:FilledPerson">
                           <!--Пункт 2)-->
                           <span class="graph">2)</span>
                           <xsl:value-of select="cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="cat_ru:PersonMiddleName"/>
                           <br/>
                           <xsl:for-each select="catESAD_cu:IdentityCard">
                              <xsl:value-of select="cat_ru:IdentityCardName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="cat_ru:IdentityCardSeries"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="cat_ru:IdentityCardNumber"/>
                              <xsl:text> </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
                              </xsl:call-template>
                              <xsl:value-of select="cat_ru:OrganizationName"/>
                              <br/>
                           </xsl:for-each>
                           <xsl:if test="cat_ru:PersonPost">
                              <xsl:value-of select="cat_ru:PersonPost"/>
                              <br/>
                           </xsl:if>
                           <xsl:for-each select="catESAD_cu:Contact">
											Телефон <xsl:for-each select="cat_ru:Phone">
                                 <xsl:value-of select="."/>
                                 <xsl:if test="position()!=last()">, </xsl:if>
                              </xsl:for-each>
                              <br/>
                           </xsl:for-each>
                           <!--Графа 3)-->
                           <xsl:for-each select="catESAD_cu:AuthoritesDocument">
                              <span class="graph">3)</span>
                              <xsl:if test="cat_ru:PrDocumentName">
                                 <xsl:value-of select="cat_ru:PrDocumentName"/>, 
											</xsl:if>
                              <xsl:value-of select="cat_ru:PrDocumentNumber"/>, 
											<xsl:if test="cat_ru:PrDocumentDate">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                              <xsl:if test="cat_ru:ComplationAuthorityDate">
                                 <span class="graph">до </span>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:ComplationAuthorityDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                              <br/>
                           </xsl:for-each>
                        </xsl:for-each>
                        <!--Графа 4)-->
                        <xsl:if test="//KDTout:RegNumberDoc">
                           <span class="graph">4)  Исходящий номер регистрации документов</span>
                           <br/>
                           <xsl:value-of select="//KDTout:RegNumberDoc"/>
                           <xsl:text> </xsl:text>
                        </xsl:if>
                        <br/>
                        <xsl:value-of select="//KDTout:SecurityLabelCode"/>
                        <br/>
                        <p align="right">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="//KDTout:ExecutionDate"/>
                           </xsl:call-template>
                        </p>
                        <br/>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3" style="border-right:solid 0.8pt black;">
                                Результат:
                            </td>
                  </tr>
                  <tr>
                     <td>
                                Наложенные пломбы:
                            </td>
                     <td colspan="2" style="border-right:solid 0.8pt black;"/>
                  </tr>
                  <tr>
                     <td colspan="3" style="border-right:solid 0.8pt black;">
                                Номер:
                            </td>
                  </tr>
                  <tr>
                     <td colspan="3" style="border-right:solid 0.8pt black;">
                                Срок доставки (дата):
                            </td>
                  </tr>
                  <tr>
                     <td colspan="3" style="border-right:solid 0.8pt black;">
                                Подпись:
                            </td>
                  </tr>
               </table>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!--Товар-->
   <xsl:template name="Goods">
      <xsl:param name="goods"/>
      <table width="100%">
         <tr>
            <td class=" tr tb" rowspan="4" style="width:68px;">
               <b>31</b> Грузовые места<br/>и описание<br/>товаров</td>
            <td class=" green nowrap">Маркировка и количество - Номера контейнеров - Количество и отличительные особенности</td>
            <td class=" green">
               <table>
                  <tr>
                     <td class=" bl nowrap" colspan="2">
                        <b>32</b> Товар</td>
                  </tr>
                  <tr>
                     <td align="center" class="bl bb br">
                        <xsl:apply-templates select="$goods/catESAD_cu:GoodsNumeric"/>
                     </td>
                     <td align="center" class=" tb">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>№
								<xsl:value-of select="$goods/catESAD_cu:GoodFeatures"/>
                     </td>
                  </tr>
               </table>
            </td>
            <td class=" tl tb tr nowrap">
               <b>33</b> Код товара<br/>
               <xsl:value-of select="substring($goods/catESAD_cu:GoodsTNVEDCode,1,10)"/>
            </td>
            <td colspan="2" style="border:solid 0.8pt black;">
               <br/>
               <table>
                  <tr>
                     <td style="border-right:solid 0.8pt black;"/>
                     <td style="border-right:solid 0.8pt black;"/>
                  </tr>
                  <tr>
                     <td align="center" style=" border-right:solid 0.8pt black;">
                        <xsl:if test="$goods/catESAD_cu:AdditionalSign">
                           <xsl:value-of select="$goods/catESAD_cu:AdditionalSign"/>
                        </xsl:if>
                        <xsl:if test="$goods/catESAD_cu:IntellectPropertySign">
                           <xsl:value-of select="$goods/catESAD_cu:IntellectPropertySign"/>
                        </xsl:if>
                        <xsl:choose>
                           <xsl:when test="$goods/catESAD_cu:GoodsClassificationCode=1">О</xsl:when>
                        </xsl:choose>
                     </td>
                     <td align="center" style=" border-right:solid 0.8pt black;">
                        <xsl:value-of select="$goods/catESAD_cu:GoodsAddTNVEDCode"/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" style=" border-right:solid 0.8pt black;" width="25mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" style=" border: 0" width="25mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td colspan="2" rowspan="3" style="border-bottom:solid 0.8pt black;background:#FFFFFF;">
               <xsl:for-each select="$goods/catESAD_cu:GoodsDescription">
                  <xsl:value-of select="."/>
                  <xsl:text disable-output-escaping="yes"> </xsl:text>
               </xsl:for-each>
               <!--xsl:for-each select="$goods/catESAD_cu:ESADElectricalEnergyQuantity">
                  <xsl:value-of select="catESAD_cu:TariffZoneName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="catESAD_cu:TextID"/>
                  <xsl:if test="catESAD_cu:Description">
                     <xsl:text>/</xsl:text>
                     <xsl:value-of select="catESAD_cu:Description"/>
                  </xsl:if>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="catESAD_cu:TransferEnergyQuantity"/>
                  <xsl:if test="catESAD_cu:QualifierCode">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="catESAD_cu:QualifierCode"/>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:QualifierName">
                     <xsl:text>/</xsl:text>
                     <xsl:value-of select="catESAD_cu:QualifierName"/>
                  </xsl:if>
                  <xsl:text>, </xsl:text>
               </xsl:for-each-->
				<!--xsl:if test="$goods/catESAD_cu:GoodsDescription and $goods/catESAD_cu:GoodsGroupDescription"><br/></xsl:if-->
				<!-- Сначала описание без характеристик групп -->
				<xsl:for-each select="$goods/catESAD_cu:GoodsGroupDescription[not (catESAD_cu:GoodsGroupInformation)]">
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<xsl:for-each select="catESAD_cu:GoodsDescription">
						<xsl:value-of select="."/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		    		</xsl:for-each>
	    		</xsl:for-each>
    			<xsl:for-each select="$goods/catESAD_cu:GoodsGroupDescription[catESAD_cu:GoodsGroupInformation]">
                <!-- xsl:for-each select="$goods/catESAD_cu:GoodsGroupDescription" -->
                  <br/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:for-each select="catESAD_cu:GoodsDescription">
                     <xsl:value-of select="."/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:RKTNVED">
                     <xsl:value-of select="catESAD_cu:RKTNVED"/>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:Manufacturer">
                                Производитель
                            </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:Manufacturer">
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:TradeMark">
                                Тов.знак
                            </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:TradeMark">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="."/>
                  </xsl:for-each>
                  <!--xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                                Катег.прод.
                            </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="."/>
                  </xsl:for-each-->
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMark">
                                Торг. знак, марка
                            </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMark">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsModel">
                                Модель
                            </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsModel">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMarking">
                                Артикул
                            </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMarking">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsStandard">
                                Стандарт
                            </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsStandard">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsSort">
                                Сорт
                            </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsSort">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodSortiment">
                                Наим.сортимента
                            </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodSortiment">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodKind">
                                Порода древесины
                            </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodKind">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:Dimensions">
                                Размеры
                            </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:Dimensions">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:DateIssue">
                                Дата выпуска
                            </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:DateIssue">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="."/>
                     </xsl:call-template>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:SerialNumber">
                     <br/>Сериный номер:
									<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:SerialNumber">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="."/>;
							</xsl:for-each>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsGroupQuantity">
                                Кол-во
                            </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsGroupQuantity">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="cat_ru:GoodsQuantity"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
                     <xsl:if test="cat_ru:MeasureUnitQualifierCode">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(
                                    <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
                                </xsl:if>
                  </xsl:for-each>
                  <br/>
                  <xsl:if test="../catESAD_cu:OilField"> Месторождения товара:
							<xsl:value-of select="../catESAD_cu:OilField"/>
                  </xsl:if>
               </xsl:for-each>
               <xsl:if test="$goods/catESAD_cu:OriginCountryName">
                  <br/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="$goods/catESAD_cu:OriginCountryName"/>
               </xsl:if>
               <!--xsl:if test="$goods/KDTout:SupplementaryGoodsQuantity">
                  <br/>
                  <xsl:value-of select="$goods/KDTout:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="$goods/KDTout:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="$goods/KDTout:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
               </xsl:if-->
               <xsl:for-each select="$goods/KDTout:SupplementaryGoodsQuantity1">
                  <br/>
                  <xsl:value-of select="cat_ru:GoodsQuantity"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
               </xsl:for-each>
               <xsl:if test="$goods/catESAD_cu:BeginPeriodDate or $goods/catESAD_cu:EndPeriodDate">
                  <br/>
                  <xsl:if test="$goods/catESAD_cu:BeginPeriodDate">
                            Начало периода
                            <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="$goods/catESAD_cu:BeginPeriodDate"/>
                     </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$goods/catESAD_cu:EndPeriodDate">
                            Окончание периода
                            <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="$goods/catESAD_cu:EndPeriodDate"/>
                     </xsl:call-template>
                  </xsl:if>
               </xsl:if>
				<xsl:if test="$goods/catESAD_cu:IPObjectRegistryNum">
					<xsl:if test="count($goods/catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='1']) &gt; 0">
						<br/>
						<span class="graph">Единый ТРОИС ЕАЭС: </span>
						<xsl:for-each select="$goods/catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='1']">
							<xsl:if test="catESAD_cu:CountryCode">
								<span class="graph">(</span><xsl:value-of select="catESAD_cu:CountryCode"/><span class="graph">) </span>
							</xsl:if>
							<xsl:value-of select="catESAD_cu:IPORegistryNumber"/><xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="count($goods/catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='2']) &gt; 0">
						<br/>
						<span class="graph">Национальный ТРОИС: </span>
						<xsl:for-each select="$goods/catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='2']">
							<xsl:if test="catESAD_cu:CountryCode">
								<span class="graph">(</span><xsl:value-of select="catESAD_cu:CountryCode"/><span class="graph">) </span>
							</xsl:if>
							<xsl:value-of select="catESAD_cu:IPORegistryNumber"/><xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</xsl:if>
				</xsl:if>
               <xsl:if test="$goods/KDTout:ESADGoodsPackaging">
                  <br/>
                        2)
                        <xsl:if test="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:PakageTypeCode = 1">
                     <xsl:if test="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:PakageQuantity">
                        <xsl:value-of select="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:PakageQuantity"/>
                        <xsl:if test="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:PakagePartQuantity">
                                    (<xsl:value-of select="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:PakagePartQuantity"/>-часть
                                    места)
                                </xsl:if>
                                ,
                            </xsl:if>
                     <xsl:if test="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:PackingInformation">
                        <xsl:for-each select="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:PackingInformation">
                           <xsl:value-of select="catESAD_cu:PackingCode"/>
                           <xsl:if test="catESAD_cu:PakingQuantity">
                                        -
                                        <xsl:value-of select="catESAD_cu:PakingQuantity"/>
                           </xsl:if>
                                    ,
                                </xsl:for-each>
                     </xsl:if>
                     <xsl:if test="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:PalleteInformation">
                                Поддоны:
                                <xsl:for-each select="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:PalleteInformation">
                           <xsl:if test="catESAD_cu:PalleteDescription">
                              <xsl:value-of select="catESAD_cu:PalleteDescription"/>
                           </xsl:if>
                                    ,
                                    <xsl:value-of select="catESAD_cu:PalleteQuantity"/> /
                                    <xsl:value-of select="catESAD_cu:PalleteCode"/>
                        </xsl:for-each>
                     </xsl:if>
                     <xsl:if test="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:UnitPackInfo">
                        <br/>2.1
                                <xsl:for-each select="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:UnitPackInfo">
                           <xsl:value-of select="catESAD_cu:PackingCode"/>
                           <xsl:if test="catESAD_cu:PakingQuantity">
                                        -
                                        <xsl:value-of select="catESAD_cu:PakingQuantity"/>
                           </xsl:if>
                                    ,
                                </xsl:for-each>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=0">
                            без упаковки
                        </xsl:if>
                  <xsl:if test="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=2">
                            без упаковки/
                            <xsl:for-each select="$goods/KDTout:ESADGoodsPackaging/catESAD_cu:CargoInfo">
                        <xsl:value-of select="catESAD_cu:PackingCode"/>
                                ,
                            </xsl:for-each>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="$goods/KDTout:ESADContainer">
                  <br/>
                        3)
                        <xsl:value-of select="$goods/KDTout:ESADContainer/catESAD_cu:ContainerQuantity"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:for-each select="$goods/KDTout:ESADContainer/catESAD_cu:ContainerNumber">
                     <xsl:value-of select="catESAD_cu:ContainerIdentificaror"/>
                     <xsl:if test="catESAD_cu:FullIndicator='2'">
                                часть
                            </xsl:if>
                            ,
                        </xsl:for-each>
               </xsl:if>
               <xsl:if test="$goods/KDTout:ESADExcise">
                  <br/>
                        4)
                        <xsl:for-each select="$goods/KDTout:ESADExcise">
                     <xsl:value-of select="catESAD_cu:ExciseSerieses"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="catESAD_cu:ExciseFirstNumber"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="catESAD_cu:ExciseLastNumber"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="catESAD_cu:ExciseQuantity"/>
                            ;
                        </xsl:for-each>
               </xsl:if>
               <xsl:if test="$goods/catESAD_cu:CUESADDeliveryTerms">
                  <br/>
                        
                        5)
                        <xsl:for-each select="$goods/catESAD_cu:CUESADDeliveryTerms">
                     <xsl:value-of select="cat_ru:DeliveryTermsStringCode"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:for-each select="cat_ru:DeliveryPlace"> - 
									<xsl:value-of select="."/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </xsl:for-each>
                     <xsl:if test="cat_ru:TransferPlace">
                        <xsl:value-of select="cat_ru:TransferPlace"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="$goods/KDTout:KDToutCustomsConditions">
                  <br/>
						6)
						<xsl:for-each select="$goods/KDTout:KDToutCustomsConditions">1
						<xsl:for-each select="catESAD_cu:RateOutputGoods">
						Норма:<xsl:value-of select="."/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </xsl:for-each>
                     <xsl:for-each select="catESAD_cu:ProcessingProduct">
						Продукт переработки:	
							<xsl:for-each select="catESAD_cu:GoodsDescription">
                           <xsl:value-of select="."/> 
							</xsl:for-each>
                        <xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/> 
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity">
							g<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:GoodsQuantity"/> 
							<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierName"/> 
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode">
									 (<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)  
								</xsl:if>
                        </xsl:if>
                        <br/>
                     </xsl:for-each>
                     <xsl:if test="catESAD_cu:WasteProducts">
							Отходы:<xsl:for-each select="catESAD_cu:WasteProducts">
                           <xsl:for-each select="catESAD_cu:GoodsDescription">
                              <xsl:value-of select="."/> 
							</xsl:for-each>
                           <xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/> 
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity">
                              <xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:GoodsQuantity"/> 
							<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierName"/> 
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode">
									 (<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)  
								</xsl:if>
                           </xsl:if>
                        </xsl:for-each>
                        <br/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:Heels">
							Остатки:<xsl:for-each select="catESAD_cu:Heels">
                           <xsl:for-each select="catESAD_cu:GoodsDescription">
                              <xsl:value-of select="."/> 
							</xsl:for-each>
                           <xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/> 
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity">
                              <xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:GoodsQuantity"/> 
							<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierName"/> 
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode">
									 (<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)  
								</xsl:if>
                           </xsl:if>
                        </xsl:for-each>
                        <br/>
                     </xsl:if>
                     <xsl:for-each select="catESAD_cu:GoodsIdentificationMethod">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </xsl:for-each>
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="($goods/catESAD_cu:DeliveryTime) or ($goods/catESAD_cu:DeliveryTimeEND)">
                  <br/>
                  <span class="graph">7) Поставка в течение</span>
                  <xsl:value-of select="$goods/catESAD_cu:DeliveryTime"/>
                  <xsl:if test="$goods/catESAD_cu:DeliveryTimeEND">
								- <xsl:value-of select="$goods/catESAD_cu:DeliveryTimeEND"/>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="$goods/catESAD_cu:QuantityFact">
                  <br/>
                  <span class="graph">8) </span>
                  <xsl:value-of select="$goods/catESAD_cu:QuantityFact"/>
               </xsl:if>
               <xsl:if test="($goods/KDTout:ElectricalEnergReceived) or ($goods/KDTout:ElectricalEnergGiven)">
                  <br/>
                  <span class="graph">9) </span>
                  <xsl:for-each select="$goods/KDTout:ElectricalEnergReceived">
								принято <xsl:value-of select="catESAD_cu:ElectricalEnergyQuantity"/> тыс. кВт.ч
								<xsl:if test="catESAD_cu:QualifierCode">
									(<xsl:value-of select="catESAD_cu:QualifierCode"/>)
								</xsl:if>, 
							</xsl:for-each>
                  <xsl:for-each select="$goods/KDTout:ElectricalEnergGiven">
								отдано <xsl:value-of select="catESAD_cu:ElectricalEnergyQuantity"/> тыс. кВт.ч
								<xsl:if test="catESAD_cu:QualifierCode">
									(<xsl:value-of select="catESAD_cu:QualifierCode"/>)
								</xsl:if>, 
							</xsl:for-each>
               </xsl:if>
               <xsl:if test="$goods/catESAD_cu:CIMIdDetails">
				   <br/>
				   <span class="graph">10) </span>
				   <xsl:for-each select="$goods/catESAD_cu:CIMIdDetails">
						Контрольные знаки
						<xsl:if test="catESAD_cu:CIMMarkingFlag">
							Признак: <xsl:value-of select="catESAD_cu:CIMMarkingFlag"/> 
						</xsl:if>
						<xsl:if test="catESAD_cu:CIMQuantity">
							Количество: <xsl:value-of select="catESAD_cu:CIMQuantity"/> 
						</xsl:if>
						<xsl:if test="catESAD_cu:CIMList">
							Идентификаторы: 
							<xsl:for-each select="catESAD_cu:CIMList/catESAD_cu:CIMID">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="catESAD_cu:CIMRange">
							 Диапазоны: 
							 <xsl:for-each select="catESAD_cu:CIMRange">
								 <xsl:value-of select="catESAD_cu:FirstCIMID"/> - <xsl:value-of select="catESAD_cu:LastCIMID"/>
								 <xsl:if test="position()!=last()">, </xsl:if>
							 </xsl:for-each>
						</xsl:if>
                     </xsl:for-each>
               </xsl:if>
               <xsl:if test="$goods/catESAD_cu:GoodsSTZ"> 
                  <br/>
                  <span class="graph">11) </span>   
                  <xsl:for-each select="$goods/catESAD_cu:GoodsSTZ">
							Номер строки в гр 40 <xsl:value-of select="catESAD_cu:LineNumber"/>
                     <br/>
                     <xsl:for-each select="catESAD_cu:GoodsDescription">
                        <xsl:value-of select="."/>
                     </xsl:for-each>
							Кол-во 
						<xsl:for-each select="catESAD_cu:SupplementaryQuantity">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="cat_ru:GoodsQuantity"/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
                        <xsl:if test="cat_ru:MeasureUnitQualifierCode">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(
                                    <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
                                </xsl:if>
                     </xsl:for-each>
					<!-- Сначала описание без характеристик групп -->
					<xsl:for-each select="catESAD_cu:GoodsGroupDescription[not (catESAD_cu:GoodsGroupInformation)]">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:for-each select="catESAD_cu:GoodsDescription">
							<xsl:value-of select="."/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="catESAD_cu:GoodsGroupDescription[catESAD_cu:GoodsGroupInformation]">
                        <br/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:for-each select="catESAD_cu:GoodsDescription">
                           <xsl:value-of select="."/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:RKTNVED">
                           <xsl:value-of select="catESAD_cu:RKTNVED"/>
                        </xsl:if>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:Manufacturer">
                                Производитель
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:Manufacturer">
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:TradeMark">
                                Тов.знак
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:TradeMark">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <!--xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                                Катег.прод.
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each-->
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMark">
                                Торг. знак, марка
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMark">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsModel">
                                Модель
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsModel">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMarking">
                                Артикул
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMarking">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsStandard">
                                Стандарт
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsStandard">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsSort">
                                Сорт
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsSort">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodSortiment">
                                Наим.сортимента
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodSortiment">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodKind">
                                Порода древесины
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodKind">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:Dimensions">
                                Размеры
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:Dimensions">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:DateIssue">
                                Дата выпуска
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:DateIssue">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="."/>
                           </xsl:call-template>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:SerialNumber">
                           <br/>Сериный номер:
									<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:SerialNumber">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="."/>;
							</xsl:for-each>
                        </xsl:if>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsGroupQuantity">
                                Кол-во
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsGroupQuantity">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="cat_ru:GoodsQuantity"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
                           <xsl:if test="cat_ru:MeasureUnitQualifierCode">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(
                                    <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
                                </xsl:if>
                        </xsl:for-each>
                     </xsl:for-each>
                  </xsl:for-each>
               </xsl:if>
            </td>
            <td>
               <table>
                  <tr>
                     <td class="nowrap" colspan="4" style="border-left:solid 1.5pt black;border-right:solid 1.5pt black;">
                        <b>34</b>
                                Код страны происх.
                            </td>
                  </tr>
                  <tr>
                     <td style="border-left:solid 1.5pt black;border-right:solid 0.8pt black;border-bottom:solid 1.5pt black;">a
                            </td>
                     <td align="center" style="border-right:solid 0.8pt black;border-bottom:solid 1.5pt black;">
                        <xsl:apply-templates select="$goods/catESAD_cu:OriginCountryCode"/>
                     </td>
                     <td style="border-right:solid 0.8pt black;border-bottom:solid 1.5pt black;">b
                            </td>
                     <td style="border-right:solid 1.5pt black;border-bottom:solid 1.5pt black;"/>
                  </tr>
               </table>
            </td>
            <td style="border:solid 0.8pt black;background:#FFFFFF;">
               <b>35</b>
                    Вес брутто (кг)
                    <br/>
               <xsl:value-of select="$goods/catESAD_cu:GrossWeightQuantity"/>
            </td>
            <td class=" nowrap" style="border:solid 0.8pt black;">
               <b>36</b>
                    Преференция
                    <br/>
               <xsl:value-of select="$goods/catESAD_cu:Preferencii/catESAD_cu:CustomsTax"/>
               <xsl:value-of select="$goods/catESAD_cu:Preferencii/catESAD_cu:CustomsDuty"/>
               <xsl:value-of select="$goods/catESAD_cu:Preferencii/catESAD_cu:Excise"/>
               <xsl:value-of select="$goods/catESAD_cu:Preferencii/catESAD_cu:Rate"/>
            </td>
         </tr>
         <tr>
            <td>
               <table>
                  <tr>
                     <td colspan="2" style="border-left:solid 1.5pt black;border-right:solid 1.5pt black;border-top:solid 0.8pt black;">
                        <b>37</b>
                                Процедура
                            </td>
                  </tr>
                  <tr>
                     <td align="center" style="border-left:solid 1.5pt black;border-right:solid 0.8pt black;border-bottom:solid 1.5pt black;">
                        <!--<xsl:apply-templates select="$goods/KDTout:CustomsProcedure/catESAD_cu:MainCustomsModeCode"/>
								<xsl:apply-templates select="$goods/KDTout:CustomsProcedure/catESAD_cu:PrecedingCustomsModeCode"/>-->
                        <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                     </td>
                     <td align="center" style="border-right:solid 1.5pt black;border-bottom:solid 1.5pt black;">
                        <xsl:apply-templates select="$goods/KDTout:CustomsProcedure/catESAD_cu:GoodsTransferFeature"/>
                     </td>
                  </tr>
               </table>
            </td>
            <td style="border:solid 0.8pt black;background:#FFFFFF;">
               <b>38</b>
                    Вес нетто (кг)
                    <br/>
               <xsl:value-of select="$goods/catESAD_cu:NetWeightQuantity"/>
               <xsl:if test="$goods/catESAD_cu:NetWeightQuantity2">
						/<xsl:value-of select="$goods/catESAD_cu:NetWeightQuantity2"/>
               </xsl:if>
            </td>
            <td style="border:solid 0.8pt black;">
               <b>39</b>
               <i> Квота</i>
               <br/>
               <xsl:if test="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota">
                  <xsl:value-of select="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyQuantity"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyName"/>
								(<xsl:value-of select="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyCode"/>)
						
						</xsl:if>
               <br/>
               <xsl:if test="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota">
               <xsl:for-each select="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota">
                        <xsl:value-of select="catESAD_cu:QuotaQuantity"/>
                  <!-- <xsl:value-of select="$goods/KDTout:ESADGoodsQuotaa/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaQuantity"/>-->
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaMeasurementName"/>
								(<xsl:value-of select="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaMeasureUnitQualifierCode"/>)
						</xsl:for-each>
						</xsl:if>
					
               <!--xsl:choose>
						<xsl:when test="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota">
							<xsl:value-of select="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyQuantity"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:value-of select="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyName"/>
								(<xsl:value-of select="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyCode"/>)
							</xsl:when>
						<xsl:when test="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota">
							<xsl:value-of select="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaQuantity"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:value-of select="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaMeasurementName"/>
								(<xsl:value-of select="$goods/KDTout:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaMeasureUnitQualifierCode"/>)
							</xsl:when>
					</xsl:choose-->
            </td>
         </tr>
         <tr>
            <td class=" nowrap" colspan="3" style="border:solid 0.8pt black;background:#FFFFFF;">
               <b>40</b>
                    Общая декларация/Предшествующий документ
                    <br/>
               <xsl:for-each select="$goods/KDTout:KDToutPrecedingDocument">
                  <xsl:if test="catESAD_cu:PrecedingDocumentID">
                     <xsl:value-of select="catESAD_cu:PrecedingDocumentID"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:PrecedingDocumentName">
                     <xsl:value-of select="catESAD_cu:PrecedingDocumentName"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:PrecedingDocumentCustomsCode">
                     <xsl:value-of select="catESAD_cu:PrecedingDocumentCustomsCode"/>
                     <xsl:text> / </xsl:text>
                  </xsl:if>
                  <xsl:call-template name="russian_date_gtd">
                     <xsl:with-param name="dateIn" select="catESAD_cu:PrecedingDocumentDate"/>
                  </xsl:call-template>
                  <xsl:text> / </xsl:text>
                  <xsl:if test="catESAD_cu:AddNumberPart">
                     <xsl:value-of select="catESAD_cu:AddNumberPart"/>
                  </xsl:if>
                  <xsl:value-of select="catESAD_cu:PrecedingDocumentNumber"/>
                  <xsl:if test="catESAD_cu:PrecedingDocumentGoodsNumeric">
                     <xsl:text> / </xsl:text>
                     <xsl:value-of select="catESAD_cu:PrecedingDocumentGoodsNumeric"/>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:CustomsCost">
                     <xsl:text> / </xsl:text>
                     <xsl:value-of select="catESAD_cu:CustomsCost"/>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:NetWeight">
                     <xsl:text> / </xsl:text>
                     <xsl:value-of select="catESAD_cu:NetWeight"/>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:NetWeightQuantity">
                     <xsl:text> / </xsl:text>
                     <xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
                  </xsl:if>
                  <xsl:if test="(catESAD_cu:NetWeightQuantity) or (catESAD_cu:SupplementaryGoodsQuantity)">
                     <xsl:text> / </xsl:text>
                     <xsl:value-of select="catESAD_cu:NetWeightQuantity"/>,
								<xsl:value-of select="catESAD_cu:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
                     <xsl:if test="catESAD_cu:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode">
									(<xsl:value-of select="catESAD_cu:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)
								</xsl:if>
                  </xsl:if>
                  <br/>
               </xsl:for-each>
            </td>
         </tr>
         <tr>
            <td class="firstCol tr" rowspan="3">
               <b>44</b> Дополнит. информация/ Представл. документы
                </td>
            <td colspan="2" rowspan="3" style="border-bottom:solid 0.8pt black;border-top:solid 0.8pt black;background:#FFFFFF;">
               <xsl:if test="$goods/KDTout:KDToutPresentedDocument">
                  <xsl:for-each select="$goods/KDTout:KDToutPresentedDocument">
                     <xsl:value-of select="catESAD_cu:PresentedDocumentModeCode"/>
                     <xsl:if test="catESAD_cu:ProvidingIndicationMark">
						<xsl:text>/</xsl:text>
						<xsl:value-of select="catESAD_cu:ProvidingIndicationMark"/>
                     </xsl:if>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                     <xsl:if test="catESAD_cu:LicenseGoods">/<xsl:if test="catESAD_cu:LicenseGoods/catESAD_cu:AppNumber">
                           <xsl:value-of select="catESAD_cu:LicenseGoods/catESAD_cu:AppNumber"/>/</xsl:if>
                        <xsl:value-of select="catESAD_cu:LicenseGoods/catESAD_cu:GoodsNumericLic"/>
                     </xsl:if>
                     <xsl:if test="cat_ru:PrDocumentDate">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <!--xsl:if test="cat_ru:PrDocumentName">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="cat_ru:PrDocumentName"/>
                     </xsl:if-->
                     <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
                        <xsl:text> с </xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:DocumentEndActionsDate">
                        <xsl:text> по </xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <xsl:if test="KDTout:RegNumberDocument and catESAD_cu:ProvidingIndicationMark='2'">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="KDTout:RegNumberDocument"/>
                        </xsl:if>
                     <xsl:if test="catESAD_cu:PresentingLackingDate and catESAD_cu:ProvidingIndicationMark='3'">
                        <xsl:text> Обязуюсь предоставить до </xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="catESAD_cu:PresentingLackingDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:CountryCode">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="catESAD_cu:CountryCode"/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:CustomsPaymentModeCodeType">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="catESAD_cu:CustomsPaymentModeCodeType"/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:TemporaryStorageImportDate">
                        <!--xsl:text> Срок временного ввоза </xsl:text-->
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="catESAD_cu:TemporaryStorageImportDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:TemporaryImportCode">
                        <xsl:text> /</xsl:text>
                        <xsl:value-of select="catESAD_cu:TemporaryImportCode"/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:SupplyStatus">
                        <xsl:text> /Опережающая поставка </xsl:text>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:SpecialSimplifiedCode">
                        <xsl:text> /</xsl:text>
                        <xsl:value-of select="catESAD_cu:SpecialSimplifiedCode"/>
                     </xsl:if>
                     <!--xsl:if test="catESAD_cu:TotalDocuments">
                        <xsl:text> </xsl:text>Общее количество документов:
									<xsl:value-of select="catESAD_cu:TotalDocuments"/>
                     </xsl:if-->
                     <br/>
                  </xsl:for-each>
                  <xsl:for-each select="$goods/KDTout:KDToutCustomsConditions">
                     <xsl:if test="catESAD_cu:ProcessingPlace">
							Место переработки:<xsl:value-of select="catESAD_cu:ProcessingPlace"/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:PlaceProcessing">
							Адрес переработки:<xsl:value-of select="catESAD_cu:PlaceProcessing/cat_ru:PostalCode"/> 
							<xsl:value-of select="catESAD_cu:PlaceProcessing/cat_ru:CountryCode"/> 
							<xsl:value-of select="catESAD_cu:PlaceProcessing/cat_ru:CounryName"/> 
							<xsl:value-of select="catESAD_cu:PlaceProcessing/cat_ru:Region"/> 
							<xsl:value-of select="catESAD_cu:PlaceProcessing/cat_ru:City"/> 
							<xsl:value-of select="catESAD_cu:PlaceProcessing/cat_ru:StreetHouse"/> 
						</xsl:if>
                     <xsl:if test="catESAD_cu:Organization">
                        <xsl:apply-templates mode="org" select="catESAD_cu:Organization"/>
                        <br/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:Substitute">
							Заменители:
							<xsl:for-each select="catESAD_cu:Substitute">
                           <xsl:value-of select="."/> 
							</xsl:for-each>
                        <br/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:if>
            </td>
            <td colspan="3">
               <table>
                  <tr>
                     <td style="border:solid 0.8pt black;">
                        <b>41</b>
                                Дополнит.единицы
                                <br/>
                        <xsl:choose>
                           <xsl:when test="$goods/KDTout:SupplementaryGoodsQuantity">
                              <xsl:value-of select="$goods/KDTout:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
                              <xsl:text disable-output-escaping="yes">/</xsl:text>
                              <xsl:value-of select="$goods/KDTout:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>/
										<xsl:value-of select="$goods/KDTout:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
                           </xsl:when>
                        </xsl:choose>
                     </td>
                     <td style="border:solid 0.8pt black;">
                        <b>42</b>
                                Цена товара
                                <br/>
                        <xsl:value-of select="$goods/catESAD_cu:InvoicedCost"/>
                     </td>
                     <td class="tb tr nowrap" style="vertical-align: top;">
                        <b>43</b> Код МОС<br/>
                        <span>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="$goods/catESAD_cu:CustomsCostCorrectMethod"/>
                        </span>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="green" colspan="3">
               <table>
                  <tr>
                     <td rowspan="2"/>
                     <td class="br nowrap">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" style="border-top:solid 0.8pt black;border-bottom:solid 0pt black;border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
                        <b>45</b>
                                Таможенная стоимость
                                <!--<br/>
                        <xsl:value-of select="$goods/catESAD_cu:CustomsCost"/>
                        <xsl:if test="$goods/catESAD_cu:CustomsCostCorrectMethod">
                                    /<xsl:value-of select="$goods/catESAD_cu:CustomsCostCorrectMethod"/>
                        </xsl:if>-->
                     </td>
                  </tr>
                  <tr>
                     <td class="br bb bl" style="width: 15px;"/>
                     <td style="border-bottom:solid 0pt black;border-left:solid 0pt black;border-right:solid 1.5pt black;width:25mm;" align="center"><xsl:value-of select="$goods/catESAD_cu:CustomsCost"/></td>
							<td style="border-bottom:solid 0pt black;border-left:solid 0pt black;border-right:solid 0.8pt black;width:35mm;" align="center"><xsl:value-of select="$goods/KDTout:PreviousCustomsCost"/></td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td colspan="3">
               <table>
                  <tr>
                     <td class="green tb" width="20px"/>
                     <td style="border:solid 0.8pt black;width:25mm;">
								<b>45а</b>
                                Код изменений
                                <br/>
                                	<xsl:choose>
									<xsl:when test="$goods/KDTout:ChangeCode"><xsl:for-each select="$goods/KDTout:ChangeCode">
								<xsl:value-of select="KDTout:PhaseChanges"/>/<xsl:value-of select="KDTout:BasisCompilation"/>/<xsl:value-of select="KDTout:QuantityChanges"/>/<xsl:value-of select="KDTout:CountryChanges"/>/<xsl:value-of select="KDTout:TNVEDChanges"/>/<xsl:value-of select="KDTout:CustCostChanges"/>/<xsl:value-of select="KDTout:CustomsPaymentChanges"/>/<xsl:value-of select="KDTout:OtherChanges"/></xsl:for-each></xsl:when>
					</xsl:choose>
								
								</td>
							<td style="border:solid 0.8pt black;width:35mm;">			
                    
                        <b>46</b>
                                Статистическая стоимость
                                <br/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:if test="$goods/catESAD_cu:StatisticalCost">
                           <xsl:apply-templates select="$goods/catESAD_cu:StatisticalCost"/>
                           <xsl:text>/</xsl:text>
                        </xsl:if>
                        <!--xsl:choose>
									<xsl:when test="$goods/catESAD_cu:ConformityStatCostIndicator = 1  or catESAD_cu:ConformityStatCostIndicator = 'true'">
                                        1
                                    </xsl:when>
									<xsl:otherwise>0</xsl:otherwise>
								</xsl:choose-->
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!--Платежи по товару-->
   <xsl:template name="GoodsPayments">
      <xsl:param name="goods"/>
      <xsl:param name="GoodsNumberDescription" select="''"/>
      <table class="paymentInfo">
         <tr>
            <td class="t">Вид</td>
            <td class="t">Основа начисления</td>
            <td class="t">Ставка</td>
            <td class="t">Сумма</td>
            <td class="t" style="border-right:0pt;">СП</td>
            <!--<td class="tb">Предыдущая сумма</td>-->
         </tr>
         <xsl:variable name="paymentDetails" select="$goods/KDTout:KDToutCustomsPaymentCalculation"/>
         <xsl:choose>
            <xsl:when test="count($paymentDetails) > 0">
               <xsl:apply-templates select="$paymentDetails"/>
            </xsl:when>
            <xsl:otherwise>
               <tr>
                  <td class="t"/>
                  <td class="t"/>
                  <td class="t"/>
                  <td class="t"/>
                  <td class="t"/>
                  <!--<td class="tb"/>-->
               </tr>
               <tr>
                  <td class="t"/>
                  <td class="t"/>
                  <td class="t"/>
                  <td class="t"/>
                  <td class="t"/>
                  <!--<td class="tb"/>-->
               </tr>
               <tr>
                  <td class="t"/>
                  <td class="t"/>
                  <td class="t"/>
                  <td class="t"/>
                  <td class="t"/>
                  <!--<td class="tb"/>-->
               </tr>
            </xsl:otherwise>
         </xsl:choose>
         <tr>
            <td colspan="6">
				<br/>
               <!--xsl:text>Общая сумма, подлежащая взысканию (возврату)</xsl:text>
               <xsl:value-of select="$GoodsNumberDescription"/>
               <xsl:text>, руб.</xsl:text>
               <xsl:variable name="paymentAmounts" select="$goods/../KDTout:KDToutPayments/KDTout:KDToutCustomsPayment/catESAD_cu:PaymentAmount"/>
               <xsl:variable name="paymentPrevious" select="$goods/../KDTout:KDToutPayments/KDTout:KDToutCustomsPayment/KDTout:PaymentPrevious"/>
               <xsl:if test="count($paymentAmounts | $paymentPrevious) > 0">
                  <xsl:text>: </xsl:text>
                  <xsl:value-of select="format-number(sum($paymentAmounts) - sum($paymentPrevious), $moneyNumberFormat)"/>
               </xsl:if-->
				<!-- вышестояший текст закомментирован на основании того, что в бланке нет 
					бланк - Решение Коллегии Евразийской экономической комиссии № 289 от 10 декабря 2013 года
					(раньше было по:
					Решению Комиссии Таможенного союза от 20 мая 2010 г. N 255 (в редакции Решения Комиссии Таможенного союза от 19 мая 2011 г. N 639),
					Приказу ФТС России № 976 от 12 мая 2011 года "О форме заявления таможенному органу уточненных сведений о товарах, заявленных в периодической таможенной декларации",
					но они отменены Решением Коллегии ЕЭК № 289 от 10 декабря 2013 года)
				-->
            </td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template match="KDTout:KDToutCustomsPaymentCalculation">
      <tr>
         <td class="t">
            <xsl:value-of select="catESAD_cu:PaymentModeCode"/>
         </td>
         <td class="t">
			<xsl:if test="catESAD_cu:TaxBase">
				<xsl:value-of select="catESAD_cu:TaxBase"/>
			</xsl:if>
         </td>
         <td class="t">
            <xsl:value-of select="catESAD_cu:Rate"/>
            <xsl:if test="catESAD_cu:PaymentModeCode != 10">
               <xsl:text> </xsl:text>
               <xsl:choose>
                  <xsl:when test="catESAD_cu:RateTypeCode = '*'">
                     <xsl:value-of select="catESAD_cu:RateTNVEDQualifierCode"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:if test="catESAD_cu:Rate">%</xsl:if>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
         </td>
         <td class="t">
            <xsl:apply-templates select="catESAD_cu:PaymentAmount"/>
         </td>
         <td class="t" style="border-right:0pt;">
            <!--<xsl:apply-templates select="catESAD_cu:PaymentWayCode"/>-->
            <xsl:value-of select="catESAD_cu:PaymentCode"/>
         </td>
        <!-- <td class="tb">
            <xsl:apply-templates select="KDTout:PaymentPrevious"/>
         </td>-->
      </tr>
   </xsl:template>
   <xsl:template match="catESAD_cu:IdentityCard | cat_ru:IdentityCard">
      <xsl:apply-templates select="cat_ru:IdentityCardCode"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="cat_ru:IdentityCardName"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="cat_ru:IdentityCardSeries"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="cat_ru:IdentityCardNumber"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
      <xsl:text> </xsl:text>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="cat_ru:OrganizationName"/>
   </xsl:template>
   <xsl:template match="catESAD_cu:IdentityCard/*">
      <xsl:if test="preceding-sibling::*[1]">,</xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="*" mode="date">
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="."/>
      </xsl:call-template>
   </xsl:template>
   <xsl:template match="*" mode="dateGtdNumber">
      <xsl:call-template name="russian_date_gtd">
         <xsl:with-param name="dateIn" select="."/>
      </xsl:call-template>
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
   <xsl:template name="russian_date_gtd">
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
   <xsl:template match="KDTout:KTDoutDeclarant">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <span class="graph">(</span>
         <xsl:value-of select="cat_ru:ShortName"/>
         <span class="graph">)</span>
      </xsl:if>
		<xsl:if test="KDTout:ContractorIndicator='1'"> 'контрагент'</xsl:if>
		<xsl:if test="KDTout:ContractorIndicator='2'"> 'РАЗНЫЕ ПО СПИСКУ'</xsl:if>
      <br/>
      <xsl:apply-templates select="cat_ru:Address"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:if test="cat_ru:Contact/cat_ru:E_mail">
         <xsl:value-of select="cat_ru:Contact/cat_ru:E_mail"/>
      </xsl:if>
      <xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
         <br/>
         <!--<xsl:text>№ </xsl:text>-->
         <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
            <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
         </xsl:if>
         <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
            <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
         </xsl:if>
      </xsl:if>
      <br/>
      <xsl:apply-templates select="cat_ru:IdentityCard"/>
   </xsl:template>
   <xsl:template match="catESAD_cu:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="catESAD_cu:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: 
         <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="catESAD_cu:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>
         ИТН: 
         <xsl:value-of select="cat_ru:CategoryCode"/>/
         <xsl:value-of select="cat_ru:KATOCode"/>/
         <xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">
            /<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
         <br/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/>,
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
      		<xsl:value-of select="cat_ru:CounryName"/>
      	</xsl:if> 
		<xsl:value-of select="cat_ru:CountryCode"/>,
		<xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/>,
		</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/>,
		</xsl:if>
      <xsl:value-of select="cat_ru:StreetHouse"/>
   </xsl:template>
   	<xsl:template match="KDTout:PaymentDocument">
	<table>
		<tbody>
			<tr>
				<td style="width:45mm;">
				<xsl:if test="cat_ru:PrDocumentNumber">№ <xsl:value-of select="cat_ru:PrDocumentNumber"/></xsl:if>
				<xsl:if test="cat_ru:PrDocumentDate"> от <xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
				</xsl:if>
				Сумма уплаты / возврата 
					<xsl:if test="KDTout:DocPaymentAmount">
						<xsl:value-of select="format-number(KDTout:DocPaymentAmount,$moneyNumberFormat)"/>
					</xsl:if>
				</td>
				<td style="border-left: solid 1pt #000000;width:5mm;"><xsl:value-of select="KDTout:PaymentWayCode"/></td>
			</tr>
		</tbody>
	</table>
		
	
	</xsl:template>
	<xsl:template name="EmptyGoods">
		<xsl:param name="EmpGoods"/>
		<table width="100%">
			<tr>
				<td rowspan="4" style="width:68px;" class=" tr tb">
					<b>31</b> Грузовые места<br/>и описание<br/>товаров</td>
				<td class=" green nowrap">Маркировка и количество - Номера контейнеров - Количество и отличительные особенности</td>
				<td class=" green">
					<table>
						<tr>
							<td colspan="2" class=" bl nowrap">
								<b>32</b> Товар</td>
						</tr>
						<tr>
							<td class="bl bb br" align="center">
								<!--<xsl:apply-templates select="$goods/catESAD_cu:GoodsNumeric"/>-->
							</td>
							<td class=" tb" align="center">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>№
								<!--<xsl:value-of select="$goods/catESAD_cu:GoodFeatures"/>-->
							</td>
						</tr>
					</table>
				</td>
				<td class=" tl tb tr nowrap">
					<b>33</b> Код товара<br/>
					<!--<xsl:value-of select="substring($goods/catESAD_cu:GoodsTNVEDCode,1,10)"/>-->
				</td>
				<td colspan="2" style="border:solid 0.8pt black;">
					<br/>
					<table>
						<tr>
							<td style="border-right:solid 0.8pt black;"/>
							<td style="border-right:solid 0.8pt black;"/>
						</tr>
						<tr>
							<td style=" border-right:solid 0.8pt black;" align="center">
								<!--<xsl:if test="$goods/catESAD_cu:AdditionalSign">
									<xsl:value-of select="$goods/catESAD_cu:AdditionalSign"/>
								</xsl:if>
								<xsl:if test="$goods/catESAD_cu:IntellectPropertySign">
									<xsl:value-of select="$goods/catESAD_cu:IntellectPropertySign"/>
								</xsl:if>
								<xsl:choose>
									<xsl:when test="$goods/catESAD_cu:GoodsClassificationCode=1">О</xsl:when>
								</xsl:choose>-->
							</td>
							<td style=" border-right:solid 0.8pt black;" align="center">
								<!--<xsl:value-of select="$goods/catESAD_cu:GoodsAddTNVEDCode"/>-->
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td style=" border-right:solid 0.8pt black;" align="center" width="25mm">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td style=" border: 0" align="center" width="25mm">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td rowspan="3" colspan="2" style="border-bottom:solid 0.8pt black;background:#FFFFFF;">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>	
				</td>
				<td>
					<table>
						<tr>
							<td colspan="4" style="border-left:solid 1.5pt black;border-right:solid 1.5pt black;" class="nowrap">
								<b>34</b>
                                Код страны происх.
                            </td>
						</tr>
						<tr>
							<td style="border-left:solid 1.5pt black;border-right:solid 0.8pt black;border-bottom:solid 1.5pt black;">a
                            </td>
							<td style="border-right:solid 0.8pt black;border-bottom:solid 1.5pt black;" align="center">
								<!--<xsl:apply-templates select="$goods/catESAD_cu:OriginCountryCode"/>-->
							</td>
							<td style="border-right:solid 0.8pt black;border-bottom:solid 1.5pt black;">b
                            </td>
							<td style="border-right:solid 1.5pt black;border-bottom:solid 1.5pt black;"/>
						</tr>
					</table>
				</td>
				<td style="border:solid 0.8pt black;background:#FFFFFF;">
					<b>35</b>
                    Вес брутто (кг)
                    <br/>
					<!--<xsl:value-of select="$goods/catESAD_cu:GrossWeightQuantity"/>-->
				</td>
				<td style="border:solid 0.8pt black;" class=" nowrap">
					<b>36</b>
                    Преференция
                    <br/>
					<!--<xsl:value-of select="$goods/catESAD_cu:Preferencii/catESAD_cu:CustomsTax"/>
					<xsl:value-of select="$goods/catESAD_cu:Preferencii/catESAD_cu:CustomsDuty"/>
					<xsl:value-of select="$goods/catESAD_cu:Preferencii/catESAD_cu:Excise"/>
					<xsl:value-of select="$goods/catESAD_cu:Preferencii/catESAD_cu:Rate"/>-->
				</td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td colspan="2" style="border-left:solid 1.5pt black;border-right:solid 1.5pt black;border-top:solid 0.8pt black;">
								<b>37</b>
                                Процедура
                            </td>
						</tr>
						<tr>
							<td style="border-left:solid 1.5pt black;border-right:solid 0.8pt black;border-bottom:solid 1.5pt black;" align="center">
								<!--<xsl:apply-templates select="$goods/KDTout:CustomsProcedure/catESAD_cu:MainCustomsModeCode"/>
								<xsl:apply-templates select="$goods/KDTout:CustomsProcedure/catESAD_cu:PrecedingCustomsModeCode"/>-->
								<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
							</td>
							<td style="border-right:solid 1.5pt black;border-bottom:solid 1.5pt black;" align="center">
								<!--<xsl:apply-templates select="$goods/KDTout:CustomsProcedure/catESAD_cu:GoodsTransferFeature"/>-->
							</td>
						</tr>
					</table>
				</td>
				<td style="border:solid 0.8pt black;background:#FFFFFF;">
					<b>38</b>
                    Вес нетто (кг)
                    <br/>
					<!--<xsl:value-of select="$goods/catESAD_cu:NetWeightQuantity"/>
					<xsl:if test="$goods/catESAD_cu:NetWeightQuantity2">
						/<xsl:value-of select="$goods/catESAD_cu:NetWeightQuantity2"/>
					</xsl:if>-->
				</td>
				<td style="border:solid 0.8pt black;">
					<b>39</b>
					 Квота
					<br/>
					
					
				</td>
			</tr>
			<tr>
				<td colspan="3" style="border:solid 0.8pt black;background:#FFFFFF;" class=" nowrap">
					<b>40</b>
                    Общая декларация/Предшествующий документ
                    <br/>
					
				</td>
			</tr>
			<tr>
				<td rowspan="3" class="firstCol tr">
					<b>44</b> Дополнит. информация/ Представл. документы
                </td>
				<td rowspan="3" colspan="2" style="border-bottom:solid 0.8pt black;border-top:solid 0.8pt black;background:#FFFFFF;">
					
				</td>
				<td colspan="3">
					<table>
						<tr>
							<td style="border:solid 0.8pt black;">
								<b>41</b>
                                Дополнит.единицы
                                <br/>
								<!--<xsl:choose>
									<xsl:when test="$goods/KDTout:SupplementaryGoodsQuantity">
										<xsl:value-of select="$goods/KDTout:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
										<xsl:text disable-output-escaping="yes">/</xsl:text>
										<xsl:value-of select="$goods/KDTout:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>/
										<xsl:value-of select="$goods/KDTout:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
									</xsl:when>
								</xsl:choose>-->
							</td>
							<td style="border:solid 0.8pt black;">
								<b>42</b>
                                Цена товара
                                <br/>
							<!--	<xsl:value-of select="$goods/catESAD_cu:InvoicedCost"/>-->
							</td>
							<td class="tb tr nowrap" style="vertical-align: top;">
								<b>43</b> Код МОС<br/>
								<span>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<!--<xsl:value-of select="$goods/catESAD_cu:CustomsCostCorrectMethod"/>-->
								</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3" class="green">
					<table>
						<tr>
							<td rowspan="2"/>
							<td class="br nowrap">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td colspan="2" style="border-top:solid 0.8pt black;border-bottom:solid 0pt black;border-left:solid 0.8pt black;border-right:solid 0.8pt black;">
								<b>45</b>
                                Таможенная стоимость
                               <!-- <br/>
								<xsl:value-of select="$goods/catESAD_cu:CustomsCost"/>
								<xsl:if test="$goods/catESAD_cu:CustomsCostCorrectMethod">
                                    /<xsl:value-of select="$goods/catESAD_cu:CustomsCostCorrectMethod"/>
								</xsl:if>-->
							</td>
						</tr>
						<tr>
							<td style="width: 15px;" class="br bb bl"/>
							<td style="border-bottom:solid 0pt black;border-left:solid 0pt black;border-right:solid 1.5pt black;width:25mm;" align="center"><!--<xsl:value-of select="$goods/catESAD_cu:CustomsCost"/>--></td>
							<td style="border-bottom:solid 0pt black;border-left:solid 0pt black;border-right:solid 0.8pt black;width:35mm;" align="center"><!--<xsl:value-of select="$goods/KDTout:PreviousCustomsCost"/>--></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<table>
						<tr>
							<td class="green tb" width="20px"/>
							<td style="border:solid 0.8pt black;width:25mm;">
								<b>45а</b>
                                Код изменений
                                <br/>
                                	<!--<xsl:choose>
									<xsl:when test="$goods/KDTout:ChangeCode"><xsl:for-each select="$goods/KDTout:ChangeCode">
								<xsl:value-of select="KDTout:PhaseChanges"/>/<xsl:value-of select="KDTout:BasisCompilation"/>/<xsl:value-of select="KDTout:QuantityChanges"/>/<xsl:value-of select="KDTout:CountryChanges"/>/<xsl:value-of select="KDTout:TNVEDChanges"/>/<xsl:value-of select="KDTout:CustCostChanges"/>/<xsl:value-of select="KDTout:CustomsPaymentChanges"/>/<xsl:value-of select="KDTout:OtherChanges"/></xsl:for-each></xsl:when>
								<xsl:when test="$goods[not(KDTout:ChangeCode)]">
								<xsl:for-each select="/KDTout:KDTout_CU/KDTout:ChangeCode">
								<xsl:value-of select="KDTout:PhaseChanges"/>/<xsl:value-of select="KDTout:BasisCompilation"/>/<xsl:value-of select="KDTout:QuantityChanges"/>/<xsl:value-of select="KDTout:CountryChanges"/>/<xsl:value-of select="KDTout:TNVEDChanges"/>/<xsl:value-of select="KDTout:CustCostChanges"/>/<xsl:value-of select="KDTout:CustomsPaymentChanges"/>/<xsl:value-of select="KDTout:OtherChanges"/></xsl:for-each></xsl:when>
								</xsl:choose>-->
								<xsl:for-each select="$EmpGoods/KDTout:ChangeCode"><xsl:value-of select="KDTout:PhaseChanges"/>/<xsl:value-of select="KDTout:BasisCompilation"/>/<xsl:value-of select="KDTout:QuantityChanges"/>/<xsl:value-of select="KDTout:CountryChanges"/>/<xsl:value-of select="KDTout:TNVEDChanges"/>/<xsl:value-of select="KDTout:CustCostChanges"/>/<xsl:value-of select="KDTout:CustomsPaymentChanges"/>/<xsl:value-of select="KDTout:OtherChanges"/></xsl:for-each>
								</td>
							<td style="border:solid 0.8pt black;width:35mm;">
								<b>46</b>
                                Статистическая стоимость
                                <br/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<!--<xsl:if test="$goods/catESAD_cu:StatisticalCost">
									<xsl:apply-templates select="$goods/catESAD_cu:StatisticalCost"/>
									<xsl:text>/</xsl:text>
								</xsl:if>-->
								<!--xsl:choose>
									<xsl:when test="$goods/catESAD_cu:ConformityStatCostIndicator = 1  or catESAD_cu:ConformityStatCostIndicator = 'true'">
                                        1
                                    </xsl:when>
									<xsl:otherwise>0</xsl:otherwise>
								</xsl:choose-->
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
