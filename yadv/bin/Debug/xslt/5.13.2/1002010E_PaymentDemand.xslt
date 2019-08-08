<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pde="urn:customs.ru:Information:CommercialFinanceDocuments:PaymentDemand:5.13.2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="pde:PaymentDemand">
      <html>
         <head>
            <title>ПЛАТЕЖНОЕ ТРЕБОВАНИЕ</title>
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
					p.value { margin-top:1.0pt; margin-right:0cm; margin-bottom:0cm; margin-left:0cm; margin-bottom:.0001pt; text-align:justify; font-size:10.0pt; font-family:Arial;	}
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
                  <tr style="height: 13.95pt">
                     <td colspan="5" style="width: 93.8pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="125">
                        <p class="value">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="pde:ReceiptDate"/>
                           </xsl:call-template>
                        </p>
                     </td>
                     <td style="width: 13.45pt; height: 13.95pt; padding: 0cm" valign="top" width="18">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" style="width: 94.1pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="125">
                        <p class="value">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="pde:MaturiryDate"/>
                           </xsl:call-template>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.85pt; height: 13.95pt; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="4" style="width: 94.1pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="125">
                        <p class="value">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="pde:ChargeOffDate"/>
                           </xsl:call-template>
                        </p>
                     </td>
                     <td colspan="6" style="width: 108.55pt; height: 13.95pt; padding: 0cm" valign="top" width="145">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" style="width: 42.7pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="57">
                        <p class="value">0401061</p>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="5" style="width: 93.8pt; height: 13.95pt; padding: 0cm" valign="top" width="125">
                        <p class="value">
                           <span style="font-size: 8.0pt">Поступ. в банк плат.</span>
                        </p>
                     </td>
                     <td style="width: 13.45pt; height: 13.95pt; padding: 0cm" valign="top" width="18">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" style="width: 94.1pt; height: 13.95pt; padding: 0cm" valign="top" width="125">
                        <p class="value">
                           <span style="font-size: 8.0pt">Оконч. срока акцепта</span>
                        </p>
                     </td>
                     <td colspan="3" style="width: 40.85pt; height: 13.95pt; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="4" style="width: 94.1pt; height: 13.95pt; padding: 0cm" valign="top" width="125">
                        <p class="value">
                           <span style="font-size: 8.0pt">Списано со сч. плат.</span>
                        </p>
                     </td>
                     <td colspan="6" style="width: 108.55pt; height: 13.95pt; padding: 0cm" valign="top" width="145">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" style="width: 42.7pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="57">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="21" style="width: 444.9pt; height: 13.95pt; padding: 0cm" valign="top" width="593">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" style="width: 42.7pt; height: 13.95pt; padding: 0cm" valign="top" width="57">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="10" style="width: 241.65pt; height: 13.95pt; padding: 0cm" valign="top" width="322">
                        <p class="value">ПЛАТЕЖНОЕ ТРЕБОВАНИЕ № <xsl:value-of select="pde:DocumentReference/cat_ru:PrDocumentNumber"/>
                        </p>
                     </td>
                     <td colspan="5" style="width: 94.35pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="126">
                        <p class="value">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="pde:DocumentReference/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                        </p>
                     </td>
                     <td colspan="2" style="width: 13.45pt; height: 13.95pt; padding: 0cm" valign="top" width="18">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="4" style="width: 95.4pt; height: 13.95pt; padding: 0cm" valign="top" width="127">
                        <p class="value">
                           <xsl:value-of select="pde:PaymentModeCode"/>
                        </p>
                     </td>
                     <td colspan="2" style="border: medium none; padding: 0cm" width="57">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="4" style="width: 80.35pt; height: 13.95pt; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="107">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="6" style="width: 161.35pt; height: 13.95pt; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="215">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="5" style="width: 94.35pt; height: 13.95pt; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="126">
                        <p class="value">
                           <span style="font-size: 8.0pt">Дата</span>
                        </p>
                     </td>
                     <td colspan="2" style="width: 13.45pt; height: 13.95pt; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="18">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="4" style="width: 95.4pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="127">
                        <p class="value">
                           <span style="font-size: 8.0pt">Вид платежа</span>
                        </p>
                     </td>
                     <td colspan="2" style="border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext" width="57">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 41.75pt">
                     <td colspan="2" style="width: 53.55pt; height: 41.75pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="71">
                        <p class="value">Условие <br/>оплаты</p>
                     </td>
                     <td colspan="17" style="width: 334.35pt; height: 41.75pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="446">
                        <p class="value">
                           <xsl:if test="pde:PaymentConditionRef">
										«Без акцепта» согласно <xsl:value-of select="pde:PaymentConditionRef/cat_ru:PrDocumentName"/> № <xsl:value-of select="pde:PaymentConditionRef/cat_ru:PrDocumentNumber"/> от
										<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="pde:PaymentConditionRef/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </p>
                     </td>
                     <td colspan="3" style="width: 68.7pt; height: 41.75pt; border: 1.0pt solid windowtext; padding: 0cm" valign="top" width="92">
                        <p class="value">Срок для<br/>акцепта</p>
                     </td>
                     <td align="center" style="width: 31.0pt; height: 41.75pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm;" valign="middle" width="41">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                        <xsl:if test="pde:AcceptanceTerm">
                           <p align="center" class="value">
                              <xsl:value-of select="pde:AcceptanceTerm"/>
                           </p>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr style="height: 41.75pt">
                     <td colspan="2" style="width: 53.55pt; height: 41.75pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="71">
                        <p class="value">Сумма <br/>прописью</p>
                     </td>
                     <td colspan="21" style="width: 434.05pt; height: 41.75pt; padding: 0cm" valign="top" width="579">
                        <p class="value">
                           <xsl:value-of select="pde:ValueSpelledOut"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="12" style="width: 268.5pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="358">
                        <p class="value">ИНН <xsl:value-of select="pde:Payer/catComFin_ru:INN"/>
                        </p>
                     </td>
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">Сумма</p>
                     </td>
                     <td colspan="9" style="width: 178.75pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="238">
                        <p class="value">
                           <xsl:value-of select="pde:PaymentAmount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="12" rowspan="3" style="width: 268.5pt; padding: 0cm" valign="top" width="358">
                        <p class="value">
                           <xsl:value-of select="pde:Payer/catComFin_ru:OrganizationName"/>
                        </p>
                     </td>
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 178.75pt; height: 13.95pt; padding: 0cm" valign="top" width="238">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 178.75pt; height: 13.95pt; padding: 0cm" valign="top" width="238">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">Сч.№</p>
                     </td>
                     <td colspan="9" style="width: 178.75pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="238">
                        <p class="value">
                           <xsl:value-of select="pde:Payer/catComFin_ru:Bank/catComFin_ru:PersonalAccount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="12" style="width: 268.5pt; height: 13.95pt; padding: 0cm" valign="top" width="358">
                        <p class="value">Плательщик</p>
                     </td>
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 178.75pt; height: 13.95pt; padding: 0cm" valign="top" width="238">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="12" rowspan="2" style="width: 268.5pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="358">
                        <p class="value">
                           <xsl:value-of select="pde:Payer/catComFin_ru:Bank/catComFin_ru:BankName"/>
                        </p>
                     </td>
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">БИК</p>
                     </td>
                     <td colspan="9" style="width: 178.75pt; height: 13.95pt; padding: 0cm" valign="top" width="238">
                        <p class="value">
                           <xsl:value-of select="pde:Payer/catComFin_ru:Bank/catComFin_ru:BIC"/>
                        </p>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">Сч.№</p>
                     </td>
                     <td colspan="9" style="width: 178.75pt; height: 13.95pt; padding: 0cm" valign="top" width="238">
                        <p class="value">
                           <xsl:value-of select="pde:Payer/catComFin_ru:Bank/catComFin_ru:CorrespAccount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="12" style="width: 268.5pt; height: 13.95pt; padding: 0cm" valign="top" width="358">
                        <p class="value">Банк плательщика</p>
                     </td>
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 178.75pt; height: 13.95pt; padding: 0cm" valign="top" width="238">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="12" rowspan="2" style="width: 268.5pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="358">
                        <p class="value">
                           <xsl:value-of select="pde:Payee/catComFin_ru:Bank/catComFin_ru:BankName"/>
                        </p>
                     </td>
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">БИК</p>
                     </td>
                     <td colspan="9" style="width: 178.75pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="238">
                        <p class="value">
                           <xsl:value-of select="pde:Payee/catComFin_ru:Bank/catComFin_ru:BIC"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">Сч.№</p>
                     </td>
                     <td colspan="9" style="width: 178.75pt; height: 13.95pt; padding: 0cm" valign="top" width="238">
                        <p class="value">
                           <xsl:value-of select="pde:Payee/catComFin_ru:Bank/catComFin_ru:CorrespAccount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="12" style="width: 268.5pt; height: 13.95pt; padding: 0cm" valign="top" width="358">
                        <p class="value">Банк получателя</p>
                     </td>
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 178.75pt; height: 13.95pt; padding: 0cm" valign="top" width="238">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="12" style="width: 268.5pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="358">
                        <p class="value">ИНН <xsl:value-of select="pde:Payee/catComFin_ru:INN"/>
                        </p>
                     </td>
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <p class="value">Сч.№</p>
                     </td>
                     <td colspan="9" style="width: 178.75pt; height: 13.95pt; padding: 0cm" valign="top" width="238">
                        <p class="value">
                           <xsl:value-of select="pde:Payee/catComFin_ru:Bank/catComFin_ru:PersonalAccount"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="12" rowspan="3" style="width: 268.5pt; padding: 0cm" valign="top" width="358">
                        <p class="value">
                           <xsl:value-of select="pde:Payee/catComFin_ru:OrganizationName"/>
                        </p>
                     </td>
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="9" style="width: 178.75pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="238">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="page-break-inside: avoid; height: 13.95pt">
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border: 1.0pt solid windowtext; padding: 0cm" valign="top" width="54">
                        <p class="value">Вид оп.</p>
                     </td>
                     <td colspan="4" style="width: 53.75pt; height: 13.95pt; border: medium none; padding: 0cm" valign="top" width="72">
                        <p class="value">
                           <xsl:value-of select="pde:TransactionKind"/>
                        </p>
                     </td>
                     <td colspan="2" style="width: 53.75pt; height: 13.95pt; border: 1.0pt solid windowtext; padding: 0cm" valign="top" width="72">
                        <p class="value">Очер.плат.</p>
                     </td>
                     <td colspan="3" style="width: 71.25pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="95">
                        <p class="value">
                           <xsl:value-of select="pde:Priority"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="page-break-inside: avoid; height: 13.95pt">
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="54">
                        <p class="value">Наз.пл.</p>
                     </td>
                     <td colspan="4" style="width: 53.75pt; height: 13.95pt; padding: 0cm" valign="top" width="72">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" rowspan="2" style="width: 53.75pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="72">
                        <p class="value">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </p>
                        <p class="value">Рез. поле</p>
                     </td>
                     <td colspan="3" style="width: 71.25pt; height: 13.95pt; padding: 0cm" valign="top" width="95">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="page-break-inside: avoid; height: 13.95pt">
                     <td colspan="12" style="width: 268.5pt; height: 13.95pt; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="358">
                        <p class="value">Получатель</p>
                     </td>
                     <td colspan="2" style="width: 40.35pt; height: 13.95pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="54">
                        <p class="value">Код</p>
                     </td>
                     <td colspan="4" style="width: 53.75pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="72">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="3" style="width: 71.25pt; height: 13.95pt; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="95">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 27.8pt">
                     <td colspan="23" style="width: 487.6pt; height: 27.8pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="650">
                        <p class="value">Назначение платежа</p>
                     </td>
                  </tr>
                  <tr style="height: 27.8pt">
                     <td colspan="23" style="width: 487.6pt; height: 27.8pt; padding: 0cm" valign="top" width="650">
                        <p class="value">
                           <xsl:value-of select="pde:Purpose"/>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 27.8pt">
                     <td colspan="23" style="width: 487.6pt; height: 27.8pt; padding: 0cm" valign="top" width="650">
                        <p class="value">Дата отсылки (вручения) плательщику предусмотренных договором документов
								<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="pde:DocDispatchDate"/>
                           </xsl:call-template>
                        </p>
                     </td>
                  </tr>
                  <tr style="height: 13.95pt">
                     <td colspan="7" style="width: 134.35pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="179">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="6" style="width: 161.35pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="215">
                        <p class="value">Подписи</p>
                     </td>
                     <td colspan="3" style="width: 42.35pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="56">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="7" style="width: 149.55pt; height: 13.95pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="199">
                        <p class="value">Отметки банка получателя</p>
                     </td>
                  </tr>
                  <tr style="height: 21.95pt">
                     <td colspan="7" style="width: 134.35pt; height: 21.95pt; padding: 0cm" valign="top" width="179">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="6" style="width: 161.35pt; height: 21.95pt; padding: 0cm" valign="top" width="215">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="3" style="width: 42.35pt; height: 21.95pt; padding: 0cm" valign="top" width="56">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="7" style="width: 149.55pt; height: 21.95pt; padding: 0cm" valign="top" width="199">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 27.8pt">
                     <td colspan="7" style="width: 134.35pt; height: 27.8pt; padding: 0cm" valign="top" width="179">
                        <p class="value">М.П.</p>
                     </td>
                     <td class="value" colspan="6" style="width: 161.35pt; height: 27.8pt; padding: 0cm" valign="top" width="215">
                        <xsl:for-each select="pde:DocumentSign">
                           <xsl:value-of select="cat_ru:PersonSurname"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="cat_ru:PersonName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="cat_ru:PersonMiddleName"/>
                           <xsl:if test="cat_ru:PersonPost">/<xsl:value-of select="cat_ru:PersonPost"/>
                           </xsl:if>
                           <xsl:if test="cat_ru:IssueDate">
							   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
                              </xsl:call-template>
                           </xsl:if>
                           <br/>
                        </xsl:for-each>
                     </td>
                     <td colspan="3" style="width: 42.35pt; height: 27.8pt; padding: 0cm" valign="top" width="56">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td class="value" colspan="7" style="width: 149.55pt; height: 27.8pt; padding: 0cm" valign="top" width="199">
                        <xsl:for-each select="pde:RecipBankMark">
                           <xsl:value-of select="catComFin_ru:BankName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonSurname"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                           <xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                           <xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonMiddleName"/>
                           <xsl:if test="catComFin_ru:RecipSign/cat_ru:PersonPost">/<xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonPost"/>
                           </xsl:if>
                           <xsl:if test="catComFin_ru:RecipSign/cat_ru:IssueDate">
							   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="catComFin_ru:RecipSign/cat_ru:IssueDate"/>
                              </xsl:call-template>
                           </xsl:if>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr style="height: 7.3pt">
                     <td colspan="7" style="width: 134.35pt; height: 7.3pt; padding: 0cm" valign="top" width="179">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="6" style="width: 161.35pt; height: 7.3pt; padding: 0cm" valign="top" width="215">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="3" style="width: 42.35pt; height: 7.3pt; padding: 0cm" valign="top" width="56">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="7" style="width: 149.55pt; height: 7.3pt; padding: 0cm" valign="top" width="199">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr style="height: 6.55pt">
                     <td colspan="16" style="width: 338.05pt; height: 6.55pt; padding: 0cm" valign="top" width="451">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="7" style="width: 149.55pt; height: 6.55pt; padding: 0cm" valign="top" width="199">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <!--tr style="height: 41.65pt">
							<td width="36" valign="top" style="width: 26.75pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm">
								<p class="value">№ ч. </p>
								<p class="value">плат.</p></td>
							<td width="54" colspan="2" valign="top" style="width: 40.2pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm">
								<p class="value"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>№ плат. ордера</p></td>
							<td width="90" colspan="4" valign="top" style="width: 67.4pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm">
								<p class="value">Дата плат.</p>
								<p class="value">ордера</p></td>
							<td width="108" colspan="2" valign="top" style="width: 80.65pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm">
								<p class="value">Сумма частичного платежа</p></td>
							<td width="108" colspan="4" valign="top" style="width: 80.7pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm">
								<p class="value">Сумма остатка платежа</p></td>
							<td width="56" colspan="3" valign="top" style="width: 42.35pt; height: 41.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm">
								<p class="value">Подпись</p></td>
							<td width="199" colspan="7" valign="top" style="width: 149.55pt; height: 41.65pt; padding: 0cm" class="value">
								<p class="value">Дата помещения в картотеку</p>
									
									<xsl:if test="pde:FinCardDate"><br/><xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="pde:FinCardDate"/>
										 </xsl:call-template></xsl:if>
								</td>
						</tr-->
                  <tr style="width: 180mm">
                     <td colspan="16">
                        <table style="width:100%">
                           <tbody>
                              <tr style="height: 41.65pt">
                                 <td style="width: 26.75pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="36">
                                    <p class="value">№ ч. </p>
                                    <p class="value">плат.</p>
                                 </td>
                                 <td colspan="2" style="width: 40.2pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="54">
                                    <p class="value">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>№ плат. ордера</p>
                                 </td>
                                 <td colspan="4" style="width: 67.4pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="90">
                                    <p class="value">Дата плат.</p>
                                    <p class="value">ордера</p>
                                 </td>
                                 <td colspan="2" style="width: 80.65pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="108">
                                    <p class="value">Сумма частичного платежа</p>
                                 </td>
                                 <td colspan="4" style="width: 80.7pt; height: 41.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="108">
                                    <p class="value">Сумма остатка платежа</p>
                                 </td>
                                 <td colspan="3" style="width: 42.35pt; height: 41.65pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding: 0cm" valign="top" width="56">
                                    <p class="value">Подпись</p>
                                 </td>
                              </tr>
                              <xsl:for-each select="pde:PartPayment">
                                 <tr>
                                    <td class="value" style="width: 26.75pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="36">
                                       <xsl:value-of select="catComFin_ru:PartPaymentNum"/>
                                    </td>
                                    <td class="value" colspan="2" style="width: 40.2pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="54">
                                       <xsl:value-of select="catComFin_ru:PartPaymentPP"/>
                                    </td>
                                    <td class="value" colspan="4" style="width: 67.4pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="90">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="catComFin_ru:PartPaymentPPDate"/>
                                       </xsl:call-template>
                                    </td>
                                    <td class="value" colspan="2" style="width: 80.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="108">
                                       <xsl:value-of select="catComFin_ru:PartPaymentSumm"/>
                                    </td>
                                    <td class="value" colspan="4" style="width: 80.7pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="108">
                                       <xsl:value-of select="catComFin_ru:Remainder"/>
                                    </td>
                                    <td class="value" colspan="3" style="width: 42.35pt; border-left: medium none; border-right: medium none; border-top: 1.0pt solid windowtext; border-bottom: medium none; padding: 0cm" valign="top" width="56">
                                       <xsl:if test="catComFin_ru:PartPaymentSign">
                                          <xsl:value-of select="catComFin_ru:PartPaymentSign/cat_ru:PersonSurname"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                                          <xsl:value-of select="catComFin_ru:PartPaymentSign/cat_ru:PersonName"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                                          <xsl:value-of select="catComFin_ru:PartPaymentSign/cat_ru:PersonMiddleName"/>
                                       </xsl:if>
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
                     <!--td width="36" valign="top" style="width: 26.75pt; height: 29.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							<td width="54" colspan="2" valign="top" style="width: 40.2pt; height: 29.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							<td width="90" colspan="4" valign="top" style="width: 67.4pt; height: 29.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							<td width="108" colspan="2" valign="top" style="width: 80.65pt; height: 29.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							<td width="108" colspan="4" valign="top" style="width: 80.7pt; height: 29.65pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: medium none; padding: 0cm">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							<td width="56" colspan="3" valign="top" style="width: 42.35pt; height: 29.65pt; border: medium none; padding: 0cm">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td-->
                     <td class="value" colspan="7" style="width: 149.55pt; padding: 0cm" valign="bottom" width="199">
                        <p class="value">Дата помещения в картотеку</p>
                        <xsl:if test="pde:FinCardDate">
                           <br/>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="pde:FinCardDate"/>
                           </xsl:call-template>
                        </xsl:if>
                        <br/>
                        <br/>
                        <p class="value">Отметки банка плательщика</p>
                        <br/>
                        <xsl:for-each select="pde:PayBankMark">
                           <xsl:value-of select="catComFin_ru:BankName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonSurname"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                           <xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                           <xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonMiddleName"/>
                           <xsl:if test="catComFin_ru:RecipSign/cat_ru:PersonPost">/<xsl:value-of select="catComFin_ru:RecipSign/cat_ru:PersonPost"/>
                           </xsl:if>
                           <xsl:if test="catComFin_ru:RecipSign/cat_ru:IssueDate">
							   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="catComFin_ru:RecipSign/cat_ru:IssueDate"/>
                              </xsl:call-template>
                           </xsl:if>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </xsl:for-each>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
