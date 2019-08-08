<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:est="urn:customs.ru:Information:CustomsDocuments:ExplanationSalesTerms:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template name="russian_time">
      <xsl:param name="timeIn"/>
      <xsl:choose>
         <xsl:when test="substring($timeIn,3,1)=':' and substring($timeIn,6,1)=':'">
            <xsl:value-of select="substring($timeIn,1,2)"/> час. <xsl:value-of select="substring($timeIn,4,2)"/> мин.
			</xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$timeIn"/>
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
   <xsl:template match="est:ExplanationSalesTerms">
      <html>
         <head>
            <title>Пояснения по условиям продажи, которые могли повлиять на цену сделки.</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.normal2{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;border-left:  medium none; border-right:  medium none; border-top:  medium none; border-bottom: 1pt solid windowtext; 
						font-weight: normal;
						}
						.normalMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph10Bold {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}			
					</style>
         </head>
         <body>
            <div class="page">
               <table border="0" cellpadding="0" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" class="bold" colspan="2" style="width:190mm">
								ПОЯСНЕНИЯ<br/> по условиям продажи, которые могли повлиять на цену сделки
								</td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td class="graphMain" style="width:20mm">История сотрудни- <br/> чества Продавца и Покупателя</td>
                        <td>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:136mm">1. Имеются ли у Покупателя (см. графу 1 ДТС-1) перед Продавцом (см. графу 2 ДТС-1) дополнительные (отличные от получения товара и уплаты установленной цены сделки) обязательства</td>
                                    <td align="center" class="graphMain" colspan="2">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:HistoryCooperation/est:AdditionalContract= 'true' or est:HistoryCooperation/est:AdditionalContract= 't' or est:HistoryCooperation/est:AdditionalContract= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:HistoryCooperation/est:AdditionalContract= 'false' or est:HistoryCooperation/est:AdditionalContract= 'f' or est:HistoryCooperation/est:AdditionalContract= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:136mm">2. Осуществлялось ли ранее сотрудничество между продавцом и покупателем? В случае ответа НЕТ далее к графе 5</td>
                                    <td align="center" class="graphMain" colspan="2">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:HistoryCooperation/est:CooperationEarly= 'true' or est:HistoryCooperation/est:CooperationEarly= 't' or est:HistoryCooperation/est:CooperationEarly= '1'">
                                                   <td align="left" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:HistoryCooperation/est:CooperationEarly= 'false'  or est:HistoryCooperation/est:CooperationEarly= 'f' or est:HistoryCooperation/est:CooperationEarly= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="4" style="width:170mm">3. Вид сотрудничества</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:125mm">(а) поставки от Продавца Покупателю идентичных товаров</td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:KindCooperation/est:IdenticalGoods/est:Value= 'true' or est:HistoryCooperation/est:KindCooperation/est:IdenticalGoods/est:Value= 't' or est:HistoryCooperation/est:KindCooperation/est:IdenticalGoods/est:Value= '1'">
                                          <td align="left" class="normal2" style="width:5mm"> X</td>
                                          <td align="center" class="graphMain" style="width:28mm">период времени</td>
                                          <td align="center" class="graphMain" style="width:18mm">
                                             <xsl:value-of select="est:HistoryCooperation/est:KindCooperation/est:IdenticalGoods/est:PeriodTime"/>
                                          </td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graphMain" style="width:28mm">период времени</td>
                                          <td align="center" class="graphMain" style="width:18mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:125mm">(б) товаров того же класса или вида </td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:KindCooperation/est:IdemSort/est:Value= 'true' or est:HistoryCooperation/est:KindCooperation/est:IdemSort/est:Value= 't' or est:HistoryCooperation/est:KindCooperation/est:IdemSort/est:Value= '1'">
                                          <td align="left" class="normal2" style="width:5mm"> X</td>
                                          <td align="center" class="graphMain" style="width:28mm">период времени</td>
                                          <td align="center" class="graphMain" style="width:18mm">
                                             <xsl:value-of select="est:HistoryCooperation/est:KindCooperation/est:IdemSort/est:PeriodTime"/>
                                          </td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graphMain" style="width:28mm">период времени</td>
                                          <td align="center" class="graphMain" style="width:18mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:125mm">(в) товаров другого класса или вида </td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:KindCooperation/est:OtherSort/est:Value= 'true' or est:HistoryCooperation/est:KindCooperation/est:OtherSort/est:Value= 't' or est:HistoryCooperation/est:KindCooperation/est:OtherSort/est:Value= '1'">
                                          <td align="left" class="normal2" style="width:5mm"> X</td>
                                          <td align="center" class="graphMain" style="width:28mm">период времени</td>
                                          <td align="center" class="graphMain" style="width:18mm">
                                             <xsl:value-of select="est:HistoryCooperation/est:KindCooperation/est:OtherSort/est:PeriodTime"/>
                                          </td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graphMain" style="width:28mm">период времени</td>
                                          <td align="center" class="graphMain" style="width:18mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:125mm">(г) оказание услуг </td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:KindCooperation/est:RenderingService/est:Value= 'true' or est:HistoryCooperation/est:KindCooperation/est:RenderingService/est:Value= 't' or est:HistoryCooperation/est:KindCooperation/est:RenderingService/est:Value= '1'">
                                          <td align="left" class="normal2" style="width:5mm"> X</td>
                                          <td align="center" class="graphMain" style="width:28mm">период времени</td>
                                          <td align="center" class="graphMain" style="width:18mm">
                                             <xsl:value-of select="est:HistoryCooperation/est:KindCooperation/est:RenderingService/est:PeriodTime"/>
                                          </td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graphMain" style="width:28mm">период времени</td>
                                          <td align="center" class="graphMain" style="width:18mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:125mm">(д) поставки товаров от Покупателя Продавцу </td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:KindCooperation/est:DeliveryGoodsBuyerSeller/est:Value= 'true' or est:HistoryCooperation/est:KindCooperation/est:DeliveryGoodsBuyerSeller/est:Value= 't' or est:HistoryCooperation/est:KindCooperation/est:DeliveryGoodsBuyerSeller/est:Value= '1'">
                                          <td align="left" class="normal2" style="width:5mm"> X</td>
                                          <td align="center" class="graphMain" style="width:28mm">период времени</td>
                                          <td align="center" class="graphMain" style="width:18mm">
                                             <xsl:value-of select="est:HistoryCooperation/est:KindCooperation/est:DeliveryGoodsBuyerSeller/est:PeriodTime"/>
                                          </td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graphMain" style="width:28mm">период времени</td>
                                          <td align="center" class="graphMain" style="width:18mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:125mm">(е) иное сотрудничество (ниже указать вид) </td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:KindCooperation/est:DifferentCooperation/est:Value= 'true' or est:HistoryCooperation/est:KindCooperation/est:DifferentCooperation/est:Value= 't' or est:HistoryCooperation/est:KindCooperation/est:DifferentCooperation/est:Value= '1'">
                                          <td align="left" class="normal2" style="width:5mm"> X</td>
                                          <td align="center" class="graphMain" style="width:28mm">период времени</td>
                                          <td align="center" class="graphMain" style="width:18mm">
                                             <xsl:value-of select="est:HistoryCooperation/est:KindCooperation/est:DifferentCooperation/est:PeriodTime"/>
                                          </td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graphMain" style="width:28mm">период времени</td>
                                          <td align="center" class="graphMain" style="width:18mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:136mm">4. Покупатель и продавец являются постоянными партнерами?</td>
                                    <td align="center" class="graphMain" colspan="2">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:HistoryCooperation/est:ConstantPartner= 'true' or est:HistoryCooperation/est:ConstantPartner= 't' or est:HistoryCooperation/est:ConstantPartner= '1'">
                                                   <td align="left" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:HistoryCooperation/est:ConstantPartner= 'false' or est:HistoryCooperation/est:ConstantPartner= 'f' or est:HistoryCooperation/est:ConstantPartner= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:136mm">5. Согласен ли продавец предоставить данные о затратах на производство (приобретение) товаров и (или) затратах на их продажу на экспорт в Российскую Федерацию <br/> Если ДА, укажите какие именно<br/>
                                       <xsl:if test="est:HistoryCooperation/est:PutInformationCost= 'true' or est:HistoryCooperation/est:PutInformationCost= 't' or est:HistoryCooperation/est:PutInformationCost= '1'">
                                          <xsl:value-of select="est:HistoryCooperation/est:CommentsPutInformationCos"/>
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graphMain" colspan="2">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:HistoryCooperation/est:PutInformationCost= 'true' or est:HistoryCooperation/est:PutInformationCost= 't' or est:HistoryCooperation/est:PutInformationCost= '1'">
                                                   <td align="left" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:HistoryCooperation/est:PutInformationCost= 'false' or est:HistoryCooperation/est:PutInformationCost= 'f' or est:HistoryCooperation/est:PutInformationCost= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">6. Поиск продавца для покупки данного товара или ранее до начала сотрудничества осуществлялся:</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm"> при участии посредника </td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:SearchSeller/est:Middleman = 'true' or est:HistoryCooperation/est:SearchSeller/est:Middleman = 't' or est:HistoryCooperation/est:SearchSeller/est:Middleman = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm"> по рекламным объявлениям </td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:SearchSeller/est:Commercial = 'true' or est:HistoryCooperation/est:SearchSeller/est:Commercial = 't' or est:HistoryCooperation/est:SearchSeller/est:Commercial = '1'">
                                          <td class="normal2" style="width:5mm">X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm"> на бирже</td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:SearchSeller/est:Exchange = 'true' or est:HistoryCooperation/est:SearchSeller/est:Exchange = 't' or est:HistoryCooperation/est:SearchSeller/est:Exchange = '1'">
                                          <td class="normal2" style="width:5mm">X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm"> иным образом (указать способ)<xsl:text> </xsl:text>
                                       <xsl:if test="est:HistoryCooperation/est:SearchSeller/est:Otherwise = 'true' or est:HistoryCooperation/est:SearchSeller/est:Otherwise = 't' or est:HistoryCooperation/est:SearchSeller/est:Otherwise = '1'">
                                          <xsl:value-of select="est:HistoryCooperation/est:SearchSeller/est:CommentsOtherwise"/>
                                       </xsl:if>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:SearchSeller/est:Otherwise = 'true' or est:HistoryCooperation/est:SearchSeller/est:Otherwise = 't' or est:HistoryCooperation/est:SearchSeller/est:Otherwise = '1'">
                                          <td class="normal2" style="width:5mm">X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">7. Был выбран именно этот продавец, поскольку:</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">(а) Продавец является производителем товаров</td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:ChoiceSeller/est:Producer='true' or est:HistoryCooperation/est:ChoiceSeller/est:Producer='t' or est:HistoryCooperation/est:ChoiceSeller/est:Producer='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">(б) Продавец является официальным представителем производителя</td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:ChoiceSeller/est:OfficialRepresentativeProducer='true' or est:HistoryCooperation/est:ChoiceSeller/est:OfficialRepresentativeProducer='t' or est:HistoryCooperation/est:ChoiceSeller/est:OfficialRepresentativeProducer='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">(в) Продавец предоставляет гарантийное обслуживание товаров</td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:ChoiceSeller/est:Guarantee='true' or est:HistoryCooperation/est:ChoiceSeller/est:Guarantee='t' or est:HistoryCooperation/est:ChoiceSeller/est:Guarantee='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">(г) были предложены более выгодные условия покупки товаров, сравнительно с другими участниками рынка (указать подробности)
													<xsl:if test="est:HistoryCooperation/est:ChoiceSeller/est:ProfitableTerm = 'true' or est:HistoryCooperation/est:ChoiceSeller/est:ProfitableTerm = 't' or est:HistoryCooperation/est:ChoiceSeller/est:ProfitableTerm = '1'">
                                          <xsl:value-of select="est:HistoryCooperation/est:ChoiceSeller/est:CommentsProfitableTerm"/>
                                       </xsl:if>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:ChoiceSeller/est:ProfitableTerm='true' or est:HistoryCooperation/est:ChoiceSeller/est:ProfitableTerm='t' or est:HistoryCooperation/est:ChoiceSeller/est:ProfitableTerm='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">Иные причины (указать)
													<xsl:if test="est:HistoryCooperation/est:ChoiceSeller/est:Otherwise='true' or est:HistoryCooperation/est:ChoiceSeller/est:Otherwise='t' or est:HistoryCooperation/est:ChoiceSeller/est:Otherwise='1'">
                                          <xsl:value-of select="est:HistoryCooperation/est:ChoiceSeller/est:OtherwiseComments"/>
                                       </xsl:if>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="est:HistoryCooperation/est:ChoiceSeller/est:Otherwise='true' or est:HistoryCooperation/est:ChoiceSeller/est:Otherwise='1' or est:HistoryCooperation/est:ChoiceSeller/est:Otherwise='t'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:30mm"> Выбор и заказ товара</td>
                        <td>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">8. Имеется ли у Покупателя подразделение, занимающееся изучением<br/> 
								конъюнктуры рынка и(или) оценкой эффективности сделок?</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:ChoiceOrderGoods/est:DepartmentAnalysis='true' or est:ChoiceOrderGoods/est:DepartmentAnalysis='t' or est:ChoiceOrderGoods/est:DepartmentAnalysis='1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:ChoiceOrderGoods/est:DepartmentAnalysis='false' or est:ChoiceOrderGoods/est:DepartmentAnalysis='f' or est:ChoiceOrderGoods/est:DepartmentAnalysis='0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">9. Анализировало ли это подразделение предложения других Продавцов,<br/> 
								занимающихся поставками товара того же класса или вида</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:ChoiceOrderGoods/est:Analysis='true' or est:ChoiceOrderGoods/est:Analysis='t' or est:ChoiceOrderGoods/est:Analysis='1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:ChoiceOrderGoods/est:Analysis='false' or est:ChoiceOrderGoods/est:Analysis='f' or est:ChoiceOrderGoods/est:Analysis='0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">Если ДА, то можете ли Вы предоставить материалы их исследований</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:ChoiceOrderGoods/est:Study='true' or est:ChoiceOrderGoods/est:Study='t' or est:ChoiceOrderGoods/est:Study='1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:ChoiceOrderGoods/est:Study='false' or est:ChoiceOrderGoods/est:Study='f' or est:ChoiceOrderGoods/est:Study='0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="1" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">10. Выбор товара осуществлялся</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">по образцам
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:ChoiceGood/est:Sample='true' or est:ChoiceOrderGoods/est:ChoiceGood/est:Sample='t' or est:ChoiceOrderGoods/est:ChoiceGood/est:Sample='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">по описанию
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:ChoiceGood/est:Description='true' or est:ChoiceOrderGoods/est:ChoiceGood/est:Description='1' or est:ChoiceOrderGoods/est:ChoiceGood/est:Description='t'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">в соответствии с действующими стандартами (указать стандарт, кем принят, регламентирующие его соблюдение документы)
													<xsl:if test="est:ChoiceOrderGoods/est:ChoiceGood/est:Standard='true' or est:ChoiceOrderGoods/est:ChoiceGood/est:Standard='t' or est:ChoiceOrderGoods/est:ChoiceGood/est:Standard='1'">
                                          <xsl:value-of select="est:ChoiceOrderGoods/est:ChoiceGood/est:CommentsStandard"/>
                                       </xsl:if>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:ChoiceGood/est:Standard='true' or est:ChoiceOrderGoods/est:ChoiceGood/est:Standard='t' or est:ChoiceOrderGoods/est:ChoiceGood/est:Standard='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">иным образом (указать способ)
													<xsl:if test="est:ChoiceOrderGoods/est:ChoiceGood/est:Otherwise='true' or est:ChoiceOrderGoods/est:ChoiceGood/est:Otherwise='t' or est:ChoiceOrderGoods/est:ChoiceGood/est:Otherwise='1'">
                                          <xsl:value-of select="est:ChoiceOrderGoods/est:ChoiceGood/est:OtherwiseComments"/>
                                       </xsl:if>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:ChoiceGood/est:Otherwise='true' or est:ChoiceOrderGoods/est:ChoiceGood/est:Otherwise='t' or est:ChoiceOrderGoods/est:ChoiceGood/est:Otherwise='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">11. Как осуществлялся заказ товара</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">товар произведен специально для Покупателя и не является серийным
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:OrderGoods/est:Specially='true' or est:ChoiceOrderGoods/est:OrderGoods/est:Specially='t' or est:ChoiceOrderGoods/est:OrderGoods/est:Specially='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">товар серийного производства произведен по предварительному заказу Покупателя
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:OrderGoods/est:Serially='true' or est:ChoiceOrderGoods/est:OrderGoods/est:Serially='t' or est:ChoiceOrderGoods/est:OrderGoods/est:Serially='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">товар поставляется по отдельным заказам со склада
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:OrderGoods/est:SupplyStore='true' or est:ChoiceOrderGoods/est:OrderGoods/est:SupplyStore='1' or est:ChoiceOrderGoods/est:OrderGoods/est:SupplyStore='t'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">Если ДА, указать собственника склада либо, соответственно, лицо, заключавшее договор на хранение на складе (например, производитель, продавец, отправитель) <span class="normal">
                                          <xsl:value-of select="est:ChoiceOrderGoods/est:OrderGoods/est:SupplyStoreComments "/>
                                       </span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" style="width:170mm">товар поставляется по предварительно согласованному графику</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:OrderGoods/est:Time-table='true' or  est:ChoiceOrderGoods/est:OrderGoods/est:Time-table='t' or est:ChoiceOrderGoods/est:OrderGoods/est:Time-table='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:170mm">товар поставляется с выставки, витрины, после испытаний</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:OrderGoods/est:Exhibition='true' or est:ChoiceOrderGoods/est:OrderGoods/est:Exhibition='t' or est:ChoiceOrderGoods/est:OrderGoods/est:Exhibition='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:170mm">товар, бывший в употреблении, поставляется от бывшего владельца</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:OrderGoods/est:Second-hand='true' or est:ChoiceOrderGoods/est:OrderGoods/est:Second-hand='t' or est:ChoiceOrderGoods/est:OrderGoods/est:Second-hand='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="normalMain" style="width:75mm">12. В рамках контракта поставляются товары:</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:DeliveryGoodsUnderContract='true' or est:ChoiceOrderGoods/est:DeliveryGoodsUnderContract='t' or est:ChoiceOrderGoods/est:DeliveryGoodsUnderContract='1'">
                                          <td class="normal2" style="width:3mm"> X</td>
                                          <td class="normalMain" style="width:50mm">одного класса или вида </td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:3mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="normalMain" style="width:50mm">одного класса или вида </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:75mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:DeliveryGoodsUnderContract='false'  or est:ChoiceOrderGoods/est:DeliveryGoodsUnderContract='f' or est:ChoiceOrderGoods/est:DeliveryGoodsUnderContract='0'">
                                          <td class="normal2" style="width:3mm"> X</td>
                                          <td class="graphMain" style="width:50mm">различного класса или вида </td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:3mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graphMain" style="width:50mm">различного класса или вида </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="1" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">13. Поставляемый товар:</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">(а) подготовлен для розничной продажи
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:DeliveryGoods/est:Retail='true' or est:ChoiceOrderGoods/est:DeliveryGoods/est:Retail='t' or est:ChoiceOrderGoods/est:DeliveryGoods/est:Retail='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">(б) требует упаковки, сортировки перед розничной продажей
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:DeliveryGoods/est:PackingSorting='true' or est:ChoiceOrderGoods/est:DeliveryGoods/est:PackingSorting='t' or est:ChoiceOrderGoods/est:DeliveryGoods/est:PackingSorting='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">(в) предназначен для использования в производстве в качестве сырья или сопутствующих товаров
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:DeliveryGoods/est:ProductionRawMaterial='true' or est:ChoiceOrderGoods/est:DeliveryGoods/est:ProductionRawMaterial='t' or est:ChoiceOrderGoods/est:DeliveryGoods/est:ProductionRawMaterial='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">(г) будет использован в качестве средства производства
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:DeliveryGoods/est:MeansProduction='true' or est:ChoiceOrderGoods/est:DeliveryGoods/est:MeansProduction='t' or est:ChoiceOrderGoods/est:DeliveryGoods/est:MeansProduction='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">(д) предназначен для собственного потребления
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:ChoiceOrderGoods/est:DeliveryGoods/est:OwnConsumption='true' or est:ChoiceOrderGoods/est:DeliveryGoods/est:OwnConsumption='t' or est:ChoiceOrderGoods/est:DeliveryGoods/est:OwnConsumption='1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:30mm"> Форми- <br/>рование цены сделки </td>
                        <td>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">14. Имеется ли у Покупателя информация об уровне рыночных цен на такого вида товары</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:PriceLeve= 'true' or est:PricingTransactions/est:PriceLeve= 't' or est:PricingTransactions/est:PriceLeve= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:PriceLeve = 'false' or est:PricingTransactions/est:PriceLeve= 'f' or est:PricingTransactions/est:PriceLeve= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">15. Корреспондирует ли первоначальная цена предложения такому уровню цен</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:InitialOfferPriceAppropriateLevel= 'true' or est:PricingTransactions/est:InitialOfferPriceAppropriateLevel= 't' or est:PricingTransactions/est:InitialOfferPriceAppropriateLevel= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:InitialOfferPriceAppropriateLevel = 'false' or est:PricingTransactions/est:InitialOfferPriceAppropriateLevel = 'f' or est:PricingTransactions/est:InitialOfferPriceAppropriateLevel = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">Укажите процент отклонения 
												<span class="normal">
                                          <xsl:value-of select="est:PricingTransactions/est:PercentageDeviation"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">16. Совпадает ли цена сделки с первоначальной ценой предложения?<br/>
												Если НЕТ, заполнить графы 17-25</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:SalePriceInitialOfferPrice= 'true' or est:PricingTransactions/est:SalePriceInitialOfferPrice= 't' or est:PricingTransactions/est:SalePriceInitialOfferPrice= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:SalePriceInitialOfferPrice = 'false' or est:PricingTransactions/est:SalePriceInitialOfferPrice = 'f' or est:PricingTransactions/est:SalePriceInitialOfferPrice = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">17. Какой процент отличия от первоначальной цены?
												<span class="normal">
                                          <xsl:value-of select="est:PricingTransactions/est:PercentageDifferences"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">18. Отличие вызвано скидкой
												</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">на количество товаров</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:Discount/est:QuantityGoods= 'true' or est:PricingTransactions/est:Discount/est:QuantityGoods= 't' or est:PricingTransactions/est:Discount/est:QuantityGoods= '1' ">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:Discount/est:QuantityGoods = 'false' or est:PricingTransactions/est:Discount/est:QuantityGoods= 'f' or est:PricingTransactions/est:Discount/est:QuantityGoods= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">на условия оплаты</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:Discount/est:RepaymentTerms= 'true' or est:PricingTransactions/est:Discount/est:RepaymentTerms= 't' or est:PricingTransactions/est:Discount/est:RepaymentTerms= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:Discount/est:RepaymentTerms = 'false' or est:PricingTransactions/est:Discount/est:RepaymentTerms= 'f' or est:PricingTransactions/est:Discount/est:RepaymentTerms= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">сезонные</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:Discount/est:Seasonal= 'true' or est:PricingTransactions/est:Discount/est:Seasonal= 't' or est:PricingTransactions/est:Discount/est:Seasonal= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:Discount/est:Seasonal = 'false' or est:PricingTransactions/est:Discount/est:Seasonal= 'f' or est:PricingTransactions/est:Discount/est:Seasonal= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">иные (указать)
												<xsl:if test="est:PricingTransactions/est:Discount/est:Other= 'true' or est:PricingTransactions/est:Discount/est:Other= 't' or est:PricingTransactions/est:Discount/est:Other= '1'">
                                          <xsl:value-of select="est:PricingTransactions/est:Discount/est:Comments"/>
                                       </xsl:if>
                                    </td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:Discount/est:Other= 'true' or est:PricingTransactions/est:Discount/est:Other= 't' or est:PricingTransactions/est:Discount/est:Other= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:Discount/est:Other = 'false' or est:PricingTransactions/est:Discount/est:Other= 'f' or est:PricingTransactions/est:Discount/est:Other= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:90mm">19. Отличие вызвано нестандартной ситуацией </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">резкое падение курса национальной валюты
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:NonStandardSituationMarket/est:DopRate = 'true' or est:PricingTransactions/est:NonStandardSituationMarket/est:DopRate = 't' or est:PricingTransactions/est:NonStandardSituationMarket/est:DopRate = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">резкое повышение курса национальной валюты
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:NonStandardSituationMarket/est:IncreaseRate = 'true' or est:PricingTransactions/est:NonStandardSituationMarket/est:IncreaseRate = 't' or est:PricingTransactions/est:NonStandardSituationMarket/est:IncreaseRate = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">затоваривание рынка
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:NonStandardSituationMarket/est:GlutMarket = 'true' or est:PricingTransactions/est:NonStandardSituationMarket/est:GlutMarket = '1' or est:PricingTransactions/est:NonStandardSituationMarket/est:GlutMarket = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">дефицит на рывке
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:NonStandardSituationMarket/est:DeficitMarket = 'true' or est:PricingTransactions/est:NonStandardSituationMarket/est:DeficitMarket = 't' or est:PricingTransactions/est:NonStandardSituationMarket/est:DeficitMarket = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">иное (указать подробности)
												<xsl:if test="est:PricingTransactions/est:NonStandardSituationMarket/est:Other = 'true' or est:PricingTransactions/est:NonStandardSituationMarket/est:Other = 't' or est:PricingTransactions/est:NonStandardSituationMarket/est:Other = '1'">
                                          <xsl:value-of select="est:PricingTransactions/est:NonStandardSituationMarket/est:Comments"/>
                                       </xsl:if>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:NonStandardSituationMarket/est:Other = 'true' or est:PricingTransactions/est:NonStandardSituationMarket/est:Other = 't' or est:PricingTransactions/est:NonStandardSituationMarket/est:Other = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:90mm">20. Отличие вызвано положением Продавца </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">необходимы наличные средств
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:PositionSeller/est:FundsAvailable = 'true' or est:PricingTransactions/est:PositionSeller/est:FundsAvailable = 't' or est:PricingTransactions/est:PositionSeller/est:FundsAvailable = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">затоваривание склада
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:PositionSeller/est:GlutWarehouse = 'true' or est:PricingTransactions/est:PositionSeller/est:GlutWarehouse = 't' or est:PricingTransactions/est:PositionSeller/est:GlutWarehouse = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">банкроство
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:PositionSeller/est:Bankruptcy = 'true'  or est:PricingTransactions/est:PositionSeller/est:Bankruptcy = 't' or est:PricingTransactions/est:PositionSeller/est:Bankruptcy = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">иное (указать подробности)
												<xsl:if test="est:PricingTransactions/est:PositionSeller/est:Other = 'true'">
                                          <xsl:value-of select="est:PricingTransactions/est:PositionSeller/est:Comments or est:PricingTransactions/est:PositionSeller/est:Comments = 't' or est:PricingTransactions/est:PositionSeller/est:Comments = '1'"/>
                                       </xsl:if>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:PositionSeller/est:Other = 'true' or est:PricingTransactions/est:PositionSeller/est:Other = 't' or est:PricingTransactions/est:PositionSeller/est:Other = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">21. Отличие вызвано особыми отношениями Продавца и Покупателя: </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">длительная история сотрудничества</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:SpecialRelationship/est:Cooperation= 'true' or est:PricingTransactions/est:SpecialRelationship/est:Cooperation = 't' or est:PricingTransactions/est:SpecialRelationship/est:Cooperation = '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:SpecialRelationship/est:Cooperation = 'false' or est:PricingTransactions/est:SpecialRelationship/est:Cooperation = 'f' or est:PricingTransactions/est:SpecialRelationship/est:Cooperation = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">Покупатель предоставляет продавцу предоплату</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:SpecialRelationship/est:Prepayment= 'true' or est:PricingTransactions/est:SpecialRelationship/est:Prepayment= 't' or est:PricingTransactions/est:SpecialRelationship/est:Prepayment= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:SpecialRelationship/est:Prepayment = 'false' or est:PricingTransactions/est:SpecialRelationship/est:Prepayment= 'f' or est:PricingTransactions/est:SpecialRelationship/est:Prepayment= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">Покупатель принимает дополнительные обязательства по объему продажи товара</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:SpecialRelationship/est:ExtraDuty= 'true' or est:PricingTransactions/est:SpecialRelationship/est:ExtraDuty= 't' or est:PricingTransactions/est:SpecialRelationship/est:ExtraDuty= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:SpecialRelationship/est:ExtraDuty = 'false' or est:PricingTransactions/est:SpecialRelationship/est:ExtraDuty= 'f' or est:PricingTransactions/est:SpecialRelationship/est:ExtraDuty= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">иное (указать подробности)
												<xsl:if test="est:PricingTransactions/est:SpecialRelationship/est:Other = 'true' or est:PricingTransactions/est:SpecialRelationship/est:Other = 't' or est:PricingTransactions/est:SpecialRelationship/est:Other = '1'">
                                          <xsl:value-of select="est:PricingTransactions/est:SpecialRelationship/est:Comments"/>
                                       </xsl:if>
                                    </td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:SpecialRelationship/est:Other= 'true' or est:PricingTransactions/est:SpecialRelationship/est:Other= 't' or est:PricingTransactions/est:SpecialRelationship/est:Other= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:SpecialRelationship/est:Other = 'false' or est:PricingTransactions/est:SpecialRelationship/est:Other = 'f' or est:PricingTransactions/est:SpecialRelationship/est:Other = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">22. Другие причины отличия (указать подробности)
												<xsl:if test="est:PricingTransactions/est:OtherReasonsDifferences = 'true' or est:PricingTransactions/est:OtherReasonsDifferences = 't' or est:PricingTransactions/est:OtherReasonsDifferences = '1'">
                                          <xsl:value-of select="est:PricingTransactions/est:CommentsOtherReasonsDifferences"/>
                                       </xsl:if>
                                    </td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:OtherReasonsDifferences= 'true'  or est:PricingTransactions/est:OtherReasonsDifferences = 't' or est:PricingTransactions/est:OtherReasonsDifferences = '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:OtherReasonsDifferences = 'false'  or est:PricingTransactions/est:OtherReasonsDifferences = 'f' or est:PricingTransactions/est:OtherReasonsDifferences = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">23. Согласование цены сделки проходило</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">путем личных переговоров представителей продавца и покупателя (укажите где и кто участвовал)
												<xsl:if test="est:PricingTransactions/est:AlignmentPrices/est:NegotiationsCorrespondence = 'true' or est:PricingTransactions/est:AlignmentPrices/est:NegotiationsCorrespondence = 't' or est:PricingTransactions/est:AlignmentPrices/est:NegotiationsCorrespondence = '1'">
                                          <xsl:value-of select="est:PricingTransactions/est:AlignmentPrices/est:NegotiationsComments"/>
                                       </xsl:if>
                                    </td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:AlignmentPrices/est:NegotiationsCorrespondence= 'true'  or est:PricingTransactions/est:AlignmentPrices/est:NegotiationsCorrespondence = 't' or est:PricingTransactions/est:AlignmentPrices/est:NegotiationsCorrespondence = '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:AlignmentPrices/est:NegotiationsCorrespondence = 'false'  or est:PricingTransactions/est:AlignmentPrices/est:NegotiationsCorrespondence = 'f' or est:PricingTransactions/est:AlignmentPrices/est:NegotiationsCorrespondence = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">по переписке
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:AlignmentPrices/est:Correspondence= 'true' or est:PricingTransactions/est:AlignmentPrices/est:Correspondence= 't' or est:PricingTransactions/est:AlignmentPrices/est:Correspondence= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:AlignmentPrices/est:Correspondence = 'false' or est:PricingTransactions/est:AlignmentPrices/est:Correspondence= 'f' or est:PricingTransactions/est:AlignmentPrices/est:Correspondence= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">путем личных переговоров представителей продавца и покупателя и по переписке
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:AlignmentPrices/est:Negotiations= 'true' or est:PricingTransactions/est:AlignmentPrices/est:Negotiations= 't' or est:PricingTransactions/est:AlignmentPrices/est:Negotiations= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:AlignmentPrices/est:Negotiations = 'false' or est:PricingTransactions/est:AlignmentPrices/est:Negotiations= 'f' or est:PricingTransactions/est:AlignmentPrices/est:Negotiations= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">24. Сохранилась ли у Покупателя переписка?
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:KeepCorrespondence= 'true' or est:PricingTransactions/est:KeepCorrespondence= 't' or est:PricingTransactions/est:KeepCorrespondence= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:KeepCorrespondence = 'false' or est:PricingTransactions/est:KeepCorrespondence= 'f' or est:PricingTransactions/est:KeepCorrespondence= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">25. Может ли она быть представлена таможенным органам?<br/>Если НЕТ, обьясните причины
												<xsl:if test="est:PricingTransactions/est:GrantCorrespondence = 'false' or est:PricingTransactions/est:GrantCorrespondence = 'f' or est:PricingTransactions/est:GrantCorrespondence = '0'">
                                          <xsl:value-of select="est:PricingTransactions/est:ReasonGrantCorrespondence"/>
                                       </xsl:if>
                                    </td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:GrantCorrespondence= 'true'  or est:PricingTransactions/est:GrantCorrespondence = 't' or est:PricingTransactions/est:GrantCorrespondence = '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:GrantCorrespondence = 'false' or est:PricingTransactions/est:GrantCorrespondence = 'f' or est:PricingTransactions/est:GrantCorrespondence = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">26. Являлась ли первоначальная цена предложения публичной офертой (в терминах ст. 494 Гражданского кодекса Российской Федерации)?<br/>Если ДА, заполнить графу 25
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:PubliclyOffer= 'true' or est:PricingTransactions/est:PubliclyOffer= 't' or est:PricingTransactions/est:PubliclyOffer= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:PubliclyOffer = 'false' or est:PricingTransactions/est:PubliclyOffer= 'f' or est:PricingTransactions/est:PubliclyOffer= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">27. Каким образом была выражена публичная оферта Продавца?</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">в прайс-листе в офисе продавца (указать фактический адрес<br/>
                                       <xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList = 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList = '1'">
                                          <span class="normal">
                                             <xsl:value-of select="est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceListAddressOffice "/>
                                          </span>
                                       </xsl:if>
                                       <xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList = 'false' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList = 'f' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList = '0'">
                                          <span class="normal">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                          </span>
                                       </xsl:if> )											
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList= 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList= 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList  = 'false'  or est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList= 'f' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">в открытом источнике печати (указать каком, где и когда издан<br/>
                                       <xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = '1'">
                                          <span class="normal">
                                             <xsl:value-of select="est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrintingComments "/>
                                          </span>
                                       </xsl:if>
                                       <xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = 'false'  or est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = 'f' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = '0'">
                                          <span class="normal">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                          </span>
                                       </xsl:if> )											
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting= 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting  = 'false' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting  = 'f' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting  = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">в других средствах массовой информации (указать, в каких и когда) <br/>
                                       <xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = '1'">
                                          <span class="normal">
                                             <xsl:value-of select="est:PricingTransactions/est:ExpressPubliclyOffer/est:MediaComments "/>
                                          </span>
                                       </xsl:if>
                                       <xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = 'false' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = 'f' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = '0'">
                                          <span class="normal">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                          </span>
                                       </xsl:if>
                                    </td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Media= 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Media  = 'false' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = 'f' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm"> на открытом сайте Продавца в Интернете (указать адрес <br/>
                                       <xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = '1'">
                                          <span class="normal">
                                             <xsl:value-of select="est:PricingTransactions/est:ExpressPubliclyOffer/est:SiteAddress "/>
                                          </span>
                                       </xsl:if>
                                       <xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = 'false'  or est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = 'f' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = '0'">
                                          <span class="normal">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                          </span>
                                       </xsl:if> ) 											
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Site= 'true'  or est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Site  = 'false'  or est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = 'f' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm"> иным образом (указать подробности) <br/>
                                       <xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise = 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise = '1'">
                                          <span class="normal">
                                             <xsl:value-of select="est:PricingTransactions/est:ExpressPubliclyOffer/est:OtherwiseComments "/>
                                          </span>
                                       </xsl:if>
                                       <xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise = 'false'">
                                          <span class="normal">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                          </span>
                                       </xsl:if>
                                    </td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise= 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise = '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise  = 'false' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise = 'f' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="1" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">28. Известно ли покупателю, исходя из какой величины формировалась цена перноначального предложения</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">биржевая цена
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:ValueFormingPrice/est:ExchangePrice = 'true' or est:PricingTransactions/est:ValueFormingPrice/est:ExchangePrice = 't' or est:PricingTransactions/est:ValueFormingPrice/est:ExchangePrice = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">цена на товары того же класса или вида других предложений при продаже товаров на экспорт из страны производства
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:ValueFormingPrice/est:PriceOtherProposals = 'true' or est:PricingTransactions/est:ValueFormingPrice/est:PriceOtherProposals = 't' or est:PricingTransactions/est:ValueFormingPrice/est:PriceOtherProposals = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">исходя из цен на товары того же класса или вида у других Продавцов при продаже товаров на экспорт из страны отправления
													</td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:ValueFormingPrice/est:PriceOtherVendors = 'true' or est:PricingTransactions/est:ValueFormingPrice/est:PriceOtherVendors = 't' or est:PricingTransactions/est:ValueFormingPrice/est:PriceOtherVendors = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">исходя из себестоимости производства
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:ValueFormingPrice/est:CostPrice = 'true' or est:PricingTransactions/est:ValueFormingPrice/est:CostPrice = 't' or est:PricingTransactions/est:ValueFormingPrice/est:CostPrice = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">исходя из цены возможной реализации на внутреннем рынке Российской Федерации
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:ValueFormingPrice/est:SalesDomesticMarket = 'true' or est:PricingTransactions/est:ValueFormingPrice/est:SalesDomesticMarket = 't' or est:PricingTransactions/est:ValueFormingPrice/est:SalesDomesticMarket = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">не известно
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:PricingTransactions/est:ValueFormingPrice/est:NotKnown = 'true' or est:PricingTransactions/est:ValueFormingPrice/est:NotKnown = 't' or est:PricingTransactions/est:ValueFormingPrice/est:NotKnown = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:30mm">Сведения о договоре и условиях поставки </td>
                        <td>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" style="width:50mm"> 29. Вид договора</td>
                                    <td align="center" class="graphMain" style="width:35mm">купля-продажа
												
													<xsl:choose>
                                          <xsl:when test="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale">
                                             <span align="right" class="normal2" style="width:5mm"> X</span>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <span class="normal2" style="width:5mm">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </span>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                       <!--xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale">
													<span style="width:5mm" align="right" class="normal2"> X</span>
													
													</xsl:if-->
                                    </td>
                                    <td align="center" class="graphMain" style="width:20mm">бартер
												<xsl:choose>
                                          <xsl:when test="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange!=''">
                                             <span align="right" class="normal2" style="width:5mm"> X</span>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <span class="normal2" style="width:5mm">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </span>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td class="graphMain" style="width:30mm">лизинговое соглашение
												<xsl:choose>
                                          <xsl:when test="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement!=''">
                                             <span align="right" class="normal2" style="width:5mm"> X</span>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <span class="normal2" style="width:5mm">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </span>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td align="center" class="graphMain" style="width:35mm">иной (указать вид)
												<xsl:choose>
                                          <xsl:when test="est:InfoContractDeliveryTerms/est:KindContract/est:Other!=''">
                                             <xsl:value-of select="est:InfoContractDeliveryTerms/est:KindContract/est:Other/est:OtherComments"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:50mm"> день заключения</td>
                                    <td class="graphMain" colspan="2" style="width:55mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale/est:DateSettlement"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange/est:DateSettlement"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                    </td>
                                    <td class="graphMain" colspan="2">
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement/est:DateSettlement"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Other">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:Other/est:DateSettlement"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:50mm">день окончания действия (если определено договором) </td>
                                    <td class="graphMain" colspan="2" style="width:55mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale/est:ExpiryDate"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange/est:ExpiryDate"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                       <br/>
                                    </td>
                                    <td class="graphMain" colspan="2">
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement/est:DateSettlement"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Other">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:Other/est:ExpiryDate"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:50mm">применяемое право (если определено договором)  </td>
                                    <td class="graphMain" colspan="2" style="width:55mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale/est:ApplicableLaw"/>
                                       </xsl:if>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange/est:ApplicableLaw"/>
                                       </xsl:if>
                                       <br/>
                                    </td>
                                    <td class="graphMain" colspan="2">
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement/est:ApplicableLaw"/>
                                       </xsl:if>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Other">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:KindContract/est:Other/est:ApplicableLaw"/>
                                       </xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:50mm">место заключения </td>
                                    <td class="graphMain" colspan="2" style="width:55mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale/est:PlaceDetention"/>
                                       </xsl:if>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange/est:PlaceDetention"/>
                                       </xsl:if>
                                       <br/>
                                    </td>
                                    <td class="graphMain" colspan="2">
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement/est:PlaceDetention"/>
                                       </xsl:if>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Other">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:KindContract/est:Other/est:PlaceDetention"/>
                                       </xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:50mm"> 30.Какой по счету является партия товара, ввозимого по рассматриваемому контракту </td>
                                    <td align="center" class="graphMain" style="width:35mm">единственной
												
															<xsl:choose>
                                          <xsl:when test="est:InfoContractDeliveryTerms/est:Account/est:Type= '0'">
                                             <span align="right" class="normal2" style="width:5mm"> X</span>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <span class="normal2" style="width:5mm">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </span>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td align="center" class="graphMain" style="width:20mm">первой
												<xsl:choose>
                                          <xsl:when test="est:InfoContractDeliveryTerms/est:Account/est:Type= '1'">
                                             <span align="right" class="normal2" style="width:5mm"> X</span>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <span class="normal2" style="width:5mm">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </span>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td class="graphMain" style="width:30mm">последней
												<xsl:choose>
                                          <xsl:when test="est:InfoContractDeliveryTerms/est:Account/est:Type= '2'">
                                             <span align="right" class="normal2" style="width:5mm"> X</span>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <span class="normal2" style="width:5mm">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </span>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td align="center" class="graphMain" style="width:35mm">иной (указать)<br/>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:Account/est:Other">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:Account/est:Other"/>
                                       </xsl:if>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="1" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">31. Договор предусматривает:</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">(а) условие, при котором продажа одного наименования товара зависит от покупки товара другого наименования
												
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:Vaule= 'true' or est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:Vaule= 't' or est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:Vaule= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:Vaule  = 'false' or est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:Vaule  = 'f' or est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:Vaule  = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">(б) встречную поставку товаров покупателем продавцу
												
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:Vaule= 'true' or est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:Vaule= 't' or est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:Vaule= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:Vaule  = 'false' or est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:Vaule  = 'f' or est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:Vaule  = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">(в) поставку товаров со стороны Покупателя в пользу Продавца бесплатно или по сниженной цене
												
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:Vaule= 'true' or est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:Vaule= 't' or est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:Vaule= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:Vaule  = 'false'  or est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:Vaule= 'f' or est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:Vaule= '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">В случае ответа ДА хотя бы на один из подпунктов (а)-(в) указать подробности<br/>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:Vaule= 'true'  or est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:Vaule= 't' or est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:Vaule= '1'">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:AnswerYES"/>
                                          <xsl:text> </xsl:text>
                                       </xsl:if>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:Vaule= 'true' or est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:Vaule= 't' or est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:Vaule= '1'">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:AnswerYES"/>
                                          <xsl:text> </xsl:text>
                                       </xsl:if>
                                       <xsl:if test="est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:Vaule = 'true' or est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:Vaule = 't' or est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:Vaule = '1'">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:AnswerYES"/>
                                          <xsl:text> </xsl:text>
                                       </xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">32. Кем были предложены предусмотренные контрактом условия поставки
												
												</td>
                                    <td>
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:TermsDelivery/est:Seller= 'true' or est:InfoContractDeliveryTerms/est:TermsDelivery/est:Seller= 't' or est:InfoContractDeliveryTerms/est:TermsDelivery/est:Seller= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="graphMain" style="width:10mm">продавец</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:TermsDelivery/est:Buyer  = 'true' or est:InfoContractDeliveryTerms/est:TermsDelivery/est:Buyer  = 'f' or est:InfoContractDeliveryTerms/est:TermsDelivery/est:Buyer  = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="graphMain" style="width:10mm">покупатель</td>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">33. Кто осуществлял выбор вида транспорта и маршрута доставки
												
												</td>
                                    <td>
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:TransportRouteDelivery/est:Seller= 'true' or est:InfoContractDeliveryTerms/est:TransportRouteDelivery/est:Seller= 't' or est:InfoContractDeliveryTerms/est:TransportRouteDelivery/est:Seller= '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="graphMain" style="width:10mm">продавец</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:TransportRouteDelivery/est:Buyer  = 'true' or est:InfoContractDeliveryTerms/est:TransportRouteDelivery/est:Buyer  = 't' or est:InfoContractDeliveryTerms/est:TransportRouteDelivery/est:Buyer  = '1'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="graphMain" style="width:10mm">покупатель</td>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="1" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">34. Заключается ли договор транспортного страхования в отношении товаров, поставляемых по контракту</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">нет
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:TransportInsurance/est:Not = 'true' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:Not = 't' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:Not = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">да, с ответственностью за все риски
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:TransportInsurance/est:Risk = 'true' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:Risk = '1' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:Risk = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">да, с ответственностью за частую аварию
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:TransportInsurance/est:SimpleAverage = 'true' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:SimpleAverage = '1' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:SimpleAverage = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">да, без ответственностью за повреждения, кроме случаев крушения
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:TransportInsurance/est:Damage = 'true' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:Damage = '1' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:Damage = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">да, на следующих условиях (указать подробности)
												<xsl:if test="est:InfoContractDeliveryTerms/est:TransportInsurance/est:OtherTerms = 'true' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:OtherTerms = '1' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:OtherTerms = 't'">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:TransportInsurance/est:DescriptionOtherTerms"/>
                                       </xsl:if>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:TransportInsurance/est:OtherTerms = 'true' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:OtherTerms = '1' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:OtherTerms = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="1" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">35.Стоимость доставки до места назначения<br/>включена в цену сделки<br/> Если нет, то переход к графе 39
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:CostDeliveryIncludedPriceTransactions= 'true' or est:InfoContractDeliveryTerms/est:CostDeliveryIncludedPriceTransactions= '1' or est:InfoContractDeliveryTerms/est:CostDeliveryIncludedPriceTransactions= 't'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:CostDeliveryIncludedPriceTransactions = 'false' or est:InfoContractDeliveryTerms/est:CostDeliveryIncludedPriceTransactions = '0' or est:InfoContractDeliveryTerms/est:CostDeliveryIncludedPriceTransactions = 'f'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">36. Стоимость доставки оговаривалась при<br/>согласовании цены сделки
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:CostDeliverySpecified= 'true' or est:InfoContractDeliveryTerms/est:CostDeliverySpecified= '1' or est:InfoContractDeliveryTerms/est:CostDeliverySpecified= 't'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:CostDeliverySpecified = 'false' or est:InfoContractDeliveryTerms/est:CostDeliverySpecified = '0' or est:InfoContractDeliveryTerms/est:CostDeliverySpecified = 'f'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">37. Покупатель изучал конъюнктуру рынка услуг по<br/>доставке товара из страны отправления до <br/>места назначения
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:Delivery= 'true' or est:InfoContractDeliveryTerms/est:Delivery= 'true' or est:InfoContractDeliveryTerms/est:Delivery= 't' or est:InfoContractDeliveryTerms/est:Delivery= 't'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:Delivery = 'false'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="1" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="3" style="width:170mm">38. Покупателю</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:80mm">известна точная стоимость доставки
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Value = 'true' or est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Value = 't' or est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Value = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:text> </xsl:text>
                                    <td class="graphMain" style="width:85mm"> укажите ее величину <span class="normal">
                                          <xsl:if test="est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Value = 'true' or est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Value = 't' or est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Value = '1'">
                                             <xsl:value-of select="est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Quantity"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Currency"/>
                                          </xsl:if>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:80mm">известна примерная стоимость доставки
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Value = 'true' or est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Value = '1' or est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Value = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:text> </xsl:text>
                                    <td class="graphMain" style="width:85mm"> укажите ее примерную величину <span class="normal">
                                          <xsl:if test="est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Value = 'true' or est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Value = '1' or est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Value = 't'">
                                             <xsl:value-of select="est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Quantity"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Currency"/>
                                          </xsl:if>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:80mm">не известна стоимость доставки
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:CostDelivery/est:NotKnown/est:Value = 'true' or est:InfoContractDeliveryTerms/est:CostDelivery/est:NotKnown/est:Value = '1' or est:InfoContractDeliveryTerms/est:CostDelivery/est:NotKnown/est:Value = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:text> </xsl:text>
                                    <td class="graphMain" style="width:85mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">39. Какую часть цены сделки составляет стоимость доставки</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">менее 3%
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:Less3percent = 'true' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:Less3percent = 't' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:Less3percent = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">примерно от 3% до 5%
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About3_5percent = 'true' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About3_5percent = 't' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About3_5percent = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">примерно от 5% до 10%
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About5_10percent = 'true' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About5_10percent = 't' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About5_10percent = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">примерно от 10% до 20%
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About10_20percent = 'true' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About10_20percent = '1' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About10_20percent = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">примерно от 20% до 30%
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About20_30percent = 'true' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About20_30percent = 't' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About20_30percent = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">примерно от 30% до 50%
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About30_50percent = 'true' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About30_50percent = '1' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About30_50percent = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">примерно от 50% до 70%
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About50_70percent = 'true' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About50_70percent = '1' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About50_70percent = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">примерно от 70% до 90%
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About70_90percent = 'true' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About70_90percent = '1' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About70_90percent = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">более 90%
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:More90percent = 'true' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:More90percent = '1' or est:InfoContractDeliveryTerms/est:PercentageDelivery/est:More90percent = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="1" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">40. Соответствует ли стоимость доставки оцениваемых товаров обычному уровню цен, сложившихся на рынке транспортных услуг в отношении товаров того же класса или вида
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:ConformityCostDeliveryNormaPriceLevel= 'true' or est:InfoContractDeliveryTerms/est:ConformityCostDeliveryNormaPriceLevel= '1' or est:InfoContractDeliveryTerms/est:ConformityCostDeliveryNormaPriceLevel= 't'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:InfoContractDeliveryTerms/est:ConformityCostDeliveryNormaPriceLevel = 'false' or est:InfoContractDeliveryTerms/est:ConformityCostDeliveryNormaPriceLevel = '0' or est:InfoContractDeliveryTerms/est:ConformityCostDeliveryNormaPriceLevel = 'f'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">41. Когда осуществляется переход риска утраты/порчи товара на покупателя</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">на складе отправителя
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Warehouse = 'true' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Warehouse = '0' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Warehouse = 'f'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">после передачи лицу,осуществляющему доставку товаров
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Disposition = 'true' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Disposition = '1' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Disposition = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">в процессе доставки (указать подробности)
												<xsl:if test="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:ProcessDelivery = 'true' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:ProcessDelivery = '1' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:ProcessDelivery = 't'">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:CommentsProcessDelivery"/>
                                       </xsl:if>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:ProcessDelivery = 'true' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:ProcessDelivery = '1' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:ProcessDelivery = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">в месте доставки (указать адрес)
												<xsl:if test="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:PlaceDelivery = 'true' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:PlaceDelivery = '1' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:PlaceDelivery = 't'">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:PostalCode"/>
                                          <xsl:text>, </xsl:text>
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:CountryCode"/>
                                          <xsl:text>, </xsl:text>
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:CounryName"/>
                                          <xsl:text>,</xsl:text>
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:Region"/>
                                          <xsl:text>, </xsl:text>
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:City"/>
                                          <xsl:text>, </xsl:text>
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:StreetHouse"/>
                                       </xsl:if>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:PlaceDelivery = 'true' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:PlaceDelivery = '1' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:PlaceDelivery = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">в ином месте (указать адрес)
												<xsl:if test="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:OtherPlace = 'true' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:OtherPlace = '1' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:OtherPlace = 't'">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:PostalCode"/>
                                          <xsl:text>, </xsl:text>
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:CountryCode"/>
                                          <xsl:text>, </xsl:text>
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:CounryName"/>
                                          <xsl:text>,</xsl:text>
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:Region"/>
                                          <xsl:text>, </xsl:text>
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:City"/>
                                          <xsl:text>, </xsl:text>
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:StreetHouse"/>
                                       </xsl:if>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:OtherPlace = 'true' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:OtherPlace = '1' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:OtherPlace = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">42. Когда осуществляется переход права собственности от Продавца к Покупателю</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">на день отгрузки
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:Property/est:DayShipping = 'true' or est:InfoContractDeliveryTerms/est:Property/est:DayShipping = '1' or est:InfoContractDeliveryTerms/est:Property/est:DayShipping = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">на день оплаты
													
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:Property/est:DayPayment = 'true' or  est:InfoContractDeliveryTerms/est:Property/est:DayPayment = 't' or est:InfoContractDeliveryTerms/est:Property/est:DayPayment = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">иной день (указать подробности)
											<xsl:if test="est:InfoContractDeliveryTerms/est:Property/est:OtherDay = 'true' or est:InfoContractDeliveryTerms/est:Property/est:OtherDay = '1' or est:InfoContractDeliveryTerms/est:Property/est:OtherDay = 't'">
                                          <xsl:value-of select="est:InfoContractDeliveryTerms/est:Property/est:CommentsOtherDay"/>
                                       </xsl:if>
                                    </td>
                                    <xsl:choose>
                                       <xsl:when test="est:InfoContractDeliveryTerms/est:Property/est:OtherDay = 'true' or est:InfoContractDeliveryTerms/est:Property/est:OtherDay = '1' or est:InfoContractDeliveryTerms/est:Property/est:OtherDay = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:30mm">Реализация товаров на внутреннем рынке </td>
                        <td>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">43. Покупатель товаров:</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">(а) реализует товары на внутреннем рынке Российской Федерации через собственную розничную сеть
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:SaleGoodsDomesticMarket/est:BuyerGoods/est:OwnRetailNetwork = 'true' or est:SaleGoodsDomesticMarket/est:BuyerGoods/est:OwnRetailNetwork = 't' or est:SaleGoodsDomesticMarket/est:BuyerGoods/est:OwnRetailNetwork = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">(б) продает (планирует продать) товары одному - трем лицам
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:SaleGoodsDomesticMarket/est:BuyerGoods/est:SellOne_ThreePersons = 'true' or est:SaleGoodsDomesticMarket/est:BuyerGoods/est:SellOne_ThreePersons = 't' or est:SaleGoodsDomesticMarket/est:BuyerGoods/est:SellOne_ThreePersons = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">(в) продает (планирует продать) товары разным лицам
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:SaleGoodsDomesticMarket/est:BuyerGoods/est:SellDifferentPersons = 'true' or est:SaleGoodsDomesticMarket/est:BuyerGoods/est:SellDifferentPersons = '1' or est:SaleGoodsDomesticMarket/est:BuyerGoods/est:SellDifferentPersons = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">(г) использует товары для собственного потребления или в собственной производственной деятельности (в этом случае переходите а графе 46)
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:SaleGoodsDomesticMarket/est:BuyerGoods/est:OwnUse = 'true' or est:SaleGoodsDomesticMarket/est:BuyerGoods/est:OwnUse = '1' or est:SaleGoodsDomesticMarket/est:BuyerGoods/est:OwnUse = 't'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">44. Цена реализации товара конечному потребителю на внутреннем рынке известна
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:SaleGoodsDomesticMarket/est:FinalSellingPrice= 'true' or est:SaleGoodsDomesticMarket/est:FinalSellingPrice= '1' or est:SaleGoodsDomesticMarket/est:FinalSellingPrice= 't'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:SaleGoodsDomesticMarket/est:FinalSellingPrice = 'false' or est:SaleGoodsDomesticMarket/est:FinalSellingPrice = '0' or est:SaleGoodsDomesticMarket/est:FinalSellingPrice = 'f'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" style="width:122mm">45. Укажите цену реализации единицы товара на внутреннем рынке (в т.ч. планируемую) </td>
                                    <td class="graphMain" style="width:48mm">
                                       <xsl:value-of select="est:SaleGoodsDomesticMarket/est:UnitSellingPriceGoods"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:122mm">46. Укажите общий размер расходов Покупателя при реализации товаров на внутреннем рынке, которые должны быть включены в цену реализации для их покрытия   </td>
                                    <td class="graphMain" style="width:48mm">
                                       <xsl:value-of select="est:SaleGoodsDomesticMarket/est:Cost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:122mm">47. Укажите процент планируемой рентабельности сделки </td>
                                    <td class="graphMain" style="width:48mm">
                                       <xsl:value-of select="est:SaleGoodsDomesticMarket/est:Profitability"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="0" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" style="width:136mm">48. Известна ли Покупателю рыночная цена в Российской Федерации товаров того же класса или вида при продаже их конечному потребителю? - Если ДА, указать величину в графе 49
												</td>
                                    <td class="graphMain">
                                       <table border="0" cellspacing="0" style="width:47mm">
                                          <tbody>
                                             <td align="center" class="normalMain" style="width:10mm">Да</td>
                                             <xsl:choose>
                                                <xsl:when test="est:SaleGoodsDomesticMarket/est:MarketPrice/est:Value= 'true' or est:SaleGoodsDomesticMarket/est:MarketPrice/est:Value= '1' or est:SaleGoodsDomesticMarket/est:MarketPrice/est:Value= 't'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                             <td align="center" class="normalMain" style="width:10mm">Нет</td>
                                             <xsl:choose>
                                                <xsl:when test="est:SaleGoodsDomesticMarket/est:MarketPrice/est:Value = 'false' or est:SaleGoodsDomesticMarket/est:MarketPrice/est:Value = 'f' or est:SaleGoodsDomesticMarket/est:MarketPrice/est:Value = '0'">
                                                   <td align="right" class="normal2" style="width:2mm"> X</td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <td class="normal2" style="width:2mm">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">49. Укажите величину
												<xsl:if test="est:SaleGoodsDomesticMarket/est:MarketPrice/est:Value = 'false' or est:SaleGoodsDomesticMarket/est:MarketPrice/est:Value = 'f' or est:SaleGoodsDomesticMarket/est:MarketPrice/est:Value = '0'">
                                          <xsl:value-of select="est:SaleGoodsDomesticMarket/est:MarketPrice/est:ValueMarketPrice "/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="est:SaleGoodsDomesticMarket/est:MarketPrice/est:CurrencyMarketPrice "/>
                                       </xsl:if>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table border="1" cellspacing="0" style="width:170mm">
                              <tbody>
                                 <tr>
                                    <td class="graphMain" colspan="2" style="width:170mm">50. Цена товара на внутреннем рынке Российской Федерации превышает заявленную таможенную стоимость, увеличенную на размер таможенных платежей</td>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">менее чем на 30%
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:Less30percent = 'true' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:Less30percent = 't' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:Less30percent = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">примерно от 30% до 50%
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About30_50percent = 'true' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About30_50percent = 't' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About30_50percent = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">примерно от 50% до 100%
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About50_100percent = 'true' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About50_100percent = 't' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About50_100percent = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">примерно в 3 раза
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About3Times = 'true' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About3Times = 't' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About3Times = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">примерно в 5 раза
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About5Times = 'true' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About5Times = 't' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About5Times = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">примерно в 10 раза
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About10Times = 'true' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About10Times = 't' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About10Times = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">от 10 до 100 раз
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:Times10_100 = 'true' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:Times10_100 = 't' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:Times10_100 = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                                 <tr>
                                    <td class="graphMain" style="width:165mm">более чем в 100 раз
												</td>
                                    <xsl:choose>
                                       <xsl:when test="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:More100Times = 'true' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:More100Times = 't' or est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:More100Times = '1'">
                                          <td class="normal2" style="width:5mm"> X</td>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <td class="normal2" style="width:5mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <table border="0" cellspacing="0" style="width:190mm">
                           <tbody>
                              <td align="left" class="graphMain" style="width:95mm">Дополнительные данные <span class="normal">
                                    <xsl:value-of select="est:Comments"/>
                                 </span>
                              </td>
                              <td align="right" class="graphMain" style="width:95mm">Подпись <span class="normal">
                                    <xsl:value-of select="est:PersonSignature/cat_ru:PersonSurname"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="est:PersonSignature/cat_ru:PersonName"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="est:PersonSignature/cat_ru:PersonMiddleName"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:if test="est:PersonSignature/cat_ru:PersonPost">/
										<xsl:value-of select="est:PersonSignature/cat_ru:PersonPost"/>/ </xsl:if>
                                    <xsl:if test="est:PersonSignature/cat_ru:IssueDate">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="est:PersonSignature/cat_ru:IssueDate"/>
                                       </xsl:call-template>
                                    </xsl:if>
                                 </span>
                              </td>
                           </tbody>
                        </table>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
