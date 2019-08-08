<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:s_con="urn:customs.ru:Information:CommercialFinanceDocuments:SupplementaryContract:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="s_con:SupplementaryContract">
      <html>
         <head>
            <title>Дополнительное соглашение</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {text-align: center; background: #cccccc;}
                    table {border: 0; width:100%; border-collapse: collapse; }
                    td {font-size: 6.0pt; font-family: Arial, sans-serif; color: black; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; padding-left:4pt; border: 1px solid black; padding: 3px;}
                    td.bold {font-size: 8pt; font-family: Arial, sans-serif; color: black; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; }
                    td.value {font-size: 10pt; font-family: Courier; color: black; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; }
                    td.border-left {border-left: medium none; border-right: 1px solid black; }
                    td.border {border-left: 1px solid black; border-right: 1px solid black; border-top: 1px solid black; border-bottom: 1px solid black; }
                    td.border-left {border-left: 1px solid black; border-right: medium none; border-top: medium none; border-bottom: medium none; } 
                    td.border-right {border-left: medium none; border-right: 1px solid black; border-top: medium none; border-bottom: medium none; } 
                    td.border-top {border-left: medium none; border-right: medium none; border-top: 1px solid black; border-bottom: medium none; } 
                    td.border-bottom {border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1px solid black; } 
                    td.border-top-bottom {border-left: medium none; border-right: medium none; border-top: 1px solid black; border-bottom: 1px solid black; } 
                    td.border-top-right {border-left: medium none; border-right: 1px solid black; border-top: 1px solid black; border-bottom: medium none; } 
                    td.border-top-right-bottom {border-left: medium none; border-right: 1px solid black; border-top: 1px solid black; border-bottom: 1px solid black; }
                    td.border-left-right-bottom {border-left: 1px solid black; border-right: 1px solid black; border-top: medium none; border-bottom: 1px solid black; }
                    td.border-left-right-top {border-left: 1px solid black; border-right: 1px solid black; border-top: 1px solid black; border-bottom: medium none; }
                    td.border-right-bottom {border-left: medium none; border-right: 1px solid black; border-top: medium none; border-bottom: 1px solid black; }
                    td.border-left-bottom {border-left: 1px solid black; border-right: medium none; border-top: medium none; border-bottom: 1px solid black; }
                    td.border-left-right {border-left: 1px solid black; border-right: 1px solid black; border-top: medium none; border-bottom: medium none; }
                    td.border-left-top {border-left: 1px solid black; border-right: medium none; border-top: 1px solid black; border-bottom: medium none; } 
                    td.border-right-top {border-left: medium none; border-right: 1px solid black; border-top: 1px solid black; border-bottom: medium none; } 
                    span.bold {font-size: 12.0pt; font-family: Arial, sans-serif; color: black; font-weight: 700; font-style: normal; }                    
                    .value {font-size: 12.0pt; font-family: Courier; color: black; }
                    p.number-date {font-weight: bold; }
                    .bordered {border: solid 1pt black; padding-top:4pt; padding-bottom:4pt;}
                    .underlined {border-bottom: solid 01px black;}
                    .graph {font-family: Arial; font-size: 7pt;}
                    .graph-number {font-size: 9pt; font-weight: bold;}
                    div.page {
                        /*height: 210mm;*/
                        width: 297mm;
                        margin: auto;
                        padding: 5mm 10mm 5mm 10mm;
                        background: white;
                        border: solid 1px black;
                        page-break-after: always;
                        margin-top: 20px;
                    }
                    
                    							
					.person {
						border: 0px;
					}
					.person tr td {
						border: 0px;
						font-size: 10pt; 
						font-family: ТimesNewRoman, sans-serif; 
						color: black; 
						font-style: normal;
					}
					
					.space {
						width: 150px;
					}
					
                     /*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}
                </style>
         </head>
         <body>
            <div class="page">
               <h3>Дополнительное соглашение N <xsl:value-of select="s_con:DocumentNumber"/>
               </h3>
               <br/>
               <p align="left">
                            к контракту № <xsl:value-of select="s_con:ContractRegistration/cat_ru:PrDocumentNumber"/> от 
                            <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="s_con:ContractRegistration/cat_ru:PrDocumentDate"/>
                  </xsl:call-template>
               </p>
               <div class="value" style="float: left;">г. <xsl:value-of select="s_con:ContractRegistration/catComFin_ru:ContractPlace"/>
               </div>
               <div class="value" style="float: right;">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="s_con:IssueDate"/>
                  </xsl:call-template>
               </div>
               <div style="clear: both;"/>
               <p align="left" style="clear: both;">
                  <b>1. Предмет Дополнительного соглашения</b>
               </p>
               <p align="left">
                                1.1.     По согласованию Сторон в Контракт № <xsl:value-of select="s_con:ContractRegistration/cat_ru:PrDocumentNumber"/> от 
                            <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="s_con:ContractRegistration/cat_ru:PrDocumentDate"/>
                  </xsl:call-template> внесены следующие изменения:
                            <xsl:if test="s_con:ContractDescription">
                     <p align="left">
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:ContractSubject">
                                Предмет контракта: <br/>
                           <xsl:for-each select="s_con:ContractDescription/catComFin_ru:ContractSubject">
                              <xsl:value-of select="."/>
                              <br/>
                           </xsl:for-each>
                           <br/>
                        </xsl:if>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:ContractText">
                                    Текст контракта:<br/>
                           <xsl:for-each select="s_con:ContractDescription/catComFin_ru:ContractText">
                              <xsl:value-of select="."/>
                              <br/>
                           </xsl:for-each>
                           <br/>
                        </xsl:if>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:OtherTerms">
                                    Прочие условия договора:<br/>
                           <xsl:for-each select="s_con:ContractDescription/catComFin_ru:OtherTerms">
                              <xsl:apply-templates/>
                              <br/>
                           </xsl:for-each>
                           <br/>
                        </xsl:if>
                        <br/>
                                    Сумма  и расчеты по контракту:
                                    <br/>
                        <br/>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:Amount">
                                    Общая сумма контракта:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="s_con:ContractDescription/catComFin_ru:Amount"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <br/>
                        </xsl:if>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:CurrencyCode">
                                    Код валюты контракта: <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="s_con:ContractDescription/catComFin_ru:CurrencyCode"/>
                           <br/>
                        </xsl:if>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:PaymentCurrencyCode">
                                    Код валюты  платежа:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:for-each select="s_con:ContractDescription/catComFin_ru:PaymentCurrencyCode">
                              <xsl:value-of select="."/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:for-each>
                           <br/>
                        </xsl:if>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:DiscountPercentage">
										Размер скидки:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="s_con:ContractDescription/catComFin_ru:DiscountPercentage"/>%<br/>
                        </xsl:if>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:Discount">
                                    Общая сумма скидки:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="s_con:ContractDescription/catComFin_ru:Discount"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <br/>
                        </xsl:if>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:DueDateCode">
                                    Код применяемой формы расчета по контракту:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:for-each select="s_con:ContractDescription/catComFin_ru:DueDateCode">
                              <xsl:value-of select="."/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:for-each>
                           <br/>
                        </xsl:if>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:ExchangeClause">
                                        Порядок пересчета валюты платежа в валюту цены:
                                        <xsl:value-of select="s_con:ContractDescription/catComFin_ru:ExchangeClause"/>
                           <br/>
                        </xsl:if>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:PaymentModeCode">
                                Код расчетного срока оплаты товара: 
                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="s_con:ContractDescription/catComFin_ru:PaymentModeCode"/>.<br/>
                        </xsl:if>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:PaymentPeriod">
									Срок оплаты:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="s_con:ContractDescription/catComFin_ru:PaymentPeriod"/>
                           <br/>
                        </xsl:if>
                                
                                Последняя дата расчета по контракту :
                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="s_con:ContractDescription/catComFin_ru:LastDate"/>
                        </xsl:call-template>
                        <br/>
                        <br/>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:DealSign">
									Вид сделки:
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:choose>
                              <xsl:when test="(s_con:ContractDescription/catComFin_ru:DealSign = 'true') or (s_con:ContractDescription/catComFin_ru:DealSign = 't') or (s_con:ContractDescription/catComFin_ru:DealSign = '1')">Купля</xsl:when>
                              <xsl:otherwise>Продажа</xsl:otherwise>
                           </xsl:choose>
                           <br/>
                        </xsl:if>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:PrepaySign">
									Предоплата: 
									<xsl:choose>
                              <xsl:when test="(s_con:ContractDescription/catComFin_ru:PrepaySign = 'true') or (s_con:ContractDescription/catComFin_ru:PrepaySign = 't') or (s_con:ContractDescription/catComFin_ru:PrepaySign = '1')">
                                 <xsl:text>Да</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:text>Нет</xsl:text>
                              </xsl:otherwise>
                           </xsl:choose>
                           <br/>
                        </xsl:if>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:StockCategorySign">
								Предмет контракта 
								<xsl:choose>
                              <xsl:when test="(s_con:ContractDescription/catComFin_ru:StockCategorySign = 'true') or (s_con:ContractDescription/catComFin_ru:StockCategorySign = 't') or (s_con:ContractDescription/catComFin_ru:StockCategorySign = '1')">
                                 <xsl:text>относится к категории биржевых товаров</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:text>не относится к категории биржевых товаров</xsl:text>
                              </xsl:otherwise>
                           </xsl:choose>
                           <br/>
                        </xsl:if>
								
                                 Срок действия договора до 
                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="s_con:ContractDescription/catComFin_ru:ContractTime"/>
                        </xsl:call-template>.<br/>
                        <xsl:if test="s_con:ContractDescription/catComFin_ru:AdditionalContractTime">    
                                Дополнительный срок действия договора до 
                                        <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="s_con:ContractDescription/catComFin_ru:AdditionalContractTime"/>
                           </xsl:call-template>.<br/>
                        </xsl:if>
                        <br/>
                                    Дополнения и приложения к контракту:
                                    <br/>
                        <br/>
                        <p align="left">
                           <xsl:for-each select="s_con:ContractDescription/catComFin_ru:ChangeContract">
                              <xsl:apply-templates select="cat_ru:PrDocumentName"/> № 
                             <xsl:value-of select="cat_ru:PrDocumentNumber"/> от  
                             <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                              <br/>
                           </xsl:for-each>
                        </p>
                     </p>
                  </xsl:if>
               </p>
               <p align="left">
                            1.2. Спецификации к контракту
                        </p>
               <p/>
               <xsl:for-each select="s_con:ContractSpecification">
                  <p align="left">
								Спецификация №<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="s_con:ID"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>от<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="s_con:IssueDate"/>
                     </xsl:call-template>
                  </p>
                  <table border="1" style="table-layout:fixed;word-wrap:break-word; width:100%;">
                     <tr>
                        <td class="value" style="width:15mm">Артикул</td>
                        <td class="value">Описание товара</td>
                        <td class="value" style="width:10mm;">Количество</td>
                        <td class="value" style="width:10mm;">Единицы измерения</td>
                        <td class="value" style="width:13mm">Цена</td>
                        <td class="value" style="width:9mm">Код валюты контракта </td>
                        <td class="value" style="width:15mm">Стоимость</td>
                        <td class="value" style="width:25mm">Код по ТН ВЭД ЕАЭС</td>
                        <td class="value" style="width:10mm">Вес нетто</td>
                        <td class="value" style="width:10mm">Вес брутто</td>
                        <td class="value" style="width:20mm">Описание грузовых мест</td>
                        <td class="value" style="width:20mm;">Производитель</td>
                        <td class="value" style="width:24mm;">Товарный знак</td>
                        <td class="value" style="width:20mm;">Марка</td>
                        <td class="value" style="width:15mm;">Модель</td>
                        <td class="value" style="width:11mm;">Стандарт</td>
                     </tr>
                     <xsl:choose>
                        <xsl:when test="s_con:AddSpecificationGoods">
                           <xsl:for-each select="s_con:AddSpecificationGoods">
                              <tr>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:GoodMarking"/>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:for-each select="s_con:GoodsDescription">
                                       <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:GoodsQuantity"/>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:MeasureUnitQualifierName"/>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:Price"/>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:CurrencyCode"/>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:GCost"/>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:GoodsTNVEDCode"/>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:GoodsWeight/catComFin_ru:NetWeightQuantity"/>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:GoodsWeight/catComFin_ru:GrossWeightQuantity"/>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:for-each select="s_con:GoodsPlace">
                                       <xsl:value-of select="catComFin_ru:PlacesQuantity"/>-<xsl:value-of select="catComFin_ru:PlaceWeightQuantity"/>кг
													</xsl:for-each>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:AdditionalGoodsDescription/catComFin_ru:Manufacturer"/>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:AdditionalGoodsDescription/catComFin_ru:TradeMark"/>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:AdditionalGoodsDescription/catComFin_ru:GoodsMark"/>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:AdditionalGoodsDescription/catComFin_ru:GoodsModel"/>
                                 </td>
                                 <td align="right" class="value">
                                    <xsl:value-of select="s_con:AdditionalGoodsDescription/catComFin_ru:GoodsStandart"/>
                                 </td>
                              </tr>
                           </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                           <tr style="height:15px">
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                              <td/>
                           </tr>
                        </xsl:otherwise>
                     </xsl:choose>
                  </table>
               </xsl:for-each>
               <p/>
               <xsl:if test="s_con:SupContractDeliveryTerms">
                  <p align="left">
                                1.3. Условия поставки
                            </p>
                  <table border="1">
                     <tr align="center">
                        <td align="center" class="value" style="width:30mm">Место поставки</td>
                        <td align="center" class="value" style="width:20mm">Код условий поставки по Инкотермс</td>
                        <td align="center" class="value" style="width:50mm">Комментарий к условиям поставки</td>
                        <td align="center" class="value" style="width:30mm">Код срока оплаты по инвойсу</td>
                        <td align="center" class="value" style="width:60mm">Описание срока оплаты по инвойсу</td>
                     </tr>
                     <xsl:for-each select="s_con:SupContractDeliveryTerms">
                        <tr>
                           <td align="left" class="value" style="width:30mm">
                              <xsl:for-each select="catComFin_ru:DeliveryPlace">
                                 <xsl:value-of select="."/>,</xsl:for-each>
                           </td>
                           <td align="center" class="value" style="width:20mm">
                              <xsl:value-of select="catComFin_ru:DeliveryTermsStringCode"/>
                           </td>
                           <td align="left" class="value" style="width:50mm">
                              <xsl:if test="catComFin_ru:TermsDescription">
                                 <xsl:value-of select="catComFin_ru:TermsDescription"/>
                              </xsl:if>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="value" style="width:30mm">
                              <xsl:for-each select="catComFin_ru:InvoiceSaleTerms">
                                 <xsl:if test="catComFin_ru:SaleTermsCode">
                                    <xsl:value-of select="catComFin_ru:SaleTermsCode"/>
                                 </xsl:if>
                              </xsl:for-each>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" class="value" style="width:60mm">
                              <xsl:for-each select="catComFin_ru:InvoiceSaleTerms">
                                 <xsl:if test="catComFin_ru:SaleTermsDescription">
                                    <xsl:value-of select="catComFin_ru:SaleTermsDescription"/>
                                 </xsl:if>
                              </xsl:for-each>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </table>
               </xsl:if>
               <p align="left">
                  <b>2. Действие настоящего Дополнительного соглашения</b>
               </p>
               <p align="left">
                                2.1. Настоящее дополнительное соглашение вступает в силу с момента его подписания Сторонами.                    
                        </p>
               <p align="left">
                  <b>3. Прочие условия</b>
               </p>
               <p align="left">
                                3.1. Дополнительное соглашение может быть изменено по соглашению Сторон.
                        </p>
               <p align="left">
                            3.2. Настоящее Дополнительное соглашение с момента его вступления в силу становится неотъемлемой частью 
                            Контракта <xsl:value-of select="s_con:ContractRegistration/cat_ru:PrDocumentNumber"/> от 
                            <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="s_con:ContractRegistration/cat_ru:PrDocumentDate"/>
                  </xsl:call-template>.
                        </p>
               <p align="left">
                            3.3. Остальные условия Контракта <xsl:value-of select="s_con:ContractRegistration/cat_ru:PrDocumentNumber"/> от 
                            <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="s_con:ContractRegistration/cat_ru:PrDocumentDate"/>
                  </xsl:call-template>
                            остаются неизменными и Стороны подтверждают по ним свои обязательства.
                        </p>
               <p align="left">
                  <b>4. Адреса и реквизиты сторон</b>
               </p>
               <div class="value" style="float: left; max-width: 50%;">
                        Российская сторона:<br/>
                        Наименование: <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="s_con:RussianPerson/cat_ru:OrganizationName"/>
                  <br/>
                        Индекс:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="s_con:RussianPerson/cat_ru:Address/cat_ru:PostalCode"/>
                  <br/>
                        Почтовый адрес:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="s_con:RussianPerson/cat_ru:Address/cat_ru:CounryName"/>,
                        <xsl:value-of select="s_con:RussianPerson/cat_ru:Address/cat_ru:City"/>,
                        <xsl:value-of select="s_con:RussianPerson/cat_ru:Address/cat_ru:StreetHouse"/>
                  <br/>
                        Банковские реквизиты:
                        <br/>
                  <xsl:apply-templates select="s_con:RussianPerson/cat_ru:BankInformation"/>
                  <br/>
                  <p align="center">_______________/____________/<br/>М.П.</p>
               </div>
               <div class="value" style="float: right; max-width: 50%;">
                        Иностранная сторона:<br/>
                        Наименование:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="s_con:ForeignPerson/cat_ru:OrganizationName"/>
                  <br/>
                        Индекс:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="s_con:ForeignPerson/cat_ru:Address/cat_ru:PostalCode"/>
                  <br/>
                        Почтовый адрес:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="s_con:ForeignPerson/cat_ru:Address/cat_ru:CounryName"/>,
                        <xsl:value-of select="s_con:ForeignPerson/cat_ru:Address/cat_ru:City"/>,
                        <xsl:value-of select="s_con:ForeignPerson/cat_ru:Address/cat_ru:StreetHouse"/>
                  <br/>
                        Банковские реквизиты:<br/>
                  <xsl:apply-templates select="s_con:ForeignPerson/cat_ru:BankInformation"/>
                  <br/>
                  <p align="center">_______________/____________/<br/>М.П.</p>
               </div>
               <div style="clear: both;"/>
               <xsl:if test="s_con:ContractSignedPerson">
                  <p align="left">
                     <b>5. Лицо, подписавшее документ</b>
                  </p>
                  <xsl:for-each select="s_con:ContractSignedPerson">
                     <table class="person" style="">
                        <tbody>
                           <tr>
                              <td>
                                 <xsl:value-of select="cat_ru:PersonPost"/>
                              </td>
                              <td class="space"/>
                              <td>
                                 <xsl:value-of select="cat_ru:PersonSurname"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="cat_ru:PersonName"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:if test="cat_ru:PersonMiddleName">
                                    <xsl:value-of select="cat_ru:PersonMiddleName"/>
                                 </xsl:if>
                              </td>
                              <td class="space"/>
                              <td>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
                                 </xsl:call-template>
                              </td>
                           </tr>
                           <tr>
                              <td style="border-top: 1px">(Наименование должности)</td>
                              <td class="space"/>
                              <td style="border-top: 1px">(Ф.И.О.)</td>
                              <td class="space"/>
                              <td style="border-top: 1px">(Дата подписания)</td>
                           </tr>
                        </tbody>
                     </table>
                  </xsl:for-each>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="cat_ru:BankInformation">
        
        Cчет № : <xsl:for-each select="cat_ru:BankAccount">
         <xsl:value-of select="."/>,</xsl:for-each>
      <xsl:if test="cat_ru:BankAccountDescription">
         <xsl:value-of select="cat_ru:BankAccountDescription"/>
         <br/>
      </xsl:if>
      <xsl:value-of select="cat_ru:BankName"/>
      <br/>
      <xsl:if test="cat_ru:BankMFO">МФО<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:BankMFO"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:OKPOID">ОКПО<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OKPOID"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:BICID">БИК<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:BICID"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:SWIFTID">SWIFT код<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:SWIFTID"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:CorrAccount">
         <xsl:value-of select="cat_ru:CorrAccount"/>
         <br/>
      </xsl:if>
      <xsl:for-each select="cat_ru:TransitCurrencyAccount">
         <xsl:value-of select="."/>,</xsl:for-each>
      <br/>
      <xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
         <xsl:value-of select="."/>,</xsl:for-each>
      <br/>
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
</xsl:stylesheet>
