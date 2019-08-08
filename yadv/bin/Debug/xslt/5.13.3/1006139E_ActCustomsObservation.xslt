<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:actco="urn:customs.ru:Information:CustomsDocuments:ActCustomsObservation:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
      <xsl:param name="gtd"/>
      <xsl:choose>
         <xsl:when test="substring($gtd,5,1)='-' and substring($gtd,8,1)='-'">
            <xsl:value-of select="substring($gtd,9,2)"/>
            <xsl:value-of select="substring($gtd,6,2)"/>
            <xsl:value-of select="substring($gtd,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$gtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="actco:ActCustomsObservation">
      <html>
         <head>
            <title>Решение о проведении дополнительной проверки.</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Arial;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						
						.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 9pt;
						}
						.graph14Bold {
						font-family: Arial;
						font-size: 14pt;
						font-weight: bold;
						}				
						.bordered {
					border-bottom: solid 1pt #000000;
										}	
                </style>
         </head>
         <body>
            <div class="page">
               <table style="width:210mm">
                  <tbody>
                     <tr>
                        <td style="width:70mm" valign="top">
                           <table style="width:70mm">
                              <tbody>
                                 <tr>
                                    <td class="bordered">
                                       <xsl:value-of select="actco:Customs/cat_ru:Code"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle">(указывается код и наименование</td>
                                 </tr>
                                 <tr>
                                    <td class="bordered">
                                       <xsl:value-of select="actco:Customs/cat_ru:OfficeName"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle">таможенного органа)</td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                        <td style="width:140mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table>
                  <tbody>
                     <tr>
                        <td>
                           <br/>
                           <br/>
                           <span class="graph14Bold">АКТ</span>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <b>таможенного наблюдения</b>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
										от <span class="bordered">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="actco:ActDate"/>
                              </xsl:call-template>
                           </span> 
										
									</td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle">(дата составления акта)<br/>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">Дата и время начала таможенного наблюдения 
									<span class="bordered">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="actco:BeginDate"/>
                              </xsl:call-template> 
									<xsl:value-of select="substring(string(actco:BeginTime),1,5)"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">Дата и время окончания таможенного наблюдения 
									<span class="bordered">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="actco:EndDate"/>
                              </xsl:call-template> 
									<xsl:value-of select="substring(string(actco:EndTime),1,5)"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
										Основание для проведения таможенного наблюдения <span class="bordered">
                              <xsl:value-of select="actco:Reason"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
										Место проведения таможенного наблюдения <span class="bordered">
                              <xsl:value-of select="actco:ObservationPlace/actco:InspPlaceName"/> 
										
									<xsl:if test="actco:ObservationPlace/cat_ru:OfficeName">
                                 <xsl:value-of select="actco:ObservationPlace/cat_ru:OfficeName"/> 
									</xsl:if>
                              <xsl:if test="actco:ObservationPlace/actco:InformationTypeCode">
                                 <xsl:value-of select="actco:ObservationPlace/actco:InformationTypeCode"/> 
									</xsl:if>
                              <xsl:if test="actco:ObservationPlace/actco:InspPlaceDesc">
                                 <xsl:for-each select="actco:ObservationPlace/actco:InspPlaceDesc">
                                    <xsl:value-of select="."/> 
										</xsl:for-each>
                              </xsl:if>
                              <xsl:if test="actco:ObservationPlace/actco:WarehousePlace">
                                 <xsl:value-of select="actco:ObservationPlace/actco:WarehousePlace/cat_ru:PrDocumentName"/> 
										№ 
										<xsl:value-of select="actco:ObservationPlace/actco:WarehousePlace/cat_ru:PrDocumentNumber"/> 
										 от 
										 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="actco:ObservationPlace/actco:WarehousePlace/cat_ru:PrDocumentDate"/>
                                 </xsl:call-template> 
									</xsl:if>
                              <xsl:if test="actco:ObservationPlace/actco:Address">
                                 <xsl:for-each select="actco:ObservationPlace/actco:Address">
                                    <xsl:call-template name="Address"/> 
										</xsl:for-each>
                              </xsl:if>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
                           <table>
                              <tr>
                                 <td valign="top" width="20%">
								Вид наблюдения: </td>
                                 <xsl:if test="(actco:ObservationKind='0') or (actco:ObservationKind='f') or (actco:ObservationKind='false')">
                                    <td valign="top" width="25%">[Х] - непосредственное</td>
                                    <td valign="top">[ ] - опосредованное (с применением технических средств таможенного контроля (далее-ТСТК))</td>
                                 </xsl:if>
                                 <xsl:if test="(actco:ObservationKind='1') or (actco:ObservationKind='t') or (actco:ObservationKind='true')">
                                    <td valign="top" width="25%">[ ] - непосредственное</td>
                                    <td valign="top">[Х] - опосредованное (с применением технических средств таможенного контроля (далее-ТСТК))</td>
                                 </xsl:if>
                              </tr>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">Применяемые ТСТК <span class="bordered">
                              <xsl:for-each select="actco:ApplicationTMCC">
                                 <xsl:value-of select="actco:Kind"/> <xsl:value-of select="actco:Number"/> </xsl:for-each>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle">(вид ТСТК, инвентарные номера)</td>
                     </tr>
                     <tr>
                        <td align="left">Операции, при которых осуществляется таможенное наблюдение:</td>
                     </tr>
                     <tr>
                        <td align="left">
                           <xsl:if test="(actco:OperationsCustObservation='1')">[Х] - перевозка товаров и транспортных средств   [ ] - грузовые операции   [ ] - прочее</xsl:if>
                           <xsl:if test="(actco:OperationsCustObservation='2')">[ ] - перевозка товаров и транспортных средств    [Х] - грузовые операции   [ ] - прочее</xsl:if>
                           <xsl:if test="(actco:OperationsCustObservation='3')">[ ] - перевозка товаров и транспортных средств    [ ] - грузовые операции   [Х] - прочее</xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">Лица, осуществляющие операции 
								<span class="bordered">
                              <xsl:for-each select="actco:PersonsInvolvedOperation">
                                 <xsl:value-of select="cat_ru:PersonPost"/> 
									<xsl:value-of select="cat_ru:PersonSurname"/> 
									<xsl:value-of select="cat_ru:PersonName"/> 
									<xsl:value-of select="cat_ru:PersonMiddleName"/>
                                 <xsl:if test="position()!=last()">, </xsl:if>
                              </xsl:for-each>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">Описание процесса таможенного наблюдения и его результаты
								<span class="bordered">
                              <xsl:for-each select="actco:ProcessDescriptionResults">
                                 <xsl:value-of select="."/> 
								</xsl:for-each>
                           </span>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
									К акту прилагаются <span class="bordered">
                              <text/>
                              <xsl:value-of select="actco:AddiSheetsNumber"/>
                              <text/>
                           </span>доп. лист(листов),  <span class="bordered">
                              <xsl:value-of select="actco:Application"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <table style="width:210mm">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graphLittle">(кол-во дополнительных листов)</td>
                                    <td align="center" class="graphLittle">(описание приложений к акту)</td>
                                 </tr>
                              </tbody>
                           </table>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <table align="left" style="width:210mm">
                              <tbody>
                                 <tr>
                                    <td align="left" style="width:50mm" valign="top">Должностные лица</td>
                                    <td align="center">
                                       <table style="width:160mm">
                                          <tbody>
                                             <xsl:for-each select="actco:CustomsPerson">
                                                <tr>
                                                   <td class="bordered">
                                                      <xsl:value-of select="cat_ru:PersonName"/> 
																		<xsl:value-of select="cat_ru:LNP"/>
                                                   </td>
                                                </tr>
                                                <tr class="graphLittle">
                                                   <td>(подпись, инициалы, фамилия)</td>
                                                </tr>
                                             </xsl:for-each>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table>
                  <tbody>
                     <tr>
                        <td>
                           <br/>
                           <br/>
                           <xsl:for-each select="actco:AddSheet">
                              <table style="width:210mm">
                                 <tbody>
                                    <tr>
                                       <td style="width:70mm" valign="top">
                                          <table style="width:70mm">
                                             <tbody>
                                                <tr>
                                                   <td class="bordered">
                                                      <xsl:value-of select="../actco:Customs/cat_ru:Code"/>
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <td class="graphLittle">(указывается код и наименование</td>
                                                </tr>
                                                <tr>
                                                   <td class="bordered">
                                                      <xsl:value-of select="../actco:Customs/cat_ru:OfficeName"/>
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <td class="graphLittle">таможенного органа)</td>
                                                </tr>
                                             </tbody>
                                          </table>
                                       </td>
                                       <td style="width:140mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                              <table>
                                 <tbody>
                                    <tr>
                                       <td class="graph14Bold">
                                          <br/>
                                          <br/>
														ДОПОЛНИТЕЛЬНЫЙ ЛИСТ <span class="bordered">№<xsl:value-of select="actco:NumberSheet"/>
                                          </span>
                                          <br/>
                                          <br/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td>
                                          <b>к акту таможенного наблюдения</b>
                                          <br/>
                                          <br/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td>
										от <span class="bordered">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="../actco:ActDate"/>
                                             </xsl:call-template>
                                          </span> 
										
									</td>
                                    </tr>
                                    <tr>
                                       <td align="center" class="graphLittle">(дата составления акта)<br/>
                                          <br/>
                                          <br/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="left">Описание процесса таможенного наблюдения и его результаты 
									<span class="bordered">
                                             <xsl:for-each select="actco:Description">
                                                <xsl:value-of select="."/> 
														</xsl:for-each>
                                          </span>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td>
                                          <table align="left" style="width:210mm">
                                             <tbody>
                                                <tr>
                                                   <td align="left" style="width:50mm" valign="top">Должностные лица</td>
                                                   <td align="center">
                                                      <table style="width:160mm">
                                                         <tbody>
                                                            <xsl:for-each select="../actco:CustomsPerson">
                                                               <tr>
                                                                  <td class="bordered">
                                                                     <xsl:value-of select="cat_ru:PersonName"/> 
																		<xsl:value-of select="cat_ru:LNP"/>
                                                                  </td>
                                                               </tr>
                                                               <tr class="graphLittle">
                                                                  <td>(подпись, инициалы, фамилия)</td>
                                                               </tr>
                                                            </xsl:for-each>
                                                         </tbody>
                                                      </table>
                                                   </td>
                                                </tr>
                                             </tbody>
                                          </table>
                                          <br/>
                                          <br/>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
