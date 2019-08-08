<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="soa  cat_ru catComFin_ru" version="1.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:soa="urn:customs.ru:Information:CommercialFinanceDocuments:StatementOfAccount:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="soa:StatementOfAccount">
      <html>
         <head>
            <title>Выписка со счета</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
							width: 297mm;
							height: 210mm;
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
					td {
						font-family:Courier;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
				</style>
         </head>
         <body>
            <div class="page">
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" colspan="6" style="width:200mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" colspan="3" style="width:67mm;">
                           <xsl:text>Приложение 27</xsl:text>
                           <br/>
                           <xsl:text>к Положению Банка России "О безналичных расчетах в Российской Федерации"</xsl:text>
                           <br/>
                           <xsl:text>от 03.10.2002 № 2-П</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="3" style="width:90mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:value-of select="soa:DocumentInfo/soa:OrganizationName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" colspan="6" rowspan="4" style="width:177mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" colspan="3" style="width:90mm;">
                           <xsl:text>(наименование учреждения, выпустившего форму)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="2" style="width:50mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="soa:DocumentInfo/soa:CreationDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="soa:DocumentInfo/soa:CreationTime"/>
                        </td>
                        <td class="graph" style="width:40mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" colspan="2" style="width:50mm;">
                           <xsl:text>(дата, время формирования формы)</xsl:text>
                        </td>
                        <td class="graph" style="width:40mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="width:90mm;">
                           <xsl:text>Код формы документа по ОКУД 0401301</xsl:text>
                        </td>
                        <td class="graph" colspan="3" style="width:110mm;"/>
                        <td class="graph" colspan="3" style="width:67mm;"/>
                     </tr>
                     <tr>
                        <td class="graph" colspan="9" style="width:267mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <!-- вставить Код формы документа по ОКУД 0401301 - после добавления атрибута в схему -->
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:50mm;">
                           <xsl:text>БИК учреждения Банка России</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:40mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:value-of select="soa:AccountHolder/catComFin_ru:Bank/catComFin_ru:BIC"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" colspan="6" rowspan="3" style="width:177mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="3" style="width:90mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:value-of select="soa:AccountHolder/catComFin_ru:Bank/catComFin_ru:BankName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" colspan="3" style="width:90mm;">
                           <xsl:text>(наименование учреждения Банка России)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" rowspan="3" style="width:90mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="3" style="width:110mm;">
                           <h3>ЛИЦЕВОЙ СЧЕТ</h3>
                        </td>
                        <td class="graph" colspan="3" rowspan="3" style="width:67mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="3" style="width:110mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:value-of select="soa:AccountHolder/catComFin_ru:OrganizationName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" colspan="3" style="width:110mm;">
                           <xsl:text>(наименование владельца счета)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" rowspan="4" style="width:90mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" class="graph" style="width:30mm;">
                           <xsl:text>ЗА </xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:50mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="soa:TransInfo/soa:TransDate"/>
                           </xsl:call-template>
                        </td>
                        <td class="graph" style="width:30mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" class="graph" style="width:20mm;">
                           <xsl:text>ДПД </xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:47mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="soa:LastMovementDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:30mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:50mm;">
                           <xsl:text>(дата совершения операций по счету)</xsl:text>
                        </td>
                        <td class="graph" style="width:30mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" class="graph" style="width:20mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:47mm;">
                           <xsl:text>(дата последнего движения по счету)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" class="graph" colspan="3" rowspan="2" style="width:110mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" rowspan="2" style="width:20mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" class="graph" style="width:15mm;">
                           <xsl:text>ОТВ.ИСП. </xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:32mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:15mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:32mm;">
                           <xsl:text>(подпись)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:15mm;">
                           <xsl:text>СЧЕТ № </xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:35mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:value-of select="soa:AccountHolder/catComFin_ru:Bank/catComFin_ru:PersonalAccount"/>
                        </td>
                        <td class="graph" colspan="7" style="width:217mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="9" style="width:267mm;">
                           <br/>
                           <xsl:text>ВХОДЯЩИЙ ОСТАТОК</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="9" style="width:267mm;">
                           <table border="1" cellpadding="3" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
									<td align="center" class="graph" style="width:20mm;">
										<xsl:text>Дата</xsl:text>
									</td>
                                    <td align="center" class="graph" style="width:10mm;">
                                       <xsl:text>№ ДОК.</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:10mm;">
                                       <xsl:text>ВО</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:20mm;">
                                       <xsl:text>БИК БАНКА КОРР.</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:30mm;">
                                       <xsl:text>КОРР. СЧЕТ</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:40mm;">
                                       <xsl:text>СЧЕТ ОТПРАВИТЕЛЯ / ПЛАТЕЛЬЩИКА</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:40mm;">
                                       <xsl:text>СЧЕТ ПОЛУЧАТЕЛЯ</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:20mm;">
                                       <xsl:text>ПР</xsl:text>
                                       <br/>
                                       <xsl:text>ЗО</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:30mm;">
                                       <xsl:text>ДЕБЕТ</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:30mm;">
                                       <xsl:text>КРЕДИТ</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:17mm;">
                                       <xsl:text>№ СТРОКИ</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:20mm;">
                                       <xsl:text>1</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:10mm;">
                                       <xsl:text>2</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:10mm;">
                                       <xsl:text>3</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:20mm;">
                                       <xsl:text>4</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:30mm;">
                                       <xsl:text>5</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:40mm;">
                                       <xsl:text>6</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:40mm;">
                                       <xsl:text>7</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:20mm;">
                                       <xsl:text>8</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:30mm;">
                                       <xsl:text>9</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:30mm;">
                                       <xsl:text>10</xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:17mm;">
                                       <xsl:text>11</xsl:text>
                                    </td>
                                 </tr>
                                 <xsl:for-each select="soa:TransInfo">
                                    <tr>
                                       <td align="center" class="graph" style="width:20mm;">
										   <xsl:call-template name="russian_date">
											   <xsl:with-param name="dateIn" select="soa:TransDate"/>
                                          </xsl:call-template>
                                       </td>									
                                       <td align="center" class="graph" style="width:10mm;">
                                          <xsl:value-of select="soa:AccDocNo"/>
                                       </td>
                                       <td align="center" class="graph" style="width:10mm;">
                                          <xsl:value-of select="soa:TransKind"/>
                                       </td>
                                       <td align="center" class="graph" style="width:20mm;">
                                          <xsl:value-of select="soa:BICCorr"/>
                                       </td>
                                       <td align="center" class="graph" style="width:30mm;">
                                          <xsl:value-of select="soa:CorrAccBrf"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graph" style="width:40mm;">
                                          <xsl:value-of select="soa:PayerPersonalAccount"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graph" style="width:40mm;">
                                          <xsl:value-of select="soa:PayeePersonalAccount"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graph" style="width:20mm;">
                                          <xsl:value-of select="soa:TurnoverKind"/>
                                       </td>
                                       <td align="center" class="graph" style="width:30mm;">
                                          <xsl:if test="soa:DC=1">
                                             <xsl:value-of select="soa:Amount"/>
                                          </xsl:if>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graph" style="width:30mm;">
                                          <xsl:if test="soa:DC=2">
                                             <xsl:value-of select="soa:Amount"/>
                                          </xsl:if>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graph" style="width:17mm;">
                                          <xsl:value-of select="position()"/>
                                          <!-- вставить № СТРОКИ - после добавления атрибута в схему -->
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" class="graph" colspan="2" style="width:50mm;">
                           <xsl:text>ИТОГО ОБОРОТЫ</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="4" style="width:150mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:20mm;">
                           <xsl:value-of select="soa:DebetAmount"/>
                        </td>
                        <td align="right" class="graph" style="width:15mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="graph" style="width:32mm;">
                           <xsl:value-of select="soa:CreditAmount"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" class="graph" colspan="3" style="width:90mm;">
                           <xsl:text>ИСХОДЯЩИЙ ОСТАТОК</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="3" style="width:110mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" class="graph" style="width:20mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" class="graph" style="width:15mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:32mm;">
                           <xsl:value-of select="soa:OutBal"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" rowspan="5" style="width:120mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" class="graph" colspan="2" style="width:80mm;">
                           <xsl:text>ВЫПИСКА ВЫДАНА ЗА </xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:35mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="soa:AbstractDate"/>
                           </xsl:call-template>
                        </td>
                        <td class="graph" rowspan="5" style="width:32mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" class="graph" colspan="2" style="width:80mm;">
                           <xsl:text>В ПОРЯДКЕ </xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:35mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="4" style="width:115mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" class="graph" colspan="2" style="width:80mm;">
                           <xsl:text>ПОДПИСЬ РАБОТНИКА БАНКА </xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:35mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" class="graph" colspan="2" style="width:80mm;">
                           <xsl:text>ДАТА </xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:35mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <!-- вставить ДАТА - после добавления атрибута в схему -->
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
