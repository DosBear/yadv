<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tci="urn:customs.ru:Information:CustomsDocuments:TransitInfo:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
      <xsl:param name="dategtd"/>
      <xsl:choose>
         <xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
            <xsl:value-of select="substring($dategtd,9,2)"/>
            <xsl:value-of select="substring($dategtd,6,2)"/>
            <xsl:value-of select="substring($dategtd,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dategtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="date_time">
      <xsl:param name="dateTimeIn"/>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring($dateTimeIn,12,5)"/>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tci:TransitInfo">
      <html>
         <head>
            <title>Информация о транзитных товарах</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                   body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 260mm;
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
							h2 {
						text-align:center;
						font: 20 ;
						font-family: Arial, serif;
					}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 15pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
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
					font-weight: bold;
										}	
						.borderedAll {
					border-bottom: solid 1pt #000000;border-top: solid 1pt #000000;border-left: solid 1pt #000000;border-right: solid 1pt #000000;
					font-weight: bold;
										}	

                </style>
         </head>
         <body>
            <div class="page">
               <h2>Информация о транзитных товарах</h2>
               <table border="0" style="width:210mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graph" style="width:100mm">Прикладное статусное состояние транзитной перевозки</td>
                        <td align="left" class="graph" style="width:100mm">
                           <xsl:value-of select="tci:StatusName"/>
                        </td>
                     </tr>
                     <xsl:if test="tci:Reason">
                        <tr>
                           <td align="left" class="graph" style="width:100mm">Обоснование</td>
                           <td align="left" class="graph" style="width:100mm">
                              <xsl:for-each select="tci:Reason">
                                 <!--<xsl:if test="position()>1">, </xsl:if>-->
                                 <xsl:value-of select="."/>
                              </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="tci:ActNumber">
                        <tr>
                           <td align="left" class="graph" style="width:100mm">Номер акта таможенного досмотра</td>
                           <td align="left" class="graph" style="width:100mm">
                              <xsl:value-of select="tci:ActNumber"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="left" class="graph" style="width:100mm">Дата и время создания документа</td>
                        <td align="left" class="graph" style="width:100mm">
                           <xsl:call-template name="date_time">
                              <xsl:with-param name="dateTimeIn" select="tci:DocumentDateTime"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <xsl:if test="tci:TransitStampDateTime">
                        <tr>
                           <td align="left" class="graph" style="width:100mm">Дата и время на штампе</td>
                           <td align="left" class="graph" style="width:100mm">
                              <xsl:call-template name="date_time">
                                 <xsl:with-param name="dateTimeIn" select="tci:TransitStampDateTime"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="left" class="graph" style="width:100mm">Таможенный орган отправления</td>
                        <td align="left" class="graph" style="width:100mm">
                           <xsl:value-of select="tci:CustomsCode"/>
                        </td>
                     </tr>
                     <xsl:for-each select="tci:Header">
                        <tr>
                           <td align="left" class="graph" style="width:100mm">Тип транзитной декларации</td>
                           <td align="left" class="graph" style="width:100mm">
                              <xsl:value-of select="tci:DeclarationKind"/>
                           </td>
                        </tr>
                        <tr>
                           <xsl:choose>
                              <xsl:when test="tci:TDNumber">
                                 <td align="left" class="graph" style="width:100mm;">Номер транзитной декларации</td>
                                 <td align="left" class="graph" style="width:100mm">
                                    <xsl:value-of select="tci:TDNumber/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="dategtd" select="tci:TDNumber/cat_ru:RegistrationDate"/>
                                    </xsl:call-template>/<xsl:value-of select="tci:TDNumber/cat_ru:GTDNumber"/>
                                 </td>
                              </xsl:when>
                              <xsl:otherwise>
                                 <td align="left" class="graph" style="width:100mm;">Номер книжки МДП</td>
                                 <td align="left" class="graph" style="width:100mm">
                                    <xsl:value-of select="tci:TIRID/tci:TIRSeries"/>
                                    <xsl:value-of select="tci:TIRID/tci:TIRID"/>
                                    <xsl:text> от </xsl:text>
                                    <xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="tci:TIRID/tci:RegistrationDate"/>
								    </xsl:call-template>
                                 </td>
                              </xsl:otherwise>
                           </xsl:choose>
                        </tr>
                        <xsl:if test="tci:TransitDateLimit">
                           <tr>
                              <td align="left" class="graph" style="width:100mm">Срок таможенного транзита</td>
                              <td align="left" class="graph" style="width:100mm">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="tci:TransitDateLimit"/>
                                 </xsl:call-template>
                              </td>
                           </tr>
                        </xsl:if>
                        <tr>
                           <td align="left" class="graph" style="width:100mm">Общее количество товаров</td>
                           <td align="left" class="graph" style="width:100mm">
                              <xsl:value-of select="tci:TotalNumberOfGoods"/>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" class="graph" style="width:100mm">Общее количество грузовых мест</td>
                           <td align="left" class="graph" style="width:100mm">
                              <xsl:value-of select="tci:TotalNumberOfPackages"/>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" class="graph" style="width:100mm">Общий вес брутто</td>
                           <td align="left" class="graph" style="width:100mm">
                              <xsl:value-of select="tci:TotalGrossMass"/>
                           </td>
                        </tr>
                        <xsl:if test="tci:DepartureCountryCode">
                           <tr>
                              <td align="left" class="graph" style="width:100mm">Код страны отправления</td>
                              <td align="left" class="graph" style="width:100mm">
                                 <xsl:value-of select="tci:DepartureCountryCode"/>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="tci:DestinationCountryCode">
                           <tr>
                              <td align="left" class="graph" style="width:100mm">Код страны назначения.</td>
                              <td align="left" class="graph" style="width:100mm">
                                 <xsl:value-of select="tci:DestinationCountryCode"/>
                              </td>
                           </tr>
                        </xsl:if>
                     </xsl:for-each>
                     <xsl:if test="tci:Guarantee">
                        <xsl:for-each select="tci:Guarantee">
                           <table width="100%">
                              <tr>
                                 <td align="left" class="graph" colspan="2" style="width:100mm">Сведения о гарантии</td>
                                 <td align="left" class="graph" style="width:100mm"/>
                              </tr>
                              <tr>
                                 <td align="left" class="graph" style="width:4%"/>
                                 <td align="left" class="graph" style="width:46%">Код меры обеспечения по Классификатору мер обеспечения</td>
                                 <td align="left" class="graph" style="width:50%">
                                    <xsl:value-of select="catESAD_cu:MeasureCode"/>
                                 </td>
                              </tr>
                              <xsl:if test="catESAD_cu:DocNumber | catESAD_cu:DocDate">
                                 <tr>
                                    <td align="left" class="graph" style="width:4%"/>
                                    <td align="left" class="graph" style="width:46%">Документ</td>
                                    <td align="left" class="graph" style="width:50%">
                                       <xsl:if test="catESAD_cu:DocNumber">№<xsl:value-of select="catESAD_cu:DocNumber"/>
                                       </xsl:if>
                                       <xsl:if test="catESAD_cu:DocDate"> от <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="catESAD_cu:DocDate"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="catESAD_cu:GuaranteeName">
                                 <tr>
                                    <td align="left" class="graph" style="width:4%"/>
                                    <td align="left" class="graph" style="width:46%">Наименование гаранта</td>
                                    <td align="left" class="graph" style="width:50%">
                                       <xsl:value-of select="catESAD_cu:GuaranteeName"/>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="catESAD_cu:UNP">
                                 <tr>
                                    <td align="left" class="graph" style="width:4%"/>
                                    <td align="left" class="graph" style="width:46%">Учетный номер плательщика (УНП)</td>
                                    <td align="left" class="graph" style="width:50%">
                                       <xsl:value-of select="catESAD_cu:UNP"/>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="catESAD_cu:BIC">
                                 <tr>
                                    <td align="left" class="graph" style="width:4%"/>
                                    <td align="left" class="graph" style="width:46%">Код МФО/БИК</td>
                                    <td align="left" class="graph" style="width:50%">
                                       <xsl:value-of select="catESAD_cu:BIC"/>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="catESAD_cu:GuaranteeAmount">
                                 <tr>
                                    <td align="left" class="graph" style="width:4%"/>
                                    <td align="left" class="graph" style="width:46%">Сумма обеспечения</td>
                                    <td align="left" class="graph" style="width:50%">
                                       <xsl:value-of select="catESAD_cu:GuaranteeAmount"/>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="catESAD_cu:GuaranteeAddress">
                                 <tr>
                                    <td align="left" class="graph" style="width:4%"/>
                                    <td align="left" class="graph" style="width:46%" valign="top">Адрес гаранта</td>
                                    <td align="left" class="graph" style="width:50%">
                                       <xsl:apply-templates select="catESAD_cu:GuaranteeAddress"/>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="catESAD_cu:GuaranteeTD">
                                 <xsl:for-each select="catESAD_cu:GuaranteeTD">
                                    <tr>
                                       <td align="left" class="graph" style="width:4%"/>
                                       <td align="left" class="graph" style="width:46%" valign="top">Поручительство</td>
                                       <td align="left" class="graph" style="width:50%">
                                          <xsl:if test="catESAD_cu:GeneralNumber | catESAD_cu:GeneralDate">Генеральный договор 
														<xsl:if test="catESAD_cu:GeneralNumber">№ <xsl:value-of select="catESAD_cu:GeneralNumber"/>
                                             </xsl:if>
                                             <xsl:if test="catESAD_cu:GeneralDate"> от <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="catESAD_cu:GeneralDate"/>
                                                </xsl:call-template>
                                             </xsl:if>
                                             <br/>
                                          </xsl:if>
                                          <xsl:if test="catESAD_cu:GuaranteeNumber | catESAD_cu:GuaranteeDate">
														Договор поручительства 
														<xsl:if test="catESAD_cu:GuaranteeNumber">№ <xsl:value-of select="catESAD_cu:GuaranteeNumber"/>
                                             </xsl:if>
                                             <xsl:if test="catESAD_cu:GuaranteeDate"> от <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="catESAD_cu:GuaranteeDate"/>
                                                </xsl:call-template>
                                             </xsl:if>
                                             <br/>
                                          </xsl:if>
                                          <xsl:if test="catESAD_cu:AddGuaranteeNumber | catESAD_cu:AddGuaranteeDate">
														Дополнение к договору поручительства 
														<xsl:if test="catESAD_cu:AddGuaranteeNumber">№ <xsl:value-of select="catESAD_cu:AddGuaranteeNumber"/>
                                             </xsl:if>
                                             <xsl:if test="catESAD_cu:AddGuaranteeDate"> от <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="catESAD_cu:AddGuaranteeDate"/>
                                                </xsl:call-template>
                                             </xsl:if>
                                          </xsl:if>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </xsl:if>
                           </table>
                        </xsl:for-each>
                     </xsl:if>
                  </tbody>
               </table>
               <xsl:if test="tci:Seal">
                  <table width="100%">
                     <tbody>
                        <tr>
                           <td align="left" class="graph" colspan="3" style="width:100%">Сведения о средствах идентификации</td>
                        </tr>
                        <xsl:for-each select="tci:Seal">
                           <tr>
                              <td align="left" class="graph" style="width:4%"/>
                              <td align="left" class="graph" style="width:46%">Тип средства идентификации</td>
                              <td align="left" class="graph" style="width:50%">
                                 <xsl:choose>
                                    <xsl:when test="tci:IdentKind='1'">Пломба</xsl:when>
                                    <xsl:when test="tci:IdentKind='2'">Печать</xsl:when>
                                    <xsl:otherwise>Иное</xsl:otherwise>
                                 </xsl:choose>
                              </td>
                           </tr>
                           <tr>
                              <td align="left" class="graph" style="width:4%"/>
                              <td align="left" class="graph" style="width:46%">Номер наложенного средста идентификации</td>
                              <td align="left" class="graph" style="width:50%">
                                 <xsl:value-of select="tci:IdentNumber"/>
                              </td>
                           </tr>
                           <xsl:if test="tci:Quantity">
                              <tr>
                                 <td align="left" class="graph" style="width:4%"/>
                                 <td align="left" class="graph" style="width:46%">Количество</td>
                                 <td align="left" class="graph" style="width:50%">
                                    <xsl:value-of select="tci:Quantity"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="tci:IdentDesc">
                              <tr>
                                 <td align="left" class="graph" style="width:4%"/>
                                 <td align="left" class="graph" style="width:46%">Примечание</td>
                                 <td align="left" class="graph" style="width:50%">
                                    <xsl:value-of select="tci:IdentDesc"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <tr/>
                           <tr/>
                           <tr/>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <table style="width:210mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain" colspan="3" style="width:100mm">Сведения о транспортном средстве:</td>
                     </tr>
                     <xsl:for-each select="tci:Header/tci:Transport">
                        <tr>
                           <td style="width:5mm;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" class="graph" style="width:35mm">Код вида</td>
                           <td align="left" class="graph" style="width:40mm">
                              <xsl:value-of select="cat_ru:TransportModeCode"/>
                           </td>
                        </tr>
                        <tr>
                           <td style="width:5mm;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" class="graph" style="width:35mm">Буквенный код страны принадлежности</td>
                           <td align="left" class="graph" style="width:40mm">
                              <xsl:value-of select="cat_ru:TransportNationalityCode"/>
                           </td>
                        </tr>
                        <table align="center" border="1" cellpadding="3" cellspacing="0" style="width:165mm;">
                           <tbody>
                              <tr>
                                 <td align="center" class="graph" style="width:15mm">Код типа</td>
                                 <td align="center" class="graph" style="width:15mm">Код марки</td>
                                 <td align="center" class="graph" style="width:25mm">Идентификационный номер</td>
                                 <td align="center" class="graph" style="width:25mm">Номер шасси (VIN)</td>
                                 <td align="center" class="graph" style="width:25mm">Буквенный код страны принадлежности</td>
                                 <td align="center" class="graph" style="width:25mm">Идентификатор активного транспортного средства для прицепов, 
полуприцепов и др</td>
                                 <td align="center" class="graph" style="width:30mm">Номер свидетельства о регистрации транспортного средства для РБ</td>
                              </tr>
                              <tr>
                                 <xsl:call-template name="TransportMeans">
                                    <xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:TransportKindCode"/>
                                 </xsl:call-template>
                                 <xsl:call-template name="TransportMeans">
                                    <xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:TransportMarkCode"/>
                                 </xsl:call-template>
                                 <xsl:call-template name="TransportMeans">
                                    <xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:TransportIdentifier"/>
                                 </xsl:call-template>
                                 <xsl:call-template name="TransportMeans">
                                    <xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:VIN"/>
                                 </xsl:call-template>
                                 <xsl:call-template name="TransportMeans">
                                    <xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:TransportMeansNationalityCode"/>
                                 </xsl:call-template>
                                 <xsl:call-template name="TransportMeans">
                                    <xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:ActiveTransportIdentifier"/>
                                 </xsl:call-template>
                                 <xsl:call-template name="TransportMeans">
                                    <xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:TransportRegNumber"/>
                                 </xsl:call-template>
                              </tr>
                           </tbody>
                        </table>
                     </xsl:for-each>
                  </tbody>
               </table>
               <table align="center" border="0" style="width:210mm">
                  <tbody>
                     <br/>
                     <xsl:variable name="pl" select="tci:DestinationPlace"/>
                     <tr>
                        <td align="left" class="graph" style="width:100mm" valign="top">Сведения о месте назначения:</td>
                        <td align="left" class="graph" style="width:100mm">
                           <xsl:value-of select="$pl/cat_ru:Code"/>
                           <xsl:if test="$pl/cat_ru:OfficeName"> - <xsl:value-of select="$pl/cat_ru:OfficeName"/>
                           </xsl:if>
                           <xsl:if test="$pl/cat_ru:OfficeName"> (Код государства: <xsl:value-of select="$pl/cat_ru:CustomsCountryCode"/>)</xsl:if>
                           <xsl:if test="$pl/tci:PlaceDescription">
                              <br/>Место доставки: <xsl:value-of select="$pl/tci:PlaceDescription"/>
                           </xsl:if>
                           <xsl:if test="$pl/tci:RegistrationCertificate">
                              <br/>Свидетельство о включении в реестр УЭО: <xsl:call-template name="Docum">
                                 <xsl:with-param name="doc" select="$pl/tci:RegistrationCertificate"/>
                              </xsl:call-template>
                           </xsl:if>
                           <xsl:if test="$pl/tci:RWstation">
                              <br/>
                              <xsl:if test="$pl/tci:RWstation/tci:RailwayCode">Железная дорога <xsl:value-of select="$pl/tci:RWstation/tci:RailwayCode"/>, </xsl:if>Станция <xsl:value-of select="$pl/tci:RWstation/tci:StationCode"/>
                              <xsl:if test="$pl/tci:RWstation/tci:StationName"> - <xsl:value-of select="$pl/tci:RWstation/tci:StationName"/>
                              </xsl:if>
                           </xsl:if>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table align="center" border="0" cellpadding="0" cellspacing="0" style="width:210mm;">
                  <tbody>
                     <br/>
                     <tr>
                        <td align="left" class="graph" style="width:100mm" valign="top">Сведения о перевозчике:</td>
                        <td align="left" class="graph" style="width:100mm">
                           <xsl:call-template name="Consignor">
                              <xsl:with-param name="cons" select="tci:Header/tci:Carrier"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <xsl:if test="tci:CustomsOfficial">
                  <table align="center" border="0" style="width:210mm">
                     <tbody>
                        <tr>
                           <td align="left" class="graph" style="width:100mm">Сведения о должностном лице таможенного органа, проставившем штамп:</td>
                           <td align="left" class="graph" style="width:100mm" valign="top">
                              <xsl:value-of select="tci:CustomsOfficial/cat_ru:PersonName"/>
                              <xsl:if test="tci:CustomsOfficial/cat_ru:LNP">; ЛНП - <xsl:value-of select="tci:CustomsOfficial/cat_ru:LNP"/>
                              </xsl:if>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </xsl:if>
               <br/>
               <xsl:if test="tci:PrecedingDocument">
                  <table align="center" border="0" style="width:210mm">
                     <tbody>
                        <tr>
                           <td align="left" class="graph" style="width:100mm" valign="top">Предшествующие документы:</td>
                           <td align="left" class="graph" style="width:100mm" valign="top">
                                 <xsl:for-each select="tci:PrecedingDocument">Тип предшествующего документа: <xsl:value-of select="tci:DocumentKind"/>   
									<xsl:call-template name="Docum">
                                       <xsl:with-param name="doc" select="."/>
                                    </xsl:call-template>
                                    <br/>
                                 </xsl:for-each>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </xsl:if>
               <table align="center" border="0" cellpadding="0" cellspacing="0" style="width:210mm;">
                  <tbody>
                     <tr>
                        <td align="left" class="graph" style="width:100mm;" valign="top">Сведения о товарно-транспортной накладной:</td>
                     </tr>
                  </tbody>
               </table>
               <xsl:for-each select="tci:Consigment">
                  <table style="width:210mm;">
                     <tbody>
                        <tr>
                           <td style="width:15mm;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" class="graph" colspan="2" style="width:195mm;" valign="top">Тип представленного документа: <xsl:value-of select="tci:DocumentKind"/>   <xsl:call-template name="Docum">
                                 <xsl:with-param name="doc" select="."/>
                              </xsl:call-template>
                           </td>
                        </tr>
                        <tr>
                           <td style="width:15mm;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" class="graph" colspan="2" style="width:195mm;" valign="top">Порядковый номер накладной:<xsl:value-of select="tci:Sequence"/>
                           </td>
                        </tr>
                        <tr>
                           <td style="width:15mm;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" class="graph" style="width:45mm" valign="top">Грузоотправитель:</td>
                           <td align="left" class="graph">
                              <xsl:call-template name="Consignor">
                                 <xsl:with-param name="cons" select="tci:Consignor"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                        <tr>
                           <td style="width:15mm;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" class="graph" style="width:45mm" valign="top">Грузополучатель:</td>
                           <td align="left" class="graph">
                              <xsl:call-template name="Consignor">
                                 <xsl:with-param name="cons" select="tci:Consignee"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                        <xsl:if test="tci:ProducedDocument">
                           <tr>
                              <td style="width:15mm;">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="left" class="graph" style="width:75mm" valign="top">Представленные документы:</td>
                              <td align="left" class="graph">
                                 <xsl:for-each select="tci:ProducedDocument">Тип представленного документа: <xsl:value-of select="tci:DocumentKind"/>   
									<xsl:call-template name="Docum">
                                       <xsl:with-param name="doc" select="."/>
                                    </xsl:call-template>
                                    <br/>
                                 </xsl:for-each>
                                 <br/>
                                 <br/>
                              </td>
                           </tr>
                        </xsl:if>
                        <tr>
                           <td style="width:15mm;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" class="graph" colspan="2" style="width:165mm" valign="top">Сведения о товарах:</td>
                           <br/>
                           <table align="center" border="1" cellpadding="0" cellspacing="0" style="width:165mm;">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" style="width:4%">Порядковый номер</td>
                                    <td align="center" class="graph" style="width:16%mm">Наименование</td>
                                    <td align="center" class="graph" style="width:8%">Код ТН ВЭД</td>
                                    <td align="center" class="graph" style="width:4%">Вес, брутто/Вес, нетто</td>
                                    <td align="center" class="graph" style="width:4%">Вес, нетто без учета упаковки</td>
                                    <td align="center" class="graph" style="width:12%">Цена/стоимость</td>
                                    <td align="center" class="graph" style="width:12%">Таможенная стоимость</td>
                                    <td align="center" class="graph" style="width:12%">Статистическая стоимость</td>
                                    <td align="center" class="graph" style="width:8%">Количество товара (в доп. ед. изм.)</td>
                                    <td align="center" class="graph" style="width:8%">Доп. ед. изм.</td>
                                    <td align="center" class="graph" style="width:8%">Номера контейнеров</td>
                                    <td align="center" class="graph" style="width:4%">МПО/ЭКГ</td>
                                 </tr>
                                 <xsl:for-each select="tci:GoodsItem">
                                    <tr>
                                       <td align="center" class="graph">
                                          <xsl:value-of select="catESAD_cu:GoodsNumeric"/>
                                       </td>
                                       <td align="center" class="graph">
                                          <xsl:for-each select="catESAD_cu:GoodsDescription">
                                             <xsl:value-of select="."/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:for-each>
                                       </td>
                                       <td align="center" class="graph">
                                          <xsl:value-of select="tci:TNVEDCode"/>
                                          <br/>
                                       </td>
                                       <td align="center" class="graph" style="width:15mm">
                                          <xsl:value-of select="catESAD_cu:GrossWeightQuantity"/>
                                          <xsl:if test="catESAD_cu:NetWeightQuantity">/<xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
                                          </xsl:if>
                                       </td>
                                       <td align="center" class="graph">
                                          <xsl:value-of select="catESAD_cu:NetWeightQuantity2"/>
                                       </td>
                                       <td align="center" class="graph">
                                          <xsl:value-of select="catESAD_cu:InvoicedCost"/>
                                          <xsl:if test="tci:CurrencyCode"> <xsl:value-of select="tci:CurrencyCode"/>
                                          </xsl:if>
                                       </td>
                                       <td align="center" class="graph">
                                          <xsl:value-of select="catESAD_cu:CustomsCost"/>
                                       </td>
                                       <td align="center" class="graph">
                                          <xsl:value-of select="catESAD_cu:StatisticalCost"/>
                                       </td>
                                       <td align="center" class="graph">
                                          <xsl:value-of select="tci:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
                                       </td>
                                       <td align="center" class="graph">
                                          <xsl:value-of select="tci:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
                                       </td>
                                       <td align="center" class="graph">
                                          <xsl:for-each select="tci:ContainerIdentificator">
											  <xsl:value-of select="."/>
											  <xsl:if test="position()!=last()">, </xsl:if>
                                          </xsl:for-each>
                                       </td>
                                       <td align="center" class="graph">
                                          <xsl:value-of select="catESAD_cu:GoodFeatures"/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </tr>
                     </tbody>
                  </table>
               </xsl:for-each>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template name="Consignor">
      <xsl:param name="cons"/>
      <xsl:for-each select="$cons">
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <xsl:if test="cat_ru:ShortName">
            <xsl:if test="cat_ru:OrganizationName">
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
            <xsl:value-of select="cat_ru:ShortName"/>
            <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
            <br/>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="cat_ru:RFOrganizationFeatures">
               <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
            </xsl:when>
            <xsl:when test="cat_ru:RKOrganizationFeatures">
               <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
            </xsl:when>
            <xsl:when test="cat_ru:RBOrganizationFeatures">
               <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
            </xsl:when>
         </xsl:choose>
         <xsl:if test="cat_ru:Address">
            <br/>
            <xsl:apply-templates select="cat_ru:Address"/>
            <br/>
         </xsl:if>
         <xsl:if test="cat_ru:IdentityCard">
            <xsl:apply-templates select="cat_ru:IdentityCard"/>
         </xsl:if>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
         <br/>
      </xsl:for-each>
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:Address | catESAD_cu:GuaranteeAddress">
      <span class="header">Адрес:</span>
      <br/>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template name="TransportMeans">
      <xsl:param name="tsm"/>
      <td align="center" class="graph" style="width:15mm">
         <xsl:choose>
            <xsl:when test="$tsm">
               <xsl:value-of select="$tsm"/>
            </xsl:when>
            <xsl:otherwise> </xsl:otherwise>
         </xsl:choose>
      </td>
   </xsl:template>
   <xsl:template name="Docum">
      <xsl:param name="doc"/>
      <xsl:if test="$doc/cat_ru:PrDocumentName">
         <xsl:value-of select="$doc/cat_ru:PrDocumentName"/> </xsl:if>
      <xsl:if test="$doc/cat_ru:PrDocumentNumber">№ <xsl:value-of select="$doc/cat_ru:PrDocumentNumber"/> 
			</xsl:if>
      <xsl:if test="$doc/cat_ru:PrDocumentDate"> от <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="$doc/cat_ru:PrDocumentDate"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   
   <xsl:template match="cat_ru:IdentityCard">
      <span class="header">Документ, удостоверяющий личность:</span>
      <br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа - <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
            <xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
</xsl:stylesheet>
