<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ccp="urn:customs.ru:Information:CustomsDocuments:CalculationAmountPayment:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
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
   <xsl:template name="russian_date2">
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
   <xsl:template match="ccp:CalculationAmountPayment">
      <html>
         <head>
            <title>Расчет суммы обеспечения</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    div.page {
                        width: 210mm;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                    }

                    td {
                        font-family: Courier;
                    }

                    .normal {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        border-left: medium none;
                        border-right: medium none;
                        border-top: medium none;
                        border-bottom: 1pt solid windowtext;
                    }

                    .bold2 {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 9pt;
                    }

                    .normal2 {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        border-left: 1pt solid windowtext;
                        border-right: 1pt solid windowtext;
                        border-top: 1pt solid windowtext;
                        border-bottom: 1pt solid windowtext;
                    }

                    .bold {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        vertical-align: top;
                    }

                    .bold1 {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        border-left: 1pt solid windowtext;
                        border-right: 1pt solid windowtext;
                        border-top: 1pt solid windowtext;
                        border-bottom: 1pt solid windowtext;
                    }

                    .bold3 {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        border-left: 1pt solid windowtext;
                        border-right: 1pt solid windowtext;
                        border-top: 1pt solid windowtext;
                        border-bottom: medium none;
                    }

                    .bold4 {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        border-left: 1pt solid windowtext;
                        border-right: 1pt solid windowtext;
                        border-top: none;
                        border-bottom: none;
                        vertical-align: top;
                    }

                    .bold5 {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        border-left: 1pt solid windowtext;
                        border-right: 1pt solid windowtext;
                        border-top: medium none;
                        border-bottom: 1pt solid windowtext;
                    }

                    .bold6 {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        border-left: 1pt solid windowtext;
                        border-right: medium nonet;
                        border-top: 1pt solid windowtext;
                        border-bottom: medium none;
                    }

                    .bold7 {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        border-left: medium nonet;
                        border-right: 1pt solid windowtext;
                        border-top: 1pt solid windowtext;
                        border-bottom: medium nonet;
                    }

                    .bold8 {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        border-left: medium nonet;
                        border-right: 1pt solid windowtext;
                        border-top: medium nonet;
                        border-bottom: medium nonet;
                    }

                    .bold9 {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        border-left: medium nonet;
                        border-right: medium nonet;
                        border-top: 1pt solid windowtext;
                        border-bottom: medium nonet;
                    }

                    .bold10 {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        border-left: medium none;
                        border-right: 1pt solid windowtext;
                        border-top: medium none;
                        border-bottom: 1pt solid windowtext;
                    }

                    .italic {
                        font-style: italic;
                        font-family: Arial;
                        font-size: 9pt
                    }

                    .graph {
                        font-family: Arial;
                        font-size: 10pt;
                        font-weight: bold;
                    }

                    .graphMain {
                        font-family: Arial;
                        font-size: 10pt;
                        font-weight: normal;
                    }

                    .graphLittle {
                        font-family: Arial;
                        font-size: 7pt;
                    }

                    .graph8Bold {
                        font-family: Arial;
                        font-size: 8pt;
                        font-weight: bold;
                    }

                    .bordered {
                        border: solid 1pt #000000;
                    }

                    @media print {
                        div.page {
                            border: none;
                        }
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" class="bold" colspan="6" style="width:190mm">
                                    РАСЧЕТ СУММЫ ОБЕСПЕЧЕНИЯ <br/> уплаты таможенных пошлин, налогов <br/> по декларации на товары N 
                                    <span class="normal">
                              <xsl:value-of select="ccp:GTDID/cat_ru:CustomsCode"/>
                              <xsl:text>/ </xsl:text>
                              <xsl:call-template name="russian_date2">
                                 <xsl:with-param name="dateIn" select="ccp:GTDID/cat_ru:RegistrationDate"/>
                              </xsl:call-template>
                              <xsl:text>/ </xsl:text>
                              <xsl:value-of select="ccp:GTDID/cat_ru:GTDNumber"/>
                           </span>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <br/>
               <table border="0" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="bold" style="width:20mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="bold" style="width:35mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="bold" style="width:30mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="bold3" style="width:45mm">
                                    Лист №
                                    <span class="graphMain">
                              <xsl:value-of select="ccp:NumberSheet"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="bold" colspan="2" style="width:105mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="bold3" colspan="2" style="width:85mm">
                                    Итого: сумма обеспечения по ДТ
                                    <span class="graphMain">
                              <xsl:value-of select="ccp:Total"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="bold" style="width:20mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="bold3" colspan="3" style="width:170mm">
                                    Количество товаров, в отношении которых требуется обеспечение
                                    <span class="graphMain">
                              <xsl:value-of select="ccp:Quantity"/>
                           </span>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" cellpadding="0" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="bold3" style="width:95mm">
                                    Маркировка и количество товара, описание товара, наименование производителя
                                </td>
                        <td align="left" class="bold7" colspan="2" style="width:30mm">
                                    Товар №
                                </td>
                        <td align="left" class="bold7" colspan="2" style="width:65mm">
                                    Код товара
                                </td>
                     </tr>
                     <xsl:for-each select="ccp:DescriptionGoods">
                        <tr>
                           <td align="left" class="bold4" style="width:95mm">
                              <br/>
                              <xsl:apply-templates select="ccp:GoodsDescription"/>,
                                        
                                        <!--xsl:if test="ccp:NameProducer">производитель:
                                            <xsl:value-of select="ccp:NameProducer"/>
                              </xsl:if-->
                              <br/>
                              <xsl:apply-templates select="ccp:GoodsGroupDescription"/>
                              
                              <xsl:if test="ccp:NetWeightQuantity2">
								  <br/>
								  Вес нетто, без учета всех видов упаковки (кг): <xsl:value-of select="ccp:NetWeightQuantity2"/>
							  </xsl:if>
							  <xsl:if test="ccp:GrossWeightQuantity">
								  <br/>
								  Вес брутто (кг): <xsl:value-of select="ccp:GrossWeightQuantity"/>
							  </xsl:if>
                           </td>
                           <td align="left" class="bold" style="width:15mm">
                              <br/>
                              <xsl:value-of select="ccp:Position"/>
                           </td>
                           <td align="left" class="bold4" style="width:15mm">
                              <br/>
                              <xsl:value-of select="ccp:AllQuantityGoods"/>
                           </td>
                           <td align="left" class="bold8" colspan="2" style="width:65mm">
                              <xsl:value-of select="ccp:GoodsTNVEDCode"/>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td align="left" class="bold4" style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" class="bold9" colspan="2" style="width:30mm">
                                    Страна происхо
                                </td>
                        <td align="left" class="bold7" style="width:30mm">
                                    ждения товара
                                </td>
                        <td align="left" class="bold7" style="width:35mm">
                                    Всего нетто (кг)
                                </td>
                     </tr>
                     <xsl:for-each select="ccp:DescriptionGoods">
                        <tr>
                           <td align="left" class="bold4" style="width:95mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="right" class="bold8" style="width:15mm">
                              <span class="graphMain">
                                 <xsl:value-of select="ccp:CountryCode"/>
                              </span>
                           </td>
                           <td align="left" class="bold8" colspan="2" style="width:45mm">
                              <span class="graphMain">
                                 <xsl:value-of select="ccp:OriginCountryName"/>
                              </span>
                           </td>
                           <td align="left" class="bold8" style="width:35mm">
                              <span class="graphMain">
                                 <xsl:value-of select="ccp:NetWeightQuantity"/>
                              </span>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td align="left" class="bold4" style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" class="bold9" style="width:15mm">
                                    Таможе
                                </td>
                        <td align="left" class="bold7" colspan="3" style="width:80mm">
                                    нная стоимость, заявленная декларантом
                                </td>
                     </tr>
                     <xsl:for-each select="ccp:DescriptionGoods">
                        <tr>
                           <td align="left" class="bold4" style="width:95mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" class="bold8" colspan="4" style="width:95mm">
                              <span class="graphMain">
                                 <xsl:value-of select="ccp:CustomsCost"/>
                              </span>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <table border="0" cellpadding="0" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="bold3" colspan="6" style="width:190mm">
                                    Источники информации для выбора основы расчета суммы обеспечения
                                </td>
                     </tr>
                     <xsl:for-each select="ccp:DescriptionGoods">
                        <tr>
                           <td align="left" class="bold4" colspan="6" style="width:190mm">
                              <span class="graphMain">
                                 <xsl:value-of select="ccp:SourceInformation"/>
                              </span>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td align="left" class="bold3" colspan="6" style="width:190mm">
                                    Основа для расчета суммы обеспечения (в национальной валюте): общая сумма
                                </td>
                     </tr>
                     <xsl:for-each select="ccp:DescriptionGoods">
                        <tr>
                           <td align="left" class="bold4" colspan="4" style="width:95mm">
                              <span class="graphMain">
                                 <xsl:value-of select="ccp:ReasonCalculationPayment"/>
                              </span>
                           </td>
                           <td align="left" class="bold8" style="width:95mm" colspan="2">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td align="left" class="bold3" colspan="4" style="width:95mm">
                                    Расчет суммы обеспечения
                                </td>
                        <td align="left" class="bold7" style="width:95mm" colspan="2">
                                    Сумма таможенных пошлин, налогов, уплаченных декларантом (в соответествии с декларацией на товары)
                                </td>
                     </tr>
                     <!--<xsl:for-each select="ccp:DescriptionGoods">
                        <tr>
                           <td align="left" class="bold4" colspan="4" style="width:95mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" class="bold8" style="width:95mm">
                              <span class="graphMain">
                                 <xsl:value-of select="ccp:AmountDues"/>
                              </span>
                           </td>
                        </tr>
                     </xsl:for-each>-->
                     <tr>
                        <td align="center" class="bold3" style="width:15mm">
							Вид
						</td>
                        <td align="center" class="bold7" style="width:39mm">
							Основа начисления
						</td>
                        <td align="center" class="bold7" style="width:18mm">
							Ставка
						</td>
                        <td align="center" class="bold7" style="width:18mm">
                            Сумма
                        </td>
                        <!--td align="left" class="bold7" style="width:95mm">
                           <table style="width:95mm">
								<tr-->
						<td style="width:47.5mm" align="center" class="bold8"><b>Вид</b></td>
						<td style="width:47.5mm" align="center" class="bold8"><b>Сумма 2</b></td>
								<!--/tr>
							</table>
                        </td-->
                     </tr>
                     <xsl:for-each select="ccp:DescriptionGoods">
                        <!--tr>
                           <td class="normal" colspan="4" style="width:95mm"-->
                              <xsl:for-each select="ccp:Calculation">
                                 <!--table border="0" cellpadding="0" cellspacing="0">
                                    <tbody-->
										<xsl:variable name="code" select="ccp:PaymentModeCode"/>
                                       <tr valign="top">
                                          <td align="center" class="bold4" style="width:15mm">
                                             <span class="graphMain">
                                                <xsl:value-of select="$code"/>
                                             </span>
                                          </td>
                                          <td align="center" class="bold" style="width:39mm">
                                             <span class="graphMain">
                                                <xsl:value-of select="ccp:TaxBase"/>
                                             </span>
                                             <xsl:text> </xsl:text>
                                             <span class="graphMain">
                                                <xsl:if test="ccp:TaxBaseCurrencyCode">
												(<xsl:value-of select="ccp:TaxBaseCurrencyCode"/>)
											</xsl:if>
                                             </span>
                                          </td>
                                          <td align="center" class="bold4" style="width:18mm">
                                             <span class="graphMain">
                                                <xsl:value-of select="ccp:Rate"/>
                                             </span>
                                             <span class="graphMain">
                                                <xsl:value-of select="ccp:RateTypeCode"/>
                                             </span>
                                             <br/>
                                             <span class="graphMain">
                                                <xsl:if test="ccp:TaxBaseCurrencyCode">
												(<xsl:value-of select="ccp:TaxBaseCurrencyCode"/>)
											</xsl:if>
                                             </span>
                                          </td>
                                          <td align="center" class="bold8" style="width:18mm">
                                             <span class="graphMain">
                                                <xsl:value-of select="ccp:Amount"/>
                                             </span>
                                          </td>
                                          <td align="center" style="width:47.5mm">
												<span class="graphMain">
												<!--xsl:for-each select="ccp:AmountDuesCalculation">
												<xsl:value-of select="ccp:PaymentModeCode"/>
												<xsl:if test="position()!=last()"><br/></xsl:if>
												</xsl:for-each-->
												<xsl:value-of select="../ccp:AmountDuesCalculation[ccp:PaymentModeCode = $code]/ccp:PaymentModeCode"/>
												</span>
											</td>
										  <td align="center" class="bold8" style="width:47.5mm">
												<span class="graphMain">
													<xsl:for-each select="../ccp:AmountDuesCalculation[ccp:PaymentModeCode = $code]">
														<xsl:value-of select="ccp:AmountDues"/>
														<xsl:if test="position()!=last()"><br/></xsl:if>
													</xsl:for-each>
												</span>
											</td>
                                       </tr>
                                    <!--/tbody>
                                 </table-->
                              </xsl:for-each>
                           <!--/td>
                           <td align="left" class="bold8" style="width:95mm">
                              <table style="width:95mm">
									<tr>
										<td align="center" style="width:47.5mm">
										<span class="graphMain">
										<xsl:for-each select="ccp:AmountDuesCalculation">
										<xsl:value-of select="ccp:PaymentModeCode"/>
										<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
										</span>
										</td>
										<td align="center" style="width:47.5mm">
										<span class="graphMain">
										<xsl:for-each select="ccp:AmountDuesCalculation">
										<xsl:value-of select="ccp:AmountDues"/>
										<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
										</span>
										</td>
									</tr>
								</table>
                           </td>
                        </tr-->
                     </xsl:for-each>
                     <tr>
                        <td align="left" class="bold3" colspan="4" style="width:95mm">
                                    Итого (сумма 1)
                                    <xsl:for-each select="ccp:DescriptionGoods">
                              <span class="graphMain">
                                 <xsl:value-of select="ccp:TotalCustomsPayment"/>;
									</span>
                           </xsl:for-each>
                        </td>
                        <td align="left" class="bold7" style="width:95mm" colspan="2">
                                    Итого (сумма 2)
                                    <xsl:for-each select="ccp:DescriptionGoods">
                              <span class="graphMain">
                                 <xsl:value-of select="ccp:TotalCustomsDues"/>;
									</span>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="bold1" colspan="6" style="width:190mm">
                                    Итого сумма обеспечения по товару (сумма 1 - сумма 2)
                                    <xsl:for-each select="ccp:DescriptionGoods">
                              <span class="graphMain">
                                 <xsl:value-of select="ccp:TotalPaymentGoods"/>;
									</span>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <xsl:apply-templates select="ccp:CustomsPersonSignature"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="ccp:CustomsPersonSignature">
      <table border="1" style="margin-top:50px; width:100%; border:0">
         <tbody>
            <tr>
               <td align="center" style="border-right:0; border-left:0; border-top:0; width: 100mm">
                  <xsl:value-of select="cat_ru:PersonName"/>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0; width: 20mm" width="25%">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0;  width: 20mm" width="25%">
                  <xsl:value-of select="cat_ru:LNP"/>
               </td>
            </tr>
            <tr>
               <td align="center" style="border:0; vertical-align: top; font-family: Arial; font: 11">(инициалы и фамилия уполномоченного должностного лица таможенного органа)</td>
               <td style="border:0;"/>
               <td align="center" style="border:0; vertical-align: top; font-family: Arial; font: 11">подпись</td>
               <td style="border:0;"/>
               <td align="center" style="border:0; vertical-align: top; font-family: Arial; font: 11">ЛНП</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <!--Описание товарной группы-->
   <xsl:template match="ccp:GoodsGroupDescription">
      <xsl:if test="position() > 1">
         <br/>
         <br/>
      </xsl:if>
      <b>
         <xsl:apply-templates mode="spaceSeparatedText" select="catESAD_cu:GoodsDescription"/>
      </b>
      <xsl:apply-templates select="catESAD_cu:GoodsGroupInformation"/>
   </xsl:template>
   <!--Выводит текст элементов, разделённый пробелами-->
   <xsl:template match="*" mode="spaceSeparatedText">
      <xsl:if test="position() > 1">
         <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
   <!--Информация в описании товарной группы-->
   <xsl:template match="catESAD_cu:GoodsGroupInformation">
      <br/>
      <xsl:if test="catESAD_cu:Manufacturer">
         <b>Изготовитель: </b>
         <xsl:value-of select="catESAD_cu:Manufacturer"/>
         <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:if test="catESAD_cu:TradeMark">
         <b>Тов. знак: </b>
         <xsl:value-of select="catESAD_cu:TradeMark"/>
         <xsl:text>. </xsl:text>
      </xsl:if>
      <!--xsl:if test="catESAD_cu:MilitaryProductCategoryCode">
         <b>Катег. воен. прод.: </b>
         <xsl:value-of select="catESAD_cu:MilitaryProductCategoryCode"/>
         <xsl:text>. </xsl:text>
      </xsl:if-->
      <xsl:if test="catESAD_cu:GoodsMark">
         <b>Марка: </b>
         <xsl:value-of select="catESAD_cu:GoodsMark"/>
         <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:if test="catESAD_cu:GoodsMarking">
         <b>Артикул: </b>
         <xsl:value-of select="catESAD_cu:GoodsMarking"/>
         <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:if test="catESAD_cu:GoodsStandard">
         <b>Стандарт: </b>
         <xsl:value-of select="catESAD_cu:GoodsStandard"/>
         <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:if test="catESAD_cu:GoodsSort">
         <b>Сорт: </b>
         <xsl:value-of select="catESAD_cu:GoodsSort"/>
         <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:if test="catESAD_cu:WoodSortiment">
         <b>Наим. сортимента: </b>
         <xsl:value-of select="catESAD_cu:WoodSortiment"/>
         <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:if test="catESAD_cu:WoodKind">
         <b>Порода древесины: </b>
         <xsl:value-of select="catESAD_cu:WoodKind"/>
         <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:if test="catESAD_cu:Dimensions">
         <b>Размеры: </b>
         <xsl:value-of select="catESAD_cu:Dimensions"/>
         <xsl:text>. </xsl:text>
      </xsl:if>
      <xsl:apply-templates select="catESAD_cu:GoodsGroupQuantity"/>
   </xsl:template>
   <!--Количество товаров в группе-->
   <xsl:template match="catESAD_cu:GoodsGroupQuantity">
      <br/>
      <b>Количество: </b>
      <xsl:call-template name="quantity"/>
   </xsl:template>
   <!--Шаблон для отображения количества в заданных единицах измерения-->
   <xsl:template name="quantity">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierName or cat_ru:MeasureUnitQualifierCode">
         <xsl:text>, ед. изм.: </xsl:text>
         <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
         <xsl:if test="cat_ru:MeasureUnitQualifierCode">
            <xsl:text> (</xsl:text>
            <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
            <xsl:text>)</xsl:text>
         </xsl:if>
      </xsl:if>
      <xsl:text>. </xsl:text>
   </xsl:template>
</xsl:stylesheet>
