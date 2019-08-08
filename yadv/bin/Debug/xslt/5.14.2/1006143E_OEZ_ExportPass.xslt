<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:expas="urn:customs.ru:Information:CustomsDocuments:OEZ_ExportPass:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="expas:OEZ_ExportPass">
      <html>
         <head>
            <title>Пропуск на выезд средства транспорта с территории ОЭЗ</title>
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
					.allbordered {
					border-bottom: solid 1pt #000000;
					border-top: solid 1pt #000000;
					border-left: solid 1pt #000000;
					border-right: solid 1pt #000000;
					font-weight: normal;
										}	
					 td.graphUnderline {
                    border-bottom: 1px solid black;
                    text-align: center;
                    font-weight: normal;
                    font-size: 9pt; 
                    }
                                       
                    td.graphNotUnderline {
                    border-bottom: 0px solid black;
                    text-align: center;
                    font-weight: normal; 
                    }
                    
                </style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:297mm">
                  <tbody>
                     <xsl:if test="expas:DocSign='1'">
                        <tr>
                           <td align="right">
                              <xsl:apply-templates select="expas:Resident"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="center">Разрешение №
								<u>
                              <xsl:value-of select="expas:RegistrationNumber/expas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                                 <xsl:with-param name="dateIn2" select="expas:RegistrationNumber/expas:RegistrationDate"/>
                              </xsl:call-template>/<xsl:value-of select="expas:RegistrationNumber/expas:Number"/>
                           </u>
                           <br/>
							<xsl:text> на </xsl:text>
									<xsl:choose>
							  <xsl:when test="expas:DocSign='0'">выезд средства транспорта с территории ОЭЗ</xsl:when>
                              <xsl:when test="expas:DocSign='1'">вывоз товаров с территории ПОЭЗ</xsl:when>
                              <xsl:otherwise>вывоз товаров и транспортных средств с территории участка ТОСЭР</xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                     <tr align="left">
                        <td>
                           <table style="width:297mm">
                              <tbody>
                                 <tr>
                                    <td style="width:75mm" valign="bottom">Разрешается выезд средства транспорта</td>
                                    <td align="center" class="bordered" style="width:80mm" valign="bottom">
                                       <!--<xsl:if test="expas:TransportMeans/expas:TransportKind='1'">
														а/м&#160;
											</xsl:if>
													<xsl:if test="expas:TransportMeans/expas:TransportKind='2'">
														ж/д&#160;
											</xsl:if>-->
                                       <xsl:choose>
                                          <xsl:when test="expas:TransportMeans/expas:TransportKind='1'">а/м </xsl:when>
                                          <xsl:when test="expas:TransportMeans/expas:TransportKind='2'">ж/д </xsl:when>
                                          <xsl:otherwise>авиа </xsl:otherwise>
                                       </xsl:choose>
                                       <xsl:if test="expas:TransportMeans/expas:TransportMark">
														(<xsl:value-of select="expas:TransportMeans/expas:TransportMark"/>) 
											</xsl:if>
                                       <xsl:value-of select="expas:TransportMeans/expas:ActiveTransportIdentifier"/>
                                       <xsl:if test="expas:TransportMeans/expas:TransportRegNumber">, 
												прицеп/полуприцеп <xsl:for-each select="expas:TransportMeans/expas:TransportRegNumber">
                                             <xsl:value-of select="."/> 
												</xsl:for-each>
                                       </xsl:if>
                                    </td>
                                    <td style="width:57mm" valign="bottom">,перевозящего товары</td>
                                    <td align="center" class="bordered" style="width:95mm" valign="bottom">
                                       <xsl:value-of select="expas:Consignor/cat_ru:OrganizationName"/> 
													<xsl:if test="expas:Consignor/expas:Address">
                                          <xsl:for-each select="expas:Consignor/expas:Address">
                                             <xsl:call-template name="Address"/>
                                          </xsl:for-each> 
													</xsl:if>
                                       <xsl:if test="expas:Consignor/cat_ru:RFOrganizationFeatures">
                                          <xsl:value-of select="expas:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
										<xsl:value-of select="expas:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
										<xsl:value-of select="expas:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
										</xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td/>
                                    <td align="center" class="graphLittle">(тип (марка), регистрационный(е) номер(а),</td>
                                    <td/>
                                    <td align="center" class="graphLittle">(отправитель (грузотправитель) товаров)</td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
                           <br/>согласно перечню:<br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
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
                                 </tr>
                                 <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                    <td>6</td>
                                    <td>7</td>
                                 </tr>
                                 <xsl:for-each select="expas:GoodsList">
                                    <xsl:variable name="pos" select="position()"/>
                                    <tr>
                                       <td>
                                          <xsl:number value="position()"/>
                                       </td>
                                       <td>
                                          <xsl:for-each select="expas:GoodsDescription">
                                             <xsl:value-of select="."/> 
										</xsl:for-each>
                                       </td>
                                       <td>
                                          <xsl:value-of select="expas:SupplementaryQuantity/cat_ru:GoodsQuantity"/> 
														<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> 
														<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
                                       </td>
                                       <td>
                                          <xsl:value-of select="expas:PackagesQuantity"/> 
									</td>
                                       <td>
                                          <xsl:value-of select="expas:WeighQuantity"/> 
									</td>
                                       <td>
                                          <xsl:value-of select="expas:PackagingKind"/> 
										
										
									</td>
                                       <td align="left">
                                          <xsl:for-each select="expas:GoodsStatus">
                                             <xsl:value-of select="expas:StatusSymbolicValue"/>
                                             <xsl:if test="expas:CustomsModeCode">/ <xsl:value-of select="expas:CustomsModeCode"/>
                                             </xsl:if>
                                             <xsl:if test="expas:GTDID">/
														<xsl:value-of select="expas:GTDID/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_dt">
                                                   <xsl:with-param name="dateIn3" select="expas:GTDID/cat_ru:RegistrationDate"/>
                                                </xsl:call-template>/<xsl:value-of select="expas:GTDID/cat_ru:GTDNumber"/>
                                             </xsl:if> 
			
														<xsl:if test="expas:NetWeightQuantity">/
														<xsl:value-of select="expas:NetWeightQuantity"/>
                                             </xsl:if>
                                             <xsl:if test="expas:SupplementaryQuantity">/
														<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:GoodsQuantity"/> <xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
                                                <xsl:if test="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">(код <xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
                                             </xsl:if>
                                             <!--xsl:choose>
														<xsl:when test="(expas:StatusSymbolicValue='ТТС') or (expas:StatusSymbolicValue='ТРАНЗИТ')"><xsl:value-of select="expas:StatusSymbolicValue"/></xsl:when>
														<xsl:when test="expas:StatusSymbolicValue='ИНТ'">
														<xsl:value-of select="expas:StatusSymbolicValue"/><xsl:if test="expas:CustomsModeCode">/&#160;<xsl:value-of select="expas:CustomsModeCode"/></xsl:if>
														<xsl:if test="expas:GTDID">/&#160;<xsl:variable name="data1"><xsl:value-of select="substring(expas:GTDID/cat_ru:RegistrationDate,9,2)"/></xsl:variable>
														<xsl:variable name="data2"><xsl:value-of select="substring(expas:GTDID/cat_ru:RegistrationDate,6,2)"/></xsl:variable>
														<xsl:variable name="data3"><xsl:value-of select="substring(expas:GTDID/cat_ru:RegistrationDate,1,4)"/></xsl:variable>
				
														<xsl:value-of select="concat(expas:GTDID/cat_ru:CustomsCode,'/',$data1,$data2,$data3,'/',expas:GTDID/cat_ru:GTDNumber)"/>
														</xsl:if>
														</xsl:when>
														<xsl:when test="expas:StatusSymbolicValue='СТЗ'">
														<xsl:value-of select="expas:StatusSymbolicValue"/>
														<xsl:if test="expas:GTDID">/&#160;<xsl:variable name="data1"><xsl:value-of select="substring(expas:GTDID/cat_ru:RegistrationDate,9,2)"/></xsl:variable>
														<xsl:variable name="data2"><xsl:value-of select="substring(expas:GTDID/cat_ru:RegistrationDate,6,2)"/></xsl:variable>
														<xsl:variable name="data3"><xsl:value-of select="substring(expas:GTDID/cat_ru:RegistrationDate,1,4)"/></xsl:variable>
				
														<xsl:value-of select="concat(expas:GTDID/cat_ru:CustomsCode,'/',$data1,$data2,$data3,'/',expas:GTDID/cat_ru:GTDNumber)"/>
														</xsl:if>
														<xsl:if test="expas:GoodsNumeric">/&#160;<xsl:value-of select="expas:GoodsNumeric"/></xsl:if>
														<xsl:choose>
															<xsl:when test="expas:NetWeightQuantity">/&#8194;<xsl:value-of select="expas:NetWeightQuantity"/>&#160;(кг)</xsl:when>
															<xsl:when test="expas:SupplementaryQuantity/cat_ru:GoodsQuantity">/&#8194;<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:GoodsQuantity"/>&#160;<xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/><xsl:if test="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">(код <xsl:value-of select="expas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if></xsl:when>
														</xsl:choose>
														</xsl:when>
													</xsl:choose-->
                                             <br/>
                                          </xsl:for-each>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
									на основании следующих коммерческих, транспортных<xsl:if test="expas:DocSign='1'"> (перевозочных)</xsl:if>, таможенных документов:
						</td>
                     </tr>
                     <tr>
                        <td>
                           <table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
                              <tbody>
                                 <tr>
                                    <td>№ п/п</td>
                                    <td>Наименование документов</td>
                                    <td> Реквизиты (номер, дата) документ<xsl:if test="expas:DocSign='0'">а</xsl:if>
                                       <xsl:if test="expas:DocSign='1'">ов</xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                 </tr>
                                 <xsl:for-each select="expas:DocumentExp">
                                    <xsl:variable name="pos" select="position()"/>
                                    <tr>
                                       <td>
                                          <xsl:number value="position()"/>
                                       </td>
                                       <td>
                                          <xsl:value-of select="cat_ru:PrDocumentName"/>
                                       </td>
                                       <td>№<xsl:value-of select="cat_ru:PrDocumentNumber"/> 
													от<xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                          </xsl:call-template>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                      <xsl:if test="expas:PassKind">
						 <tr>
							<td align="left">
								<br/>
								<xsl:choose>
									<xsl:when test="expas:PassKind='0' or expas:PassKind='false' or expas:PassKind='f'">разовый пропуск</xsl:when>
									<xsl:when test="expas:PassKind='1' or expas:PassKind='true' or expas:PassKind='t'">многоразовый пропуск</xsl:when>
									<xsl:otherwise><xsl:value-of select="expas:PassKind"/></xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
                     </xsl:if>
                     <tr>
                        <td align="left">
                           <br/>
                           <xsl:if test="expas:BeginDate">							   
								Начало срока действия пропуска <u>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="expas:BeginDate"/>
									</xsl:call-template>
								</u>
							   <br/>
                           </xsl:if>
								Окончание срока действия пропуска <u>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="expas:LimitDate"/>
                              </xsl:call-template>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <table style="width:297mm">
                              <tbody>
                                 <tr>
                                    <td class="allbordered" style="width:80mm">
                                       <u>
                                          <xsl:value-of select="expas:CustomsPerson/cat_ru:PersonName"/>
                                       </u>
                                       <br/>
                                       <span class="graphLittle">(ФИО должностного лица уполномоченного таможенного органа)</span>
                                    </td>
                                    <td style="width:30mm"/>
                                    <td class="allbordered" style="width:50mm">
                                       <u>
                                          <xsl:value-of select="expas:CustomsPerson/cat_ru:PersonName"/>
                                       </u>
                                       <br/>
                                       <span class="graphLittle">(подпись)</span>
                                    </td>
                                    <td style="width:20mm"/>
                                    <td class="allbordered" style="width:40mm">
                                       <u>
                                          <xsl:value-of select="expas:CustomsPerson/cat_ru:LNP"/>
                                       </u>
                                       <br/>
                                       <span class="graphLittle">(ЛНП)</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
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
   <xsl:template match="expas:Resident">
      <table align="right" border="0">
         <tbody>
            <tr title="наименование организации / ФИО физического лица">
               <td class="graphNotUnderline" valign="top">В </td>
               <td class="graphUnderline">
                  <xsl:value-of select="cat_ru:OrganizationName"/>
                  <xsl:if test="cat_ru:Address"> <xsl:apply-templates select="cat_ru:Address"/>
                  </xsl:if>
               </td>
            </tr>
            <tr title="Наименование организации / ФИО физического лица">
               <td align="center" class="graphLittle" colspan="2">
                  <xsl:choose>
                     <xsl:when test="//expas:DocSign='1'">(наименование/адрес резидента портовой особой экономической зоны)</xsl:when>
                  </xsl:choose>
               </td>
            </tr>
            <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
               <tr title="ОГРН/ОГРНИП">
                  <td class="graphUnderline" colspan="2">
                     <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                  </td>
               </tr>
               <tr title="ОГРН/ОГРНИП">
                  <td align="center" class="graphLittle" colspan="2">ОГРН/ОГРНИП</td>
               </tr>
            </xsl:if>
            <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
               <tr title="ИНН">
                  <td class="graphUnderline" colspan="2">
                     <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                  </td>
               </tr>
               <tr title="ИНН">
                  <td align="center" class="graphLittle" colspan="2">ИНН</td>
               </tr>
            </xsl:if>
            <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
               <tr title="КПП">
                  <td class="graphUnderline" colspan="2">
                     <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                  </td>
               </tr>
               <tr title="КПП">
                  <td align="center" class="graphLittle" colspan="2">КПП</td>
               </tr>
            </xsl:if>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
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
</xsl:stylesheet>
