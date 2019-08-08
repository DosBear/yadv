<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes=" cat_ru p_inv catComFin_ru" version="1.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:p_inv="urn:customs.ru:Information:CommercialFinanceDocuments:ProformInvoice:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="p_inv:ProformInvoice">
      <html>
         <head>
            <title>Счет-проформа</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
							
						div.page {
							width: 210mm;
							height: 297mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	20mm;
							background: #ffffff;
							border: solid 1pt #000000;
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
							font-size: 8pt;
							}

							}
						td {
							font-family:Courier;
							}
						.graphMain {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <h2>СЧЕТ-ПРОФОРМА/PROFORMA INVOICE</h2>
               <span class="graph">Номер счета (если необходимо) / Invoice number (if applicable): </span>
               <xsl:value-of select="p_inv:Registration/cat_ru:PrDocumentNumber"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;от&amp;nbsp;</xsl:text>
               <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="p_inv:Registration/cat_ru:PrDocumentDate"/>
               </xsl:call-template>
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td style="width:180mm">
                           <span class="graphMain">ОТПРАВИТЕЛЬ / SENT BY: </span>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:180mm">
                           <xsl:apply-templates select="p_inv:Consignor"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:180mm">
                           <span class="graphMain">ПОЛУЧАТЕЛЬ / SENT TO: </span>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:180mm">
                           <xsl:apply-templates select="p_inv:Consignee"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:180mm">
                           <span class="graphMain">Транспортный документ / WAYBILL / CMR / Bill of lading №: </span>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:180mm">
                           <table border="0" cellpadding="3" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td style="width:90mm">
                                       <span class="graph">Количество предметов / Number of pieces: </span>
                                    </td>
                                    <td style="width:90mm">
                                       <span class="graph">
                                          <xsl:value-of select="p_inv:PlacesQuantity"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td style="width:90mm">
                                       <span class="graph">Вес брутто / Total Gross Weight: </span>
                                    </td>
                                    <td style="width:90mm">
                                       <span class="graph">
                                          <xsl:value-of select="p_inv:GrossWeightQuantity"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td style="width:90mm">
                                       <span class="graph">Вес нетто / Total Net Weight: </span>
                                    </td>
                                    <td style="width:90mm">
                                       <span class="graph">
                                          <xsl:value-of select="p_inv:NetWeightQuantity"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td style="width:90mm">
                                       <span class="graph">Перевозчик / Carrier: </span>
                                    </td>
                                    <td style="width:90mm">
                                       <span class="graph">
                                          <xsl:value-of select="p_inv:Carier/catComFin_ru:Name"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <!--
											<tr>
												<td  style="width:90mm">
													<span class="graph">Тип посылки / Movement Certificate type no: </span>
												</td>
												<td  style="width:90mm">
													<span class="graph"></span>
												</td>
											</tr>
-->
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td style="width:180mm">
                           <span class="graphMain">Валюта счета-проформы / Currency of proforma invoice: </span>
                           <xsl:value-of select="p_inv:CurrencyCode"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" style="width:50mm">
                           <span class="graph">Полное описание товаров / Full description of goods</span>
                        </td>
                        <td align="center" style="width:30mm">
                           <span class="graph">Код ТН ВЭД ЕАЭС/ Customs Commodity Code</span>
                        </td>
                        <td align="center" style="width:20mm">
                           <span class="graph">Артикул / Marking</span>
                        </td>
                        <td align="center" style="width:20mm">
                           <span class="graph">Страна происхождения / Country of origin</span>
                        </td>
                        <td align="center" style="width:15mm">
                           <span class="graph">Количество / Quantity</span>
                        </td>
                        <td align="center" style="width:25mm">
                           <span class="graph">Цена за ед. товара / Unit value </span>
                        </td>
                        <td align="center" style="width:25mm">
                           <span class="graph">Общая стоимость / Sub TotalValue</span>
                        </td>
                        <xsl:if test="p_inv:InvoiceGoods/catComFin_ru:TotalCost">
                           <td align="center" style="width:25mm">
                              <span class="graph">Общая стоимость с учетом налога / Sub TotalValue including Tax</span>
                           </td>
                        </xsl:if>
                     </tr>
                     <xsl:for-each select="p_inv:InvoiceGoods">
                        <tr>
                           <td align="center" style="width:50mm">
                              <xsl:for-each select="catComFin_ru:GoodsDescription">
                                 <xsl:value-of select="."/>
                                 <xsl:if test="position()!=last()"> </xsl:if>
                              </xsl:for-each>
                           </td>
                           <td align="center" style="width:30mm">
                              <span class="graph">
                                 <xsl:choose>
                                    <xsl:when test="catComFin_ru:GoodsCode">
                                       <xsl:value-of select="catComFin_ru:GoodsCode"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </span>
                           </td>
                           <td align="center" style="width:20mm">
                                 <xsl:value-of select="catComFin_ru:GoodMarking"/>
                           </td>
                           <td align="center" style="width:20mm">
                              <xsl:value-of select="catComFin_ru:OriginCountryCode"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" style="width:20mm">
                              <xsl:value-of select="catComFin_ru:GoodsQuantity"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" style="width:30mm">
                              <xsl:value-of select="catComFin_ru:GoodsPrice"/>
                           </td>
                           <td align="center" style="width:30mm">
                              <xsl:value-of select="catComFin_ru:GoodsCost"/>
                           </td>
                           <xsl:choose>
                              <xsl:when test="catComFin_ru:TotalCost">
                                 <td align="center" style="width:30mm">
                                    <xsl:value-of select="catComFin_ru:TotalCost"/>
                                    <xsl:if test="catComFin_ru:TaxSum">
                                       <br/>
                                       <span class="graph">с налогом</span>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="catComFin_ru:TaxSum"/>
                                    </xsl:if>
                                 </td>
                              </xsl:when>
                              <xsl:otherwise>
                                 <td align="center" style="width:30mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </xsl:otherwise>
                           </xsl:choose>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td align="right" colspan="6" style="width:150mm">
                           <span class="graph">Полная стоимость / Total Value</span>
                        </td>
                        <td align="center" style="width:30mm">
                           <xsl:value-of select="format-number(sum(p_inv:InvoiceGoods/catComFin_ru:GoodsCost),'#.00')"/>
                        </td>
                        <xsl:if test="p_inv:InvoiceGoods/catComFin_ru:TotalCost">
                           <td align="center" style="width:30mm">
                              <xsl:value-of select="format-number(sum(p_inv:InvoiceGoods/catComFin_ru:TotalCost),'#.00')"/>
                           </td>
                        </xsl:if>
                     </tr>
                  </tbody>
               </table>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
						<tr>
							<td><span class="graph">Контракт / Contract: </span>
								<xsl:apply-templates select="p_inv:Contract"/>
							</td>
						</tr>
						<tr>
							<td><span class="graph">Спецификация / Specification: </span>
								<xsl:for-each select="p_inv:Enclosure">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
						</tr>
                     <tr>
                        <td>
                           <span class="graph">Условия транспортировки (ИНКОТЕРМС) / Terms of Transportation (INCOTERMS): </span>
                           <xsl:choose>
                              <xsl:when test="p_inv:DeliveryTerms">
                                 <xsl:for-each select="p_inv:DeliveryTerms">
                                    <xsl:if test="cat_ru:DeliveryTermsStringCode">
                                       <xsl:value-of select="cat_ru:DeliveryTermsStringCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="(cat_ru:DeliveryPlace) and (cat_ru:DeliveryTermsStringCode) "/>
                                    <xsl:if test="cat_ru:DeliveryPlace">
                                       <xsl:value-of select="cat_ru:DeliveryPlace"/>
                                    </xsl:if>
                                    <xsl:if test="position()!=last()">, </xsl:if>
                                 </xsl:for-each>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="graph">Цель экспорта / Reason for export: </span>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="graph">Подтверждаю, что все указанное верно / I declare that the above information is true and correct to the best of my knowledge:  </span>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td style="width:90mm">
                           <span class="graphMain">ФИО / Name: </span>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="graph">
                              <xsl:value-of select="p_inv:Signature/cat_ru:PersonSurname"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="p_inv:Signature/cat_ru:PersonName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="p_inv:Signature/cat_ru:PersonMiddleName"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:90mm">
                           <span class="graphMain">Подпись / Signature: ________________________</span>
                        </td>
                        <td style="width:90mm">
                           <span class="graphMain">Дата /Date: <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </span>
                           <span class="graph">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="p_inv:Signature/cat_ru:IssueDate"/>
                              </xsl:call-template>
                           </span>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table>
                  <tbody>
                     <tr>
                        <xsl:if test="p_inv:Mark">
                           <td align="left" class="graph" style="width:150mm;border-right: 0px;">
                              <xsl:value-of select="p_inv:Mark/catComFin_ru:MarkKind"/> <br/>
                              <xsl:value-of select="p_inv:Mark/catComFin_ru:ResultControl"/>
                           </td>
                           <td align="right" class="graphMain" style="width:45mm;border-left: 0px;">
                              <br/>
                              <b>Отметка:</b>
                              <u>
                                 <xsl:choose>
                                    <xsl:when test="(p_inv:Mark/catComFin_ru:MarkSing='true' or p_inv:Mark/catComFin_ru:MarkSing='t' or p_inv:Mark/catComFin_ru:MarkSing='1')">
											Присутствует
											</xsl:when>
                                    <xsl:otherwise> Отсутствует</xsl:otherwise>
                                 </xsl:choose>
                              </u>
                           </td>
                        </xsl:if>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="p_inv:Contract|p_inv:Enclosure">
	   <xsl:value-of select="cat_ru:PrDocumentName"/>
	   <xsl:if test="cat_ru:PrDocumentNumber">
		   <xsl:text> № </xsl:text>
		   <xsl:value-of select="cat_ru:PrDocumentNumber"/>
	   </xsl:if>
	   <xsl:if test="cat_ru:PrDocumentDate">
		   <xsl:text> от </xsl:text>
		   <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
	   </xsl:if>
   </xsl:template>
   <xsl:template match="p_inv:Consignor |  p_inv:Consignee">
      <table border="0" cellpadding="3" cellspacing="0" width="100%">
         <tbody>
            <tr>
               <td style="width:90mm">
                  <span class="graph">Компания / CompanyName: </span>
               </td>
               <td style="width:90mm">
                  <xsl:value-of select="cat_ru:OrganizationName"/>
               </td>
            </tr>
            <!--
											<tr>
												<td  style="width:90mm">
													<span class="graph">ФИО / Отдел / Name / Department: </span>
												</td>
												<td  style="width:90mm">
													<span class="graph"></span>
												</td>
											</tr>
-->
            <tr>
               <td style="width:90mm">
                  <span class="graph">Адрес / Address: </span>
               </td>
               <td style="width:90mm">
                  <xsl:value-of select="cat_ru:Address/cat_ru:StreetHouse"/>
               </td>
            </tr>
            <tr>
               <td style="width:90mm">
                  <span class="graph">Город / Индекс / City / Postal Code: </span>
               </td>
               <td style="width:90mm">
                  <xsl:value-of select="cat_ru:Address/cat_ru:City"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:Address/cat_ru:PostalCode"/>
               </td>
            </tr>
            <tr>
               <td style="width:90mm">
                  <span class="graph">Страна / Country: </span>
               </td>
               <td style="width:90mm">
                  <xsl:value-of select="cat_ru:Address/cat_ru:CounryName"/>
               </td>
            </tr>
            <tr>
               <td style="width:90mm">
                  <span class="graph">Тел. / Телекс / Tel. / Telex: </span>
               </td>
               <td style="width:90mm">
                  <xsl:value-of select="cat_ru:Contact/cat_ru:Phone"/>/<xsl:value-of select="cat_ru:Contact/cat_ru:Telex"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
            </tr>
            <tr>
               <td style="width:90mm">
                  <span class="graph">Налоговый номер/VAT Reg. No: </span>
               </td>
               <td style="width:90mm">
                  <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
</xsl:stylesheet>
