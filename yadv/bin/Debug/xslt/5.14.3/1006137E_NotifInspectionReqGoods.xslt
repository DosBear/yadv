<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ntfin="urn:customs.ru:Information:CustomsDocuments:NotifInspectionReqGoods:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template name="russian_date_gtd">
      <xsl:param name="gtd"/>
      <xsl:choose>
         <xsl:when test="substring($gtd,5,1)='-' and substring($gtd,8,1)='-'">
            <xsl:value-of select="substring($gtd,9,2)"/>
            <xsl:value-of select="substring($gtd,6,2)"/>
            <xsl:value-of select="substring($gtd,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$gtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="DocID">
	    <xsl:param name="DocID"/>
		<xsl:choose>
			<xsl:when test="$DocID/ntfin:DTRegNum">
				<xsl:for-each select="$DocID/ntfin:DTRegNum">
					<xsl:call-template name="gdt_number">
						<xsl:with-param name="customsCode" select="cat_ru:CustomsCode"/>
						<xsl:with-param name="date" select="cat_ru:RegistrationDate"/>
						<xsl:with-param name="number" select="cat_ru:GTDNumber"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$DocID/ntfin:MPORegNum">
				<xsl:for-each select="$DocID/ntfin:MPORegNum">
					<xsl:call-template name="gdt_number">
						<xsl:with-param name="customsCode" select="ntfin:CustomsCode"/>
						<xsl:with-param name="date" select="ntfin:RegistrationDate"/>
						<xsl:with-param name="number" select="ntfin:MPO_Number"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$DocID/ntfin:AppRelNum">
				<xsl:for-each select="$DocID/ntfin:AppRelNum">
					<xsl:call-template name="gdt_number">
						<xsl:with-param name="customsCode" select="cat_ru:CustomsCode"/>
						<xsl:with-param name="date" select="cat_ru:RegistrationDate"/>
						<xsl:with-param name="number" select="cat_ru:GTDNumber"/>
						<xsl:with-param name="add_number" select="ntfin:AddNumber"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>   
   </xsl:template>
   <xsl:template name="gdt_number">
	   <xsl:param name="customsCode"/>
	   <xsl:param name="date"/>
	   <xsl:param name="number"/>
	   <xsl:param name="add_number" select="''"/>
	   <xsl:if test="$customsCode != ''">
		   <xsl:value-of select="$customsCode"/><xsl:text>/</xsl:text>
	   </xsl:if>
	   <xsl:if test="$date != ''">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="gtd" select="$date"/>
            </xsl:call-template><xsl:text>/</xsl:text>
       </xsl:if>
	   <xsl:if test="$add_number != ''">
		   <xsl:value-of select="$add_number"/>
       </xsl:if>
		<xsl:value-of select="$number"/>
   </xsl:template>
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="ntfin:NotifInspectionReqGoods">
      <html>
         <head>
            <title>Решение о проведении таможенного досмотра.</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
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
							font-size: 13pt;
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
						
						.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph14Bold {
						font-family: Arial;
						font-size: 14pt;
						font-weight: bold;
						}				
						.bordered {
					border-bottom: solid 1pt #000000;
										}	
										
						.uplined {
						border-top: solid 1pt #000000;
						font-family: Arial;
						font-size: 7pt;
						}				
                </style>
         </head>
         <body>
            <div class="page">
               <table style="width:210mm">
                  <tbody>
                     <tr>
                        <td style="width:70mm" valign="top">
                           <table style="width:70mm">
                              <tbody>
                                 <tr>
                                    <td class="bordered">
                                       <xsl:value-of select="ntfin:Customs/cat_ru:Code"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle">(указывается код и наименование</td>
                                 </tr>
                                 <tr>
                                    <td class="bordered">
                                       <xsl:value-of select="ntfin:Customs/cat_ru:OfficeName"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle">таможенного органа)</td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                        <td style="width:40mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                        </td>
                        <td style="width:100mm" valign="top">
                           <table style="width:90mm">
                              <tbody>
                                 <tr>
                                    <td class="bordered">
                                       <xsl:value-of select="ntfin:Declarant/cat_ru:OrganizationName"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle">(указывается декларант, иное лицо, обладающее полномочиями</td>
                                 </tr>
                                 <tr>
                                    <td class="bordered">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle">в отношении товаров и(или) транспортных</td>
                                 </tr>
                                 <tr>
                                    <td class="bordered">
                                       <xsl:if test="ntfin:Declarant/ntfin:Representative">
                                          <xsl:value-of select="ntfin:Declarant/ntfin:Representative/cat_ru:OrganizationName"/>
                                       </xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle">средств, и их представитель: наименование или</td>
                                 </tr>
                                 <tr>
                                    <td class="bordered">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle">инициалы и фамилия(для физических лиц)</td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table>
                  <tbody>
                     <xsl:if test="ntfin:DocumentKind='0' or ntfin:DocumentKind='7'">
                        <tr>
                           <td>
                              <br/>
                              <br/>
                              <span class="graph14Bold">УВЕДОМЛЕНИЕ</span>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <b>о проведении таможенного досмотра</b>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td>
										от <span class="bordered">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="ntfin:NotifReqDate"/>
                                 </xsl:call-template>
                              </span> 
										<br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td align="left">
							   <xsl:choose>
									<xsl:when test="ntfin:DocumentKind='0'">
										<xsl:text>  В соответствии с пунктом 3 статьи 328 Таможенного кодекса ЕАЭС уведомляем, что в ходе таможенного контроля в отношении товаров, сведения о которых содержатся в таможенной декларации № </xsl:text>
									</xsl:when>
									<xsl:when test="ntfin:DocumentKind='7'">
										<xsl:text>  В соответствии с пунктом 3 статьи 328 Таможенного кодекса ЕАЭС уведомляем, что в ходе таможенного контроля в отношении товаров, сведения о которых содержатся в заявлении о выпуске до подачи ДТ № </xsl:text>
									</xsl:when>
								</xsl:choose>
								<span class="bordered">
									<xsl:call-template name="DocID">
										<xsl:with-param name="DocID" select="ntfin:DocID"/>
									</xsl:call-template>
								</span>
								<xsl:if test="ntfin:Otherwise">
									, иных случаях  <span class="bordered">
										<xsl:value-of select="ntfin:Otherwise"/>
									</span> 
								</xsl:if>
								<br/>принято решение о проведении таможенного досмотра.
							</td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ntfin:DocumentKind='1' or ntfin:DocumentKind='8'">
                        <tr>
                           <td>
                              <br/>
                              <br/>
                              <span class="graph14Bold">ТРЕБОВАНИЕ</span>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <b>о предъявлении товаров</b>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td>
										от <span class="bordered">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="ntfin:NotifReqDate"/>
                                 </xsl:call-template>
                              </span> 
										<br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td align="left">
							   <xsl:choose>
									<xsl:when test="ntfin:DocumentKind='0'">
										<xsl:text>  В целях обеспечения реализации статьи 310 Таможенного кодекса ЕАЭС для осуществления таможенного контроля требуется предъявление в зону таможенного контроля товаров, сведения о которых содержатся в таможенной декларации № </xsl:text>
									</xsl:when>
									<xsl:when test="ntfin:DocumentKind='7'">
										<xsl:text>  В целях обеспечения реализации статьи 310 Таможенного кодекса ЕАЭС для осуществления таможенного контроля требуется предъявление в зону таможенного контроля товаров, сведения о которых содержатся в заявлении о выпуске до подачи ДТ № </xsl:text>
									</xsl:when>
								</xsl:choose>
								<span class="bordered">
									<xsl:call-template name="DocID">
										<xsl:with-param name="DocID" select="ntfin:DocID"/>
									</xsl:call-template>
								</span>
								<xsl:if test="ntfin:Otherwise">
									, иных случаях  <span class="bordered">
										<xsl:value-of select="ntfin:Otherwise"/>
									</span> 
								</xsl:if>
                              <br/>с целью проведения таможенного досмотра.
							</td>
                        </tr>
                     </xsl:if>
					 <xsl:if test="ntfin:DocumentKind='2'">
                        <tr>
                           <td>
                              <br/>
                              <br/>
                              <span class="graph14Bold">УВЕДОМЛЕНИЕ</span>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <b>о необходимости предъявления МПО в ТО</b>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td>
										от <span class="bordered">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="ntfin:NotifReqDate"/>
                                 </xsl:call-template>
                              </span> 
										<br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td align="left">  МПО №
								<span class="bordered">
									<xsl:call-template name="DocID">
										<xsl:with-param name="DocID" select="ntfin:DocID"/>
									</xsl:call-template>
								</span>
							</td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ntfin:DocumentKind='3'">
                        <tr>
                           <td>
                              <br/>
                              <br/>
                              <span class="graph14Bold">ТРЕБОВАНИЕ</span>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <b>о предъявлении товаров к осмотру в МПО</b>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td>
										от <span class="bordered">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="ntfin:NotifReqDate"/>
                                 </xsl:call-template>
                              </span> 
										<br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td align="left">  МПО №
								<span class="bordered">
									<xsl:call-template name="DocID">
										<xsl:with-param name="DocID" select="ntfin:DocID"/>
									</xsl:call-template>
								</span>
							</td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ntfin:DocumentKind='4'">
                        <tr>
                           <td>
                              <br/>
                              <br/>
                              <span class="graph14Bold">ТРЕБОВАНИЕ</span>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <b>о предъявлении товаров к досмотру МПО</b>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td>
										от <span class="bordered">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="ntfin:NotifReqDate"/>
                                 </xsl:call-template>
                              </span> 
										<br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td align="left">  МПО №
								<span class="bordered">
									<xsl:call-template name="DocID">
										<xsl:with-param name="DocID" select="ntfin:DocID"/>
									</xsl:call-template>
								</span>
							</td>
                        </tr>
                     </xsl:if>
					 <xsl:if test="ntfin:DocumentKind='5'">
                        <tr>
                           <td>
                              <br/>
                              <br/>
                              <span class="graph14Bold">УВЕДОМЛЕНИЕ</span>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <b>о переносе сроков досмотра</b>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td>
										от <span class="bordered">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="ntfin:NotifReqDate"/>
                                 </xsl:call-template>
                              </span> 
										<br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td align="left">  МПО №
								<span class="bordered">
									<xsl:call-template name="DocID">
										<xsl:with-param name="DocID" select="ntfin:DocID"/>
									</xsl:call-template>
								</span>
							</td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ntfin:DocumentKind='6'">
                        <tr>
                           <td>
                              <br/>
                              <br/>
                              <span class="graph14Bold">УВЕДОМЛЕНИЕ</span>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <b>о необходимости взятия проб и образцов</b>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                        <!--tr>
                           <td>
										от <span class="bordered">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="ntfin:NotifReqDate"/>
                                 </xsl:call-template>
                              </span> 
										<br/>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td align="left">  МПО №
								<span class="bordered">
									<xsl:call-template name="DocID">
										<xsl:with-param name="DocID" select="ntfin:DocID"/>
									</xsl:call-template>
								</span>
							</td>
                        </tr-->
                     </xsl:if>
                     
                     <tr>
                        <td>
                           <table align="left" cellpadding="0" style="width:210mm">
                              <tbody>
                                 <tr>
                                    <td align="left" style="width:150mm">
										<xsl:if test="ntfin:DocumentKind='0' or ntfin:DocumentKind='1' or ntfin:DocumentKind='5' or ntfin:DocumentKind='7' or ntfin:DocumentKind='8'">
											Таможенный досмотр товаров и (или) транспортных средств состоится:
										</xsl:if>
										<xsl:if test="ntfin:DocumentKind='2' or ntfin:DocumentKind='3' or ntfin:DocumentKind='4' or ntfin:DocumentKind='6'">
											Взятие проб и образцов товаров и (или) транспортных средств состоится:
										</xsl:if>
									</td>
                                    <td style="width:20mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="bordered" style="width:40mm">
                                       <xsl:value-of select="substring(string(ntfin:InspTime),1,5)"/>  <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="ntfin:InspDate"/>
                                       </xsl:call-template>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" class="graphLittle"> (время, дата)<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>     </td>
                     </tr>
                     <tr>
                        <td class="bordered">
                           <xsl:for-each select="ntfin:InspectionPlace">
                              <xsl:if test="ntfin:InformationTypeCode">
                                 <xsl:choose>
                                    <xsl:when test="ntfin:InformationTypeCode=11">СВХ</xsl:when>
                                    <xsl:when test="ntfin:InformationTypeCode=21">ТС</xsl:when>
                                    <xsl:when test="ntfin:InformationTypeCode=25">Свободный склад</xsl:when>
                                    <xsl:when test="ntfin:InformationTypeCode=31">Склад получателя</xsl:when>
                                    <xsl:when test="ntfin:InformationTypeCode=41">Склад хранения собственных товаров</xsl:when>
                                    <xsl:when test="ntfin:InformationTypeCode=52">ТС</xsl:when>
                                    <xsl:when test="ntfin:InformationTypeCode=60">Помещение(площадки) УЭО</xsl:when>
                                    <xsl:when test="ntfin:InformationTypeCode=72">ЗТК</xsl:when>
                                    <xsl:when test="ntfin:InformationTypeCode=80">ОЭЗ</xsl:when>
                                    <xsl:when test="ntfin:InformationTypeCode=91">Адрес места хранения</xsl:when>
                                    <xsl:when test="ntfin:InformationTypeCode=99">Иное место ВХ</xsl:when>
                                 </xsl:choose>
                                 <!--xsl:value-of select="ntfin:InspectionPlace/ntfin:InformationTypeCode"/-->  
									</xsl:if>
                              <xsl:value-of select="ntfin:InspPlaceName"/> 
									<xsl:if test="cat_ru:Code">
                                 <xsl:value-of select="cat_ru:Code"/> 
									</xsl:if>
                              <xsl:if test="cat_ru:OfficeName">
                                 <xsl:value-of select="cat_ru:OfficeName"/> 
									</xsl:if>
                              <xsl:if test="ntfin:InspPlaceDesc">
                                 <xsl:for-each select="ntfin:InspPlaceDesc">
                                    <xsl:value-of select="."/> 
										</xsl:for-each>
                              </xsl:if>
                              <xsl:if test="ntfin:WarehousePlace">
                                 <xsl:value-of select="ntfin:WarehousePlace/cat_ru:PrDocumentName"/> 
										№ <xsl:value-of select="ntfin:WarehousePlace/cat_ru:PrDocumentNumber"/> 
										 от <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="ntfin:WarehousePlace/cat_ru:PrDocumentDate"/>
                                 </xsl:call-template> 
									</xsl:if>
                              <xsl:if test="ntfin:InspAddress">
                                 <xsl:for-each select="ntfin:InspAddress">
                                    <xsl:call-template name="Address"/> 
										</xsl:for-each>
                              </xsl:if>
                              <xsl:if test="position()!=last()">, </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphLittle"> 
									(указывается место проведения взятия проб и образцов, адрес зоны таможенного контроля, сведения о складе временного хранения и т.п.)
								</td>
                     </tr>
                     <xsl:if test="ntfin:IdentificationGoods">
						 <tr>
							<td align="left">
							   <table>
								  <xsl:for-each select="ntfin:IdentificationGoods">
									  	<tr>
											<xsl:if test="position()=1"><td align="left" style="width:30mm">в отношении</td></xsl:if>
											<xsl:if test="position() &gt; 1"><td align="left" style="width:30mm"/></xsl:if>
											<td class="bordered" style="width:180mm"><xsl:value-of select="."/></td>
										</tr>
								  </xsl:for-each>
							   </table>
							</td>
						 </tr>
						 <tr>
							<td class="graphLittle">(указываются номера транспортных средств, контейнеров, товаро-транспортная накладная и прочая информация, идентифицирующая товары)</td>
						 </tr>
                     </xsl:if>
                     <xsl:if test="ntfin:DecisionNumber">
                     	 <tr>
							<td align="left">
								<xsl:text>На основании Решения о проведении таможенной экспертизы № </xsl:text>
								<xsl:for-each select="ntfin:DecisionNumber">
									<xsl:value-of select="cat_ru:CustomsCode"/>
									<xsl:text>/</xsl:text>
									<xsl:call-template name="russian_date_gtd"><xsl:with-param name="gtd" select="cat_ru:RegistrationDate"/></xsl:call-template>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="ntfin:ExpertisePoint"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="cat_ru:SerialNumber"/>
								</xsl:for-each>
							</td>
						 </tr>
                     </xsl:if>
                     <xsl:if test="ntfin:ActThievingComment">
						 <tr>
							<td align="left"><xsl:apply-templates select="ntfin:ActThievingComment"/></td>
						</tr>
                     </xsl:if>
                     <tr>
                        <td align="left">
                           <br/>
								Присутствие при таможенном досмотре: 
								<xsl:if test="(ntfin:Presence='1') or (ntfin:Presence='t') or (ntfin:Presence='true')">[Х] требуется   [ ] не требуется</xsl:if>
                           <xsl:if test="(ntfin:Presence='0') or (ntfin:Presence='f') or (ntfin:Presence='false')">[ ] требуется   [Х] не требуется</xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>(выбрать знаком Х одно из значений) </td>
                     </tr>
                     <tr>
                        <td>
                           <table align="left" style="width:210mm">
                              <tbody>
                                 <tr>
                                    <td class="bordered" style="width:110mm">
                                       <xsl:value-of select="ntfin:CustomsPerson/cat_ru:PersonName"/>
                                    </td>
                                    <td style="width:40mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="bordered" style="width:30mm">
                                       <xsl:value-of select="ntfin:CustomsPerson/cat_ru:LNP"/> (ЛНП)
												</td>
                                    <td style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle" style="width:110mm">(инициалы и фамилия уполномоченного доллжностного лица таможенного органа)</td>
                                    <td style="width:40mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="graphLittle" style="width:30mm">(подпись)</td>
                                    <td style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <table align="left" style="width:210mm">
                              <tbody>
                                 <tr>
                                    <td class="bordered" style="width:100mm">
                                       <xsl:value-of select="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonSurname"/> 
													<xsl:value-of select="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonName"/> 
													<xsl:value-of select="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonMiddleName"/> 
												</td>
                                    <td style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="bordered" style="width:40mm">
                                       <!--xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:IssueDate"/>
                                       </xsl:call-template-->
                                    </td>
                                    <td style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="bordered" style="width:40mm">
                                       <xsl:value-of select="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonSurname"/> 
													<xsl:value-of select="substring(ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonName,1,1)"/> 
													<xsl:value-of select="substring(ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonMiddleName,1,1)"/> 
												</td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle" style="width:100mm">
													(инициалы и фамилия лица, получившего уведомление)
												</td>
                                    <td style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="graphLittle" style="width:40mm">
													(дата получения уведомления)
												</td>
                                    <td style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="graphLittle" style="width:20mm">
													(подпись)
												</td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left">При направлении требования по почте или иным способом:</td>
                     </tr>
                     <tr>
                        <td>
                           <table align="left" style="width:210mm">
                              <tbody>
                                 <tr>
                                    <td style="width:100mm">
                                       <xsl:if test="ntfin:DirectionNotifReq">
                                          <xsl:for-each select="ntfin:DirectionNotifReq/ntfin:Address">
                                             <xsl:call-template name="Address"/> 
										            </xsl:for-each>
                                          <xsl:value-of select="ntfin:DirectionNotifReq/ntfin:MethodDirection"/>; 
												
												
													<xsl:value-of select="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonSurname"/> 
													<xsl:if test="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonName">
                                             <xsl:value-of select="substring(ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonName,1,1)"/>. </xsl:if>
                                          <xsl:if test="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonMiddleName">
                                             <xsl:value-of select="substring(ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonMiddleName,1,1)"/>. </xsl:if>
                                       </xsl:if>
                                    </td>
                                    <td style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                    </td>
                                    <td style="width:20mm">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="ntfin:DirectionNotifReq/ntfin:DateDirection"/>
                                       </xsl:call-template>
                                    </td>
                                    <td style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                    </td>
                                    <td style="width:40mm">
                                       <xsl:value-of select="ntfin:DirectionNotifReq/ntfin:CustomsPerson/cat_ru:PersonName"/> 
													<xsl:value-of select="ntfin:DirectionNotifReq/ntfin:CustomsPerson/cat_ru:LNP"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="uplined" style="width:100mm">
													(сведения о месте, куда направлено уведомление, и способе его направления; инициалы и фамилия, принявшего уведомление)
												</td>
                                    <td style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="uplined" style="width:20mm">
													(дата направления уведомления)
												</td>
                                    <td style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="uplined" style="width:40mm">
													(инициалы, фамилия и подпись должностного лица таможенного органа, направившего уведомление)
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
</xsl:stylesheet>
