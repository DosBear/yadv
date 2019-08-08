<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ntvi="urn:customs.ru:Information:ExchangeDocuments:NotifViolation:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <!--Приложение 1 к Приказу ГТК России от 02.10.2003 No. 1096 -->
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
   <xsl:template name="russian_time">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,14,1)=':' and substring($dateIn,17,1)=':'">
            <xsl:value-of select="substring($dateIn,12,2)"/>:<xsl:value-of select="substring($dateIn,15,2)"/>:<xsl:value-of select="substring($dateIn,18,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date2">
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
   <xsl:template match="ntvi:NotifViolation">
      <html>
         <head>
            <title>Уведомление/Требование</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
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
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 14pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 14pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
						font-weight: normal;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 11pt;
						font-weight: normal;
						}				
						.bordered {
					border: solid 1pt #000000;
										}			
					</style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" class="bold">
                           <xsl:choose>
                              <xsl:when test="ntvi:NotificationRequest = '1'">
								УВЕДОМЛЕНИЕ
								<br/>о несоблюдении условий выпуска товаров, информация о не соответствии заявленных сведений и нарушениях, выявленных в ходе проверки ДТ
								<br/><br/>№ <xsl:value-of select="ntvi:ViolationNimber"/>
								от	  <span class="normal">
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="ntvi:ViolationDate"/>
                                    </xsl:call-template>
                                    <br/>
                                 </span>
                              </xsl:when>
                              <xsl:otherwise>
								ТРЕБОВАНИЕ<br/> № <xsl:value-of select="ntvi:ViolationNimber"/>
								от   	 <span class="normal">
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="ntvi:ViolationDate"/>
                                    </xsl:call-template>
                                 </span>
                              </xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <br/>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain" style="width:60mm">
                           <xsl:value-of select="ntvi:Customs/cat_ru:Code"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="ntvi:Customs/cat_ru:OfficeName"/>
                        </td>
                        <td align="right" class="graphMain" style="width:130mm">
                           <xsl:value-of select="ntvi:Applicant/cat_ru:OrganizationName"/>   
                              <br/>
                           <xsl:apply-templates select="ntvi:Applicant/cat_ru:Address"/>
                                                         <br/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain" style="width:190mm">
                           <br/>   В соответствии со статьей <span class="graph">
                              <xsl:value-of select="ntvi:NotifLawArticle"/>
                           </span>
                     Таможенного кодекса ЕАЭС уведомляем, что в ходе проверки таможенной декларации
                     № <span class="graph">
                              <xsl:value-of select="ntvi:GTDNUmber/cat_ru:CustomsCode"/>
                              <xsl:text>/</xsl:text>
                              <xsl:call-template name="russian_date2">
                                 <xsl:with-param name="dateIn" select="ntvi:GTDNUmber/cat_ru:RegistrationDate"/>
                              </xsl:call-template>
                              <xsl:text>/</xsl:text>
                              <xsl:value-of select="ntvi:GTDNUmber/cat_ru:GTDNumber"/>
                           </span>
                           <xsl:choose>
                              <xsl:when test="ntvi:NotificationRequest = '1'">
								выявлено несоблюдение условий выпуска товаров, предусмотренных пунктом (пунктами) 
								<span class="graph">
                                    <xsl:value-of select="ntvi:ViolationInfo/ntvi:LawArticle"/>
                                 </span> статьи 118 Кодекса, и (или) обнаружены признаки, указывающие на то, что заявленные при декларировании сведения могут являться недостоверными, выражающиеся в:
								</xsl:when>
                              <xsl:otherwise>
								обнаружены:
								</xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <xsl:for-each select="ntvi:ViolationInfo/ntvi:ViolationText">
                        <tr>
                           <td align="left" class="graph" style="width:190mm">
                              <xsl:value-of select="."/>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <xsl:choose>
                        <xsl:when test="ntvi:NotificationRequest = '1'">
                           <tr>
                              <td align="center" style="width:190mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td align="left" class="graphMain" style="width:190mm">   
								  Для осуществления выпуска товаров Вам необходимо в срок до
								<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="ntvi:Instruction/ntvi:DateLimit"/>
                                 </xsl:call-template>
                                 <xsl:text> </xsl:text>
                                 <xsl:call-template name="russian_time">
                                    <xsl:with-param name="dateIn" select="ntvi:Instruction/ntvi:DateLimit"/>
                                 </xsl:call-template>
                              </td>
                           </tr>
                           <tr>
                              <td align="center" style="width:190mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <xsl:for-each select="ntvi:Instruction/ntvi:InstrDescription">
                              <tr>
                                 <td align="left" class="graph" style="width:190mm">
                                    <xsl:value-of select="."/>
                                 </td>
                              </tr>
                           </xsl:for-each>
                           <tr>
                              <td align="center" class="graphLittle" style="width:190mm">  
							(указывается, какие именно действия, достаточные для выпуска товаров, должно совершить лицо, декларирующее товары)
							</td>
                           </tr>
                        </xsl:when>
                        <xsl:otherwise>
                           <tr>
                              <td align="center" style="width:190mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td align="left" class="graphMain" style="width:190mm">  
							Для соблюдения условий выпуска товаров в соответствии с пунктом <span class="graph">
                                    <xsl:value-of select="ntvi:ViolationInfo/ntvi:LawArticle"/>
                                 </span> Таможенного кодекса ЕАЭС Вам необходимо в срок до 	<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="ntvi:Instruction/ntvi:DateLimit"/>
                                 </xsl:call-template>
                                 <xsl:text> </xsl:text>
                                 <xsl:call-template name="russian_time">
                                    <xsl:with-param name="dateIn" select="ntvi:Instruction/ntvi:DateLimit"/>
                                 </xsl:call-template> скорректировать сведения о
                     </td>
                           </tr>
                           <tr>
                              <td align="center" style="width:190mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <xsl:for-each select="ntvi:Instruction/ntvi:InstrDescription">
                              <tr>
                                 <td align="left" class="graph" style="width:190mm">
                                    <xsl:value-of select="."/>
                                 </td>
                              </tr>
                           </xsl:for-each>
                           <xsl:if test="ntvi:Instruction/ntvi:CorrectReq/ntvi:CorrectDescription">
                              <xsl:for-each select="ntvi:Instruction/ntvi:CorrectReq">
                                 <tr>
                                    <td align="left" class="graph" style="width:190mm">  
						Скорректировать: <xsl:value-of select="ntvi:CorrectDescription"/> в срок до
                    <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="ntvi:CorrectDateLimit"/>
                                       </xsl:call-template>
                                       <xsl:text> </xsl:text>
                                       <xsl:call-template name="russian_time">
                                          <xsl:with-param name="dateIn" select="ntvi:CorrectDateLimit"/>
                                       </xsl:call-template>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </xsl:if>
                           <xsl:if test="ntvi:Instruction/ntvi:DocumentReq">
                              <tr>
                                 <td align="left" class="graphMain" style="width:190mm">  
								и представить
							</td>
                              </tr>
                              <xsl:for-each select="ntvi:Instruction/ntvi:DocumentReq">
                                 <tr>
                                    <td align="left" class="graph" style="width:190mm">
                                       <xsl:value-of select="ntvi:DocsDescription"/>
                                       <xsl:if test="ntvi:DocDateLimit">
								в срок до
                    <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="ntvi:DocDateLimit"/>
                                          </xsl:call-template>
                                          <xsl:text> </xsl:text>
                                          <xsl:call-template name="russian_time">
                                             <xsl:with-param name="dateIn" select="ntvi:DocDateLimit"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </xsl:if>
                           <tr>
                              <td align="center" class="graphLittle" style="width:190mm">  
							(указываются: расчет подлежащих уплате таможенных пошлин, налогов, размер требуемого обеспечения <br/> уплаты таможенных платежей и (или) какие именно документы, подтверждающие соблюдение  <br/>соответствующих ограничений, должны быть представлены)
							</td>
                           </tr>
                        </xsl:otherwise>
                     </xsl:choose>
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" colspan="3" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" style="width:95mm">
                           <!--xsl:value-of select="ntvi:CustomsPerson/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text-->
                           <xsl:value-of select="ntvi:CustomsPerson/cat_ru:PersonName"/>
                           <!--xsl:text> </xsl:text>
                           <xsl:value-of select="ntvi:CustomsPerson/cat_ru:PersonMiddleName"/-->
                        </td>
                        <td align="center" style="width:45mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:45mm">
                           <xsl:value-of select="ntvi:CustomsPerson/cat_ru:LNP"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:95mm">
                                (уполномоченное должностное лицо таможенного органа)</td>
                        <td align="center" style="width:45mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:45mm">
                               ЛНП</td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="3" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" colspan="3" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" style="width:95mm">
                           <xsl:value-of select="ntvi:Applicant/cat_ru:OrganizationName"/>
                        </td>
                        <td align="center" style="width:45mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:45mm">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ntvi:ViolationDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:95mm">
                           (инициалы и фамилия представителя лица, декларирующего товары, получившего уведомление)
                                </td>
                        <td align="center" style="width:45mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:45mm">
                              (дата получения уведомления)</td>
                     </tr>
                     <tr>
                        <td align="center" colspan="3" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph8Bold" colspan="3" style="width:190mm" align="left">
                           Заполняется, если 
                           <xsl:choose>
                              <xsl:when test="ntvi:NotificationRequest = '1'">
                                 уведомление
                              </xsl:when>
                              <xsl:otherwise>
                                 требование
                              </xsl:otherwise>
                           </xsl:choose>
                           направляется по почте либо другим способом:
                           </td>
                     </tr>
                  </tbody>
               </table>
               <br/>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" class="graph" style="width:105mm">
                           <xsl:apply-templates select="ntvi:Applicant/cat_ru:Address"/>
                           <xsl:text>, </xsl:text>
                           <xsl:value-of select="ntvi:Applicant/cat_ru:Contact/cat_ru:Phone"/>,
                        	  <xsl:value-of select="ntvi:Applicant/cat_ru:Contact/cat_ru:Fax"/>,
                        	  <xsl:value-of select="ntvi:Applicant/cat_ru:OrganizationName"/>
                        </td>
                        <td align="center" class="graph" style="width:35mm">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ntvi:ViolationDate"/>
                           </xsl:call-template>
                        </td>
                        <td align="center" class="graph" style="width:45mm">
                           <!--xsl:value-of select="ntvi:CustomsPerson/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text-->
                           <xsl:value-of select="ntvi:CustomsPerson/cat_ru:PersonName"/>
                           <!--xsl:text> </xsl:text>
                           <xsl:value-of select="ntvi:CustomsPerson/cat_ru:PersonMiddleName"/-->
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:105mm">
                           (сведения о месте, куда направлен запрос: адрес и (или) номер<br/> телефон (факс), инициалы и фамилия лица, принявшего<br/> уведомление)
                                </td>
                        <td align="center" class="graphLittle" style="width:35mm">  
                            	(дата направления уведомления)
                                </td>
                        <td align="center" class="graphLittle" style="width:45mm">
                              (инициалы, фамилия и подпись должностного лица таможенного органа, направившего уведомление)</td>
                     </tr>
                  </tbody>
               </table>
               <br/>  <br/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="cat_ru:Address/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
</xsl:stylesheet>
