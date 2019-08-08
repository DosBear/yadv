<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rsm="urn:customs.ru:Information:TransportDocuments:HouseManifest:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template match="rsm:HouseManifest">
      <html>
         <head>
            <title>House Manifest</title>
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
					.graph { font-family: Arial; font-size: 8pt;font-weight: normal }
					.graph-number { font-size: 9pt; font-weight: bold; }
				</style>
         </head>
         <body>
            <div class="page">
               <table border="1" width="180mm">
                  <tr>
                     <td class="border" style="width:135mm">
                        <table border="0" width="100%">
                           <tr>
                              <td style="width:135mm;  font-family: Arial;font-size: 11pt;">
                                 <u>Consolidated Information</u>
                                 <br/>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:90mm">
                                 <table border="0" width="100%">
                                    <tr>
                                       <td class="graph" style="width:35mm">
										Total Gross Weight:
									</td>
                                       <td class="graph" style="width:55mm">
                                          <xsl:value-of select="rsm:TotalGrossWeight/cat_ru:GoodsQuantity"/>
                                          <xsl:if test="rsm:TotalGrossWeight/cat_ru:MeasureUnitQualifierName"> <xsl:value-of select="rsm:TotalGrossWeight/cat_ru:MeasureUnitQualifierName"/>
                                          </xsl:if>
                                          <xsl:if test="rsm:TotalGrossWeight/cat_ru:MeasureUnitQualifierCode"> (<xsl:value-of select="rsm:TotalGrossWeight/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td class="graph" style="width:35mm">
										Total Number of Pieces:</td>
                                       <td class="graph" style="width:55mm">
                                          <xsl:value-of select="rsm:TotalNumberOfPieces"/>
                                       </td>
                                    </tr>
                                    <xsl:if test="rsm:LinesNumberTotal">
                                       <tr>
                                          <td class="graph" style="width:35mm">Trade Name Number:</td>
                                          <td class="graph" style="width:55mm">
                                             <xsl:value-of select="rsm:LinesNumberTotal"/>
                                          </td>
                                       </tr>
                                    </xsl:if>
                                    <tr>
                                       <td class="graph" style="width:35mm">
										Origin Location:</td>
                                       <td class="graph" style="width:55mm">
                                          <xsl:value-of select="rsm:Header/rsm:OriginLocation/catTrans_ru:IATACode"/>
                                          <xsl:if test="rsm:Header/rsm:OriginLocation/catTrans_ru:Name"> <xsl:value-of select="rsm:Header/rsm:OriginLocation/catTrans_ru:Name"/>
                                          </xsl:if>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td class="graph" style="width:35mm">
										Destination Location:</td>
                                       <td class="graph" style="width:55mm">
                                          <xsl:value-of select="rsm:Header/rsm:DestinationLocation/catTrans_ru:IATACode"/>
                                          <xsl:if test="rsm:Header/rsm:DestinationLocation/catTrans_ru:Name"> <xsl:value-of select="rsm:Header/rsm:DestinationLocation/catTrans_ru:Name"/>
                                          </xsl:if>
                                       </td>
                                    </tr>
                                 </table>
                              </td>
                           </tr>
                        </table>
                     </td>
                     <td align="left" class="border" style="width:90mm">
                        <table border="0" width="100%">
                           <tr>
                              <td style="width:90mm">
                                 <br/>
                                 <span class="bold">House Manifest<br/>
                                 </span>
                                 <span class="value">
                                    <br/>№ <xsl:if test="rsm:Header/rsm:MasterWaybillNumber/catTrans_ru:AirlineIATACode">
                                       <xsl:value-of select="rsm:Header/rsm:MasterWaybillNumber/catTrans_ru:AirlineIATACode"/>-</xsl:if>
                                    <xsl:value-of select="rsm:Header/rsm:MasterWaybillNumber/catTrans_ru:DocumentNumber"/>
                                    <br/>
                                    <br/>
                                 </span>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
                  <table border="1" width="180mm">
                     <tbody>
                        <xsl:for-each select="rsm:ItemDetails">
                           <tr>
                              <td class="border" style="width:15mm;font-size: 8pt">House Waybill Number<br/>
                                 <xsl:value-of select="rsm:HouseWaybillNumber"/>
                              </td>
                              <td class="border" style="width:165mm">
                                 <table border="0" width="100%">
                                    <tbody align="center">
                                       <tr>
                                          <td style="width:30mm; font-size: 8pt">Nature of Goods</td>
                                          <td class="border-left" style="width:15mm; font-size: 8pt">Item No</td>
                                          <td class="border-left" style="width:15mm; font-size: 8pt">No. of Pieces (шт.)</td>
                                          <td class="border-left" style="width:15mm; font-size: 8pt">Gross <br/>Weight</td>
                                          <td class="border-left" style="width:10mm; font-size: 8pt">Measures</td>
                                          <td class="border-left" style="width:25mm; font-size: 8pt">Origin</td>
                                          <td class="border-left" style="width:25mm; font-size: 8pt">Place of Destination</td>
                                          <td class="border-left" style="width:40mm; font-size: 8pt">SpecialHandlingCode</td>
                                       </tr>
                                       <tr>
                                          <td class="border-top" style="width:30mm; font-size: 7pt">
                                             <xsl:value-of select="rsm:ItemName"/>
                                          </td>
                                          <td class="border-top-left" style="width:15mm; font-size: 7pt">
                                             <xsl:value-of select="rsm:LineItemNumber"/>
                                          </td>
                                          <td class="border-top-left" style="width:15mm; font-size: 7pt">
                                             <xsl:value-of select="rsm:NumberOfPieces"/>
                                          </td>
                                          <td class="border-top-left" style="width:15mm; font-size: 7pt">
                                             <xsl:value-of select="rsm:GrossWeight/cat_ru:GoodsQuantity"/>
                                          </td>
                                          <td class="border-top-left" style="width:10mm; font-size: 7pt">
                                             <xsl:value-of select="rsm:GrossWeight/cat_ru:MeasureUnitQualifierCode"/>
                                          </td>
                                          <td class="border-top-left" style="width:25mm; font-size: 7pt">
                                             <xsl:value-of select="rsm:OriginLocation/catTrans_ru:IATACode"/>
                                             <xsl:if test="rsm:OriginLocation/catTrans_ru:Name"> <xsl:value-of select="rsm:OriginLocation/catTrans_ru:Name"/>
                                             </xsl:if>
                                          </td>
                                          <td class="border-top-left" style="width:25mm; font-size: 7pt">
                                             <xsl:value-of select="rsm:DestinationLocation/catTrans_ru:IATACode"/>
                                             <xsl:if test="rsm:DestinationLocation/catTrans_ru:Name"> <xsl:value-of select="rsm:DestinationLocation/catTrans_ru:Name"/>
                                             </xsl:if>
                                          </td>
                                          <td class="border-top-left-bottom" style="width:40mm">
                                             <table>
                                                <tbody>
                                                   <xsl:for-each select="rsm:SpecialHandlingCode">
                                                      <tr>
                                                         <td style="width:5mm; font-size: 7pt">
                                                            <xsl:value-of select="rsm:ServiceTypeCode"/>
                                                         </td>
                                                         <td style="width:35mm; font-size: 7pt">
                                                            <xsl:if test="rsm:Description"> <xsl:value-of select="rsm:Description"/>
                                                            </xsl:if>
                                                         </td>
                                                      </tr>
                                                   </xsl:for-each>
                                                </tbody>
                                             </table>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td align="left" class="border-top" colspan="8" style="width:165mm;font-size: 8pt;">
                                             <u>Consignor:</u>
                                             <br/>
                                             <xsl:apply-templates select="rsm:Consignor"/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td align="left" class="border-top" colspan="8" style="width:165mm;font-size: 8pt;">
                                             <u>Consignee:</u>
                                             <br/>
                                             <xsl:apply-templates select="rsm:Consignee"/>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="rsm:Consignor | rsm:Consignee">
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
