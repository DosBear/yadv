<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rad="urn:customs.ru:Information:CustomsDocuments:RequestAdditionalDocuments:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="rad:ReqAdditionalDocuments">
      <html>
         <head>
            <title>Запрос о представлении дополнительных документов</title>
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
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.bold2{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.normal2{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: 1pt solid windowtext; 
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
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
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
                        <td style="width:80mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <xsl:choose>
                           <xsl:when test="rad:Delcarant/rad:Organization/cat_ru:OrganizationName">
                              <td align="center" class="normal" style="width:90mm">
                                 <xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:OrganizationName"/>
                              </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td align="center" style="width:90mm">
                                 <xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:ShortName"/>
                              </td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <td style="width:60mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:110mm">
								декларант: наименование или инициалы и фамилия (для физических лиц)(из графы 14 ДТ)
								</td>
                     </tr>
                     <tr>
                        <td style="width:80mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="normal" style="width:90mm">
                           <xsl:if test="rad:Delcarant/rad:Organization/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН:<xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="rad:Delcarant/rad:Organization/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН:<xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:80mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="normal" style="width:90mm">
                           <xsl:if test="rad:Delcarant/rad:Organization/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП:<xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="rad:Delcarant/rad:Organization/cat_ru:OKPOID">ОКПО:<xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:OKPOID"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="rad:Delcarant/rad:Organization/cat_ru:OKATOCode">ОКАТО:<xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:OKATOCode"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                        </td>
                     </tr>
                     <xsl:if test="rad:Delcarant/rad:Organization/cat_ru:Contact/cat_ru:Phone|rad:Delcarant/rad:Organization/cat_ru:Contact/cat_ru:Fax|rad:Delcarant/rad:Organization/cat_ru:Contact/cat_ru:Telex">
                        <tr>
                           <td style="width:80mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td class="normal" style="width:90mm">
                              <xsl:if test="rad:Delcarant/rad:Organization/cat_ru:Contact/cat_ru:Phone">
							тел. <xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:Contact/cat_ru:Phone"/>
                                 <xsl:text> </xsl:text>
                              </xsl:if>
                              <xsl:if test="rad:Delcarant/rad:Organization/cat_ru:Contact/cat_ru:Fax">
							факс <xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:Contact/cat_ru:Fax"/>
                                 <xsl:text> </xsl:text>
                              </xsl:if>
                              <xsl:if test="rad:Delcarant/rad:Organization/cat_ru:Contact/cat_ru:Telex">
							телекс <xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:Contact/cat_ru:Telex"/>
                                 <xsl:text> </xsl:text>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td style="width:80mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphLittle" style="width:90mm">
								телефон, телефакс
								</td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="rad:Delcarant/rad:Organization/cat_ru:Address">
                        <tr>
                           <td style="width:80mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td class="normal" style="width:90mm">
                              <xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:Address/cat_ru:PostalCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:Address/cat_ru:CountryCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:Address/cat_ru:CounryName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:Address/cat_ru:Region"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:Address/cat_ru:City"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="rad:Delcarant/rad:Organization/cat_ru:Address/cat_ru:StreetHouse"/>
                              <xsl:text> </xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td style="width:80mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphLittle" style="width:90mm">
								 адрес
								</td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="center" class="bold" colspan="2">
							ЗАПРОС<br/>  о представлении дополнительных документов<br/>для подтверждения заявленной таможенной стоимости<br/>№
							<span class="bold2">
                              <xsl:value-of select="rad:NumberDoc"/>
                           </span> от <span class="bold2">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="rad:DateDoc"/>
                              </xsl:call-template>г.
										
										</span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2">В соответствии со статьей 111 Таможенного кодекса Таможенного союза прошу представить следующие дополнительные документы, необходимые для подтверждения правильности определения таможенной стоимости, заявленной в ДТ №
								<span class="normal">
                              <xsl:value-of select="rad:GTDID/cat_ru:CustomsCode"/>
                              <xsl:text>/ </xsl:text>
                              <xsl:call-template name="russian_date2">
                                 <xsl:with-param name="dateIn" select="rad:GTDID/cat_ru:RegistrationDate"/>
                              </xsl:call-template>
                              <xsl:text>/ </xsl:text>
                              <xsl:value-of select="rad:GTDID/cat_ru:GTDNumber"/>,
									</span> в срок до <span class="normal">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="rad:Term"/>
                              </xsl:call-template>
                           </span> г.</td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" class="graphMain" style="width:10mm">№</td>
                        <td align="center" class="graphMain" style="width:70mm">Перечень сведений по таможенной стоимости, требующих подтверждения/уточнения</td>
                        <td align="center" class="graphMain" style="width:60mm">Виды запрашиваемых документов</td>
                        <td align="center" class="graphMain" style="width:50mm">Примечание</td>
                     </tr>
                     <xsl:for-each select="rad:ListDocuments">
                        <tr>
                           <td align="center" class="graphMain" style="width:10mm">
                              <xsl:value-of select="rad:Position"/>
                           </td>
                           <td align="center" class="graphMain" style="width:70mm">
                              <xsl:for-each select="rad:Description">
                                 <xsl:value-of select="."/>
                              </xsl:for-each>
                           </td>
                           <td align="center" class="graphMain" style="width:60mm">
                              <xsl:value-of select="rad:KindDocuments"/>
                              <xsl:text> </xsl:text>
							(<xsl:value-of select="rad:CodeKindDocuments"/>) </td>
                           <td align="center" class="graphMain" style="width:50mm">
                              <xsl:choose>
                                 <xsl:when test="rad:Notation">
                                    <xsl:for-each select="rad:Notation">
                                       <div>
                                          <xsl:value-of select="."/>
                                       </div>
                                    </xsl:for-each>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:text> </xsl:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td colspan="2">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" style="width:100mm">
                           <xsl:value-of select="rad:CustomsPerson/cat_ru:PersonName"/>
                        </td>
                        <td align="center" class="graphMain" style="width:90mm">ЛНП:<span class="normal">
                              <xsl:value-of select="rad:CustomsPerson/cat_ru:LNP"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:100mm">(иницалы и фамилия уполномоченного должностного<br/> лица таможенного органа)</td>
                        <td align="center" class="graphLittle" style="width:90mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" style="width:100mm">
                           <xsl:value-of select="rad:PersonSignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rad:PersonSignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rad:PersonSignature/cat_ru:PersonMiddleName"/>
                           <xsl:if test="rad:PersonSignature/cat_ru:PersonPost"> /
							<xsl:value-of select="rad:PersonSignature/cat_ru:PersonPost"/>  / </xsl:if>
                        </td>
                        <td align="center" class="normal" style="width:90mm">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="rad:PersonSignature/cat_ru:IssueDate"/>
                           </xsl:call-template>г.
							
							</td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:100mm">(иницалы и фамилия представителя лекларанта, <br/>получившего запрос)</td>
                        <td align="center" class="graphLittle" style="width:90mm"> (дата получения запроса)	</td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2 ">В случае направления запроса по почте или иными канналаи связи требуется уведомление о получении.</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
