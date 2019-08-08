<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cutirc catTrans_cu cat_ru cltTrans_cu" version="1.0" xmlns:catTrans_cu="urn:customs.ru:Information:TransportDocuments:CUTransportCommonAgregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltTrans_cu="urn:customs.ru:Information:TransportDocuments:CUTransportCommonLeafTypesCust:5.10.0" xmlns:cutirc="urn:customs.ru:Information:TransportDocuments:Car:CUTIR_Carnet:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
   <!-- Версия 1.3 от 25.12.2008.  -->
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template match="cutirc:CUTIR_Carnet">
      <html>
         <head>
            <title>CUTIR_Carnet</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 6.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }
					td.bold { font-size: 8.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 10.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
					td.border-left { border-left: medium none; border-right: .5pt solid black; }
					td.border { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: medium none; } 
					td.border-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; } 
					td.border-top { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-bottom { border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; } 
					td.border-top-bottom { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; } 
					td.border-top-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-top-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left-right-bottom { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					span.bold { font-size: 12.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 12.0pt; font-family: Courier; color: windowtext; }
					div.page { width: 210mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graph-number { font-size: 9pt; font-weight: bold; }
				</style>
         </head>
         <body>
            <div class="page">
               <table border="1" cellpadding="3" cellspacing="0" width="180mm">
                  <tr>
                     <td class="border">
                        <table border="0" width="100%">
                           <tbody>
                              <tr>
                                 <td class="border-right-bottom" colspan="2" height="25" style="width:90mm">
                                    <span class="bold">ОТРЫВНОЙ ЛИСТОК № 1 / № 2</span>
                                 </td>
                                 <td class="border-bottom" colspan="2" height="25" style="width:90mm">1.<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="bold">КНИЖКА МДП</span>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                    <span class="bold">
                                       <xsl:value-of select="cutirc:TIRIdentifier/catTrans_cu:TIRSeries"/>
                                       <xsl:value-of select="cutirc:TIRIdentifier/catTrans_cu:TIRID"/>
                                    </span>
                                 </td>
                              </tr>
                              <tr>
                                 <td height="25" style="width:45mm">
											2. Таможня(и) места отправления<br/>
                                    <!--xsl:choose>
                                       <xsl:when test="string-length(cutirc:TIRShipment[position()=1]/cutirc:DepartureCustomsOffice)!=0">
                                          <span>1. </span>
                                          <u>
                                             <xsl:value-of select="cutirc:TIRShipment[position()=1]/cutirc:DepartureCustomsOffice"/>
                                          </u>
                                       </xsl:when>
                                       <xsl:otherwise-->
                                          <xsl:text>1. ________________________________</xsl:text>
                                       <!--/xsl:otherwise>
                                    </xsl:choose-->
                                    <br/>
                                 </td>
                                 <td class="border-right" height="25" style="width:45mm">
                                    <br/>
                                    <!--xsl:choose>
                                       <xsl:when test="string-length(cutirc:TIRShipment[position()=2]/cutirc:DepartureCustomsOffice)>1">
                                          <span>2. </span>
                                          <u>
                                             <xsl:value-of select="cutirc:TIRShipment[position()=2]/cutirc:DepartureCustomsOffice"/>
                                          </u>
                                       </xsl:when>
                                       <xsl:otherwise-->
                                          <xsl:text>2. ________________________________</xsl:text>
                                       <!--/xsl:otherwise>
                                    </xsl:choose-->
                                    <br/>
                                    <br/>
                                 </td>
                                 <td class="border-bottom" colspan="2" height="52" rowspan="2" style="width:90mm">
											3. Наименование международной организации<br/>
                                    <span class="bold">Union Internationale</span>
                                    <br/>
                                    <span class="bold">des Transports</span>
                                    <br/>
                                    <span class="bold">Routiers</span>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-right-bottom" colspan="2" height="27" style="width:90mm">
                                    <!--xsl:choose>
                                       <xsl:when test="string-length(cutirc:TIRShipment[position()=3]/cutirc:DepartureCustomsOffice)>1">
                                          <span>3. </span>
                                          <u>
                                             <xsl:value-of select="cutirc:TIRShipment[position()=3]/cutirc:DepartureCustomsOffice"/>
                                          </u>
                                       </xsl:when>
                                       <xsl:otherwise-->
                                          <xsl:text>3. ________________________________</xsl:text>
                                       <!--/xsl:otherwise>
                                    </xsl:choose-->
                                    <br/>
                                 </td>
                              </tr>
                              <tr>
                                 <td bordercolor="#000000" class="border-right-bottom" colspan="2" height="150" rowspan="2" style="width:90mm">
											Для официального использования 
										</td>
                                 <td class="border-bottom" colspan="2" height="118" style="width:90mm">
											4. Держатель книжки (наименование, адрес, страна)
											<br/>
                                    <span class="value">
                                       <xsl:value-of select="cutirc:Carrier/cutirc:TIRHolderID"/>
                                       <br/>
                                       <xsl:apply-templates select="cutirc:Carrier"/>
                                       <xsl:if test="cutirc:Forwarder">
                                          <br/>Экспедитор<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="cutirc:Forwarder/catTrans_cu:Name"/>
                                          <br/>
                                          <xsl:apply-templates select="cutirc:Forwarder/catTrans_cu:Address"/>
                                       </xsl:if>
                                    </span>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-right-bottom" height="32" style="width:45mm">
											5. Страна(ы) отправления<br/>
                                    <xsl:if test="cutirc:DispatchCountryName">
                                       <span class="value">
                                          <xsl:value-of select="cutirc:DispatchCountryName"/>
                                       </span>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="value">(<xsl:value-of select="cutirc:DispatchCountryCode"/>)</span>
                                       <span/>
                                    </xsl:if>
                                 </td>
                                 <td class="border-bottom" height="32" style="width:45mm">
											6. Страна(ы) назначения<br/>
                                    <xsl:if test="cutirc:DestinationCountryName">
                                       <span class="value">
                                          <xsl:value-of select="cutirc:DestinationCountryName"/>
                                       </span>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="value">(<xsl:value-of select="cutirc:DestinationCountryCode"/>)</span>
                                       <span/>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-bottom" colspan="2" height="79" style="width:90mm">
											7. Регистационный(ые) номер(а) дорожного(ых) транспортного(ых)<br/>
											средств(а)<br/>
                                    <xsl:for-each select="cutirc:CUTransport/cutirc:TransportMeans">
                                       <table>
                                          <tbody>
                                             <tr>
                                                <td>Идентификатор ТС: <span class="value">
                                                      <xsl:value-of select="cat_ru:TransportIdentifier"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </span>
                                                   <br/>
												Идентификатор активного ТС: <span class="value">
                                                      <xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </span>
                                                </td>
                                                <td>
												Номер шасси (VIN): <span class="value">
                                                      <xsl:value-of select="cat_ru:VIN"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </span>
                                                   <br/>
												Код принадлежности ТС: <span class="value">
                                                      <xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </span>
                                                   <br/>
                                                </td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </xsl:for-each>
                                    <br/>
                                 </td>
                                 <td class="border-left" colspan="2" height="116" rowspan="2" style="width:90mm">
											8. Прилагаемые к манифесту документы<br/>
                                    <xsl:for-each select="cutirc:CUPresentedDocuments">
                                       <span class="value">
                                          <xsl:if test="cutirc:PresentedDocumentModeCode">
                                             <xsl:value-of select="cutirc:PresentedDocumentModeCode"/>
                                          </xsl:if>
                                          <xsl:if test="cat_ru:PrDocumentNumber">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                          </xsl:if>
                                          <xsl:if test="cat_ru:PrDocumentDate">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													от <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                          <br/>
                                       </span>
                                    </xsl:for-each>
                                    <xsl:if test="cutirc:PrecedingDocument">
										Информация о предшествующих документах:<br/>
										<xsl:for-each select="cutirc:PrecedingDocument">
										<span class="value">
                                          <xsl:if test="cutirc:PrecedingDocumentModeCode">
                                             <xsl:value-of select="cutirc:PrecedingDocumentModeCode"/>
                                          </xsl:if>
                                          <xsl:if test="cutirc:PrecedingDocumentNumber">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="cutirc:PrecedingDocumentNumber"/>
                                          </xsl:if>
                                          <xsl:if test="cutirc:PrecedingDocumentDate">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													от <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="cutirc:PrecedingDocumentDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                          <br/>
                                       </span>
										</xsl:for-each>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="2" height="37" style="width:90mm">
                                    <span class="bold">ГРУЗОВОЙ МАНИФЕСТ</span>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td class="border">
                        <table border="0" width="100%">
                           <tbody>
                              <tr>
                                 <td class="border-bottom" colspan="3" style="width:157mm">
                                    <table border="0" width="100%">
                                       <tbody>
                                          <tr>
                                             <td class="border-right-bottom" style="width:30mm;">
                                                <xsl:text>9. a) Грузовое(ые) отделение(ия) или контейнер(ы)</xsl:text>
                                                <br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                                <xsl:text>б) Опознавательные знаки и</xsl:text>
                                                <br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>номера грузовых мест или<br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>предметов
															<br/>
                                             </td>
                                             <td class="border-bottom" style="width:95mm">
                                                <xsl:text>10. Число и род грузовых мест или предметов; описание грузов</xsl:text>
                                             </td>
                                             <td class="border-left-bottom" style="width:32mm">
                                                <xsl:text>11. Вес брутто</xsl:text>
                                                <br/>
                                                <xsl:text>в кг.</xsl:text>
                                             </td>
                                          </tr>
                                          <xsl:for-each select="cutirc:TIRShipment">
                                             <xsl:variable name="row">
																x<xsl:value-of select="count(cutirc:TIRGoods)"/>
                                             </xsl:variable>
                                             <tr>
                                                <td class="border-right" rowspan="{$row}" style="width:30mm; font-size: 10pt;">
																	Контейнеры: <xsl:for-each select="cutirc:ContainerID">
                                                      <xsl:value-of select="."/>
														  <xsl:if test="position()!=last()"><xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text></xsl:if>
                                                      </xsl:for-each>
                                                </td>
                                                <td colspan="2" style="width:127mm;">
                                                   <table>
                                                      <tbody>
                                                         <xsl:for-each select="cutirc:TIRGoods">
                                                            <tr>
                                                               <td style="width:95mm;">
                                                                  <span class="value">
                                                                     <xsl:value-of select="cutirc:GoodsTNVEDCode"/>
                                                                     <br/>
                                                                     <xsl:for-each select="cutirc:GoodsDescription">
                                                                        <xsl:value-of select="."/>
                                                                        <br/>
                                                                     </xsl:for-each>
                                                                     <xsl:for-each select="cutirc:PlacesInfo">Грузовые места: <xsl:value-of select="catTrans_cu:PakingQuantity"/>
                                                                        <xsl:if test="catTrans_cu:PackingDescription">
                                                                           , <xsl:value-of select="catTrans_cu:PackingDescription"/>
                                                                        </xsl:if>
                                                                        <xsl:text> </xsl:text>
                                                                        <br/>
                                                                     </xsl:for-each>
                                                                     <xsl:if test="cutirc:PackingInfo">
                                                                        <xsl:text>(</xsl:text>
                                                                        <xsl:for-each select="cutirc:PackingInfo">
																								Упаковка: <xsl:value-of select="catTrans_cu:PakingQuantity"/>
                                                                           <xsl:if test="catTrans_cu:PackingDescription">
                                                                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text> <xsl:value-of select="catTrans_cu:PackingDescription"/>
                                                                           </xsl:if>
                                                                           <xsl:if test="catTrans_cu:PackingCode">, код: <xsl:value-of select="catTrans_cu:PackingCode"/>
                                                                           </xsl:if>
                                                                        </xsl:for-each>
                                                                        <xsl:text>) </xsl:text>
                                                                     </xsl:if>
                                                                  </span>
                                                                  <br/>
                                                                  <br/>
                                                                  <br/>
                                                               </td>
                                                               <td align="center" style="width:32mm;">
                                                                  <span class="value">
                                                                     <xsl:value-of select="cutirc:GrossWeightQuantity"/>
                                                                  </span>
                                                                  <br/>
                                                                  <br/>
                                                                  <br/>
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
                                 <td class="border-left" style="width:23mm">
                                    <xsl:text>16. Наложенные пломбы или опознавательные знаки
							(число, идентификация)</xsl:text>
                                    <br/>
                                    <xsl:for-each select="cutirc:TIRShipment">
                                       <xsl:for-each select="cutirc:IdentityMark">
                                          <span class="value">
                                             <xsl:value-of select="catTrans_cu:IdentityNumber"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="catTrans_cu:MarkDescription"/>
                                          </span>
                                          <br/>
                                       </xsl:for-each>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-top-bottom" style="width:30mm;"/>
                                 <td class="border-top-bottom" colspan="2" style="width:95mm;">
                                    <xsl:text>Общий вес товаров, брутто: </xsl:text>
                                    <span class="value">
                                       <xsl:value-of select="sum(//cutirc:TIRShipment/cutirc:TIRGoods/cutirc:GrossWeightQuantity)"/>
                                    </span>
                                    <br/>
                                    <xsl:text>Общее количество товаров: </xsl:text>
                                    <span class="value">
                                       <xsl:value-of select="count(//cutirc:TIRShipment/cutirc:TIRGoods)"/>
                                    </span>
                                 </td>
                                 <td class="border-top-bottom" style="width:32mm;"/>
                              </tr>
                              <tr>
                                 <td style="width:67mm">
                                    <table border="0" width="100%">
                                       <tbody>
                                          <tr>
                                             <td class="border-right-bottom" style="width:45mm">
                                                <xsl:text>12. Общее число грузовых мест,  записанных в манифесте:</xsl:text>
                                                <br/>
                                                <span style="graph-number">
                                                   <xsl:value-of select="sum(//cutirc:TIRShipment//cutirc:TIRGoods//cutirc:PlacesInfo/cltTrans_cu:PakingQuantity)"/>
                                                </span>
                                                <xsl:text>(</xsl:text>
                                                <span style="graph-number">
                                                   <xsl:value-of select="sum(//cutirc:TIRShipment//cutirc:TIRGoods/cutirc:GrossWeightQuantity)"/>
                                                </span>
                                                <xsl:text> кг.)</xsl:text>
                                                <br/>
                                                <xsl:text>Место назначения :</xsl:text>
                                             </td>
                                             <td class="border-bottom" style="width:23mm">
                                                <xsl:text>Число</xsl:text>
                                                <br/>
                                                <xsl:if test="cutirc:TIRShipment/cutirc:TotalPlacesQuantity">
                                                   <span class="value">
                                                      <xsl:value-of select="(sum(//cutirc:TIRShipment/cutirc:TotalPlacesQuantity))"/>
                                                   </span>
                                                </xsl:if>
                                                <br/>
                                                <br/>
                                             </td>
                                          </tr>
                                          <xsl:for-each select="cutirc:TIRShipment">
                                             <tr>
                                                <td class="border-right-bottom" style="width:45mm">
                                                   <xsl:text>Таможня :</xsl:text>
                                                   <xsl:if test="cutirc:Destination/catTrans_cu:DestinationCustomsCode">
                                                      <span class="value">
                                                         <xsl:value-of select="cutirc:Destination/catTrans_cu:DestinationCustomsCode"/>
                                                      </span>
                                                   </xsl:if>
                                                   <xsl:if test="cutirc:Destination/catTrans_cu:DestinationPlaceName">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                                                      <span class="value">
                                                         <xsl:value-of select="cutirc:Destination/catTrans_cu:DestinationPlaceName"/>
                                                      </span>
                                                   </xsl:if>
                                                </td>
                                                <td class="border-bottom" style="width:23mm">
                                                   <span class="value">
                                                      <xsl:value-of select="cutirc:TotalPlacesQuantity"/>
                                                   </span>
                                                </td>
                                             </tr>
                                          </xsl:for-each>
                                       </tbody>
                                    </table>
                                 </td>
                                 <td class="border-left" style="width:45mm">
                                    <xsl:text>13. Я заявляю, что сведения, приведенные выше в рубриках 1-12, точны и полны</xsl:text>
                                    <br/>
                                    <xsl:text>14. Место и дата</xsl:text>
                                    <br/>
                                    <xsl:text>15. Подпись держателя или его представителя</xsl:text>
                                    <br/>
                                    <br/>
                                    <br/>
                                    <span class="value">
                                       <u>
                                       </u>
                                    </span>
                                 </td>
                                 <td class="border-left" style="width:65mm">
                                    <xsl:text>17. Таможня места отправления  Подпись должностного лица таможни и штемпель таможни с датой</xsl:text>
                                    <br/>
                                 </td>
                                 <td style="width:23mm"/>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td class="border">
                        <table border="0" width="100%">
                           <tbody>
                              <tr>
                                 <td class="border-right-bottom" colspan="3" height="36" style="width:90mm">
                                    <xsl:text>18. Свидетельство о принятии груза к таможенному оформлению 
											(таможня места отправления или промежуточная таможня при въезде)</xsl:text>
                                    <br/>

                                 </td>
                                 <td class="border-bottom" height="36" style="width:90mm">
                                    <xsl:text>24. Свидетельство о прекращении операции МДП (промежуточная
											таможня места назначения)</xsl:text>
                                    <br/>

                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-right-bottom" height="44" style="width:45mm">
                                    <table border="0" width="100%">
                                       <tbody>
                                          <tr>
                                             <td height="1mm" style="width:1.5mm"/>
                                             <td rowspan="3" style="width:43mm">
                                                <xsl:text>  19. Наложенные печати и пломбы или опознавательные знаки признаны неповрежденными</xsl:text>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="center" height="1.5mm" style="width:1.5mm;border:solid 0.8pt #000000;" valign="middle">
                                             </td>
                                          </tr>
                                          <tr>
                                             <td style="width:1.5mm;"/>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                                 <td class="border-right-bottom" colspan="2" height="44" style="width:45mm">
                                    <xsl:text>20. Продолжительность транзитной перевозки</xsl:text>
                                    <br/>
                                 </td>
                                 <td class="border-bottom" height="44" style="width:90mm">
                                    <table border="0" width="100%">
                                       <tbody>
                                          <tr>
                                             <td height="1mm" style="width:1.5mm"/>
                                             <td rowspan="3" style="width:43mm">
                                                <xsl:text>  25. Наложенные печати и пломбы или опознавательные знаки признаны неповрежденными</xsl:text>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="center" height="1.5mm" style="width:1.5mm;border:solid 0.8pt #000000;" valign="middle">
                                             </td>
                                          </tr>
                                          <tr>
                                             <td style="width:1.5mm;"/>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-right-bottom" colspan="2" height="40" style="width:67mm">
                                    <xsl:text>21. Зарегистрировано таможней (какой)</xsl:text>
                                    <br/>
                                 </td>
                                 <td class="border-right-bottom" height="40" style="width:23mm">
                                    <xsl:text>за №</xsl:text>
                                    <br/>
                                 </td>
                                 <td class="border-bottom" height="40" style="width:90mm">
                                    <xsl:text>26. Число грузовых мест, в отношении которых удостоверено прекращение
											операции МДП</xsl:text>
                                    <br/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-right-bottom" colspan="3" height="40" style="width:90mm">
                                    <xsl:text>22. Разное (установленный маршрут, таможня, где должен быть
											представлен груз, и т.д.)</xsl:text>
                                    <br/>
                                 </td>
                                 <td class="border-bottom" height="40" style="width:90mm">
                                    <xsl:text>27. Оговорки при оформлении</xsl:text>
                                    <br/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-right" colspan="3" height="39" style="width:90mm">
                                    <xsl:text>23. Подпись должностного лица таможни
											и штемпель таможни с датой</xsl:text>
                                    <br/>
                                 </td>
                                 <td height="39" style="width:90mm">
                                    <xsl:text>28. Подпись должностного лица таможни
											и штемпель таможни с датой</xsl:text>
                                    <br/>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="catTrans_cu:Address">
      <xsl:if test="string(cat_ru:PostalCode)!=''">
         <xsl:value-of select="cat_ru:PostalCode"/>
         <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="string(cat_ru:Region)!=''">
         <xsl:value-of select="cat_ru:Region"/>
         <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="string(cat_ru:CounryName)!=''">
         <xsl:value-of select="cat_ru:CounryName"/>
         <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="string(cat_ru:City)!=''">
         <xsl:value-of select="cat_ru:City"/>
         <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="string(cat_ru:StreetHouse)!=''">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <!--xsl:template match="catTrans_cu:Address/*">
      <xsl:if test="preceding-sibling::*[1]">
         <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template-->
   <xsl:template match="RUScat_ru:IdentityCard">
      <xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
      <xsl:text> </xsl:text>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="RUScat_ru:OrganizationName"/>
   </xsl:template>
   <xsl:template match="IdentityCard/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cutirc:Carrier">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:text> </xsl:text>
         <xsl:value-of select="cat_ru:ShortName"/>
      </xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
         <br/>
         <xsl:text>ОГРН </xsl:text>
         <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
         <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
         <xsl:text>ИНН </xsl:text>
         <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
         <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
         <xsl:text>КПП </xsl:text>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
         <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:UNP">
         <xsl:text>УНП </xsl:text>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
         <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:BIN">
         <xsl:text>БИН </xsl:text>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
         <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:IIN">
         <xsl:text>ИИН </xsl:text>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
         <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
         <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
      </xsl:if>
      <xsl:if test="RUScat_ru:SubjectAddressDetails">
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
			<br/>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCard">
         <br/>
         <xsl:apply-templates select="RUScat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
   <!--xsl:template match="cutirc:Carrier/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template-->
</xsl:stylesheet>
