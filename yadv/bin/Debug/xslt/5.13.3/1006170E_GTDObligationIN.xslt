<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gobin="urn:customs.ru:Information:CustomsDocuments:GTDObligationIN:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <!--приказ ФТС 842-->
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
   <xsl:template match="gobin:GTDObligationIN">
      <html>
         <head>
            <title>Обязательство о подаче таможенной декларации и представлении необходимых документов и сведений</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					.subscription td {
						font-family:Arial;
						font-size: 7pt;
						border: 0;
					}
					
					.common {
						font-family:Arial;
						font-size: 7pt;
					}
				
					body {
						text-align: center;
							background: #cccccc;
							}
					div.page {
						width: 210mm;
						/*height: 297mm;*/
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding:	10mm;
						padding-left:	10mm;
						background: #ffffff;
						border: solid .5pt #000000;
					}
					
					div.album_page {
						width: 297mm;
						height: 210mm;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding: 5mm;
						padding-left: 5mm;
						background: #ffffff;
						border: solid .5pt #000000;
					}
											
						td {
							font-family:Courier New;
						}
						
						.normal{
							pdding-top: -20mm;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							
						
							
							.bold2{
							font-weight: bold;
							font-family:Arial;
							font-size: 9pt; 
							}
							.normal2{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt;
							}
							.bold1{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: 1pt solid windowtext; 
							}
							.bold3{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: medium none; 
							}
							.bold4{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: medium none; border-bottom: medium none; 
							}
							.bold5{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.bold6{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: medium nonet; border-top:  1pt solid windowtext; border-bottom: medium none; 
							}
							.bold7{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium nonet; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: medium nonet; 
							}
							.bold8{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium nonet; border-right: 1pt solid windowtext; border-top: medium nonet; border-bottom: medium nonet; 
							}
							.bold9{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium nonet; border-right: medium nonet; border-top: medium nonet; border-bottom: 1pt solid windowtext; 
							}
							.bold10{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: 1pt solid windowtext; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.bold11{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium nonet; border-right: medium nonet; border-top: 1pt solid windowtext; border-bottom: medium nonet; 
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
							font-family: Arial;
							font-size: 10pt;
							border: solid 1pt #000000;
							empty-cells: show;
						}			
					</style>
         </head>
         <body>
            <div class="page">
               <xsl:apply-templates select="gobin:ObligationRegNumber"/>
               <h2>ОБЯЗАТЕЛЬСТВО</h2>
               <div style="margin-top:-5mm">о подаче таможенной декларации и представлении необходимых документов и сведений в</div>
               <div align="center">
                  <table>
                     <tbody>
                        <tr>
                           <td align="center" class="normal">
                              <xsl:value-of select="gobin:CustomsName"/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graphLittle">(наименование таможенного органа)</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <xsl:apply-templates select="gobin:ObligationDeclarant"/>
               <div style="text-align:left; font-family: Arial; font-size: 10pt;">
						просит осуществить выпуск товаров, указанных в документах, приложенных к данному Обязательству, до подачи таможенной декларации
					</div>
               <xsl:call-template name="docs"/>
               <div style="text-align:left; font-family: Arial; font-size: 10pt;">
						и <span style="font-weight:bold;">ОБЯЗУЕТСЯ</span> подать таможенную декларацию 
						и представить необходимые документы и сведения в установленный таможенным органом срок.
					</div>
               <xsl:apply-templates select="gobin:InfoCustomsPay"/>
               <xsl:call-template name="OtImeny_MPDeclaranta"/>
               <span class="graphLittle" style="text-align:left; width:190mm">(заполняется должностным лицом таможенного органа)</span>
               <table border="1" cellspacing="0" style="width:190mm; empty-cells: show; border-collapse:collapse;">
                  <tbody>
                     <tr>
                        <td align="center" colspan="2" style="border-bottom:0">
                           <table border="0" cellspacing="0" style="width:185mm; empty-cells: show; border-collapse:collapse;">
                              <tbody>
                                 <tr>
                                    <td colspan="3" style="height:2mm"/>
                                 </tr>
                                 <tr>
                                    <xsl:for-each select="gobin:CustomsMark">
                                       <td align="center" class="bold1" style="width:5mm">
                                          <xsl:if test="gobin:PayDocument='true' or gobin:PayDocument='t' or gobin:PayDocument='1' ">X</xsl:if>
                                       </td>
                                    </xsl:for-each>
                                    <td class="common" style="padding-left:2mm; width:88mm">Обеспечение уплаты таможенных платежей принято</td>
                                    <td align="center" class="normal" style="width:92mm">
                                       <xsl:for-each select="gobin:PresentedDocuments[gobin:DocSign=3]">
                                          <xsl:if test="position()=1">
                                             <xsl:value-of select="cat_ru:PrDocumentName"/>,
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:if test="cat_ru:PrDocumentNumber">
																№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>,
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </xsl:if>
                                             <xsl:if test="cat_ru:PrDocumentDate">
																от <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                </xsl:call-template>,
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </xsl:if>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															до <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="gobin:ExpirationDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                       </xsl:for-each>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td colspan="2"/>
                                    <td align="center" class="graphLittle" style=" vertical-align:top">(указываются наименование, номер, дата создания документа и дата окончания действия документа</td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="normal" colspan="3">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:for-each select="gobin:PresentedDocuments[gobin:DocSign=3]">
                                          <xsl:if test="position()>1">
                                             <xsl:value-of select="cat_ru:PrDocumentName"/>,
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:if test="cat_ru:PrDocumentNumber">
																№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>,
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </xsl:if>
                                             <xsl:if test="cat_ru:PrDocumentDate">
																от <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                </xsl:call-template>,
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </xsl:if>	
															до <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="gobin:ExpirationDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                       </xsl:for-each>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graphLittle" colspan="3" style="height:5mm; vertical-align:top">свидетельствующего об обеспечении уплаты таможенных платежей)</td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" colspan="2" style="border-top:1pt dashed windowtext">
                           <table border="0" cellspacing="0" style="width:185mm; empty-cells: show; border-collapse:collapse;">
                              <tbody>
                                 <tr>
                                    <td/>
                                    <td class="common" style="padding-left:2mm">
													В соответствии с пунком 2 статьи 337 Таможенного кодекса Российской Федерации обеспечение уплаты
												</td>
                                 </tr>
                                 <tr>
                                    <xsl:for-each select="gobin:CustomsMark">
                                       <td align="center" class="bold1" style="width:5mm">
                                          <xsl:if test="gobin:NotRequiredPayment='true' or gobin:NotRequiredPayment='t' or gobin:NotRequiredPayment='1' ">X</xsl:if>
                                       </td>
                                       <td class="common" style="padding-left:2mm">таможенных платежей не требуется</td>
                                    </xsl:for-each>
                                 </tr>
                                 <tr>
                                    <td align="left" class="graphLittle" colspan="2">
													(проставляется отметка в одном из квадратов, если проведена уплата таможенных платежей - не заполняется)
												</td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="bold">
									Выпуск товаров разрешаю. <br/>
									Срок подачи таможенной декларации, документов и сведений
								</td>
                        <td align="center">
                           <xsl:for-each select="gobin:CustomsMark/gobin:ObligDecision">
                              <table border="0" cellspacing="0" style="width:90mm; empty-cells: show; border-collapse:collapse;">
                                 <tbody>
                                    <tr>
                                       <td class="common" rowspan="2" style="vertical-align:top; width:5mm">до</td>
                                       <td align="center" class="normal" style="width:25mm">
                                          <xsl:value-of select="substring(gobin:DateLimit, 9, 2)"/>
                                       </td>
                                       <td align="center" style="vertical-align:top; width:5mm">/</td>
                                       <td align="center" class="normal" style="width:25mm">
                                          <xsl:call-template name="month">
                                             <xsl:with-param name="numb" select="substring(gobin:DateLimit, 6, 2)"/>
                                          </xsl:call-template>
                                       </td>
                                       <td align="center" style="vertical-align:top; width:5mm">/</td>
                                       <td align="center" class="normal" style="width:25mm;">
                                          <xsl:value-of select="substring(gobin:DateLimit, 1, 4)"/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="center" class="graphLittle" colspan="5">(указывается дата окончания срока)</td>
                                    </tr>
                                 </tbody>
                              </table>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <span style="font-weight:bold; text-align:right; width:190mm">ЛНП</span>
               <table border="0" cellspacing="0" style="width:190mm; empty-cells: show; border-collapse:collapse;">
                  <tbody>
                     <tr>
                        <td align="center" class="normal">
                           <xsl:value-of select="gobin:CustomsMark/gobin:ObligDecision/gobin:AuthorizedPerson/cat_ru:PersonName"/>
                        </td>
                        <td style="width:5mm"/>
                        <td align="center" class="normal" style="width:40mm; height:5mm">
                           <xsl:value-of select="gobin:CustomsMark/gobin:ObligDecision/gobin:AuthorizedPerson/cat_ru:LNP"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle">(фамилия, инициалы и должность уполномоченного должностного лица таможенного органа)</td>
                        <td/>
                        <td align="center" class="graphLittle" style="width:50mm">(подпись)</td>
                     </tr>
                  </tbody>
               </table>
               <div align="left" style="width:190mm; margin-top:15mm">
                  <table style="width:50mm; margin-top:15mm; ">
                     <tbody>
                        <tr>
                           <td class="common" style="border-top:1 solid black">*  При наличии</td>
                        </tr>
                        <tr>
                           <td class="common">** Ненужное зачеркнуть</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
            <div class="album_page">
               <table border="1" cellspacing="0" style="width:100%; empty-cells: show; border-collapse:collapse;">
                  <tbody>
                     <tr class="graphLittle">
                        <td rowspan="2" style="word-wrap: break-word; width:8mm">Номер товара по обязательству</td>
                        <xsl:if test="//catESAD_cu:GoodsTNVEDCode">
                           <td rowspan="2" style=" word-wrap: break-word; width:14mm">Код по ТН ВЭД ЕАЭС</td>
                        </xsl:if>
                        <xsl:if test="//catESAD_cu:AdditionalSign or //catESAD_cu:IntellectPropertySign">
                           <td rowspan="2" style="word-wrap: break-word; width:10mm">Дополнительные признаки</td>
                        </xsl:if>
                        <xsl:if test="//catESAD_cu:GoodsAddTNVEDCode">
                           <td rowspan="2" style="word-wrap: break-word; width:10mm">
								Код товара в соответствии с Классификатором доп. тамож. инф-ции
							</td>
                        </xsl:if>
                        <td rowspan="2" style=" word-wrap: break-word; width:15mm">Наименование</td>
                        <td rowspan="2" style="word-wrap: break-word; width:10mm">Категория продукции военного назначения</td>
                        <xsl:if test="//catESAD_cu:OriginCountryCode">
                           <td rowspan="2" style="width:10mm">Код страны</td>
                        </xsl:if>
                        <xsl:if test="//catESAD_cu:IPObjectRegistryNum">
							<td rowspan="2" style="width:15mm">Рег. номер объекта интеллект-ной собственности</td>
                        </xsl:if>
                        <td colspan="8" style="width:100mm;">Группы товаров</td>
                        <xsl:if test="//gobin:SupplementaryQuantity or //gobin:SupplementaryQuantity1 or gobin:SupplementaryQuantity2">
                           <td rowspan="2" style=" width:12mm">Кол-во в доп. ед. измерениях</td>
                        </xsl:if>
                        <xsl:if test="//catESAD_cu:GrossWeightQuantity">
                           <td rowspan="2" style="word-wrap: break-word; width:12mm">Вес товара, брутто (кг)</td>
                        </xsl:if>
                        <xsl:if test="//catESAD_cu:NetWeightQuantity">
                           <td rowspan="2" style=" word-wrap: break-word; width:12mm">Вес товара, нетто (кг)</td>
                        </xsl:if>
                        <xsl:if test="//catESAD_cu:NetWeightQuantity2">
                           <td rowspan="2" style=" word-wrap: break-word; width:12mm">Вес товара, нетто (кг) без учета всех видов упаковки</td>
                        </xsl:if>
                        <xsl:if test="//catESAD_cu:InvoicedCost">
                           <td rowspan="2" style=" word-wrap: break-word; width:12mm">Цена</td>
                        </xsl:if>
                        <xsl:if test="//catESAD_cu:CustomsCost">
                           <td rowspan="2" style="word-wrap: break-word; width:15mm">Таможенная стоимость</td>
                        </xsl:if>
                     </tr>
                     <tr class="graphLittle">
                        <td style=" word-wrap: break-word; width:18mm">Описание группы</td>
                        <td style="word-wrap: break-word; width:20mm">Производитель</td>
                        <td style=" word-wrap: break-word; width:10mm">Товарный знак, место происхождения, объект авторского права, смежных прав, патент</td>
                        <td style=" word-wrap: break-word; width:10mm">Марка</td>
                        <td style=" word-wrap: break-word; width:10mm">Модель</td>
                        <td style=" word-wrap: break-word; width:10mm">Артикул</td>
                        <td style="word-wrap: break-word; width:10mm">Стандарт</td>
                        <td style=" word-wrap: break-word; width:12mm">Количество товаров</td>
                     </tr>                 
                     <xsl:apply-templates select="gobin:ObligationGoods"/>
                  </tbody>
               </table>
            </div>
            <xsl:if test="gobin:ServiceMarks">
               <div class="album_page">
                  <p align="left">
                     <span style="font-size:16;  font-weight:bold; ">Служебные отметки</span>
                  </p>
                  <table border="1" cellspacing="0" style="width:100%; empty-cells: show; border-collapse:collapse;">
                     <thead>
                        <tr class="graphLittle">
                           <td align="center" width="50">Номер графы (A, C, D)</td>
                           <td align="center" width="100">Иденти- фикатор простав- ленной тех. отметки - 1. Номер
                                    этапа
                                </td>
                           <td align="center">Описание этапа</td>
                           <td align="center" width="100">Иденти- фикатор простав- ленной тех. отметки - 2. Тип
                                    примечания. (Код)
                                </td>
                           <td align="center">Описание типа примечания</td>
                           <td align="center" width="100">Порядковый номер записи по идентифи- катору тех. отметки
                                </td>
                           <td align="center" width="100">Код типа инфор- мации</td>
                           <td align="center">Служебная запись / номер документа</td>
                           <td align="center" width="100">Дата / Дата принятия решения о продлении срока проверки
                                </td>
                           <td align="center">Время</td>
                           <td align="center">Сумма денежных средств / Суммарный объем отделений транспортных
                                    средств
                                </td>
                           <td align="center">Код вида платежа (пени, штрафы)</td>
                           <td align="center" width="100">Процент за предос- тавление отсрочки / рассрочки</td>
                           <td align="center">Код валюты денежных средст / Код еденицы измерения / код валюты
                                    денежных средств / Код единицы измерения / Код страны / Код основания продления срока выпуска товаров
                                </td>
                           <td align="center">Наименование валюты денежных средств / Краткое наименование единицы
                                    измерения
                                </td>
                           <td align="center">ФИО инспектора, заверивше- го запись</td>
                           <td align="center">ЛНП инспектора, заверивше- го запись</td>
                           <td align="center">Дата завершения разделения товаоной партии на отдельные товары</td>
                           <td align="center">Время</td>
                        </tr>
                     </thead>
                     <tbody>
                        <xsl:for-each select="gobin:ServiceMarks">
                           <tr class="common">
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:GRNumber">
                                       <xsl:value-of select="catESAD_ru:GRNumber"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:StageMarkIdentifier">
                                       <xsl:value-of select="catESAD_ru:StageMarkIdentifier"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="gobin:StageDescription">
                                       <xsl:value-of select="gobin:StageDescription"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:NoteMarkIdentifier">
                                       <xsl:value-of select="catESAD_ru:NoteMarkIdentifier"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="gobin:IdentifierDescription">
                                       <xsl:value-of select="gobin:IdentifierDescription"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <!-- ??? Куда делся -->
                                 <!-- 10.12.2010: я тоже не нашла :) -->
                                 <!--xsl:choose>
                                    <xsl:when test="catESAD_ru:RecordNumber">
                                       <xsl:value-of select="catESAD_ru:RecordNumber"/>
                                    </xsl:when>
                                    <xsl:otherwise-->
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <!--/xsl:otherwise>
                                 </xsl:choose-->
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:InformationTypeCode">
                                       <xsl:value-of select="catESAD_ru:InformationTypeCode"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:MarkDescription">
                                       <xsl:value-of select="catESAD_ru:MarkDescription"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center" width="100">
                                 <!--span style="background-color:#C0C0C0; width:2 cm; "-->
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:DateInf">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="catESAD_ru:DateInf"/>
                                       </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:TimeInf">
                                       <xsl:value-of select="catESAD_ru:TimeInf"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:Amount">
                                       <xsl:value-of select="catESAD_ru:Amount"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:PaymentTypeCode">
                                       <xsl:value-of select="catESAD_ru:PaymentTypeCode"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:PostponementProcent">
                                       <xsl:value-of select="catESAD_ru:PostponementProcent"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:Code">
                                       <xsl:value-of select="catESAD_ru:Code"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:CurrencyName">
                                       <xsl:value-of select="catESAD_ru:CurrencyName"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:PersonName">
                                       <xsl:value-of select="catESAD_ru:PersonName"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:LNP">
                                       <xsl:value-of select="catESAD_ru:LNP"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:GoodsDevisionDate">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="catESAD_ru:GoodsDevisionDate"/>
                                       </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="catESAD_ru:GoodsDevisionTime">
                                       <xsl:value-of select="catESAD_ru:GoodsDevisionTime"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </div>
            </xsl:if>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="gobin:ObligationRegNumber">
      <table border="0" style="width:190mm; ">
         <tbody>
            <tr>
               <td align="center" class="common" style="width:60mm">Регистрационный № </td>
               <td align="center" class="normal" style="width:43mm">
                  <xsl:value-of select="cat_ru:CustomsCode"/>
               </td>
               <td style="border:0"> / </td>
               <td align="center" class="normal" style="width:43mm">
                  <xsl:call-template name="russian_date2">
                     <xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
                  </xsl:call-template>
               </td>
               <td style="border:0">	ОБ </td>
               <td align="center" class="normal" style="width:43mm">
                  <xsl:value-of select="cat_ru:GTDNumber"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graphLittle" style="width:60mm; vertical-align:top">(заполняется таможенным органом)</td>
               <td align="center" class="graphLittle" style="width:43mm; vertical-align:top">(код таможенного органа)</td>
               <td style="border:0"/>
               <td align="center" class="graphLittle" style="width:43mm; vertical-align:top">	
				(дата регистрации)
				</td>
               <td style="border:0"/>
               <td align="center" class="graphLittle" style="width:83mm; vertical-align:top">	
				(порядковый номер по журналу регистрации)
				</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="gobin:ObligationDeclarant">
      <table border="0" cellspacing="0" style="width:160mm">
         <tbody>
            <tr>
               <td align="center" class="graphMain" style="width:20mm">	
					 Настоящим 
				</td>
               <td align="center" class="normal" colspan="3" style="width:170mm">
                  <xsl:choose>
                     <xsl:when test="cat_ru:OrganizationName">
                        <xsl:value-of select="cat_ru:OrganizationName"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="cat_ru:ShortName"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </td>
            </tr>
            <tr>
               <td align="center" class="bold" style="width:20mm">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
               <td align="center" class="graphLittle" colspan="3" style="width:170mm">
				(указывается сокращенное наименование декларанта)
				</td>
            </tr>
         </tbody>
      </table>
      <table border="0" cellspacing="0" style="width:190mm; empty-cells: show; border-collapse:collapse;">
         <tbody>
            <tr>
               <td align="center" class="bordered" colspan="2" width="48%">Для юридических лиц</td>
               <td style="border:0" width="10mm"/>
               <td align="center" class="bordered" colspan="2" width="48%">Для физических лиц</td>
            </tr>
            <tr>
               <td class="bordered" style="width:10%">ОГРН</td>
               <td align="center" class="bordered">
                  <xsl:if test="string-length(cat_ru:RFOrganizationFeatures/cat_ru:OGRN)=13 or gobin:SubdivisionInfo">
                     <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                  </xsl:if>
               </td>
               <td style="border:0;"/>
               <td class="bordered" style="width:20%">ОГРНИП</td>
               <td class="bordered">
                  <xsl:if test="string-length(cat_ru:RFOrganizationFeatures/cat_ru:OGRN)=15 or gobin:IdentityCard">
                     <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td class="bordered">ИНН</td>
               <td align="center" class="bordered">
                  <xsl:if test="string-length(cat_ru:RFOrganizationFeatures/cat_ru:OGRN)=13 or gobin:SubdivisionInfo">
                     <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                  </xsl:if>
               </td>
               <td style="border:0"/>
               <td class="bordered">ИНН*</td>
               <td class="bordered">
                  <xsl:if test="string-length(cat_ru:RFOrganizationFeatures/cat_ru:OGRN)=15 or gobin:IdentityCard">
                     <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td class="bordered">КПП</td>
               <td align="center" class="bordered">
                  <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
               </td>
               <td style="border:0"/>
               <td class="bordered">Документ, удостоверяющий личность</td>
               <td class="bordered">
                  <xsl:apply-templates select="gobin:IdentityCard"/>
               </td>
            </tr>
            <tr>
               <td class="bordered" colspan="5" style="border-top:0">
					Телефон, факс, e-mail 
					<xsl:value-of select="cat_ru:Contact/cat_ru:Phone"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                  <xsl:value-of select="cat_ru:Contact/cat_ru:Fax"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                  <xsl:value-of select="cat_ru:Contact/cat_ru:E_mail"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="gobin:IdentityCard">
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код - <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="docs">
      <table border="0" cellspacing="0" style="width:190mm; empty-cells: show; border-collapse:collapse;">
         <tbody>
            <tr>
               <td style="vertical-align:top;" width="48%">
                  <table border="0" cellspacing="0" style="width:100%; empty-cells: show; border-collapse:collapse;">
                     <tbody>
                        <tr>
                           <td align="center" class="bordered" colspan="4" height="70mm" width="48%">Документы, позволяющие идентифицировать товары</td>
                        </tr>
                        <tr>
                           <td align="center" class="bordered">наименование</td>
                           <td align="center" class="bordered">дата</td>
                           <td align="center" class="bordered">дата окончания действия</td>
                           <td align="center" class="bordered">номер</td>
                        </tr>
                        <xsl:for-each select="gobin:PresentedDocuments[gobin:DocSign=1]">
                           <tr>
                              <td class="bordered">
                                 <xsl:value-of select="cat_ru:PrDocumentName"/>
                              </td>
                              <td class="bordered">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </td>
                              <td class="bordered">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="gobin:ExpirationDate"/>
                                 </xsl:call-template>
                              </td>
                              <td class="bordered">
                                 <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </td>
               <td style="width:10mm"/>
               <td style="vertical-align:top" width="48%">
                  <table border="0" cellspacing="0" style="width:100%; empty-cells: show; border-collapse:collapse;">
                     <tbody>
                        <tr>
                           <td align="center" class="bordered" colspan="4" height="70mm" width="48%">
									Документы, подтверждающие соблюдение ограничений, установленных законодательством Российской Федерации 
									о регулировании внешнеторговой деятельности
								</td>
                        </tr>
                        <tr>
                           <td align="center" class="bordered">наименование</td>
                           <td align="center" class="bordered">дата</td>
                           <td align="center" class="bordered">дата окончания действия</td>
                           <td align="center" class="bordered">номер</td>
                        </tr>
                        <xsl:for-each select="gobin:PresentedDocuments[gobin:DocSign=2]">
                           <tr>
                              <td class="bordered">
                                 <xsl:value-of select="cat_ru:PrDocumentName"/>
                              </td>
                              <td class="bordered">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </td>
                              <td class="bordered">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="gobin:ExpirationDate"/>
                                 </xsl:call-template>
                              </td>
                              <td class="bordered">
                                 <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="gobin:InfoCustomsPay">
      <table border="1" cellspacing="0" style="width:190mm; empty-cells: show; border-collapse:collapse; border-style:dashed; border-color:black; margin-top:2mm ">
         <tr>
            <td align="left" class="graphMain" colspan="2" style="width:190mm">	
				Уплата причитающихся таможенных платежей в сумме 
				<span class="normal" style="width:97mm; text-align:center">
                  <xsl:value-of select="gobin:PaymentSum"/>
               </span>
               <xsl:choose>
                  <xsl:when test="gobin:ExecuteAssure = '1'">
						произведена / <span style="text-decoration:line-through">обеспечена</span>**
					</xsl:when>
                  <xsl:otherwise>
                     <span style="text-decoration:line-through">произведена</span> / обеспечена**</xsl:otherwise>
               </xsl:choose>, подтверждающие 
				
				<xsl:choose>
                  <xsl:when test="gobin:PaymenSecuring = '1'">
						уплату / <span style="text-decoration:line-through">обеспечение</span>**
					</xsl:when>
                  <xsl:otherwise>
                     <span style="text-decoration:line-through">уплату</span> / обеспечение**</xsl:otherwise>
               </xsl:choose>
				уплаты причитающихся таможенных платежей документы прилагаются.<br/>
               <span class="graphLittle">
					(заполняется, если произведена уплата таможенных   платежей  или требуется  обеспечение уплаты причитающихся таможенных платежей, 
					в ином случае - зачеркивается по диагонали)
				</span>
            </td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template name="OtImeny_MPDeclaranta">
      <table border="0" style="width:190mm; empty-cells: show;  border-collapse:collapse; margin-top:2mm">
         <!-- От имени -->
         <tbody>
            <tr>
               <td class="common" style="width:20mm">От имени</td>
               <td align="center" class="normal" style="vertical-align:bottom; width:80mm; ">
                  <xsl:choose>
                     <xsl:when test="gobin:ObligationDeclarant/cat_ru:ShortName">
                        <xsl:value-of select="gobin:ObligationDeclarant/cat_ru:ShortName"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="gobin:ObligationDeclarant/cat_ru:OrganizationName"/>
                     </xsl:otherwise>
                  </xsl:choose>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                  <xsl:apply-templates select="gobin:CustBroker"/>
               </td>
               <td style="border:0; width:5mm"/>
               <td align="center" class="normal" style="vertical-align:bottom"/>
               <td style="border:0; width:5mm"/>
               <td align="center" class="normal" style="vertical-align:bottom;">
                  <xsl:value-of select="gobin:FilledPerson"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graphLittle" colspan="2" style="vertical-align:top">  
					(указывается сокращенное наименование декларанта и сокращенное наименование таможенного брокера (представителя), номер и дата 
					свидетельства о его включении в Реестр таможенных брокеров (представителей), 
					если обязательство подает таможенный брокер - представитель декларанта)
				</td>
               <td style="border:0"/>
               <td align="center" class="graphLittle" style="width:30mm; vertical-align:top">(подпись) </td>
               <td style="border:0"/>
               <td align="center" class="graphLittle" style="width:60mm; vertical-align:top"> (фамилия, инициалы лица, составившего Обязательство)</td>
            </tr>
         </tbody>
      </table>
      <table style="width:190mm">
         <!-- М.П. декларанта или таможенного брокера (представителя) -->
         <tbody>
            <tr>
               <td class="common">М.П. декларанта или таможенного брокера (представителя) </td>
               <td width="20mm"/>
               <td align="center" class="common" style="text-decoration:underline; width:60mm">
					"<xsl:value-of select="substring(gobin:DateSign, 9, 2)"/>"
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:call-template name="month">
                     <xsl:with-param name="numb" select="substring(gobin:DateSign, 6, 2)"/>
                  </xsl:call-template>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="substring(gobin:DateSign, 1, 4)"/> г.
				</td>
            </tr>
         </tbody>
      </table>
      <table border="0" style="width:190mm; empty-cells: show;  border-collapse:collapse;margin-top:2mm">
         <tbody>
            <tr>
               <td style="border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 2 dashed windowtext; "/>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="gobin:CustBroker">
      <xsl:value-of select="gobin:AbbreviationCustBrokerName"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
      <xsl:value-of select="gobin:BrokerReestrNumber"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="gobin:BrokerReestrDate"/>
      </xsl:call-template>
   </xsl:template>
   <xsl:template name="month">
      <xsl:param name="numb"/>
      <xsl:choose>
         <xsl:when test="$numb=01">января</xsl:when>
         <xsl:when test="$numb=02">февраля</xsl:when>
         <xsl:when test="$numb=03">марта</xsl:when>
         <xsl:when test="$numb=04">апреля</xsl:when>
         <xsl:when test="$numb=05">мая</xsl:when>
         <xsl:when test="$numb=06">июня</xsl:when>
         <xsl:when test="$numb=07">июля</xsl:when>
         <xsl:when test="$numb=08">августа</xsl:when>
         <xsl:when test="$numb=09">сентября</xsl:when>
         <xsl:when test="$numb=10">октября</xsl:when>
         <xsl:when test="$numb=11">ноября</xsl:when>
         <xsl:when test="$numb=12">декабря</xsl:when>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="gobin:ObligationGoods">
		<!--Количество товаров для объедининея столбцов-->
		<xsl:variable name="row">
			<xsl:choose>
				<xsl:when test="count(catESAD_cu:GoodsGroupDescription/catESAD_cu:GoodsGroupInformation) &gt; 0">
					<xsl:value-of select="count(catESAD_cu:GoodsGroupDescription/catESAD_cu:GoodsGroupInformation)"/>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="number('1')"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
      <tr>
        <td class="common" style="word-wrap: break-word; vertical-align:top" rowspan="{$row}">
            <xsl:value-of select="catESAD_cu:GoodsNumeric"/>
        </td>
        <xsl:if test="//catESAD_cu:GoodsTNVEDCode">
          <td class="common" style="word-wrap: break-word; vertical-align:top" rowspan="{$row}">
            <xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/>
          </td>
        </xsl:if>
        <xsl:if test="//catESAD_cu:AdditionalSign or //catESAD_cu:IntellectPropertySign"> 
          <td class="common" style="word-wrap: break-word; vertical-align:top" rowspan="{$row}">
            <xsl:value-of select="catESAD_cu:AdditionalSign"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="catESAD_cu:IntellectPropertySign"/>
          </td>
		</xsl:if>
        <xsl:if test="//catESAD_cu:GoodsAddTNVEDCode">
          <td class="common" style="word-wrap: break-word; vertical-align:top" rowspan="{$row}"> 
            <xsl:value-of select="catESAD_cu:GoodsAddTNVEDCode"/>
          </td>
        </xsl:if>
        <td class="common" style="word-wrap: break-word; vertical-align:top;" rowspan="{$row}">
            <xsl:for-each select="catESAD_cu:GoodsDescription">
               <xsl:value-of select="."/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </xsl:for-each>
        </td>
        <td class="common" style="word-wrap: break-word; vertical-align:top" rowspan="{$row}">
			<xsl:value-of select="gobin:MilitaryProductCategoryCode"/>
        </td>
        <xsl:if test="//catESAD_cu:OriginCountryCode">
          <td class="common" style="vertical-align:top; word-wrap: break-word" rowspan="{$row}">
            <xsl:value-of select="catESAD_cu:OriginCountryCode"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:if test="gobin:OriginCountrySign">
                <xsl:choose>
                    <xsl:when test="gobin:OriginCountrySign = 'f'"> (по классификатору OKSMT)</xsl:when>
                    <xsl:otherwise> (буквенный код EU)</xsl:otherwise>
                </xsl:choose>
            </xsl:if>
          </td>
		</xsl:if>
        <xsl:if test="//catESAD_cu:IPObjectRegistryNum">
          <td class="common" style="word-wrap: break-word; vertical-align:top" rowspan="{$row}">
			<xsl:for-each select="catESAD_cu:IPObjectRegistryNum">
				<xsl:choose>
					<xsl:when test="catESAD_cu:DocumentModeCode='1'">
						<xsl:text>Единый таможенный реестр объектов интеллектуальной собственности государств - членов Евразийского экономического союза</xsl:text>
					</xsl:when>
					<xsl:when test="catESAD_cu:DocumentModeCode='2'">
						<xsl:text>Национальный таможенный реестр объектов интеллектуальной  собственности</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="catESAD_cu:DocumentModeCode"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="catESAD_cu:CountryCode">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="catESAD_cu:CountryCode"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
				<xsl:text> №</xsl:text>
				<xsl:value-of select="catESAD_cu:IPORegistryNumber"/>
				<xsl:if test="position()!=last()"><xsl:text>, </xsl:text><br/></xsl:if>
			</xsl:for-each>
          </td>
        </xsl:if>
    	<xsl:choose>
			<xsl:when test="count(catESAD_cu:GoodsGroupDescription) &gt; 0">
				<!--Количество групп товаров для объедининея столбцов-->
				<xsl:variable name="row_d">
					<xsl:choose>
						<xsl:when test="count(catESAD_cu:GoodsGroupDescription[position() = 1]/catESAD_cu:GoodsGroupInformation) &gt; 0">
							<xsl:value-of select="count(catESAD_cu:GoodsGroupDescription[position() = 1]/catESAD_cu:GoodsGroupInformation)"/>
						</xsl:when>
						<xsl:otherwise><xsl:value-of select="number('1')"/></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>	
				<!--Группа товаров-->
				<xsl:for-each select="catESAD_cu:GoodsGroupDescription[position() = 1]">	   
					<td class="common" style="vertical-align:top" rowspan="{$row_d}">
						<xsl:for-each select="catESAD_cu:GoodsDescription">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
						</xsl:for-each>
					</td>
					<!--Описание товара-->
					<xsl:for-each select="catESAD_cu:GoodsGroupInformation[position() = 1]">
						<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:Manufacturer"/></td>
						<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:TradeMark"/></td>				
						<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsMark"/></td>				
						<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsModel"/></td>				
						<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsMarking"/></td>				
						<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsStandard"/></td>				
						<td class="common" style="vertical-align:top"><xsl:apply-templates select="catESAD_cu:GoodsGroupQuantity"/></td>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<td class="common"></td>
				<td class="common"></td>
				<td class="common"></td>
				<td class="common"></td>
				<td class="common"></td>
				<td class="common"></td>
				<td class="common"></td>
				<td class="common"></td>
			</xsl:otherwise>
		</xsl:choose>
		<!--Далее строка-->
		<xsl:if test="//gobin:SupplementaryQuantity or //gobin:SupplementaryQuantity1 or gobin:SupplementaryQuantity2">
			<td class="common" style="word-wrap: break-word; vertical-align:top" rowspan="{$row}">
               <xsl:apply-templates select="gobin:SupplementaryQuantity"/>
               <xsl:apply-templates select="gobin:SupplementaryQuantity12"/>
			</td>
		</xsl:if>
        <xsl:if test="//catESAD_cu:GrossWeightQuantity">
			<td class="common" style="word-wrap: break-word; vertical-align:top" rowspan="{$row}">
               <xsl:value-of select="catESAD_cu:GrossWeightQuantity"/>
			</td>
		</xsl:if>
        <xsl:if test="//catESAD_cu:NetWeightQuantity">
			<td class="common" style="word-wrap: break-word; vertical-align:top" rowspan="{$row}">
				<xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
			</td>
		</xsl:if>
        <xsl:if test="//catESAD_cu:NetWeightQuantity2">
			<td class="common" style="word-wrap: break-word; vertical-align:top" rowspan="{$row}">
				<xsl:value-of select="catESAD_cu:NetWeightQuantity2"/>
			</td>
		</xsl:if>
        <xsl:if test="//catESAD_cu:InvoicedCost">
			<td class="common" style="word-wrap: break-word; vertical-align:top" rowspan="{$row}">
				<xsl:value-of select="catESAD_cu:InvoicedCost"/>
			</td>
		</xsl:if>
        <xsl:if test="//catESAD_cu:CustomsCost">	
			<td class="common" style="word-wrap: break-word; vertical-align:top" rowspan="{$row}">
				<xsl:value-of select="catESAD_cu:CustomsCost"/>
			</td>
		</xsl:if>
      </tr>
      	<!--Следующая строка товара в группе-->
		<xsl:for-each select="catESAD_cu:GoodsGroupDescription[position() = 1]/catESAD_cu:GoodsGroupInformation[position() &gt; 1]">
			<tr>
				<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:Manufacturer"/></td>
				<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:TradeMark"/></td>				
				<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsMark"/></td>				
				<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsModel"/></td>				
				<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsMarking"/></td>				
				<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsStandard"/></td>				
				<td class="common" style="vertical-align:top"><xsl:apply-templates select="catESAD_cu:GoodsGroupQuantity"/></td>
			</tr>
		</xsl:for-each>
		<!--Следующая строка группы товаров-->
		<xsl:for-each select="catESAD_cu:GoodsGroupDescription[position() &gt; 1]">
			<tr>
				<!--Количество групп товаров для объединения столбцов-->
				<xsl:variable name="row_d">
					<xsl:choose>
						<xsl:when test="count(catESAD_cu:GoodsGroupInformation) &gt; 0">
							<xsl:value-of select="count(catESAD_cu:GoodsGroupInformation)"/>
						</xsl:when>
						<xsl:otherwise><xsl:value-of select="number('1')"/></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<td class="common" style="vertical-align:top" rowspan="{$row_d}">
					<xsl:for-each select="catESAD_cu:GoodsDescription">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
					</xsl:for-each>
				</td>
				<!--Описание товара-->
				<xsl:for-each select="catESAD_cu:GoodsGroupInformation[position() = 1]">
					<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:Manufacturer"/></td>
					<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:TradeMark"/></td>				
					<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsMark"/></td>				
					<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsModel"/></td>				
					<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsMarking"/></td>				
					<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsStandard"/></td>				
					<td class="common" style="vertical-align:top"><xsl:apply-templates select="catESAD_cu:GoodsGroupQuantity"/></td>
				</xsl:for-each>
			</tr>
			<!--Следующая строка товара в группе-->
			<xsl:for-each select="catESAD_cu:GoodsGroupInformation[position() &gt; 1]">
			   <tr>
					<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:Manufacturer"/></td>
					<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:TradeMark"/></td>				
					<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsMark"/></td>				
					<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsModel"/></td>				
					<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsMarking"/></td>				
					<td class="common" style="vertical-align:top"><xsl:value-of select="catESAD_cu:GoodsStandard"/></td>				
					<td class="common" style="vertical-align:top"><xsl:apply-templates select="catESAD_cu:GoodsGroupQuantity"/></td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
   </xsl:template>
   <xsl:template match="catESAD_cu:GoodsGroupQuantity | gobin:SupplementaryQuantity | gobin:SupplementaryQuantity12">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
      <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
	(<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)<br/>
   </xsl:template>
</xsl:stylesheet>
