<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gooid="urn:customs.ru:Information:CustomsDocuments:OEZ_GoodsIdentify:5.12.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="gooid:OEZ_GoodsIdentify">
	   <xsl:variable name="docSign">
		   <xsl:if test="gooid:DocSign = '0'">Уведомление инспектора</xsl:if>
		   <xsl:if test="gooid:DocSign = '1'">Заявление декларанта</xsl:if>
		   <xsl:if test="gooid:DocSign = '2'">Заявление об идентификации иностранных товаров, помещаемых под процедуру СТЗ, в готовой продукции</xsl:if>
	   </xsl:variable>
      <html>
         <head>
            <title><xsl:value-of select="$docSign"/></title>
            <style type="text/css">
					body {
							/*text-align: center;*/
							background: #cccccc;
							}
						div.page {
							width: 297mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .8pt #000000;
							}						
						td {
							font-family:arial;
							
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
					font-weight: normal;
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
                </style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:290mm">
                  <tbody>
					<tr>
						<td align="center" colspan="3" style="width:290mm"><b><xsl:value-of select="$docSign"/></b><br/>
						<br/>
						<br/>
						</td>
					</tr>
					<tr>
						<td valign="bottom" class="bordered" style="width:70mm">
							<xsl:text>№ </xsl:text>
							<xsl:choose>
								<xsl:when test="gooid:DocSign='2'"><xsl:value-of select="gooid:RegistrationNumber/gooid:Number"/></xsl:when>
								<xsl:otherwise><xsl:value-of select="gooid:RegNumber"/></xsl:otherwise>
							</xsl:choose>
							
						</td>
						<td style="width:120mm"/>
						<td valign="bottom" align="center" class="bordered" style="width:100mm">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="gooid:DateDocument"/>
							</xsl:call-template>
						</td>
					</tr>
                    <tr>
						<td class="graphLittle" align="center">
							<xsl:choose>
								<xsl:when test="gooid:DocSign='2'">(регистрационный номер заявления)</xsl:when>
								<xsl:otherwise>(номер документа)</xsl:otherwise>
							</xsl:choose>
							
						</td>
						<td></td>
						<td class="graphLittle" align="center">(дата подачи заявления)<br/><br/></td>
					</tr>
					<tr>
						<td valign="bottom" class="bordered">
							<xsl:text>в </xsl:text>
							<xsl:value-of select="gooid:Customs/cat_ru:OfficeName"/>
						</td>
						<td/>
						<td valign="bottom" class="bordered">
						<xsl:text>от </xsl:text>
						<xsl:value-of select="gooid:OEZ_Resident/cat_ru:OrganizationName"/> 
						<xsl:if test="gooid:OEZ_Resident/cat_ru:Address">
							<xsl:text> </xsl:text>
							<xsl:for-each select="gooid:OEZ_Resident/cat_ru:Address/*">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
							</xsl:for-each> 
						</xsl:if>
						<xsl:if test="gooid:OEZ_Resident/cat_ru:RFOrganizationFeatures">
							<xsl:text> </xsl:text>
							<xsl:for-each select="gooid:OEZ_Resident/cat_ru:RFOrganizationFeatures/*">
								<xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif">
							<xsl:text> </xsl:text>
							<xsl:value-of select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentNumber"/>
							<xsl:text> </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="gooid:OEZ_Resident/gooid:FactAddress">
							<xsl:text> </xsl:text>
							<xsl:for-each select="gooid:OEZ_Resident/gooid:FactAddress/*">
								<xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="gooid:OEZ_Resident/gooid:IdentityCard">
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="gooid:OEZ_Resident/cat_ru:IdentityCard"/>
						</xsl:if>
					</td>
					</tr>
                    <tr>
						<td class="graphLittle" align="center">(наименование таможенного органа)</td>
						<td></td>
						<td class="graphLittle" align="center">(заявитель)</td>
					</tr>
                  </tbody>
               </table>
               <br/>
               <br/>
               <table style="width:210mm">
                  <tbody>
                     <tr>
                        <td align="left">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>Прошу Вас выдать заключение о возможности идентификации иностранных товаров, помещаемых (помещенных) под таможенную процедуру свободной таможенной зоны, в готовой продукции. Сообщаю следующие сведения:
							<br/>
							<br/>
							<xsl:text>1) готовая продукция:</xsl:text>
						</td>
                     </tr>
                     <tr>
                        <td>
                           <table border="1" cellpadding="0" cellspacing="0" style="width:290mm">
								<tbody>
									<tr>
										<td align="center" colspan="4">Сведения о товарах</td>
										<td align="center" colspan="3">Основаняи владения, пользования и (или) распоряжения готовой продукцией</td>
									</tr>
									<tr>
										<td align="center">Наименование товара</td>
										<td align="center">Код товара по ТН ВЭД ЕАЭС</td>
										<td align="center">Идентификационные признаки товара</td>
										<td align="center">количество товара /<br/>единицы измерения<br/>(основная и дополнительная)</td>
										<td align="center">Наименование лица</td>
										<td align="center">Наименование документа</td>
										<td align="center">Реквизиты документа</td>
									</tr>
									<tr>
										<td align="center">1</td>
										<td align="center">2</td>
										<td align="center">3</td>
										<td align="center">4</td>
										<td align="center">5</td>
										<td align="center">6</td>
										<td align="center">7</td>
									</tr>
									<xsl:for-each select="gooid:GoodsOut">
										<tr valign="top">
											<td>
												<xsl:for-each select="gooid:GoodsDescription"><xsl:value-of select="."/></xsl:for-each>
											</td>
											<td>
												<xsl:choose>
													<xsl:when test="gooid:DocSign='2'"><xsl:value-of select="gooid:GoodsTNVEDCode"/></xsl:when>
													<xsl:otherwise><xsl:value-of select="substring(gooid:GoodsTNVEDCode,1,6)"/></xsl:otherwise>
												</xsl:choose>
											</td>
											<td>
												<xsl:for-each select="gooid:GoodsGroupInformation">
													<xsl:for-each select="*">
														<xsl:choose>
															<xsl:when test="contains(local-name(.),'Date')">
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="."/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:apply-templates select="."/>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
													</xsl:for-each>
													<xsl:if test="position()!=last()"><br/></xsl:if>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="gooid:GoodsQuantity">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()"><br/></xsl:if>
												</xsl:for-each>
											</td>
											<td>
												<xsl:value-of select="gooid:Owner/cat_ru:OrganizationName"/>
											</td>
											<td>
												<xsl:value-of select="gooid:Owner/gooid:TransferOwnershipContract/cat_ru:PrDocumentName"/>
											</td>
											<td>
												<xsl:value-of select="gooid:Owner/gooid:TransferOwnershipContract/cat_ru:PrDocumentNumber"/>
												<xsl:text> </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="gooid:Owner/gooid:TransferOwnershipContract/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
							<br/>
							<xsl:text>2) товары, помещаемые (помещенные) под таможенную процедуру свободной таможенной зоны:</xsl:text>
						</td>
                     </tr>
                     <tr>
                        <td>
							<table border="1" cellpadding="0" cellspacing="0" style="width:290mm">
								<tbody>
									<tr align="center">
										<td colspan="5">Сведения о товарах</td>
										<td colspan="3">Владение, пользование и (или) распоряжение товарами, помещаемыми (помещенными) под таможенную процедуру свободной таможенной зоны, использованными при изготовлении готовой продукции</td>
									</tr>
									<tr align="center" valign="top">
										<td>наименование товара</td>
										<td>код товара</td>
										<td>идентификационные признаки товара</td>
										<td>регистрационный номер ДТ/<br/>порядковый номер(а) товара (регистрационный номер иного документа, подтверждающего статус товара)</td>
										<td>количество товара / единицы измерения (основная и дополнительная) </td>
										<td>наименования лица</td>
										<td>наименование документа</td>
										<td>реквизиты документа</td>
									</tr>
									<tr align="center">
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td>4</td>
										<td>5</td>
										<td>6</td>
										<td>7</td>
										<td>8</td>
									</tr>
									<xsl:for-each select="gooid:GoodsInfo">
										<tr valign="top">
											<td>
												<xsl:apply-templates select="gooid:GoodsDescription"/>
											</td>
											<td>
												<xsl:choose>
													<xsl:when test="gooid:DocSign='2'"><xsl:value-of select="gooid:GoodsTNVEDCode"/></xsl:when>
													<xsl:otherwise><xsl:value-of select="substring(gooid:GoodsTNVEDCode,1,6)"/></xsl:otherwise>
												</xsl:choose>
											</td>
											<td>
												<xsl:for-each select="gooid:GoodsGroupInformation">
													<xsl:for-each select="*">
														<xsl:choose>
															<xsl:when test="contains(local-name(.),'Date')">
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="."/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:apply-templates select="."/>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
													</xsl:for-each>
													<xsl:if test="position()!=last()"><br/></xsl:if>
												</xsl:for-each>
											</td>
											<td>
												<xsl:apply-templates select="gooid:NumberDT"/>
												<xsl:if test="gooid:GoodsNumeric">
													<xsl:text> / </xsl:text>
													<xsl:value-of select="gooid:GoodsNumeric"/>
												</xsl:if>
												<xsl:if test="gooid:StatusDoc">
													<br/>
													<xsl:text>(</xsl:text>
													<xsl:for-each select="gooid:StatusDoc">
														<xsl:for-each select="*">
															<xsl:choose>
																<xsl:when test="contains(local-name(.),'Date')">
																	<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="."/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:value-of select="."/>
																</xsl:otherwise>
															</xsl:choose>
															<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
														</xsl:for-each>
														<xsl:if test="position()!=last()">, </xsl:if>
													</xsl:for-each>
													<xsl:text>)</xsl:text>
												</xsl:if>
											</td>
											<td>
												<xsl:for-each select="gooid:GoodsQuantity">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()"><br/></xsl:if>
												</xsl:for-each>
											</td>
											<td>
												<xsl:value-of select="gooid:Owner/cat_ru:OrganizationName"/>
											</td>
											<td>
												<xsl:value-of select="gooid:Owner/gooid:TransferOwnershipContract/cat_ru:PrDocumentName"/>
											</td>
											<td>
												<xsl:value-of select="gooid:Owner/gooid:TransferOwnershipContract/cat_ru:PrDocumentNumber"/>
												<xsl:text> </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="gooid:Owner/gooid:TransferOwnershipContract/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
							<br/>
							<xsl:text>3) лицо(а), которое(ые) непосредственно совершало(ли) или будет(ут) совершать операции в отношении иностранных товаров, помещаемых (помещенных) под таможенную процедуру СТЗ, в соответствии с производственным(и) процессом(ами) по изготовлению готовой продукции:</xsl:text>
						</td>
                     </tr>
                     <tr>
                        <td>
							<table border="1" cellpadding="0" cellspacing="0" style="width:290mm">
								<tbody>
									<tr align="center">
										<td>Наименование лица</td>
										<td>Наименование документа</td>
										<td>Реквизиты документа</td>
										<td>Операция(ии)</td>
									</tr>
									<tr align="center">
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td>4</td>
									</tr>
									<xsl:for-each select="gooid:Manufacturer">
										<tr valign="top">
											<td>
												<xsl:value-of select="cat_ru:OrganizationName"/>
												<xsl:if test="cat_ru:RFOrganizationFeatures">
													<xsl:text> </xsl:text>
													<xsl:for-each select="cat_ru:RFOrganizationFeatures/*">
														<xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
													</xsl:for-each>
												</xsl:if>
												<xsl:for-each select="cat_ru:Address|gooid:FactAddress">
													<xsl:text> </xsl:text>
													<xsl:call-template name="Address"/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="gooid:ManufacturerContract">
													<xsl:value-of select="cat_ru:PrDocumentName"/>
													<xsl:if test="position()!=last()"><br/></xsl:if>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="gooid:ManufacturerContract">
													<xsl:value-of select="cat_ru:PrDocumentNumber"/>
													<xsl:if test="cat_ru:PrDocumentDate">
														<xsl:text> </xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="position()!=last()"><br/></xsl:if>
												</xsl:for-each>
											</td>
											<td>
												<xsl:apply-templates select="gooid:Operation"/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
							<br/>
							<xsl:text>4) операции, совершаемые в отношении иностранных товаров, помещаемых (помещенных) под таможенную процедуру СТЗ, при изготовлении готовой продукции:</xsl:text>
						</td>
                     </tr>
                     <tr>
                        <td>
                           <table border="1" cellpadding="0" cellspacing="0" style="width:210mm">
                              <tbody>
                                 <xsl:for-each select="gooid:Activity">
                                    <tr>
                                       <td>
                                          <xsl:value-of select="."/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
							<br/>
							<xsl:text>5) способ(ы) идентификации:</xsl:text>
						</td>
                     </tr>
                     <tr>
                        <td>
                           <table border="1" cellpadding="0" cellspacing="0" style="width:210mm">
                              <tbody>
                                 <xsl:for-each select="gooid:MethodIdentify">
                                    <tr>
                                       <td>
                                          <xsl:value-of select="."/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
							<br/>
							<xsl:text>6) иные сведения, которые заявитель сочтет необходимым указать:</xsl:text>
						</td>
                     </tr>
                     <tr>
                        <td>
                           <table border="1" cellpadding="0" cellspacing="0" style="width:210mm">
                              <tbody>
                                 <xsl:for-each select="gooid:OtherInfo">
                                    <tr>
                                       <td>
                                          <xsl:value-of select="."/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
							<br/>
							<xsl:text>7) опись документов, прилагаемых к заявлению:</xsl:text>
						</td>
                     </tr>
                     <tr>
                        <td>
                           <table border="1" cellpadding="0" cellspacing="0" style="width:210mm">
                              <tbody>
                                    <tr>
                                       <td>
										   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table style="width:210mm">
                  <tbody>
                     <tr>
                        <td class="bordered" style="width:100mm">
                              <xsl:value-of select="gooid:OEZ_Resident/cat_ru:OrganizationName"/>
                        </td>
                        <td style="width:40mm"/>
                        <td class="bordered" style="width:60mm">
                        </td>
                     </tr>
                     <tr align="center">
                        <td class="graphLittle" style="width:100mm">
                              Ф.И.О. уполномоченного лица заявителя
                        </td>
                        <td style="width:40mm"/>
                        <td class="graphLittle" style="width:60mm">
							Подпись
                        </td>
                     </tr>
                     <tr>
                        <td class="bordered" style="width:100mm">
                              <xsl:value-of select="gooid:OEZ_Resident/cat_ru:OrganizationName"/>
                              <br/>
                            <xsl:if test="gooid:OEZ_Resident/cat_ru:Address">
							<xsl:text> </xsl:text>
							<xsl:for-each select="gooid:OEZ_Resident/cat_ru:Address/*">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
							</xsl:for-each> 
							</xsl:if>
							<xsl:if test="gooid:OEZ_Resident/cat_ru:RFOrganizationFeatures">
								<xsl:text> </xsl:text>
								<xsl:for-each select="gooid:OEZ_Resident/cat_ru:RFOrganizationFeatures/*">
									<xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif">
								<xsl:text> </xsl:text>
								<xsl:value-of select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentNumber"/>
								<xsl:text> </xsl:text>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentDate"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="gooid:OEZ_Resident/gooid:FactAddress">
								<xsl:text> </xsl:text>
								<xsl:for-each select="gooid:OEZ_Resident/gooid:FactAddress/*">
									<xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="gooid:OEZ_Resident/gooid:IdentityCard">
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="gooid:OEZ_Resident/cat_ru:IdentityCard"/>
							</xsl:if>
                        </td>
                        <td style="width:40mm"/>
                        <td class="bordered" style="width:60mm">
                        </td>
                     </tr>
                     <tr align="center">
                        <td class="graphLittle" style="width:100mm">
                              Ф.И.О. лица, действующего по поручению заявителя и от его имени, и реквизиты документа, подтверждающего полномочия такого лица
                        </td>
                        <td style="width:40mm"/>
                        <td class="graphLittle" style="width:60mm">
							Подпись
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
	<xsl:template match="gooid:NumberDT">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn2" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="catESAD_cu:GoodsGroupQuantity|gooid:GoodsQuantity">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cat_ru:IdentityCard">
		<xsl:for-each select="*">
		   <xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
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
</xsl:stylesheet>
