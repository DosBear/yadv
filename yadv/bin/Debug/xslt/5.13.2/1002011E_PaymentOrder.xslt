<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:por="urn:customs.ru:Information:CommercialFinanceDocuments:PaymentOrder:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="por:PaymentOrder">
      <html>
         <head>
            <title>ПЛАТЕЖНОЕ ПОРУЧЕНИЕ</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 6.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }
					td.bold { font-size: 8.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 10.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
					td.border-left { border-left: medium none; border-right: .5pt solid black; }
					td.border { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: medium none; } 
					td.border-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; } 
					td.border-top { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-bottom { border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; } 
					td.border-top-bottom { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; } 
					td.border-top-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-top-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left-right-bottom { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					span.bold { font-size: 12.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 12.0pt; font-family: Courier; color: windowtext; }
					div.page { width: 210mm; height: 297mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					p.value { margin-top:1.0pt; margin-right:0cm; margin-bottom:0cm; margin-left:0cm; margin-bottom:.0001pt; text-align:justify; font-size:10.0pt; font-family:Arial; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graph-number { font-size: 9pt; font-weight: bold; }
					.graph-big { font-size: 9pt; }
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr style="height: 13.65pt">
                     <td colspan="2" style="width: 94.7pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="126">
                        <p class="value">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="por:ReceiptDate"/>
                           </xsl:call-template>
                        </p>
                     </td>
                     <td colspan="4" style="width: 55.85pt; height: 13.65pt; padding: 0cm" valign="top" width="74">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="3" style="width: 93.15pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="124">
                        <p class="value">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="por:ChargeOffDate"/>
                           </xsl:call-template>
                        </p>
                     </td>
                     <td colspan="11" style="width: 195.35pt; height: 13.65pt; padding: 0cm" valign="top" width="260">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="3" style="width: 48.85pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="65">
                        <p class="value">0401060</p>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="2" style="width: 94.7pt; height: 13.65pt; padding: 0cm" valign="top" width="126">
                        <span style="font-size: 8.0pt">Поступ. в банк плат.</span>
                     </td>
                     <td colspan="4" style="width: 55.85pt; height: 13.65pt; padding: 0cm" valign="top" width="74">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="3" style="width: 140pt; height: 13.65pt; padding: 0cm" valign="top" width="130">
                        <span style="font-size: 8.0pt">Списано со сч. плат.</span>
                     </td>
                     <td colspan="11" style="width: 195.35pt; height: 13.65pt; padding: 0cm" valign="top" width="260">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="3" style="width: 48.85pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="65">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="page-break-inside: avoid; height: 13.65pt">
                     <td colspan="20" style="width: 439.05pt; height: 13.65pt; padding: 0cm" valign="top" width="585">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td rowspan="2" style="width: 21.25pt; height: 13.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="28">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" rowspan="2" style="width: 27.6pt; height: 13.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" width="37">
                        <p align="center" class="value">
                           <xsl:value-of select="por:DepartmentalInfo/catComFin_ru:DrawerStatus"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="page-break-inside: avoid; height: 13.65pt">
                     <td colspan="9" style="width: 243.7pt; height: 13.65pt; padding: 0cm" valign="top" width="325">
                        <p class="value">ПЛАТЕЖНОЕ ПОРУЧЕНИЕ № <xsl:value-of select="por:DocumentReference/cat_ru:PrDocumentNumber"/>
                        </p>
                     </td>
                     <td colspan="6" style="width: 94.85pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="126">
                        <p class="value">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="por:DocumentReference/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                        </p>
                     </td>
                     <td style="width: 13.5pt; height: 13.65pt; padding: 0cm" valign="top" width="18">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="4" style="width: 87.0pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="116">
                        <p class="value">
                           <xsl:value-of select="por:PaymentModeCode"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="page-break-inside: avoid; height: 13.65pt">
                     <td colspan="9" style="width: 243.7pt; height: 13.65pt; padding: 0cm" valign="top" width="325">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" colspan="6" style="width: 94.85pt; height: 13.65pt; padding: 0cm" valign="top" width="126">
                        <span style="font-size: 8.0pt">Дата</span>
                     </td>
                     <td style="width: 13.5pt; height: 13.65pt; padding: 0cm" valign="top" width="18">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" colspan="4" style="width: 87.0pt; height: 13.65pt; border: medium none; padding: 0cm" valign="top" width="116">
                        <span style="font-size: 8.0pt">Вид платежа</span>
                     </td>
                     <td colspan="3" style="width: 48.85pt; height: 13.65pt; padding: 0cm" valign="top" width="65">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 40.75pt">
                     <td style="width: 54.1pt; height: 40.75pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="72">
                        <p class="value">Сумма<br/>прописью</p>
                     </td>
                     <td colspan="22" style="width: 433.8pt; height: 40.75pt; padding: 0cm" valign="top" width="578">
                        <p class="value">
                           <xsl:value-of select="por:ValueSpelledOut"/>
                        </p>
                     </td>
                     <!--								<p class="value">Двадцать пять тысяч рублей 00 копеек</p></td> -->
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="4" style="width: 135.3pt; height: 13.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="180">
                        <p class="value">ИНН <xsl:value-of select="por:Payer/catComFin_ru:INN"/>
                        </p>
                     </td>
                     <td colspan="6" style="width: 135.6pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="181">
                        <p class="value">КПП <xsl:value-of select="por:Payer/catComFin_ru:KPP"/>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">Сумма</p>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="235">
                        <p class="value">
                           <xsl:value-of select="por:PaymentAmount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="10" rowspan="4" style="width: 270.9pt; height: 13.65pt; padding: 0cm" valign="top" width="361">
                        <p class="value">
                           <xsl:value-of select="por:Payer/catComFin_ru:OrganizationName"/>
                           <xsl:if test="por:Payer/por:Address"> //<xsl:apply-templates select="por:Payer/por:Address"/>
                           </xsl:if>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; padding: 0cm" valign="top" width="235">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; padding: 0cm" valign="top" width="235">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">Сч.№</p>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="235">
                        <p class="value">
                           <xsl:value-of select="por:Payer/catComFin_ru:Bank/catComFin_ru:PersonalAccount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; padding: 0cm" valign="top" width="235">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="10" style="width: 270.9pt; height: 13.65pt; padding: 0cm" valign="top" width="361">
                        <p class="value">Плательщик</p>
                     </td>
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; padding: 0cm" valign="top" width="235">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="10" rowspan="2" style="width: 270.9pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="361">
                        <p class="value">
                           <xsl:value-of select="por:Payer/catComFin_ru:Bank/catComFin_ru:BankName"/>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">БИК</p>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; padding: 0cm" valign="top" width="235">
                        <p class="value">
                           <xsl:value-of select="por:Payer/catComFin_ru:Bank/catComFin_ru:BIC"/>
                        </p>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">Сч.№</p>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; padding: 0cm" valign="top" width="235">
                        <p class="value">
                           <xsl:value-of select="por:Payer/catComFin_ru:Bank/catComFin_ru:CorrespAccount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="10" style="width: 270.9pt; height: 13.65pt; padding: 0cm" valign="top" width="361">
                        <p class="value">Банк плательщика</p>
                     </td>
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; padding: 0cm" valign="top" width="235">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="10" style="width: 270.9pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="361">
                        <p class="value">
                           <xsl:value-of select="por:Payee/catComFin_ru:Bank/catComFin_ru:BankName"/>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">БИК</p>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="235">
                        <p class="value">
                           <xsl:value-of select="por:Payee/catComFin_ru:Bank/catComFin_ru:BIC"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="10" style="width: 270.9pt; height: 13.65pt; padding: 0cm" valign="top" width="361">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">Сч.№</p>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; padding: 0cm" valign="top" width="235">
                        <p class="value">
                           <xsl:value-of select="por:Payee/catComFin_ru:Bank/catComFin_ru:CorrespAccount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="10" style="width: 270.9pt; height: 13.65pt; padding: 0cm" valign="top" width="361">
                        <p class="value">Банк получателя</p>
                     </td>
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; padding: 0cm" valign="top" width="235">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="4" style="width: 135.3pt; height: 13.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="180">
                        <p class="value">ИНН <xsl:value-of select="por:Payee/catComFin_ru:INN"/>
                        </p>
                     </td>
                     <td colspan="6" style="width: 135.6pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="181">
                        <p class="value">КПП <xsl:value-of select="por:Payee/catComFin_ru:KPP"/>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">Сч.№</p>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; padding: 0cm" valign="top" width="235">
                        <p class="value">
                           <xsl:value-of select="por:Payee/catComFin_ru:Bank/catComFin_ru:PersonalAccount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="10" rowspan="4" style="width: 270.9pt; height: 13.65pt; padding: 0cm" valign="top" width="361">
                        <p class="value">
                           <xsl:value-of select="por:Payee/catComFin_ru:OrganizationName"/>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; padding: 0cm" valign="top" width="235">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="10" style="width: 176.35pt; height: 13.65pt; padding: 0cm" valign="top" width="235">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border: 1.0pt solid windowtext; padding: 0cm" valign="top" width="54">
                        <p class="value">Вид оп.</p>
                     </td>
                     <td colspan="4" style="width: 54.2pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="72">
                        <p class="value">
                           <xsl:value-of select="por:TransactionKind"/>
                        </p>
                     </td>
                     <td colspan="2" style="width: 54.2pt; height: 13.65pt; border: 1.0pt solid windowtext; padding: 0cm" valign="top" width="72">
                        <p class="value">Срок плат.</p>
                     </td>
                     <td colspan="4" style="width: 67.95pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="91">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="54">
                        <p class="value">Наз.пл.</p>
                     </td>
                     <td colspan="4" style="width: 54.2pt; height: 13.65pt; padding: 0cm" valign="top" width="72">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" style="width: 54.2pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="72">
                        <p class="value">Очер.плат.</p>
                     </td>
                     <td colspan="4" style="width: 67.95pt; height: 13.65pt; padding: 0cm" valign="top" width="91">
                        <p class="value">
                           <xsl:value-of select="por:Priority"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td class="border-bottom" colspan="10" valign="top" width="361">
                        <p class="value">Получатель</p>
                     </td>
                     <td colspan="3" style="width: 40.65pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="54">
                        <p class="value">Код</p>
                     </td>
                     <td class="border-bottom" colspan="4" valign="top" width="72">
                        <p class="value">
                           <xsl:if test="por:DepartmentalInfo/por:UniqueID">
                              <xsl:value-of select="por:DepartmentalInfo/por:UniqueID"/>
                           </xsl:if>
                        </p>
                     </td>
                     <td colspan="2" style="width: 54.2pt; height: 13.65pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="72">
                        <p class="value">Рез. поле</p>
                     </td>
                     <td class="border-bottom" colspan="4" valign="top" width="91">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="page-break-inside: avoid; height: 13.65pt">
                     <td class="border" colspan="3" valign="top" width="161">
                        <p class="value">
                           <xsl:value-of select="por:DepartmentalInfo/catComFin_ru:CBC"/>
                        </p>
                     </td>
                     <td class="border" colspan="4" valign="top" width="95">
                        <p class="value">
                           <xsl:value-of select="por:DepartmentalInfo/catComFin_ru:OKATO"/>
                        </p>
                     </td>
                     <td class="border" valign="top" width="28">
                        <p class="value">
                           <xsl:value-of select="por:DepartmentalInfo/catComFin_ru:PaymentReason"/>
                        </p>
                     </td>
                     <td class="border" colspan="3" valign="top" width="96">
                        <p class="value">
                           <xsl:value-of select="por:DepartmentalInfo/catComFin_ru:CustomsCode"/>
                        </p>
                     </td>
                     <td class="border" colspan="7" valign="top" width="126">
                        <p class="value">
                           <xsl:value-of select="por:DepartmentalInfo/catComFin_ru:DocNo"/>
                        </p>
                     </td>
                     <td class="border" colspan="4" valign="top" width="118">
                        <p class="value">
                           <xsl:value-of select="por:DepartmentalInfo/catComFin_ru:DocDate"/>
                        </p>
                     </td>
                     <td class="border" valign="top" width="27">
                        <p class="value">
                           <xsl:value-of select="por:DepartmentalInfo/catComFin_ru:TaxPaymentKind"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="page-break-inside: avoid; height: 68.65pt">
                     <td colspan="23" style="width: 487.9pt; height: 68.65pt; border: medium none; padding: 0cm" valign="top" width="651">
                        <p class="value">
                           <xsl:value-of select="por:Purpose"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="page-break-inside: avoid; height: 13.65pt">
                     <td colspan="23" style="width: 180mm; height: 13.65pt; padding: 0cm" valign="top" width="651">
                        <p class="value">Назначение платежа<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.65pt">
                     <td colspan="5" style="width: 139.45pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="186">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="7" style="width: 162.55pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="217">
                        <p class="value">Подписи</p>
                     </td>
                     <td colspan="2" style="width: 34.15pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="46">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 151.75pt; height: 13.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="202">
                        <p class="value">Отметки банка</p>
                     </td>
                  </tr>
                  <tr style="height: 27.25pt">
                     <td colspan="5" style="width: 139.45pt; height: 27.25pt; padding: 0cm" valign="top" width="186">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="7" style="width: 162.55pt; height: 27.25pt; padding: 0cm" valign="top" width="217">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" style="width: 34.15pt; height: 27.25pt; padding: 0cm" valign="top" width="46">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 151.75pt; height: 27.25pt; padding: 0cm" valign="top" width="202">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 40.8pt">
                     <td colspan="5" style="width: 139.45pt; height: 40.8pt; padding: 0cm" valign="top" width="186">
                        <p class="value">М.П.</p>
                     </td>
                     <td class="value" colspan="7" style="width: 162.55pt; height: 40.8pt; padding: 0cm" valign="top" width="217">
                        <xsl:value-of select="por:PayerSign/cat_ru:PersonSurname"/>   <xsl:value-of select="por:PayerSign/cat_ru:PersonName"/>   <xsl:value-of select="por:PayerSign/cat_ru:PersonMiddleName"/>  <xsl:if test="por:PayerSign/cat_ru:PersonPost">/<xsl:value-of select="por:PayerSign/cat_ru:PersonPost"/>
                        </xsl:if>
                        <xsl:if test="por:PayerSign/cat_ru:IssueDate">/
										<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="por:PayerSign/cat_ru:IssueDate"/>
                           </xsl:call-template>
                        </xsl:if>
                     </td>
                     <td colspan="2" style="width: 34.15pt; height: 40.8pt; padding: 0cm" valign="top" width="46">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td class="value" colspan="9" valign="top" width="202">
                        <xsl:if test="por:BankSign">
                           <xsl:value-of select="por:BankSign/cat_ru:PersonSurname"/>   <xsl:value-of select="por:BankSign/cat_ru:PersonName"/>  <xsl:value-of select="por:BankSign/cat_ru:PersonMiddleName"/>  <xsl:if test="por:BankSign/cat_ru:PersonPost">/<xsl:value-of select="por:BankSign/cat_ru:PersonPost"/>
                           </xsl:if>
                           <xsl:if test="por:BankSign/cat_ru:IssueDate">/
										<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="por:BankSign/cat_ru:IssueDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </xsl:if>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="por:Address">
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
</xsl:stylesheet>
