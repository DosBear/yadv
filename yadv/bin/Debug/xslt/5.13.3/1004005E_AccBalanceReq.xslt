<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="accbr cat_ru" version="1.0" xmlns:accbr="urn:customs.ru:Information:ExchangeDocuments:AccBalanceReq:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="accbr:AccBalanceReq">
      <html>
         <head>
            <title>Запрос остатков на платежных поручениях участника ВЭД</title>
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
						Запрос остатков на платежных поручениях участника ВЭД
					</h2>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graphNo" style="width:90mm;">
									Таможенный орган:
								</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="accbr:CustomsCode"/>
                        </td>
                     </tr>
                     <xsl:if test="accbr:INN">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">ИНН: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="accbr:INN"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="accbr:KPP">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">КПП: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="accbr:KPP"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="accbr:CurrencyCode">
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <span class="graphNo">Код валюты: </span>
                           </td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="accbr:CurrencyCode"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="accbr:PaymentInfo">
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
                                       <td align="center" class="graph" style="width:60mm;">Номер платежного поручения</td>
                                       <td align="center" class="graph" style="width:60mm;">Дата платежного поручения</td>
                                       <td align="center" class="graph" style="width:60mm;">Общая сумма по платежному документу</td>
                                    </tr>
                                    <xsl:for-each select="accbr:PaymentInfo">
                                       <tr>
                                          <td align="center" class="graph" style="width:60mm;">
                                             <xsl:value-of select="accbr:ID"/>
                                          </td>
                                          <td align="center" class="graph" style="width:60mm;">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="accbr:IssueDate"/>
                                             </xsl:call-template>
                                          </td>
                                          <td align="center" class="graph" style="width:60mm;">
                                             <xsl:if test="accbr:Amount">
                                                <xsl:value-of select="accbr:Amount"/>
                                             </xsl:if>
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
                           <table border="0" cellpadding="3" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td class="graph" style="width:90mm;">
                                       <xsl:if test="accbr:CustomsPerson/cat_ru:LNP">
                                          <xsl:value-of select="accbr:CustomsPerson/cat_ru:LNP"/>
                                          <br/>
                                       </xsl:if>
                                    </td>
                                    <td class="graph" style="width:90mm;">
                                       <xsl:text>_____________</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="accbr:CustomsPerson/cat_ru:PersonName"/>
                                       <br/>
                                       <span class="graph">(Подпись,фамилия,инициалы)</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
