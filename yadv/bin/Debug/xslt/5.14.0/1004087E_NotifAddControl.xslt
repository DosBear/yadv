<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:radde="urn:customs.ru:Information:ExchangeDocuments:NotifAddControl:5.11.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="radde:NotifAddControl">
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
							font-family:Courier;
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
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border-bottom: solid 1pt #000000;
										}	
                </style>
         </head>
         <body>
            <div class="page">
               <xsl:if test="radde:NotifType=1">
                  <table border="0" style="width:190mm">
                     <tbody>
                        <tr>
                           <td class="graphMain">Решение о проведении дополнительной проверки 
                              <!--ля таможенной стоимости-->
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graphMain"> от									
									<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="radde:ResolDate"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <table border="0" style="width:190mm">
                     <tbody>
                        <tr>
                           <td class="graphMain" colspan="2" style="width:190mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graphMain" style="width:70mm">
                              <xsl:value-of select="radde:OfficeName"/>
                           </td>
                           <td align="center" class="graphMain" style="width:130mm">
                              <xsl:value-of select="radde:DeclName"/>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" class="graphMain" colspan="2" style="width:190mm">
									В соответствии со статьей 69 Таможенного кодекса Таможенного союза уведомляем, что в ходе проверки декларации на товары № 
									<xsl:value-of select="radde:GTDID/cat_ru:CustomsCode"/>
                              <xsl:text> / </xsl:text>
                              <xsl:call-template name="russian_date_gtd">
                                 <xsl:with-param name="dateIn" select="radde:GTDID/cat_ru:RegistrationDate"/>
                              </xsl:call-template>
                              <xsl:text> / </xsl:text>
                              <xsl:value-of select="radde:GTDID/cat_ru:GTDNumber"/>
									обнаружены следующие признаки, указывающие на то, что сведения о таможенной стоимости товаров могут являться недостоверными либо заявленные сведения должным образом не подтверждены:
									<xsl:for-each select="radde:Violations">
                                 <p class="bordered">
                                    <xsl:value-of select="."/> </p>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td class="graphMain" colspan="2" style="width:190mm">
                              <table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
                                 <tbody>
                                    <xsl:for-each select="radde:FoundInfo">
                                       <tr>
                                          <td align="center" class="graphMain" colspan="2" style="width:160mm">
                                             <xsl:value-of select="."/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" class="graphMain" colspan="2" style="width:190mm">
									В соответствии со статьей 69 Таможенного кодекса Таможенного союза Вам необходимо в срок  до <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="radde:DateLimit"/>
                              </xsl:call-template> г. представить следующие дополнительные документы, сведения и пояснения,
необходимые для подтверждения правильности определения таможенной стоимости товаров, заявленной в декларации на товары №
								<xsl:value-of select="radde:GTDID/cat_ru:CustomsCode"/>
                              <xsl:text> / </xsl:text>
                              <xsl:call-template name="russian_date_gtd">
                                 <xsl:with-param name="dateIn" select="radde:GTDID/cat_ru:RegistrationDate"/>
                              </xsl:call-template>
                              <xsl:text> / </xsl:text>
                              <xsl:value-of select="radde:GTDID/cat_ru:GTDNumber"/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graphMain" colspan="2" style="width:190mm">
                              <table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graphMain" style="width:30mm">№</td>
                                       <td align="center" class="graphMain" style="width:40mm">Перечень сведений по
													<xsl:if test="radde:NotifType='1'">таможенной стоимости,</xsl:if>
                                          <xsl:if test="radde:NotifType='2'">классификации по коду ТН ВЭД ЕАЭС,</xsl:if>
                                          <xsl:if test="radde:NotifType='3'">определению страны происхождения,</xsl:if>
													требующих подтверждения/уточнения</td>
                                       <td align="center" class="graphMain" style="width:60mm">Виды запрашиваемых документов, сведений</td>
                                       <td align="center" class="graphMain" style="width:60mm">Примечание</td>
                                    </tr>
                                    <xsl:for-each select="radde:CustomsCostInf">
                                       <tr>
                                          <td align="center" class="graphMain" style="width:30mm">
                                             <xsl:value-of select="radde:Position"/>
                                          </td>
                                          <td align="center" class="graphMain" style="width:30mm">
                                             <xsl:for-each select="radde:CustCostInf">
                                                <xsl:value-of select="."/>
                                                <xsl:text> </xsl:text>
                                             </xsl:for-each>
                                          </td>
                                          <td class="graphMain" style="width:70mm">
                                             <xsl:for-each select="radde:ReqDocuments">
                                                <xsl:value-of select="cat_ru:PrDocumentName"/>
                                                <xsl:if test="cat_ru:PrDocumentNumber"> №
															<xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                                </xsl:if>
                                                <xsl:if test="cat_ru:PrDocumentDate"> от
															<xsl:call-template name="date">
                                                      <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                   </xsl:call-template>
                                                </xsl:if>
                                                <xsl:choose>
													<xsl:when test="radde:CommKind='1'"> документ из архива декларанта</xsl:when>
													<xsl:when test="radde:CommKind='2'"> предоставление оригинала документа, в том числе сканирование в ТО</xsl:when>
												</xsl:choose>
                                                <xsl:if test="position()!=last()"><br/></xsl:if>
                                             </xsl:for-each>
                                          </td>
                                          <td align="center" class="graphMain" style="width:60mm">
                                             <xsl:value-of select="radde:Comment"/>
                                             <br/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" class="graphMain" colspan="2" style="width:190mm">
									Для выпуска товаров Вам необходимо в срок до <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="radde:DateOut"/>
                              </xsl:call-template>  <!--заполнить форму - корректировку таможенной стоимости и таможенных платежей и--> предоставить обеспечение уплаты таможенных пошлин, налогов. 
									</td>
                        </tr>
                        <tr>
                           <td class="graphMain" colspan="2" style="width:190mm; border-bottom: solid 2px black;">
                              <table border="0" style="width:190mm">
                                 <tbody>
                                    <tr>
                                       <td class="graphMain" colspan="5" style="width:190mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="center" class="normal" style="width:63mm">
                                          <xsl:value-of select="radde:CustomsPerson/cat_ru:PersonName"/>
                                       </td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="normal" style="width:63mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="normal" style="width:62mm">
										ЛНП: <xsl:value-of select="radde:CustomsPerson/cat_ru:LNP"/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="center" class="graphLittle" style="width:63mm">
									(Ф.И.О. уполномоченного должностного лица таможенного органа)
								</td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graphLittle" style="width:63mm">
									(подпись)
									</td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="left" style="width:62mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                        <tr>
                           <td class="graphMain" colspan="2" style="width:190mm;">
                              <table border="0" style="width:190mm">
                                 <tbody>
                                    <tr>
                                       <td class="graphMain" colspan="5" style="width:190mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="center" class="normal" style="width:63mm">
                                          <xsl:value-of select="radde:ReceivingResolution/radde:PersonName"/>
                                       </td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="normal" style="width:63mm">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="radde:ReceivingResolution/radde:Date"/>
                                          </xsl:call-template>
                                       </td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="normal" style="width:62mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="center" class="graphLittle" style="width:63mm">
									(Ф.И.О. представителя лица, декларирующего товары, получившего решение)
								</td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graphLittle" style="width:63mm">
									(дата получения решения)
									</td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graphLittle" style="width:62mm">
									(подпись)
									</td>
                                    </tr>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                        <xsl:if test="radde:SendResolution">
                           <tr>
                              <td align="left" class="graphMain" colspan="2" style="width:190mm">
                                 <xsl:text>При направлении почтой </xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td class="graphMain" colspan="2" style="width:190mm;">
                                 <table border="0" style="width:190mm">
                                    <tbody>
                                       <tr>
                                          <td class="graphMain" colspan="5" style="width:190mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td align="center" class="normal" style="width:63mm">
                                             <xsl:value-of select="radde:Address/cat_ru:PostalCode"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="radde:Address/cat_ru:CountryCode"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="radde:Address/cat_ru:CounryName"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="radde:Address/cat_ru:Region"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="radde:Address/cat_ru:City"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="radde:Address/cat_ru:StreetHouse"/>
                                          </td>
                                          <td class="graphMain" style="width:1mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="normal" style="width:63mm">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="radde:SendResolution/radde:Date"/>
                                             </xsl:call-template>
                                          </td>
                                          <td class="graphMain" style="width:1mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="normal" style="width:62mm">
                                             <xsl:value-of select="radde:SendResolution/radde:PersonName"/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td align="center" class="graphLittle" style="width:63mm">
									(адрес направления решения)
								</td>
                                          <td class="graphMain" style="width:1mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graphLittle" style="width:63mm">
									(дата направления решения)
									</td>
                                          <td class="graphMain" style="width:1mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graphLittle" style="width:62mm">
									(Ф.И.О. и подпись должностного лица таможенного органа, направившего решение)
									</td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                        </xsl:if>
                     </tbody>
                  </table>
               </xsl:if>
               <xsl:if test="(radde:NotifType=2) or (radde:NotifType=3)">
                  <table border="0" style="width:190mm">
                     <tbody>
                        <tr>
                           <td class="graphMain">Решение о проведении дополнительной проверки
								
                              <!--xsl:if test="radde:NotifType=2">для классификации по коду ТН ВЭД ЕАЭС</xsl:if>
										<xsl:if test="radde:NotifType=3">для определения страны происхождения</xsl:if-->
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graphMain"> от									
									<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="radde:ResolDate"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <table border="0" style="width:190mm">
                     <tbody>
                        <tr>
                           <td class="graphMain" colspan="2" style="width:190mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graphMain" style="width:70mm">
                              <xsl:value-of select="radde:OfficeName"/>
                           </td>
                           <td align="center" class="graphMain" style="width:130mm">
                              <xsl:value-of select="radde:DeclName"/>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" class="graphMain" colspan="2" style="width:190mm">
									В соответствии со статьей <xsl:value-of select="radde:ArtControl"/> Таможенного кодекса Таможенного союза уведомляем, что в ходе проверки декларации на товары № 
									<xsl:value-of select="radde:GTDID/cat_ru:CustomsCode"/>
                              <xsl:text> / </xsl:text>
                              <xsl:call-template name="russian_date_gtd">
                                 <xsl:with-param name="dateIn" select="radde:GTDID/cat_ru:RegistrationDate"/>
                              </xsl:call-template>
                              <xsl:text> / </xsl:text>
                              <xsl:value-of select="radde:GTDID/cat_ru:GTDNumber"/>
									обнаружено следующее: <xsl:for-each select="radde:Violations">
                                 <p class="bordered">
                                    <xsl:value-of select="."/> </p>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" class="graphMain" colspan="2" style="width:190mm"/>
                        </tr>
                        <tr>
                           <td class="graphMain" colspan="2" style="width:190mm">
                              <table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
                                 <tbody>
                                    <xsl:for-each select="radde:FoundInfo">
                                       <tr>
                                          <td align="center" class="graphMain" colspan="2" style="width:160mm">
                                             <xsl:value-of select="."/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" class="graphMain" colspan="2" style="width:190mm">
									В соответствии <xsl:value-of select="radde:ArtCauseDoc"/> Таможенного кодекса Таможенного союза Вам необходимо в срок до <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="radde:DateLimit"/>
                              </xsl:call-template> г. представить следующие дополнительные документы, сведения и пояснения,
необходимые <xsl:value-of select="radde:CauseDocuments"/>, заявленной в декларации на товары №
								<xsl:value-of select="radde:GTDID/cat_ru:CustomsCode"/>
                              <xsl:text> / </xsl:text>
                              <xsl:call-template name="russian_date_gtd">
                                 <xsl:with-param name="dateIn" select="radde:GTDID/cat_ru:RegistrationDate"/>
                              </xsl:call-template>
                              <xsl:text> / </xsl:text>
                              <xsl:value-of select="radde:GTDID/cat_ru:GTDNumber"/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graphMain" colspan="2" style="width:190mm">
                              <table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graphMain" style="width:30mm">№</td>
                                       <td align="center" class="graphMain" style="width:40mm">Перечень сведений по
													<xsl:if test="radde:NotifType='1'">таможенной стоимости,</xsl:if>
                                          <xsl:if test="radde:NotifType='2'">классификации по коду ТН ВЭД ЕАЭС,</xsl:if>
                                          <xsl:if test="radde:NotifType='3'">определению страны происхождения,</xsl:if>
													требующих подтверждения/уточнения</td>
                                       <td align="center" class="graphMain" style="width:60mm">Виды запрашиваемых документов, сведений</td>
                                       <td align="center" class="graphMain" style="width:60mm">Примечание</td>
                                    </tr>
                                    <xsl:for-each select="radde:CustomsCostInf">
                                       <tr>
                                          <td align="center" class="graphMain" style="width:30mm">
                                             <xsl:value-of select="radde:Position"/>
                                          </td>
                                          <td align="center" class="graphMain" style="width:30mm">
                                             <xsl:for-each select="radde:CustCostInf">
                                                <xsl:value-of select="."/>
                                                <xsl:text> </xsl:text>
                                             </xsl:for-each>
                                          </td>
                                          <td class="graphMain" style="width:70mm">
                                             <xsl:for-each select="radde:ReqDocuments">
                                                <xsl:value-of select="cat_ru:PrDocumentName"/>
                                                <xsl:if test="cat_ru:PrDocumentNumber"> №
															<xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                                </xsl:if>
                                                <xsl:if test="cat_ru:PrDocumentDate"> от
															<xsl:call-template name="date">
                                                      <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                   </xsl:call-template>
                                                </xsl:if>
                                                <xsl:choose>
													<xsl:when test="radde:CommKind='1'"> документ из архива декларанта</xsl:when>
													<xsl:when test="radde:CommKind='2'"> предоставление оригинала документа, в том числе сканирование в ТО</xsl:when>
												</xsl:choose>
                                                <xsl:if test="position()!=last()"><br/></xsl:if>
                                             </xsl:for-each>
                                          </td>
                                          <td align="center" class="graphMain" style="width:60mm">
                                             <xsl:value-of select="radde:Comment"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" class="graphMain" colspan="2" style="width:190mm">
									Для выпуска товаров Вам необходимо в срок до <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="radde:DateOut"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="radde:ActionOut"/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graphMain" colspan="2" style="width:190mm; border-bottom: solid 2px black;">
                              <table border="0" style="width:190mm">
                                 <tbody>
                                    <tr>
                                       <td class="graphMain" colspan="5" style="width:190mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="center" class="normal" style="width:63mm">
                                          <xsl:value-of select="radde:CustomsPerson/cat_ru:PersonName"/>
                                       </td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="normal" style="width:63mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="normal" style="width:62mm">
										ЛНП: <xsl:value-of select="radde:CustomsPerson/cat_ru:LNP"/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="center" class="graphLittle" style="width:63mm">
									(Ф.И.О. уполномоченного должностного лица таможенного органа)
								</td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graphLittle" style="width:63mm">
									(подпись)
									</td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="left" style="width:62mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                        <tr>
                           <td class="graphMain" colspan="2" style="width:190mm;">
                              <table border="0" style="width:190mm">
                                 <tbody>
                                    <tr>
                                       <td class="graphMain" colspan="5" style="width:190mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="center" class="normal" style="width:63mm">
                                          <xsl:value-of select="radde:ReceivingResolution/radde:PersonName"/>
                                       </td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="normal" style="width:63mm">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="radde:ReceivingResolution/radde:Date"/>
                                          </xsl:call-template>
                                       </td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="normal" style="width:62mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="center" class="graphLittle" style="width:63mm">
									(Ф.И.О. представителя лица, декларирующего товары, получившего решение)
								</td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graphLittle" style="width:63mm">
									(дата получения решения)
									</td>
                                       <td class="graphMain" style="width:1mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graphLittle" style="width:62mm">
									(подпись)
									</td>
                                    </tr>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                        <xsl:if test="radde:SendResolution">
                           <tr>
                              <td align="left" class="graphMain" colspan="2" style="width:190mm">
                                 <xsl:text>При направлении почтой </xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td class="graphMain" colspan="2" style="width:190mm;">
                                 <table border="0" style="width:190mm">
                                    <tbody>
                                       <tr>
                                          <td class="graphMain" colspan="5" style="width:190mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td align="center" class="normal" style="width:63mm">
                                             <xsl:value-of select="radde:Address/cat_ru:PostalCode"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="radde:Address/cat_ru:CountryCode"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="radde:Address/cat_ru:CounryName"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="radde:Address/cat_ru:Region"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="radde:Address/cat_ru:City"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="radde:Address/cat_ru:StreetHouse"/>
                                          </td>
                                          <td class="graphMain" style="width:1mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="normal" style="width:63mm">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="radde:SendResolution/radde:Date"/>
                                             </xsl:call-template>
                                          </td>
                                          <td class="graphMain" style="width:1mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="normal" style="width:62mm">
                                             <xsl:value-of select="radde:SendResolution/radde:PersonName"/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td align="center" class="graphLittle" style="width:63mm">
									(адрес направления решения)
								</td>
                                          <td class="graphMain" style="width:1mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graphLittle" style="width:63mm">
									(дата направления решения)
									</td>
                                          <td class="graphMain" style="width:1mm">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graphLittle" style="width:62mm">
									(Ф.И.О. и подпись должностного лица таможенного органа, направившего решение)
									</td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                        </xsl:if>
                     </tbody>
                  </table>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template name="date">
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
</xsl:stylesheet>
