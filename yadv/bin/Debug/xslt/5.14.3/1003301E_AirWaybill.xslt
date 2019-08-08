<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:awb="urn:customs.ru:Information:TransportDocuments:Air:AirWaybill:5.14.3" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 1.0 от 03.12.2008.   -->
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
   <xsl:template match="awb:AirWaybill">
      <html>
         <head>
            <title>AirWaybill</title>
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
					td.border-top-left { border-left: .5pt solid windowtext; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-top-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
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
               <table border="0" width="100%">
                  <tr>
                     <td class="border-right" style="width:10mm">
                        <br/>
                        <xsl:if test="awb:Registration/catTrans_ru:AirlineIATACode">
                           <xsl:value-of select="awb:Registration/catTrans_ru:AirlineIATACode"/>
                        </xsl:if>
                     </td>
                     <td class="border-right" style="width:10mm">
                        <br/>
                        <xsl:value-of select="awb:DeparturePoint/catTrans_ru:IATACode"/>
                     </td>
                     <td style="width:160mm">
                        <br/>
                        <xsl:value-of select="awb:Registration/catTrans_ru:DocumentNumber"/>
                     </td>
                  </tr>
               </table>
               <table border="1" width="180mm">
                  <tr>
                     <td class="border" style="width:90mm">
                        <table border="0" width="100%">
                           <tr>
                              <td style="width:45mm">
										Shipper's Name and Address
										
									</td>
                              <td align="center" class="border-left-bottom" style="width:45mm">Shipper's Account Number<br/>
                                 <span class="value">
                                    <xsl:value-of select="awb:Consignor/awb:AccountNumber"/>
                                 </span>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="2" style="width:90mm">
                                 <span class="value">
                                    <xsl:apply-templates select="awb:Consignor"/>
                                 </span>
                              </td>
                           </tr>
                        </table>
                     </td>
                     <td align="left" class="border" style="width:90mm">
                        <table border="0" width="100%">
                           <tr>
                              <td style="width:90mm">
                                 <p align="left">Not Negotiable</p>
                                 <br/>
                                 <span class="bold">Air Waybill</span>
                                 <br/>
										 Issued by<br/>
                                 <xsl:apply-templates select="awb:IssueInfo"/>
                                 <br/>
                              </td>
                           </tr>
                           <tr>
                              <td class="border-top" style="width:90mm">
                                 <xsl:text>Copies 1, 2 and 3 of this Air Waybill are originals and have h same	validity.</xsl:text>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td class="border" style="width:90mm">
                        <table border="0" width="100%">
                           <tr>
                              <td style="width:45mm">
										Consignee's Name and Address
										
									</td>
                              <td align="center" class="border-left-bottom" style="width:45mm">Consignee's Account Number<br/>
                                 <span class="value">
                                    <xsl:value-of select="awb:Consignee/awb:AccountNumber"/>
                                 </span>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="2" style="width:90mm">
                                 <span class="value">
                                    <xsl:apply-templates select="awb:Consignee"/>
                                 </span>
                              </td>
                           </tr>
                        </table>
                     </td>
                     <td align="left" class="border" style="width:90mm">
							It is agreed that the goods described herein are accepted in apparent good order and condition (except as noted) for carriage SUBJECT TO THE 
								CONDITIONS OF CONTRACT ON THE REVERSE HEREOF. ALL GOODS MAY BE CARRIED BY ANY OTHER MEANS INCLUDING ROAD OR ANY OTHER CARRIER UNLESS SPECIFIC 
								CONTRARY INSTRUCTIONS ARE GIVEN HEREON BY THE SHIPPER, AND SHIPPER AGREES THAT THE SHIPMENT MAY BE CARRIED VIA INTERMEDIATE STOPPING PLACES 
								WHICH THE CARRIER DEEMS APPROPRIATE. THE SHIPPER’S ATTENTION IS DRAWN TO THE NOTICE CONCERNING CARRIER’S LIMITATION OF LIABILITY. Shipper may 
								increase such limitation of liability by declaring a higher value for carriage and paying a supplemental charge if required.
						</td>
                  </tr>
                  <tr>
                     <td class="border" style="width:90mm">
                        <table border="0" width="100%">
                           <tr>
                              <td class="border-bottom" colspan="2" style="width:90mm">
                                 <xsl:text>Issuing Carrier's Agent Name and City</xsl:text>
                                 <br/>
                                 <span class="value">
                                    <xsl:apply-templates select="awb:IssuingCarrierAgent"/>
                                 </span>
                              </td>
                           </tr>
                           <tr>
                              <td style="width:45mm">Agent's IATA Code<br/>
                                 <span class="value">
                                    <xsl:if test="awb:IssuingCarrierAgent/awb:IATACode">
                                       <xsl:value-of select="awb:IssuingCarrierAgent/awb:IATACode"/>
                                    </xsl:if>
                                 </span>
                              </td>
                              <td class="border-left" style="width:45mm">Account No.<br/>
                                 <span class="value">
                                    <xsl:value-of select="awb:IssuingCarrierAgent/awb:AccountNumber"/>
                                 </span>
                              </td>
                           </tr>
                           <tr>
                              <td class="border-top" colspan="2" style="width:90mm">Airport of Departure (Addr. of First Carrier) and Requested Routing<br/>
                                 <span class="value">
                                    <xsl:value-of select="awb:DeparturePoint/catTrans_ru:Name"/>
                                 </span>
                              </td>
                           </tr>
                        </table>
                     </td>
                     <td align="left" class="border" style="width:90mm">
							Accounting Information<br/>
                        <xsl:for-each select="awb:Payment/awb:Comments">
                           <span class="value">
                              <xsl:value-of select="."/>
                           </span>
                           <br/>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td class="border" style="width:90mm">
                        <table border="0" style="width:90mm">
                           <tr>
                              <td class="border-right" style="width:1mm">
										To
									</td>
                              <td style="width:14mm">
										By First Carrier
									</td>
                              <td class="border-left-right-bottom" style="width:21mm">
                                 <xsl:text disable-output-escaping="yes">Routing&amp;nbsp;and&amp;nbsp;Destination</xsl:text>
                              </td>
                              <td style="width:0.5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="border-left-right" style="width:1.5mm">
										to
									</td>
                              <td class="border-right" style="width:2mm">
										by
									</td>
                              <td class="border-right" style="width:2mm">
										to
									</td>
                              <td style="width:2mm">
										by
									</td>
                           </tr>
                           <tr>
                              <td class="border-right" style="width:1mm">
                                 <xsl:choose>
                                    <xsl:when test="awb:GoodsMovement[awb:NumPP=1]/awb:DestinationPlace">
                                       <xsl:value-of select="awb:GoodsMovement[awb:NumPP=1]/awb:DestinationPlace"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                                 <br/>
                                 <br/>
                                 <br/>
                              </td>
                              <td colspan="3" style="width:35.5mm">
                                 <xsl:choose>
                                    <xsl:when test="awb:GoodsMovement[awb:NumPP=1]/awb:CarrierName">
                                       <xsl:value-of select="awb:GoodsMovement[awb:NumPP=1]/awb:CarrierName"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td class="border-left-right" style="width:1.5mm">
                                 <xsl:choose>
                                    <xsl:when test="awb:GoodsMovement[awb:NumPP=2]/awb:DestinationPlace">
                                       <xsl:value-of select="awb:GoodsMovement[awb:NumPP=2]/awb:DestinationPlace"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td class="border-right" style="width:2mm">
                                 <xsl:choose>
                                    <xsl:when test="awb:GoodsMovement[awb:NumPP=2]/awb:CarrierName">
                                       <xsl:value-of select="awb:GoodsMovement[awb:NumPP=2]/awb:CarrierName"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td class="border-right" style="width:2mm">
                                 <xsl:choose>
                                    <xsl:when test="awb:GoodsMovement[awb:NumPP=3]/awb:DestinationPlace">
                                       <xsl:value-of select="awb:GoodsMovement[awb:NumPP=3]/awb:DestinationPlace"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td style="width:2mm">
                                 <xsl:choose>
                                    <xsl:when test="awb:GoodsMovement[awb:NumPP=3]/awb:CarrierName">
                                       <xsl:value-of select="awb:GoodsMovement[awb:NumPP=3]/awb:CarrierName"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                           </tr>
                        </table>
                     </td>
                     <td class="border" style="width:90mm">
                        <table border="0" style="width:90mm">
                           <tr>
                              <td class="border-right" style="width:3mm">
										Currency
									</td>
                              <td style="width:2mm">
										CHGS
									</td>
                              <td align="center" class="border-left-bottom" colspan="2" style="width:4mm">
										WT/VAL
									</td>
                              <td align="center" class="border-left-bottom" colspan="2" style="width:4mm">
										Other
									</td>
                              <td class="border-left-right" style="width:16mm">
										Declared Value for Carriage
									</td>
                              <td style="width:16mm">
										Declared Value for Customs
									</td>
                           </tr>
                           <tr>
                              <td class="border-right" style="width:3mm">
                                 <br/>
                                 <xsl:value-of select="awb:AgreedValuationCurrencyCode"/>
                              </td>
                              <td class="border-right" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <br/>
                                 <xsl:if test="awb:PaymentInfo/awb:TaxCode">
                                    <xsl:value-of select="awb:PaymentInfo/awb:TaxCode"/>
                                 </xsl:if>
                              </td>
                              <td class="border-right" style="width:2mm">
										PPD<br/>
                                 <xsl:if test="awb:PaymentInfo/awb:WeightValuePrepaidFlag='true' or awb:PaymentInfo/awb:WeightValuePrepaidFlag='t' or awb:PaymentInfo/awb:WeightValuePrepaidFlag='1' ">X</xsl:if>
                              </td>
                              <td class="border-right" style="width:2mm">
										COLL<br/>
                                 <xsl:if test="awb:PaymentInfo/awb:WeightValuePrepaidFlag='false' or awb:PaymentInfo/awb:WeightValuePrepaidFlag='f' or awb:PaymentInfo/awb:WeightValuePrepaidFlag='0' ">X</xsl:if>
                              </td>
                              <td class="border-right" style="width:2mm">
										PPD<br/>
                                 <xsl:if test="awb:PaymentInfo/awb:OtherChargesPrepaidFlag='true' or awb:PaymentInfo/awb:OtherChargesPrepaidFlag='t' or awb:PaymentInfo/awb:OtherChargesPrepaidFlag='1' ">X</xsl:if>
                              </td>
                              <td class="border-right" style="width:2mm">
										COLL<br/>
                                 <xsl:if test="awb:PaymentInfo/awb:OtherChargesPrepaidFlag='false' or awb:PaymentInfo/awb:OtherChargesPrepaidFlag='f' or awb:PaymentInfo/awb:OtherChargesPrepaidFlag='0' ">X</xsl:if>
                              </td>
                              <td class="border-right" style="width:16mm">
                                 <br/>
                                 <xsl:choose>
                                    <xsl:when test="awb:AgreedValuation">
                                       <xsl:value-of select="awb:AgreedValuation"/>
                                    </xsl:when>
                                    <xsl:otherwise>NDV</xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td style="width:16mm">
                                 <br/>
                                 <xsl:choose>
                                    <xsl:when test="awb:TotalCost">
                                       <xsl:value-of select="awb:TotalCost"/>
                                    </xsl:when>
                                    <xsl:otherwise>NDV</xsl:otherwise>
                                 </xsl:choose>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td class="border" style="width:90mm">
                        <table border="0" style="width:90mm">
                           <tr>
                              <td align="center" class="border-right" style="width:45mm">
										Airport of Destination
									</td>
                              <td style="width:11mm">
										Flight/Date
									</td>
                              <td class="border-left-right-bottom" colspan="2" style="width:22mm">
                                 <xsl:text disable-output-escaping="yes">For&amp;nbsp;Carrier&amp;nbsp;Use&amp;nbsp;Only</xsl:text>
                              </td>
                              <td style="width:12mm">
										Flight/Date
									</td>
                              <xsl:if test="(awb:GoodsMovement[awb:NumPP=3]/awb:FlightDate) or (awb:GoodsMovement[awb:NumPP=3]/awb:FlightNumber)">
                                 <td style="width:12mm">
										Flight/Date
									</td>
                              </xsl:if>
                           </tr>
                           <tr>
                              <td class="border-right" style="width:45mm">
                                 <xsl:if test="awb:DestinationPoint/catTrans_ru:Name">
                                    <xsl:value-of select="awb:DestinationPoint/catTrans_ru:Name"/>
                                 </xsl:if>
                                 <br/>
                                 <br/>
                              </td>
                              <td colspan="2" style="width:22mm">
                                 <xsl:choose>
                                    <xsl:when test="(awb:GoodsMovement[awb:NumPP=1]/awb:FlightDate) or (awb:GoodsMovement[awb:NumPP=1]/awb:FlightNumber)">
                                       <xsl:value-of select="awb:GoodsMovement[awb:NumPP=1]/awb:FlightNumber"/>
                                       <xsl:if test="(awb:GoodsMovement[awb:NumPP=1]/awb:FlightNumber) and (awb:GoodsMovement[awb:NumPP=1]/awb:FlightDate)">
												 / 
												</xsl:if>
                                       <xsl:value-of select="awb:GoodsMovement[awb:NumPP=1]/awb:FlightDate"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <br/>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td class="border-left" colspan="2" style="width:23mm">
                                 <xsl:choose>
                                    <xsl:when test="(awb:GoodsMovement[awb:NumPP=2]/awb:FlightDate) or (awb:GoodsMovement[awb:NumPP=2]/awb:FlightNumber)">
                                       <xsl:value-of select="awb:GoodsMovement[awb:NumPP=2]/awb:FlightNumber"/>
                                       <xsl:if test="(awb:GoodsMovement[awb:NumPP=2]/awb:FlightNumber) and (awb:GoodsMovement[awb:NumPP=2]/awb:FlightDate)">
												 / 
												</xsl:if>
                                       <xsl:value-of select="awb:GoodsMovement[awb:NumPP=2]/awb:FlightDate"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <br/>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <xsl:if test="(awb:GoodsMovement[awb:NumPP=3]/awb:FlightDate) or (awb:GoodsMovement[awb:NumPP=3]/awb:FlightNumber)">
                                 <td class="border-left" colspan="2" style="width:23mm">
                                    <xsl:choose>
                                       <xsl:when test="(awb:GoodsMovement[awb:NumPP=3]/awb:FlightDate) or (awb:GoodsMovement[awb:NumPP=3]/awb:FlightNumber)">
                                          <xsl:value-of select="awb:GoodsMovement[awb:NumPP=3]/awb:FlightNumber"/>
                                          <xsl:if test="(awb:GoodsMovement[awb:NumPP=3]/awb:FlightNumber) and (awb:GoodsMovement[awb:NumPP=3]/awb:FlightDate)">
												 / 
												</xsl:if>
                                          <xsl:value-of select="awb:GoodsMovement[awb:NumPP=3]/awb:FlightDate"/>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <br/>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </td>
                              </xsl:if>
                           </tr>
                        </table>
                     </td>
                     <td class="border" style="width:90mm">
                        <table border="0" style="width:90mm">
                           <tr>
                              <td class="border-right" style="width:35mm">
										Amount of Insurance<br/>
                                 <xsl:choose>
                                    <xsl:when test="awb:XXXIndicator='1'">XXX</xsl:when>
                                    <xsl:otherwise>
                                       <xsl:value-of select="awb:InsuranceCost"/>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td style="width:55mm">
										INSURANCE<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text> if carrier others Insurance, and such insurance is requested 
								in accordance with the conditions the real, indicate amount to be 
								insured in figures in box marked "Amount of Insurance".
									</td>
                           </tr>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td class="border" colspan="2" style="width:180mm">
                        <table border="0" width="100%">
                           <tbody>
                              <tr>
                                 <td colspan="2" style="width:180mm">Handling Information</td>
                              </tr>
                              <tr>
                                 <td style="width:168mm">
                                    <span class="value">
                                       <xsl:for-each select="awb:HandlingInfo">
                                          <xsl:value-of select="awb:ServiceInfoCode"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:for-each select="awb:InfoDescription">
                                             <xsl:value-of select="."/>
                                             <xsl:text> </xsl:text>
                                          </xsl:for-each>
                                          <xsl:apply-templates select="awb:NotificationOrg"/>
                                       </xsl:for-each>
                                    </span>
                                    <xsl:for-each select="awb:Mark">
                                       <br/>
                                       <br/>
                                       <br/>
                                       <span class="value">
												Other Customs, Security and Regulatory Control Information:
												<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                                          <xsl:value-of select="awb:MarkKind"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                                          <xsl:choose>
                                             <xsl:when test="awb:MarkSing = 'true' or awb:MarkSing='t' or awb:MarkSing = '1' ">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                                                <xsl:value-of select="awb:ResultControl"/>
                                             </xsl:when>
                                             <xsl:otherwise>Отметка отсутствует</xsl:otherwise>
                                          </xsl:choose>
                                       </span>
                                    </xsl:for-each>
                                 </td>
                                 <td align="center" class="border-top-left" style="width:12mm">SCI<br/>
                                    <span class="value">
                                       <xsl:value-of select="awb:SCI"/>
                                    </span>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td class="border" colspan="2" style="width:180mm">
                        <table border="0" width="100%">
                           <tbody align="center">
                              <tr>
                                 <td style="width:15mm">No. of Pieces</td>
                                 <td class="border-left" style="width:15mm">Gross<br/>
                                 </td>
                                 <td class="border-left" style="width:2mm">kg</td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td align="left" class="border-left" colspan="2" style="width:22mm">Rate Class</td>
                                 <td class="border-left" style="width:2mm"/>
                                 <td class="border-left" style="width:20mm">Chargeable</td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:21mm">Rate / Charge</td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:30mm">Total</td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:45mm">Nature and Quantity of Goods</td>
                              </tr>
                              <tr>
                                 <td class="border-bottom" style="width:15mm">RCP</td>
                                 <td class="border-left-bottom" style="width:15mm">Weight</td>
                                 <td class="border-left-bottom" style="width:2mm">lb<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-top-left-bottom" style="width:20mm">Commodity Item No.</td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left-bottom" style="width:20mm">Weight</td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left-bottom" style="width:21mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left-bottom" style="width:30mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left-bottom" style="width:45mm">(incl. Dimensions or Volume)</td>
                              </tr>
                              <xsl:for-each select="awb:AWBGoodsInfo/awb:AWBGoods">
                                 <tr>
                                    <td style="width:15mm">
                                       <xsl:value-of select="awb:PlacesQuantity"/>
                                    </td>
                                    <td class="border-left" style="width:15mm">
                                       <xsl:value-of select="awb:GrossWeightQuantity"/>
                                    </td>
                                    <td class="border-left" style="width:2mm">
                                       <xsl:value-of select="awb:WeightUnitQualifierCode"/>
                                    </td>
                                    <td class="border-left" style="width:2mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="border-left" style="width:2mm">
                                       <xsl:choose>
                                          <xsl:when test="awb:TariffClassCode">
                                             <xsl:value-of select="awb:TariffClassCode"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td class="border-left" style="width:20mm">
                                       <xsl:choose>
                                          <xsl:when test="awb:CommodityItemNum">
                                             <xsl:value-of select="awb:CommodityItemNum"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td class="border-left" style="width:2mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="border-left" style="width:20mm">
                                       <xsl:choose>
                                          <xsl:when test="awb:PaidWeightQuantity">
                                             <xsl:value-of select="awb:PaidWeightQuantity"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td class="border-left" style="width:2mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="border-left" style="width:21mm">
                                       <xsl:choose>
                                          <xsl:when test="awb:RateCharge">
                                             <xsl:value-of select="awb:RateCharge"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td class="border-left" style="width:2mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="border-left" style="width:30mm">
                                       <xsl:choose>
                                          <xsl:when test="awb:TotalSum">
                                             <xsl:value-of select="awb:TotalSum"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td class="border-left" style="width:2mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="border-left" style="width:45mm">
                                       <xsl:for-each select="awb:GoodsDescr">
                                          <xsl:value-of select="awb:InformationCode"/>-<xsl:for-each select="awb:GoodsDescription">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </xsl:for-each>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:if test="awb:Dimensions">
                                          <xsl:value-of select="awb:Dimensions/awb:Lenght"/>*<xsl:value-of select="awb:Dimensions/awb:Wight"/>*<xsl:value-of select="awb:Dimensions/awb:Height"/> (<xsl:value-of select="awb:Dimensions/awb:DimensionsCode"/>)
											</xsl:if>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                              <tr>
                                 <td style="width:15mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:15mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:20mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:20mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:21mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:30mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:45mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="border-top" style="width:15mm">
                                    <xsl:value-of select="awb:AWBGoodsInfo/awb:TotalPlacesQuantity"/>
                                 </td>
                                 <td class="border-top-left" style="width:15mm">
                                    <xsl:value-of select="awb:AWBGoodsInfo/awb:GrossWeightQuantity"/>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:20mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:20mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:21mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-top-left" style="width:30mm">
                                    <xsl:value-of select="awb:AWBGoodsInfo/awb:TotalAmount"/>
                                 </td>
                                 <td class="border-left" style="width:2mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="border-left" style="width:45mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td class="border" colspan="2" style="width:180mm">
                        <table border="0" width="100%">
                           <tr>
                              <td style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="border-left-right-bottom" style="width:15mm">
										Prepaid
									</td>
                              <td style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="border-left-right-bottom" colspan="2" style="width:30mm">
										Weight Charge
									</td>
                              <td style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="border-left-right-bottom" style="width:15mm">
										Collect
									</td>
                              <td style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="border-left" rowspan="6" style="width:100mm">
                                 <xsl:text>Other Charges</xsl:text>
                                 <br/>
                                 <xsl:for-each select="awb:PaymentInfo/awb:OtherCharges">
                                    <xsl:value-of select="awb:OtherChargeCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="awb:EntitlementCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>-
											<xsl:value-of select="awb:OtherChargeAmount"/>
                                    <br/>
                                 </xsl:for-each>
                                 <span class="value">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </span>
                              </td>
                           </tr>
                           <tr>
                              <td class="border-right-bottom" colspan="4" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:PrepaydCharge/awb:TotalWeightCharge">
                                    <xsl:value-of select="awb:PaymentInfo/awb:PrepaydCharge/awb:TotalWeightCharge/awb:Amount"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="border-bottom" colspan="4" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:CollectCharge/awb:TotalWeightCharge">
                                    <xsl:value-of select="awb:PaymentInfo/awb:CollectCharge/awb:TotalWeightCharge/awb:Amount"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="2" style="width:20mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="border-left-right-bottom" colspan="4" style="width:40mm">
										Valuation Charge
									</td>
                              <td colspan="2" style="width:20mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td class="border-right-bottom" colspan="4" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:PrepaydCharge/awb:ValuationCharge">
                                    <xsl:value-of select="awb:PaymentInfo/awb:PrepaydCharge/awb:ValuationCharge/awb:Amount"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="border-bottom" colspan="4" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:CollectCharge/awb:ValuationCharge">
                                    <xsl:value-of select="awb:PaymentInfo/awb:CollectCharge/awb:ValuationCharge/awb:Amount"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="3" style="width:25mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="border-left-right-bottom" colspan="2" style="width:30mm">
										Tax
									</td>
                              <td colspan="3" style="width:25mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td class="border-right" colspan="4" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:PrepaydCharge/awb:Taxes">
                                    <xsl:value-of select="awb:PaymentInfo/awb:PrepaydCharge/awb:Taxes/awb:Amount"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td colspan="4" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:CollectCharge/awb:Taxes">
                                    <xsl:value-of select="awb:PaymentInfo/awb:CollectCharge/awb:Taxes/awb:Amount"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td class="border" colspan="2" style="width:180mm">
                        <table border="0" width="100%">
                           <tr>
                              <td style="width:10mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="border-left-right-bottom" colspan="2" style="width:60mm">
                                 <xsl:text>Total Other Charges Due Agent</xsl:text>
                              </td>
                              <td style="width:10mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="border-left" rowspan="4" style="width:100mm">
                                 <xsl:text>Shipper certifies that the particulars on the face hereof are correct and that insofar as any part of the consignment contains dangerous goods, such part is property described by name and is in proper condition for carriage by air according to the applicable Dangerous Goods Regulations.</xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td class="border-right-bottom" colspan="2" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:PrepaydCharge/awb:TotalAgentCharges">
                                    <xsl:value-of select="awb:PaymentInfo/awb:PrepaydCharge/awb:TotalAgentCharges/awb:Amount"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="border-bottom" colspan="2" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:CollectCharge/awb:TotalAgentCharges">
                                    <xsl:value-of select="awb:PaymentInfo/awb:CollectCharge/awb:TotalAgentCharges/awb:Amount"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td style="width:10mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="border-left-right-bottom" colspan="2" style="width:60mm">
                                 <xsl:text>Total Other Charges Due Carrier</xsl:text>
                              </td>
                              <td style="width:10mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td class="border-right-bottom" colspan="2" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:PrepaydCharge/awb:TotalCarrierCharges">
                                    <xsl:value-of select="awb:PaymentInfo/awb:PrepaydCharge/awb:TotalCarrierCharges/awb:Amount"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="border-bottom" colspan="2" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:CollectCharge/awb:TotalCarrierCharges">
                                    <xsl:value-of select="awb:PaymentInfo/awb:CollectCharge/awb:TotalCarrierCharges/awb:Amount"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td class="border-right" colspan="2" style="width:40mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td colspan="2" style="width:40mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="border-left" style="width:100mm" valign="bottom">
                                 <p align="center">
                                    <span class="value">
                                       <xsl:if test="awb:ConsignorSign/cat_ru:PersonSurname">
                                          <xsl:value-of select="awb:ConsignorSign/cat_ru:PersonSurname"/>
                                       </xsl:if>
                                       <xsl:text> </xsl:text>
                                       <xsl:if test="awb:ConsignorSign/cat_ru:PersonName">
                                          <xsl:value-of select="awb:ConsignorSign/cat_ru:PersonName"/>
                                       </xsl:if>
                                       <xsl:text> </xsl:text>
                                       <xsl:if test="awb:ConsignorSign/cat_ru:PersonMiddleName">
                                          <xsl:value-of select="awb:ConsignorSign/cat_ru:PersonMiddleName"/>
                                       </xsl:if>
                                    </span>
                                    <br/>
										Signature of Shipper or his Agent</p>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
                  <tr>
                     <td class="border" colspan="2" style="width:180mm">
                        <table border="0" width="100%">
                           <tr>
                              <td style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="border-left-right-bottom" style="width:30mm">
										Total Prepaid
									</td>
                              <td class="border-right" style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="border-left-right-bottom" style="width:30mm">
										Total Collect
									</td>
                              <td style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="border-left" colspan="3" style="width:100mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td class="border-right-bottom" colspan="3" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:PrepaydCharge">
                                    <xsl:value-of select="awb:PaymentInfo/awb:PrepaydCharge/awb:TotalAmount"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="border-bottom" colspan="3" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:CollectCharge">
                                    <xsl:value-of select="awb:PaymentInfo/awb:CollectCharge/awb:TotalAmount"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="border-left" rowspan="2" style="width:30mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <span class="value"/>
                              </td>
                              <td align="center" rowspan="2" style="width:30mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <span class="value"/>
                              </td>
                              <td align="center" rowspan="2" style="width:40mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <span class="value"/>
                              </td>
                           </tr>
                           <tr>
                              <td style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="border-left-right-bottom" style="width:30mm">
										Currency Conversion Rates
									</td>
                              <td class="border-right" style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="border-left-right-bottom" style="width:30mm">
                                 <xsl:text disable-output-escaping="yes">CC&amp;nbsp;Charges&amp;nbsp;in&amp;nbsp;Dest.&amp;nbsp;Currency</xsl:text>
                              </td>
                              <td style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                           <tr>
                              <td class="border-right" colspan="3" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:CurrencyRate">
                                    <xsl:value-of select="awb:PaymentInfo/awb:CurrencyRate"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td colspan="3" style="width:40mm">
                                 <xsl:if test="awb:PaymentInfo/awb:ChargesDestCurrency">
                                    <xsl:value-of select="awb:PaymentInfo/awb:ChargesDestCurrency"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="border-left" style="width:30mm">
										Executed on (date) <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="awb:Registration/awb:Date"/>
                                 </xsl:call-template>
                              </td>
                              <td align="center" style="width:30mm">
										at (place) <xsl:value-of select="awb:Registration/awb:Place"/>
                              </td>
                              <td align="center" style="width:40mm">
                                 <xsl:text disable-output-escaping="yes">Signature&amp;nbsp;of&amp;nbsp;issuing&amp;nbsp;Carrier&amp;nbsp;or&amp;nbsp;its&amp;nbsp;Agent</xsl:text>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
               </table>
               <table border="0" width="100%">
                  <tr>
                     <td align="center" class="border-left-right-bottom" rowspan="2" style="width:40mm">
										For Carrier Use Only at Destination
									</td>
                     <td style="width:5mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" class="border-left-right-bottom" style="width:30mm">
										Charges at Destination
									</td>
                     <td class="border-right" style="width:5mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td style="width:5mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" class="border-left-right-bottom" style="width:30mm">
										Total Collect Charges
									</td>
                     <td style="width:5mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td class="border-left" rowspan="2" style="width:60mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-right-bottom" colspan="3" style="width:40mm">
                        <xsl:if test="awb:PaymentInfo/awb:ChargesDestination">
                           <xsl:value-of select="awb:PaymentInfo/awb:ChargesDestination"/>
                        </xsl:if>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td class="border-bottom" colspan="3" style="width:40mm">
                        <xsl:if test="awb:PaymentInfo/awb:TotalCollectCharges">
                           <xsl:value-of select="awb:PaymentInfo/awb:TotalCollectCharges"/>
                        </xsl:if>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="awb:Consignor | awb:Consignee | awb:IssuingCarrierAgent | awb:NotificationOrg | awb:IssueInfo">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <br/>
      <xsl:apply-templates select="cat_ru:Address"/>
      <xsl:if test="string(cat_ru:Contact/cat_ru:Phone)!=''">
         <xsl:text> тел. </xsl:text>
         <xsl:value-of select="cat_ru:Contact/cat_ru:Phone"/>
      </xsl:if>
      <xsl:if test="string(cat_ru:Contact/cat_ru:Fax)!=''">
         <xsl:text> факс </xsl:text>
         <xsl:value-of select="cat_ru:Contact/cat_ru:Fax"/>
      </xsl:if>
      <xsl:if test="string(cat_ru:Contact/cat_ru:Telex)!=''">
         <xsl:text> телекс </xsl:text>
         <xsl:value-of select="cat_ru:Contact/cat_ru:Telex"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
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
</xsl:stylesheet>
