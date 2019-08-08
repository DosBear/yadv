<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mpod="urn:customs.ru:Information:CustomsDocuments:MPO_Declaration:5.13.1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="mpod:MPO_Declaration">
      <html>
         <head>
            <title>Лицевая сторона бланка таможенной декларации CN 23</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					/*padding-left: 20mm;*/
					background: #ffffff;
					border: solid 0pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 8pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <font face="Times new roman" size="5">
                           <b>
                              <i>Лицевая сторона бланка таможенной декларации CN 23</i>
                           </b>
                        </font>
                     </td>
                  </tr>
               </table>
               <table border="2" height="150mm" style="border-color: black" width="210mm">
                  <span class="graph">
                     <!--<table>-->
                     <tr>
                        <td/>
                        <td colspan="5" style="border-left-color: #ffffff" valign="bottom">
                           <span class="graph">(Назначенный оператор) <xsl:value-of select="mpod:DesignatedOperator"/>
                           </span>
                        </td>
                        <td align="left" colspan="3" style="border-left-color: #ffffff">
                           <span class="graph">
                              <b>ТАМОЖЕННАЯ ДЕКЛАРАЦИЯ</b>
                           </span>
                        </td>
                        <td style="border-left-color: #ffffff">
                           <span class="graph">
                              <b>
                              CN23
                              <br/>
                              <xsl:choose>
									<xsl:when test="mpod:DocSign='0'">Основная</xsl:when>
									<xsl:when test="mpod:DocSign='1'">Предварительная</xsl:when>
									<xsl:when test="mpod:DocSign='3'">Возвращамое МПО</xsl:when>
									<xsl:otherwise><xsl:value-of select="mpod:DocSign"/></xsl:otherwise>
								</xsl:choose>
                              </b>
                           </span>
                        </td>
                        <td rowspan="8" style="border-left-color: #ffffff"/>
                        <!--<td colspan="11">
			            <table cellspacing="6">
								<tr>
								    <td style="border:solid 0pt" colspan="3" ></td>
								    <td style="border:solid 0pt" valign="bottom">
								    <span class="graph" colspan="7">(Назначенный оператор)</span></td>
									<td style="border:solid 0pt" align="left"><span class="graph">
									<b>ТАМОЖЕННАЯ ДЕКЛАРАЦИЯ</b></span></td>
									<td style="border:solid 0pt"><span class="graph"><b>CN23</b></span></td>
								</tr>
						</table>			
			            </td>-->
                     </tr>
                     <tr>
                        <td rowspan="2" style="padding:5pt" width="10%">
                           <span class="graph">Из</span>
                        </td>
                        <td colspan="3" style="padding:0pt 5pt">
                           <span class="graph">Фамилия<br/>
                              <xsl:if test="mpod:Consignor/mpod:Person">
                                 <xsl:value-of select="mpod:Consignor/mpod:Person"/>
                              </xsl:if>
                              <xsl:if test="mpod:Consignor/mpod:Person and mpod:ConsignorRUS/mpod:Person"> / </xsl:if>
                              <xsl:value-of select="mpod:ConsignorRUS/mpod:Person"/>
                           </span>
                        </td>
                        <td colspan="2" rowspan="2" style="padding:0pt 5pt">
                           <span class="graph">
						Таможенная ссылка отправителя (если имеется)<br/>
                           </span>
                        </td>
                        <td colspan="4" rowspan="7" style="border-top-color: #ffffff;">
                           <table cellspacing="6">
                              <tr>
                                 <td style="border:solid 0pt">
                                    <span class="graph">№ отправления (штриховой код, если он имеется)<br/>
                                       <xsl:if test="mpod:MPO_Number">
                                          <xsl:value-of select="mpod:MPO_Number"/>
                                       </xsl:if>
                                    </span>
                                 </td>
                                 <td style="border:solid 0pt">
                                    <span class="graph">Может быть вскрыто в служебном порядке<br/>
                                    </span>
                                 </td>
                                 <td style="border:solid 0pt">
                                    <span class="graph">
                                       <b>Внимание!</b>
                                       <br/>Инструкции на обратной  
							стороне<br/>
                                    </span>
                                 </td>
                              </tr>
                              <tr>
									<td colspan="3" style="border:0pt solid;">
										<span class="graph">
										</span>
									</td>
								</tr>
								<xsl:if test="mpod:MPO_Registration">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<span class="graph">
												<xsl:text>№ исходного МПО: </xsl:text>
												<xsl:apply-templates select="mpod:MPO_Registration"/>
											</span>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td colspan="3" style="border:0pt solid;">
										<span class="graph"><xsl:text>Получатель/отправитель: </xsl:text>
											<xsl:choose>
												<xsl:when test="mpod:individual_flag='0' or mpod:individual_flag='false' or mpod:individual_flag='f'">юридическое лицо</xsl:when>
												<xsl:when test="mpod:individual_flag='1' or mpod:individual_flag='true' or mpod:individual_flag='t'">физическое лицо</xsl:when>
												<xsl:otherwise><xsl:value-of select="mpod:individual_flag"/></xsl:otherwise>
											</xsl:choose>
										</span>
									</td>
								</tr>
								<xsl:if test="mpod:MPOFactWeight">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<xsl:variable name="factW" select="mpod:MPOFactWeight"/>
											<xsl:variable name="grossW">
												<xsl:choose>
													<xsl:when test="mpod:TotalGrossWeight"><xsl:value-of select="mpod:TotalGrossWeight"/></xsl:when>
													<xsl:otherwise><xsl:value-of select="0"/></xsl:otherwise>
												</xsl:choose>
											</xsl:variable>
											<span class="graph">
												<xsl:text>Разница в весе: </xsl:text>
												<!--xsl:value-of select="format-number(mpod:MPOFactWeight - mpod:TotalGrossWeight, '0.##')"/-->
												<xsl:value-of select="format-number($factW - $grossW, '0.##')"/>
												<xsl:text> кг</xsl:text>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="mpod:Information/mpod:PackingState">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<span class="graph">
												<xsl:text>Сведения о целостности: </xsl:text>
												<xsl:choose>
													<xsl:when test="mpod:Information/mpod:PackingState/mpod:Value='0' or mpod:Information/mpod:PackingState/mpod:Value='false' or mpod:Information/mpod:PackingState/mpod:Value='f'">Нарушена</xsl:when>
													<xsl:when test="mpod:Information/mpod:PackingState/mpod:Value='1' or mpod:Information/mpod:PackingState/mpod:Value='true' or mpod:Information/mpod:PackingState/mpod:Value='t'">Целостна</xsl:when>
													<xsl:otherwise><xsl:value-of select="mpod:Information/mpod:PackingState/mpod:Value"/></xsl:otherwise>
												</xsl:choose>
												<xsl:if test="mpod:Information/mpod:PackingState/mpod:Remark">
													<xsl:text>, </xsl:text>
													<xsl:value-of select="mpod:Information/mpod:PackingState/mpod:Remark"/>
												</xsl:if>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="mpod:ConsignmentCategory">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<span class="graph">
												<xsl:text>Категория отправления: </xsl:text>
												<xsl:for-each select="mpod:ConsignmentCategory/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="mpod:MPOKind">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<span class="graph">
												<xsl:text>Вид отправления: </xsl:text>
												<xsl:for-each select="mpod:MPOKind/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="mpod:CustomsProcedure">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<span class="graph">
												<xsl:text>Направление перемещения: </xsl:text>
												<xsl:choose>
													<xsl:when test="mpod:CustomsProcedure='ИМ'">ввоз МПО</xsl:when>
													<xsl:when test="mpod:CustomsProcedure='ЭК'">вывоз МПО</xsl:when>
												</xsl:choose>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="mpod:CustomsCode">
									<tr>
										<td colspan="3" style="border:0pt solid;">
											<span class="graph">
												<xsl:text>Предполагаемый код таможенного органа оформления: </xsl:text>
												<xsl:value-of select="mpod:CustomsCode"/>
											</span>
										</td>
									</tr>
								</xsl:if>
							</table>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="3" style="padding:0pt 5pt">
                           <span class="graph">Компания/Фирма<br/>

                              <xsl:value-of select="mpod:Consignor/cat_ru:OrganizationName"/>
							  <xsl:if test="mpod:Consignor/cat_ru:OrganizationName and mpod:ConsignorRUS/cat_ru:OrganizationName">
								  <xsl:text> / </xsl:text>
							  </xsl:if>
							  <xsl:value-of select="mpod:ConsignorRUS/cat_ru:OrganizationName"/>

                              <xsl:text> </xsl:text>
                              <xsl:call-template name="innkppogrnWithForeign"><xsl:with-param name="base" select="mpod:Consignor"/></xsl:call-template>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td rowspan="3"/>
                        <td colspan="5" style="padding:0pt 5pt">
                           <span class="graph">Улица<br/>
                              <xsl:if test="mpod:Consignor/cat_ru:Address/cat_ru:StreetHouse">
                                 <xsl:value-of select="mpod:Consignor/cat_ru:Address/cat_ru:StreetHouse"/>
                              </xsl:if>
                              <xsl:if test="mpod:Consignor/cat_ru:Address/cat_ru:StreetHouse and mpod:ConsignorRUS/cat_ru:Address/cat_ru:StreetHouse">
								  <xsl:text> / </xsl:text>
                                 <xsl:value-of select="mpod:ConsignorRUS/cat_ru:Address/cat_ru:StreetHouse"/>
                              </xsl:if>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="5">
                           <table cellspacing="6">
                              <tr>
                                 <td style="border:solid 0pt">
                                    <span class="graph">Почтовый индекс<br/>
                                          <xsl:value-of select="mpod:Consignor/cat_ru:Address/cat_ru:PostalCode|mpod:ConsignorRUS/cat_ru:Address/cat_ru:PostalCode"/>
                                    </span>
                                 </td>
                                 <td style="border:solid 0pt">
                                    <span class="graph">Город<br/>
                                       <xsl:if test="mpod:Consignor/cat_ru:Address/cat_ru:City">
                                          <xsl:value-of select="mpod:Consignor/cat_ru:Address/cat_ru:City"/>
                                       </xsl:if>
                                       <xsl:if test="mpod:Consignor/cat_ru:Address/cat_ru:City and mpod:ConsignorRUS/cat_ru:Address/cat_ru:City">
										   <xsl:text> / </xsl:text>
                                          <xsl:value-of select="mpod:ConsignorRUS/cat_ru:Address/cat_ru:City"/>
                                       </xsl:if>
                                    </span>
                                 </td>
                              </tr>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="5" style="padding:0pt 5pt">
                           <span class="graph">Страна<br/>
                              <xsl:if test="mpod:Consignor/cat_ru:Address/cat_ru:CountryCode">
                                 <xsl:value-of select="mpod:Consignor/cat_ru:Address/cat_ru:CountryCode"/> 
							</xsl:if>
                              <xsl:if test="mpod:Consignor/cat_ru:Address/cat_ru:CounryName">
                                 <xsl:value-of select="mpod:Consignor/cat_ru:Address/cat_ru:CounryName"/>
                              </xsl:if>
                            <xsl:if test="mpod:Consignor/cat_ru:Address/cat_ru:CounryName and mpod:ConsignorRUS/cat_ru:Address/cat_ru:CounryName">
								<xsl:text> / </xsl:text>
                            </xsl:if>
                              <xsl:if test="mpod:ConsignorRUS/cat_ru:Address/cat_ru:CounryName">
                                 <xsl:value-of select="mpod:ConsignorRUS/cat_ru:Address/cat_ru:CounryName"/>
                              </xsl:if>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td rowspan="17" style="padding:0pt 5pt">
                           <span class="graph">В</span>
                        </td>
                        <td colspan="5" style="padding:0pt 5pt">
                           <span class="graph">Фамилия<br/>
                                 <xsl:value-of select="mpod:Consignee/mpod:NominativeName"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="5" style="padding:0pt 5pt">
                           <span class="graph">Компания/Фирма<br/>
                              <!--	<xsl:if test="mpod:Consignee/cat_ru:ShortName">-->
                              <xsl:value-of select="mpod:Consignee/cat_ru:OrganizationName"/>
                              <!--</xsl:if>-->
                              <xsl:text> </xsl:text>
                              <xsl:call-template name="innkppogrn"><xsl:with-param name="base" select="mpod:Consignee"/></xsl:call-template>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="5" style="padding:0pt 5pt">
                           <span class="graph">Улица<br/>
                              <xsl:if test="mpod:Consignee/mpod:FullAddress">
                                 <xsl:value-of select="mpod:Consignee/mpod:FullAddress"/>
                              </xsl:if>
                           </span>
                        </td>
                        <td colspan="4" rowspan="3">
                           <table cellspacing="6">
                              <tr>
                                 <td style="border:solid 0pt">
                                    <span class="graph">Реквизиты импортера (если имеются) (ИНН/№НДС/индекс импортера) (факультативно)<br/>
                                       <xsl:apply-templates select="mpod:Importer/cat_ru:RFOrganizationFeatures/cat_ru:INN | mpod:Importer/cat_ru:RFOrganizationFeatures/cat_ru:KPP | mpod:Importer/mpod:ImporterIndex | mpod:Importer/mpod:VAT_Number"/>
                                       <!--<xsl:call-template name="Importer"/>-->
                                       <!--<xsl:variable name="c" select="mpod:Importer"/>
							<xsl:if test="$c/cat_ru:RFOrganizationFeatures/cat_ru:INN">
							<xsl:value-of select="$c/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>/-->
                                       <!--<xsl:if test="not(position()=last())">, </xsl:if>-->
                                       <!--</xsl:if>
							<xsl:if test="$c/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
							<xsl:value-of select="$c/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>/
							</xsl:if>
							<xsl:if test="$c/mpod:ImporterIndex">
							<xsl:value-of select="$c/mpod:ImporterIndex"/>/
							</xsl:if>
							<xsl:if test="$c/mpod:VAT_Number">
							<xsl:value-of select="$c/mpod:VAT_Number"/>
							</xsl:if>-->
                                       <!--<xsl:if test="position()=last()">.</xsl:if>
							<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>-->
                                    </span>
                                 </td>
                              </tr>
                              <tr>
                                 <td style="border:solid 0pt">
                                    <span class="graph">№ телефона/факса/e-mail импортера (если известен)
							<br/>
                                       <xsl:apply-templates select="mpod:Importer/cat_ru:Contact/cat_ru:Phone | mpod:Importer/cat_ru:Contact/cat_ru:Fax | mpod:Importer/cat_ru:Contact/cat_ru:E_mail"/>
                                       <!--<xsl:variable name="c" select="mpod:Importer"/>
							<xsl:if test="$c/cat_ru:Phone">
							<xsl:value-of select="$c/cat_ru:Phone"/>/
							</xsl:if>
							<xsl:if test="$c/cat_ru:Fax">
							<xsl:value-of select="$c/cat_ru:Fax"/>/
							</xsl:if>
							<xsl:if test="$c/mpod:E_mail">
							<xsl:value-of select="$c/mpod:E_mail"/>
							</xsl:if>-->
                                    </span>
                                 </td>
                              </tr>
                           </table>
                        </td>
                        <td rowspan="12" style="border-top:1px solid #ffffff;" width="20%"/>
                     </tr>
                     <tr>
                        <td colspan="5">
                           <table cellspacing="6">
                              <tr>
                                 <td style="border:solid 0pt">
                                    <span class="graph">Почтовый индекс<br/>
                                       <xsl:if test="mpod:Consignee/cat_ru:Address/cat_ru:PostalCode">
                                          <xsl:value-of select="mpod:Consignee/cat_ru:Address/cat_ru:PostalCode"/>
                                       </xsl:if>
                                    </span>
                                 </td>
                                 <td style="border:solid 0pt">
                                    <span class="graph">Город<br/>
                                       <xsl:if test="mpod:Consignee/cat_ru:Address/cat_ru:City">
                                          <xsl:value-of select="mpod:Consignee/cat_ru:Address/cat_ru:City"/>
                                       </xsl:if>
                                    </span>
                                 </td>
                              </tr>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="5" style="padding:0pt 5pt">
                           <span class="graph">Страна<br/>
                              <xsl:if test="mpod:Consignee/cat_ru:Address/cat_ru:CountryCode">
                                 <xsl:value-of select="mpod:Consignee/cat_ru:Address/cat_ru:CountryCode"/> 
							</xsl:if>
                              <xsl:if test="mpod:Consignee/cat_ru:Address/cat_ru:CounryName">
                                 <xsl:value-of select="mpod:Consignee/cat_ru:Address/cat_ru:CounryName"/>
                              </xsl:if>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" rowspan="2" style="padding:0pt 5pt" width="20%">
                           <span class="graph">Подробное описание вложения</span>
                        </td>
                        <td rowspan="2" style="padding:0pt 5pt" width="15%">
                           <span class="graph">Количество</span>
                        </td>
                        <td colspan="3" rowspan="2" style="padding:0pt 5pt" width="10%">
                           <span class="graph">Вес нетто (в кг)</span>
                        </td>
                        <td rowspan="2" style="padding:0pt 5pt" width="10%">
                           <span class="graph">Стоимость</span>
                        </td>
                        <td colspan="2" style="padding:0pt 5pt">
                           <span class="graph">Только для коммерческих отправлений</span>
                        </td>
                     </tr>
                     <tr>
                        <td style="padding:0pt 5pt" width="15%">
                           <span class="graph">Код ТН ВЭД ЕАЭС</span>
                        </td>
                        <td style="padding:0pt 5pt" width="15%">
                           <span class="graph">Страна происхождения товаров</span>
                        </td>
                     </tr>
                     <xsl:for-each select="mpod:Goods">
                        <tr>
                           <td colspan="2" style="padding:0pt 5pt">
                              <span class="graph">
                                 <xsl:for-each select="mpod:GoodDescription">
                                    <xsl:value-of select="."/> </xsl:for-each>
                                <xsl:if test="mpod:GoodDescriptionForeign">
									<xsl:text> / </xsl:text>
                                </xsl:if>
                                <xsl:for-each select="mpod:GoodDescriptionForeign">
									<xsl:value-of select="."/>
                                </xsl:for-each>
                                <xsl:if test="mpod:TradeMark">
									<xsl:text> (</xsl:text>
									<xsl:value-of select="mpod:TradeMark"/>
									<xsl:text>)</xsl:text>
                                </xsl:if>
                              </span>
                           </td>
                           <td style="padding:0pt 5pt">
                              <span class="graph">
                                 <xsl:if test="mpod:GoodsQuantity/cat_ru:GoodsQuantity">
                                    <xsl:value-of select="mpod:GoodsQuantity/cat_ru:GoodsQuantity"/> </xsl:if>
                                 <xsl:if test="mpod:GoodsQuantity/cat_ru:MeasureUnitQualifierName">
                                    <xsl:value-of select="mpod:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
                                 </xsl:if>
                              </span>
                           </td>
                           <td colspan="3" style="padding:0pt 5pt">
                              <span class="graph">
                                 <xsl:value-of select="mpod:NetWeight"/>
                              </span>
                           </td>
                           <td style="padding:0pt 5pt">
                              <span class="graph">
                                 <xsl:value-of select="mpod:Cost"/> 
						<xsl:if test="mpod:CurrencyCode">(<xsl:value-of select="mpod:CurrencyCode"/>)</xsl:if>
                              </span>
                           </td>
                           <td style="padding:0pt 5pt">
                              <span class="graph">
                                 <xsl:if test="mpod:TNVEDCode">
                                    <xsl:value-of select="mpod:TNVEDCode"/>
                                 </xsl:if>
                              </span>
                           </td>
                           <td style="padding:0pt 5pt">
                              <span class="graph">
                                 <xsl:if test="mpod:OriginCountryCode">
                                    <xsl:value-of select="mpod:OriginCountryCode"/>
                                 </xsl:if>
                              </span>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td colspan="2"/>
                        <td/>
                        <td colspan="3" style="padding:0pt 5pt">
                           <span class="graph">Общий вес брутто<br/>
                              <xsl:value-of select="mpod:TotalGrossWeight"/>
                           </span>
                           <xsl:if test="mpod:MPOFactWeight">
							   <br/>
							   <span class="graph">Фактический вес<br/>
								   <xsl:value-of select="mpod:MPOFactWeight"/>
							   </span>
                           </xsl:if>
                        </td>
                        <td style="padding:0pt 5pt">
                           <span class="graph">Общая стоимость<br/>
                              <xsl:value-of select="mpod:TotalCost"/>
                              <xsl:if test="mpod:CurrencyCode">(<xsl:value-of select="mpod:CurrencyCode"/>)</xsl:if>
                           </span>
                        </td>
                        <td colspan="2" style="padding:0pt 5pt">
                           <span class="graph">Почтовые сборы/Расходы<br/>
                              <xsl:if test="mpod:PostalFees">
                                 <xsl:for-each select="mpod:PostalFees">
                                    <xsl:value-of select="."/>
                                    <br/>
                                 </xsl:for-each>
                              </xsl:if>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="7">
                           <table cellspacing="6">
                              <tr>
                                 <td style="border:solid 0pt"/>
                                 <td style="border:solid 0pt">
                                    <span class="graph">Категория отправления</span>
                                 </td>
                                 <td align="center" style="border:solid 0.8pt; width:5mm">
                                    <span class="graph">
                                       <xsl:if test="mpod:ConsignmentCategory=32">x</xsl:if>
                                       <xsl:if test="mpod:ConsignmentCategory">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:if>
                                       <!--<xsl:choose>
									<xsl:when test="(number(mpod:ConsignmentCategory)=32) or (mpod:ConsignmentCategory='true') or (mpod:ConsignmentCategory='t')">х</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
									</xsl:choose>-->
                                    </span>
                                 </td>
                                 <td align="left" style="border:solid 0pt">
                                    <span class="graph">Коммерческий образец</span>
                                 </td>
                                 <td rowspan="3" style="border:solid 0pt">
                                    <span class="graph">Пояснение:
									<xsl:if test="mpod:Explication">
                                          <xsl:value-of select="mpod:Explication"/>
                                       </xsl:if>
                                    </span>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="center" style="border:solid 0.8pt; width:5mm">
                                    <span class="graph">
                                       <xsl:if test="mpod:ConsignmentCategory=31">x</xsl:if>
                                       <xsl:if test="mpod:ConsignmentCategory">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:if>
                                       <!--<xsl:choose>
									<xsl:when test="(number(mpod:ConsignmentCategory)=31) or (mpod:ConsignmentCategory='f') or (mpod:ConsignmentCategory='false')">х</xsl:when>
									<xsl:otherwise>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
									</xsl:choose>-->
                                    </span>
                                 </td>
                                 <td align="left" style="border:solid 0pt">
                                    <span class="graph">Подарок</span>
                                 </td>
                                 <td align="center" style="border:solid 0.8pt; width:5mm">
                                    <span class="graph">
                                       <xsl:if test="mpod:ConsignmentCategory=21">x</xsl:if>
                                       <xsl:if test="mpod:ConsignmentCategory">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:if>
                                       <!--<xsl:choose>
									<xsl:when test="(number(mpod:ConsignmentCategory)=21) or (mpod:ConsignmentCategory='f') or (mpod:ConsignmentCategory='false')">х</xsl:when>
									<xsl:otherwise>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
									</xsl:choose>-->
                                    </span>
                                 </td>
                                 <td align="left" style="border:solid 0pt">
                                    <span class="graph">Возврат товара</span>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="center" style="border:solid 0.8pt; width:5mm">
                                    <span class="graph">
                                       <xsl:if test="mpod:ConsignmentCategory=91">x</xsl:if>
                                       <xsl:if test="mpod:ConsignmentCategory">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:if>
                                       <!--<xsl:choose>
									<xsl:when test="(number(mpod:ConsignmentCategory)=91) or (mpod:ConsignmentCategory='f') or (mpod:ConsignmentCategory='false')">х</xsl:when>
									<xsl:otherwise>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
									</xsl:choose>-->
                                    </span>
                                 </td>
                                 <td align="left" style="border:solid 0pt">
                                    <span class="graph">Документ</span>
                                 </td>
                                 <td align="center" style="border:solid 0.8pt; width:5mm">
                                    <span class="graph">
                                       <xsl:if test="mpod:ConsignmentCategory=999">x</xsl:if>
                                       <xsl:if test="mpod:ConsignmentCategory">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:if>
                                       <!--<xsl:choose>
									<xsl:when test="(number(mpod:ConsignmentCategory)=999) or (mpod:ConsignmentCategory='f') or (mpod:ConsignmentCategory='false')">х</xsl:when>
									<xsl:otherwise>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
									</xsl:choose>-->
                                    </span>
                                 </td>
                                 <td align="left" style="border:solid 0pt">
                                    <span class="graph">Прочее</span>
                                 </td>
                              </tr>
                           </table>
                        </td>
                        <td colspan="2" rowspan="2" style="padding:0pt 5pt">
                           <span class="graph">Учреждение подачи/Дата подачи
						<br/>
                              <xsl:if test="mpod:FeedBillAgency">
                                 <xsl:value-of select="mpod:FeedBillAgency"/>/</xsl:if>
                              <xsl:if test="mpod:FeedBillDate">
                                 <xsl:call-template name="date">
                                    <xsl:with-param name="dateIn" select="mpod:FeedBillDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="7" rowspan="2" style="padding:0pt 5pt">
                           <span class="graph">
						Примечания: (напр., товар, подлежащий карантину/санитарному, фитосанитарному контролю или подпадающий под другие ограничения)<br/>
                              <xsl:if test="mpod:Comment">
                                 <xsl:value-of select="mpod:Comment"/>
                              </xsl:if>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" rowspan="2" style="padding:0pt 5pt">
                           <span class="gra">Я подтверждаю, что указанные в настоящей таможенной декларации сведения являются достоверными, и что в этом отправлении не содержится никаких опасных предметов или запрещенных законодательством или почтовой или таможенной регламентацией предметов<br/>
                           </span>
                           <span class="graph">Дата и подпись отправителя<br/>
                              <xsl:call-template name="date">
                                 <xsl:with-param name="dateIn" select="mpod:Consignor/mpod:IssueDate"/>
                              </xsl:call-template> <xsl:value-of select="mpod:Consignor/cat_ru:OrganizationName"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td width="22%">
                           <table cellspacing="5">
                              <tr>
                                 <td align="center" style="border:solid 0.8pt; width:5mm">
                                    <span class="graph">
                                       <xsl:choose>
                                          <xsl:when test="mpod:DocumentInfo/mpod:DocumentCode='LIC'">x</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                       <!--  <xsl:if test="mpod:DocumentInfo/mpod:DocumentCode='LIC'">x</xsl:if>
									<xsl:if test="mpod:DocumentInfo/mpod:DocumentCode">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>-->
                                    </span>
                                    <!--<xsl:choose>
									<xsl:when test="(mpod:DocumentInfo/mpod:DocumentCode=LIC) or (mpod:DocumentInfo/mpod:DocumentCode='true') or (mpod:DocumentInfo/mpod:DocumentCode='t')">х</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
									</xsl:choose>-->
                                 </td>
                                 <td rowspan="2" style="border:solid 0pt">
                                    <span class="graph">Лицензия/№лицензии(-ий)</span>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="2" style="border:solid 0pt">
                                    <span class="graph">
                                       <xsl:if test="mpod:DocumentInfo/mpod:DocumentCode='LIC'">
                                          <xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='LIC']/cat_ru:PrDocumentName">
                                             <xsl:value-of select="mpod:DocumentInfo[mpod:DocumentCode='LIC']/cat_ru:PrDocumentName"/>/
										</xsl:if>
                                          <xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='LIC']/cat_ru:PrDocumentNumber">№
										<xsl:value-of select="mpod:DocumentInfo[mpod:DocumentCode='LIC']/cat_ru:PrDocumentNumber"/>/
										</xsl:if>
                                          <xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='LIC']/cat_ru:PrDocumentDate">
                                             <xsl:call-template name="date">
                                                <xsl:with-param name="dateIn" select="mpod:DocumentInfo[mpod:DocumentCode='LIC']/cat_ru:PrDocumentDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                       </xsl:if> </span>
                                 </td>
                              </tr>
                           </table>
                        </td>
                        <td colspan="3">
                           <table cellspacing="5">
                              <tr>
                                 <td align="center" style="border:solid 0.8pt; width:5mm">
                                    <span class="graph">
                                       <xsl:choose>
                                          <xsl:when test="mpod:DocumentInfo/mpod:DocumentCode='CRT'">x</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                       <!-- <xsl:if test="mpod:DocumentInfo/mpod:DocumentCode='CRT'">x</xsl:if>
									<xsl:if test="mpod:DocumentInfo/mpod:DocumentCode">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>-->
                                    </span>
                                    <!--<xsl:choose>
									<xsl:when test="(mpod:DocumentInfo/mpod:DocumentCode=CRT) or (mpod:DocumentInfo/mpod:DocumentCode='true') or (mpod:DocumentInfo/mpod:DocumentCode='t')">х</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
									</xsl:choose>-->
                                 </td>
                                 <td rowspan="2" style="border:solid 0pt">
                                    <span class="graph">Сертификат/№сертификата(-ов) 
									</span>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="3" style="border:solid 0pt">
                                    <span class="graph">
                                       <br/>
                                       <xsl:if test="mpod:DocumentInfo/mpod:DocumentCode='CRT'">
                                          <xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='CRT']/cat_ru:PrDocumentName">
                                             <xsl:value-of select="mpod:DocumentInfo[mpod:DocumentCode='CRT']/cat_ru:PrDocumentName"/>/
										</xsl:if>
                                          <xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='CRT']/cat_ru:PrDocumentNumber">№
										<xsl:value-of select="mpod:DocumentInfo[mpod:DocumentCode='CRT']/cat_ru:PrDocumentNumber"/>/
										</xsl:if>
                                          <xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='CRT']/cat_ru:PrDocumentDate">
                                             <xsl:call-template name="date">
                                                <xsl:with-param name="dateIn" select="mpod:DocumentInfo[mpod:DocumentCode='CRT']/cat_ru:PrDocumentDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                       </xsl:if> </span>
                                 </td>
                              </tr>
                           </table>
                        </td>
                        <td colspan="3">
                           <table cellspacing="5">
                              <tr>
                                 <td align="center" style="border:solid 0.8pt; width:5mm">
                                    <span class="graph">
                                       <xsl:choose>
                                          <xsl:when test="mpod:DocumentInfo/mpod:DocumentCode='INV'">x</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </span>
                                    <!--<xsl:if test="mpod:DocumentInfo/mpod:DocumentCode=380">x</xsl:if>
	                                
									<xsl:if test="mpod:DocumentInfo/mpod:DocumentCode">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
									<xsl:if test="mpod:DocumentInfo/mpod:DocumentCode=''">&#160;</xsl:if>
									-->
                                    <!--<xsl:choose>
									<xsl:when test="(number(mpod:DocumentInfo/mpod:DocumentCode)=380) or (mpod:DocumentInfo/mpod:DocumentCode='true') or (mpod:DocumentInfo/mpod:DocumentCode='t')">х</xsl:when>
									<xsl:otherwise>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:otherwise>
									</xsl:choose>-->
                                 </td>
                                 <td rowspan="2" style="border:solid 0pt">
                                    <span class="graph">Счет/№ счета           
									</span>
                                    <br/> </td>
                              </tr>
                              <tr>
                                 <td colspan="2" style="border:solid 0pt">
                                    <span class="graph">
                                       <xsl:if test="mpod:DocumentInfo/mpod:DocumentCode='INV'">
                                          <xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='INV']/cat_ru:PrDocumentName">
                                             <xsl:value-of select="mpod:DocumentInfo[mpod:DocumentCode='INV']/cat_ru:PrDocumentName"/>/
										</xsl:if>
                                          <xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='INV']/cat_ru:PrDocumentNumber">№
										<xsl:value-of select="mpod:DocumentInfo[mpod:DocumentCode='INV']/cat_ru:PrDocumentNumber"/>/
										</xsl:if>
                                          <xsl:if test="mpod:DocumentInfo[mpod:DocumentCode='INV']/cat_ru:PrDocumentDate">
                                             <xsl:call-template name="date">
                                                <xsl:with-param name="dateIn" select="mpod:DocumentInfo[mpod:DocumentCode='INV']/cat_ru:PrDocumentDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                       </xsl:if> </span>
                                 </td>
                              </tr>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="9" style="border-left:1px solid #ffffff;"> </td>
                        <td style="border-left:1px solid #ffffff; border-top:1px solid #ffffff;"/>
                     </tr>
                     <!--</table>-->
                  </span>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template name="innkppogrn">
	   <xsl:param name="base"/>
	   <xsl:if test="$base/cat_ru:RFOrganizationFeatures">
			<xsl:text> (</xsl:text>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"/><xsl:text>, </xsl:text></xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/><xsl:text>, </xsl:text></xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/></xsl:if>
			<xsl:text>)</xsl:text>
	   </xsl:if>
   </xsl:template>
   <xsl:template name="innkppogrnWithForeign">
	   <xsl:param name="base"/>
	   <xsl:if test="$base/cat_ru:RFOrganizationFeatures">
			<xsl:text> (</xsl:text>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN|$base/../mpod:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN|$base/../mpod:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:INN"/><xsl:text>, </xsl:text></xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP|$base/../mpod:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP|$base/../mpod:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/><xsl:text>, </xsl:text></xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN|$base/../mpod:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN|$base/../mpod:ConsignorRUS/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/></xsl:if>
			<xsl:text>)</xsl:text>
	   </xsl:if>
   </xsl:template>
   <xsl:template match="mpod:MPO_Registration">
	   <xsl:value-of select="mpod:CustomsCode"/>
	   <xsl:text>/</xsl:text>
	   <xsl:call-template name="MPOdate">
		   <xsl:with-param name="dateIn" select="mpod:RegistrationDate"/>
	   </xsl:call-template>
	   <xsl:text>/</xsl:text>
	   <xsl:value-of select="mpod:MPO_Number"/>
   </xsl:template>
   <xsl:template name="MPOdate">
	  <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/><xsl:value-of select="substring($dateIn,6,2)"/><xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
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
   <xsl:template match="mpod:Importer/cat_ru:RFOrganizationFeatures/cat_ru:INN | mpod:Importer/cat_ru:RFOrganizationFeatures/cat_ru:KPP | mpod:Importer/mpod:ImporterIndex | mpod:Importer/mpod:VAT_Number | mpod:Importer/cat_ru:Contact/cat_ru:Phone | mpod:Importer/cat_ru:Contact/cat_ru:Fax | mpod:Importer/cat_ru:Contact/cat_ru:E_mail">
      <xsl:apply-templates/>
      <xsl:if test="not(position()=last())">/ </xsl:if>
   </xsl:template>
</xsl:stylesheet>
