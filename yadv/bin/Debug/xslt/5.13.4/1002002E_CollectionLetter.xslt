<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:col="urn:customs.ru:Information:CommercialFinanceDocuments:CollectionLetter:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="col:Address">
      <xsl:if test="cat_ru:PostalCode">Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/> </xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="col:CollectionLetter">
      <html>
         <head>
            <title>Инкассовое поручение</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    table {
                        border: 0;
                        width: 100%;
                        border-collapse: collapse;
                    }

                    td {
                        font-size: 6.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 400;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: top;
                        /*white-space: nowrap;*/
                        padding-left: 4pt
                    }

                    td.bold {
                        font-size: 8.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 700;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: bottom;
                        /*white-space: nowrap;*/
                    }

                    td.value {
                        font-size: 10.0pt;
                        color: windowtext;
                        font-weight: 400;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: top;
                        /*white-space: nowrap;*/
                    }

                    td.border-left {
                        border-left: medium none;
                        border-right: .5pt solid black;
                    }

                    td.border {
                        border-left: .5pt solid windowtext;
                        border-right: .5pt solid windowtext;
                        border-top: .5pt solid windowtext;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-left {
                        border-left: .5pt solid windowtext;
                        border-right: medium none;
                        border-top: medium none;
                        border-bottom: medium none;
                    }

                    td.border-right {
                        border-left: medium none;
                        border-right: .5pt solid windowtext;
                        border-top: medium none;
                        border-bottom: medium none;
                    }

                    td.border-top {
                        border-left: medium none;
                        border-right: medium none;
                        border-top: .5pt solid windowtext;
                        border-bottom: medium none;
                    }

                    td.border-bottom {
                        border-left: medium none;
                        border-right: medium none;
                        border-top: medium none;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-top-bottom {
                        border-left: medium none;
                        border-right: medium none;
                        border-top: .5pt solid windowtext;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-top-right {
                        border-left: medium none;
                        border-right: .5pt solid windowtext;
                        border-top: .5pt solid windowtext;
                        border-bottom: medium none;
                    }

                    td.border-top-right-bottom {
                        border-left: medium none;
                        border-right: .5pt solid windowtext;
                        border-top: .5pt solid windowtext;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-left-right-bottom {
                        border-left: .5pt solid windowtext;
                        border-right: .5pt solid windowtext;
                        border-top: medium none;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-right-bottom {
                        border-left: medium none;
                        border-right: .5pt solid windowtext;
                        border-top: medium none;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-left-bottom {
                        border-left: .5pt solid windowtext;
                        border-right: medium none;
                        border-top: medium none;
                        border-bottom: .5pt solid windowtext;
                    }

                    td.border-left-right {
                        border-left: .5pt solid windowtext;
                        border-right: .5pt solid windowtext;
                        border-top: medium none;
                        border-bottom: medium none;
                    }

                    span.bold {
                        font-size: 12.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 700;
                        font-style: normal;
                    }

                    span.value {
                        font-size: 12.0pt;
                        color: windowtext;
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

                    p.number-date {
                        font-weight: bold;
                    }

                    p.value {
                        margin-top: 1.0pt;
                        margin-right: 0cm;
                        margin-bottom: 0cm;
                        margin-left: 0cm;
                        text-align: justify;
                        font-size: 10.0pt;
                        font-family: Arial;
                    }

                    .bordered {
                        border: solid 1pt #000000;
                        padding-top: 4pt;
                        padding-bottom: 4pt;
                    }

                    .underlined {
                        border-bottom: solid 0.8pt #000000;
                    }

                    .graph {
                        font-family: Arial;
                        font-size: 7pt;
                    }

                    .graph-number {
                        font-size: 9pt;
                        font-weight: bold;
                    }

                    .graph-big {
                        font-size: 9pt;
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
               <table>
                  <tr style="height: 14.05pt">
                     <td colspan="5" style="width: 93.95pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext" valign="top" width="125">
                        <p class="value">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="col:ReceiptDate"/>
                           </xsl:call-template>
                        </p>
                     </td>
                     <td colspan="2" style="width: 53.65pt; height: 14.05pt" valign="top" width="72">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="4" style="width: 93.95pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext" valign="top" width="125">
                        <p class="value">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="col:ChargeOffDate"/>
                           </xsl:call-template>
                        </p>
                     </td>
                     <td colspan="10" style="width: 201.5pt; height: 14.05pt" valign="top" width="269">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="3" style="width: 40.55pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="54">
                        <p class="value">0401071</p>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="5" style="width: 93.95pt; height: 14.05pt" valign="top" width="125">
                        <p class="value">
                           <span style="font-size: 8.0pt">Поступ. в банк плат.</span>
                        </p>
                     </td>
                     <td colspan="2" style="width: 53.65pt; height: 14.05pt" valign="top" width="72">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="4" style="width: 140pt; height: 14.05pt; border: medium none" valign="top" width="125">
                        <p class="value">
                           <span style="font-size: 8.0pt">Списано со сч. плат.</span>
                        </p>
                     </td>
                     <td colspan="10" style="width: 201.5pt; height: 14.05pt" valign="top" width="269">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="3" style="width: 40.55pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="11" style="width: 241.55pt; height: 14.05pt" valign="top" width="322">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="10" style="width: 201.5pt; height: 14.05pt" valign="top" width="269">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td rowspan="2" style="width: 10.6pt; height: 14.05pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none" valign="top" width="14">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" rowspan="2" style="width: 29.95pt; height: 14.05pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="40">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="11" style="width: 241.55pt; height: 14.05pt" valign="top" width="322">
                        <p class="value">ИНКАССОВОЕ ПОРУЧЕНИЕ №
                                    <xsl:value-of select="col:DocumentReference/cat_ru:PrDocumentNumber"/>
                        </p>
                     </td>
                     <td align="center" colspan="5" style="width: 94.05pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext" valign="top" width="125">
                        <p class="value">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="col:DocumentReference/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                        </p>
                     </td>
                     <td style="width: 13.45pt; height: 14.05pt" valign="top" width="18">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="4" style="width: 94.0pt; height: 14.05pt" valign="top" width="125">
                        <p class="value">
                           <xsl:if test="col:PaymentModeCode = 0">не заполнено</xsl:if>
                           <xsl:if test="col:PaymentModeCode = 1">электронно</xsl:if>
                           <xsl:if test="col:PaymentModeCode = 2">почта</xsl:if>
                           <xsl:if test="col:PaymentModeCode = 3">телефграф</xsl:if>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="11" style="width: 241.55pt; height: 14.05pt" valign="top" width="322">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" colspan="5" style="height: 18pt; padding: 0; font-size: 8pt;" valign="top" width="125">
                                Дата
                            </td>
                     <td style="width: 13.45pt; height: 14.05pt" valign="top" width="18">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" colspan="4" style="width: 94.0pt; font-size: 8pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="125">
                                Вид платежа
                            </td>
                     <td colspan="3" style="width: 40.55pt; height: 14.05pt" valign="top" width="54"/>
                  </tr>
                  <tr style="height: 42.2pt">
                     <td colspan="2" style="width: 53.65pt; height: 42.2pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none" valign="top" width="72">
                        <p class="value">Сумма<br/>прописью
                                </p>
                     </td>
                     <td colspan="22" style="width: 429.95pt; height: 42.2pt" valign="top" width="573">
                        <p class="value">
                           <xsl:value-of select="col:ValueSpelledOut"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="6" style="width: 134.2pt; height: 14.05pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="179">
                        <p class="value">ИНН
                                    <xsl:value-of select="col:Payer/catComFin_ru:INN"/>
                        </p>
                     </td>
                     <td colspan="6" style="width: 134.25pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="179">
                        <p class="value">КПП
                                    <xsl:value-of select="col:Payer/catComFin_ru:KPP"/>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="54">
                        <p class="value">Сумма</p>
                     </td>
                     <td colspan="9" style="width: 174.85pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="233">
                        <p class="value">
                           <xsl:value-of select="col:PaymentAmount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="12" rowspan="3" style="width: 268.45pt" valign="top" width="358">
                        <p class="value">
                           <xsl:value-of select="col:Payer/catComFin_ru:OrganizationName"/>
                           <xsl:if test="col:Payer/col:Address">//<xsl:apply-templates select="col:Payer/col:Address"/>
                           </xsl:if>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 174.85pt; height: 14.05pt" valign="top" width="233">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 174.85pt; height: 14.05pt" valign="top" width="233">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="54">
                        <p class="value">Сч.№</p>
                     </td>
                     <td colspan="9" style="width: 174.85pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="233">
                        <p class="value">
                           <xsl:value-of select="col:Payer/catComFin_ru:Bank/catComFin_ru:PersonalAccount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="12" style="width: 268.45pt; height: 14.05pt" valign="top" width="358">
                        <p class="value">Плательщик</p>
                     </td>
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 174.85pt; height: 14.05pt" valign="top" width="233">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="12" rowspan="2" style="width: 268.45pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="358">
                        <p class="value">
                           <xsl:value-of select="col:Payer/catComFin_ru:Bank/catComFin_ru:BankName"/>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none" valign="top" width="54">
                        <p class="value">БИК</p>
                     </td>
                     <td colspan="9" style="width: 174.85pt; height: 14.05pt" valign="top" width="233">
                        <p class="value">
                           <xsl:value-of select="col:Payer/catComFin_ru:Bank/catComFin_ru:BIC"/>
                        </p>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="54">
                        <p class="value">Сч.№</p>
                     </td>
                     <td colspan="9" style="width: 174.85pt; height: 14.05pt" valign="top" width="233">
                        <p class="value">
                           <xsl:value-of select="col:Payer/catComFin_ru:Bank/catComFin_ru:CorrespAccount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="12" style="width: 268.45pt; height: 14.05pt" valign="top" width="358">
                        <p class="value">Банк плательщика</p>
                     </td>
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 174.85pt; height: 14.05pt" valign="top" width="233">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="12" rowspan="2" style="width: 268.45pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="358">
                        <p class="value">
                           <xsl:value-of select="col:Payee/catComFin_ru:Bank/catComFin_ru:BankName"/>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="54">
                        <p class="value">БИК</p>
                     </td>
                     <td colspan="9" style="width: 174.85pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="233">
                        <p class="value">
                           <xsl:value-of select="col:Payee/catComFin_ru:Bank/catComFin_ru:BIC"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="54">
                        <p class="value">Сч.№</p>
                     </td>
                     <td colspan="9" style="width: 174.85pt; height: 14.05pt" valign="top" width="233">
                        <p class="value">
                           <xsl:value-of select="col:Payee/catComFin_ru:Bank/catComFin_ru:CorrespAccount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="12" style="width: 268.45pt; height: 14.05pt" valign="top" width="358">
                        <p class="value">Банк получателя</p>
                     </td>
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 174.85pt; height: 14.05pt" valign="top" width="233">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="6" style="width: 134.2pt; height: 14.05pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="179">
                        <p class="value">ИНН
                                    <xsl:value-of select="col:Payee/catComFin_ru:INN"/>
                        </p>
                     </td>
                     <td colspan="6" style="width: 134.25pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="179">
                        <p class="value">КПП
                                    <xsl:value-of select="col:Payee/catComFin_ru:KPP"/>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none" valign="top" width="54">
                        <p class="value">Сч.№</p>
                     </td>
                     <td colspan="9" style="width: 174.85pt; height: 14.05pt" valign="top" width="233">
                        <p class="value">
                           <xsl:value-of select="col:Payee/catComFin_ru:Bank/catComFin_ru:PersonalAccount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="12" rowspan="3" style="width: 268.45pt" valign="top" width="358">
                        <p class="value">
                           <xsl:value-of select="col:Payee/catComFin_ru:OrganizationName"/>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 174.85pt; height: 14.05pt" valign="top" width="233">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border: 1.0pt solid windowtext" valign="top" width="54">
                        <p class="value">Вид оп.</p>
                     </td>
                     <td colspan="3" style="width: 53.7pt; height: 14.05pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="72">
                        <p class="value">
                           <xsl:value-of select="col:TransactionKind"/>
                        </p>
                     </td>
                     <td colspan="2" rowspan="2" style="width: 53.65pt; height: 14.05pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="72">
                        <p class="value">Очер.плат.</p>
                     </td>
                     <td colspan="4" style="width: 67.5pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="90">
                        <p class="value">
                           <xsl:value-of select="col:Priority"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext" valign="top" width="54">
                        <p class="value">Наз.пл.</p>
                     </td>
                     <td colspan="3" style="width: 53.7pt; height: 14.05pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none" valign="top" width="72">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="4" style="width: 67.5pt; height: 14.05pt" valign="top" width="90">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="12" style="width: 268.45pt; height: 14.05pt" valign="top" width="358">
                        <p class="value">Получатель</p>
                     </td>
                     <td colspan="3" style="width: 40.3pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none" valign="top" width="54">
                        <p class="value">Код</p>
                     </td>
                     <td colspan="3" style="width: 53.7pt; height: 14.05pt" valign="top" width="72">
                        <p class="value">
                           <xsl:if test="col:DepartmentalInfo/col:UniqueID">
                              <xsl:value-of select="col:DepartmentalInfo/col:UniqueID"/>
                           </xsl:if>
                        </p>
                     </td>
                     <td colspan="2" style="width: 53.65pt; height: 14.05pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none" valign="top" width="72">
                        <p class="value">Рез. поле</p>
                     </td>
                     <td colspan="4" style="width: 67.5pt; height: 14.05pt" valign="top" width="90">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="4" style="width: 80.8pt; height: 14.05pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="107">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="4" style="width: 93.95pt; height: 14.05pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="125">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td style="width: 18.8pt; height: 14.05pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="25">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="4" style="width: 88.55pt; height: 14.05pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="118">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="6" style="width: 93.95pt; height: 14.05pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="125">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="4" style="width: 88.55pt; height: 14.05pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="118">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td style="width: 19.3pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="26">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 79.9pt">
                     <td colspan="24" style="width: 483.6pt" valign="top" width="645">
                        <p class="value">
                           <xsl:value-of select="col:Purpose"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="24" style="width: 483.6pt; height: 14.05pt" valign="top" width="645">
                        <p class="value">Назначение платежа</p>
                     </td>
                  </tr>
                  <tr style="height: 14.05pt">
                     <td colspan="6" style="width: 134.2pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="179">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="8" style="width: 161.05pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="215">
                        <p class="value">Подписи</p>
                     </td>
                     <td colspan="2" style="width: 40.35pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="8" style="width: 148.0pt; height: 14.05pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="197">
                        <p class="value">Отметки банка получателя</p>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="10" style="height: 20.25pt" valign="top" width="179"/>
                  </tr>
                  <tr style="height: 28.1pt">
                     <td colspan="6" style="width: 134.2pt; height: 28.1pt" valign="top" width="179">
                        <p class="value">М.П.</p>
                     </td>
                     <td class="value" colspan="8" style="width: 161.05pt; height: 28.1pt" valign="top" width="215">
                        <xsl:for-each select="col:DocumentSign">
							<xsl:value-of select="cat_ru:PersonSurname"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                            <xsl:value-of select="cat_ru:PersonName"/>
                            <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                            <xsl:if test="cat_ru:PersonMiddleName">
								<xsl:value-of select="cat_ru:PersonMiddleName"/>
                            </xsl:if>
                            <xsl:if test="cat_ru:PersonPost">/<xsl:value-of select="cat_ru:PersonPost"/>
                            </xsl:if>
                            <xsl:if test="cat_ru:IssueDate">
                                <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
                                </xsl:call-template>
                            </xsl:if>
                            <br/>
                        </xsl:for-each>
                     </td>
                     <td colspan="2" style="width: 40.35pt; height: 28.1pt" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td class="value" colspan="8" style="width: 148.0pt; height: 28.1pt" valign="top" width="197">
                        <xsl:for-each select="col:RecipBankMark">
                           <xsl:value-of select="catComFin_ru:BankName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonSurname"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="catComFin_ru:RecipSign/cat_ru:PersonMiddleName">
							   <xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonMiddleName"/>
							   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:if>
                           <xsl:if test="catComFin_ru:RecipSign/cat_ru:PersonPost">/<xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonPost"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:if>
                           <xsl:if test="catComFin_ru:RecipSign/cat_ru:IssueDate">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="catComFin_ru:RecipSign/cat_ru:IssueDate"/>
                              </xsl:call-template>
                           </xsl:if>
                           <br/>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr style="height: 3.4pt">
                     <td colspan="6" style="width: 134.2pt; height: 3.4pt" valign="top" width="179">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="8" style="width: 161.05pt; height: 3.4pt" valign="top" width="215">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" style="width: 40.35pt; height: 3.4pt" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="8" style="width: 148.0pt; height: 3.4pt" valign="top" width="197">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 6.05pt">
                     <td colspan="16" style="width: 335.6pt; height: 6.05pt" valign="top" width="447">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="8" style="width: 148.0pt; height: 6.05pt" valign="top" width="197">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="16" style="width: 335.6pt">
                        <table style="width:100%">
                           <tbody>
                              <tr style="height: 42.25pt">
                                 <td style="width: 30pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="36">
                                    <p class="value">№ ч.</p>
                                    <p class="value">плат.</p>
                                 </td>
                                 <td colspan="2" style="width: 40.3pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="54">
                                    <p class="value">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>№ плат.
                                                    ордера
                                                </p>
                                 </td>
                                 <td colspan="4" style="width: 67.35pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="90">
                                    <p class="value">Дата плат.</p>
                                    <p class="value">ордера</p>
                                 </td>
                                 <td colspan="2" style="width: 80.8pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="108">
                                    <p class="value">Сумма частичного платежа</p>
                                 </td>
                                 <td colspan="4" style="width: 80.55pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="108">
                                    <p class="value">Сумма остатка платежа</p>
                                 </td>
                                 <td colspan="3" style="width: 40.35pt; height: 41.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext" valign="top" width="56">
                                    <p class="value">Подпись</p>
                                 </td>
                              </tr>
                              <xsl:for-each select="col:PartPayment">
                                 <tr>
                                    <td class="value" style="width: 30pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="36">
                                       <xsl:value-of select="catComFin_ru:PartPaymentNum"/>
                                    </td>
                                    <td class="value" colspan="2" style="width: 40.3pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="54">
                                       <xsl:value-of select="catComFin_ru:PartPaymentPP"/>
                                    </td>
                                    <td class="value" colspan="4" style="width: 67.35pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="90">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="catComFin_ru:PartPaymentPPDate"/>
                                       </xsl:call-template>
                                    </td>
                                    <td class="value" colspan="2" style="width: 80.8pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="108">
                                       <xsl:value-of select="catComFin_ru:PartPaymentSumm"/>
                                    </td>
                                    <td class="value" colspan="4" style="width: 80.55pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="108">
                                       <xsl:value-of select="catComFin_ru:Remainder"/>
                                    </td>
                                    <td class="value" colspan="3" style="width: 40.35pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none" valign="top" width="56">
										<xsl:value-of select="catComFin_ru:PartPaymentSign/cat_ru:PersonSurname"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                                        <xsl:value-of select="catComFin_ru:PartPaymentSign/cat_ru:PersonName"/>
                                        <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:if test="catComFin_ru:PartPaymentSign/cat_ru:PersonMiddleName">
											<xsl:value-of select="catComFin_ru:PartPaymentSign/cat_ru:PersonMiddleName"/>
										</xsl:if>/
                                       <xsl:if test="catComFin_ru:PartPaymentSign/cat_ru:PersonPost">
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="catComFin_ru:PartPaymentSign/cat_ru:PersonPost"/>
                                       </xsl:if>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </tbody>
                        </table>
                     </td>
                     <td class="value" colspan="8" style="width: 148.0pt" valign="bottom" width="197">
                        <p class="value">Дата помещения в картотеку</p>
                        <xsl:if test="col:FinCardDate">
                           <br/>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="col:FinCardDate"/>
                           </xsl:call-template>
                        </xsl:if>
                        <br/>
                        <br/>
                        <p class="value">Отметки банка плательщика</p>
                        <br/>
                        <xsl:for-each select="col:PayBankMark">
                           <xsl:value-of select="catComFin_ru:BankName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonSurname"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                           <xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                           <xsl:if test="catComFin_ru:RecipSign/cat_ru:PersonMiddleName">
							   <xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonMiddleName"/>
                           </xsl:if>
                           <xsl:if test="catComFin_ru:RecipSign/cat_ru:PersonPost">/<xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonPost"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:if>
                           <xsl:if test="catComFin_ru:RecipSign/cat_ru:IssueDate">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="catComFin_ru:RecipSign/cat_ru:IssueDate"/>
                              </xsl:call-template>
                           </xsl:if>
                           <br/>
                        </xsl:for-each>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
