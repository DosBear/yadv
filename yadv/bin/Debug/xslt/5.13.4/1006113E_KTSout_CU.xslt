<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:KTSout_CU="urn:customs.ru:Information:CustomsDocuments:KTSout_CU:5.12.0" xmlns:catEKTS_cu="urn:customs.ru:CUEKTSCommonAggregateTypes:5.12.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:param name="k2" select="1.5"/>
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
   <xsl:template match="KTSout_CU:KTSout_CU">
      <xsl:param name="k" select="1.5"/>
      <html>
         <head>
            <title>Форма корректировки таможенной стоимости и таможенных платежей</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
							
						div.page {
							width: {210*$k}mm;
							height: {297*$k}mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid 1pt #000000;
							}
						
						div.goods {
							background: #ffffff;
							}
							
						.bordered {
							border: solid 1pt #000000;
							padding-top:4pt;
							padding-bottom:4pt;
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
							
						.underlined {
							border-bottom: solid 0.8pt #000000;
							}
							
						p.NumberDate {
							font-weight: bold;
							}
							
						.graph {
							font-family: Arial;
							font-size: 7pt;
							}
						.graphColumn {
							font-family: Arial;
							font-size: 6.5pt;
							}
							
						td {
							font-family:Courier;
							}
		
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
							
						.graphNo {
							font-size: 7pt;
							font-weight: bold;
							}
					table.addInfo {border-collapse: collapse; vertical-align: top;}
                    table.addInfo th {border: 1px solid black; background-color: LightGrey;}
                    table.addInfo td {border: 1px solid black; vertical-align: top;}
					</style>
         </head>
         <body>
            <xsl:variable name="GoodsQuantity" select="count(KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem)"/>
            <div class="page">
               <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                  <tbody>
                     <tr>
                        <td class="graphMain" style="width:{103*$k}mm;">
                           <span class="graphMain">Форма корректировки таможенной </span>
                        </td>
                        <td class="graphMain" rowspan="2" style="width:{67*$k}mm;" valign="top">
                           <span class="graphMain">КТС-1</span>
                        </td>
                        <!--<td rowspan="2" style="width:{30*$k}mm;" class="graph" valign="top">
									<span class="graph">Приложение к ДТ</span>
								</td>-->
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:{103*$k}mm;">
                           <span class="graphMain"> стоимости и таможенных платежей</span>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                  <tbody>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:{103*$k}mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" colspan="2" style="width:{26.4*$k}mm;border-top:solid 0.8pt #000000;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;">
                           <span class="graphNo">1 </span>
                           <span class="graph">Тип корректировки</span>
                        </td>
                        <td class="graph" rowspan="2" style="width:{60.6*$k}mm;border-left:solid 0.8pt #000000;" valign="top">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graphNo">А </span>
                        </td>
                     </tr>
                     <tr valign="top">
                        <td align="center" class="graphMain" style="width:{13*$k}mm;border:solid 0.8pt #000000;" valign="middle">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									1
								</td>
                        <td rowspan="3" style="width:{90*$k}mm;border:solid 0.8pt #000000;">
                           <table cellpadding="0" cellspacing="0" width="100%">
                              <tbody>
                                 <tr valign="top">
                                    <td class="graph" style="width:{45*$k}mm;">
                                       <span class="graphNo">2 </span>
                                       <span class="graph">Отправитель/Экспортер</span>
                                    </td>
                                    <td class="graph" style="width:{45*$k}mm;">
                                       <xsl:text>№ </xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:{90*$k}mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:apply-templates mode="org" select="KTSout_CU:KTSCUConsignor"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                        <td align="center" class="graph" style="width:{17.6*$k}mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
                           <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem/catEKTS_cu:Adjustment1TypeCode"/>
                           <xsl:text> / </xsl:text>
                           <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem/catEKTS_cu:Adjustment2TypeCode/catEKTS_cu:BasisCalculating"/>
                           <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem/catEKTS_cu:Adjustment2TypeCode/catEKTS_cu:AddAccrual"/>
                           <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem/catEKTS_cu:Adjustment2TypeCode/catEKTS_cu:Cost"/>
                           <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem/catEKTS_cu:Adjustment2TypeCode/catEKTS_cu:BasisCompilationKTS"/>
                           <xsl:text> / </xsl:text>
                           <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem/catEKTS_cu:Adjustment3TypeCode"/>
                        </td>
                        <td style="width:{8.8*$k}mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td rowspan="7" style="width:{13*$k}mm;border-bottom:solid 0.8pt #000000;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <table class="graph" colspan="3" width="100%">
                              <tbody align="left" valign="middle">
                                 <tr>
                                    <td>
                                       <span class="graphColumn">Экземпляр</span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                       <span class="graphColumn">для тамо-</span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                       <span class="graphColumn"> женного</span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                       <span class="graphColumn">органа</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                        <td colspan="2" style="width:{26.4*$k}mm;border:solid 0.8pt #000000;">
                           <table cellpadding="0" cellspacing="0" width="100%">
                              <tbody>
                                 <tr valign="top">
                                    <td class="graph" colspan="2" style="width:{13.2*$k}mm;">
                                       <span class="graphNo">3 </span>
                                       <span class="graph">Формы</span>
                                    </td>
                                    <td class="graph" rowspan="2" style="width:{13.2*$k}mm;border-left:solid 0.8pt #000000;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <tr valign="top">
                                    <td align="center" class="graph" style="width:{6.6*$k}mm;border-right:solid 0.8pt #000000;">
                                       <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem/catESAD_cu:AdditionalSheetCount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:{6.6*$k}mm;border-left:solid 0.8pt #000000;">
                                       <xsl:choose>
                                          <xsl:when test="KTSout_CU:KTSout_CUGoodsShipment/catEKTS_cu:TotalSheetNumber">
                                             <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/catEKTS_cu:TotalSheetNumber"/>
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
                        <td colspan="3" style="width:{91*$k}mm;border:solid 0.8pt #000000;">
                           <table cellpadding="0" cellspacing="0" width="100%">
                              <tbody>
                                 <tr valign="top">
                                    <td class="graph" style="width:{13.4*$k}mm;border-right:solid 1.5pt #000000;">
                                       <span class="graphNo">5 </span>
                                       <span class="graph">Всего товаров</span>
                                    </td>
                                    <td style="width:{18.2*$k}mm;border-left:solid 0pt #000000;"/>
                                    <td class="graph" rowspan="2" style="width:{55.4*$k}mm;border-left:solid 0.8pt #000000;">
                                       <span class="graphNo">7 </span>
                                       <span class="graph">Справочный номер</span>
                                       <br/>
                                       <xsl:value-of select="KTSout_CU:DeclarationKind"/>
                                    </td>
                                 </tr>
                                 <tr valign="top">
                                    <td class="graph" style="width:{13.4*$k}mm;border-right:0pt #000000;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/catEKTS_cu:TotalGoodsNumber"/>
                                    </td>
                                    <td style="width:{18.2*$k}mm;border-left:solid 0pt #000000;"/>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr valign="top">
                        <td rowspan="2" style="width:{90*$k}mm;border:solid 0.8pt #000000;">
                           <table cellpadding="0" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td class="graph" style="width:{45*$k}mm;">
                                       <span class="graphNo">8 </span>
                                       <span class="graph">Получатель</span>
                                    </td>
                                    <td class="graph" style="width:{45*$k}mm;">
                                       <xsl:text>№ </xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:{90*$k}mm;">
                                       <xsl:apply-templates mode="org" select="KTSout_CU:KTSCUConsignee"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                        <td class="graph" colspan="3" style="width:{91*$k}mm;border:solid 0.8pt #000000;" valign="top">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr valign="top">
                        <td colspan="3" style="width:{91*$k}mm;border:solid 0.8pt #000000;">
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                              <tbody>
                                 <tr valign="top">
                                    <td class="graph" colspan="2" style="width:{57*$k}mm;">
                                       <span class="graphNo">12 </span>
                                       <span class="graph">Общая таможенная стоимость</span>
                                    </td>
                                    <td class="graph" rowspan="2" style="width:{20*$k}mm;border-left:solid 0.8pt #000000;">
                                       <span class="graphNo">13 </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:{30*$k}mm;border-right:solid 0.8pt #000000;">
                                       <xsl:choose>
                                          <xsl:when test="KTSout_CU:KTSout_CUGoodsShipment/catEKTS_cu:TotalCustomsAmount">
                                             <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/catEKTS_cu:TotalCustomsAmount"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td align="center" class="graph" style="width:{27*$k}mm;">
                                       <xsl:choose>
                                          <xsl:when test="KTSout_CU:KTSout_CUGoodsShipment/catEKTS_cu:PreviousTotalCustomsAmount">
                                             <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/catEKTS_cu:PreviousTotalCustomsAmount"/>
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
                        <td style="width:{90*$k}mm;border:solid 0.8pt #000000;">
                           <table cellpadding="0" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td class="graph" style="width:{45*$k}mm;">
                                       <span class="graphNo">14 </span>
                                       <span class="graph">Декларант</span>
                                    </td>
                                    <td class="graph" style="width:{45*$k}mm;">
                                       <xsl:text>№ </xsl:text>
                                    </td>
                                 </tr>
                                 <tr valign="top">
                                    <td class="graph" colspan="2" style="width:{90*$k}mm;">
                                       <xsl:apply-templates mode="org" select="KTSout_CU:KTSCUDeclarant"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                        <td colspan="3" style="width:{91*$k}mm;border:solid 0.8pt #000000;" valign="top">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td rowspan="3" style="width:{90*$k}mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" colspan="3" style="width:{91*$k}mm;border:solid 0.8pt #000000;">
                           <table cellpadding="0" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:{87*$k}mm;">
                                       <span class="graphNo">20 </span>
                                       <span class="graph">Условия поставки</span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:{10*$k}mm;border-right:solid 0.8pt #000000;">
                                       <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catEKTS_cu:DeliveryTerms/cat_ru:DeliveryTermsStringCode"/>
                                    </td>
                                    <td class="graph" style="width:{77*$k}mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catEKTS_cu:DeliveryTerms/cat_ru:DeliveryPlace"/>
                                       <xsl:if test="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catEKTS_cu:DeliveryTerms/cat_ru:DeliveryTermsRBCode">,
												<xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catEKTS_cu:DeliveryTerms/cat_ru:DeliveryTermsRBCode"/>
                                       </xsl:if>
                                       <xsl:if test="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catEKTS_cu:DeliveryTerms/cat_ru:TransferPlace">,	
													<xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catEKTS_cu:DeliveryTerms/cat_ru:TransferPlace"/>
                                       </xsl:if>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="3" style="width:{91*$k}mm;border:solid 0.8pt #000000;" valign="top">
                           <table cellpadding="0" cellspacing="0" width="100%">
                              <tbody>
                                 <tr valign="top">
                                    <td class="graph" colspan="2" style="width:{37.5*$k}mm;">
                                       <span class="graphNo">22 </span>
                                       <span class="graph">Валюта и общая сумма по счету</span>
                                    </td>
                                    <td align="center" class="graph" rowspan="2" style="width:{19*$k}mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;">
                                       <span class="graphNo">23 </span>
                                       <span class="graph">Курс валюты</span>
                                       <br/>
                                       <br/>
                                       <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catESAD_cu:ContractCurrencyRate"/>
                                       <xsl:if test="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catESAD_cu:CurrencyQuantity">(за 
													<xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catESAD_cu:CurrencyQuantity"/>едн.)
													</xsl:if>
                                    </td>
                                    <td class="graph" colspan="3" style="width:{30.5*$k}mm;">
                                       <span class="graphNo">24 </span>
                                       <span class="graph">Характер сделки</span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:{7.8*$k}mm;border-right:solid 0.8pt #000000;">
                                       <xsl:choose>
                                          <xsl:when test="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catESAD_cu:ContractCurrencyCode">
                                             <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catESAD_cu:ContractCurrencyCode"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td align="center" class="graph" style="width:{29.7*$k}mm;">
                                       <xsl:choose>
                                          <xsl:when test="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catESAD_cu:TotalInvoiceAmount">
                                             <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catESAD_cu:TotalInvoiceAmount"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td align="center" class="graph" style="width:{10.5*$k}mm;border-right:solid 0.8pt #000000;">
                                       <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catEKTS_cu:DealNatureCode"/>
                                    </td>
                                    <td align="center" class="graph" style="width:{10*$k}mm;border-right:solid 0.8pt #000000;">
                                       <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSContractTerms/catEKTS_cu:DealFeatureCode"/>
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
                        <td style="width:{13*$k}mm;border-bottom:solid 0.8pt #000000;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" colspan="3" style="width:{91*$k}mm;border:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <xsl:for-each select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem[1]">
                  <xsl:apply-templates select="."/>
               </xsl:for-each>
               <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                  <tbody>
                     <tr valign="top">
                        <td class="graph" style="width:{17*$k}mm;border-top:solid 0.8pt #000000;" valign="top">
                           <span class="graphNo">В</span>
                           <span class="graphColumn">Перерасчет платежей</span>
                        </td>
                        <td class="graph" colspan="5" style="width:{173*$k}mm;border:solid 0.8pt #000000;">
                           <table cellpadding="0" cellspacing="0" style="width:100%;">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" style="width:{10*$k}mm;border:solid 0.8pt #000000;">Вид</td>
                                    <td align="center" class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">Сумма</td>
                                    <td align="center" class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">Предыдущая сумма</td>
                                    <td align="center" class="graph" style="width:{40*$k}mm;border:solid 0.8pt #000000;">Изменения</td>
                                    <td class="graph" style="width:{63*$k}mm;border-left:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <xsl:for-each select="KTSout_CU:KTSoutPaymentsReCalc">
                                    <tr>
                                       <td class="graph" style="width:{10*$k}mm;border:solid 0.8pt #000000;">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="catEKTS_cu:PaymentModeCode"/>
                                       </td>
                                       <td class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="catEKTS_cu:PaymentAmount"/>
                                       </td>
                                       <td class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="catEKTS_cu:PrecedingPaymentAmount"/>
                                       </td>
                                       <td class="graph" style="width:{40*$k}mm;border:solid 0.8pt #000000;border-right:solid 1pt #000000;">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="catEKTS_cu:ChangeAmount"/>
                                       </td>
                                       <td class="graph" style="width:{63*$k}mm;border:solid 0pt #000000;">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                                 <tr>
                                    <td align="center" class="graph" colspan="3" style="width:{70*$k}mm;border-top:solid 0.8pt #000000;border-left:solid 0.8pt #000000;">
															Общая сумма, подлежащая возврату (взысканию), в нац. валюте
														</td>
                                    <td class="graph" style="width:{40*$k}mm;border-bottom:solid 0.8pt #000000;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
                                       <xsl:value-of select="KTSout_CU:KTSout_CUGoodsShipment/catEKTS_cu:DebtReturnSumm"/>
                                    </td>
                                    <td class="graph" style="width:{63*$k}mm;border:solid 0pt #000000;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr valign="top">
                        <td class="graph" colspan="6" style="width:{190*$k}mm;">
                           <table cellpadding="0" cellspacing="0" style="width:100%;">
                              <tbody>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:{65*$k}mm;border-top:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">Д</span>
                                       <span class="graphColumn"> Таможенный контроль</span>
                                    </td>
                                    <td class="graph" style="width:{70*$k}mm;border-left:solid 0.8pt #000000; " valign="top">
                                       <span class="graphNo">54 </span>
                                       <span class="graphColumn">Место и дата</span>
                                       <br/>
                                       <br/>
                                       <br/>
                                       <xsl:for-each select="KTSout_CU:CustomsRepresentative">
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
                                       <xsl:for-each select="KTSout_CU:FilledPerson">
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
																Телефон <xsl:for-each select="cat_ru:Phone">
                                                <xsl:value-of select="."/>
                                                <xsl:if test="position()!=last()">, </xsl:if>
                                             </xsl:for-each>
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
                                       <xsl:if test="KTSout_CU:RegNumberDoc">
                                          <span class="graph">4)  Исходящий номер регистрации документов</span>
                                          <xsl:value-of select="KTSout_CU:RegNumberDoc"/>
                                          <br/>
                                       </xsl:if>
                                       <xsl:if test="KTSout_CU:SecurityLabelCode">Код зашитной наклейки <xsl:value-of select="KTSout_CU:SecurityLabelCode"/>
                                       </xsl:if>
                                       <p align="right">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="KTSout_CU:ExecutionDate"/>
                                          </xsl:call-template>
                                       </p>
                                       <br/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:{35*$k}mm;" valign="top">
                                       <br/>
                                       <span class="graphColumn">Должностное лицо</span>
                                    </td>
                                    <td class="graph" style="width:{35*$k}mm;" valign="top">
                                       <br/>
                                       <span class="graphColumn">Должностное лицо</span>
                                    </td>
                                    <td class="graph" style="width:{70*$k}mm;border-left:solid 0.8pt #000000;" valign="top">
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:{35*$k}mm;" valign="top">
                                       <br/>
                                       <span class="graphColumn">Подпись</span>
                                    </td>
                                    <td class="graph" style="width:{35*$k}mm;" valign="top">
                                       <br/>
                                       <span class="graphColumn">Подпись</span>
                                    </td>
                                    <td class="graph" style="width:{70*$k}mm;border-left:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:{35*$k}mm;" valign="top">
                                       <br/>
                                       <span class="graphColumn">Дата:</span>
                                    </td>
                                    <td class="graph" style="width:{35*$k}mm;" valign="top">
                                       <br/>
                                       <span class="graphColumn">Дата:</span>
                                    </td>
                                    <td class="graph" style="width:{70*$k}mm;border-left:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <!--tr>
												<td style="width:{15*$k}mm;" class="graph" valign="top">
													<span class="graphColumn">Подпись</span>
												</td>
												<td style="width:{10*$k}mm;" class="graph" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td style="width:{15*$k}mm;" class="graph" valign="top">
													<span class="graphColumn">Подпись</span>
												</td>
												<td style="width:{15*$k}mm;border-right:solid 0.8pt #000000;" class="graph" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr>
												<td style="width:{15*$k}mm;border-bottom:solid 0.8pt #000000;" class="graph" valign="top">
													<span class="graphColumn">Дата</span>
												</td>
												<td style="width:{10*$k}mm;border-bottom:solid 0.8pt #000000;" class="graph" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td style="width:{15*$k}mm;border-bottom:solid 0.8pt #000000;" class="graph" valign="top">
													<span class="graphColumn">Дата</span>
												</td>
												<td style="width:{15*$k}mm;border-bottom:solid 0.8pt #000000;border-right:solid 0.8pt #000000;" class="graph" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr-->
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <xsl:if test="$GoodsQuantity>1">
               <xsl:for-each select="KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem[(position()) mod 2 = 0 and (position()!=1)]">
                  <xsl:variable name="el2" select="following-sibling::KTSout_CU:KTSoutGoodsItem[1]"/>
                  <!--первый братский узел текущего узла 
в прямом порядке -->
                  <div class="page">
                     <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                        <tbody>
                           <tr>
                              <td class="graphMain" style="width:{104.75*$k}mm;">
                                 <span class="graphMain">ДОБАВОЧНЫЙ ЛИСТ</span>
                              </td>
                              <td class="graphMain" style="width:{67*$k}mm;" valign="top">
                                 <span class="graphMain">КТС-2</span>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                     <table border="1" cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                        <tbody>
                           <tr>
                              <td class="graphMain" colspan="2" style="width:{103*$k}mm;">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graph" colspan="2" style="width:{26.4*$k}mm;border-top:solid 1.5pt #000000;border-left:solid 1.5pt #000000;border-right:solid 1pt #000000;border-bottom:solid 0.8pt #000000;">
                                 <span class="graphNo">1 </span>
                                 <span class="graph">Тип корректировки</span>
                              </td>
                              <td class="graph" rowspan="3" style="width:{60.6*$k}mm;border-left:solid 0.8pt #000000;" valign="top">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <span class="graphNo"/>
                              </td>
                           </tr>
                           <tr valign="top">
                              <td align="center" class="graphMain" rowspan="2" style="width:{13*$k}mm;" valign="middle">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td rowspan="2" style="width:{90*$k}mm;border:solid 0.8pt #000000;">
                                 <table cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                       <tr valign="top">
                                          <td class="graph" style="width:{40*$k}mm;">
                                             <span class="graphNo">2 </span>
                                             <span class="graph">Отправитель/<br/>Экспортер</span>
                                          </td>
                                          <td class="graph" style="width:{45*$k}mm;">
                                             <xsl:text>Получатель</xsl:text>
                                          </td>
                                          <td class="graph" style="width:{5*$k}mm;">
                                             <xsl:text>№ </xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:{40*$k}mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:apply-templates mode="org" select="//KTSout_CU:KTSCUConsignor"/>
                                          </td>
                                          <td class="graph" style="width:{45*$k}mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:apply-templates mode="org" select="//KTSout_CU:KTSCUConsignee"/>
                                          </td>
                                          <td class="graph" style="width:{5*$k}mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                              <td align="center" class="graph" style="width:{26.4*$k}mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;vertical-align: bottom;">
                                 <table cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                       <tr>
                                          <td align="center" class="graph" style="width:{17.6*$k}mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:{8.8*$k}mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td align="center" class="graph" style="width:{17.6*$k}mm;" valign="bottom">
                                             <xsl:value-of select="catEKTS_cu:Adjustment1TypeCode"/>
                                             <xsl:text> / </xsl:text>
                                             <xsl:value-of select="//KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem/catEKTS_cu:Adjustment2TypeCode/catEKTS_cu:BasisCalculating"/>
                                             <xsl:value-of select="//KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem/catEKTS_cu:Adjustment2TypeCode/catEKTS_cu:AddAccrual"/>
                                             <xsl:value-of select="//KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem/catEKTS_cu:Adjustment2TypeCode/catEKTS_cu:Cost"/>
                                             <xsl:value-of select="//KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem/catEKTS_cu:Adjustment2TypeCode/catEKTS_cu:BasisCompilationKTS"/>
                                             <xsl:text> / </xsl:text>
                                             <xsl:value-of select="//KTSout_CU:KTSout_CUGoodsShipment/KTSout_CU:KTSoutGoodsItem/catEKTS_cu:Adjustment3TypeCode"/>
                                          </td>
                                          <td style="width:{8.8*$k}mm;border-left:solid 0.8pt #000000;" valign="bottom">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="2" style="width:{26.4*$k}mm;border:solid 0.8pt #000000;vertical-align: bottom;">
                                 <table cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                       <tr valign="top">
                                          <td class="graph" colspan="2" style="width:{13.2*$k}mm;">
                                             <span class="graphNo">3 </span>
                                             <span class="graph">Формы</span>
                                          </td>
                                          <td class="graph" rowspan="2" style="width:{13.2*$k}mm;border-left:solid 0.8pt #000000;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr valign="top">
                                          <td align="center" class="graph" style="width:{6.6*$k}mm;border-right:solid 0.8pt #000000;">
                                             <xsl:value-of select="catESAD_cu:AdditionalSheetCount"/>
                                          </td>
                                          <td align="center" class="graph" style="width:{6.6*$k}mm;border-left:solid 0.8pt #000000;">
                                             <xsl:choose>
                                                <xsl:when test="//KTSout_CU:KTSout_CUGoodsShipment/catEKTS_cu:TotalSheetNumber">
                                                   <xsl:value-of select="//KTSout_CU:KTSout_CUGoodsShipment/catEKTS_cu:TotalSheetNumber"/>
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
                        </tbody>
                     </table>
                     <div class="goods">
                        <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                           <tbody>
                              <tr>
                                 <td class="graph" rowspan="4" style="width:{13*$k}mm;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;border-left:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">31</span>
                                    <span class="graphColumn">Грузовые места и описание товаров</span>
                                 </td>
                                 <td class="graph" style="width:{98.8*$k}mm;border-top:solid 1pt #000000;" valign="top">
                                    <span class="graph">Маркировка и количество - Номера контейнеров - Количество и отличительные особенности</span>
                                 </td>
                                 <td class="graph" style="width:{11*$k}mm;border-top:solid 0.8pt #000000;">
                                    <table cellpadding="0" cellspacing="0" style="width:100%;">
                                       <tbody>
                                          <tr>
                                             <td class="graph" colspan="2" style="width:{11*$k}mm;border-top:solid 0.8pt #000000;border-left:solid 0.8pt #000000;">
                                                <span class="graphNo">32 </span>
                                                <span class="graph">Товар</span>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="center" class="graph" style="width:{6.6*$k}mm;border-left:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;border-right:solid 0.8pt #000000;">
                                                <xsl:choose>
                                                   <xsl:when test="catESAD_cu:GoodsNumeric!=''">
                                                      <xsl:value-of select="catESAD_cu:GoodsNumeric"/>
                                                   </xsl:when>
                                                   <xsl:otherwise>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </xsl:otherwise>
                                                </xsl:choose>
                                             </td>
                                             <td style="width:{4.4*$k}mm;border-bottom:solid 0.8pt #000000;">
                                                <span class="graph">
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															№
														</span>
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                                 <td class="graph" colspan="3" style="width:{67.2*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">33 </span>
                                    <span class="graph">Код товара</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <table border="1" style="border:0" width="100%">
                                       <tbody>
                                          <tr>
                                             <td class="graph" style="border-top: 0; border-bottom:0; border-left:0; border-right:1pt solid black" valign="top" width="20%">
                                                <xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/>
                                             </td>
                                             <td class="graph" style="border:0; padding-left:5mm" valign="top" width="10%">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td class="graph" style="border-top: 0; border-bottom:0; border-right:0; border-left: 1pt solid black; padding-left:5mm" valign="top">
                                                <xsl:value-of select="catESAD_cu:GoodsAddTNVEDCode"/>
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="2" rowspan="3" style="width:{109.8*$k}mm;border-bottom:solid 0.8pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">1)</span>
                                    <xsl:for-each select="catESAD_cu:GoodsDescription">
                                       <xsl:value-of select="."/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
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
                                       <xsl:if test="catESAD_cu:OilField"> Месторождения товара:
							<xsl:value-of select="catESAD_cu:OilField"/>
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
                                          <xsl:if test="catEKTS_cu:ESADGoodsPackaging/catESAD_cu:PackingInformation">
                                             <xsl:for-each select="catEKTS_cu:ESADGoodsPackaging/catESAD_cu:PackingInformation">
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
                                    <xsl:if test="(catESAD_cu:DeliveryTime) or (catESAD_cu:DeliveryTimeEND)">
                                       <br/>
                                       <span class="graph">7) Поставка в течение</span>
                                       <xsl:value-of select="catESAD_cu:DeliveryTime"/>
                                       <xsl:if test="catESAD_cu:DeliveryTimeEND">
								- <xsl:value-of select="catESAD_cu:DeliveryTimeEND"/>
                                       </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="catESAD_cu:QuantityFact">
                                       <br/>
                                       <span class="graph">8) </span>
                                       <xsl:value-of select="catESAD_cu:QuantityFact"/>
                                    </xsl:if>
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
						<xsl:for-each select="catEKTS_cu:SupplementaryQuantity">
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
                                             <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                                Катег.прод.
                            </xsl:if>
                                             <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="."/>
                                             </xsl:for-each>
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
                                 <td class="graph" style="width:{25*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                    <table width="100%">
                                       <tbody>
                                          <tr>
                                             <td class="graph" colspan="3" style="width:{25*$k2}mm;border-top: 0; border-bottom:0; border-left:0;" valign="top">
                                                <span class="graphNo">34 </span>
                                                <span class="graph">Код страны <br/> происх.</span>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td class="graph" style="width:{5*$k}mm;border-top: 0; border-bottom:0; border-left:0;">a</td>
                                             <td class="graph" style="width:{10*$k}mm;border-top: 0; border-bottom:0; border-left:0;border-right:solid 1pt #000000;">
                                                <xsl:value-of select="catESAD_cu:OriginCountryCode"/>
                                             </td>
                                             <td class="graph" style="width:{10*$k}mm;border-top: 0; border-bottom:0; border-left:0;">b</td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                                 <td class="graph" style="width:{42.2*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">35 </span>
                                    <span class="graph">Вес брутто (кг)</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="catESAD_cu:GrossWeightQuantity"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:{25*$k}mm; border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">37</span>
                                    <span class="graph">ПРОЦЕДУРА</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <table border="1" style="border:0" width="100%">
                                       <tbody>
                                          <tr>
                                             <td class="graph" style="border-top: 0; border-bottom:0; border-left:0; border-right:1pt solid black" valign="top" width="20%">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <!--Теперь не заполняем-->
                                                <xsl:value-of select="KTSout_CU:CustomsProcedure/catESAD_cu:MainCustomsModeCode"/>
                                                <xsl:value-of select="KTSout_CU:CustomsProcedure/catESAD_cu:PrecedingCustomsModeCode"/>
                                             </td>
                                             <td class="graph" style="border:0; padding-left:5mm" valign="top">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="KTSout_CU:CustomsProcedure/catESAD_cu:GoodsTransferFeature"/>
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                                 <td class="graph" style="width:{42.2*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">38 </span>
                                    <span class="graph">Вес нетто (кг)</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="3" style="width:{67.2*$k}mm;border:solid 0.8pt #000000;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" rowspan="3" style="width:{13*$k}mm;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">44</span>
                                    <span class="graphColumn">Дополнит. информация/ Представ. документы/</span>
                                 </td>
                                 <td class="graph" colspan="2" rowspan="3" style="width:{109.8*$k}mm;border-bottom:solid 0.8pt #000000;border-top:solid 0.8pt #000000;" valign="top">
                                    <xsl:if test="KTSout_CU:KTSoutPresentedDocuments">
                                       <xsl:for-each select="KTSout_CU:KTSoutPresentedDocuments">
                                          <xsl:value-of select="catESAD_cu:PresentedDocumentModeCode"/>
                                          <xsl:if test="catESAD_cu:ProvidingIndicationMark">
											  <xsl:text>/</xsl:text><xsl:value-of select="catESAD_cu:ProvidingIndicationMark"/>
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
                                          <xsl:if test="KTSout_CU:RegNumberDocument and catESAD_cu:ProvidingIndicationMark='2'">
											  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="KTSout_CU:RegNumberDocument"/>
										  </xsl:if>
                                          <xsl:if test="catESAD_cu:PresentingLackingDate and catESAD_cu:ProvidingIndicationMark=3">
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
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
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
                                    </xsl:if>
                                 </td>
                                 <td class="graph" colspan="3" style="width:{67.2*$k}mm;">
                                    <table cellpadding="0" cellspacing="0" style="width:100%;">
                                       <tbody>
                                          <tr>
                                             <td class="graph" style="width:{25*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                                <span class="graphNo">41 </span>
                                                <span class="graph">Дополнит.единицы</span>
                                                <br/>
                                                <xsl:choose>
                                                   <xsl:when test="catEKTS_cu:SupplementaryQuantity">
                                                      <xsl:value-of select="catEKTS_cu:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="catEKTS_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
                                                   </xsl:when>
                                                </xsl:choose>
                                             </td>
                                             <td class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                                <span class="graphNo">42 </span>
                                                <span class="graph">Цена товара</span>
                                                <br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="catESAD_cu:InvoicedCost"/>
                                             </td>
                                             <td class="graph" style="width:{12.2*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                                <span class="graphNo">43 </span>
                                                <br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="catESAD_cu:CustomsCostCorrectMethod"/>
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                              </tr>
                              <tr valign="top">
                                 <td class="graph" colspan="3" style="width:{67.2*$k}mm;border:solid 0.8pt #000000;">
                                    <table cellpadding="0" cellspacing="0" style="width:100%;">
                                       <tbody>
                                          <tr>
                                             <td class="graph" colspan="2" style="width:{67.2*$k}mm;">
                                                <span class="graphNo">45 </span>
                                                <span class="graph">Таможенная стоимость</span>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="center" class="graph" style="width:{37.2*$k}mm;border-right:solid 0.8pt #000000;">
                                                <xsl:choose>
                                                   <xsl:when test="catESAD_cu:CustomsCost">
                                                      <xsl:value-of select="catESAD_cu:CustomsCost"/>
                                                   </xsl:when>
                                                   <xsl:otherwise>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </xsl:otherwise>
                                                </xsl:choose>
                                             </td>
                                             <td align="center" class="graph" style="width:{30*$k}mm;">
                                                <xsl:value-of select="catEKTS_cu:PreviousCustomsCost"/>
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="3" style="width:{67.2*$k}mm;">
                                    <table cellpadding="0" cellspacing="0" style="width:100%;">
                                       <tbody>
                                          <tr>
                                             <td class="graph" style="width:{27.2*$k}mm;border:solid 0.8pt #000000;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td class="graph" style="width:{40*$k}mm;border:solid 0.8pt #000000;">
                                                <span class="graphNo">46 </span>
                                                <span class="graph">Статистическая стоимость</span>
                                                <br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="catESAD_cu:StatisticalCost"/>
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                              </tr>
                              <!--</tbody>
								</table>
							</div>-->
                              <xsl:for-each select="$el2">
                                 <!--<div class="goods">
									<table style="width:100%;border:solid 0pt #000000;" cellpadding="0" cellspacing="0">
										<tbody>-->
                                 <tr>
                                    <td class="graph" rowspan="4" style="width:{13*$k}mm;border-right:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;border-top:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">31</span>
                                       <span class="graphColumn">Грузовые места и описание товаров</span>
                                    </td>
                                    <td class="graph" style="width:{98.8*$k}mm;border-top:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Маркировка и количество - Номера контейнеров - Количество и отличительные особенности</span>
                                    </td>
                                    <td class="graph" style="width:{11*$k}mm;border-top:solid 0.8pt #000000;">
                                       <table cellpadding="0" cellspacing="0" style="width:100%;">
                                          <tbody>
                                             <tr>
                                                <td class="graph" colspan="2" style="width:{11*$k}mm;border-top:solid 0.8pt #000000;border-left:solid 0.8pt #000000;">
                                                   <span class="graphNo">32 </span>
                                                   <span class="graph">Товар</span>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td align="center" class="graph" style="width:{6.6*$k}mm;border-left:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;border-right:solid 0.8pt #000000;">
                                                   <xsl:choose>
                                                      <xsl:when test="catESAD_cu:GoodsNumeric!=''">
                                                         <xsl:value-of select="catESAD_cu:GoodsNumeric"/>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </xsl:otherwise>
                                                   </xsl:choose>
                                                </td>
                                                <td style="width:{4.4*$k}mm;border-bottom:solid 0.8pt #000000;">
                                                   <span class="graph">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															№
														</span>
                                                </td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </td>
                                    <td class="graph" colspan="3" style="width:{50*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">33 </span>
                                       <span class="graph">Код товара</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <table border="1" style="border:0" width="100%">
                                          <tbody>
                                             <tr>
                                                <td class="graph" style="border-top: 0; border-bottom:0; border-left:0; border-right:1pt solid black" valign="top" width="20%">
                                                   <xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/>
                                                </td>
                                                <td class="graph" style="border:0; padding-left:5mm" valign="top" width="10%">
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </td>
                                                <td class="graph" style="border-top: 0; border-bottom:0; border-right:0; border-left: 1pt solid black; padding-left:5mm" valign="top">
                                                   <xsl:value-of select="catESAD_cu:GoodsAddTNVEDCode"/>
                                                </td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" rowspan="3" style="width:{109.8*$k}mm;border-bottom:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">1)</span>
                                       <xsl:for-each select="catESAD_cu:GoodsDescription">
                                          <xsl:value-of select="."/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
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
                                          <xsl:if test="catESAD_cu:OilField"> Месторождения товара:
							<xsl:value-of select="catESAD_cu:OilField"/>
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
                                             <xsl:if test="catEKTS_cu:ESADGoodsPackaging/catESAD_cu:PackingInformation">
                                                <xsl:for-each select="catEKTS_cu:ESADGoodsPackaging/catESAD_cu:PackingInformation">
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
                                       <xsl:if test="(catESAD_cu:DeliveryTime) or (catESAD_cu:DeliveryTimeEND)">
                                          <br/>
                                          <span class="graph">7) Поставка в течение</span>
                                          <xsl:value-of select="catESAD_cu:DeliveryTime"/>
                                          <xsl:if test="catESAD_cu:DeliveryTimeEND">
								- <xsl:value-of select="catESAD_cu:DeliveryTimeEND"/>
                                          </xsl:if>
                                       </xsl:if>
                                       <xsl:if test="catESAD_cu:QuantityFact">
                                          <br/>
                                          <span class="graph">8) </span>
                                          <xsl:value-of select="catESAD_cu:QuantityFact"/>
                                       </xsl:if>
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
						<xsl:for-each select="catEKTS_cu:SupplementaryQuantity">
                                                <!-- меняла-->
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
                                                <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                                Катег.прод.
                            </xsl:if>
                                                <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="."/>
                                                </xsl:for-each>
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
                                    <td class="graph" style="width:{25*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                       <table width="100%">
                                          <tbody>
                                             <tr>
                                                <td class="graph" colspan="3" style="width:{25*$k}mm;border-top: 0; border-bottom:0; border-left:0;" valign="top">
                                                   <span class="graphNo">34 </span>
                                                   <span class="graph">Код страны <br/> происх.</span>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td class="graph" style="width:{5*$k}mm;border-top: 0; border-bottom:0; border-left:0;">a</td>
                                                <td class="graph" style="width:{10*$k}mm;border-top: 0; border-bottom:0; border-left:0;border-right:solid 1pt #000000;">
                                                   <xsl:value-of select="catESAD_cu:OriginCountryCode"/>
                                                </td>
                                                <td class="graph" style="width:{10*$k}mm;border-top: 0; border-bottom:0; border-left:0;">b</td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </td>
                                    <td class="graph" style="width:{42.2*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">35 </span>
                                       <span class="graph">Вес брутто (кг)</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="catESAD_cu:GrossWeightQuantity"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:{25*$k}mm; border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">37</span>
                                       <span class="graph">ПРОЦЕДУРА</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <table border="1" style="border:0" width="100%">
                                          <tbody>
                                             <tr>
                                                <td class="graph" style="border-top: 0; border-bottom:0; border-left:0; border-right:1pt solid black" valign="top" width="20%">
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <!--Теперь не заполняем-->
                                                   <xsl:value-of select="KTSout_CU:CustomsProcedure/catESAD_cu:MainCustomsModeCode"/>
                                                   <xsl:value-of select="KTSout_CU:CustomsProcedure/catESAD_cu:PrecedingCustomsModeCode"/>
                                                </td>
                                                <td class="graph" style="border:0; padding-left:5mm" valign="top">
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="KTSout_CU:CustomsProcedure/catESAD_cu:GoodsTransferFeature"/>
                                                </td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </td>
                                    <td class="graph" style="width:{42.2*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">38 </span>
                                       <span class="graph">Вес нетто (кг)</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="3" style="width:{67.2*$k}mm;border:solid 0.8pt #000000;">
                                       <!--<span class="graphNo">40 </span>
											<span class="graph">Общая декларация/предшествующий документ</span>
											<br/>-->
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="3" style="width:{13*$k}mm;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">44</span>
                                       <span class="graphColumn">Дополнит. информация/ Представ. документы/</span>
                                    </td>
                                    <td class="graph" colspan="2" rowspan="3" style="width:{109.8*$k}mm;border-bottom:solid 0.8pt #000000;border-top:solid 0.8pt #000000;" valign="top">
                                       <xsl:if test="KTSout_CU:KTSoutPresentedDocuments">
                                          <xsl:for-each select="KTSout_CU:KTSoutPresentedDocuments">
                                             <xsl:value-of select="catESAD_cu:PresentedDocumentModeCode"/>
                                             <xsl:if test="catESAD_cu:ProvidingIndicationMark">
												 <xsl:text>/</xsl:text><xsl:value-of select="catESAD_cu:ProvidingIndicationMark"/>
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
                                             <xsl:if test="KTSout_CU:RegNumberDocument and catESAD_cu:ProvidingIndicationMark='2'">
												 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="KTSout_CU:RegNumberDocument"/>
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
                                                <!--меняла -->
                                                <!--xsl:text> Срок временного ввоза </xsl:text-->
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
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
                                       </xsl:if>
                                    </td>
                                    <td class="graph" colspan="3" style="width:{67.2*$k}mm;">
                                       <table cellpadding="0" cellspacing="0" style="width:100%;">
                                          <tbody>
                                             <tr>
                                                <td class="graph" style="width:{25*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                                   <span class="graphNo">41 </span>
                                                   <span class="graph">Дополнит.единицы</span>
                                                   <br/>
                                                   <xsl:choose>
                                                      <xsl:when test="catEKTS_cu:SupplementaryQuantity">
                                                         <xsl:value-of select="catEKTS_cu:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         <xsl:value-of select="catEKTS_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
                                                      </xsl:when>
                                                   </xsl:choose>
                                                </td>
                                                <td class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                                   <span class="graphNo">42 </span>
                                                   <span class="graph">Цена товара</span>
                                                   <br/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="catESAD_cu:InvoicedCost"/>
                                                </td>
                                                <td class="graph" style="width:{12.2*$k}mm;border:solid 0.8pt #000000;" valign="top">
                                                   <span class="graphNo">43 </span>
                                                   <br/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="catESAD_cu:CustomsCostCorrectMethod"/>
                                                </td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr valign="top">
                                    <td class="graph" colspan="3" style="width:{67.2*$k}mm;border:solid 0.8pt #000000;">
                                       <table cellpadding="0" cellspacing="0" style="width:100%;">
                                          <tbody>
                                             <tr>
                                                <td class="graph" colspan="2" style="width:{67.2*$k}mm;">
                                                   <span class="graphNo">45 </span>
                                                   <span class="graph">Таможенная стоимость</span>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td align="center" class="graph" style="width:{37.2*$k}mm;border-right:solid 0.8pt #000000;">
                                                   <xsl:choose>
                                                      <xsl:when test="catESAD_cu:CustomsCost">
                                                         <xsl:value-of select="catESAD_cu:CustomsCost"/>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </xsl:otherwise>
                                                   </xsl:choose>
                                                </td>
                                                <td align="center" class="graph" style="width:{30*$k}mm;">
                                                   <xsl:value-of select="catEKTS_cu:PreviousCustomsCost"/>
                                                </td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="3" style="width:{67.2*$k}mm;">
                                       <table cellpadding="0" cellspacing="0" style="width:100%;">
                                          <tbody>
                                             <tr>
                                                <td class="graph" style="width:{27.2*$k}mm;border:solid 0.8pt #000000;">
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </td>
                                                <td class="graph" style="width:{40*$k}mm;border:solid 0.8pt #000000;">
                                                   <span class="graphNo">46 </span>
                                                   <span class="graph">Статистическая стоимость</span>
                                                   <br/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="catESAD_cu:StatisticalCost"/>
                                                </td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <!--</div>-->
                              </xsl:for-each>
                              <xsl:for-each select=".">
                                 <tr valign="top">
                                    <td class="graph" rowspan="4" style="width:{13*$k}mm;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">47</span>
                                       <span class="graphColumn">Исчисление платежей</span>
                                    </td>
                                    <td class="graph" colspan="5" style="width:{177*$k}mm;">
                                       <table cellpadding="0" cellspacing="0" style="width:100%;">
                                          <tbody>
                                             <tr>
                                                <td align="center" class="graph" style="width:{10*$k}mm;border:solid 0.8pt #000000;">Вид</td>
                                                <td align="center" class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">Основа начисления</td>
                                                <td align="center" class="graph" style="width:{15*$k}mm;border:solid 0.8pt #000000;">Ставка</td>
                                                <td align="center" class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">Сумма</td>
                                                <td align="center" class="graph" style="width:{5*$k}mm;border:solid 0.8pt #000000;">СП</td>
                                                <td align="center" class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">Предыдущая сумма</td>
                                                <td align="center" class="graph" style="width:{20*$k}mm;border:solid 0.8pt #000000;">Изменения</td>
                                                <td align="center" class="graph" style="width:{37*$k}mm;border:solid 0.8pt #000000;">№ и дата платежн. пор.</td>
                                             </tr>
                                             <xsl:for-each select="KTSout_CU:KTSCustomsPaymentCalculation">
                                                <tr>
                                                   <td class="graph" style="width:{10*$k}mm;border:solid 0.8pt #000000;">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="catESAD_cu:PaymentModeCode"/>
                                                   </td>
                                                   <td class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:if test="catESAD_cu:TaxBase">
                                                         <xsl:value-of select="catESAD_cu:TaxBase"/>
                                                      </xsl:if>
                                                   </td>
                                                   <td class="graph" style="width:{15*$k}mm;border:solid 0.8pt #000000;">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="catESAD_cu:Rate"/>
                                                   </td>
                                                   <td class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="catESAD_cu:PaymentAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:{5*$k}mm;border:solid 0.8pt #000000;">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="catESAD_cu:PaymentCode"/>
                                                   </td>
                                                   <td class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="catEKTS_cu:PrecedingPaymentAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:{20*$k}mm;border:solid 0.8pt #000000;">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="catEKTS_cu:ChangeAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:{37*$k}mm;border:solid 0.8pt #000000;">
                                                      <xsl:for-each select="catEKTS_cu:PaymentDocument">
                                                         <xsl:value-of select="cat_ru:PrDocumentName"/>
                                                         <xsl:text> </xsl:text>
                                                         <xsl:if test="cat_ru:PrDocumentNumber">№
																	<xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                                         </xsl:if>
                                                         <xsl:text> </xsl:text>
                                                         <xsl:if test="cat_ru:PrDocumentDate">от
																
                                                            <!--	<xsl:value-of select="cat_ru:PrDocumentDate"/>-->
                                                            <xsl:call-template name="russian_date">
                                                               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                            </xsl:call-template>
                                                         </xsl:if>
                                                      </xsl:for-each>
                                                      <br/>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                             <tr>
                                                <td align="center" class="graph" colspan="5" style="width:{90*$k}mm;border-top:solid 0.8pt #000000;border-left:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
															Общая сумма, подлежащая взысканию (возврату), в нац. валюте
														</td>
                                                <td class="graph" style="width:{30*$k}mm;border-bottom:solid 0.8pt #000000;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
                                                   <xsl:value-of select="catEKTS_cu:TotalCorrectedCost"/>
                                                </td>
                                                <td class="graph" style="width:{20*$k}mm;border:solid 0.8pt #000000;">
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </td>
                                                <td class="graph" style="width:{37*$k}mm;border:solid 0.8pt #000000;">
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                              <xsl:for-each select="$el2">
                                 <!--<table style="width:100%;" cellpadding="0" cellspacing="0">
															<tbody>-->
                                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                                    <tbody>
                                       <tr valign="top">
                                          <td class="graph" rowspan="4" style="width:{13*$k}mm;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;" valign="top">
                                             <span class="graphNo">47</span>
                                             <span class="graphColumn">Исчисление платежей</span>
                                          </td>
                                          <td class="graph" colspan="5" style="width:{177*$k}mm;">
                                             <table cellpadding="0" cellspacing="0" style="width:100%;">
                                                <tbody>
                                                   <tr>
                                                      <td align="center" class="graph" style="width:{10*$k}mm;border:solid 0.8pt #000000;">Вид</td>
                                                      <td align="center" class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">Основа начисления</td>
                                                      <td align="center" class="graph" style="width:{15*$k}mm;border:solid 0.8pt #000000;">Ставка</td>
                                                      <td align="center" class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">Сумма</td>
                                                      <td align="center" class="graph" style="width:{5*$k}mm;border:solid 0.8pt #000000;">СП</td>
                                                      <td align="center" class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">Предыдущая сумма</td>
                                                      <td align="center" class="graph" style="width:{20*$k}mm;border:solid 0.8pt #000000;">Изменения</td>
                                                      <td align="center" class="graph" style="width:{37*$k}mm;border:solid 0.8pt #000000;">№ и дата платежн. пор.</td>
                                                   </tr>
                                                   <xsl:for-each select="KTSout_CU:KTSCustomsPaymentCalculation">
                                                      <tr>
                                                         <td class="graph" style="width:{10*$k}mm;border:solid 0.8pt #000000;">
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:value-of select="catESAD_cu:PaymentModeCode"/>
                                                         </td>
                                                         <td class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:if test="catESAD_cu:TaxBase">
                                                               <xsl:value-of select="catESAD_cu:TaxBase"/>
                                                            </xsl:if>
                                                         </td>
                                                         <td class="graph" style="width:{15*$k}mm;border:solid 0.8pt #000000;">
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:value-of select="catESAD_cu:Rate"/>
                                                         </td>
                                                         <td class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:value-of select="catESAD_cu:PaymentAmount"/>
                                                         </td>
                                                         <td class="graph" style="width:{5*$k}mm;border:solid 0.8pt #000000;">
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:value-of select="catESAD_cu:PaymentCode"/>
                                                         </td>
                                                         <td class="graph" style="width:{30*$k}mm;border:solid 0.8pt #000000;">
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:value-of select="catEKTS_cu:PrecedingPaymentAmount"/>
                                                         </td>
                                                         <td class="graph" style="width:{20*$k}mm;border:solid 0.8pt #000000;">
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:value-of select="catEKTS_cu:ChangeAmount"/>
                                                         </td>
                                                         <td class="graph" style="width:{37*$k}mm;border:solid 0.8pt #000000;">
                                                            <xsl:for-each select="catEKTS_cu:PaymentDocument">
                                                               <xsl:value-of select="cat_ru:PrDocumentName"/>
                                                               <xsl:text> </xsl:text>
                                                               <xsl:if test="cat_ru:PrDocumentNumber">№
																	<xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                                               </xsl:if>
                                                               <xsl:text> </xsl:text>
                                                               <xsl:if test="cat_ru:PrDocumentDate">от
																
                                                                  <!--	<xsl:value-of select="cat_ru:PrDocumentDate"/>-->
                                                                  <xsl:call-template name="russian_date">
                                                                     <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                                  </xsl:call-template>
                                                               </xsl:if>
                                                            </xsl:for-each>
                                                            <br/>
                                                         </td>
                                                      </tr>
                                                   </xsl:for-each>
                                                   <tr>
                                                      <td align="center" class="graph" colspan="5" style="width:{90*$k}mm;border-top:solid 0.8pt #000000;border-left:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
															Общая сумма, подлежащая взысканию (возврату), в нац. валюте
														</td>
                                                      <td class="graph" style="width:{30*$k}mm;border-bottom:solid 0.8pt #000000;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
                                                         <xsl:value-of select="catEKTS_cu:TotalCorrectedCost"/>
                                                      </td>
                                                      <td class="graph" style="width:{20*$k}mm;border:solid 0.8pt #000000;">
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </td>
                                                      <td class="graph" style="width:{37*$k}mm;border:solid 0.8pt #000000;">
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </td>
                                                   </tr>
                                                </tbody>
                                             </table>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </xsl:for-each>
                           </tbody>
                        </table>
                     </div>
                     <!--</xsl:for-each>
							</tbody>
									</table>
								</div>-->
                  </div>
               </xsl:for-each>
            </xsl:if>
            <xsl:if test="//KTSout_CU:GoodsAutomobile">
               <div class="page">
                  <xsl:apply-templates mode="automobile" select="//KTSout_CU:KTSoutGoodsItem"/>
               </div>
            </xsl:if>
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
      <xsl:if test="KTSout_CU:ContractorIndicator='1'"> 'контрагент'</xsl:if>
      <xsl:if test="KTSout_CU:ContractorIndicator='2'"> 'РАЗНЫЕ ПО СПИСКУ'</xsl:if>
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
      <xsl:if test="cat_ru:Contact/cat_ru:E_mail">
			, <xsl:value-of select="cat_ru:Contact/cat_ru:E_mail"/>
      </xsl:if>
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
      <xsl:if test="KTSout_CU:BranchDescription">
         <br/>
         <xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:OrganizationName"/>
         <br/>
         <xsl:if test="KTSout_CU:BranchDescription/cat_ru:Address/cat_ru:PostalCode">
            <xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:Address/cat_ru:PostalCode"/>,
			</xsl:if>
         <!--<xsl:apply-templates select="KTSout_CU:BranchDescription/cat_ru:Address/cat_ru:CountryCode | catESAD_cu:CountryCode"/>,-->
         <xsl:value-of select="KTSout_CU:BranchDescription/cat_ru:Address/cat_ru:CounryName"/> 
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
      </xsl:if>
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
   <xsl:template match="KTSout_CU:KTSoutGoodsItem" mode="automobile">
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
         <xsl:apply-templates select="KTSout_CU:GoodsAutomobile"/>
      </table>
   </xsl:template>
   <xsl:template match="KTSout_CU:GoodsAutomobile">
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
            <xsl:apply-templates select="cat_ru:VINID"/>
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
   <xsl:template match="KTSout_CU:KTSoutGoodsItem[1]" name="KTS1GoodsDescription">
      <div class="goods">
         <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
            <tbody>
               <tr>
                  <td class="graph" rowspan="4" style="width:{13*$k2}mm;border-right:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
                     <span class="graphNo">31</span>
                     <span class="graphColumn">Грузовые места и описание товаров</span>
                  </td>
                  <td class="graph" style="width:{98.8*$k2}mm;border-top:solid 0.8pt #000000;" valign="top">
                     <span class="graph">Маркировка и количество - Номера контейнеров - Количество и отличительные особенности</span>
                  </td>
                  <td class="graph" style="width:{11*$k2}mm;">
                     <table cellpadding="0" cellspacing="0" style="width:100%;">
                        <tbody>
                           <tr>
                              <td class="graph" colspan="2" style="width:{11*$k2}mm;border-top:solid 0.8pt #000000;border-left:solid 0.8pt #000000;">
                                 <span class="graphNo">32 </span>
                                 <span class="graph">Товар</span>
                              </td>
                           </tr>
                           <tr>
                              <td align="center" class="graph" style="width:{6.6*$k2}mm;border-left:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;border-right:solid 0.8pt #000000;">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_cu:GoodsNumeric!=''">
                                       <xsl:value-of select="catESAD_cu:GoodsNumeric"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td style="width:{4.4*$k2}mm;border-bottom:solid 0.8pt #000000;">
                                 <span class="graph">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															№
														</span>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </td>
                  <td class="graph" colspan="3" style="width:{67.2*$k2}mm;border:solid 0.8pt #000000;" valign="top">
                     <span class="graphNo">33 </span>
                     <span class="graph">Код товара</span>
                     <br/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <table border="1" style="border:0" width="100%">
                        <tbody>
                           <tr>
                              <td class="graph" style="border-top: 0; border-bottom:0; border-left:0; border-right:1pt solid black" valign="top" width="20%">
                                 <xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/>
                              </td>
                              <td class="graph" style="border:0; padding-left:5mm" valign="top" width="10%">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graph" style="border-top: 0; border-bottom:0; border-right:0; border-left: 1pt solid black; padding-left:5mm" valign="top">
                                 <xsl:value-of select="catESAD_cu:GoodsAddTNVEDCode"/>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </td>
               </tr>
               <tr>
                  <td class="graph" colspan="2" rowspan="3" style="width:{109.8*$k2}mm;border-bottom:solid 0.8pt #000000;" valign="top">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <span class="graph">1)</span>
                     <xsl:for-each select="catESAD_cu:GoodsDescription">
                        <xsl:value-of select="."/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
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
                        <xsl:if test="catESAD_cu:OilField"> Месторождения товара:
							<xsl:value-of select="catESAD_cu:OilField"/>
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
                           <xsl:if test="catEKTS_cu:ESADGoodsPackaging/catESAD_cu:PackingInformation">
                              <xsl:for-each select="catEKTS_cu:ESADGoodsPackaging/catESAD_cu:PackingInformation">
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
                     <xsl:if test="(catESAD_cu:DeliveryTime) or (catESAD_cu:DeliveryTimeEND)">
                        <br/>
                        <span class="graph">7) Поставка в течение</span>
                        <xsl:value-of select="catESAD_cu:DeliveryTime"/>
                        <xsl:if test="catESAD_cu:DeliveryTimeEND">
								- <xsl:value-of select="catESAD_cu:DeliveryTimeEND"/>
                        </xsl:if>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:QuantityFact">
                        <br/>
                        <span class="graph">8) </span>
                        <xsl:value-of select="catESAD_cu:QuantityFact"/>
                     </xsl:if>
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
						<xsl:for-each select="catEKTS_cu:SupplementaryQuantity">
                              <!-- меняла-->
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
                              <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                                Катег.прод.
                            </xsl:if>
                              <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="."/>
                              </xsl:for-each>
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
                  <td class="graph" style="width:{25*$k2}mm;border:solid 0.8pt #000000;" valign="top">
                     <!--<span class="graphNo">34 </span>
											<span class="graph">Код страны происх.</span>
											<br/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:value-of select="catESAD_cu:OriginCountryCode"/>-->
                     <table width="100%">
                        <tbody>
                           <tr>
                              <td class="graph" colspan="3" style="width:{25*$k2}mm;border-top: 0; border-bottom:0; border-left:0;" valign="top">
                                 <span class="graphNo">34 </span>
                                 <span class="graph">Код страны <br/> происх.</span>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:{5*$k2}mm;border-top: 0; border-bottom:0; border-left:0;">a</td>
                              <td class="graph" style="width:{10*$k2}mm;border-top: 0; border-bottom:0; border-left:0;border-right:solid 1pt #000000;">
                                 <xsl:value-of select="catESAD_cu:OriginCountryCode"/>
                              </td>
                              <td class="graph" style="width:{10*$k2}mm;border-top: 0; border-bottom:0; border-left:0;">b</td>
                           </tr>
                        </tbody>
                     </table>
                  </td>
                  <td class="graph" style="width:{42.2*$k2}mm;border:solid 0.8pt #000000;" valign="top">
                     <span class="graphNo">35 </span>
                     <span class="graph">Вес брутто (кг)</span>
                     <br/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="catESAD_cu:GrossWeightQuantity"/>
                  </td>
               </tr>
               <tr>
                  <td class="graph" style="width:{25*$k2}mm; border:solid 0.8pt #000000;" valign="top">
                     <span class="graphNo">37</span>
                     <span class="graph">ПРОЦЕДУРА</span>
                     <br/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <table border="1" style="border:0" width="100%">
                        <tbody>
                           <tr>
                              <td class="graph" style="border-top: 0; border-bottom:0; border-left:0; border-right:1pt solid black" valign="top" width="20%">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <!--Теперь не заполняем-->
                                 <xsl:value-of select="KTSout_CU:CustomsProcedure/catESAD_cu:MainCustomsModeCode"/>
                                 <xsl:value-of select="KTSout_CU:CustomsProcedure/catESAD_cu:PrecedingCustomsModeCode"/>
                              </td>
                              <td class="graph" style="border:0; padding-left:5mm" valign="top">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="KTSout_CU:CustomsProcedure/catESAD_cu:GoodsTransferFeature"/>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </td>
                  <td class="graph" style="width:{42.2*$k2}mm;border:solid 0.8pt #000000;" valign="top">
                     <span class="graphNo">38 </span>
                     <span class="graph">Вес нетто (кг)</span>
                     <br/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
                  </td>
               </tr>
               <tr>
                  <td class="graph" colspan="3" style="width:{67.2*$k2}mm;border:solid 0.8pt #000000;">
                     <!--<span class="graphNo">40 </span>
											<span class="graph">Общая декларация/предшествующий документ</span>
											<br/>-->
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
               </tr>
               <tr>
                  <td class="graph" rowspan="3" style="width:{13*$k2}mm;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;" valign="top">
                     <span class="graphNo">44</span>
                     <span class="graphColumn">Дополнит. информация/ Представ. документы/</span>
                  </td>
                  <td class="graph" colspan="2" rowspan="3" style="width:{109.8*$k2}mm;border-bottom:solid 0.8pt #000000;border-top:solid 0.8pt #000000;" valign="top">
                     <xsl:if test="KTSout_CU:KTSoutPresentedDocuments">
                        <xsl:for-each select="KTSout_CU:KTSoutPresentedDocuments">
                           <xsl:value-of select="catESAD_cu:PresentedDocumentModeCode"/>
                           <xsl:if test="catESAD_cu:ProvidingIndicationMark">
							   <xsl:text>/</xsl:text><xsl:value-of select="catESAD_cu:ProvidingIndicationMark"/>
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
                           <xsl:if test="KTSout_CU:RegNumberDocument and catESAD_cu:ProvidingIndicationMark='2'">
							    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="KTSout_CU:RegNumberDocument"/>
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
                              <!--меняла -->
                              <!--xsl:text> Срок временного ввоза </xsl:text-->
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
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
                     </xsl:if>
                  </td>
                  <td class="graph" colspan="3" style="width:{67.2*$k2}mm;">
                     <table cellpadding="0" cellspacing="0" style="width:100%;">
                        <tbody>
                           <tr>
                              <td class="graph" style="width:{25*$k2}mm;border:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">41 </span>
                                 <span class="graph">Дополнит.единицы</span>
                                 <br/>
                                 <xsl:choose>
                                    <xsl:when test="catEKTS_cu:SupplementaryQuantity">
                                       <xsl:value-of select="catEKTS_cu:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="catEKTS_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
                                    </xsl:when>
                                 </xsl:choose>
                              </td>
                              <td class="graph" style="width:{30*$k2}mm;border:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">42 </span>
                                 <span class="graph">Цена товара</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="catESAD_cu:InvoicedCost"/>
                              </td>
                              <td class="graph" style="width:{12.2*$k2}mm;border:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">43 </span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="catESAD_cu:CustomsCostCorrectMethod"/>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </td>
               </tr>
               <tr valign="top">
                  <td class="graph" colspan="3" style="width:{67.2*$k2}mm;border:solid 0.8pt #000000;">
                     <table cellpadding="0" cellspacing="0" style="width:100%;">
                        <tbody>
                           <tr>
                              <td class="graph" colspan="2" style="width:{67.2*$k2}mm;">
                                 <span class="graphNo">45 </span>
                                 <span class="graph">Таможенная стоимость</span>
                              </td>
                           </tr>
                           <tr>
                              <td align="center" class="graph" style="width:{37.2*$k2}mm;border-right:solid 0.8pt #000000;">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_cu:CustomsCost">
                                       <xsl:value-of select="catESAD_cu:CustomsCost"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center" class="graph" style="width:{30*$k2}mm;">
                                 <xsl:value-of select="catEKTS_cu:PreviousCustomsCost"/>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </td>
               </tr>
               <tr>
                  <td class="graph" colspan="3" style="width:{67.2*$k2}mm;">
                     <table cellpadding="0" cellspacing="0" style="width:100%;">
                        <tbody>
                           <tr>
                              <td class="graph" style="width:{27.2*$k2}mm;border:solid 0.8pt #000000;">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graph" style="width:{40*$k2}mm;border:solid 0.8pt #000000;">
                                 <span class="graphNo">46 </span>
                                 <span class="graph">Статистическая стоимость</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="catESAD_cu:StatisticalCost"/>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </td>
               </tr>
               <tr valign="top">
                  <td class="graph" rowspan="4" style="width:{13*$k2}mm;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;" valign="top">
                     <span class="graphNo">47</span>
                     <span class="graphColumn">Исчисление платежей</span>
                  </td>
                  <td class="graph" colspan="5" style="width:{177*$k2}mm;">
                     <table cellpadding="0" cellspacing="0" style="width:100%;">
                        <tbody>
                           <tr>
                              <td align="center" class="graph" style="width:{10*$k2}mm;border:solid 0.8pt #000000;">Вид</td>
                              <td align="center" class="graph" style="width:{30*$k2}mm;border:solid 0.8pt #000000;">Основа начисления</td>
                              <td align="center" class="graph" style="width:{15*$k2}mm;border:solid 0.8pt #000000;">Ставка</td>
                              <td align="center" class="graph" style="width:{30*$k2}mm;border:solid 0.8pt #000000;">Сумма</td>
                              <td align="center" class="graph" style="width:{5*$k2}mm;border:solid 0.8pt #000000;">СП</td>
                              <td align="center" class="graph" style="width:{30*$k2}mm;border:solid 0.8pt #000000;">Предыдущая сумма</td>
                              <td align="center" class="graph" style="width:{20*$k2}mm;border:solid 0.8pt #000000;">Изменения</td>
                              <td align="center" class="graph" style="width:{37*$k2}mm;border:solid 0.8pt #000000;">№ и дата платежн. пор.</td>
                           </tr>
                           <xsl:for-each select="KTSout_CU:KTSCustomsPaymentCalculation">
                              <tr>
                                 <td class="graph" style="width:{10*$k2}mm;border:solid 0.8pt #000000;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="catESAD_cu:PaymentModeCode"/>
                                 </td>
                                 <td class="graph" style="width:{30*$k2}mm;border:solid 0.8pt #000000;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="catESAD_cu:TaxBase">
                                       <xsl:value-of select="catESAD_cu:TaxBase"/>
                                    </xsl:if>
                                 </td>
                                 <td class="graph" style="width:{15*$k2}mm;border:solid 0.8pt #000000;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="catESAD_cu:Rate"/>
                                 </td>
                                 <td class="graph" style="width:{30*$k2}mm;border:solid 0.8pt #000000;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="catESAD_cu:PaymentAmount"/>
                                 </td>
                                 <td class="graph" style="width:{5*$k2}mm;border:solid 0.8pt #000000;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="catESAD_cu:PaymentCode"/>
                                 </td>
                                 <td class="graph" style="width:{30*$k2}mm;border:solid 0.8pt #000000;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="catEKTS_cu:PrecedingPaymentAmount"/>
                                 </td>
                                 <td class="graph" style="width:{20*$k2}mm;border:solid 0.8pt #000000;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="catEKTS_cu:ChangeAmount"/>
                                 </td>
                                 <td class="graph" style="width:{37*$k2}mm;border:solid 0.8pt #000000;">
                                    <xsl:for-each select="catEKTS_cu:PaymentDocument">
                                       <xsl:value-of select="cat_ru:PrDocumentName"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:if test="cat_ru:PrDocumentNumber">№
																	<xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                       </xsl:if>
                                       <xsl:text> </xsl:text>
                                       <xsl:if test="cat_ru:PrDocumentDate">от
																
                                          <!--	<xsl:value-of select="cat_ru:PrDocumentDate"/>-->
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                    </xsl:for-each>
                                    <br/>
                                 </td>
                              </tr>
                           </xsl:for-each>
                           <tr>
                              <td align="center" class="graph" colspan="5" style="width:{90*$k2}mm;border-top:solid 0.8pt #000000;border-left:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
															Общая сумма, подлежащая взысканию (возврату), в нац. валюте
														</td>
                              <td class="graph" style="width:{30*$k2}mm;border-bottom:solid 0.8pt #000000;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
                                 <xsl:value-of select="catEKTS_cu:TotalCorrectedCost"/>
                              </td>
                              <td class="graph" style="width:{20*$k2}mm;border:solid 0.8pt #000000;">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graph" style="width:{37*$k2}mm;border:solid 0.8pt #000000;">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </td>
               </tr>
            </tbody>
         </table>
      </div>
   </xsl:template>
</xsl:stylesheet>
