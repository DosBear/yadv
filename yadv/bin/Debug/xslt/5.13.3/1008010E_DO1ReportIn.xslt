<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="catWH_ru cat_ru do1r_in" version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.13.1" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:do1r_in="urn:customs.ru:Information:WarehouseDocuments:DO1ReportIn:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="do1r_in:DO1ReportIn">
      <html>
         <head>
            <title>DO1Report</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; white-space: nowrap; padding-left:4pt }
					td.bold { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; white-space: nowrap; }					
					td.value { font-size: 8.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; white-space: nowrap; }
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
					span.bold { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 12.0pt; font-family: Courier; color: windowtext; }
					div.page { width: 297mm; height: 210mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.5pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graphUnderlined {font-family: Arial; font-size: 7pt; border-top: solid 0.5pt #000000}
					.graph-number { font-size: 9pt; font-weight: bold; }
				</style>
         </head>
         <body>
            <div class="page">
               <table border="0" cellpadding="3" cellspacing="0" width="260mm">
                  <tr>
                     <td colspan="2" style="width:260mm">
                        <table border="0" cellpadding="3" cellspacing="0" style="width:260mm">
                           <tbody>
                              <tr>
                                 <td align="center" height="30mm" rowspan="3" style="width:150mm;border:solid 1.5pt #000000;">
                                    <span class="bold">
                                       <xsl:text>СВХ </xsl:text>
                                       <u>
                                          <xsl:value-of select="catWH_ru:WarehouseOwner/cat_ru:OrganizationName"/>
                                       </u>
                                       <br/>
                                       <xsl:text> Свидетельство о включении в реестр владельцев СВХ от </xsl:text>
                                       <u>
                                          <xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                       </u>
                                       <xsl:text> № </xsl:text>
                                       <u>
                                          <xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/>
                                       </u>
                                    </span>
                                    <br/>
                                    <span class="graph"> (при хранении товаров на складе получателя товаров указывается номер разрешения таможни) </span>
                                 </td>
                                 <td height="30mm" rowspan="3" style="width:80mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td align="center" height="10mm" style="width:30mm;border:solid 1.5pt #000000;">
                                    <span class="bold">Форма ДО1</span>
                                 </td>
                              </tr>
                              <tr>
                                 <td height="10mm" style="width:30mm"/>
                              </tr>
                              <tr>
                                 <td height="10mm" style="width:30mm"/>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
                  <!--xsl:for-each select="do1r_in:GoodsShipment/do1r_in:TransportDocs/do1r_in:Goods"-->
                  <!--xsl:if test="do1r_in:GoodsShipment/do1r_in:TransportDocs/catWH_ru:Goods/catWH_ru:ShippingDocsMismatch"-->
                     <!--xsl:choose>
								<xsl:when test="do1r_in:ShippingDocsMismatch"-->
                     <!--Для вывода шапки добавочного листа по признаку наличия элемента ShippingDocsMismatch-->
                     <!--tr>
                        <td align="center" class="bold" colspan="2" style="width:260mm">
                           <br/-->
                           <!--span class="bold"-->
                           <!--xsl:text>Добавочный лист к отчету № </xsl:text>
                           <xsl:value-of select="catWH_ru:ReportNumber"/-->
                           <!--xsl:if test="//catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:CustomsCode">
												<xsl:value-of select="//catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:CustomsCode"/>
											</xsl:if>
											<xsl:text> / </xsl:text>
											<xsl:call-template name="russian_date_gtd">
												<xsl:with-param name="dateIn" select="//catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:RegistrationDate"/>
											</xsl:call-template>
											<xsl:text> / </xsl:text>
											<xsl:value-of select="//catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:GTDNumber"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text-->
                           <!--xsl:text> от </xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
                           </xsl:call-template>
                           <br/>
                           <xsl:text> о принятии товаров на хранение </xsl:text-->
                           <!--/span-->
                           <!--br/>
                        </td>
                     </tr>
                  </xsl:if-->
                  <!--/xsl:when-->
                  <!--Для вывода шапки основного листа по признаку отсутсtвия элемента ShippingDocsMismatch-->
                  <!--xsl:otherwise-->
                  <!--xsl:if test="not(do1r_in:GoodsShipment/do1r_in:TransportDocs/catWH_ru:Goods/catWH_ru:ShippingDocsMismatch)"-->
                     <tr>
                        <td align="center" class="bold" colspan="2" style="width:260mm">
                           <br/>
                           <!--span class="bold"-->
                           <xsl:text> Отчет № </xsl:text>
                           <xsl:value-of select="catWH_ru:ReportNumber"/>
                           <!--xsl:if test="catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:CustomsCode">
												<xsl:value-of select="//catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:CustomsCode"/>
											</xsl:if>
											<xsl:text> / </xsl:text>
											<xsl:call-template name="russian_date_gtd">
												<xsl:with-param name="dateIn" select="catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:RegistrationDate"/>
											</xsl:call-template>
											<xsl:text> / </xsl:text>
											<xsl:value-of select="catWH_ru:CustomRegistration/catWH_ru:RegisterNumber/cat_ru:GTDNumber"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text-->
                           <xsl:text> от </xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
                           </xsl:call-template>
                           <br/>
                           <xsl:text> о принятии товаров на хранение </xsl:text>
                           <!--/span-->
                           <br/>
                        </td>
                     </tr>
                     <!--tr>
							<td colspan="2" style="width:180mm">
							<p align="left"><xsl:text>В адрес получателя:</xsl:text><br/>
							<xsl:text>по транспортному документу (вид, дата и номер): </xsl:text>
								<xsl:for-each select="do1r_in:GoodsShipment/do1r_in:TransportDocs">
								<xsl:value-of select="./catWH_ru:PresentedDocumentModeCode"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:if test="./cat_ru:PrDocumentDate">
									 <xsl:text> от </xsl:text>
									 <xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="./cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								 </xsl:if>
								<xsl:if test="./cat_ru:PrDocumentNumber">		 
									<xsl:text> № </xsl:text><xsl:value-of select="./cat_ru:PrDocumentNumber"/>
								 </xsl:if>		 
							</xsl:for-each></p>
							</td>
						</tr-->
                  <!--/xsl:if-->
                  <tr>
                     <td style="width:260mm">
                        <p align="left">
                           <xsl:text>Перевозчик </xsl:text>
                           <u>
                              <xsl:value-of select="//do1r_in:Carrier/cat_ru:OrganizationName"/>
                           </u>
                        </p>
                     </td>
                     <td align="center" style="width:260mm">
                        <p align="left">
                           <xsl:text>Код вида транспорта </xsl:text>
                           <u>
                              <xsl:value-of select="//do1r_in:Transports/catWH_ru:TransportModeCode"/>
                           </u>
							<xsl:if test="do1r_in:GoodsShipment/do1r_in:MasterAirWayBill">
							   <xsl:text> Авиа-накладная </xsl:text>
							   <xsl:for-each select="do1r_in:GoodsShipment/do1r_in:MasterAirWayBill">
								   <xsl:value-of select="cat_ru:PrDocumentNumber"/>
								   <xsl:if test="cat_ru:PrDocumentDate">
									   <xsl:text> от </xsl:text>
									   <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
								   </xsl:if>
							   </xsl:for-each>
                           </xsl:if>
                        </p>
                        <br/>
                     </td>
                  </tr>
                  <!--/xsl:otherwise>
							</xsl:choose-->
                  <!--/xsl:for-each-->
               </table>
               <table border="0" cellpadding="1" cellspacing="0" width="260mm">
                  <!--tr>
							<td colspan="2" style="width:180mm"><p align="left">
								<xsl:text>Регистрационный номер автотранспортного средства (прицепа), воздушного судна или наименование морского (речного) судна  </xsl:text>
									<xsl:for-each select="do1r_in:Transports">
									<xsl:value-of select="./catWH_ru:TransportIdentifier"/>
									<xsl:if test="./catWH_ru:Avto"><xsl:value-of select="./catWH_ru:TrailerIdentifier"/>, </xsl:if>	 
									<xsl:if test="./catWH_ru:Avto">,<xsl:value-of select="./catWH_ru:SecondTrailerIdentifier"/> </xsl:if>
									<xsl:if test="./catWH_ru:Avia">, номер рейса <xsl:value-of select="catWH_ru:Avia/catWH_ru:FlightNumber"/></xsl:if>	 
									<xsl:if test="./catWH_ru:Avia"> дата рейса 
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="catWH_ru:Avia/catWH_ru:FlightDate"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:for-each>
							</p>
							</td>
						</tr-->
                  <!--tr>
							<td colspan="2" style="width:180mm"><p align="left"><xsl:text>Номер транзитной декларации или книжки МДП:</xsl:text>
							
							
							<xsl:for-each select="do1r_in:GoodsShipment/do1r_in:CustomsDocs">
										<xsl:if test="./cat_ru:PrDocumentNumber">		 
									<xsl:text> № </xsl:text><xsl:value-of select="./cat_ru:PrDocumentNumber"/>
								 </xsl:if>		
								<xsl:if test="./cat_ru:PrDocumentDate">
									 <xsl:text> от </xsl:text>
									 <xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="./cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								 </xsl:if>
 										<xsl:if test="./catWH_ru:VttCustomsCode">		 
									<xsl:text> код таможни </xsl:text><xsl:value-of select="./catWH_ru:VttCustomsCode"/>
								 </xsl:if>	
							</xsl:for-each>
							
							
							
							
							<br/>
							<xsl:text>Приняты на хранение следующие товары (табл.)</xsl:text><br/></p>
							</td>
						</tr-->
                  <tr>
                     <td align="left" style="width:260mm">Вид, дата и номер транспортного документа <span class="underlined">
                           <xsl:for-each select="do1r_in:GoodsShipment/do1r_in:TransportDocs">
                              <xsl:value-of select="./catWH_ru:PresentedDocumentModeCode"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="./cat_ru:PrDocumentDate">
                                 <xsl:text> от </xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="./cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                              <xsl:if test="./cat_ru:PrDocumentNumber">
                                 <xsl:text> № </xsl:text>
                                 <xsl:value-of select="./cat_ru:PrDocumentNumber"/>
                              </xsl:if>
                              <xsl:if test="position()!=last()">; </xsl:if>
                           </xsl:for-each>
                        </span>
                     </td>
                  </tr>
                  <tr align="left">
                     <td align="right" class="graph" style="width:260mm" valign="top">(если для указания сведений недостаточно места, допускается указывать их на обратной стороне основного листа отчета и делать запись "см. на обороте")
							</td>
                  </tr>
                  <tr>
                     <td>
                        <br/>
                        <xsl:text>Приняты на хранение следующие товары (табл.)</xsl:text>
                        <br/>
                     </td>
                  </tr>
                  <tr>
                     <td style="width:260mm">
                        <xsl:if test="(do1r_in:GoodsShipment/do1r_in:MPOSign='0') or (do1r_in:GoodsShipment/do1r_in:MPOSign='f') or (do1r_in:GoodsShipment/do1r_in:MPOSign='false')">
                           <table align="center" border="1" width="180mm">
                              <tbody>
                                 <p align="center">
                                    <tr>
                                       <td align="center" style="width:10mm;">№ п/п</td>
                                       <td align="center" style="width:15mm;">Дата и время помещения на склад</td>
                                       <td align="center" style="width:20mm;">Наименование товара</td>
                                       <td align="center" style="width:15mm;">Код товара</td>
                                       <td align="center" style="width:15mm;">Складской номер товара</td>
                                       <td align="center" style="width:10mm;">Количество грузовых мест</td>
                                       <td align="center" style="width:20mm;">Вес товара брутто (в кг) или объем товара (в куб. м) (либо в доп. единицах измерения)</td>
                                       <td align="center" style="width:10mm;">Стоимость товара в валюте, указанной в транспортных или коммерческих документах</td>
                                       <td align="center" style="width:10mm;">Буквенный код валюты</td>
                                       <td align="center" style="width:15mm;">Дата истечения срока временного хранения</td>
                                       <td align="center" style="width:40mm;">Примечание</td>
                                    </tr>
                                    <tr>
                                       <td align="center" style="width:10mm;">1</td>
                                       <td align="center" style="width:15mm;">2</td>
                                       <td align="center" style="width:20mm;">3</td>
                                       <td align="center" style="width:15mm;">4</td>
                                       <td align="center" style="width:15mm;">5</td>
                                       <td align="center" style="width:10mm;">6</td>
                                       <td align="center" style="width:20mm;">7</td>
                                       <td align="center" style="width:10mm;">8</td>
                                       <td align="center" style="width:10mm;">9</td>
                                       <td align="center" style="width:15mm;">10</td>
                                       <td align="center" style="width:40mm;">11</td>
                                    </tr>
                                    <!--xsl:for-each select="do1r_in:GoodsShipment/do1r_in:TransportDocs"-->
                                    <!--xsl:for-each select="do1r_in:Goods"-->
                                    <xsl:variable name="TransportDocs" select="current()"/>
                                    <xsl:for-each select="do1r_in:GoodsShipment/do1r_in:TransportDocs/catWH_ru:Goods">
                                       <tr>
                                          <td align="center" style="width:10mm;">
                                             <xsl:value-of select="catWH_ru:GoodsNumber"/>
                                          </td>
                                          <td align="center" style="width:15mm;">
                                             <xsl:if test="catWH_ru:KeepingLimit/catWH_ru:AcceptDate">
                                                <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="catWH_ru:KeepingLimit/catWH_ru:AcceptDate"/>
                                                </xsl:call-template>
                                             </xsl:if>
                                             <xsl:if test="catWH_ru:KeepingLimit/catWH_ru:AcceptTime">
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="catWH_ru:KeepingLimit/catWH_ru:AcceptTime"/>
                                             </xsl:if>
                                          </td>
                                          <td align="center" style="width:20mm;">
                                             <!--<xsl:choose>
																<xsl:when test="do1r_in:ShippingDocsMismatch/do1r_in:GoodsDescription">
																	<xsl:value-of select="do1r_in:ShippingDocsMismatch/do1r_in:GoodsDescription"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:for-each select="catWH_ru:GoodsDescription">
																		<xsl:value-of select="."/>
																	</xsl:for-each>
																</xsl:otherwise>
															</xsl:choose>-->
                                             <xsl:for-each select="catWH_ru:GoodsDescription">
                                                <xsl:value-of select="."/>
                                             </xsl:for-each>
                                          </td>
                                          <td align="center" style="width:15mm;">
                                             <!--<xsl:choose>
																<xsl:when test="do1r_in:ShippingDocsMismatch/do1r_in:GoodsTNVEDCode">
																	<xsl:value-of select="do1r_in:ShippingDocsMismatch/do1r_in:GoodsTNVEDCode"/>
																</xsl:when>
																<xsl:otherwise>-->
                                             <xsl:if test="catWH_ru:GoodsTNVEDCode">
                                                <xsl:value-of select="catWH_ru:GoodsTNVEDCode"/>
                                             </xsl:if>
                                             <!--</xsl:otherwise>
															</xsl:choose>-->
                                          </td>
                                          <td align="center" style="width:15mm;">
                                             <xsl:if test="catWH_ru:GoodsWHNumber">
                                                <xsl:value-of select="catWH_ru:GoodsWHNumber"/>
                                             </xsl:if>
                                             <!--xsl:for-each select="do1r_in:Container"><xsl:value-of select="catWH_ru:ContainerNumber"/>, </xsl:for-each-->
                                             <xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Area">,
													<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:Area"/>
                                                <xsl:text> </xsl:text>
                                             </xsl:if>
                                             <xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Parking">,
													<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:Parking"/>
                                                <xsl:text> </xsl:text>
                                             </xsl:if>
                                             <xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Square">
													,<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:Square"/>
                                                <xsl:text> </xsl:text>
                                             </xsl:if>
                                             <xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Comments">,
														<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:Comments"/>
                                                <xsl:text> </xsl:text>
                                             </xsl:if>
                                             <xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Angar">,
													<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:Angar"/>
                                                <xsl:text> </xsl:text>
                                             </xsl:if>
                                             <xsl:if test="catWH_ru:KeepingPlace/catWH_ru:WHPackind">,
													<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:WHPackind"/>
                                                <xsl:text> </xsl:text>
                                             </xsl:if>
                                             <xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Cell">,
													<xsl:value-of select="catWH_ru:KeepingPlace/catWH_ru:Cell"/>
                                             </xsl:if>
                                             <xsl:for-each select="../catWH_ru:Containers">
                                                <xsl:value-of select="catWH_ru:ContainerNumber"/>, 
												</xsl:for-each>
                                          </td>
                                          <td align="center" style="width:10mm;">
                                             <!--<xsl:choose>
																<xsl:when test="do1r_in:ShippingDocsMismatch/do1r_in:PlaceNumber">
																	<xsl:value-of select="do1r_in:ShippingDocsMismatch/do1r_in:PlaceNumber"/>
																</xsl:when>
																<xsl:otherwise>-->
                                             <xsl:if test="catWH_ru:CargoPlace/catWH_ru:PlaceNumber">
                                                <xsl:value-of select="catWH_ru:CargoPlace/catWH_ru:PlaceNumber"/>
                                             </xsl:if>
                                             <!--</xsl:otherwise>
															</xsl:choose>-->
                                          </td>
                                          <td align="center" style="width:20mm;">
                                             <!--<xsl:choose>
																<xsl:when test="do1r_in:ShippingDocsMismatch/catWH_ru:BruttoVolQuant">
																	<xsl:value-of select="do1r_in:ShippingDocsMismatch/catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/>
																	<xsl:text> </xsl:text>
																	<xsl:if test="do1r_in:ShippingDocsMismatch/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName">
																		<xsl:value-of select="do1r_in:ShippingDocsMismatch/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/>
																	</xsl:if>
																</xsl:when>
																<xsl:otherwise>-->
                                             <xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:if test="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName">
                                                <xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/>
                                             </xsl:if>
																	(<xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>)
																
                                             <!--</xsl:otherwise>
															</xsl:choose>-->
                                          </td>
                                          <td align="center" style="width:10mm;">
                                             <!--<xsl:choose>
																<xsl:when test="do1r_in:ShippingDocsMismatch/do1r_in:InvoiceCost">
																	<xsl:value-of select="do1r_in:ShippingDocsMismatch/do1r_in:InvoiceCost"/>
																</xsl:when>
																<xsl:otherwise>-->
                                             <xsl:if test="catWH_ru:InvoiceCost">
                                                <xsl:value-of select="catWH_ru:InvoiceCost"/>
                                             </xsl:if>
                                             <!--</xsl:otherwise>
															</xsl:choose>-->
                                          </td>
                                          <td align="center" style="width:10mm;">
                                             <xsl:if test="catWH_ru:CurrencyCode">
                                                <xsl:value-of select="catWH_ru:CurrencyCode"/>
                                             </xsl:if>
                                          </td>
                                          <td align="center" style="width:15mm;">
                                             <xsl:if test="catWH_ru:KeepingLimit/catWH_ru:DeadLineDate">
                                                <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="catWH_ru:KeepingLimit/catWH_ru:DeadLineDate"/>
                                                </xsl:call-template>
                                             </xsl:if>
                                          </td>
                                          <td align="center" style="width:40mm;">
                                             <xsl:if test="catWH_ru:Comments">
                                                <xsl:value-of select="catWH_ru:Comments"/>
                                             </xsl:if>
                                             <!--<xsl:if test="do1r_in:ShippingDocsMismatch">
												<xsl:if test="do1r_in:ShippingDocsMismatch/do1r_in:Kind='mism_ResortGood'">
															 Товар есть в наличии, но его характеристики не соответствуют заявленным в товаросопроводительных документах.
															</xsl:if>
															<xsl:if test="do1r_in:ShippingDocsMismatch/do1r_in:Kind='mism_MissedGood'">
															 Товар был заявлен в товаросопроводительных документах, но отсутствует по факту.
															</xsl:if>
															
															<xsl:if test="do1r_in:ShippingDocsMismatch/do1r_in:Kind='mism_ExtraGood'">
															 Дополнительный (лишний) товар, отсутствовавший в товаросопроводительных документах, но выявленный по факту.	
															</xsl:if>-->
                                             <!--xsl:value-of select="do1r_in:ShippingDocsMismatch/do1r_in:Kind"/-->
                                             <!--&#160;
																	<xsl:if test="do1r_in:ShippingDocsMismatch/do1r_in:Stage='mist_AtAcceptance'">
															 Несоответствие выявлено на этапе принятия товара.
															</xsl:if>
															<xsl:if test="do1r_in:ShippingDocsMismatch/do1r_in:Stage='mist_AtKeeping'">
															Несоответствие выявлено в процессе 
															</xsl:if>-->
                                             <!--xsl:value-of select="do1r_in:ShippingDocsMismatch/do1r_in:Stage"/--> 
																
                                             <!--<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="do1r_in:ShippingDocsMismatch/do1r_in:Date"/>
																</xsl:call-template>&#160;	
																<xsl:value-of select="do1r_in:ShippingDocsMismatch/do1r_in:Time"/>&#160;
																<xsl:for-each select="do1r_in:ShippingDocsMismatch/do1r_in:CommerceAct">
																	<xsl:value-of select="."/>&#160;
																</xsl:for-each>
															</xsl:if>-->
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </p>
                              </tbody>
                           </table>
                        </xsl:if>
                        <xsl:if test="(do1r_in:GoodsShipment/do1r_in:MPOSign='1') or (do1r_in:GoodsShipment/do1r_in:MPOSign='t') or (do1r_in:GoodsShipment/do1r_in:MPOSign='t') or (do1r_in:GoodsShipment/do1r_in:MPOSign='true')">
                           <table align="center" border="1" width="180mm">
                              <tbody>
                                 <p align="center">
                                    <tr>
                                       <td align="center" style="width:10mm;">№ п/п</td>
                                       <td align="center" style="width:15mm;">Дата и время приема документов</td>
                                       <td align="center" style="width:20mm;">Номер МПО</td>
                                       <td align="center" style="width:15mm;">Код товара</td>
                                       <td align="center" style="width:15mm;">Номер емкости МПО</td>
                                       <td align="center" style="width:10mm;">Количество грузовых мест</td>
                                       <td align="center" style="width:20mm;">Вес МПО брутто (в кг) или объем МПО (в куб. м) (либо в доп. единицах измерения)</td>
                                       <td align="center" style="width:10mm;">Стоимость товара в валюте, указанной в транспортных или коммерческих документах</td>
                                       <td align="center" stye="width:10mm;">Код валюты</td>
                                       <td align="center" style="width:15mm;">Срок временного хранения</td>
                                       <td align="center" style="width:40mm;">Примечание</td>
                                    </tr>
                                    <tr>
                                       <td align="center" style="width:10mm;">1</td>
                                       <td align="center" style="width:15mm;">2</td>
                                       <td align="center" style="width:20mm;">3</td>
                                       <td align="center" style="width:15mm;">4</td>
                                       <td align="center" style="width:15mm;">5</td>
                                       <td align="center" style="width:10mm;">6</td>
                                       <td align="center" style="width:20mm;">7</td>
                                       <td align="center" style="width:10mm;">8</td>
                                       <td align="center" style="width:10mm;">9</td>
                                       <td align="center" style="width:15mm;">10</td>
                                       <td align="center" style="width:40mm;">11</td>
                                    </tr>
                                    <!--xsl:variable name="TransportDocs" select="current()"/-->
                                    <xsl:for-each select="do1r_in:GoodsShipment/do1r_in:TransportDocs/catWH_ru:Goods">
                                       <tr>
                                          <td align="center" style="width:10mm;">
                                             <xsl:value-of select="catWH_ru:GoodsNumber"/>
                                          </td>
                                          <td align="center" style="width:15mm;">
                                             <xsl:if test="catWH_ru:KeepingLimit/catWH_ru:AcceptDate">
                                                <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="catWH_ru:KeepingLimit/catWH_ru:AcceptDate"/>
                                                </xsl:call-template>
                                             </xsl:if>
                                             <xsl:if test="catWH_ru:KeepingLimit/catWH_ru:AcceptTime">
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="catWH_ru:KeepingLimit/catWH_ru:AcceptTime"/>
                                             </xsl:if>
                                          </td>
                                          <td align="center" style="width:20mm;">
                                             <xsl:if test="catWH_ru:MPONumber">
                                                <xsl:value-of select="catWH_ru:MPONumber/catWH_ru:ServiceIndicator"/>/
																<xsl:value-of select="catWH_ru:MPONumber/catWH_ru:SerialNumber"/>/
																<xsl:value-of select="catWH_ru:MPONumber/catWH_ru:CountryCode"/>
                                             </xsl:if>
                                             <!--	<xsl:if test="catWH_ru:MPOCaseNum">
																<xsl:value-of select="catWH_ru:MPOCaseNum"/>/
														</xsl:if>-->
                                          </td>
                                          <td align="center" style="width:15mm;">
                                             <xsl:value-of select="catWH_ru:GoodsTNVEDCode"/>
                                          </td>
                                          <td align="center" style="width:15mm;">
                                             <xsl:value-of select="catWH_ru:MPOCaseNumber"/>
                                             <!--xsl:for-each select="do1r_in:Container"><xsl:value-of select="catWH_ru:ContainerNumber"/>, </xsl:for-each-->
                                             <!--xsl:if test="do1r_in:KeepingPlace/do1r_in:Area">,
													<xsl:value-of select="do1r_in:KeepingPlace/do1r_in:Area"/>
													<xsl:text> </xsl:text> 
													</xsl:if>
													<xsl:if test="do1r_in:KeepingPlace/do1r_in:Parking">,
													<xsl:value-of select="do1r_in:KeepingPlace/do1r_in:Parking"/>
													<xsl:text> </xsl:text>
													 </xsl:if>
													<xsl:if test="do1r_in:KeepingPlace/do1r_in:Square">
													,<xsl:value-of select="do1r_in:KeepingPlace/do1r_in:Square"/>
													<xsl:text> </xsl:text>
													 </xsl:if>
														<xsl:if test="do1r_in:KeepingPlace/do1r_in:Comments">,
														<xsl:value-of select="do1r_in:KeepingPlace/do1r_in:Comments"/>
														<xsl:text> </xsl:text>
														 </xsl:if>													
													<xsl:if test="do1r_in:KeepingPlace/do1r_in:Angar">,
													<xsl:value-of select="do1r_in:KeepingPlace/do1r_in:Angar"/>
													<xsl:text> </xsl:text>
													 </xsl:if>
													<xsl:if test="do1r_in:KeepingPlace/do1r_in:WHPackind">,
													<xsl:value-of select="do1r_in:KeepingPlace/do1r_in:WHPackind"/>
													<xsl:text> </xsl:text> 
													</xsl:if>
													<xsl:if test="do1r_in:KeepingPlace/do1r_in:Cell">,
													<xsl:value-of select="do1r_in:KeepingPlace/do1r_in:Cell"/>
													</xsl:if>
													
												<xsl:for-each select="$TransportDocs/do1r_in:Conatiners">
												<xsl:value-of select="catWH_ru:ContainerNumber"/>, 
												</xsl:for-each-->
                                          </td>
                                          <td align="center" style="width:10mm;">1</td>
                                          <td align="center" style="width:20mm;">
                                             <xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:if test="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName">
                                                <xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/>
                                             </xsl:if>
															(<xsl:value-of select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>)
														</td>
                                          <td align="center" style="width:10mm;"/>
                                          <td align="center" style="width:10mm;"/>
                                          <td align="center" style="width:15mm;">
                                             <xsl:if test="catWH_ru:KeepingLimit/catWH_ru:DeadLineDate">
                                                <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="catWH_ru:KeepingLimit/catWH_ru:DeadLineDate"/>
                                                </xsl:call-template>
                                             </xsl:if>
                                          </td>
                                          <td align="center" style="width:40mm;">
                                             <xsl:if test="catWH_ru:Comments">
                                                <xsl:value-of select="catWH_ru:Comments"/> 
															</xsl:if>
                                             <xsl:if test="catWH_ru:MpoBillBruttoVolQuant">
                                                <xsl:value-of select="catWH_ru:MpoBillBruttoVolQuant/catWH_ru:GoodsQuantity"/> 
																<xsl:value-of select="catWH_ru:MpoBillBruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
																<xsl:value-of select="catWH_ru:MpoBillBruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
                                             </xsl:if>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                    <!--/xsl:for-each-->
                                 </p>
                              </tbody>
                           </table>
                        </xsl:if>
                     </td>
                  </tr>
                  <!--tr>
							<td style="width:260mm;" colspan="2">
								<table border="0" width="100%">
								<tbody>
									<br/>
									<tr>
										<td width="100mm"><p align="right"><xsl:text>Указанные товары принял</xsl:text> </p></td>
										<td width="30mm"><p align="left">
											<xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost">
												<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost"/>
											</xsl:if></p>
										</td>
										<td width="20mm">
											______________
										</td>
										<td width="30mm">
												<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/>
												<xsl:text> </xsl:text>												
												<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonSurname"/>								
										</td>
									</tr>
									<tr>
										<td width="100mm"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text> </td>
										<td width="30mm">
										<p align="center"> (должность уполномоченного работника склада)</p>		 
										 </td>
										<td width="20mm">
										<p align="center">(подпись)</p>		 
										 </td>
										 <td width="30mm">
										<p align="center">(инициалы, фамилия)</p>		 
										 </td>
									</tr>
									
								</tbody>
							</table>
						</td>
						
						</tr-->
                  <tr align="right">
                     <td align="right">
                        <table width="180mm">
                           <tbody>
                              <tr align="right">
                                 <td>Указанные товары принял</td>
                                 <td class="underlined">
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
                                    </xsl:call-template>
                                 </td>
                                 <td align="center" class="underlined">
                                    <xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonName"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonSurname"/> 
												<xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost">
                                       <xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost"/>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td align="center" class="graph">(дата)</td>
                                 <td align="center" class="graph">(подпись, инициалы, фамилия и должность уполномоченного работника склада)</td>
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
   <!--xsl:template match="do1r_in:Consignor | do1r_in:Consignee">
		<xsl:value-of select="cat_ru:OrganizationName"/><br/>
		<xsl:apply-templates select="cat_ru:Address"/><br/>
		<xsl:apply-templates select="cat_ru:BankInformation"/>
	</xsl:template>
	<xsl:template match="cat_ru:Address">
		<xsl:value-of select="cat_ru:StreetHouse"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:value-of select="cat_ru:City"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:if test="string(cat_ru:PostalCode)!=''"><xsl:value-of select="cat_ru:PostalCode"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
		<xsl:value-of select="cat_ru:CounryName"/>
	</xsl:template-->
   <!--xsl:template match="cat_ru:BankInformation">
		Cчет № : <xsl:value-of select="cat_ru:BankAccount"/>
	</xsl:template-->
</xsl:stylesheet>
