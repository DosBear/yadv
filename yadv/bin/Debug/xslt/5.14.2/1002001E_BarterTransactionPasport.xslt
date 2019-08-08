<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="catComFin_ru cat_ru btp" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:btp="urn:customs.ru:Information:CommercialFinanceDocuments:BarterTransactionPasport:5.10.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="btp:BarterTransactionPasport">
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
                        <xsl:apply-templates select="btp:Registration/btp:PasportID"/>
                        от
                        <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="btp:Registration/btp:IssueDate"/>
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
                           <xsl:value-of select="btp:MFER/catComFin_ru:Name"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Почтовый адрес -</td>
                        <td>
                           <xsl:apply-templates select="btp:MFER/catComFin_ru:Address"/>
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
                           <xsl:value-of select="btp:RussianCompany/btp:Name"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Код ОКПО -</td>
                        <td>
                           <xsl:value-of select="btp:RussianCompany/btp:OKPOID"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Код налогоплательщика -</td>
                        <td>
                           <xsl:value-of select="btp:RussianCompany/btp:INNID"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Адрес -</td>
                        <td>
                           <xsl:apply-templates select="btp:RussianCompany/btp:PostalAddress"/>
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
                           <xsl:value-of select="btp:ForeignContractor/btp:Name"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Страна -</td>
                        <td>
                           <xsl:value-of select="btp:ForeignContractor/btp:CountryCode"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Адрес -</td>
                        <td>
                           <xsl:apply-templates select="btp:ForeignContractor/btp:LegalAddress"/>
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
                           <xsl:value-of select="btp:ContractTerms/btp:Contract/cat_ru:PrDocumentNumber"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:45mm;">Последняя дата -</td>
                        <td style="width:45mm;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="btp:ContractTerms/btp:LastDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Дата -</td>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="btp:ContractTerms/btp:Contract/cat_ru:PrDocumentDate"/>
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
                           <xsl:value-of select="btp:ContractTerms/btp:Amount"/>
                           <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                </td>
                        <td class="graph">код -
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td>
                           <xsl:value-of select="btp:ContractTerms/btp:PaymentModeCode"/>
                           <xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
                                </td>
                     </tr>
                     <tr>
                        <td class="graph">Код валюты цены -
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td>
                           <xsl:value-of select="btp:ContractTerms/btp:CurrencyCode"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph">Срок встречной поставки -
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td>
                           <xsl:value-of select="btp:ContractTerms/btp:DueDateCode"/>
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
                           <xsl:value-of select="btp:PermitPayment/cat_ru:PrDocumentNumber"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:45mm;">Дата -</td>
                        <td style="width:45mm;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="btp:PermitPayment/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Отсрочка -</td>
                        <td colspan="3">
                           <xsl:value-of select="btp:PermitPayment/btp:Deferment"/>
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
                           <xsl:value-of select="btp:MFERSignature/cat_ru:PersonPost"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:45mm;">Должность</td>
                        <td style="width:45mm;">
                           <xsl:value-of select="btp:RussianCompanySignature/cat_ru:PersonPost"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">И.О.Фамилия</td>
                        <td>
                           <xsl:value-of select="btp:MFERSignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="btp:MFERSignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="btp:MFERSignature/cat_ru:PersonMiddleName"/>
                        </td>
                        <td class="graph">И.О.Фамилия</td>
                        <td>
                           <xsl:value-of select="btp:RussianCompanySignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="btp:RussianCompanySignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="btp:RussianCompanySignature/cat_ru:PersonMiddleName"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">М.П. Дата:</td>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="btp:MFERSignature/cat_ru:IssueDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph">М.П. Дата:</td>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="btp:RussianCompanySignature/cat_ru:IssueDate"/>
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
                     <xsl:apply-templates select="btp:SpecialComments"/>
                  </tbody>
               </table>
            </div>
            <div class="page">
               <h1 style="page-break-before: always;">Приложение к паспорту бартерной сделки</h1>
               <p class="NumberDate">№
                        <xsl:apply-templates select="btp:Registration/btp:PasportID"/>
                        от
                        <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="btp:Registration/btp:IssueDate"/>
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
                           <xsl:for-each select="btp:Enclosure[btp:ExportIndicator='true' or btp:ExportIndicator='t' or btp:ExportIndicator='1']">
                              <xsl:choose>
                                 <xsl:when test="position()=1">
                                    <xsl:value-of select="btp:DeliveryTermsStringCode"/>
                                 </xsl:when>
                                 <xsl:when test="position()&lt;5">,
                                                <xsl:value-of select="btp:DeliveryTermsStringCode"/>
                                 </xsl:when>
                                 <xsl:otherwise/>
                              </xsl:choose>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <xsl:for-each select="btp:Enclosure[btp:ExportIndicator='true' or btp:ExportIndicator='t' or btp:ExportIndicator='1']">
                        <xsl:call-template name="application"/>
                     </xsl:for-each>
                     <xsl:if test="not(btp:Enclosure[btp:ExportIndicator='true' or btp:ExportIndicator='t' or btp:ExportIndicator='1'])">
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
                           <xsl:value-of select="btp:Enclosure/btp:ExportGoodsCost/btp:Cost2"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="2">Импорт</td>
                        <td class="graph">Базисы поставки</td>
                        <td colspan="2">
                           <xsl:for-each select="btp:Enclosure[btp:ExportIndicator!='true' or btp:ExportIndicator!='t' or btp:ExportIndicator!='1' or not(btp:ExportIndicator)]">
                              <xsl:choose>
                                 <xsl:when test="position()=1">
                                    <xsl:value-of select="btp:DeliveryTermsStringCode"/>
                                 </xsl:when>
                                 <xsl:when test="position()&lt;5">,
                                                <xsl:value-of select="btp:DeliveryTermsStringCode"/>
                                 </xsl:when>
                                 <xsl:otherwise/>
                              </xsl:choose>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <xsl:for-each select="btp:Enclosure[btp:ExportIndicator!='true' or btp:ExportIndicator!='t' or btp:ExportIndicator!='1' or not(btp:ExportIndicator)]">
                        <xsl:call-template name="application"/>
                     </xsl:for-each>
                     <xsl:if test="not(btp:Enclosure[btp:ExportIndicator!='true' or btp:ExportIndicator!='t' or btp:ExportIndicator!='1' or not(btp:ExportIndicator)])">
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
                           <xsl:value-of select="btp:Enclosure/btp:ImportGoodsCost/btp:Cost2"/>
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
                           <xsl:value-of select="btp:MFERSignature/cat_ru:PersonPost"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:45mm;">Должность</td>
                        <td style="width:45mm;">
                           <xsl:value-of select="btp:RussianCompanySignature/cat_ru:PersonPost"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">И.О.Фамилия</td>
                        <td>
                           <xsl:value-of select="btp:MFERSignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="btp:MFERSignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="btp:MFERSignature/cat_ru:PersonMiddleName"/>
                        </td>
                        <td class="graph">И.О.Фамилия</td>
                        <td>
                           <xsl:value-of select="btp:RussianCompanySignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="btp:RussianCompanySignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="btp:RussianCompanySignature/cat_ru:PersonMiddleName"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">М.П. Дата:</td>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="btp:MFERSignature/cat_ru:IssueDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph">М.П. Дата:</td>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="btp:RussianCompanySignature/cat_ru:IssueDate"/>
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
   <xsl:template match="btp:PostalAddress | catComFin_ru:Address | btp:LegalAddress">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="btp:PostalAddress/* | catComFin_ru:Address/* | btp:LegalAddress/*">
      <xsl:if test="preceding-sibling::*[1]">,</xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="btp:SpecialComments">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="btp:Explanations | btp:ExportAmount | btp:ImportAmount">
      <tr>
         <td>
            <xsl:value-of select="."/>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="btp:Registration/btp:PasportID">
      <xsl:value-of select="btp:Sign"/>/<xsl:value-of select="btp:OKPOID"/>/<xsl:value-of select="btp:Number3"/>/<xsl:value-of select="btp:Number10"/>
   </xsl:template>
   <xsl:template name="application">
      <tr>
         <td>
            <xsl:value-of select="btp:GoodsTNVEDCode"/> -
                <xsl:value-of select="btp:GoodsDescription"/> -
					<xsl:value-of select="btp:ServiceModeCode"/>
         </td>
         <td>
            <!--xsl:value-of select="btp:MeasureUnitQualifierCode"/-->
            <xsl:value-of select="btp:SupplementaryQualifierName"/>
         </td>
         <td>
            <xsl:value-of select="btp:GoodsQuantity"/>
         </td>
         <td>
            <xsl:value-of select="btp:Price"/>
         </td>
         <td>
            <xsl:value-of select="btp:Cost1"/>
         </td>
      </tr>
   </xsl:template>
</xsl:stylesheet>
