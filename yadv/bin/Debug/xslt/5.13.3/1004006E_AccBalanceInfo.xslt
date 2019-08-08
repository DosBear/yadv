<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="accbi cat_ru catExch_ru" version="1.0" xmlns:accbi="urn:customs.ru:Information:ExchangeDocuments:AccBalanceInfo:5.13.1" xmlns:catExch_ru="urn:customs.ru:Information:ExchangeDocuments:ExchangeCommonAggregateTypes:5.13.1" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="accbi:AccBalanceInfo">
      <html>
         <head>
            <title>Информация об остатках на платежных поручениях участника ВЭД</title>
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
						Информация об остатках на платежных поручениях участника ВЭД
					</h2>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <xsl:if test="accbi:INN">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">ИНН: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="accbi:INN"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="accbi:KPP">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">КПП: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="accbi:KPP"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graph" style="width:90mm;">
                           <span class="graphNo">Статус ответа: </span>
                        </td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="accbi:ResponseStatus"/>
                        </td>
                     </tr>
                     <xsl:if test="accbi:PaymentOrder">
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <span class="graphNo">Реквизиты платежного поручения: </span>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:20mm;">Номер и дата платежного поручения</td>
                                       <td align="center" class="graph" style="width:30mm;">Общая сумма по платежному документу</td>
                                       <td align="center" class="graph" style="width:20mm;">Код валюты платежного поручения</td>
                                       <td align="center" class="graph" style="width:30mm;">Неиспользованный остаток средств на платежном поручении</td>
                                       <td align="center" class="graph" style="width:20mm;">Код вида платежа</td>
                                       <td align="center" class="graph" style="width:20mm;">Срок поступления средств</td>
                                       <td align="center" class="graph" style="width:40mm;">Признаки платежного поручения</td>
                                    </tr>
                                    <xsl:for-each select="accbi:PaymentOrder">
                                       <tr>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="accbi:PaymentID"/>
                                             <br/>
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="accbi:IssueDate"/>
                                             </xsl:call-template>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="accbi:PaymentAmount"/>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="accbi:CurrencyCode"/>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="accbi:Balance"/>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="accbi:PaymentModeCode"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="accbi:ReceiptDate"/>
                                             </xsl:call-template>
                                          </td>
                                          <td class="graph" style="width:40mm;">
                                             <xsl:if test="(number(accbi:PaymentIndication/catExch_ru:DepletedResources)=1) or (accbi:PaymentIndication/catExch_ru:DepletedResources='t') or (accbi:PaymentIndication/catExch_ru:DepletedResources='true')">
                                                <span class="graph">Средства на платежном поручении исчерпаны.</span>
                                                <br/>
                                             </xsl:if>
                                             <xsl:if test="(number(accbi:PaymentIndication/catExch_ru:AllowancesResources)=1) or (accbi:PaymentIndication/catExch_ru:AllowancesResources='t') or (accbi:PaymentIndication/catExch_ru:AllowancesResources='true')">
                                                <span class="graph">По платежному поручению уже были списания таможенных платежей.</span>
                                                <br/>
                                             </xsl:if>
                                             <xsl:if test="(number(accbi:PaymentIndication/catExch_ru:AttestedPaymentOrder)=1) or (accbi:PaymentIndication/catExch_ru:AttestedPaymentOrder='t') or (accbi:PaymentIndication/catExch_ru:AttestedPaymentOrder='true')">
                                                <span class="graph">Платежное поручение заверено инспектором в программном средстве учета и контроля таможенных платежей.</span>
                                                <br/>
                                             </xsl:if>
                                             <xsl:if test="(number(accbi:PaymentIndication/catExch_ru:NotAttestedPaymentOrder)=1) or (accbi:PaymentIndication/catExch_ru:NotAttestedPaymentOrder='t') or (accbi:PaymentIndication/catExch_ru:NotAttestedPaymentOrder='true')">
                                                <span class="graph">Платежное поручение не заверено инспектором в программном средстве учета и контроля таможенных платежей.</span>
                                                <br/>
                                             </xsl:if>
                                             <xsl:if test="(number(accbi:PaymentIndication/catExch_ru:PermitRemotenessWritten)=1) or (accbi:PaymentIndication/catExch_ru:PermitRemotenessWritten='t') or (accbi:PaymentIndication/catExch_ru:PermitRemotenessWritten='true')">
                                                <span class="graph">Платежное поручение разрешено к использованию при удаленном списании средств из СТО.</span>
                                                <br/>
                                             </xsl:if>
                                             <xsl:if test="(number(accbi:PaymentIndication/catExch_ru:InterdictionRemotenessWritten)=1) or (accbi:PaymentIndication/catExch_ru:InterdictionRemotenessWritten='t') or (accbi:PaymentIndication/catExch_ru:InterdictionRemotenessWritten='true')">
                                                <span class="graph">Платежное поручение не разрешено к использованию при удаленном списании средств из СТО.</span>
                                                <br/>
                                             </xsl:if>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                     </xsl:if>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
