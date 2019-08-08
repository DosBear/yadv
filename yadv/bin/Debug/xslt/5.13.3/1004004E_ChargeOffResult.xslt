<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cores cat_ru catExch_ru" version="1.0" xmlns:catExch_ru="urn:customs.ru:Information:ExchangeDocuments:ExchangeCommonAggregateTypes:5.13.1" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cores="urn:customs.ru:Information:ExchangeDocuments:ChargeOffResult:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="cores:ChargeOffResult">
      <html>
         <head>
            <title>Результаты списания средств с лицевого счета участника ВЭД</title>
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
						Результаты списания средств с лицевого счета участника ВЭД
					</h2>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graphNo" style="width:90mm;">
									Номер ГТД, для которой проводилось списание средств
								</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="cores:GTDID/cat_ru:CustomsCode"/>
                           <xsl:text> / </xsl:text>
                           <xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="cores:GTDID/cat_ru:RegistrationDate"/>
                           </xsl:call-template>
                           <xsl:text> / </xsl:text>
                           <xsl:value-of select="cores:GTDID/cat_ru:GTDNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphNo" style="width:90mm;">
									Таможенный орган:
								</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="cores:CustomsCode"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;">
                           <span class="graphNo">Статус ответа: </span>
                        </td>
                        <td class="graph" style="width:90mm;">
                           <xsl:if test="cores:ResponseStatus/cores:ResponseStatus= 'FDK'">
                              <span class="graph">Ошибка в запросе</span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="cores:ResponseStatus/cores:ResponseStatus= 'FDL'">
                              <span class="graph">Ошибка в присланной ГТД.</span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="cores:ResponseStatus/cores:ResponseStatus= 'FLS'">
                              <span class="graph">Внутренняя  ошибка программного средств учета и контроля.</span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="cores:ResponseStatus/cores:ResponseStatus= 'A'">
                              <span class="graph">ГТД имеется в БД и не может быть заменена.</span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="cores:ResponseStatus/cores:ResponseStatus= 'B'">
                              <span class="graph">ГТД заблокирована или с ней работает инспектором отдела федеральных таможенных платежей.</span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="cores:ResponseStatus/cores:ResponseStatus= 'P'">
                              <span class="graph">Плательщик не зарегистрирован в программном средстве учета и контроля таможенных платежей.</span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="cores:ResponseStatus/cores:ResponseStatus= 'U'">
                              <span class="graph">Отправитель или получатель не зарегистрирован в программном средстве учета и контроля таможенных платежей.</span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="cores:ResponseStatus/cores:ResponseStatus= 'V'">
                              <span class="graph">Обнаружено несоответствие сумм в документе контроля платежей суммам в графе B ГТД.</span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="cores:ResponseStatus/cores:ResponseStatus= 'D'">
                              <span class="graph">Недостаточно средств для списания.</span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="cores:ResponseStatus/cores:ResponseStatus= 'K'">
                              <span class="graph">Орг-ция имеет задолженность.</span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="cores:ResponseStatus/cores:ResponseStatus= 'M'">
                              <span class="graph">Орг-ции запрещено удаленное списание средств.</span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="cores:ResponseStatus/cores:ResponseStatus= 'RE'">
                              <span class="graph">Списание по указанной ГТД уже производилось, произведено повторное списание.</span>
                              <br/>
                           </xsl:if>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								
									(<xsl:value-of select="cores:ResponseStatus"/>)
								</td>
                     </tr>
                     <xsl:if test="cores:PaymentOrder">
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
                                       <td align="center" class="graph" style="width:30mm;">Номер и дата платежного поручения</td>
                                       <td align="center" class="graph" style="width:30mm;">Остаток средств на ПП после списания</td>
                                       <td align="center" class="graph" style="width:30mm;">Код валюты платежного поручения</td>
                                       <td align="center" class="graph" style="width:30mm;">Сумма нехватки средств после списания</td>
                                       <td align="center" class="graph" style="width:60mm;">Признаки платежного поручения</td>
                                    </tr>
                                    <xsl:for-each select="cores:PaymentOrder">
                                       <tr>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cores:PaymentID"/>
                                             <br/>от
															<xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="cores:PaymentDate"/>
                                             </xsl:call-template>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cores:Balance"/>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="cores:CurrencyCode"/>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:if test="cores:ShortageAssets">
                                                <xsl:value-of select="cores:ShortageAssets"/>
                                             </xsl:if>
                                          </td>
                                          <td class="graph" style="width:60mm;">
                                             <xsl:if test="(number(cores:PaymentIndication/catExch_ru:DepletedResources)=1) or (cores:PaymentIndication/catExch_ru:DepletedResources='t')">
                                                <span class="graph">Средства на платежном поручении исчерпаны.</span>
                                                <br/>
                                             </xsl:if>
                                             <xsl:if test="(number(cores:PaymentIndication/catExch_ru:AllowancesResources)=1) or (cores:PaymentIndication/catExch_ru:AllowancesResources='t')">
                                                <span class="graph">По платежному поручению уже были списания таможенных платежей.</span>
                                                <br/>
                                             </xsl:if>
                                             <xsl:if test="cores:PaymentIndication/catExch_ru:AttestedPaymentOrder">
                                                <span class="graph">Платежное поручение заверено инспектором в программном средстве учета и контроля таможенных платежей.</span>
                                                <br/>
                                             </xsl:if>
                                             <xsl:if test="cores:PaymentIndication/catExch_ru:NotAttestedPaymentOrder">
                                                <span class="graph">Платежное поручение не заверено инспектором в программном средстве учета и контроля таможенных платежей.</span>
                                                <br/>
                                             </xsl:if>
                                             <xsl:if test="cores:PaymentIndication/catExch_ru:PermitRemotenessWritten">
                                                <span class="graph">Платежное поручение разрешено к использованию при удаленном списании средств из СТО.</span>
                                                <br/>
                                             </xsl:if>
                                             <xsl:if test="cores:PaymentIndication/catExch_ru:InterdictionRemotenessWritten">
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
                     <xsl:if test="cores:ListCurrency">
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <span class="graphNo">Список валют, по которым недостаточно средств при списании средств: </span>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:90mm;">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:45mm;">Сумма нехватки средств</td>
                                       <td align="center" class="graph" style="width:45mm;">Код валюты</td>
                                    </tr>
                                    <xsl:for-each select="cores:ListCurrency">
                                       <tr>
                                          <td align="center" class="graph" style="width:45mm;">
                                             <xsl:value-of select="cores:Amount"/>
                                          </td>
                                          <td align="center" class="graph" style="width:45mm;">
                                             <xsl:value-of select="cores:CurrencyCode"/>
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
