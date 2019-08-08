<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:inv="urn:customs.ru:Information:CommercialFinanceDocuments:Invoice:5.11.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template match="/">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Инвойс</title>
            <style type="text/css">
                    body {background: #CCCCCC; font-size: 9pt;}
                    div.page {
                        width: 295mm;
                        margin: 10px auto;
                        padding: 5mm 10mm;
                        background: white;
                        border: solid 1px black;
                        page-break-before: always;
                    }
                    
                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}
                </style>
         </head>
         <body>
            <div class="page">
               <xsl:apply-templates select="inv:Invoice"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="inv:Invoice">
      <table width="100%">
         <tr>
            <td align="center" width="100%">
               <span style="font-size:x-large; ">INVOICE</span>
            </td>
            <td>
               <table width="100%">
                  <tr>
                     <xsl:if test="string-length(inv:Registration/cat_ru:PrDocumentNumber)!=0">
                        <td width="55">Номер:</td>
                        <td width="394">
                           <xsl:value-of select="inv:Registration/cat_ru:PrDocumentNumber"/>
                        </td>
                     </xsl:if>
                  </tr>
                  <tr>
                     <xsl:if test="string-length(inv:Registration/cat_ru:PrDocumentDate)!=0">
                        <td width="55">Дата:</td>
                        <td width="394">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="inv:Registration/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                        </td>
                     </xsl:if>
                  </tr>
               </table>
               <br/>
               <xsl:if test="string-length(inv:Contract/cat_ru:PrDocumentNumber)!=0">
                  <table width="100%">
                     <tbody>
                        <tr>
                           <td align="center" colspan="2" width="55">
                              <span style="font-style:italic; ">Контракт</span>
                           </td>
                        </tr>
                        <tr>
                           <td width="55">Номер:</td>
                           <td>
                              <xsl:value-of select="inv:Contract/cat_ru:PrDocumentNumber"/>
                           </td>
                        </tr>
                        <tr>
                           <xsl:if test="string-length(inv:Contract/cat_ru:PrDocumentDate)!=0">
                              <td width="55">Дата:</td>
                              <td>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="inv:Contract/cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </td>
                           </xsl:if>
                        </tr>
                     </tbody>
                  </table>
               </xsl:if>
               <br/>
            </td>
         </tr>
      </table>
      <table width="100%">
         <xsl:if test="string-length(inv:CurrencyCode)!=0">
            <tr>
               <td width="103">
                        Валюта:
                    </td>
               <td width="80">
                  <xsl:value-of select="inv:CurrencyCode"/>
               </td>
               <td>Курс:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="inv:CurrencyRate"/>
               </td>
               <td width="90">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
            </tr>
         </xsl:if>
         <tr>
            <xsl:if test="string-length(inv:PlacesQuantity)!=0">
               <td height="17">Кол-во мест</td>
               <td height="17" width="158">
                  <xsl:value-of select="inv:PlacesQuantity"/>
               </td>
            </xsl:if>
            <xsl:if test="string-length(inv:PlacesDescription)!=0">
               <td colspan="2" height="17">Описание мест:
                        <xsl:for-each select="inv:PlacesDescription">
                     <xsl:apply-templates/>
                  </xsl:for-each>
               </td>
            </xsl:if>
         </tr>
      </table>
      <table width="100%">
         <tbody>
            <tr>
               <xsl:choose>
                  <xsl:when test="string-length(inv:NetWeightQuantity)!=0">
                     <td height="28" width="139">Общий вес(нетто):</td>
                     <td height="28" width="219">
                        <xsl:value-of select="inv:NetWeightQuantity"/>
                     </td>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:if test="string-length(inv:InvoiceGoods/cat_ru:NetWeightQuantity)!=0">
                        <td height="28" width="139">Общий вес(нетто):</td>
                        <td height="28" width="219">
                           <xsl:for-each select=" inv:InvoiceGoods/cat_ru:NetWeightQuantity">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                                    (<xsl:value-of select="sum(  inv:InvoiceGoods/cat_ru:NetWeightQuantity  )"/>)
                                </td>
                     </xsl:if>
                  </xsl:otherwise>
               </xsl:choose>
               <xsl:choose>
                  <xsl:when test="string-length(inv:GrossWeightQuantity)!=0">
                     <td height="28" width="139">Общий вес(брутто):</td>
                     <td height="28" width="219">
                        <xsl:value-of select="inv:GrossWeightQuantity"/>
                     </td>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:if test="string-length(inv:InvoiceGoods/cat_ru:GrossWeightQuantity)!=0">
                        <td height="28" width="139">Общий вес(нетто):</td>
                        <td height="28" width="219">
                           <xsl:for-each select=" inv:InvoiceGoods/cat_ru:GrossWeightQuantity">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                                    (<xsl:value-of select="sum(  inv:InvoiceGoods/cat_ru:GrossWeightQuantity )"/>)
                                </td>
                     </xsl:if>
                  </xsl:otherwise>
               </xsl:choose>
            </tr>
            <tr>
               <td height="28" width="139">
                  <span style="font-weight:bold; ">Общая стоимость</span>
               </td>
               <td height="28" width="219">
                  <xsl:for-each select="inv:GCost">
                     <xsl:value-of select="."/>
                  </xsl:for-each>
               </td>
               <td height="28" width="170">Общая сумма скидок</td>
               <td height="28" width="230"> 
						<xsl:choose>
                     <xsl:when test="inv:Discount and inv:DiscountPercentage">
                        <xsl:value-of select="inv:Discount"/> 
								(<xsl:value-of select="inv:DiscountPercentage"/>%)
							</xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="inv:Discount"/>
                        <xsl:if test="inv:DiscountPercentage">
                           <xsl:value-of select="inv:DiscountPercentage"/>%
								</xsl:if>
                     </xsl:otherwise>
                  </xsl:choose>
               </td>
            </tr>
         </tbody>
      </table>
      <table width="100%">
         <tbody>
            <tr>
               <td>Сумма транспортных расходов:</td>
               <td>Сумма расходов по страхованию:</td>
               <td>Сумма прочих расходов:</td>
            </tr>
            <tr>
			  <td>
				 <xsl:value-of select="inv:TransportCharges"/>
			  </td>
			  <td>
				 <xsl:value-of select="inv:InsuranceCharges"/>
			  </td>
			  <td>
				 <xsl:value-of select="inv:OtherCharges"/>
			  </td>
            </tr>
         </tbody>
      </table>
      <b>
            Общая стоимость с учетом скидок и доп.расходов: <xsl:apply-templates select="inv:TotalCost"/>
         <xsl:if test="string(inv:GCost - inv:Discount + inv:TransportCharges + inv:InsuranceCharges + inv:OtherCharges) != 'NaN'">
                (<xsl:value-of select="inv:GCost - inv:Discount + inv:TransportCharges + inv:InsuranceCharges + inv:OtherCharges"/>)
            </xsl:if>
      </b>
      <br/>
      <xsl:for-each select="inv:Buyer">
         <span style="font-style:italic; font-weight:bold; ">Покупатель:</span>
         <br/>
         <table border="1" width="100%">
            <tbody>
               <tr>
                  <td colspan="3">
                     <xsl:for-each select="catComFin_ru:Name">
                        <xsl:apply-templates/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <xsl:if test="catComFin_ru:KPPCode">
                     <td>
                                КПП:
                                <xsl:value-of select="catComFin_ru:KPPCode"/>
                     </td>
                  </xsl:if>
                  <xsl:if test="catComFin_ru:CompanyID">
                     <td>
                                Идентификатор:
                                <xsl:value-of select="catComFin_ru:CompanyID"/>
                     </td>
                  </xsl:if>
                  <xsl:if test="catComFin_ru:Phone">
                     <td>
                                Тел.:
                                <xsl:value-of select="catComFin_ru:Phone"/>
                     </td>
                  </xsl:if>
               </tr>
               <tr>
                  <td colspan="3">
                     <xsl:for-each select="inv:PostalAddress">
                        <table width="100%">
                           <tbody>
                              <tr>
                                 <td colspan="3">
                                    <xsl:for-each select="cat_ru:StreetHouse">Адрес:
                                                    <xsl:apply-templates/>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                              <tr>
                                 <td height="16">
                                    <xsl:for-each select="cat_ru:CountryCode">Страна:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td height="16">
                                    <xsl:for-each select="cat_ru:City">Город:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td height="16">
                                    <xsl:for-each select="cat_ru:PostalCode">Индекс:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="left;" colspan="3">
                     <span style="font-style:italic; font-weight:bold">Платежные реквизиты:</span>
                  </td>
               </tr>
               <tr>
                  <td colspan="3">
                     <xsl:for-each select="inv:PaymentRequisitions">
                        <table border="1" width="100%">
                           <tbody>
                              <tr>
                                 <td colspan="4">
                                    <span style="border-style:none; ">Банк:</span>
                                    <xsl:for-each select="catComFin_ru:BankName">
                                       <span style="border-style:none; ">
                                          <xsl:apply-templates/>
                                       </span>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="4">
                                    <xsl:for-each select="catComFin_ru:BankPostalAddress">
                                       <table width="100%">
                                          <tbody>
                                             <tr>
                                                <td colspan="3" width="295">
                                                   <xsl:for-each select="cat_ru:StreetHouse">
                                                      <span style="border-style:none; ">
                                                                            Адрес:
                                                                        </span>
                                                      <span style="border-style:none; ">
                                                         <xsl:apply-templates/>
                                                      </span>
                                                   </xsl:for-each>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td width="295">
                                                   <xsl:for-each select="cat_ru:CountryCode">
                                                                        Страна:
                                                                        <xsl:value-of select="."/>
                                                   </xsl:for-each>
                                                </td>
                                                <td width="295">
                                                   <xsl:for-each select="cat_ru:City">
                                                                        Город:
                                                                        <xsl:value-of select="."/>
                                                   </xsl:for-each>
                                                </td>
                                                <td width="295">
                                                   <xsl:for-each select="cat_ru:PostalCode">
                                                                        Индекс:
                                                                        <xsl:value-of select="."/>
                                                   </xsl:for-each>
                                                </td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                              <tr>
                                 <td width="295">
                                    <xsl:for-each select="catComFin_ru:OKPOID">ОКПО:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td width="295">
                                    <xsl:for-each select="catComFin_ru:BICID">БИК:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td width="295">
                                    <xsl:for-each select="catComFin_ru:SWIFTID">SWIFT:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:for-each select="catComFin_ru:AccountNumeric">
                                                    Корр.счет:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="4">
                                    <table width="100%">
                                       <tbody>
                                          <tr>
                                             <td colspan="3" width="100%">
                                                <span style="border-style:none; ">Валютные
                                                                    счета организации
                                                                </span>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td>
                                                <xsl:for-each select="catComFin_ru:CurrentCurrencyAccount">
                                                                    Текущий:
                                                                    <xsl:value-of select="."/>
                                                </xsl:for-each>
                                             </td>
                                             <td width="100%">
                                                <xsl:for-each select="catComFin_ru:TransitCurrencyAccount">
                                                                    Транзитный:
                                                                    <xsl:value-of select="."/>
                                                </xsl:for-each>
                                             </td>
                                             <td width="100%">
                                                <xsl:for-each select="catComFin_ru:SpecialTransitCurrencyAccount">
                                                                    Транзитный(спец):
                                                                    <xsl:value-of select="."/>
                                                </xsl:for-each>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td colspan="3">
                                                <span style="border-style:none; ">Рублевый
                                                                    счет:
                                                                </span>
                                                <xsl:for-each select="catComFin_ru:RoubleCurrencyAccount">
                                                   <xsl:value-of select="."/>
                                                </xsl:for-each>
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </xsl:for-each>
                  </td>
               </tr>
            </tbody>
         </table>
      </xsl:for-each>
      <xsl:for-each select="inv:Seler">
         <span style="font-style:italic; font-weight:bold; ">Продавец:</span> 
            <br/>
         <table border="1" width="100%">
            <tbody>
               <tr>
                  <td colspan="3" width="717">
                     <xsl:for-each select="catComFin_ru:Name">
                        <xsl:apply-templates/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td width="208">
                     <xsl:for-each select="catComFin_ru:KPPCode">КПП:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
                  <td width="243">
                     <xsl:for-each select="catComFin_ru:CompanyID">Идентификатор:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
                  <td width="163">
                     <xsl:for-each select="catComFin_ru:Phone">Тел.
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td colspan="3" width="717">
                     <xsl:for-each select="inv:PostalAddress">
                        <table width="100%">
                           <tbody>
                              <tr>
                                 <td colspan="3" width="632">
                                    <xsl:for-each select="cat_ru:StreetHouse">Адрес:
                                                    <xsl:apply-templates/>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                              <tr>
                                 <td width="167">
                                    <xsl:for-each select="cat_ru:CountryCode">Страна:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td width="345">
                                    <xsl:for-each select="cat_ru:City">Город:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td width="225">
                                    <xsl:for-each select="cat_ru:PostalCode">Индекс:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="center" colspan="3" width="100%">
                     <span style="font-style:italic; ">Платежные реквизиты</span>
                  </td>
               </tr>
               <tr>
                  <td colspan="3" width="100%">
                     <xsl:for-each select="inv:PaymentRequisitions">
                        <table border="1" width="100%">
                           <tbody>
                              <tr>
                                 <td colspan="4">Банк
                                                <xsl:for-each select="catComFin_ru:BankName">
                                       <xsl:apply-templates/>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="4">
                                    <xsl:for-each select="catComFin_ru:BankPostalAddress">
                                       <table width="100%">
                                          <tbody>
                                             <tr>
                                                <td colspan="3">
                                                   <xsl:for-each select="cat_ru:StreetHouse">
                                                                        Адрес:
                                                                        <xsl:apply-templates/>
                                                   </xsl:for-each>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <xsl:for-each select="cat_ru:CountryCode">
                                                                        Страна:
                                                                        <xsl:value-of select="."/>
                                                   </xsl:for-each>
                                                </td>
                                                <td>
                                                   <xsl:for-each select="cat_ru:City">
                                                                        Город:
                                                                        <xsl:value-of select="."/>
                                                   </xsl:for-each>
                                                </td>
                                                <td>
                                                   <xsl:for-each select="cat_ru:PostalCode">
                                                                        Индекс:
                                                                        <xsl:value-of select="."/>
                                                   </xsl:for-each>
                                                </td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <xsl:for-each select="catComFin_ru:OKPOID">ОКПО:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:for-each select="catComFin_ru:BICID">БИК:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:for-each select="catComFin_ru:SWIFTID">SWIFT:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:for-each select="catComFin_ru:AccountNumeric">Корр.
                                                    счет:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="4">
                                    <table width="100%">
                                       <tbody>
                                          <tr>
                                             <td colspan="3">Валютные счета
                                                                организации
                                                            </td>
                                          </tr>
                                          <tr>
                                             <td>
                                                <xsl:for-each select="catComFin_ru:CurrentCurrencyAccount">
                                                                    Текущий:
                                                                    <xsl:value-of select="."/>
                                                </xsl:for-each>
                                             </td>
                                             <td>
                                                <xsl:for-each select="catComFin_ru:TransitCurrencyAccount">
                                                                    Транзитный:
                                                                    <xsl:value-of select="."/>
                                                </xsl:for-each>
                                             </td>
                                             <td>
                                                <xsl:for-each select="catComFin_ru:SpecialTransitCurrencyAccount">
                                                                    Транзитный (спец):
                                                                    <xsl:value-of select="."/>
                                                </xsl:for-each>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td colspan="3" width="171">Рублевый счет:
                                                                <xsl:for-each select="catComFin_ru:RoubleCurrencyAccount">
                                                   <xsl:value-of select="."/>
                                                </xsl:for-each>
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </xsl:for-each>
                  </td>
               </tr>
            </tbody>
         </table>
      </xsl:for-each>
      <xsl:for-each select="inv:Consignor">
         <span style="font-style:italic; font-weight:bold; ">Грузоотправитель</span> 
            <br/>
         <table border="1" width="100%">
            <tbody>
               <tr>
                  <td colspan="3">
                     <xsl:for-each select="cat_ru:OrganizationName">
                        <xsl:apply-templates/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td>
                     <xsl:for-each select="cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
                  <td>
                     <xsl:for-each select="cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
                  <td>
                     <xsl:for-each select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td>
                     <xsl:for-each select="cat_ru:OKATOCode">ОКАТО:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
                  <td>
                     <xsl:for-each select="cat_ru:OKPOID">ОКПО:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
                  <td>
                     <xsl:for-each select="cat_ru:Contact/cat_ru:Phone">Тел.:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td colspan="3">
                     <xsl:for-each select="cat_ru:Address">
                        <table width="100%">
                           <tbody>
                              <tr>
                                 <td colspan="3">
                                    <xsl:for-each select="cat_ru:StreetHouse">Адрес:
                                                    <xsl:apply-templates/>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                              <tr>
                                 <td width="172">
                                    <xsl:for-each select="cat_ru:CountryCode">Страна:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td width="341">
                                    <xsl:for-each select="cat_ru:City">Город:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:for-each select="cat_ru:PostalCode">Индекс:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </xsl:for-each>
                  </td>
               </tr>
            </tbody>
         </table>
      </xsl:for-each>
      <xsl:for-each select="inv:Consignee">
         <span style="font-style:italic; font-weight:bold; ">Грузополучатель:</span> 
            <br/>
         <table border="1" width="100%">
            <tbody>
               <tr>
                  <td colspan="3" height="23">
                     <xsl:for-each select="cat_ru:OrganizationName">
                        <xsl:apply-templates/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td width="253">
                     <xsl:for-each select="cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
                  <td width="228">
                     <xsl:for-each select="cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
                  <td>
                     <xsl:for-each select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td width="253">
                     <xsl:for-each select="cat_ru:OKATOCode">ОКАТО:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
                  <td width="228">
                     <xsl:for-each select="cat_ru:OKPOID">ОКПО:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
                  <td>
                     <xsl:for-each select="cat_ru:Contact/cat_ru:Phone">Тел.:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td colspan="3" height="23" width="280mm">
                     <xsl:for-each select="cat_ru:Address">
                        <table width="280mm">
                           <tbody>
                              <tr>
                                 <td colspan="3">
                                    <xsl:for-each select="cat_ru:StreetHouse">Адрес:
                                                    <xsl:apply-templates/>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                              <tr>
                                 <td width="174">
                                    <xsl:for-each select="cat_ru:CountryCode">Страна:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td width="342">
                                    <xsl:for-each select="cat_ru:City">Город:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:for-each select="cat_ru:PostalCode">Индекс:
                                                    <xsl:value-of select="."/>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </xsl:for-each>
                  </td>
               </tr>
            </tbody>
         </table>
      </xsl:for-each>
      <br/>
      <span style="font-style:italic; font-weight:bold; ">Товары:</span>
      <table border="1" style="table-layout:fixed;word-wrap:break-word;width:297mm;">
         <thead>
            <tr align="center" bgcolor="silver">
               <td align="justify" height="40" rowspan="2" style="width:11mm; font-size: 7pt; font-weight:bold;">Артикул</td>
               <td height="40" rowspan="2" style="width:9mm; font-size: 7pt; font-weight:bold;">Код ТН ВЭД</td>
               <td height="40" rowspan="2" style="width:10mm; font-size: 7pt; font-weight:bold;">Доп. единица измерения</td>
               <td height="40" rowspan="2" style="width:22mm; font-size: 7pt; font-weight:bold;">Описание товара</td>
               <td height="40" rowspan="2" style="width:10mm; font-size: 7pt; font-weight:bold;">Кол-во товаров/услуг</td>
               <td height="40" rowspan="2" style="width:8mm; font-size: 7pt; font-weight:bold;">Единица измерения</td>
               <td height="40" rowspan="2" style="width:7mm; font-size: 7pt; font-weight:bold;">Вес (брутто), кг</td>
               <td height="40" rowspan="2" style="width:5mm; font-size: 7pt; font-weight:bold;">Вес (нетто), кг</td>
               <td height="40" rowspan="2" style="width:10mm; font-size: 7pt; font-weight:bold;">Цена</td>
               <td height="40" rowspan="2" style="width:15mm; font-size: 7pt; font-weight:bold;">Общая стоимость</td>
               <td height="40" rowspan="2" style="width:9mm; font-size: 7pt; font-weight:bold;">Скидка</td>
               <td align="center" colspan="2" height="40" style="width:20mm; font-size: 7pt; font-weight:bold;">Прочие расходы</td>
               <td height="40" rowspan="2" style="width:10mm; font-size: 7pt; font-weight:bold;">Страна происхождения</td>
               <td height="40" rowspan="2" style="width:10mm; font-size: 7pt; font-weight:bold;">Производитель</td>
               <td height="40" rowspan="2" style="width:10mm; font-size: 7pt; font-weight:bold;">Товарный знак</td>
               <td height="40" rowspan="2" style="width:7.5mm; font-size: 7pt; font-weight:bold;">Марка</td>
               <td height="40" rowspan="2" style="width:10mm; font-size: 7pt; font-weight:bold;">Модель</td>
               <td height="40" rowspan="2" style="width:11mm; font-size: 7pt; font-weight:bold;">Стандарт</td>
            </tr>
            <tr align="center" bgcolor="silver">
               <td height="40" style="width:10mm; font-size: 7pt; font-weight:bold;">Тип</td>
               <td height="40" style="width:10mm; font-size: 7pt; font-weight:bold;">Сумма</td>
            </tr>
         </thead>
         <xsl:for-each select="inv:InvoiceGoods">
            <xsl:choose>
               <xsl:when test="count(catComFin_ru:OtherCharges)&lt;=1">
                  <tbody>
                     <tr>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:GoodMarking">
                              <xsl:apply-templates/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:GoodsCode">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:SupplementaryQualifierName">
                              <xsl:apply-templates/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:GoodsDescription">
                              <xsl:apply-templates/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:GoodsQuantity">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:MeasureUnitQualifierName">
                              <xsl:apply-templates/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:GrossWeightQuantity">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:NetWeightQuantity">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:Price">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:TotalCost">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
							<xsl:if test="catComFin_ru:GoodsQuantity and catComFin_ru:Price">
								<br/>(<xsl:value-of select="format-number(catComFin_ru:GoodsQuantity * catComFin_ru:Price,'#.00')"/>)
							</xsl:if>
                        </td>
                        <td height="auto">
                           <xsl:choose>
                              <xsl:when test="catComFin_ru:DiscountPercentage and catComFin_ru:Discount">
                                 <xsl:value-of select="catComFin_ru:Discount"/> (<xsl:value-of select="catComFin_ru:DiscountPercentage"/>%)
								</xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="catComFin_ru:Discount"/>
                                 <xsl:value-of select="catComFin_ru:DiscountPercentage"/>
                              </xsl:otherwise>
                           </xsl:choose>
                        </td>
                        <td height="auto" style="width:10mm;">
                           <xsl:for-each select="catComFin_ru:OtherCharges/catComFin_ru:ChargeType">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <td height="auto" style="width:20mm;">
                           <xsl:for-each select="catComFin_ru:OtherCharges/catComFin_ru:ChargeAmount">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:OriginCountryCode">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <td align="right" height="auto">
                           <xsl:value-of select="catComFin_ru:AdditionalGoodsDescription/catComFin_ru:Manufacturer"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" height="auto">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="catComFin_ru:AdditionalGoodsDescription/catComFin_ru:TradeMark"/>
                        </td>
                        <td align="right" height="auto">
                           <xsl:value-of select="catComFin_ru:AdditionalGoodsDescription/catComFin_ru:GoodsMark"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" height="auto">
                           <xsl:value-of select="catComFin_ru:AdditionalGoodsDescription/catComFin_ru:GoodsModel"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" height="auto">
                           <xsl:value-of select="catComFin_ru:AdditionalGoodsDescription/catComFin_ru:GoodsStandart"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </xsl:when>
               <xsl:otherwise>
                  <tbody>
                     <tr>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:GoodMarking">
                              <xsl:apply-templates/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:GoodsCode">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:SupplementaryQualifierName">
                              <xsl:apply-templates/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:GoodsDescription">
                              <xsl:apply-templates/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:GoodsQuantity">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:MeasureUnitQualifierName">
                              <xsl:apply-templates/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:GrossWeightQuantity">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:NetWeightQuantity">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:Price">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:TotalCost">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                           <br/>(<xsl:value-of select="catComFin_ru:GoodsQuantity * catComFin_ru:Price"/>)
                        </td>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:Discount">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <xsl:if test="catComFin_ru:OtherCharges[1]">
                           <td height="auto" width="69">
                              <xsl:value-of select="catComFin_ru:OtherCharges/catComFin_ru:ChargeType"/>
                           </td>
                           <td height="auto" width="69">
                              <xsl:value-of select="catComFin_ru:OtherCharges/catComFin_ru:ChargeAmount"/>
                           </td>
                        </xsl:if>
                        <td height="auto">
                           <xsl:for-each select="catComFin_ru:OriginCountryCode">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                        <tr>
                           <xsl:for-each select="catComFin_ru:OtherCharges">
                              <xsl:if test="position()>1">
                                 <tr>
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
                                    <td height="auto">
                                       <xsl:value-of select="catComFin_ru:ChargeType"/>
                                    </td>
                                    <td height="auto">
                                       <xsl:value-of select="catComFin_ru:ChargeAmount"/>
                                    </td>
                                    <td/>
                                 </tr>
                              </xsl:if>
                           </xsl:for-each>
                        </tr>
                     </tr>
                  </tbody>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
      </table>
      <xsl:for-each select="inv:DeliveryTerms">
         <span style="font-style:italic; font-weight:bold; ">Условия поставки:</span> 
            <br/>
         <table border="1" width="100%">
            <tbody>
               <tr>
                  <td width="151">
                     <xsl:for-each select="catComFin_ru:DeliveryTermsNumericCode">Код:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
                  <td width="170">
                     <xsl:for-each select="catComFin_ru:DeliveryTermsStringCode">Код Инкотермс:
                                <xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
                  <td>
                     <xsl:for-each select="catComFin_ru:DeliveryPlace">Место:
                                <xsl:apply-templates/>
                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td width="151">
                     <xsl:for-each select="inv:Deadline">Срок доставки:
                                <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="."/>
                        </xsl:call-template>
                     </xsl:for-each>
                  </td>
                  <xsl:for-each select="catComFin_ru:InvoiceSaleTerms">
                     <td width="170">
                        <xsl:for-each select="catComFin_ru:SaleTermsCode">Код срока оплаты :
                                    <xsl:value-of select="."/>
                        </xsl:for-each>
                     </td>
                     <td>
                        <xsl:for-each select="catComFin_ru:SaleTermsDescription">Описание:
                                    <xsl:apply-templates/>
                        </xsl:for-each>
                     </td>
                  </xsl:for-each>
               </tr>
               <tr>
                  <td colspan="3">
                     <table width="100%">
                        <tbody>
                           <tr>
                              <td>Страна отправления:
                                            <xsl:for-each select="inv:DispatchCountryCode">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </td>
                              <td>Страна назначения:
                                            <xsl:for-each select="inv:DestinationCountryCode">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </td>
                              <td>Торгующая страна:
                                            <xsl:for-each select="inv:TradingCountryCode">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </td>
               </tr>
               <xsl:if test="catComFin_ru:TermsDescription">
                  <tr>
                     <td colspan="100%">
                        <xsl:for-each select="catComFin_ru:TermsDescription">
                           <xsl:value-of select="."/>
                           <xsl:if test="position()!=last()"> </xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
               </xsl:if>
            </tbody>
         </table>
      </xsl:for-each>
      <xsl:for-each select="inv:TransportMeans">
         <span style="font-style:italic; font-weight:bold; ">Транспортное средство:</span> 
            <br/>
         <table border="1" width="100%">
            <tr>
               <td width="169">Вид:
                        <xsl:for-each select="catComFin_ru:ModeCode">
                     <xsl:value-of select="."/>
                  </xsl:for-each>
               </td>
               <td width="311">Номер:
                        <xsl:for-each select="catComFin_ru:Number">
                     <xsl:value-of select="."/>
                  </xsl:for-each>
               </td>
               <td width="330">Страна принадлежности:
                        <xsl:for-each select="catComFin_ru:NationalityCode">
                     <xsl:value-of select="."/>
                  </xsl:for-each>
               </td>
               <td width="206">
                  <xsl:apply-templates select="catComFin_ru:MoverIndicator"/>
               </td>
            </tr>
         </table>
      </xsl:for-each>
      <span style="font-style:italic; font-weight:bold;">Дополнения, изменения приложения,
            спецификации:</span> 
        <table border="1">
         <tr align="center" bgcolor="silver">
            <td>Номер документа</td>
            <td>Дата</td>
         </tr>
         <xsl:for-each select="inv:Enclosure">
            <tr>
               <td>
                  <xsl:for-each select="cat_ru:PrDocumentNumber">
                     <xsl:value-of select="."/>
                  </xsl:for-each>
               </td>
               <td>
                  <xsl:for-each select="cat_ru:PrDocumentDate">
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="."/>
                     </xsl:call-template>
                  </xsl:for-each>
               </td>
            </tr>
         </xsl:for-each>
      </table>
	  <xsl:if test="inv:Mark">
		  <table>
			  <tbody>
				 <tr>
				   <td align="left" class="graph" style="width:150mm;border-right: 0px;">
					  <xsl:value-of select="inv:Mark/catComFin_ru:MarkKind"/> <br/>
					  <xsl:value-of select="inv:Mark/catComFin_ru:ResultControl"/>
				   </td>
				   <td align="right" class="graphMain" style="width:45mm;border-left: 0px;" valign="bottom">
					  <b><i>Отметка:</i></b>
					  <u>
						 <xsl:choose>
							<xsl:when test="(inv:Mark/catComFin_ru:MarkSing='true' or inv:Mark/catComFin_ru:MarkSing='t' or inv:Mark/catComFin_ru:MarkSing='1')">
									Присутствует
									</xsl:when>
							<xsl:otherwise> Отсутствует</xsl:otherwise>
						 </xsl:choose>
					  </u>
				   </td>
				 </tr>
			  </tbody>
		  </table>
      </xsl:if>
   </xsl:template>
   <xsl:template match="catComFin_ru:MoverIndicator">
      <xsl:if test=". = '1' or . = 'true' or . = 't' ">Ведущее</xsl:if>
   </xsl:template>
</xsl:stylesheet>
