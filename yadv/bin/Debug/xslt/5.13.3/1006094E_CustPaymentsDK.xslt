<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cpdk cat_ru catESAD_ru" version="1.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cpdk="urn:customs.ru:Information:CustomsDocuments:CustPaymentsDK:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="cpdk:CustPaymentsDK">
      <html>
         <head>
            <title>Документ контроля платежей</title>
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
						border-bottom: solid 0.5pt #000000;
						}
						
					p.NumberDate {
						font-weight: bold;
						}
						
					.graph {
						font-family: Arial;
						font-size: 8pt;
						}
					td {
						font-family:Courier;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						
						.graphNo {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <h2>
						Документ контроля платежей
					</h2>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">Номер ДТ: </span>
                           <xsl:value-of select="cpdk:GTDNumber/cat_ru:CustomsCode"/>
                           <xsl:text> / </xsl:text>
                           <xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="cpdk:GTDNumber/cat_ru:RegistrationDate"/>
                           </xsl:call-template>
                           <xsl:text> / </xsl:text>
                           <xsl:value-of select="cpdk:GTDNumber/cat_ru:GTDNumber"/>
                        </td>
                     </tr>
                     <xsl:if test="cpdk:PaymentDocument">
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <span class="graphNo">Платежные поручения: </span>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:10mm;">Код вида платежа</td>
                                       <td align="center" class="graph" style="width:20mm;">Номер и дата платеж- ного доку- мента</td>
                                       <td align="center" class="graph" style="width:20mm;">Общая сумма по платеж- ному доку- менту</td>
                                       <td align="center" class="graph" style="width:10mm;">Код валюты суммы платежа</td>
                                       <td align="center" class="graph" style="width:20mm;">Списывае- мая сумма по платеж- ному доку- менту</td>
                                       <td align="center" class="graph" style="width:10mm;">Признак возврата денеж- ных средств</td>
                                       <td align="center" class="graph" style="width:15mm;">ИНН</td>
                                       <td align="center" class="graph" style="width:15mm;">КПП</td>
                                       <td align="center" class="graph" style="width:15mm;">ОКПО</td>
                                       <td align="center" class="graph" style="width:10mm;">Дата поступ- ления на счет</td>
                                       <td align="center" class="graph" style="width:10mm;">БИК</td>
                                       <td align="center" class="graph" style="width:15mm;">Способ платежа</td>
                                       <td align="center" class="graph" style="width:10mm;">Код дохода</td>
                                    </tr>
                                    <xsl:for-each select="cpdk:PaymentDocument">
                                       <tr>
                                          <td align="center" class="graph" style="width:10mm;">
                                             <xsl:value-of select="catESAD_ru:PaymentModeCode"/>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="catESAD_ru:PaymentDocumentNumber"/>
                                             <xsl:if test="catESAD_ru:PaymentDocumentDate">
                                                <br/>
                                                <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="catESAD_ru:PaymentDocumentDate"/>
                                                </xsl:call-template>
                                             </xsl:if>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="catESAD_ru:TotalAmount"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:10mm;">
                                             <xsl:value-of select="catESAD_ru:PaymentCurrencyCode"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="catESAD_ru:WrittenoffAmount"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:if test="catESAD_ru:WrittenoffAmountCurrencyCode">
																(код валюты <xsl:value-of select="catESAD_ru:WrittenoffAmountCurrencyCode"/>)
															</xsl:if>
                                          </td>
                                          <td align="center" class="graph" style="width:10mm;">
                                             <xsl:value-of select="catESAD_ru:ReturnSign"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:15mm;">
                                             <xsl:value-of select="catESAD_ru:INNID"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:15mm;">
                                             <xsl:value-of select="catESAD_ru:KPPCode"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:15mm;">
                                             <xsl:value-of select="cpdk:OKPOID"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:10mm;">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="cpdk:ReceiptDate"/>
                                             </xsl:call-template>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:10mm;">
                                             <xsl:value-of select="cpdk:BIC"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:15mm;">
                                             <xsl:value-of select="cpdk:PaymentWayCode"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:10mm;">
                                             <xsl:value-of select="cpdk:IncomeCode"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:Payment">
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <span class="graphNo">Платежи к уплате: </span>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:30mm;">Признак таможенного платежа</td>
                                       <td align="center" class="graph" style="width:30mm;">Код вида платежа</td>
                                       <td align="center" class="graph" style="width:30mm;">Сумма платежа</td>
                                       <td align="center" class="graph" style="width:30mm;">Код валюты платежа</td>
                                       <td align="center" class="graph" style="width:30mm;">Курс валюты платежа</td>
                                       <td align="center" class="graph" style="width:30mm;">Подвид таможенного платежа</td>
                                    </tr>
                                    <xsl:for-each select="cpdk:Payment">
                                       <tr>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cpdk:CustomsPaymentSign"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cpdk:PaymentModeCode"/>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cpdk:PaymentAmount"/>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cpdk:PaymentCurrencyCode"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cpdk:CurrencyRate"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cpdk:CustomsPaymentSubspecies"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:Fine">
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <span class="graphNo">Пени: </span>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:30mm;">Признак пени</td>
                                       <td align="center" class="graph" style="width:30mm;">Код вида платежа</td>
                                       <td align="center" class="graph" style="width:30mm;">Сумма пени</td>
                                       <td align="center" class="graph" style="width:30mm;">Код валюты платежа</td>
                                       <td align="center" class="graph" style="width:30mm;">Курс валюты платежа</td>
                                       <td align="center" class="graph" style="width:30mm;">Подвид платежа</td>
                                    </tr>
                                    <xsl:for-each select="cpdk:Fine">
                                       <tr>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cpdk:CustomsFineSign"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cpdk:PaymentModeCode"/>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cpdk:PaymentAmount"/>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cpdk:PaymentCurrencyCode"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cpdk:CurrencyRate"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cpdk:CustomsPaymentSubspecies"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PaymentDelay">
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <span class="graphNo">Отсрочки платежа/рассрочки платежа: </span>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:15mm;">Признак таможенного платежа</td>
                                       <td align="center" class="graph" style="width:15mm;">Код вида платежа</td>
                                       <td align="center" class="graph" style="width:20mm;">Сумма отсрочки/ рассрочки</td>
                                       <td align="center" class="graph" style="width:10mm;">Код валюты платежа</td>
                                       <td align="center" class="graph" style="width:20mm;">Подвид таможенного платежа</td>
                                       <td align="center" class="graph" style="width:20mm;">Код вида обеспечения уплаты</td>
                                       <td align="center" class="graph" style="width:20mm;">Номер разрешения на отсрочку платежа</td>
                                       <td align="center" class="graph" style="width:20mm;">Срок уплаты</td>
                                       <td align="center" class="graph" style="width:20mm;">Ставка кредита</td>
                                       <td align="center" class="graph" style="width:20mm;">Процент за предоставление отсрочки/ рассрочки</td>
                                    </tr>
                                    <xsl:for-each select="cpdk:PaymentDelay">
                                       <tr>
                                          <td align="center" class="graph" style="width:15mm;">
                                             <xsl:value-of select="cpdk:CustomsPaymentSign"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:15mm;">
                                             <xsl:value-of select="cpdk:PaymentModeCode"/>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="cpdk:PaymentDelayAmount"/>
                                          </td>
                                          <td align="center" class="graph" style="width:10mm;">
                                             <xsl:value-of select="cpdk:PaymentCurrencyCode"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="cpdk:CustomsPaymentSubspecies"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="cpdk:PaymentEnsuringModeCodeType"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="cpdk:DelayPremitNumber"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="cpdk:DelayPaymentDate"/>
                                             </xsl:call-template>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="cpdk:Rate"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="cpdk:PostponementProcent"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <br/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <!--tr>
								<td style="width:180mm;" colspan="2" class="graph">
									<br/>
									<span class="graphNo">Основной лист </span>
								</td>
							</tr-->
                     <xsl:if test="cpdk:PrimaryList/cpdk:TotalGoodsNumber">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Количество товаров: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:TotalGoodsNumber"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:TotalSheetNumber">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Количество добавочных листов: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:TotalSheetNumber"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:CurrencyEURO">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Курс евро: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:CurrencyEURO"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:CurrencyRate">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Курс валюты контракта: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:CurrencyRate"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:CurrencyCode">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Код валюты контракта: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:CurrencyCode"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:CustomsRemark">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Наличие замечаний: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:CustomsRemark"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:ProtocolNumber">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Номер протокола несоответствия: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:ProtocolNumber"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:ProtocolDate">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Дата протокола несоответствия: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="cpdk:PrimaryList/cpdk:ProtocolDate"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:CorrespondenceSign">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Признак соответствия: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:CorrespondenceSign"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:DelinquencySign">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Наличие просрочки: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:DelinquencySign"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:DelaySign">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Наличие отсрочки: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:DelaySign"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:InstallmentSign">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Наличие рассрочки: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:InstallmentSign"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:CreditSign">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Наличие налогового кредита: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:CreditSign"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:PaymentDate">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Срок оплаты: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="cpdk:PrimaryList/cpdk:PaymentDate"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:NumberDaysDelinquency">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Количество дней просрочки: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:NumberDaysDelinquency"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:NumberDaysDelay">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Количество дней отсрочки: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:NumberDaysDelay"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:NumberDaysDelinquencyKTS">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Количество дней просрочки по КТС: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:NumberDaysDelinquencyKTS"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:Conformity">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Соответствие: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:Conformity"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:NormalEnd">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Нормальное завершение: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:NormalEnd"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:Payable">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Подлежит оплате до (признак): </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:Payable"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:OutputUnauthorized">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Выпуск запрещен: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:OutputUnauthorized"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:CompositionProtocol">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Составление протокола: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:CompositionProtocol"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:INNID">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">ИНН: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:INNID"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:CalculationKTS">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Расчет по КТС: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:CalculationKTS"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">Сотрудник, составивший документ контроля платежей </span>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;">
                           <span class="graphNo">ФИО должностного лица таможенного органа: </span>
                        </td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="cpdk:PrimaryList/cpdk:CustomsPerson/cat_ru:PersonName"/>
                        </td>
                     </tr>
                     <xsl:if test="cpdk:PrimaryList/cpdk:CustomsPerson/cat_ru:LNP">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">ЛНП должностного лица таможенного органа: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:CustomsPerson/cat_ru:LNP"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:CustomsPerson/cpdk:IssueDate">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Дата подписи: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="cpdk:PrimaryList/cpdk:CustomsPerson/cpdk:IssueDate"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="cpdk:PrimaryList/cpdk:PersonOTP">
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <span class="graphNo">Сотрудник ОТП </span>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">ФИО должностного лица таможенного органа: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="cpdk:PrimaryList/cpdk:PersonOTP/cat_ru:PersonName"/>
                           </td>
                        </tr>
                        <xsl:if test="cpdk:PrimaryList/cpdk:PersonOTP/cat_ru:LNP">
                           <tr>
                              <td class="graph" style="width:90mm;">
                                 <span class="graphNo">ЛНП должностного лица таможенного органа: </span>
                              </td>
                              <td class="graph" style="width:90mm;">
                                 <xsl:value-of select="cpdk:PrimaryList/cpdk:PersonOTP/cat_ru:LNP"/>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="cpdk:PrimaryList/cpdk:PersonOTP/cpdk:IssueDate">
                           <tr>
                              <td class="graph" style="width:90mm;">
                                 <span class="graphNo">Дата подписи: </span>
                              </td>
                              <td class="graph" style="width:90mm;">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cpdk:PrimaryList/cpdk:PersonOTP/cpdk:IssueDate"/>
                                 </xsl:call-template>
                              </td>
                           </tr>
                        </xsl:if>
                     </xsl:if>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <br/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <xsl:for-each select="cpdk:Goods">
                        <tr>
                           <td class="graphNo" colspan="2" style="width:180mm;">
                              <br/>
                              <span>Товар № </span>
                              <xsl:value-of select="cpdk:GoodsNumeric"/>
                           </td>
                        </tr>
                        <xsl:if test="cpdk:PaymentCalculation">
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;">
                                 <span class="graphNo">Исчисление платежей</span>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;">
                                 <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                    <tbody>
                                       <tr>
                                          <td align="center" class="graph" style="width:20mm;">Признак таможенного платежа</td>
                                          <td align="center" class="graph" style="width:20mm;">Код вида платежа</td>
                                          <td align="center" class="graph" style="width:20mm;">Сумма платежа</td>
                                          <td align="center" class="graph" style="width:20mm;">Код валюты платежа</td>
                                          <td align="center" class="graph" style="width:20mm;">Основа начисления</td>
                                          <td align="center" class="graph" style="width:20mm;">Ставка</td>
                                          <td align="center" class="graph" style="width:20mm;">Вид ставки</td>
                                          <td align="center" class="graph" style="width:20mm;">Способ платежа</td>
                                          <td align="center" class="graph" style="width:20mm;">Подвид таможенного платежа</td>
                                       </tr>
                                       <xsl:for-each select="cpdk:PaymentCalculation">
                                          <tr>
                                             <td align="center" class="graph" style="width:20mm;">
                                                <xsl:value-of select="cpdk:CustomsPaymentSign"/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td align="center" class="graph" style="width:20mm;">
                                                <xsl:value-of select="cpdk:PaymentModeCode"/>
                                             </td>
                                             <td align="center" class="graph" style="width:20mm;">
                                                <xsl:value-of select="cpdk:PaymentAmount"/>
                                             </td>
                                             <td align="center" class="graph" style="width:20mm;">
                                                <xsl:value-of select="cpdk:PaymentCurrencyCode"/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td align="center" class="graph" style="width:20mm;">
                                                <xsl:value-of select="cpdk:TaxBase"/>
                                             </td>
                                             <td align="center" class="graph" style="width:20mm;">
                                                <xsl:value-of select="cpdk:Rate"/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:if test="cpdk:RateCurrencyCode">
                                                   <br/>
																	(код валюты <xsl:value-of select="cpdk:RateCurrencyCode"/>)
																</xsl:if>
                                                <xsl:if test="cpdk:RateTNVEDQualifierCode">
                                                   <br/>
																	(код единицы измерения ставки <xsl:value-of select="cpdk:RateTNVEDQualifierCode"/>)
																</xsl:if>
                                             </td>
                                             <td align="center" class="graph" style="width:20mm;">
                                                <xsl:value-of select="cpdk:RateTypeCode"/>
                                             </td>
                                             <td align="center" class="graph" style="width:20mm;">
                                                <xsl:value-of select="cpdk:PaymentWayCode"/>
                                             </td>
                                             <td align="center" class="graph" style="width:20mm;">
                                                <xsl:value-of select="cpdk:CustomsPaymentSubspecies"/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="cpdk:CustomsMark">
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;">
                                 <span class="graphNo">Отметки</span>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;">
                                 <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                    <tbody>
                                       <tr>
                                          <td align="center" class="graph" style="width:90mm;">Служебная запись/ номер документа</td>
                                          <td align="center" class="graph" style="width:90mm;">Дата проставления отметки/ Дата принятия решения о продлении срока проверки</td>
                                       </tr>
                                       <xsl:for-each select="cpdk:CustomsMark">
                                          <tr>
                                             <td align="center" class="graph" style="width:90mm;">
                                                <xsl:value-of select="cpdk:MarkDescription"/>
                                             </td>
                                             <td align="center" class="graph" style="width:90mm;">
                                                <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="cpdk:DateInf"/>
                                                </xsl:call-template>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                        </xsl:if>
                     </xsl:for-each>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
