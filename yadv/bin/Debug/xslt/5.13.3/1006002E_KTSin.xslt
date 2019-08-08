<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:KTSin="urn:customs.ru:Information:CustomsDocuments:KTSin:5.12.0" xmlns:catEKTS_cu="urn:customs.ru:CUEKTSCommonAggregateTypes:5.12.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template match="KTSin:KTSin">
      <xsl:param name="k" select="1.5"/>
      <html>
         <head>
            <title>Форма корректировки таможенной стоимости и таможенных платежей</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {background: #CCCCCC;}
                            
                    div.page {
                        width: 240mm;
                        margin: auto;
                        padding: 5mm 10mm 5mm 10mm;
                        background: white;
                        border: solid 1px black;
                        page-break-after: always;
                        margin-top: 20px;
                    }

                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}
                        
                    div.goods {background: white;}

                    .bordered {
                        border: solid 1pt black;
                        padding-top:4pt;
                        padding-bottom:4pt;
                        font-family: Arial;
                        font-size: 9pt;
                        font-weight: bold;
                    }

                    .underlined {border-bottom: solid 1px black;}

                    p.NumberDate {font-weight: bold;}

                    .graph {
                        font-family: Arial;
                        font-size: 7pt;
                    }
                    .graphColumn {
                        font-family: Arial;
                        font-size: 6.5pt;
                    }

                    td {font-family: Courier;}

                    .graphMain {
                        font-family: Arial;
                        font-size: 9pt;
                        font-weight: bold;
                    }

                    .graphNum {
                        font-family: Arial;
                        font-size: 7pt;
                        font-weight: bold;
                    }
                    table {border-collapse: collapse;}
                    .graphNo {
                        font-size: 7pt;
                        font-weight: bold;
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt black;">
                  <tr>
                     <td class="graphMain" style="width:{103*$k}mm;">
                        <span class="graphMain">Форма корректировки таможенной </span>
                     </td>
                     <td class="graphMain" rowspan="2" style="width:{67*$k}mm;" valign="top">
                        <span class="graphMain">КТС-1</span>
                     </td>
                     <td class="graph" rowspan="2" style="width:{30*$k}mm;" valign="top">
                        <span class="graph">Приложение к ДТ</span>
                     </td>
                  </tr>
                  <tr>
                     <td class="graphMain" style="width:{103*$k}mm;">
                        <span class="graphMain"> стоимости и таможенных платежей</span>
                     </td>
                  </tr>
               </table>
               <table cellpadding="0" cellspacing="0" style="width:100%; border: none;">
                  <tr>
                     <td class="graphMain" colspan="2"/>
                     <td class="graph" colspan="2" style="width:{26.4*$k}mm;border-top:solid 1px black;border-left:solid 1px black;border-right:solid 1px black;">
                        <span class="graphNo">1 </span>
                        <span class="graph">Тип корректировки</span>
                     </td>
                     <td class="graph" rowspan="2" style="width:{60.6*$k}mm;border-left:solid 1px black;" valign="top">
                        <span class="graphNo">А </span>
                        <br/>
                        <xsl:for-each select="KTSin:KTSinGoodsShipment/KTSin:KTSinCommonOfficialMark">
                           <xsl:if test="KTSin:ColumnCode='A'">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="KTSin:RecordSerialNumber"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="KTSin:OfficialRecord">
                                 <xsl:value-of select="KTSin:OfficialRecord"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:if test="KTSin:ReserveMarkIdentifier">
                                 <xsl:value-of select="KTSin:ReserveMarkIdentifier"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:value-of select="KTSin:PersonName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="KTSin:LNP"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="KTSin:DateInf"/>
                              </xsl:call-template>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="KTSin:TimeInf"/>
                              <br/>
                           </xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr valign="top">
                     <td align="center" class="graphMain" style="width:{14.5*$k}mm; border: solid 1px black;">1</td>
                     <td rowspan="3" style="width:{86*$k}mm;border:solid 1px black;">
                        <table cellpadding="0" cellspacing="0" width="100%">
                           <tbody>
                              <tr valign="top">
                                 <td class="graph" style="width:{43*$k}mm;">
                                    <span class="graphNo">2 </span>
                                    <span class="graph">Отправитель/<i>Экспортер</i>
                                    </span>
                                 </td>
                                 <td class="graph" style="width:{43*$k}mm;">
                                    <xsl:text>№ </xsl:text>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="2" style="width:{86*$k}mm;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:{43*$k}mm;" valign="bottom">
                                    <!--span class="graph">Рег.№ </span-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="graph" style="width:{43*$k}mm;" valign="bottom">
                                    <!--xsl:text>от </xsl:text-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                     <td align="center" class="graph" style="width:{17.6*$k}mm;border-left:solid 1px black;border-right:solid 1px black;border-bottom:solid 1px black;">
                        <xsl:value-of select="KTSin:KTSinGoodsShipment/KTSin:KTSinGoodsItem/catEKTS_cu:Adjustment1TypeCode"/>
                        <xsl:text> / </xsl:text>
                        <xsl:value-of select="KTSin:KTSinGoodsShipment/KTSin:KTSinGoodsItem/catEKTS_cu:Adjustment2TypeCode/catEKTS_cu:BasisCalculating"/>
                        <xsl:value-of select="KTSin:KTSinGoodsShipment/KTSin:KTSinGoodsItem/catEKTS_cu:Adjustment2TypeCode/catEKTS_cu:BasisCalculating"/>
                        <xsl:value-of select="KTSin:KTSinGoodsShipment/KTSin:KTSinGoodsItem/catEKTS_cu:Adjustment2TypeCode/catEKTS_cu:Cost"/>
                        <xsl:value-of select="KTSin:KTSinGoodsShipment/KTSin:KTSinGoodsItem/catEKTS_cu:Adjustment2TypeCode/catEKTS_cu:BasisCompilationKTS"/>
                        <xsl:text> / </xsl:text>
                        <xsl:value-of select="KTSin:KTSinGoodsShipment/KTSin:KTSinGoodsItem/catEKTS_cu:Adjustment3TypeCode"/>
                     </td>
                     <td style="width:{8.8*$k}mm;border-left:solid 1px black;border-right:solid 1px black;border-bottom:solid 1px black;">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td rowspan="8" style="border: solid 1px black;"/>
                     <td colspan="2" style="width:{26.4*$k}mm;border:solid 1px black;">
                        <table cellpadding="0" cellspacing="0" width="100%">
                           <tbody>
                              <tr valign="top">
                                 <td class="graph" colspan="2" style="width:{13.2*$k}mm;">
                                    <span class="graphNo">3 </span>
                                    <span class="graph">Формы</span>
                                 </td>
                                 <td class="graph" rowspan="2" style="width:{13.2*$k}mm;border-left:solid 1px black;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                              <tr valign="top">
                                 <td align="center" class="graph" style="width:{6.6*$k}mm;border-right:solid 1px black;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td align="center" class="graph" style="width:{6.6*$k}mm;border-left:solid 1px black;">
                                    <xsl:choose>
                                       <xsl:when test="KTSin:KTSinGoodsShipment/catEKTS_cu:TotalSheetNumber">
                                          <xsl:value-of select="KTSin:KTSinGoodsShipment/catEKTS_cu:TotalSheetNumber"/>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3" style="width:{87*$k}mm;border:solid 1px black;">
                        <table cellpadding="0" cellspacing="0" width="100%">
                           <tbody>
                              <tr valign="top">
                                 <td class="graph" style="width:{31.6*$k}mm;border-right:solid 1px black;">
                                    <span class="graphNo">5 </span>
                                    <span class="graph">Всего  т-ов</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="KTSin:KTSinGoodsShipment/catEKTS_cu:TotalGoodsNumber"/>
                                 </td>
                                 <td class="graph" style="width:{45.4*$k}mm;border-left:solid 1px black;">
                                    <span class="graphNo">7 </span>
                                    <span class="graph">Справочный номер</span>
                                    <br/>
                                    <xsl:value-of select="KTSin:DeclarationKind"/>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <tr valign="top">
                     <td rowspan="2" style="width:{86*$k}mm;border:solid 1px black;">
                        <table cellpadding="0" cellspacing="0" width="100%">
                           <tbody>
                              <tr>
                                 <td class="graph" style="width:{43*$k}mm;">
                                    <span class="graphNo">8 </span>
                                    <span class="graph">Получатель</span>
                                 </td>
                                 <td class="graph" style="width:{43*$k}mm;">
                                    <xsl:text>№ </xsl:text>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="2"/>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:{43*$k}mm;">
                                    <!--span class="graph">Рег.№ </span-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="graph" style="width:{43*$k}mm;">
                                    <!--xsl:text>от </xsl:text-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                     <td class="graph" colspan="3" style="width:{87*$k}mm;border:solid 1px black;" valign="top">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr valign="top">
                     <td colspan="3" style="width:{87*$k}mm;border:solid 1px black;">
                        <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt black;">
                           <tbody>
                              <tr valign="top">
                                 <td class="graph" colspan="2" style="width:{57*$k}mm;">
                                    <span class="graphNo">12 </span>
                                    <span class="graph">Общая таможенная стоимость</span>
                                 </td>
                                 <td class="graph" rowspan="2" style="width:{20*$k}mm;border-left:solid 1px black;">
                                    <span class="graphNo">13 </span>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="center" class="graph" style="width:{30*$k}mm;border-right:solid 1px black;">
                                    <xsl:choose>
                                       <xsl:when test="KTSin:KTSinGoodsShipment/catEKTS_cu:TotalCustomsAmount">
                                          <xsl:value-of select="KTSin:KTSinGoodsShipment/catEKTS_cu:TotalCustomsAmount"/>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </td>
                                 <td align="center" class="graph" style="width:{27*$k}mm;">
                                    <xsl:choose>
                                       <xsl:when test="KTSin:KTSinGoodsShipment/catEKTS_cu:PreviousTotalCustomsAmount">
                                          <xsl:value-of select="KTSin:KTSinGoodsShipment/catEKTS_cu:PreviousTotalCustomsAmount"/>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <tr valign="top">
                     <td style="width:{86*$k}mm;border:solid 1px black;">
                        <table cellpadding="0" cellspacing="0" width="100%">
                           <tbody>
                              <tr>
                                 <td class="graph" style="width:{43*$k}mm;">
                                    <span class="graphNo">14 </span>
                                    <span class="graph">Декларант/Представитель</span>
                                 </td>
                                 <td class="graph" style="width:{43*$k}mm;">
                                    <xsl:text>№ </xsl:text>
                                 </td>
                              </tr>
                              <tr valign="top">
                                 <td colspan="2"/>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:{43*$k}mm;">
                                    <!--span class="graph">Рег.№ </span-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="graph" style="width:{43*$k}mm;">
                                    <!--xsl:text>от </xsl:text-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                     <td colspan="3" style="width:{87*$k}mm;border:solid 1px black;" valign="top">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td rowspan="5" style="width:{86*$k}mm;border:solid 1px black;">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td class="graph" colspan="3" style="width:{87*$k}mm;border:solid 1px black;">
                        <table cellpadding="0" cellspacing="0" width="100%">
                           <tbody>
                              <tr>
                                 <td class="graph" colspan="3" style="width:{87*$k}mm;">
                                    <span class="graphNo">20 </span>
                                    <span class="graph">Условия поставки</span>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="center" class="graph" style="width:{10*$k}mm;border-right:solid 1px black;">
                                    <xsl:if test="KTSin:KTSinGoodsShipment/KTSin:KTSContractTerms/catEKTS_cu:DeliveryTerms/cat_ru:DeliveryTermsStringCode">
                                       <xsl:value-of select="KTSin:KTSinGoodsShipment/KTSin:KTSContractTerms/catEKTS_cu:DeliveryTerms/cat_ru:DeliveryTermsStringCode"/>
                                    </xsl:if>
                                 </td>
                                 <td class="graph" style="width:{67*$k}mm;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="KTSin:KTSinGoodsShipment/KTSin:KTSContractTerms/catEKTS_cu:DeliveryTerms/cat_ru:DeliveryPlace"/>
                                 </td>
                                 <td align="center" class="graph" style="width:{10*$k}mm;border-left:solid 1px black;"/>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3" style="width:{87*$k}mm;border:solid 1px black;" valign="top">
                        <table cellpadding="0" cellspacing="0" width="100%">
                           <tbody>
                              <tr valign="top">
                                 <td class="graph" colspan="2" style="width:{37.5*$k}mm;">
                                    <span class="graphNo">22 </span>
                                    <span class="graph">Валюта и общая сумма по счету</span>
                                 </td>
                                 <td align="center" class="graph" rowspan="2" style="width:{19*$k}mm;border-left:solid 1px black;border-right:solid 1px black;">
                                    <span class="graphNo">23 </span>
                                    <span class="graph">Курс валюты</span>
                                    <br/>
                                    <br/>
                                    <xsl:value-of select="KTSin:KTSinGoodsShipment/KTSin:KTSContractTerms/catESAD_cu:ContractCurrencyRate"/>
                                 </td>
                                 <td class="graph" colspan="3" style="width:{30.5*$k}mm;">
                                    <span class="graphNo">24 </span>
                                    <span class="graph">Характер сделки</span>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="center" class="graph" style="width:{7.8*$k}mm;border-right:solid 1px black;">
                                    <xsl:choose>
                                       <xsl:when test="KTSin:KTSinGoodsShipment/KTSin:KTSContractTerms/catESAD_cu:ContractCurrencyCode">
                                          <xsl:value-of select="KTSin:KTSinGoodsShipment/KTSin:KTSContractTerms/catESAD_cu:ContractCurrencyCode"/>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </td>
                                 <td align="center" class="graph" style="width:{29.7*$k}mm;">
                                    <xsl:choose>
                                       <xsl:when test="KTSin:KTSinGoodsShipment/KTSin:KTSContractTerms/catESAD_cu:TotalInvoiceAmount">
                                          <xsl:value-of select="KTSin:KTSinGoodsShipment/KTSin:KTSContractTerms/catESAD_cu:TotalInvoiceAmount"/>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </td>
                                 <td align="center" class="graph" style="width:{10.5*$k}mm;border-right:solid 1px black;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="graph" style="width:{10*$k}mm;border-right:solid 1px black;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="graph" style="width:{20*$k}mm;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3" rowspan="2" style="width:{87*$k}mm;border-right:solid 1px black;">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graphMain" style="border:solid 1px black;">1</td>
                  </tr>
               </table>
               <xsl:for-each select="KTSin:KTSinGoodsShipment/KTSin:KTSinGoodsItem">
                  <div class="goods">
                     <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt black;">
                        <tbody>
                           <tr>
                              <td class="graph" rowspan="4" style="width:{13*$k}mm;border-right:solid 1px black;border-bottom:solid 1px black;" valign="top">
                                 <span class="graphNo">31</span>
                                 <span class="graphColumn">Грузовые места и описание товаров</span>
                              </td>
                              <td class="graph" style="width:{98.8*$k}mm;border-top:solid 1px black;" valign="top">
                                 <span class="graph">Маркировка и количество - Номера контейнеров - Количество и отличительные особенности</span>
                              </td>
                              <td class="graph" style="width:{11*$k}mm;">
                                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                                    <tbody>
                                       <tr>
                                          <td class="graph" colspan="2" style="width:{11*$k}mm;border-top:solid 1px black;border-left:solid 1px black;">
                                             <span class="graphNo">32 </span>
                                             <span class="graph">Товар</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td align="center" class="graph" style="width:{6.6*$k}mm;border-left:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">
                                             <xsl:choose>
                                                <xsl:when test="catESAD_cu:GoodsNumeric!=''">
                                                   <xsl:value-of select="catESAD_cu:GoodsNumeric"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td style="width:{4.4*$k}mm;border-bottom:solid 1px black;">
                                             <span class="graph">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            №
                                                        </span>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                              <td class="graph" colspan="3" style="width:{67.2*$k}mm;border:solid 1px black;" valign="top">
                                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                                    <tbody>
                                       <tr>
                                          <td colspan="3" style="width:{67.2*$k}mm;">
                                             <span class="graphNo">33 </span>
                                             <span class="graph">Код товара</span>
                                             <br/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td style="width:{22.4*$k}mm;border-right:solid 1px black;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td style="width:{22.4*$k}mm;border-right:solid 1px black;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td style="width:{22.4*$k}mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" rowspan="3" style="width:{109.8*$k}mm;border-bottom:solid 0.5pt #000000;" valign="top">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <span class="graph">1)</span>
                                 <xsl:for-each select="catESAD_cu:GoodsDescription">
                                    <xsl:value-of select="."/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:for-each>
                                 <!--xsl:for-each select="catESAD_cu:ESADElectricalEnergyQuantity">
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
                                 <xsl:for-each select="catESAD_cu:GoodsGroupDescription">
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:for-each select="catESAD_cu:GoodsDescription">
                                       <xsl:value-of select="."/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:for-each>
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
                                 <xsl:if test="catESAD_cu:OriginCountryName">
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="catESAD_cu:OriginCountryName"/>
                                 </xsl:if>
                                 <xsl:if test="catEKTS_cu:SupplementaryQuantity">
                                    <br/>
                                    <xsl:value-of select="catEKTS_cu:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="catEKTS_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="catEKTS_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
                                 </xsl:if>
                                 <xsl:for-each select="catEKTS_cu:SupplementaryQuantity1">
                                    <br/>
                                    <xsl:value-of select="cat_ru:GoodsQuantity"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
                                 </xsl:for-each>
                                 <xsl:if test="(catESAD_cu:BeginPeriodDate!='') or (catESAD_cu:EndPeriodDate!='')">
                                    <br/>
                                    <xsl:if test="catESAD_cu:BeginPeriodDate">
                                       <span class="graph">Начало периода</span>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="catESAD_cu:BeginPeriodDate"/>
                                       </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="catESAD_cu:EndPeriodDate">
                                       <span class="graph">Окончание периода</span>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="catESAD_cu:EndPeriodDate"/>
                                       </xsl:call-template>
                                    </xsl:if>
                                 </xsl:if>
                                 <xsl:if test="catEKTS_cu:KTSGoodsPackaging">
                                    <br/>
                                    <span class="graph">2) </span>
                                    <xsl:if test="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:PakageTypeCode=1">
                                       <xsl:if test="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:PakageQuantity!=''">
                                          <xsl:value-of select="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:PakageQuantity"/>
                                          <xsl:if test="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:PakagePartQuantity">
                                        (<xsl:value-of select="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:PakagePartQuantity"/>-часть
                                        места)
                                    </xsl:if>
                                    ,
                                </xsl:if>
                                       <xsl:if test="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:PackingInformation">
                                          <xsl:for-each select="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:PackingInformation">
                                             <xsl:value-of select="catESAD_cu:PackingCode"/>
                                             <xsl:if test="catESAD_cu:PakingQuantity">
                                                <span class="graph">-</span>
                                                <xsl:value-of select="catESAD_cu:PakingQuantity"/>
                                             </xsl:if>
                                             <span class="graph">,</span>
                                          </xsl:for-each>
                                       </xsl:if>
                                       <xsl:if test="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:PalleteInformation">
                                    Поддоны:
                                    <xsl:for-each select="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:PalleteInformation">
                                             <xsl:if test="catESAD_cu:PalleteDescription">
                                                <xsl:value-of select="catESAD_cu:PalleteDescription"/>
                                             </xsl:if>
                                             <span class="graph">,</span>
                                             <xsl:value-of select="catESAD_cu:PalleteQuantity"/> /
                                        <xsl:value-of select="catESAD_cu:PalleteCode"/>
                                          </xsl:for-each>
                                       </xsl:if>
                                       <xsl:if test="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:UnitPackInfo">
                                          <br/>2.1
                                    <xsl:for-each select="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:UnitPackInfo">
                                             <xsl:value-of select="catESAD_cu:PackingCode"/>
                                             <xsl:if test="catESAD_cu:PakingQuantity">
                                                <span class="graph">-</span>
                                                <xsl:value-of select="catESAD_cu:PakingQuantity"/>
                                             </xsl:if>
                                             <span class="graph">,</span>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:PakageTypeCode=0">
                                без упаковки
                            </xsl:if>
                                    <xsl:if test="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:PakageTypeCode=2">
                                без упаковки/
                                <xsl:for-each select="catEKTS_cu:KTSGoodsPackaging/catESAD_cu:CargoInfo">
                                          <xsl:value-of select="catESAD_cu:PackingCode"/>
                                          <span class="graph">,</span>
                                       </xsl:for-each>
                                    </xsl:if>
                                 </xsl:if>
                                 <!--xsl:if test="SADout_CU:ESADContainer">
												<br/>
												<span class="graph">3) </span>
												<xsl:value-of select="SADout_CU:ESADContainer/catESAD_cu:ContainerQuantity"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:for-each select="SADout_CU:ESADContainer/catESAD_cu:ContainerNumber">
													<xsl:value-of select="catESAD_cu:ContainerIdentificaror"/>
													<xsl:if test="catESAD_cu:FullIndicator='2'">
														<span class="graph">часть</span>
													</xsl:if>
													<span class="graph">,</span>
												</xsl:for-each>
											</xsl:if-->
                                 <!--xsl:if test="SADout_CU:ESADExcise">
												<br/>
												<span class="graph">4) </span>
												<xsl:for-each select="SADout_CU:ESADExcise">
													<xsl:value-of select="catESAD_cu:ExciseSerieses"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="catESAD_cu:ExciseFirstNumber"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="catESAD_cu:ExciseLastNumber"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="catESAD_cu:ExciseQuantity"/>
													<span class="graph">;</span>
												</xsl:for-each>
											</xsl:if-->
                                 <xsl:if test="catESAD_cu:CUESADDeliveryTerms">
                                    <br/>
                                    <span class="graph">5) </span>
                                    <xsl:for-each select="catESAD_cu:CUESADDeliveryTerms">
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
                                 <!--xsl:if test="SADout_CU:ESADout_CUCustomsConditions">
												<br/>
												<span class="graph">6) </span>
												<xsl:for-each select="SADout_CU:ESADout_CUCustomsConditions/catESAD_cu:RateOutputGoods">
													<xsl:value-of select="."/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:for-each>
												<xsl:if test="SADout_CU:ESADout_CUCustomsConditions/catESAD_cu:ProcessingDocNumber">
													<xsl:value-of select="SADout_CU:ESADout_CUCustomsConditions/catESAD_cu:ProcessingDocNumber"/>
												</xsl:if>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="SADout_CU:ESADout_CUCustomsConditions/catESAD_cu:ProcessingDocDate"/>
												</xsl:call-template>
												<br/>
												<xsl:value-of select="SADout_CU:ESADout_CUCustomsConditions/catESAD_cu:GoodsTNVEDCode"/>
												<xsl:for-each select="SADout_CU:ESADout_CUCustomsConditions/catESAD_cu:GoodsDescription">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="."/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:for-each>
												<xsl:if test="SADout_CU:ESADout_CUCustomsConditions/catESAD_cu:ProcessingGoodsQuantity">
													<xsl:value-of select="SADout_CU:ESADout_CUCustomsConditions/catESAD_cu:ProcessingGoodsQuantity/cat_ru:GoodsQuantity"/>
													<xsl:value-of select="SADout_CU:ESADout_CUCustomsConditions/catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
													<xsl:if test="SADout_CU:ESADout_CUCustomsConditions/catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode">
									 (<xsl:value-of select="SADout_CU:ESADout_CUCustomsConditions/catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>) 
								</xsl:if>
												</xsl:if>
												<br/>
												<xsl:for-each select="SADout_CU:ESADout_CUCustomsConditions/catESAD_cu:ProcessingOperationDesc">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="."/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:for-each>
												<xsl:for-each select="SADout_CU:ESADout_CUCustomsConditions/catESAD_cu:GoodsIdentificationMethod">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="."/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:for-each>
											</xsl:if-->
                                 <xsl:if test="(catESAD_cu:DeliveryTime) or (catESAD_cu:DeliveryTimeEND)">
                                    <br/>
                                    <span class="graph">7) Поставка в течение</span>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="catESAD_cu:DeliveryTime"/>
                                    </xsl:call-template>
                                    <xsl:if test="catESAD_cu:DeliveryTimeEND">
								- <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="catESAD_cu:DeliveryTimeEND"/>
                                       </xsl:call-template>
                                    </xsl:if>
                                 </xsl:if>
                                 <xsl:if test="catESAD_cu:QuantityFact">
                                    <br/>
                                    <span class="graph">8) </span>
                                    <xsl:value-of select="catESAD_cu:QuantityFact"/>
                                 </xsl:if>
                                 <!--xsl:if test="(SADout_CU:ElectricalEnergReceived) or (SADout_CU:ElectricalEnergGiven)">
												<br/>
												<span class="graph">9) </span>
												<xsl:for-each select="SADout_CU:ElectricalEnergReceived">
								принято <xsl:value-of select="catESAD_cu:ElectricalEnergyQuantity"/> тыс. кВт.ч
								<xsl:if test="catESAD_cu:QualifierCode">
									(<xsl:value-of select="catESAD_cu:QualifierCode"/>)
								</xsl:if>, 
							</xsl:for-each>
												<xsl:for-each select="SADout_CU:ElectricalEnergGiven">
								отдано <xsl:value-of select="catESAD_cu:ElectricalEnergyQuantity"/> тыс. кВт.ч
								<xsl:if test="catESAD_cu:QualifierCode">
									(<xsl:value-of select="catESAD_cu:QualifierCode"/>)
								</xsl:if>, 
							</xsl:for-each>
											</xsl:if-->
                                 <xsl:if test="catESAD_cu:GoodsSTZ">
                                    <br/>
                                    <span class="graph">11) </span>
                                    <xsl:for-each select="catESAD_cu:GoodsSTZ">
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
                                       <xsl:for-each select="catESAD_cu:GoodsGroupDescription">
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
                              <td class="graph" style="width:{25*$k}mm;border:solid 0.5pt #000000;" valign="top">
                                 <table>
                                    <tbody>
                                       <tr>
                                          <td class="graph" colspan="4" style="width:{25*$k}mm;" valign="top">
                                             <span class="graphNo">34 </span>
                                             <span class="graph">Код страны происх.</span>
                                             <br/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan="2" style="width:{12.5*$k}mm;border-right:solid 0.5pt #000000;" valign="bottom">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td colspan="2" style="width:{12.5*$k}mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td style="width:{2.5*$k}mm;border-right:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;">a</td>
                                          <td style="width:{10*$k}mm;border-right:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;">
                                             <xsl:value-of select="catESAD_cu:OriginCountryCode"/>
                                          </td>
                                          <td style="width:{2.5*$k}mm;border-right:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;">b</td>
                                          <td style="width:{10*$k}mm;border-bottom:solid 0.5pt #000000;"/>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                              <td class="graph" style="width:{42.2*$k}mm;border:solid 0.5pt #000000;" valign="top">
                                 <span class="graphNo">35 </span>
                                 <span class="graph">Вес брутто (кг)</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="catESAD_cu:GrossWeightQuantity"/>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:{25*$k}mm; border:solid 1px black;" valign="top">
                                 <table>
                                    <tbody>
                                       <tr>
                                          <td colspan="2" style="width:{25*$k}mm;">
                                             <span class="graphNo">37 </span>
                                             <span class="graph">ПРОЦЕДУРА</span>
                                             <br/>
                                             <br/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan="2" style="width:{12.5*$k}mm;border-right:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;" valign="bottom">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td colspan="2" style="width:{12.5*$k}mm;border-bottom:solid 0.5pt #000000;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                              <td class="graph" style="width:{42.2*$k}mm;border:solid 1px black;" valign="top">
                                 <span class="graphNo">38 </span>
                                 <span class="graph">Вес нетто (кг)</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="3" style="width:{67.2*$k}mm;border:solid 1px black;">
                                 <!--span class="graphNo">40 </span>
											<span class="graph">Общая декларация/предшествующий документ</span>
											<br/-->
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" rowspan="3" style="width:{13*$k}mm;border-right:solid 1px black;border-top:solid 1px black;" valign="top">
                                 <span class="graphNo">44</span>
                                 <span class="graphColumn">Дополнит. информация/ Представл. документы/ Сертификаты и разрешения</span>
                              </td>
                              <td class="graph" colspan="2" rowspan="3" style="width:{109.8*$k}mm;border-bottom:solid 0.5pt #000000;border-top:solid 0.5pt #000000;" valign="top">
                                 <xsl:if test="KTSin:KTSinPresentedDocuments">
                                    <xsl:for-each select="KTSin:KTSinPresentedDocuments">
                                       <xsl:value-of select="catESAD_cu:PresentedDocumentModeCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                       <xsl:if test="cat_ru:PrDocumentDate">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                       <xsl:if test="cat_ru:PrDocumentName">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="cat_ru:PrDocumentName"/>
                                       </xsl:if>
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
                                       <xsl:if test="catESAD_cu:PresentingLackingDate">
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
                                          <xsl:text> Срок временного ввоза </xsl:text>
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
                                       <xsl:if test="catESAD_cu:TotalDocuments">
                                          <xsl:text> </xsl:text>Общее количество документов:
									<xsl:value-of select="catESAD_cu:TotalDocuments"/>
                                       </xsl:if>
                                       <br/>
                                    </xsl:for-each>
                                 </xsl:if>
                              </td>
                              <td class="graph" style="width:{25*$k}mm;border:solid 1px black;" valign="top">
                                 <span class="graphNo">41 </span>
                                 <span class="graph">Дополнит. единицы</span>
                                 <br/>
                                 <xsl:choose>
                                    <xsl:when test="catEKTS_cu:SupplementaryQuantity">
                                       <xsl:value-of select="catEKTS_cu:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="catEKTS_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
                                    </xsl:when>
                                 </xsl:choose>
                              </td>
                              <td class="graph" style="width:{30*$k}mm;border:solid 1px black;" valign="top">
                                 <span class="graphNo">42 </span>
                                 <span class="graph">Цена товара</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="catESAD_cu:InvoicedCost"/>
                              </td>
                              <td class="graph" style="width:{12.2*$k}mm;border:solid 1px black;">
                                 <table>
                                    <tbody>
                                       <tr>
                                          <td class="graph" colspan="2" style="width:{12.2*$k}mm;" valign="top">
                                             <span class="graphNo">43 </span>
                                             <span class="graph">Код МОС</span>
                                             <br/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:{4.2*$k}mm;border-right:solid 0.5pt #000000;" valign="bottom">
                                             <xsl:value-of select="catESAD_cu:CustomsCostCorrectMethod"/>
                                          </td>
                                          <td class="graph" style="width:{8*$k}mm;" valign="bottom">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                           <tr valign="top">
                              <td class="graph" colspan="3" style="border: 1px solid black;">
                                 <table>
                                    <tbody>
                                       <tr>
                                          <td class="graph" colspan="2">
                                             <span class="graphNo">45 </span>
                                             <span class="graph">Таможенная стоимость товара</span>
                                             <br/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="border-right: 1px solid black;">
                                             <xsl:value-of select="catEKTS_cu:PreviousCustomsCost"/>
                                          </td>
                                          <td>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                           <tr>
                              <td style="border: solid 1px black;"/>
                              <td class="graph" colspan="2" style="border: solid 1px black; vertical-align: top;">
                                 <span class="graphNo">46 </span>
                                 <span class="graph">Статистическая стоимость</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="catESAD_cu:StatisticalCost"/>
                              </td>
                           </tr>
                           <tr valign="top">
                              <td class="graph" style="width:{13*$k}mm;border-right:solid 1px black;border-top:solid 1px black;border-bottom:solid 1px black;" valign="top">
                                 <span class="graphNo">47</span>
                                 <span class="graphColumn">Исчисление платежей</span>
                              </td>
                              <td class="graph" colspan="5" style="width:{177*$k}mm;">
                                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                                    <tbody>
                                       <tr>
                                          <td align="center" class="graph" style="width:{10*$k}mm;border:solid 1px black;">Вид</td>
                                          <td align="center" class="graph" style="width:{30*$k}mm;border:solid 1px black;">Основа начисления</td>
                                          <td align="center" class="graph" style="width:{15*$k}mm;border:solid 1px black;">Ставка</td>
                                          <td align="center" class="graph" style="width:{30*$k}mm;border:solid 1px black;">Сумма</td>
                                          <td align="center" class="graph" style="width:{5*$k}mm;border:solid 1px black;">СП</td>
                                          <td align="center" class="graph" style="width:{30*$k}mm;border:solid 1px black;">Предыдущая сумма</td>
                                          <td align="center" class="graph" style="width:{20*$k}mm;border:solid 1px black;">Изменения</td>
                                          <td align="center" class="graph" style="width:{37*$k}mm;border:solid 1px black;">№ и дата платежн. пор.</td>
                                       </tr>
                                       <xsl:variable name="KTS" select="current()"/>
                                       <xsl:for-each select="KTSin:KTSinCustomsPaymentCalculation">
                                          <tr>
                                             <td class="graph" style="width:{10*$k}mm;border:solid 0.5pt #000000;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="catESAD_cu:PaymentModeCode"/>
                                             </td>
                                             <td class="graph" style="width:{30*$k}mm;border:solid 0.5pt #000000;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:if test="catESAD_cu:TaxBase">
                                                   <xsl:value-of select="catESAD_cu:TaxBase"/>
                                                </xsl:if>
                                             </td>
                                             <td class="graph" style="width:{15*$k}mm;border:solid 0.5pt #000000;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="catESAD_cu:Rate"/>
                                             </td>
                                             <td class="graph" style="width:{30*$k}mm;border:solid 0.5pt #000000;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="catESAD_cu:PaymentAmount"/>
                                             </td>
                                             <td class="graph" style="width:{5*$k}mm;border:solid 0.5pt #000000;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="catESAD_cu:PaymentCode"/>
                                             </td>
                                             <td class="graph" style="width:{30*$k}mm;border:solid 0.5pt #000000;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="catEKTS_cu:PrecedingPaymentAmount"/>
                                             </td>
                                             <td class="graph" style="width:{20*$k}mm;border:solid 0.5pt #000000;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="catEKTS_cu:ChangeAmount"/>
                                             </td>
                                             <td class="graph" style="width:{37*$k}mm;border:solid 0.5pt #000000;">
                                                <xsl:for-each select="catEKTS_cu:PaymentDocument">
                                                   <xsl:value-of select="cat_ru:PrDocumentName"/>
                                                   <xsl:text> </xsl:text>
                                                   <xsl:if test="cat_ru:PrDocumentNumber">
																	№<xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                                   </xsl:if>
                                                   <xsl:text> </xsl:text>
                                                   <xsl:if test="cat_ru:PrDocumentDate">
																	от <xsl:call-template name="russian_date">
                                                         <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                      </xsl:call-template>
                                                   </xsl:if>
                                                   <xsl:text> </xsl:text>
																	Сумма:<xsl:value-of select="catEKTS_cu:PaymentAmount"/>
                                                   <xsl:text> </xsl:text>
                                                </xsl:for-each>
                                                <br/>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
                                       <tr>
                                          <td align="center" class="graph" colspan="5" style="width:{90*$k}mm;border-top:solid 1px black;border-left:solid 1px black;border-bottom:solid 1px black;">
                                                            Общая сумма, подлежащая взысканию (возврату), в нац. валюте
                                                        </td>
                                          <td class="graph" style="width:{30*$k}mm;border-bottom:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;">
                                             <xsl:value-of select="catEKTS_cu:TotalCorrectedCost"/>
                                          </td>
                                          <td class="graph" style="width:{20*$k}mm;border:solid 1px black;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:{37*$k}mm;border:solid 1px black;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                           <xsl:if test="KTSin:KTSinGoodsOfficialMark">
                              <tr>
                                 <td class="graph" style="width:{13*$k}mm;border-right:solid 1px black;border-top:solid 1px black;border-bottom:solid 1px black;" valign="top">
                                    <span class="graph">Служебные отметки по товарам</span>
                                 </td>
                                 <td class="graph" colspan="5" style="width:{177*$k}mm;border:solid 1px black;" valign="top">
                                    <xsl:for-each select="KTSin:KTSinGoodsOfficialMark">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="KTSin:RecordSerialNumber"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:if test="KTSin:ReserveMarkIdentifier">
                                          <xsl:value-of select="KTSin:ReserveMarkIdentifier"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:if>
                                       <xsl:if test="KTSin:OfficialRecord">
                                          <xsl:value-of select="KTSin:OfficialRecord"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:if>
                                       <xsl:if test="KTSin:PaymentEnsuringTypeCode">
                                          <xsl:value-of select="KTSin:PaymentEnsuringTypeCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:if>
                                       <xsl:value-of select="KTSin:PersonName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="KTSin:LNP"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="KTSin:DateInf"/>
                                       </xsl:call-template>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="KTSin:TimeInf"/>
                                       <xsl:if test="KTSin:DocumentNumber">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="KTSin:DocumentNumber"/>
                                       </xsl:if>
                                       <xsl:if test="KTSin:DocumentDate">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="KTSin:DocumentDate"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                           </xsl:if>
                        </tbody>
                     </table>
                  </div>
               </xsl:for-each>
               <table cellpadding="0" cellspacing="0" style="width:(210*$k)mm;border: none;">
                  <tr valign="top">
                     <td class="graph" rowspan="2" style="width:{15*$k}mm;border-top:solid 1px black;" valign="top">
                        <span class="graphNo">В </span>
                        <span class="graphColumn">Пересчет платежей</span>
                     </td>
                     <td class="graph" colspan="5" style="width:{173*$k}mm;border:solid 1px black;">
                        <table cellpadding="0" cellspacing="0" style="width:100%;">
                           <tbody>
                              <tr>
                                 <td align="center" class="graph" style="width:{10*$k}mm;border:solid 1px black;">Вид</td>
                                 <td align="center" class="graph" style="width:{30*$k}mm;border:solid 1px black;">Сумма</td>
                                 <td align="center" class="graph" style="width:{30*$k}mm;border:solid 1px black;">Предыдущая сумма</td>
                                 <td align="center" class="graph" style="width:{40*$k}mm;border:solid 1px black;">Изменения</td>
                                 <td class="graph" style="width:{63*$k}mm;border-left:solid 1px black;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                              <xsl:for-each select="KTSin:KTSPaymentsReCalc">
                                 <tr>
                                    <td class="graph" style="width:{10*$k}mm;border:solid 0.5pt #000000;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="catEKTS_cu:PaymentModeCode"/>
                                    </td>
                                    <td class="graph" style="width:{30*$k}mm;border:solid 0.5pt #000000;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="catEKTS_cu:PaymentAmount"/>
                                    </td>
                                    <td class="graph" style="width:{30*$k}mm;border:solid 0.5pt #000000;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="catEKTS_cu:PrecedingPaymentAmount"/>
                                    </td>
                                    <td class="graph" style="width:{40*$k}mm;border:solid 0.5pt #000000;border-right:solid 1pt #000000;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="catEKTS_cu:ChangeAmount"/>
                                    </td>
                                    <td class="graph" style="width:{63*$k}mm;border:solid 0pt #000000;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                              <tr>
                                 <td align="center" class="graph" colspan="3" style="width:{70*$k}mm;border-top:solid 1px black;border-left:solid 1px black;border-bottom:solid 1px black;">
                                                        Общая сумма, подлежащая возврату (взысканию), в нац. валюте.
                                                    </td>
                                 <td class="graph" style="width:{40*$k}mm;border-bottom:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;">
                                    <xsl:value-of select="KTSin:KTSinGoodsShipment/catEKTS_cu:DebtReturnSumm"/>
                                 </td>
                                 <td class="graph" style="width:{63*$k}mm;border:solid 0pt black;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <tr valign="top">
                     <td class="graph" colspan="5" style="border:solid 1px black;">
                        <table cellpadding="0" cellspacing="0" style="width:100%;">
                           <tbody>
                              <tr>
                                 <!--td style="width:{40*$k}mm;" class="graph">
												<span class="graphNo">50 </span>
												<span class="graph">Доверитель</span>
											</td>
											<td style="width:{60*$k}mm;" class="graph">
												<span class="graph">№ </span>
											</td>
											<td style="width:{20*$k}mm;" class="graph">
												<span class="graph">Подпись: </span>
											</td-->
                                 <td class="graph" style="width:{40*$k}mm;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="graph" style="width:{60*$k}mm;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="graph" style="width:{20*$k}mm;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="graph" rowspan="4" style="width:{53*$k}mm;border-left:solid 1px black;" valign="top">
                                    <span class="graphNo">С </span>
                                    <br/>
                                    <xsl:for-each select="KTSin:KTSinGoodsShipment/KTSin:KTSinCommonOfficialMark">
                                       <xsl:if test="KTSin:ColumnCode='C'">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="KTSin:RecordSerialNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:if test="KTSin:OfficialRecord">
                                             <xsl:value-of select="KTSin:OfficialRecord"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:if>
                                          <xsl:if test="KTSin:ReserveMarkIdentifier">
                                             <xsl:value-of select="KTSin:ReserveMarkIdentifier"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:if>
                                          <xsl:value-of select="KTSin:PersonName"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="KTSin:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="KTSin:DateInf"/>
                                          </xsl:call-template>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="KTSin:TimeInf"/>
                                          <br/>
                                       </xsl:if>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="3" style="width:{120*$k}mm;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="3" style="width:{120*$k}mm;">
                                    <!--span class="graph">представленный </span-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="3" style="width:{120*$k}mm;">
                                    <!--span class="graph">Место и дата: </span-->
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <!--tr valign="top">
							<td colspan="6" class="graph">
								<table style="width:100%;" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
											<td style="width:{17*$k}mm;border-top:solid 1px black;border-bottom:solid 1px black;" class="graph" valign="top">
												<span class="graphNo">52</span>
												<span class="graphColumn">Гарантия недействи-</span>
												<br/>
												<span class="graphColumn">тельна для</span>
											</td>
											<td style="width:{120*$k}mm;border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;" class="graph">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
											<td style="width:{53*$k}mm;border:solid 1px black;" class="graph" valign="top">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr-->
                  <tr valign="top">
                     <td class="graph" colspan="6" style="width:">
                        <table cellpadding="0" cellspacing="0" style="width:100%;">
                           <tbody>
                              <tr>
                                 <td class="graph" style="width:{120*$k}mm;border-top:solid 1px black;border-bottom:solid 1px black;" valign="top">
                                    <!--span class="graphNo">Д </span>
												<span class="graphColumn">Таможенный контроль</span-->
                                    <table>
                                       <tbody>
                                          <tr>
                                             <xsl:variable name="TDNum" select="count(KTSin:KTSinGoodsShipment/KTSin:KTSinCommonOfficialMark[KTSin:ColumnCode='Д'])"/>
                                             <td>
                                                <xsl:attribute name="colspan">
                                                   <xsl:value-of select="$TDNum"/>
                                                </xsl:attribute>
                                                <span class="graphNo">Д </span>
                                                <span class="graphColumn">Таможенный контроль</span>
                                             </td>
                                          </tr>
                                          <tr>
                                             <xsl:for-each select="KTSin:KTSinGoodsShipment/KTSin:KTSinCommonOfficialMark[KTSin:ColumnCode='Д']">
                                                <td class="graph">
                                                   <!--xsl:if test="KTSin:ColumnCode='Д'"-->
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="KTSin:RecordSerialNumber"/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:if test="KTSin:OfficialRecord">
                                                      <xsl:value-of select="KTSin:OfficialRecord"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </xsl:if>
                                                   <xsl:if test="KTSin:ReserveMarkIdentifier">
                                                      <xsl:value-of select="KTSin:ReserveMarkIdentifier"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </xsl:if>
                                                   <br/>
														Должностное лицо:<xsl:value-of select="KTSin:PersonName"/>
                                                   <br/>
                                                   <!--xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text-->
														Подпись:<xsl:value-of select="KTSin:LNP"/>
                                                   <br/>
                                                   <!--xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text-->
														Дата:<xsl:call-template name="russian_date">
                                                      <xsl:with-param name="dateIn" select="KTSin:DateInf"/>
                                                   </xsl:call-template>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="KTSin:TimeInf"/>
                                                   <br/>
                                                   <!--/xsl:if-->
                                                </td>
                                             </xsl:for-each>
                                          </tr>
                                       </tbody>
                                    </table>
                                    <br/>
                                    <!--xsl:for-each select="KTSin:KTSinGoodsShipment/KTSin:KTSinCommonOfficialMark[KTSin:ColumnCode='Д']">
													<xsl:if test="KTSin:ColumnCode='Д'">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="KTSin:RecordSerialNumber"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:if test="KTSin:OfficialRecord">
															<xsl:value-of select="KTSin:OfficialRecord"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:if>
														<xsl:if test="KTSin:ReserveMarkIdentifier">
															<xsl:value-of select="KTSin:ReserveMarkIdentifier"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:if>
														Должностное лицо:<xsl:value-of select="KTSin:PersonName"/><br/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														Подпись:<xsl:value-of select="KTSin:LNP"/><br/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														Дата:<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="KTSin:DateInf"/>
														</xsl:call-template>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="KTSin:TimeInf"/>
														<br/>
													</xsl:if>
												</xsl:for-each>
												<br/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="KTSin:KTSPresentDate"/>
												</xsl:call-template>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="KTSin:DecisionCode"/-->
                                 </td>
                                 <td class="graph" style="width:{70*$k}mm;border:solid 1px black;" valign="top">
                                    <span class="graphNo">54 </span>
                                    <span class="graphColumn">Место и дата</span>
                                    <!--<br/>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="KTSin:KTSinFilledPerson/KTSin:KTSFilledDate"/>
												</xsl:call-template>
												<xsl:if test="(KTSin:KTSinFilledPerson/KTSin:CustomsRepresCertificate) or (KTSin:KTSinFilledPerson/KTSin:ContractRepresDecl)">
									<span class="graph">1) </span>
									<xsl:value-of select="KTSin:KTSinFilledPerson/KTSin:ContractRepresDecl/cat_ru:PrDocumentName"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="KTSin:KTSinFilledPerson/KTSin:ContractRepresDecl/cat_ru:PrDocumentNumber"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="KTSin:KTSinFilledPerson/KTSin:ContractRepresDecl/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
									
									<xsl:if test="KTSin:KTSinFilledPerson/KTSin:ContractRepresDecl"><br/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
									
									<xsl:value-of select="KTSin:KTSinFilledPerson/KTSin:CustomsRepresCertificate/cat_ru:PrDocumentName"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="KTSin:KTSinFilledPerson/KTSin:CustomsRepresCertificate/cat_ru:PrDocumentNumber"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="KTSin:KTSinFilledPerson/KTSin:CustomsRepresCertificate/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
									
									
								</xsl:if>
												<br/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:choose>
													<xsl:when test="KTSin:KTSinFilledPerson">
														<span class="graph">Подпись и фамилия лица, заполнившего КТС </span>
														
														<xsl:value-of select="KTSin:KTSinFilledPerson/cat_ru:PersonSurname"/>&#160;
														<xsl:value-of select="KTSin:KTSinFilledPerson/cat_ru:PersonName"/>&#160;
														<xsl:value-of select="KTSin:KTSinFilledPerson/cat_ru:PersonMiddleName"/>&#160;
														<xsl:if test="KTSin:KTSinFilledPerson/catESAD_cu:IdentityCard">
															<br/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:value-of select="KTSin:KTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardName"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:value-of select="KTSin:KTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardSeries"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:value-of select="KTSin:KTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardNumber"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="KTSin:KTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardDate"/>
															</xsl:call-template>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:value-of select="KTSin:KTSinFilledPerson/catESAD_cu:IdentityCard/cat_ru:OrganizationName"/>
														</xsl:if>
														<xsl:if test="KTSin:KTSinFilledPerson/cat_ru:PersonPost">
															<br/>
															<xsl:value-of select="KTSin:KTSinFilledPerson/cat_ru:PersonPost"/>
														</xsl:if>
														<xsl:if test="KTSin:KTSinFilledPerson/catESAD_cu:AuthoritesDocument">
															<br/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															-->
                                    <!--span class="graph">3) </span-->
                                    <!--
															<xsl:if test="KTSin:KTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName">
																<xsl:value-of select="KTSin:KTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName"/>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															</xsl:if>
															<xsl:value-of select="KTSin:KTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentNumber"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:if test="KTSin:KTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate">
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="KTSin:KTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate"/>
																</xsl:call-template>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															</xsl:if>
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="KTSin:KTSinFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:ComplationAuthorityDate"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
												</xsl:choose>
												<br/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="KTSin:KTSinFilledPerson/KTSin:LNP"/>-->
                                    <xsl:for-each select="KTSin:CustomsRepresentative">
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
                                       </xsl:for-each>; <br/>
                                       <!--ИНН / КПП:
															<xsl:value-of select="cat_ru:INN"/>
															<xsl:if test="cat_ru:INN and cat_ru:KPP">/</xsl:if>
															<xsl:value-of select="cat_ru:KPP"/>-->
                                       <xsl:choose>
                                          <xsl:when test="catESAD_cu:RFOrganizationFeatures">
                                             <xsl:apply-templates select="catESAD_cu:RFOrganizationFeatures"/>
                                          </xsl:when>
                                          <xsl:when test="catESAD_cu:RKOrganizationFeatures">
                                             <xsl:apply-templates select="catESAD_cu:RKOrganizationFeatures"/>
                                          </xsl:when>
                                          <xsl:when test="catESAD_cu:RBOrganizationFeatures">
                                             <xsl:apply-templates select="catESAD_cu:RBOrganizationFeatures"/>
                                          </xsl:when>
                                       </xsl:choose>
                                       <br/>
                                    </xsl:for-each>
                                    <span class="graph">Подпись и фамилия лица, заполнившего КТС</span>
                                    <br/>
                                    <xsl:for-each select="KTSin:KTSinFilledPerson">
                                       <!--Пункт 2)-->
                                       <span class="graph">2)</span>
                                       <xsl:value-of select="cat_ru:PersonSurname"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PersonName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PersonMiddleName"/>
                                       <br/>
                                       <xsl:for-each select="catESAD_cu:IdentityCard">
                                          <xsl:value-of select="cat_ru:IdentityCardName"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="cat_ru:IdentityCardSeries"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="cat_ru:IdentityCardNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>от
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
																Телефон <xsl:value-of select="cat_ru:Phone"/>
                                          <br/>
                                          <xsl:if test="../catESAD_cu:QualificationCertificate">Номер квалификационного аттестата специалиста по таможенному оформлению
										<xsl:value-of select="../catESAD_cu:QualificationCertificate"/>
                                          </xsl:if>
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
                                    <!--<xsl:if test="KTSin:RegNumberDoc">
                                       <span class="graph">4)  Исходящий номер регистрации документов</span>
                                       <xsl:value-of select="KTSin:RegNumberDoc"/>
                                       <br/>
                                    </xsl:if>
                                    <xsl:if test="KTSin:SecurityLabelCode">Код зашитной наклейки <xsl:value-of select="KTSin:SecurityLabelCode"/>
                                    </xsl:if>-->
                                    <p align="right">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="KTSin:ExecutionDate"/>
                                       </xsl:call-template>
                                    </p>
                                    <br/>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="*" mode="org">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <span class="graph">(</span>
         <xsl:value-of select="cat_ru:ShortName"/>
         <span class="graph">)</span>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:Address/cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:Address/cat_ru:PostalCode"/>,
        </xsl:if>
      <xsl:apply-templates select="cat_ru:Address/cat_ru:CountryCode | catESAD_cu:CountryCode"/>,
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
         <xsl:text> </xsl:text>
         <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
            <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
         </xsl:if>
         <xsl:text> </xsl:text>
         <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
            <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
         </xsl:if>
      </xsl:if>
      <!--xsl:if test="KTSout_CU:BranchDescription">
			<br/>
			<xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:OrganizationName"/>
			<br/>
			<xsl:if test="KTSout_CU:BranchDescription/cat_ru:Address/cat_ru:PostalCode">
				<xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:Address/cat_ru:PostalCode"/>,
			</xsl:if>
			<xsl:apply-templates select="KTSout_CU:BranchDescription/cat_ru:Address/cat_ru:CountryCode | catESAD_cu:CountryCode"/>,
			<xsl:if test="KTSout_CU:BranchDescription/cat_ru:Address/cat_ru:Region">
				<xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:Address/cat_ru:Region"/>,
			</xsl:if>
			<xsl:if test="KTSout_CU:BranchDescription/cat_ru:Address/cat_ru:City">
				<xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:Address/cat_ru:City"/>,
			</xsl:if>
			<xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:Address/cat_ru:StreetHouse"/>
			<xsl:if test="(KTSout_CU:BranchDescription/cat_ru:RFOrganizationFeatures) or (KTSout_CU:BranchDescription/cat_ru:RBOrganizationFeatures) or (KTSout_CU:BranchDescription/cat_ru:RKOrganizationFeatures)">
				<br/>
				<xsl:text>№ </xsl:text>
				<xsl:if test="KTSout_CU:BranchDescription/cat_ru:RKOrganizationFeatures/cat_ru:ITN">
					<xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
				</xsl:if>
				<xsl:if test="KTSout_CU:BranchDescription/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:text> </xsl:text>
				<xsl:if test="KTSout_CU:BranchDescription/cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:text> </xsl:text>
				<xsl:if test="KTSout_CU:BranchDescription/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
					<xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				</xsl:if>
			</xsl:if>
		</xsl:if-->
      <!--xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
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
			</xsl:if> <xsl:text> </xsl:text>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
			</xsl:if><xsl:text> </xsl:text>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
			</xsl:if>
		</xsl:if-->
      <br/>
      <xsl:apply-templates mode="spaceSeparated" select="cat_ru:IdentityCard"/>
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
</xsl:stylesheet>
