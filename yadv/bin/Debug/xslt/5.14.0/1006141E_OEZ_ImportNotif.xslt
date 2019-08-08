<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:impn="urn:customs.ru:Information:CustomsDocuments:OEZ_ImportNotif:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="impn:OEZ_ImportNotif">
      <html>
         <head>
            <title>Уведомление/Разрешение о ввозе товаров и въезде средства транспорта на территорию ОЭЗ/ПОЭЗ</title>
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
							font-family:Courier New;
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
                           <xsl:if test="impn:DocSign='2' or impn:DocSign='1'">Уведомление</xsl:if>
                           <xsl:if test="impn:DocSign='3'">Разрешение</xsl:if> № <u>
                              <xsl:value-of select="impn:RegistrationNumber/impn:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                                 <xsl:with-param name="dateIn2" select="impn:RegistrationNumber/impn:RegistrationDate"/>
                              </xsl:call-template>/<xsl:value-of select="impn:RegistrationNumber/impn:Number"/>
                           </u>
                           <br/>
                           <xsl:if test="impn:DocSign='1'">о ввозе товаров на территорию особой экономической зоны<br/>и въезде средства транспорта</xsl:if>
                           <xsl:if test="impn:DocSign='2' or impn:DocSign='3'">о ввозе товаров на территорию<br/>портовой особой экономической зоны</xsl:if>
                        </td>
                        <td>
                           <table style="width:130mm">
                              <tbody>
                                 <tr>
                                    <td align="left" valign="top">B <u>
                                          <xsl:if test="impn:DocSign='2' or impn:DocSign='1'">
                                             <xsl:value-of select="impn:Customs/cat_ru:Code"/> 
														<xsl:value-of select="impn:Customs/cat_ru:OfficeName"/>
                                          </xsl:if>
                                          <xsl:if test="impn:DocSign='3'">
                                             <xsl:value-of select="impn:Consignee/cat_ru:OrganizationName"/> 
															<xsl:if test="impn:Consignee/impn:Address">
                                                <xsl:for-each select="impn:Consignee/impn:Address">
                                                   <xsl:call-template name="Address"/>
                                                </xsl:for-each> 
															
                                                <!--xsl:apply-templates name="Address" select="impn:Consignee/impn:Address"/-->
                                             </xsl:if>
                                             <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures">
                                                <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:value-of select="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
                                                <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:value-of select="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
                                                <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:value-of select="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
                                             </xsl:if>
                                          </xsl:if>
                                       </u>
                                    </td>
                                 </tr>
                                 <tr>
                                    <xsl:if test="impn:DocSign='2' or impn:DocSign='1'">
                                       <td align="center" class="graphLittle">(наименование таможенного органа с указанием кода таможенного органа)</td>
                                    </xsl:if>
                                    <xsl:if test="impn:DocSign='3'">
                                       <td align="center" class="graphLittle">
													(наименование/адрес резидента портовой особой экономической заны, ОГРН,ИНН,КПП
													</td>
                                    </xsl:if>
                                 </tr>
                                 <tr>
                                    <td align="left">От <u>
                                          <xsl:if test="impn:DocSign='2' or impn:DocSign='1'">
                                             <xsl:value-of select="impn:Consignee/cat_ru:OrganizationName"/> 
														<xsl:if test="impn:Consignee/impn:Address">
                                                <xsl:for-each select="impn:Consignee/impn:Address">
                                                   <xsl:call-template name="Address"/>
                                                </xsl:for-each> 
															
                                                <!--xsl:apply-templates name="Address" select="impn:Consignee/impn:Address"/-->
                                             </xsl:if>
                                             <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures">
                                                <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:value-of select="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
                                                <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:value-of select="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
                                                <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:value-of select="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
                                             </xsl:if>
                                          </xsl:if>
                                          <xsl:if test="impn:DocSign='3'">
                                             <xsl:value-of select="impn:Customs/cat_ru:Code"/> 
														<xsl:value-of select="impn:Customs/cat_ru:OfficeName"/>
                                          </xsl:if>
                                       </u>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graphLittle">
                                       <xsl:choose>
                                          <xsl:when test="impn:DocSign='2'">(наименование/адрес резидента портовой особой экономической заны, ОГРН,ИНН,КПП</xsl:when>
                                          <xsl:when test="impn:DocSign='3'">(наименование таможенного органа с указанием кода таможенного органа)</xsl:when>
                                          <xsl:otherwise>(наименование/адрес резидента ОЭЗ (нерезидента ОЭЗ ОГРН,ИНН,КПП) или фамилия, имя, отчество( для физических лиц, ИНН, ОГРНИП)</xsl:otherwise>
                                       </xsl:choose>
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
                     <tr>
                        <td align="left">
                           <xsl:if test="impn:DocSign='2' or impn:DocSign='1'">Настоящим уведомляю, что будет осуществлен ввоз товаров</xsl:if>
                           <xsl:if test="impn:DocSign='3'">Ввоз товаров на территорию ПОЭЗ в срок до </xsl:if>
                           <u>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="impn:ImportDate"/>
                              </xsl:call-template>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <xsl:if test="impn:DocSign='2' or impn:DocSign='1'">
                           <td class="graphLittle">(планируемая дата ввоза товаров)</td>
                        </xsl:if>
                        <xsl:if test="impn:DocSign='3'">
                           <td align="right" class="graphLittle" style="width: 140mm">(установленный срок ввоза товаров)</td>
                        </xsl:if>
                     </tr>
                     <tr align="left">
                        <td>Средство транспорта <u>
                              <xsl:if test="impn:TransportMeans/impn:TransportKind='1'">a/м </xsl:if>
                              <xsl:if test="impn:TransportMeans/impn:TransportKind='2'">ж/д </xsl:if>
                              <xsl:if test="impn:TransportMeans/impn:TransportKind='3'">авиа </xsl:if>
                              <xsl:if test="impn:TransportMeans/impn:TransportMark">
                                 <xsl:value-of select="impn:TransportMeans/impn:TransportMark"/> </xsl:if>
                           </u> регистрационный номер <u>
                              <xsl:value-of select="impn:TransportMeans/impn:ActiveTransportIdentifier"/>
                              <xsl:if test="//impn:DocSign='2' or //impn:DocSign='3'">, прицеп/полуприцеп 
										<xsl:for-each select="impn:TransportMeans/impn:TransportRegNumber">
                                    <xsl:value-of select="."/> 
										</xsl:for-each>
                              </xsl:if>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphLittle" style="width:110mm">(тип/марка)</td>
                     </tr>
                     <xsl:if test="impn:DocSign='1'">
                        <tr>
                           <td align="left">Регистрационный номер прицепа/полуприцепа <u>
                                 <xsl:for-each select="impn:TransportMeans/impn:TransportRegNumber">
                                    <xsl:value-of select="."/> 
										</xsl:for-each>
                              </u>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="impn:AddInformation">
                        <tr>
                           <td align="left">Дополнительные сведения <u>
                                 <xsl:for-each select="impn:AddInformation">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="//impn:DocSign='2'">
                        <tr>
                           <td align="left">К уведомлению прилагается опись и документы на <u>   </u> л.
								</td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="//impn:DocSign='3'">
                        <tr>
                           <td align="left">К разрешению прилагается опись и документы на <u>   </u> л.
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
               <xsl:if test="//impn:DocSign='1'">
                  <table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
                     <tbody>
                        <tr>
                           <td>№ п/п</td>
                           <td>Наименование</td>
                           <td>Кол-во товаров</td>
                           <td>Единица измерения</td>
                           <td>Статус товара</td>
                           <td>Идентификационные признаки товара</td>
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
                        </tr>
                        <xsl:for-each select="impn:GoodsInfo">
                           <xsl:variable name="pos" select="position()"/>
                           <tr>
                              <td>
                                 <xsl:number value="position()"/>
                              </td>
                              <td>
                                 <xsl:for-each select="impn:GoodsDescription">
                                    <xsl:value-of select="."/> 
										</xsl:for-each>
                              </td>
                              <td>
                                 <xsl:value-of select="impn:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
                              </td>
                              <td>
                                 <xsl:value-of select="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> 
										<xsl:value-of select="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/> 
									</td>
                              <td>
                                 <xsl:value-of select="impn:GoodsStatus"/>/<xsl:value-of select="impn:CustomsModeCode"/>
                              </td>
                              <td>
                                 <xsl:for-each select="impn:GoodsIdentification">
                                    <xsl:value-of select="."/> 
										</xsl:for-each>
                              </td>
                              <td>
                                 <xsl:for-each select="impn:Note">
                                    <xsl:value-of select="."/> 
										</xsl:for-each>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <xsl:if test="//impn:DocSign='2'">
                  <table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
                     <tbody>
                        <tr>
                           <td>№ п/п</td>
                           <td>Наименование</td>
                           <td style="width:35mm">Классификационный код товара по ТН ВЭД ЕАЭС</td>
                           <td>Кол-во товаров</td>
                           <td>Статус товара</td>
                           <td>Отправитель (получатель) товара</td>
                           <td>Прочее</td>
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
                        <xsl:for-each select="impn:GoodsInfo">
                           <xsl:variable name="pos" select="position()"/>
                           <tr>
                              <td>
                                 <xsl:number value="position()"/>
                              </td>
                              <td>
                                 <xsl:for-each select="impn:GoodsDescription">
                                    <xsl:value-of select="."/> 
										</xsl:for-each>
                              </td>
                              <td>
											 <xsl:value-of select="impn:GoodsTNVEDCode"/>
                              </td>
                              <td>
											Количество грузовых мест <xsl:value-of select="impn:PackagesQuantity"/> 
											упаковка: <xsl:value-of select="impn:PackagingKind"/>, 
											<xsl:value-of select="impn:SupplementaryQuantity/cat_ru:GoodsQuantity"/> <xsl:value-of select="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
                                 <xsl:if test="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"> (<xsl:value-of select="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
                              </td>
                              <td>
                                 <xsl:value-of select="impn:GoodsStatus"/>/<xsl:value-of select="impn:CustomsModeCode"/>
                              </td>
                              <td>
											 <xsl:apply-templates select="impn:ConsignParticipant"/>
                              </td>
                              <td>
                                 <xsl:for-each select="impn:Note">
                                    <xsl:value-of select="."/> 
										</xsl:for-each>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <xsl:if test="//impn:DocSign='3'">
                  <table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
                     <tbody>
                        <tr>
                           <td>№ п/п</td>
                           <td>Наименование</td>
                           <td style="width:35mm">Классификационный код товара по ТН ВЭД ЕАЭС</td>
                           <td>Кол-во товаров</td>
                           <td>Статус товара</td>
                           <td>Отправитель (получатель) товара</td>
                           <!--<td>Прочее</td>-->
                        </tr>
                        <tr>
                           <td>1</td>
                           <td>2</td>
                           <td>3</td>
                           <td>4</td>
                           <td>5</td>
                           <td>6</td>
                           <!--<td>7</td>-->
                        </tr>
                        <xsl:for-each select="impn:GoodsInfo">
                           <xsl:variable name="pos" select="position()"/>
                           <tr>
                              <td>
                                 <xsl:number value="position()"/>
                              </td>
                              <td>
                                 <xsl:for-each select="impn:GoodsDescription">
                                    <xsl:value-of select="."/> 
										</xsl:for-each>
                              </td>
                              <td>
											 <xsl:value-of select="impn:GoodsTNVEDCode"/>
                              </td>
                              <td>
											Количество грузовых мест <xsl:value-of select="impn:PackagesQuantity"/> 
											упаковка: <xsl:value-of select="impn:PackagingKind"/>, 
											<xsl:value-of select="impn:SupplementaryQuantity/cat_ru:GoodsQuantity"/> <xsl:value-of select="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
                                 <xsl:if test="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"> (<xsl:value-of select="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
                              </td>
                              <td>
                                 <xsl:value-of select="impn:GoodsStatus"/>/<xsl:value-of select="impn:CustomsModeCode"/>
                              </td>
                              <td>
											 <xsl:apply-templates select="impn:ConsignParticipant"/>
                              </td>
                              <!--<td>
											<xsl:for-each select="impn:Note">
												<xsl:value-of select="."/>&#160;
										</xsl:for-each>
										</td>-->
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
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
   <xsl:template match="impn:ConsignParticipant">
      <!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
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
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span> ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span> УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span> Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span> БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span> ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span> ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <span class="header"> Адрес:</span>
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
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <span class="header"> Документ удостоверяющий личность:</span>
      <br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
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
