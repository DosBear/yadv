<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="catComFin_ru cat_ru bts" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:bts="urn:customs.ru:Information:CommercialFinanceDocuments:BarterTransactionPasport:5.10.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template match="bts:BarterTransactionPasport">
      <html>
         <head>
            <title>Паспорт бартерной сделки</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    .bordered {
                        border: solid 1pt #000000;
                        padding-top: 4pt;
                        padding-bottom: 4pt;
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

                    td {
                        font-family: Courier;
                    }

                    .graphMain {
                        font-family: Arial;
                        font-size: 9pt;
                        font-weight: bold;
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
               <h1>Паспорт бартерной сделки</h1>
               <p class="NumberDate">№
                        <xsl:apply-templates select="bts:Registration/bts:PasportID"/>
                        от
                        <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="bts:Registration/bts:IssueDate"/>
                  </xsl:call-template>
               </p>
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" class="bordered" colspan="2">1. Реквизиты Управления уполномоченного
                                    МВЭС России:
                                </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45mm;">Наименование -</td>
                        <td style="width:135mm;">
                           <xsl:value-of select="bts:MFER/catComFin_ru:Name"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Почтовый адрес -</td>
                        <td>
                           <xsl:apply-templates select="bts:MFER/catComFin_ru:Address"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="3" cellspacing="0" style="margin-top:12pt;" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" class="bordered" colspan="2">2. Реквизиты российского лица:</td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45mm;">Наименование -</td>
                        <td style="width:135mm;">
                           <xsl:value-of select="bts:RussianCompany/bts:Name"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Код ОКПО -</td>
                        <td>
                           <xsl:value-of select="bts:RussianCompany/bts:OKPOID"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Код налогоплательщика -</td>
                        <td>
                           <xsl:value-of select="bts:RussianCompany/bts:INNID"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Адрес -</td>
                        <td>
                           <xsl:apply-templates select="bts:RussianCompany/bts:PostalAddress"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="3" cellspacing="0" style="margin-top:12pt;" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" class="bordered" colspan="2">3. Реквизиты иностранного лица:</td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45mm;">Наименование -</td>
                        <td style="width:135mm;">
                           <xsl:value-of select="bts:ForeignContractor/bts:Name"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Страна -</td>
                        <td>
                           <xsl:value-of select="bts:ForeignContractor/bts:CountryCode"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Адрес -</td>
                        <td>
                           <xsl:apply-templates select="bts:ForeignContractor/bts:LegalAddress"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="3" cellspacing="0" style="margin-top:12pt;" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" class="bordered" colspan="4">4. Реквизиты и условия договора:</td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45mm;">Номер -</td>
                        <td style="width:45mm;">
                           <xsl:value-of select="bts:ContractTerms/bts:Contract/cat_ru:PrDocumentNumber"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:45mm;">Последняя дата -</td>
                        <td style="width:45mm;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="bts:ContractTerms/bts:LastDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Дата -</td>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="bts:ContractTerms/bts:Contract/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph">Форма расчетов:</td>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Сумма договора -</td>
                        <td>
                           <xsl:value-of select="bts:ContractTerms/bts:Amount"/>
                           <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                </td>
                        <td class="graph">код -
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td>
                           <xsl:value-of select="bts:ContractTerms/bts:PaymentModeCode"/>
                           <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                </td>
                     </tr>
                     <tr>
                        <td class="graph">Код валюты цены -
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td>
                           <xsl:value-of select="bts:ContractTerms/bts:CurrencyCode"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph">Срок встречной поставки -
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td>
                           <xsl:value-of select="bts:ContractTerms/bts:DueDateCode"/>
                           <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="3" cellspacing="0" style="margin-top:12pt;" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" class="bordered" colspan="4">5. Разрешение МВЭС России:</td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45mm;">Номер -</td>
                        <td style="width:45mm;">
                           <xsl:value-of select="bts:PermitPayment/cat_ru:PrDocumentNumber"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:45mm;">Дата -</td>
                        <td style="width:45mm;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="bts:PermitPayment/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Отсрочка -</td>
                        <td colspan="3">
                           <xsl:value-of select="bts:PermitPayment/bts:Deferment"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="3" cellspacing="0" style="margin-top:12pt;" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" class="bordered" colspan="4">6. Подписи уполномоченных лиц:</td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2">От Управления уполномоченного МВЭС России:</td>
                        <td class="graph" colspan="2">От российского лица:</td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45mm;">Должность</td>
                        <td style="width:45mm;">
                           <xsl:value-of select="bts:MFERSignature/cat_ru:PersonPost"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:45mm;">Должность</td>
                        <td style="width:45mm;">
                           <xsl:value-of select="bts:RussianCompanySignature/cat_ru:PersonPost"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">И.О.Фамилия</td>
                        <td>
                           <xsl:value-of select="bts:MFERSignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="bts:MFERSignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="bts:MFERSignature/cat_ru:PersonMiddleName"/>
                        </td>
                        <td class="graph">И.О.Фамилия</td>
                        <td>
                           <xsl:value-of select="bts:RussianCompanySignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="bts:RussianCompanySignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="bts:RussianCompanySignature/cat_ru:PersonMiddleName"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">М.П. Дата:</td>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="bts:MFERSignature/cat_ru:IssueDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph">М.П. Дата:</td>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="bts:RussianCompanySignature/cat_ru:IssueDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="3" cellspacing="0" style="margin-top:12pt;" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" class="bordered">7. Особые отметки</td>
                     </tr>
                     <xsl:apply-templates select="bts:SpecialComments"/>
                  </tbody>
               </table>
            </div>
            <div class="page">
               <h1 style="page-break-before: always;">Приложение к паспорту бартерной сделки</h1>
               <p class="NumberDate">№
                        <xsl:apply-templates select="bts:Registration/bts:PasportID"/>
                        от
                        <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="bts:Registration/bts:IssueDate"/>
                  </xsl:call-template>
               </p>
               <table border="1" cellpadding="3" cellspacing="0" style="margin-top:12pt;" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:80mm;">1. Наименование товара, работ, услуг, результатов
                                    интеллектуальной деятельности (коды)
                                </td>
                        <td class="graph" style="width:25mm;">2. Единица измерения</td>
                        <td class="graph" style="width:25mm;">3. Количество</td>
                        <td class="graph" style="width:25mm;">5. Цена за единицу</td>
                        <td class="graph" style="width:25mm;">6. Стоимость (тыс. единиц)</td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="2">Экспорт</td>
                        <td class="graph">4. Базисы поставки</td>
                        <td colspan="2">
                           <xsl:for-each select="bts:Enclosure[bts:ExportIndicator='true' or bts:ExportIndicator='t' or bts:ExportIndicator='1']">
                              <xsl:choose>
                                 <xsl:when test="position()=1">
                                    <xsl:value-of select="bts:DeliveryTermsStringCode"/>
                                 </xsl:when>
                                 <xsl:when test="position()&lt;5">,
                                                <xsl:value-of select="bts:DeliveryTermsStringCode"/>
                                 </xsl:when>
                                 <xsl:otherwise/>
                              </xsl:choose>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <xsl:for-each select="bts:Enclosure[bts:ExportIndicator='true' or bts:ExportIndicator='t' or bts:ExportIndicator='1']">
                        <xsl:call-template name="application"/>
                     </xsl:for-each>
                     <xsl:if test="not(bts:Enclosure[bts:ExportIndicator='true' or bts:ExportIndicator='t' or bts:ExportIndicator='1'])">
                        <tr>
                           <td>
                              <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                    </td>
                           <td>
                              <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                    </td>
                           <td>
                              <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                    </td>
                           <td>
                              <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                    </td>
                           <td>
                              <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                    </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td/>
                        <td/>
                        <td/>
                        <td class="graph">Итого:</td>
                        <td>
                           <xsl:value-of select="bts:Enclosure/bts:ExportGoodsCost/bts:Cost2"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="2">Импорт</td>
                        <td class="graph">Базисы поставки</td>
                        <td colspan="2">
                           <xsl:for-each select="bts:Enclosure[bts:ExportIndicator!='true' or bts:ExportIndicator!='t' or bts:ExportIndicator!='1' or not(bts:ExportIndicator)]">
                              <xsl:choose>
                                 <xsl:when test="position()=1">
                                    <xsl:value-of select="bts:DeliveryTermsStringCode"/>
                                 </xsl:when>
                                 <xsl:when test="position()&lt;5">,
                                                <xsl:value-of select="bts:DeliveryTermsStringCode"/>
                                 </xsl:when>
                                 <xsl:otherwise/>
                              </xsl:choose>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <xsl:for-each select="bts:Enclosure[bts:ExportIndicator!='true' or bts:ExportIndicator!='t' or bts:ExportIndicator!='1' or not(bts:ExportIndicator)]">
                        <xsl:call-template name="application"/>
                     </xsl:for-each>
                     <xsl:if test="not(bts:Enclosure[bts:ExportIndicator!='true' or bts:ExportIndicator!='t' or bts:ExportIndicator!='1' or not(bts:ExportIndicator)])">
                        <tr>
                           <td>
                              <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                    </td>
                           <td>
                              <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                    </td>
                           <td>
                              <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                    </td>
                           <td>
                              <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                    </td>
                           <td>
                              <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                    </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td/>
                        <td/>
                        <td/>
                        <td class="graph">Итого:</td>
                        <td>
                           <xsl:value-of select="bts:Enclosure/bts:ImportGoodsCost/bts:Cost2"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="3" cellspacing="0" style="margin-top:12pt;" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" colspan="2">От Управления уполномоченного МВЭС России:</td>
                        <td class="graph" colspan="2">От российского лица:</td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45mm;">Должность</td>
                        <td style="width:45mm;">
                           <xsl:value-of select="bts:MFERSignature/cat_ru:PersonPost"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:45mm;">Должность</td>
                        <td style="width:45mm;">
                           <xsl:value-of select="bts:RussianCompanySignature/cat_ru:PersonPost"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">И.О.Фамилия</td>
                        <td>
                           <xsl:value-of select="bts:MFERSignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="bts:MFERSignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="bts:MFERSignature/cat_ru:PersonMiddleName"/>
                        </td>
                        <td class="graph">И.О.Фамилия</td>
                        <td>
                           <xsl:value-of select="bts:RussianCompanySignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="bts:RussianCompanySignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="bts:RussianCompanySignature/cat_ru:PersonMiddleName"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">М.П. Дата:</td>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="bts:MFERSignature/cat_ru:IssueDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph">М.П. Дата:</td>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="bts:RussianCompanySignature/cat_ru:IssueDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="bts:PostalAddress | catComFin_ru:Address | bts:LegalAddress">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="bts:PostalAddress/* | catComFin_ru:Address/* | bts:LegalAddress/*">
      <xsl:if test="preceding-sibling::*[1]">,</xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="bts:SpecialComments">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="bts:Explanations | bts:ExportAmount | bts:ImportAmount">
      <tr>
         <td>
            <xsl:value-of select="."/>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="bts:Registration/bts:PasportID">
      <xsl:value-of select="bts:Sign"/>/<xsl:value-of select="bts:OKPOID"/>/<xsl:value-of select="bts:Number3"/>/<xsl:value-of select="bts:Number10"/>
   </xsl:template>
   <xsl:template name="application">
      <tr>
         <td>
            <xsl:value-of select="bts:GoodsTNVEDCode"/> -
                <xsl:value-of select="bts:GoodsDescription"/> -
					<xsl:value-of select="bts:ServiceModeCode"/>
         </td>
         <td>
            <!--xsl:value-of select="bts:MeasureUnitQualifierCode"/-->
            <xsl:value-of select="bts:SupplementaryQualifierName"/>
         </td>
         <td>
            <xsl:value-of select="bts:GoodsQuantity"/>
         </td>
         <td>
            <xsl:value-of select="bts:Price"/>
         </td>
         <td>
            <xsl:value-of select="bts:Cost1"/>
         </td>
      </tr>
   </xsl:template>
</xsl:stylesheet>
