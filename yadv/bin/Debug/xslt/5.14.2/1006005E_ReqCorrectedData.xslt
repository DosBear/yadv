<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="rcd cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rcd="urn:customs.ru:Information:CustomsDocuments:ReqCorrectedData:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="rcd:ReqCorrectedData">
      <html>
         <head>
            <title>Требование на корректировку сведений, заявленных в декларации на товары</title>
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
						font-size: 10pt;
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
               <h2>Требование на корректировку сведений, заявленных в таможенной декларации</h2>
               <br/>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graphMain" style="width:90mm;">
									Дата требования на корректировку:
								</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="rcd:RequestDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:90mm;">
									Номер запроса:
								</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="rcd:RequestNumber"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:90mm;">
									Номер статьи таможенного кодекса Таможенного Союза, в соответствии с которой направляется документ:
								</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="rcd:TKPunkt"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:90mm;">
									Декларант:
								</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="rcd:Declarant/cat_ru:OrganizationName"/>
                           <xsl:if test="rcd:Declarant/cat_ru:ShortName">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:value-of select="rcd:Declarant/cat_ru:ShortName"/>)
									</xsl:if>
                        </td>
                     </tr>
                     <xsl:if test="rcd:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                        <tr>
                           <td class="graphMain" style="width:90mm;">
										ОГРН декларанта:
									</td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="rcd:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="rcd:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                        <tr>
                           <td class="graphMain" style="width:90mm;">
										ИНН декларанта:
									</td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="rcd:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="rcd:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                        <tr>
                           <td class="graphMain" style="width:90mm;">
										КПП декларанта:
									</td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="rcd:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="rcd:Declarant/cat_ru:RKOrganizationFeatures/cat_ru:ITN">
                        <tr>
                           <td class="graphMain" style="width:90mm;">
										ИТН декларанта:
									</td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="rcd:Declarant/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
										<xsl:value-of select="rcd:Declarant/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
										<xsl:value-of select="rcd:Declarant/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
										<xsl:value-of select="rcd:Declarant/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="rcd:Declarant/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
                        <tr>
                           <td class="graphMain" style="width:90mm;">
										УНП декларанта:
									</td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="rcd:Declarant/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="rcd:Declarant/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
                        <tr>
                           <td class="graphMain" style="width:90mm;">
										БИН декларанта:
									</td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="rcd:Declarant/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="rcd:Declarant/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
                        <tr>
                           <td class="graphMain" style="width:90mm;">
										ИИН декларанта:
									</td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="rcd:Declarant/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graphMain" style="width:90mm;">
										Регистрационный номер ДТ:
									</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="rcd:GTDNumber/cat_ru:CustomsCode"/>
                           <xsl:text> / </xsl:text>
                           <xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="rcd:GTDNumber/cat_ru:RegistrationDate"/>
                           </xsl:call-template>
                           <xsl:text> / </xsl:text>
                           <xsl:value-of select="rcd:GTDNumber/cat_ru:GTDNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:180mm;">
										Выявленные несоответствия
									</td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <xsl:for-each select="rcd:Uncertainty/rcd:UncertDescription">
                              <xsl:value-of select="."/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <xsl:if test="rcd:Uncertainty/rcd:BadDocument">
                        <tr>
                           <td class="graphMain" colspan="2" style="width:180mm;">
										Сведения о документе, содержащем ошибку
									</td>
                        </tr>
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:10mm;">Иден- тифи- катор доку- мента</td>
                                       <td align="center" class="graph" style="width:20mm;">Название документа</td>
                                       <td align="center" class="graph" style="width:10mm;">Код вида доку- мента</td>
                                       <td align="center" class="graph" style="width:140mm;">Список ошибок</td>
                                    </tr>
                                    <xsl:for-each select="rcd:Uncertainty/rcd:BadDocument">
                                       <tr>
                                          <td align="center" class="graph" style="width:10mm;">
                                             <xsl:value-of select="rcd:DocID"/>
                                          </td>
                                          <td class="graph" style="width:20mm;">
                                             <xsl:value-of select="rcd:DocName"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:10mm;">
                                             <xsl:value-of select="rcd:DocModeID"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:140mm;">
                                             <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                                <tbody>
                                                   <tr>
                                                      <td align="center" class="graph" style="width:10mm;">Код ошибки</td>
                                                      <td align="center" class="graph" style="width:20mm;">Наименование ошибки</td>
                                                      <td align="center" class="graph" style="width:20mm;">Описание ошибки</td>
                                                      <td align="center" class="graph" style="width:10mm;">Номер товара по ДТ</td>
                                                      <td align="center" class="graph" style="width:15mm;">Имя ошибочного элемента</td>
                                                      <td align="center" class="graph" style="width:10mm;">Номер графы</td>
                                                      <td align="center" class="graph" style="width:10mm;">Верное значение</td>
                                                      <td align="center" class="graph" style="width:10mm;">Уровень ошибки</td>
                                                      <td align="center" class="graph" style="width:10mm;">Код норма- тив- ного доку- мента</td>
                                                      <td align="center" class="graph" style="width:15mm;">Описание поля, содер- жащего ошибку</td>
                                                      <td align="center" class="graph" style="width:10mm;">Верное (ожида- емое) значение</td>
                                                   </tr>
                                                   <xsl:for-each select="rcd:ListError">
                                                      <tr>
                                                         <td align="center" class="graph" style="width:10mm;">
                                                            <xsl:value-of select="rcd:ErrCode"/>
                                                         </td>
                                                         <td class="graph" style="width:20mm;">
                                                            <xsl:value-of select="rcd:ErrorName"/>
                                                         </td>
                                                         <td class="graph" style="width:20mm;">
                                                            <xsl:value-of select="rcd:ErrDescription"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </td>
                                                         <td align="center" class="graph" style="width:10mm;">
                                                            <xsl:value-of select="rcd:GTDGoodsNumber"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </td>
                                                         <td align="center" class="graph" style="width:15mm;">
                                                            <xsl:value-of select="rcd:ErrElement"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </td>
                                                         <td align="center" class="graph" style="width:10mm;">
                                                            <xsl:value-of select="rcd:ErrField"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </td>
                                                         <td align="center" class="graph" style="width:10mm;">
                                                            <xsl:value-of select="rcd:SuccessContent"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </td>
                                                         <td class="graph" style="width:10mm;">
                                                            <xsl:value-of select="rcd:ErrLevel"/>
                                                         </td>
                                                         <td align="center" class="graph" style="width:10mm;">
                                                            <xsl:value-of select="rcd:CodeOrder"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </td>
                                                         <td class="graph" style="width:15mm;">
                                                            <xsl:value-of select="rcd:ErrElementDesc"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </td>
                                                         <td align="center" class="graph" style="width:10mm;">
                                                            <xsl:value-of select="rcd:CorrectValue"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </td>
                                                      </tr>
                                                   </xsl:for-each>
                                                </tbody>
                                             </table>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:180mm;">
										Действия, необходимые для устранения несоответствий
									</td>
                     </tr>
                     <xsl:if test="rcd:Instruction/rcd:DateLimit">
                        <tr>
                           <td class="graphMain" style="width:90mm;">
											Срок, в который необходимо выполнить действия:
										</td>
                           <td class="graph" style="width:90mm;">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="rcd:Instruction/rcd:DateLimit"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graphMain" style="width:90mm;">
										Описание действий:
									</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:for-each select="rcd:Instruction/rcd:InstructionDescription">
                              <xsl:value-of select="."/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <xsl:if test="rcd:Instruction/rcd:InstrDocument">
                        <tr>
                           <td class="graphMain" style="width:90mm;">
											Документ, в соответствии с которым требуется выполнение действий:
										</td>
                           <td class="graph" style="width:90mm;">
                              <xsl:for-each select="rcd:Instruction/rcd:InstrDocument">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:90mm;">
										Таможенный орган:
									</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="rcd:Customs/cat_ru:Code"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="rcd:Customs/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:180mm;">
										Должностное лицо таможенного органа
									</td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:90mm;">
										ФИО должностного лица:
									</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="rcd:CustomsPerson/cat_ru:PersonName"/>
                        </td>
                     </tr>
                     <xsl:if test="rcd:CustomsPerson/cat_ru:LNP">
                        <tr>
                           <td class="graphMain" style="width:90mm;">
											ЛНП должностного лица:
										</td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="rcd:CustomsPerson/cat_ru:LNP"/>
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
