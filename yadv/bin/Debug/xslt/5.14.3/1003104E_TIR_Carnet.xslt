<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catTrans_cu="urn:customs.ru:Information:TransportDocuments:CUTransportCommonAgregateTypesCust:5.10.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tirc="urn:customs.ru:Information:TransportDocuments:Car:TIR_Carnet:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
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
   <xsl:template match="tirc:TIR_Carnet">
      <html>
         <head>
            <title>TIR_Carnet</title>
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
					div.page { width: 210mm; height: 297mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
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
                                       <xsl:value-of select="tirc:TIRIdentifier/tirc:TIRSeries"/>
                                       <xsl:value-of select="tirc:TIRIdentifier/tirc:TIRID"/>
                                    </span>
                                 </td>
                              </tr>
                              <tr>
                                 <td height="25" style="width:45mm">
											2. Таможня(и) места отправления<br/>
                                    <xsl:choose>
                                       <xsl:when test="string-length(tirc:TIR_Shipment[position()=1]/tirc:DepartureCustomsOffice)!=0">
                                          <span>1. </span>
                                          <u>
                                             <xsl:value-of select="tirc:TIR_Shipment[position()=1]/tirc:DepartureCustomsOffice"/>
                                          </u>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <xsl:text>1. ________________________________</xsl:text>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                    <br/>
                                 </td>
                                 <td class="border-right" height="25" style="width:45mm">
                                    <br/>
                                    <xsl:choose>
                                       <xsl:when test="string-length(tirc:TIR_Shipment[position()=2]/tirc:DepartureCustomsOffice)>1">
                                          <span>2. </span>
                                          <u>
                                             <xsl:value-of select="tirc:TIR_Shipment[position()=2]/tirc:DepartureCustomsOffice"/>
                                          </u>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <xsl:text>2. ________________________________</xsl:text>
                                       </xsl:otherwise>
                                    </xsl:choose>
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
                                    <xsl:choose>
                                       <xsl:when test="string-length(tirc:TIR_Shipment[position()=3]/tirc:DepartureCustomsOffice)>1">
                                          <span>3. </span>
                                          <u>
                                             <xsl:value-of select="tirc:TIR_Shipment[position()=3]/tirc:DepartureCustomsOffice"/>
                                          </u>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <xsl:text>3. ________________________________</xsl:text>
                                       </xsl:otherwise>
                                    </xsl:choose>
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
                                       <xsl:value-of select="tirc:TIRHolderID"/>
                                       <br/>
                                       <xsl:apply-templates select="tirc:Carrier"/>
                                       <xsl:if test="tirc:Forwarder">
                                          <br/>Экспедитор<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="tirc:Forwarder/catTrans_cu:Name"/>
                                          <br/>
                                          <xsl:apply-templates select="tirc:Forwarder/catTrans_cu:Address"/>
                                       </xsl:if>
                                    </span>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-right-bottom" height="32" style="width:45mm">
											5. Страна(ы) отправления<br/>
                                    <xsl:if test="tirc:DispatchCountryName">
                                       <span class="value">
                                          <xsl:value-of select="tirc:DispatchCountryName"/>
                                       </span>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="value">(<xsl:value-of select="tirc:DispatchCountryA3Code"/>)</span>
                                       <span/>
                                    </xsl:if>
                                 </td>
                                 <td class="border-bottom" height="32" style="width:45mm">
											6. Страна(ы) назначения<br/>
                                    <xsl:if test="tirc:DestinationCountryName">
                                       <span class="value">
                                          <xsl:value-of select="tirc:DestinationCountryName"/>
                                       </span>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="value">(<xsl:value-of select="tirc:DestinationCountryA3Code"/>)</span>
                                       <span/>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-bottom" colspan="2" height="79" style="width:90mm">
											7. Регистрационный(ые) номер(а) дорожного(ых) транспортного(ых)<br/>
											средств(а)<br/>
                                    <xsl:for-each select="tirc:TransportMeans">
                                       <span class="value">
                                          <xsl:value-of select="catTrans_ru:TMNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </span>
                                       <xsl:if test="tirc:TrailerNumber">
													/<span class="value">
                                             <xsl:value-of select="tirc:TrailerNumber"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </span>
                                       </xsl:if>
                                       <xsl:if test="tirc:TrailerNumber2">
													/<span class="value">
                                             <xsl:value-of select="tirc:TrailerNumber2"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </span>
                                       </xsl:if>
                                       <br/>
                                    </xsl:for-each>
                                 </td>
                                 <td class="border-left" colspan="2" height="116" rowspan="2" style="width:90mm">
											8. Прилагаемые к манифесту документы<br/>
                                    <xsl:for-each select="tirc:PrecedingDocument">
                                       <span class="value">
                                          <xsl:if test="tirc:DocumentKind">
                                             <xsl:value-of select="tirc:DocumentKind"/>
                                          </xsl:if>
                                          <xsl:if test="cat_ru:PrDocumentNumber">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                          </xsl:if>
                                          <xsl:if test="cat_ru:PrDocumentDate">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                          <br/>
                                       </span>
                                    </xsl:for-each>
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
                                             <td class="border-right" style="width:40mm">
                                                <xsl:text>9. a) Грузовое(ые) отделение(ия) или контейнер(ы)</xsl:text>
                                                <br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                                <xsl:text>б) Опознавательные знаки и</xsl:text>
                                                <br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>номера грузовых мест или<br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>предметов
															<br/>
                                             </td>
                                             <td style="width:95mm">
                                                <xsl:text>10. Число и род грузовых мест или предметов; описание грузов</xsl:text>
                                             </td>
                                             <td class="border-left" style="width:22mm">
                                                <xsl:text>11. Вес брутто</xsl:text>
                                                <br/>
                                                <xsl:text>в кг.</xsl:text>
                                             </td>
                                          </tr>
                                          <xsl:for-each select="tirc:TIR_Shipment">
                                             <xsl:variable name="row">
                                                <xsl:value-of select="count(tirc:Goods)"/>
                                             </xsl:variable>
                                             <tr>
                                                <td class="border-right" rowspan="{$row}" style="width:40mm">
                                                   <span class="value">
                                                      <xsl:for-each select="tirc:ContainerID">
                                                         <xsl:value-of select="."/>,</xsl:for-each>
                                                      <xsl:if test="tirc:GoodsPlaceID">
                                                         <br/>
                                                         <xsl:value-of select="tirc:GoodsPlaceID"/>
                                                      </xsl:if>
                                                   </span>
                                                </td>
                                                <xsl:for-each select="tirc:Goods[position() = '1']">
                                                   <td class="border-right" style="width:95mm">
                                                      <span class="value">
                                                         <xsl:if test="cat_ru:GoodsMarking">
                                                            <xsl:value-of select="cat_ru:GoodsMarking"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:if>
                                                         <xsl:for-each select="cat_ru:GoodsDescription">
                                                            <xsl:value-of select="."/>
                                                            <xsl:text> </xsl:text>
                                                         </xsl:for-each>
                                                         <xsl:value-of select="catTrans_ru:GoodsTNVEDCode"/>
                                                         <xsl:text> - </xsl:text>
                                                         <xsl:for-each select="catTrans_ru:PlacesInfo">
                                                            <xsl:value-of select="catTrans_cu:PakingQuantity"/>
                                                            <xsl:if test="catTrans_cu:PackingDescription">
                                                               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                               <xsl:value-of select="catTrans_cu:PackingDescription"/>
                                                            </xsl:if>
                                                            <xsl:text> </xsl:text>
                                                         </xsl:for-each>
                                                         <xsl:if test="catTrans_ru:PackingInfo">
                                                            <xsl:text>(</xsl:text>
                                                            <xsl:for-each select="catTrans_ru:PackingInfo">
                                                               <xsl:value-of select="catTrans_cu:PakingQuantity"/>
                                                               <xsl:if test="catTrans_cu:PackingDescription">
                                                                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                                  <xsl:value-of select="catTrans_cu:PackingDescription"/>
                                                               </xsl:if>
                                                               <xsl:text> </xsl:text>
                                                            </xsl:for-each>
                                                            <xsl:text>) </xsl:text>
                                                         </xsl:if>
                                                      </span>
                                                   </td>
                                                   <td style="width:22mm">
                                                      <span class="value">
                                                         <xsl:value-of select="catTrans_ru:GrossWeightQuantity"/>
                                                      </span>
                                                   </td>
                                                </xsl:for-each>
                                                <xsl:for-each select="tirc:Goods[position() != '1']">
                                                   <tr>
                                                      <td class="border-right" style="width:95mm">
                                                         <span class="value">
                                                            <xsl:if test="cat_ru:GoodsMarking">
                                                               <xsl:value-of select="cat_ru:GoodsMarking"/>
                                                               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            </xsl:if>
                                                            <xsl:for-each select="cat_ru:GoodsDescription">
                                                               <xsl:value-of select="."/>
                                                               <xsl:text> </xsl:text>
                                                            </xsl:for-each>
                                                            <xsl:value-of select="catTrans_ru:GoodsTNVEDCode"/>
                                                            <xsl:text> - </xsl:text>
                                                            <xsl:for-each select="catTrans_ru:PlacesInfo">
                                                               <xsl:value-of select="catTrans_cu:PakingQuantity"/>
                                                               <xsl:if test="catTrans_cu:PackingDescription">
                                                                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                                  <xsl:value-of select="catTrans_cu:PackingDescription"/>
                                                               </xsl:if>
                                                               <xsl:text> </xsl:text>
                                                            </xsl:for-each>
                                                            <xsl:if test="catTrans_ru:PackingInfo">
                                                               <xsl:text>(</xsl:text>
                                                               <xsl:for-each select="catTrans_ru:PackingInfo">
                                                                  <xsl:value-of select="catTrans_cu:PakingQuantity"/>
                                                                  <xsl:if test="catTrans_cu:PackingDescription">
                                                                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                                     <xsl:value-of select="catTrans_cu:PackingDescription"/>
                                                                  </xsl:if>
                                                                  <xsl:text> </xsl:text>
                                                               </xsl:for-each>
                                                               <xsl:text>) </xsl:text>
                                                            </xsl:if>
                                                         </span>
                                                      </td>
                                                      <td style="width:22mm">
                                                         <span class="value">
                                                            <xsl:value-of select="catTrans_ru:GrossWeightQuantity"/>
                                                         </span>
                                                      </td>
                                                   </tr>
                                                </xsl:for-each>
                                             </tr>
                                          </xsl:for-each>
                                       </tbody>
                                    </table>
                                 </td>
                                 <td class="border-left" style="width:23mm">
                                    <xsl:text>16. Наложенные пломбы или опознавательные знаки
							(число, идентификация)</xsl:text>
                                    <br/>
                                    <xsl:for-each select="tirc:TIR_Shipment">
                                       <xsl:for-each select="tirc:IdentityMark">
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
                                 <td style="width:67mm">
                                    <table border="0" width="100%">
                                       <tbody>
                                          <tr>
                                             <td class="border-right-bottom" style="width:45mm">
                                                <xsl:text>12. Общее число грузовых мест,  записанных в манифесте:</xsl:text>
                                                <br/>
                                                <span style="graph-number">
                                                   <xsl:value-of select="sum(//tirc:Goods/catTrans_ru:PlacesInfo/catTrans_cu:PakingQuantity)"/>
                                                </span>
                                                <xsl:text>(</xsl:text>
                                                <span style="graph-number">
                                                   <xsl:value-of select="sum(//tirc:Goods/catTrans_ru:GrossWeightQuantity)"/>
                                                </span>
                                                <xsl:text> кг.)</xsl:text>
                                                <br/>
                                                <xsl:text>Место назначения :</xsl:text>
                                             </td>
                                             <td class="border-bottom" style="width:23mm">
                                                <xsl:text>Число</xsl:text>
                                             </td>
                                          </tr>
                                          <xsl:for-each select="tirc:TIR_Shipment">
                                             <tr>
                                                <td class="border-right-bottom" style="width:45mm">
                                                   <xsl:text>Таможня :</xsl:text>
                                                   <!--<xsl:if test="(tirc:Destination/catTrans_ru:DestinationCustomsCode)  and ((count(tirc:TIR_Shipment/tirc:DepartureCustomsOffice) + (count(tirc:Destination/catTrans_ru:DestinationCustomsCode))&gt;2))">-->
                                                   <xsl:if test="tirc:Destination/catTrans_cu:DestinationCustomsCode">
                                                      <span class="value">
                                                         <xsl:value-of select="tirc:Destination/catTrans_cu:DestinationCustomsCode"/>
                                                      </span>
                                                   </xsl:if>
                                                   <xsl:if test="tirc:Destination/catTrans_cu:DestinationPlaceName">
                                                      <xsl:text> </xsl:text>
                                                      <span class="value">
                                                         <xsl:value-of select="tirc:Destination/catTrans_cu:DestinationPlaceName"/>
                                                      </span>
                                                   </xsl:if>
                                                </td>
                                                <td class="border-bottom" style="width:23mm">
                                                   <!--	<xsl:value-of select="sum(tirc:Goods/catTrans_ru:PackingInfo/catTrans_ru:PakingQuantity)"/>-->
                                                   <xsl:if test="tirc:TotalPlacesQuantity">
                                                      <span class="value">
                                                         <xsl:value-of select="tirc:TotalPlacesQuantity"/>
                                                      </span>
                                                   </xsl:if>
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
                                          <xsl:if test="tirc:Carrier/tirc:TIRSignature/tirc:SignPlaceCountry">
                                             <xsl:value-of select="tirc:Carrier/tirc:TIRSignature/tirc:SignPlaceCountry"/>
                                          </xsl:if>
                                          <xsl:text>, </xsl:text>
                                          <xsl:if test="tirc:Carrier/tirc:TIRSignature/tirc:SignDate">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="tirc:Carrier/tirc:TIRSignature/tirc:SignDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                          <br/>
                                          <xsl:if test="tirc:Carrier/tirc:TIRSignature/tirc:SignPlace">
                                             <xsl:value-of select="tirc:Carrier/tirc:TIRSignature/tirc:SignPlace"/>
                                          </xsl:if>
                                       </u>
                                    </span>
                                 </td>
                                 <td class="border-left" style="width:65mm">
                                    <xsl:text>17. Таможня места отправления  Подпись должностного лица таможни и штемпель таможни с датой</xsl:text>
                                    <br/>
                                    <xsl:for-each select="tirc:TIR_Shipment">
                                       <span class="value">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="tirc:IdentityCustPerson/tirc:Date"/>
                                          </xsl:call-template>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="tirc:IdentityCustPerson/cat_ru:PersonName"/>
                                          <xsl:if test="tirc:IdentityCustPerson/cat_ru:LNP">
                                             <xsl:text>(</xsl:text>
                                             <xsl:value-of select="tirc:IdentityCustPerson/cat_ru:LNP"/>
                                             <xsl:text>)</xsl:text>
                                          </xsl:if>
                                       </span>
                                       <br/>
                                    </xsl:for-each>
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
                                    <xsl:if test="tirc:DispatchCustomsMark/tirc:GoodsAcceptInfo">
                                       <span class="value">
                                          <xsl:value-of select="tirc:DispatchCustomsMark/tirc:GoodsAcceptInfo"/>
                                       </span>
                                    </xsl:if>
                                 </td>
                                 <td class="border-bottom" height="36" style="width:90mm">
                                    <xsl:text>24. Свидетельство о прекращении операции МДП (промежуточная
											таможня места назначения)</xsl:text>
                                    <br/>
                                    <xsl:if test="tirc:DepartureCustomsMark/tirc:GoodsAcceptInfo">
                                       <span class="value">
                                          <xsl:value-of select="tirc:DepartureCustomsMark/tirc:GoodsAcceptInfo"/>
                                       </span>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-right-bottom" height="44" style="width:45mm">
                                    <table border="0" width="100%">
                                       <tbody>
                                          <tr>
                                             <!--td height="1mm" style="width:0.5mm;"></td-->
                                             <td height="1mm" style="width:1.5mm"/>
                                             <td rowspan="3" style="width:43mm">
                                                <xsl:text>  19. Наложенные печати и пломбы или опознавательные знаки признаны неповрежденными</xsl:text>
                                             </td>
                                          </tr>
                                          <tr>
                                             <!--td height="1.5mm" style="width:0.5mm;"></td-->
                                             <td align="center" height="1.5mm" style="width:1.5mm;border:solid 0.8pt #000000;" valign="middle">
                                                <xsl:choose>
                                                   <xsl:when test="(number(tirc:DispatchCustomsMark/tirc:IdentityNoBroken)=1) or (tirc:DispatchCustomsMark/tirc:IdentityNoBroken='t') or (tirc:DispatchCustomsMark/tirc:IdentityNoBroken='true')">
                                                      <span class="value">х</span>
                                                   </xsl:when>
                                                   <xsl:otherwise>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </xsl:otherwise>
                                                </xsl:choose>
                                             </td>
                                          </tr>
                                          <tr>
                                             <!--td style="width:0.5mm;"></td-->
                                             <td style="width:1.5mm;"/>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                                 <td class="border-right-bottom" colspan="2" height="44" style="width:45mm">
                                    <xsl:text>20. Продолжительность транзитной перевозки</xsl:text>
                                    <br/>
                                    <xsl:if test="tirc:DispatchCustomsMark/tirc:TransitTime">
                                       <span class="value">
                                          <xsl:value-of select="tirc:DispatchCustomsMark/tirc:TransitTime"/>
                                       </span>
                                    </xsl:if>
                                 </td>
                                 <td class="border-bottom" height="44" style="width:90mm">
                                    <table border="0" width="100%">
                                       <tbody>
                                          <tr>
                                             <!--td height="1mm" style="width:0.5mm;"></td-->
                                             <td height="1mm" style="width:1.5mm"/>
                                             <td rowspan="3" style="width:43mm">
                                                <xsl:text>  25. Наложенные печати и пломбы или опознавательные знаки признаны неповрежденными</xsl:text>
                                             </td>
                                          </tr>
                                          <tr>
                                             <!--td height="1.5mm" style="width:0.5mm;"></td-->
                                             <td align="center" height="1.5mm" style="width:1.5mm;border:solid 0.8pt #000000;" valign="middle">
                                                <xsl:choose>
                                                   <xsl:when test="(number(tirc:DepartureCustomsMark/tirc:IdentityNoBroken)=1) or (tirc:DepartureCustomsMark/tirc:IdentityNoBroken='t') or (tirc:DepartureCustomsMark/tirc:IdentityNoBroken='true')">
                                                      <span class="value">х</span>
                                                   </xsl:when>
                                                   <xsl:otherwise>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </xsl:otherwise>
                                                </xsl:choose>
                                             </td>
                                          </tr>
                                          <tr>
                                             <!--td style="width:0.5mm;"></td-->
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
                                    <xsl:if test="tirc:DispatchCustomsMark/tirc:Customs/cat_ru:Code">
                                       <span class="value">
                                          <xsl:value-of select="tirc:DispatchCustomsMark/tirc:Customs/cat_ru:Code"/>
                                       </span>
                                    </xsl:if>
                                 </td>
                                 <td class="border-right-bottom" height="40" style="width:23mm">
                                    <xsl:text>за №</xsl:text>
                                    <br/>
                                    <xsl:if test="tirc:DispatchCustomsMark/tirc:CustomsDocNum">
                                       <span class="value">
                                          <xsl:value-of select="tirc:DispatchCustomsMark/tirc:CustomsDocNum"/>
                                       </span>
                                    </xsl:if>
                                 </td>
                                 <td class="border-bottom" height="40" style="width:90mm">
                                    <xsl:text>26. Число грузовых мест, в отношении которых удостоверено прекращение
											операции МДП</xsl:text>
                                    <br/>
                                    <xsl:if test="tirc:DepartureCustomsMark/tirc:PackProcFinish">
                                       <span class="value">
                                          <xsl:value-of select="tirc:DepartureCustomsMark/tirc:PackProcFinish"/>
                                       </span>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-right-bottom" colspan="3" height="40" style="width:90mm">
                                    <xsl:text>22. Разное (установленный маршрут, таможня, где должен быть
											представлен груз, и т.д.)</xsl:text>
                                    <br/>
                                    <xsl:if test="tirc:DispatchCustomsMark/tirc:Comments">
                                       <span class="value">
                                          <xsl:value-of select="tirc:DispatchCustomsMark/tirc:Comments"/>
                                       </span>
                                    </xsl:if>
                                 </td>
                                 <td class="border-bottom" height="40" style="width:90mm">
                                    <xsl:text>27. Оговорки при оформлении</xsl:text>
                                    <br/>
                                    <xsl:if test="tirc:DepartureCustomsMark/tirc:Comments">
                                       <span class="value">
                                          <xsl:value-of select="tirc:DepartureCustomsMark/tirc:Comments"/>
                                       </span>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-right" colspan="3" height="39" style="width:90mm">
                                    <xsl:text>23. Отметки таможни отправления или промежуточной таможни при въезде</xsl:text>
                                    <br/>
                                    <span class="value">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="tirc:DispatchCustomsMark/tirc:CustomsPerson/tirc:Date"/>
                                       </xsl:call-template>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="tirc:DispatchCustomsMark/tirc:CustomsPerson/cat_ru:PersonName"/>
                                       <xsl:if test="tirc:DispatchCustomsMark/tirc:CustomsPerson/cat_ru:LNP">
                                          <xsl:text>(</xsl:text>
                                          <xsl:value-of select="tirc:DispatchCustomsMark/tirc:CustomsPerson/cat_ru:LNP"/>
                                          <xsl:text>)</xsl:text>
                                       </xsl:if>
                                    </span>
                                 </td>
                                 <td height="39" style="width:90mm">
                                    <xsl:text>28. Отметки таможни назначения или промежуточной таможни при выезде</xsl:text>
                                    <br/>
                                    <span class="value">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="tirc:DepartureCustomsMark/tirc:CustomsPerson/tirc:Date"/>
                                       </xsl:call-template>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="tirc:DepartureCustomsMark/tirc:CustomsPerson/cat_ru:PersonName"/>
                                       <xsl:if test="tirc:DepartureCustomsMark/tirc:CustomsPerson/cat_ru:LNP">
                                          <xsl:text>(</xsl:text>
                                          <xsl:value-of select="tirc:DepartureCustomsMark/tirc:CustomsPerson/cat_ru:LNP"/>
                                          <xsl:text>)</xsl:text>
                                       </xsl:if>
                                    </span>
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
   <xsl:template match="tirc:Address|catTrans_cu:Address">
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
   <xsl:template match="tirc:Address/*|catTrans_cu:Address/*">
      <xsl:if test="preceding-sibling::*[1]">
         <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="tirc:IdentityCard">
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
   <xsl:template match="tirc:Carrier">
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
      <xsl:if test="tirc:ITN">
         <xsl:text>ИТН </xsl:text>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="tirc:ITN"/>
         <xsl:text> </xsl:text>
      </xsl:if>
      <br/>
      <xsl:apply-templates select="tirc:Address"/>
      <xsl:if test="tirc:IdentityCard">
         <br/>
         <xsl:apply-templates select="tirc:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="Carrier/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
</xsl:stylesheet>
