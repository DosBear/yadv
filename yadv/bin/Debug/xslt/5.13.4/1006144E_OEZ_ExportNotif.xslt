<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:exnot="urn:customs.ru:Information:CustomsDocuments:OEZ_ExportNotif:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="exnot:OEZ_ExportNotif">
      <html>
         <head>
            <title>Уведомление о вывозе товаров с территории особой экономической зоны</title>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 297mm;
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
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						
						.graphMainbold {
						font-family: Arial;
						font-size: 10pt;
						font-weight:bold;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}				
						.bordered {
					border-bottom: solid 1pt #000000;
					font-weight: bold;
										}	
					.borderednormal {
					border-bottom: solid 1pt #000000;
					font-weight: normal;
										}	
                </style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:297mm">
                  <tbody>
                     <tr>
                        <!--Head-->
                        <td align="left" style="width:167mm" valign="top">
                           <xsl:if test="exnot:DocSign='0'">Предварительное уведомление<br/>о вывозе товаров с территории особой экономической зоны<br/>№ </xsl:if>
                           <xsl:if test="exnot:DocSign='1'">Уведомление о вывозе товаров<br/>с территории портовой особой экономической зоны<br/>№ </xsl:if>
                           <xsl:if test="exnot:DocSign='2'">Уведомление о вывозе товаров<br/>с территории опережающего социально-экономического развития<br/>№ </xsl:if>
                           <u>
                              <xsl:value-of select="exnot:RegistrationNumber/exnot:CustomsCode"/>/
										<xsl:call-template name="russian_date_gtd">
                                 <xsl:with-param name="dateIn2" select="exnot:RegistrationNumber/exnot:RegistrationDate"/>
                              </xsl:call-template>/
							  <xsl:value-of select="exnot:RegistrationNumber/exnot:Number"/>
                           </u>
                        </td>
                        <td>
                           <table style="width:130mm">
                              <tbody>
                                 <tr>
                                    <td align="left">B 
														<xsl:value-of select="exnot:Customs/cat_ru:Code"/> 
														<xsl:value-of select="exnot:Customs/cat_ru:OfficeName"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle" style="border-top:1pt solid black">(наименование таможенного органа<br/> с указанием кода таможенного органа)</td>
                                 </tr>
                                 <tr>
                                    <td align="left">От 
														<xsl:value-of select="exnot:IncidentNotif/cat_ru:OrganizationName"/> 
														<xsl:if test="exnot:IncidentNotif/exnot:Address">
                                          <xsl:for-each select="exnot:IncidentNotif/exnot:Address">
                                             <xsl:call-template name="Address"/>
                                          </xsl:for-each> 
															
                                          <!--xsl:apply-templates name="Address" select="impn:Consignee/impn:Address"/-->
                                       </xsl:if>
                                       <xsl:if test="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures">
                                          <xsl:value-of select="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
															<xsl:value-of select="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
															<xsl:value-of select="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
														</xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle" style="border-top:1pt solid black">
                                       <xsl:if test="exnot:DocSign='0'">(наименование или фамилия, <br/>имя, отчество (для <br/>физического лица), <br/>подающего предварительное уведомление)</xsl:if>
                                       <xsl:if test="exnot:DocSign='1'">(наименование/адрес резидента<br/>портовой особой экономической<br/> зоны, ОГРН, ИНН, КПП)</xsl:if>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table style="width:297mm">
                  <tbody>
                     <xsl:if test="(exnot:ProvisionalDateBegin) or (exnot:ProvisionalDateEnd)">
                        <!--<tr>
									<td align="left">Предварительная дата вывоза с&#160;<u>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="exnot:ProvisionalDateBegin"/>
										</xsl:call-template>
									</u>
									 &#160;по&#160;<u>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="exnot:ProvisionalDateEnd"/>
										</xsl:call-template>
									</u>
										
									
									</td>
								</tr>-->
                     </xsl:if>
                     <xsl:if test="exnot:PassKind">
						 <tr>
							<td align="left">
								<xsl:choose>
									<xsl:when test="exnot:PassKind='0' or exnot:PassKind='false' or exnot:PassKind='f'">уведомление о разовом вывозе</xsl:when>
									<xsl:when test="exnot:PassKind='1' or exnot:PassKind='true' or exnot:PassKind='t'">запрос на многоразовый пропуск</xsl:when>
									<xsl:otherwise><xsl:value-of select="exnot:PassKind"/></xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:if>
                     <tr>
                        <td align="left">
								Отправитель 
									<u>
                              <xsl:if test="not(exnot:Consignor)">                                                        </xsl:if>
                              <xsl:value-of select="exnot:Consignor/cat_ru:OrganizationName"/> 
										<xsl:if test="exnot:Consignor/exnot:Address">
                                 <xsl:for-each select="exnot:Consignor/exnot:Address">
                                    <xsl:call-template name="Address"/>
                                 </xsl:for-each> 
										</xsl:if>
                              <xsl:if test="exnot:Consignor/cat_ru:RFOrganizationFeatures">
                                 <xsl:value-of select="exnot:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
											<xsl:value-of select="exnot:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
											<xsl:value-of select="exnot:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
										</xsl:if>
                           </u>
									 Дата <xsl:if test="exnot:DocSign='1'">вывоза </xsl:if>
                           <u>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="exnot:ExportDate"/>
                              </xsl:call-template>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphLittle" style="width:130mm">(наименование и адрес)</td>
                     </tr>
                     <tr align="left">
                        <td>Средство транспорта <u>
                              <xsl:if test="exnot:TransportMeans/exnot:TransportKind='1'">a/м </xsl:if>
                              <xsl:if test="exnot:TransportMeans/exnot:TransportKind='2'">ж/д </xsl:if>
                              <xsl:if test="exnot:TransportMeans/exnot:TransportKind='3'">авиа </xsl:if>
                              <xsl:if test="exnot:TransportMeans/exnot:TransportMark">
                                 <xsl:value-of select="exnot:TransportMeans/exnot:TransportMark"/> </xsl:if>
                           </u> регистрационный номер <u>
                              <xsl:value-of select="exnot:TransportMeans/exnot:ActiveTransportIdentifier"/>
                              <xsl:if test="exnot:DocSign='1'">, прицеп/полуприцеп <xsl:for-each select="exnot:TransportMeans/exnot:TransportRegNumber">
                                    <xsl:value-of select="."/> 
										</xsl:for-each>
                              </xsl:if>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphLittle" style="width:110mm">(тип/марка)</td>
                     </tr>
                     <xsl:if test="exnot:DocSign='0'">
                        <tr>
                           <td align="left">Регистрационный номер прицепа/полуприцепа <u>
                                 <xsl:for-each select="exnot:TransportMeans/exnot:TransportRegNumber">
                                    <xsl:value-of select="."/> 
										</xsl:for-each>
                              </u>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="left">Дополнительные сведения <u>
                              <xsl:for-each select="exnot:AddInformation">
                                 <xsl:value-of select="."/>
                              </xsl:for-each>
                           </u>
                        </td>
                     </tr>
                     <xsl:if test="exnot:DocSign='1'">
                        <tr>
                           <td align="left">К уведомлению прилагается опись и документы на <u>       </u> л.
								</td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="center">
                           <br/>Сведения о товарах<br/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
                  <tbody>
                     <tr>
                        <td>№ п/п</td>
                        <td>Наименование</td>
                        <td>Кол-во товаров</td>
                        <td>Кол-во грузовых мест</td>
                        <td>Вес товаров</td>
                        <td>Вид упаковки</td>
                        <td>Статус товаров</td>
                        <td>Примечание</td>
                     </tr>
                     <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                     </tr>
                     <xsl:for-each select="exnot:GoodsInfo">
                        <xsl:variable name="pos" select="position()"/>
                        <tr>
                           <td>
                              <xsl:number value="position()"/>
                           </td>
                           <td>
                              <xsl:for-each select="exnot:GoodsDescription">
                                 <xsl:value-of select="."/> 
										</xsl:for-each>
                           </td>
                           <td>
                              <xsl:value-of select="exnot:SupplementaryQuantity/cat_ru:GoodsQuantity"/> 
										<xsl:value-of select="exnot:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> 
										<xsl:value-of select="exnot:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
                           </td>
                           <td>
                              <xsl:value-of select="exnot:PackagesQuantity"/> 
									</td>
                           <td>
                              <xsl:value-of select="exnot:WeighQuantity"/> 
									</td>
                           <td>
                              <xsl:value-of select="exnot:PackagingKind"/> 
										
										
									</td>
                           <!--<td>
														<xsl:value-of select="exnot:GoodsStatus"/>
													</td>-->
                           <td align="left">
                              <xsl:for-each select="exnot:GoodsStatus">
                                 <xsl:value-of select="exnot:StatusSymbolicValue"/>
                                 <xsl:if test="exnot:CustomsModeCode"><xsl:text>/</xsl:text><xsl:value-of select="exnot:CustomsModeCode"/>
                                 </xsl:if>
                                 <xsl:if test="exnot:GTDID"><xsl:text>/</xsl:text><xsl:value-of select="exnot:GTDID/cat_ru:CustomsCode"/><xsl:text>/</xsl:text><xsl:call-template name="russian_date_dt">
                                       <xsl:with-param name="dateIn3" select="exnot:GTDID/cat_ru:RegistrationDate"/>
                                    </xsl:call-template>/<xsl:value-of select="exnot:GTDID/cat_ru:GTDNumber"/>
                                 </xsl:if> 
								<xsl:if test="exnot:GoodsNumeric"><xsl:text>/</xsl:text><xsl:value-of select="exnot:GoodsNumeric"/>
								</xsl:if>
								<xsl:if test="exnot:NetWeightQuantity"><xsl:text>/</xsl:text><xsl:value-of select="exnot:NetWeightQuantity"/>
                                </xsl:if>
                                 <xsl:if test="exnot:SupplementaryQuantity"><xsl:text>/</xsl:text><xsl:value-of select="exnot:SupplementaryQuantity/cat_ru:GoodsQuantity"/><xsl:value-of select="exnot:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
                                    <xsl:if test="exnot:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">(код <xsl:value-of select="exnot:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
                                 </xsl:if>
                                 <!--xsl:choose>
														<xsl:when test="(exnot:StatusSymbolicValue='ТТС') or (exnot:StatusSymbolicValue='ТРАНЗИТ')"><xsl:value-of select="exnot:StatusSymbolicValue"/></xsl:when>
														<xsl:when test="exnot:StatusSymbolicValue='ИНТ'">
														<xsl:value-of select="exnot:StatusSymbolicValue"/><xsl:if test="exnot:CustomsModeCode">/&#160;<xsl:value-of select="exnot:CustomsModeCode"/></xsl:if>
														<xsl:if test="exnot:GTDID">/&#160;<xsl:variable name="data1"><xsl:value-of select="substring(exnot:GTDID/cat_ru:RegistrationDate,9,2)"/></xsl:variable>
														<xsl:variable name="data2"><xsl:value-of select="substring(exnot:GTDID/cat_ru:RegistrationDate,6,2)"/></xsl:variable>
														<xsl:variable name="data3"><xsl:value-of select="substring(exnot:GTDID/cat_ru:RegistrationDate,1,4)"/></xsl:variable>
				
														<xsl:value-of select="concat(exnot:GTDID/cat_ru:CustomsCode,'/',$data1,$data2,$data3,'/',exnot:GTDID/cat_ru:GTDNumber)"/>
														</xsl:if>
														</xsl:when>
														<xsl:when test="exnot:StatusSymbolicValue='СТЗ'">
														<xsl:value-of select="exnot:StatusSymbolicValue"/>
														<xsl:if test="exnot:GTDID">/&#8194;<xsl:variable name="data1"><xsl:value-of select="substring(exnot:GTDID/cat_ru:RegistrationDate,9,2)"/></xsl:variable>
														<xsl:variable name="data2"><xsl:value-of select="substring(exnot:GTDID/cat_ru:RegistrationDate,6,2)"/></xsl:variable>
														<xsl:variable name="data3"><xsl:value-of select="substring(exnot:GTDID/cat_ru:RegistrationDate,1,4)"/></xsl:variable>
				
														<xsl:value-of select="concat(exnot:GTDID/cat_ru:CustomsCode,'/',$data1,$data2,$data3,'/',exnot:GTDID/cat_ru:GTDNumber)"/>
														</xsl:if>
														<xsl:if test="exnot:GoodsNumeric">/&#8194;<xsl:value-of select="exnot:GoodsNumeric"/></xsl:if>
														<xsl:choose>
															<xsl:when test="exnot:NetWeightQuantity">/&#8194;<xsl:value-of select="exnot:NetWeightQuantity"/>&#160;(кг)</xsl:when>
															<xsl:when test="exnot:SupplementaryQuantity/cat_ru:GoodsQuantity">/&#8194;<xsl:value-of select="exnot:SupplementaryQuantity/cat_ru:GoodsQuantity"/>&#160;<xsl:value-of select="exnot:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/><xsl:if test="exnot:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"> (код <xsl:value-of select="exnot:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if></xsl:when>
														</xsl:choose>													
														</xsl:when>
													</xsl:choose-->
                                 <br/>
                              </xsl:for-each>
                           </td>
                           <td>
                              <xsl:for-each select="exnot:Note">
                                 <xsl:value-of select="."/> 
														</xsl:for-each>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
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
      <xsl:param name="dateIn2"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn2,5,1)='-' and substring($dateIn2,8,1)='-'">
            <xsl:value-of select="substring($dateIn2,9,2)"/>
            <xsl:value-of select="substring($dateIn2,6,2)"/>
            <xsl:value-of select="substring($dateIn2,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn2"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date_dt">
      <xsl:param name="dateIn3"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn3,5,1)='-' and substring($dateIn3,8,1)='-'">
            <xsl:value-of select="substring($dateIn3,9,2)"/>
            <xsl:value-of select="substring($dateIn3,6,2)"/>
            <xsl:value-of select="substring($dateIn3,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn3"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
