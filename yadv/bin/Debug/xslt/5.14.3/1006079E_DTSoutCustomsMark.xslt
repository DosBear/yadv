<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_EDTS_ru="urn:customs.ru:RUESADDTSCommonAggregateTypes:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:docm="urn:customs.ru:Information:CustomsDocuments:DTSOutCustomsMark:5.14.3" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="docm:DTSoutCustomsMark">
      <html>
         <head>
            <title>Служебные отметки ДТС</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
							
						div.page {
							width: 210mm;
							/*height: 297mm;*/
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							/*padding-left:	10mm;*/
							background: #ffffff;
							border: solid 1pt #000000;
							}
						
						/*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
					    @media print {div.page {border: none; margin: 0; padding: 0;}}
						
						div.goods {
							background: #ffffff;
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
							font-size: 7pt;
							}
							
						.graphBold {
							font-family: Arial;
							font-size: 7pt;
							font-weight: bold;
							}
							
						table, td {
							font-family:Courier New;
							border-collapse: collapse;
							}
		
						.graphMain {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
							
						.graphNo {
							font-size: 10pt;
							font-weight: bold;
							}
					</style>
         </head>
         <body>
            <div class="page">
               <table border="0" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" height="36">
                           <span style="font-size:28; font-weight:bold; text-decoration:underline; ">Служебные отметки ДТС</span>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <xsl:for-each select=".">
                  <table border="0" width="100%">
                     <tbody>
                        <tr>
                           <td align="right" colspan="2">
                              <span style="font-size:13; font-weight:bold; ">Уникальный идентификатор документа</span>
                           </td>
                        </tr>
                        <tr>
                           <td align="right" colspan="2">
                              <span style="font-size:14; ">
                                 <xsl:value-of select="cat_ru:DocumentID"/>
                              </span>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <table border="0" width="100%">
                     <tbody>
                        <tr>
                           <td align="right" colspan="2">
                              <span style="font-size:13; font-weight:bold; ">Код вида документа</span>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <table border="0" width="100%">
                     <tbody>
                        <tr>
                           <td align="right">
                              <span style="font-size:14; ">
                                 <xsl:value-of select="@DocumentModeID"/>
                              </span>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <table border="0" width="100%">
                     <tbody>
                        <tr>
                           <td align="right" colspan="2">
                              <span style="font-size:13; font-weight:bold; ">Идентификатор ДТС</span>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <table border="0" width="100%">
                     <tbody>
                        <tr>
                           <td align="right">
                              <span style="font-size:14; ">
                                 <xsl:value-of select="docm:DTSDocumentID"/>
                              </span>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <!--span style="font-size:18; font-weight:bold; ">Справочный номер ГТД</span>
                    <xsl:for-each select="docm:GTDNumber">
                        <table border="1" width="100%">
                            <tbody>
                                <tr>
                                    <td>
                                        <table border="0" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td align="center" width="5%">Код</td>
                                                    <td align="center" width="25%">
                                                        <xsl:for-each select="cat_ru:CustomsCode">
                                                            
                                                                <xsl:apply-templates />
                                                            </span>
                                                        </xsl:for-each>
                                                    </td>
                                                    <td align="center" width="10%">Дата</td>
                                                    <td align="center" width="100">
                                                        <xsl:for-each select="cat_ru:IssueDate">
                                                            
                                                                <xsl:apply-templates />
                                                            </span>
                                                        </xsl:for-each>
                                                    </td>
                                                    <td align="center" width="15%">Номер ГТД</td>
                                                    <td align="center" width="25%">
                                                        <xsl:for-each select="cat_ru:GTDNumber">
                                                            
                                                                <xsl:apply-templates />
                                                            </span>
                                                        </xsl:for-each>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </xsl:for-each-->
                  <br/>
                  <span style="font-size:18; font-weight:bold; ">Решения по таможенной стоимости ДТС</span>
                  <table border="1" width="100%">
                     <thead>
                        <tr>
                           <td align="center">Дата</td>
                           <td align="center">ЛНП инспектора</td>
                           <td align="center">ФИО</td>
                           <td align="center">Код решения</td>
                           <td align="center">Описание</td>
                        </tr>
                     </thead>
                     <tbody>
                        <xsl:for-each select="docm:DTSOutCostDecision">
                           <tr>
                              <td align="center" width="100">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_EDTS_ru:DateInf"/>
                                 </xsl:call-template>
                              </td>
                              <td align="center">
                                 <xsl:value-of select="cat_EDTS_ru:LNP"/>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="docm:PersonName">
                                       <xsl:value-of select="docm:PersonName"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:value-of select="cat_EDTS_ru:DecisionCode"/>
                              </td>
                              <td>
                                 <xsl:choose>
                                    <xsl:when test="cat_EDTS_ru:DecisionDescription">
                                       <xsl:value-of select="cat_EDTS_ru:DecisionDescription"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
                  <br/>
                  <span style="font-size:18; font-weight:bold; ">Решения об аннулировании или отзыве ДТС</span>
                  <table border="1" width="100%">
                     <thead>
                        <tr>
                           <td align="center">Дата</td>
                           <td align="center">ЛНП инспектора</td>
                           <td align="center">ФИО</td>
                           <td align="center">Код решения</td>
                           <td align="center">Описание</td>
                        </tr>
                     </thead>
                     <tbody>
                        <xsl:for-each select="docm:DTSOutRecallDecision">
                           <tr>
                              <td align="center" width="100">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_EDTS_ru:DateInf"/>
                                 </xsl:call-template>
                              </td>
                              <td align="center">
                                 <xsl:value-of select="cat_EDTS_ru:LNP"/>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="docm:PersonName">
                                       <xsl:value-of select="docm:PersonName"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td align="center">
                                 <xsl:value-of select="cat_EDTS_ru:DecisionCode"/>
                              </td>
                              <td>
                                 <xsl:choose>
                                    <xsl:when test="cat_EDTS_ru:DecisionDescription">
                                       <xsl:value-of select="cat_EDTS_ru:DecisionDescription"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
                  <br/>
                  <span style="font-size:18; font-weight:bold; ">Решения о таможенной стоимости и служебные отметки по товарам</span>
                  <table border="1">
                     <thead>
                        <tr>
                           <td align="center">Номер товара по ГТД</td>
                           <td align="center">Решение о таможенной стоимости товара</td>
                           <td align="center">Решение об аннулировании или отзыве ДТС по товару</td>
                        </tr>
                     </thead>
                     <tbody>
                        <xsl:for-each select="docm:DTSOutGoodsMark">
                           <tr valign="top">
                              <td align="center">
                                 <xsl:value-of select="docm:GTDGoodsNumber"/>
                              </td>
                              <td style="padding:0;">
                                 <table border="1">
                                    <thead>
                                       <tr>
                                          <td align="center">Дата</td>
                                          <td align="center">ЛНП инспектора</td>
                                          <td align="center">ФИО</td>
                                          <td align="center">Код решения</td>
                                          <td align="center">Описание</td>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <xsl:for-each select="docm:DTSGoodsCostDecision">
                                          <tr>
                                             <td align="center" width="100">
                                                <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="cat_EDTS_ru:DateInf"/>
                                                </xsl:call-template>
                                             </td>
                                             <td align="center">
                                                <xsl:value-of select="cat_EDTS_ru:LNP"/>
                                             </td>
                                             <td align="center">
                                                <xsl:choose>
                                                   <xsl:when test="docm:PersonName">
                                                      <xsl:value-of select="docm:PersonName"/>
                                                   </xsl:when>
                                                   <xsl:otherwise>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </xsl:otherwise>
                                                </xsl:choose>
                                             </td>
                                             <td align="center">
                                                <xsl:value-of select="cat_EDTS_ru:DecisionCode"/>
                                             </td>
                                             <td>
                                                <xsl:choose>
                                                   <xsl:when test="cat_EDTS_ru:DecisionDescription">
                                                      <xsl:value-of select="cat_EDTS_ru:DecisionDescription"/>
                                                   </xsl:when>
                                                   <xsl:otherwise>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </xsl:otherwise>
                                                </xsl:choose>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
                                    </tbody>
                                 </table>
                              </td>
                              <td style="padding: 0;">
                                 <table border="1">
                                    <thead>
                                       <tr>
                                          <td align="center">Дата</td>
                                          <td align="center">ЛНП инспектора</td>
                                          <td align="center">ФИО</td>
                                          <td align="center">Код решения</td>
                                          <td align="center">Описание</td>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <xsl:for-each select="docm:DTSGoodsRecallDecision">
                                          <tr>
                                             <td align="center" width="100">
                                                <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="cat_EDTS_ru:DateInf"/>
                                                </xsl:call-template>
                                             </td>
                                             <td align="center">
                                                <xsl:value-of select="cat_EDTS_ru:LNP"/>
                                             </td>
                                             <td align="center">
                                                <xsl:choose>
                                                   <xsl:when test="docm:PersonName">
                                                      <xsl:value-of select="docm:PersonName"/>
                                                   </xsl:when>
                                                   <xsl:otherwise>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </xsl:otherwise>
                                                </xsl:choose>
                                             </td>
                                             <td align="center">
                                                <xsl:value-of select="cat_EDTS_ru:DecisionCode"/>
                                             </td>
                                             <td>
                                                <xsl:choose>
                                                   <xsl:when test="cat_EDTS_ru:DecisionDescription">
                                                      <xsl:value-of select="cat_EDTS_ru:DecisionDescription"/>
                                                   </xsl:when>
                                                   <xsl:otherwise>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </xsl:otherwise>
                                                </xsl:choose>
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
                  <br/>
                  <!--span style="font-size:18; font-weight:bold; ">Таможенный орган</span>
					<xsl:for-each select="docm:Customs">
						<table border="1" width="100%">
							<tbody>
								<tr>
									<td>
										<table border="0" width="100%">
											<tbody>
												<tr>
													<td width="5%">Код</td>
													<td width="10%">
														<xsl:for-each select="cat_ru:Code">
															
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
													<td align="center" width="15%">Наименование</td>
													<td width="70%">
														<xsl:for-each select="cat_ru:NameInf">
															
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
					<span style="font-size:18; font-weight:bold; ">Должностное лицо</span>
					<xsl:for-each select="docm:CustomsPerson">
						<table border="1" width="100%">
							<tbody>
								<tr>
									<td>
										<table border="0" width="100%">
											<tbody>
												<tr>
													<td width="5%">ФИО</td>
													<td>
														<xsl:for-each select="cat_ru:NameInf">
															
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
													<td align="center" width="15%">ЛНП</td>
													<td width="7%">
														<xsl:for-each select="cat_ru:LNP">
															
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
					<br/-->
                  <span style="font-size:18; font-weight:bold; ">Отметки инспектора</span>
                  <table border="1">
                     <thead>
                        <tr>
                           <td align="center">Идентификатор отметки</td>
                           <td align="center">Описание идентификатора отметки</td>
                           <td align="center">Служебная запись</td>
                           <td align="center">ФИО должностного лица, внесшего отметку</td>
                           <td align="center">ЛНП должностного лица, внесшего отметку</td>
                           <td align="center">Дата </td>
                           <td align="center">Время</td>
                        </tr>
                     </thead>
                     <tbody>
                        <xsl:for-each select="docm:DTSOutMarks">
                           <tr>
                              <td align="center">
                                 <xsl:value-of select="cat_EDTS_ru:MarkIdentifier"/>
                              </td>
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="docm:IdentifierDescription">
                                       <xsl:value-of select="docm:IdentifierDescription"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td>
                                 <xsl:value-of select="cat_EDTS_ru:MarkDescription"/>
                              </td>
                              <td align="center">
                                 <xsl:value-of select="cat_EDTS_ru:PersonName"/>
                              </td>
                              <td align="center">
                                 <xsl:value-of select="cat_EDTS_ru:LNP"/>
                              </td>
                              <td align="center" width="100">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_EDTS_ru:DateInf"/>
                                 </xsl:call-template>
                              </td>
                              <td align="center">
                                 <xsl:value-of select="cat_EDTS_ru:TimeInf"/>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
                  <br/>
               </xsl:for-each>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
