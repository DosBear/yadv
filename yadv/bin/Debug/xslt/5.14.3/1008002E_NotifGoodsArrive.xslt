<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:nga="urn:customs.ru:Information:WarehouseDocuments:NotifGoodsArrive:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
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
   <xsl:template match="nga:NotifGoodsArrive">
	   <xsl:variable name="docSign">
			<xsl:if test="nga:DocSign = '0'">о прибытии</xsl:if>
			<xsl:if test="nga:DocSign = '1'">об отправке</xsl:if>
	   </xsl:variable> 
      <html>
         <head>
            <title>Уведомление <xsl:value-of select="$docSign"/> товарной партии</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 210mm;
						height: 297mm;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding:	10mm;
						padding-left:	20mm;
						background: #ffffff;
						border: solid 1pt #000000;
						}
						
					.bordered {
						border: solid 1pt #000000;
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						
					.underlined {
						border-bottom: solid 0.8pt #000000;
						}
						
					p.NumberDate {
						font-weight: bold;
						}
						
					.graph {
						font-family: Arial;
						font-size: 8pt;
						}
					td {
						font-family:Courier;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						
						.graphNo {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <h2>Уведомление <xsl:value-of select="$docSign"/> товарной партии
						<xsl:if test="nga:NotifDate">
							от 
							<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="nga:NotifDate"/>
                     </xsl:call-template>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="substring(nga:NotifTime,1, 8)"/>
                  </xsl:if>
               </h2>
               <br/>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graphNo" style="width:120mm;">
									Регистрационный номер таможенного документа:
								</td>
                        <td class="graph" style="width:60mm;">
                           <xsl:value-of select="nga:GTDNumber/cat_ru:CustomsCode"/>
                           <xsl:text>/</xsl:text>
                           <xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="nga:GTDNumber/cat_ru:RegistrationDate"/>
                           </xsl:call-template>
                           <xsl:text>/</xsl:text>
                           <xsl:value-of select="nga:GTDNumber/cat_ru:GTDNumber"/>
                           <xsl:if test="nga:GTDNumber/nga:NumberGoodsPart">
							   <xsl:text>/</xsl:text>
							   <xsl:value-of select="nga:GTDNumber/nga:NumberGoodsPart"/>
                           </xsl:if>
                        </td>
                     </tr>
					<xsl:if test="nga:ChangeSign">
						 <tr>
							<td class="graphNo" style="width:120mm;">
										Признак необходимости подачи изменений к ПТД:
							</td>
							<td class="graph" style="width:60mm;">
								<xsl:choose>
									<xsl:when test="nga:ChangeSign = '1' or nga:ChangeSign = 'true' or nga:ChangeSign = 't' or nga:ChangeSign = 'TRUE'">изменения требуются</xsl:when>
									<xsl:otherwise>изменения не требуются</xsl:otherwise>
								</xsl:choose>
							</td>
						 </tr>
					</xsl:if>
                     <tr>
                        <td class="graphNo" style="width:90mm;">
										Таможенный орган:
									</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="nga:Customs/cat_ru:Code"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="nga:Customs/cat_ru:OfficeName">
                              <xsl:value-of select="nga:Customs/cat_ru:OfficeName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo"> Декларант </span>
                           <xsl:apply-templates select="nga:Declarant"/>
                        </td>
                     </tr>
                     <!--xsl:if test="nga:Carrier">
							<tr>
								<td style="width:180mm;" class="graph" colspan="2">
									<span class="graphNo"> Перевозчик </span>
									<xsl:apply-templates select="nga:Carrier"/>
								</td>
							</tr>
							</xsl:if-->
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo"> Местонахождение товаров </span>
                           <br/>
                           <xsl:apply-templates select="nga:GoodsLoadingPlace "/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo"> Транспортные средства </span>
                           <br/>
                           <table border="1" cellpadding="3" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" style="width:50mm;">№ основного ТС</td>
                                    <td align="center" class="graph" style="width:50mm;">Тип транспорта</td>
                                    <td align="center" class="graph" style="width:50mm;">Дополнительные сведения о ТС</td>
                                    <td align="center" class="graph" style="width:30mm;">Код вида ТС</td>
                                 </tr>
                                 <xsl:apply-templates select="nga:ArriveShipment/nga:ArriveTransportMeans"/>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <xsl:if test="nga:ArriveShipment/nga:ContainerInformation">
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <span class="graphNo"> Контейнеры: </span>
                              <xsl:for-each select="nga:ArriveShipment/nga:ContainerInformation">
                                 <xsl:value-of select="catWH_ru:ContainerNumber"/>
                                 <xsl:text>, </xsl:text>
                              </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:if>
                     <!--							<tr>
								<td style="width:180mm;" class="graph" colspan="2">
									<span class="graphNo">Товары: </span><br/>
									<xsl:apply-templates select="nga:ArriveShipment/nga:ArriveGoods"/>
								</td>
							</tr>-->
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <xsl:if test="nga:ArriveShipment/nga:ArriveTransportDoc">
                              <span class="graphNo">Транспортные документы</span>
                              <br/>
                              <table border="1" cellpadding="6" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                       <td align="center" class="graph" style="width:50mm;">Номер</td>
                                       <td align="center" class="graph" style="width:50mm;">Дата</td>
                                       <td align="center" class="graph" style="width:30mm;">Код вида документа</td>
                                    </tr>
                                    <xsl:for-each select="nga:ArriveShipment/nga:ArriveTransportDoc">
                                       <tr>
                                          <td align="center" class="graph" style="width:50mm;">
                                             <xsl:if test="cat_ru:PrDocumentName">
                                                <xsl:value-of select="cat_ru:PrDocumentName"/>
                                             </xsl:if>
                                          </td>
                                          <td align="center" class="graph" style="width:50mm;">
                                             <xsl:if test="cat_ru:PrDocumentNumber">
                                                <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                             </xsl:if>
                                          </td>
                                          <td align="center" class="graph" style="width:50mm;">
                                             <xsl:if test="cat_ru:PrDocumentDate">
                                                <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                </xsl:call-template>
                                             </xsl:if>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="catWH_ru:PresentedDocumentModeCode"/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <xsl:if test="nga:ArriveShipment/nga:ArriveCustomsDoc">
                              <span class="graphNo">Таможенные документы</span>
                              <br/>
                              <table border="1" cellpadding="6" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                       <td align="center" class="graph" style="width:50mm;">Номер</td>
                                       <td align="center" class="graph" style="width:50mm;">Дата</td>
                                       <td align="center" class="graph" style="width:30mm;">Код вида документа</td>
                                    </tr>
                                    <xsl:for-each select="nga:ArriveShipment/nga:ArriveCustomsDoc">
                                       <tr>
                                          <td align="center" class="graph" style="width:50mm;">
                                             <xsl:if test="cat_ru:PrDocumentName">
                                                <xsl:value-of select="cat_ru:PrDocumentName"/>
                                             </xsl:if>
                                          </td>
                                          <td align="center" class="graph" style="width:50mm;">
                                             <xsl:if test="cat_ru:PrDocumentNumber">
                                                <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                             </xsl:if>
                                          </td>
                                          <td align="center" class="graph" style="width:50mm;">
                                             <xsl:if test="cat_ru:PrDocumentDate">
                                                <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                </xsl:call-template>
                                             </xsl:if>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="catWH_ru:PresentedDocumentModeCode"/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                     <td class="graph" colspan="2" style="width:180mm;">
                           <xsl:if test="nga:ArriveShipment/nga:CommercialDoc">
                              <span class="graphNo">Коммерческие документы</span>
                              <br/>
                              <table border="1" cellpadding="6" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                       <td align="center" class="graph" style="width:50mm;">Номер</td>
                                       <td align="center" class="graph" style="width:50mm;">Дата</td>
                                       <td align="center" class="graph" style="width:30mm;">Код вида документа</td>
                                    </tr>
                                    <xsl:for-each select="nga:ArriveShipment/nga:CommercialDoc">
                                       <tr>
                                          <td align="center" class="graph" style="width:50mm;">
                                             <xsl:if test="cat_ru:PrDocumentName">
                                                <xsl:value-of select="cat_ru:PrDocumentName"/>
                                             </xsl:if>
                                          </td>
                                          <td align="center" class="graph" style="width:50mm;">
                                             <xsl:if test="cat_ru:PrDocumentNumber">
                                                <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                             </xsl:if>
                                          </td>
                                          <td align="center" class="graph" style="width:50mm;">
                                             <xsl:if test="cat_ru:PrDocumentDate">
                                                <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                </xsl:call-template>
                                             </xsl:if>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="catWH_ru:PresentedDocumentModeCode"/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">Товары: </span>
                           <br/>
                           <xsl:if test="nga:GTDNumber/nga:NumberGoodsPart">
                           Номер товарной партии: <xsl:value-of select="nga:GTDNumber/nga:NumberGoodsPart"/>
                           <br/>
                           </xsl:if>
                           <xsl:apply-templates select="nga:ArriveShipment/nga:ArriveGoods"/>
                        </td>
                     </tr>
                     <!--	<tr>
								<td style="width:90mm;" class="graphNo">
										Таможенный орган:
									</td>
								<td style="width:90mm;" class="graph">
										<xsl:value-of select="nga:Customs/cat_ru:Code"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="nga:Customs/cat_ru:OfficeName">
										<xsl:value-of select="nga:Customs/cat_ru:OfficeName"/>
										</xsl:if>
								</td>
							</tr>-->
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="nga:Declarant | nga:Carrier ">
      <xsl:value-of select="./cat_ru:OrganizationName"/>
      <xsl:if test="./cat_ru:ShortName">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:value-of select="./cat_ru:ShortName"/>)
		</xsl:if>
      <br/>
      <xsl:if test="./catWH_ru:Address">
         <xsl:apply-templates select="./catWH_ru:Address"/>
      </xsl:if>
      <br/>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
										ОГРН 
										<xsl:value-of select="./cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:INN">
										ИНН 
										<xsl:value-of select="./cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										КПП 
										<xsl:value-of select="./cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
      </xsl:if>
      <br/>
      <xsl:if test="./catWH_ru:IdentityCard">
         <xsl:apply-templates select="catWH_ru:IdentityCard"/>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="catWH_ru:Address">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="catWH_ru:Address/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="catWH_ru:IdentityCard">
      <!--<xsl:apply-templates/>-->
      <xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>
      <xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
      <xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
      <xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
      <xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
      </xsl:call-template>
      <xsl:apply-templates select="RUScat_ru:OrganizationName"/>
   </xsl:template>
   <xsl:template match="catWH_ru:IdentityCard/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="nga:GoodsLoadingPlace ">
	Код таможенного органа, в зоне деятельности которого находятся товары
	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="./catWH_ru:CustomsCode"/>
      <br/>
      <xsl:if test="./catWH_ru:Warehouse">
         <xsl:value-of select="./catWH_ru:Warehouse/cat_ru:OrganizationName"/>
         <xsl:if test="./catWH_ru:Warehouse/cat_ru:ShortName">
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:value-of select="./catWH_ru:Warehouse/cat_ru:ShortName"/>)
		</xsl:if>
         <br/>
         <xsl:if test="./catWH_ru:Warehouse/catWH_ru:Address">
            <xsl:apply-templates select="./catWH_ru:Warehouse/catWH_ru:Address"/>
         </xsl:if>
         <br/>
         <xsl:if test="./catWH_ru:Warehouse/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
										ОГРН 
										<xsl:value-of select="./catWH_ru:Warehouse/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
         </xsl:if>
         <xsl:if test="./catWH_ru:Warehouse/cat_ru:RFOrganizationFeatures/cat_ru:INN">
										ИНН 
										<xsl:value-of select="./catWH_ru:Warehouse/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
         </xsl:if>
         <xsl:if test="./catWH_ru:Warehouse/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										КПП 
										<xsl:value-of select="./catWH_ru:Warehouse/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
         </xsl:if>
         <br/>
         <xsl:if test="./catWH_ru:Warehouse/catWH_ru:IdentityCard">
            <xsl:apply-templates select="./catWH_ru:Warehouse/catWH_ru:IdentityCard"/>
            <br/>
         </xsl:if>	
			
			Свидетельство о включении в Реестр / Лицензия № <xsl:value-of select="./catWH_ru:Warehouse/catWH_ru:CertificateNumber"/>
         <xsl:if test="./catWH_ru:Warehouse/catWH_ru:CertificateDate">
									от
				<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="./catWH_ru:Warehouse/catWH_ru:CertificateDate"/>
            </xsl:call-template>
         </xsl:if>
      </xsl:if>
      <xsl:if test="./catWH_ru:OtherLoadingPlace">
         <xsl:if test="./catWH_ru:OtherLoadingPlace/catWH_ru:GoodsLocationPlaceDesc">
            <xsl:value-of select="./catWH_ru:OtherLoadingPlace/catWH_ru:GoodsLocationPlaceDesc"/>
         </xsl:if>
         <xsl:if test="./catWH_ru:OtherLoadingPlace/catWH_ru:RailwayStationCode">
				Код ж/д станции <xsl:value-of select="./catWH_ru:OtherLoadingPlace/catWH_ru:RailwayStationCode"/>
         </xsl:if>
         <xsl:if test="./catWH_ru:OtherLoadingPlace/catWH_ru:RailwayStationName">
				Название ж/д станции <xsl:value-of select="./catWH_ru:OtherLoadingPlace/catWH_ru:RailwayStationName"/>
         </xsl:if>
         <br/>
         <xsl:apply-templates select="./catWH_ru:OtherLoadingPlace/catWH_ru:Address"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="nga:ArriveTransportMeans">
      <xsl:for-each select=".">
         <tr>
            <td align="center" class="graph" style="width:50mm;">
               <xsl:value-of select="catWH_ru:TransportIdentifier"/>
            </td>
            <td align="center" class="graph" style="width:30mm;">
               <xsl:choose>
                  <xsl:when test="catWH_ru:Avto">Автотранспорт</xsl:when>
                  <xsl:when test="catWH_ru:Avia">Авиатранспорт</xsl:when>
                  <xsl:when test="catWH_ru:RailRoad">Ж/д транспорт</xsl:when>
                  <xsl:when test="catWH_ru:Sea">Водный транспорт</xsl:when>
               </xsl:choose>
            </td>
            <td align="center" class="graph" style="width:70mm;">
               <xsl:if test="catWH_ru:Avto">
                  <xsl:if test="catWH_ru:Avto/catWH_ru:TrailerIdentifier">
					Номер прицепа:
						<xsl:value-of select="catWH_ru:Avto/catWH_ru:TrailerIdentifier"/> </xsl:if>
                  <xsl:if test="catWH_ru:Avto/catWH_ru:SecondTrailerIdentifier">
					Номер второго прицепа:
						<xsl:value-of select="catWH_ru:Avto/catWH_ru:SecondTrailerIdentifier"/>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="catWH_ru:Avia">
                  <xsl:if test="catWH_ru:Avia/catWH_ru:FlightNumber">№ рейса:<xsl:value-of select="catWH_ru:Avia/catWH_ru:FlightNumber"/> </xsl:if>
                  <xsl:if test="catWH_ru:Avia/catWH_ru:FlightDate">Дата рейса:<xsl:value-of select="catWH_ru:Avia/catWH_ru:FlightDate"/>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="catWH_ru:RailRoad/catWH_ru:RailStation">
					Код станции отправления:
						<xsl:value-of select="catWH_ru:RailRoad/catWH_ru:RailStation"/>
               </xsl:if>
               <xsl:if test="catWH_ru:Sea">
                  <xsl:if test="catWH_ru:Sea/catWH_ru:EntryNumber">
						Номер прихода\ухода:
						<xsl:value-of select="catWH_ru:Sea/catWH_ru:EntryNumber"/> </xsl:if>
                  <xsl:if test="catWH_ru:Sea/catWH_ru:CountryCode">Страна принадлежности судна:
						<xsl:value-of select="catWH_ru:Sea/catWH_ru:CountryCode"/> </xsl:if>
                  <xsl:if test="catWH_ru:Sea/catWH_ru:Captain">Капитан:
						<xsl:value-of select="catWH_ru:Sea/catWH_ru:Captain/cat_ru:PersonSurname"/> 
						<xsl:value-of select="catWH_ru:Sea/catWH_ru:Captain/cat_ru:PersonName"/> 
						<xsl:value-of select="catWH_ru:Sea/catWH_ru:Captain/cat_ru:PersonMiddleName"/>
                  </xsl:if>
               </xsl:if>
            </td>
            <td align="center" class="graph" style="width:30mm;">
               <xsl:value-of select="./catWH_ru:TransportModeCode"/>
            </td>
         </tr>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="nga:ArriveGoods ">
Товар №<xsl:value-of select="./cat_ru:GoodsNumeric"/>. 
<table border="1" cellpadding="3" cellspacing="0" width="100%">
         <tbody>
            <tr>
               <td align="center" class="graph" style="width:20mm;">Код ТН ВЭД ЕАЭС</td>
               <td align="center" class="graph" style="width:30mm;">Описание</td>
               <td align="center" class="graph" style="width:20mm;">Вес нетто (кг)</td>
               <td align="center" class="graph" style="width:20mm;">Вес брутто (кг)</td>
               <td align="center" class="graph" style="width:30mm;">Фактурная стоимость/ цена товара</td>
               <td align="center" class="graph" style="width:30mm;">Объем товара</td>
               <td align="center" class="graph" style="width:30mm;">Кол-во в деи</td>
            </tr>
            <tr>
               <td align="center" class="graph" style="width:20mm;">
                  <xsl:value-of select="./cat_ru:GoodsTNVEDCode"/>
               </td>
               <td align="center" class="graph" style="width:30mm;">
                  <xsl:for-each select="./cat_ru:GoodsDescription">
                     <xsl:value-of select="."/>
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="width:20mm;">
                  <xsl:if test="cat_ru:NetWeightQuantity">
                     <xsl:value-of select="cat_ru:NetWeightQuantity"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="width:20mm;">
                  <xsl:if test="cat_ru:GrossWeightQuantity">
                     <xsl:value-of select="cat_ru:GrossWeightQuantity"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="width:30mm;">
                  <xsl:if test="nga:InvoicedCost">
                     <xsl:value-of select="nga:InvoicedCost"/>
                     <xsl:if test="nga:ContractCurrencyCode">
                        <xsl:value-of select="nga:ContractCurrencyCode"/>
                     </xsl:if>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="width:30mm;">
                  <xsl:if test="nga:Volume">
                     <xsl:value-of select="./nga:Volume/catWH_ru:GoodsQuantity"/>
                     <xsl:if test="./nga:Volume/catWH_ru:MeasureUnitQualifierName">
                        <xsl:value-of select="./nga:Volume/catWH_ru:MeasureUnitQualifierName"/>
                     </xsl:if>
                     <xsl:if test="./nga:Volume/catWH_ru:MeasureUnitQualifierCode">
																	(<xsl:value-of select="./nga:Volume/catWH_ru:MeasureUnitQualifierCode"/>)
																</xsl:if>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="width:30mm;">
                  <xsl:for-each select="nga:SupplementaryQuantity">
                     <xsl:value-of select="catWH_ru:GoodsQuantity"/>
                     <xsl:if test="./catWH_ru:MeasureUnitQualifierName">
                        <xsl:value-of select="./catWH_ru:MeasureUnitQualifierName"/>
                     </xsl:if>
                     <xsl:if test="./catWH_ru:MeasureUnitQualifierCode">
																	(<xsl:value-of select="./catWH_ru:MeasureUnitQualifierCode"/>)
																</xsl:if>
                  </xsl:for-each>
               </td>
            </tr>
         </tbody>
      </table>
      <xsl:if test="nga:ArrivePackingInformation">	
		Информация об упаковках										
	<table border="1" cellpadding="3" cellspacing="0" width="100%">
            <tbody>
               <tr>
                  <td align="center" class="graph" style="width:10mm;">Код наличия упаковки</td>
                  <td align="center" class="graph" style="width:10mm;">Кол-во грузовых мест, полностью занятых товаром</td>
                  <td align="center" class="graph" style="width:10mm;">Кол-во грузовых мест, частично занятых товаром</td>
                  <td align="center" class="graph" style="width:50mm;">Информация об упаковках</td>
                  <td align="center" class="graph" style="width:50mm;">Информация о паллетах и поддонах</td>
                  <td align="center" class="graph" style="width:50mm;">Сведения о виде груза (при перевозе товара без упаковки)</td>
               </tr>
               <tr>
                  <td align="center" class="graph" style="width:10mm;">
                     <xsl:if test="nga:ArrivePackingInformation/nga:PakageTypeCode">
                        <xsl:value-of select="nga:ArrivePackingInformation/nga:PakageTypeCode"/>
                     </xsl:if>
                  </td>
                  <td align="center" class="graph" style="width:10mm;">
                     <xsl:if test="nga:ArrivePackingInformation/nga:PakageQuantity">
                        <xsl:value-of select="nga:ArrivePackingInformation/nga:PakageQuantity"/>
                     </xsl:if>
                  </td>
                  <td align="center" class="graph" style="width:10mm;">
                     <xsl:if test="nga:ArrivePackingInformation/nga:PakagePartQuantity">
                        <xsl:value-of select="nga:ArrivePackingInformation/nga:PakagePartQuantity"/>
                     </xsl:if>
                  </td>
                  <td align="center" class="graph" style="width:50mm;">
                     <xsl:for-each select="nga:ArrivePackingInformation/nga:PackingInformation">
																				Код вида упаковки
																						<xsl:value-of select="catWH_ru:PakingQuantity"/>
                        <xsl:if test="catWH_ru:PakingQuantity">
																					Кол-во
																						<xsl:value-of select="catWH_ru:PakingQuantity"/>
                        </xsl:if>	
																				;<br/>
                     </xsl:for-each>
                  </td>
                  <td align="center" class="graph" style="width:50mm;">
                     <xsl:for-each select="nga:ArrivePackingInformation/nga:Pallete">
																				Кол-во
																						<xsl:value-of select="catWH_ru:PalleteQuantity"/>
                        <xsl:if test="catWH_ru:PalleteDescription">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="catWH_ru:PalleteDescription"/>
                        </xsl:if>
																				;<br/>
                     </xsl:for-each>
                  </td>
                  <td align="center" class="graph" style="width:50mm;">
                     <xsl:for-each select="nga:ArrivePackingInformation/nga:Cargo">
																				Код вида упаковки
																						<xsl:value-of select="catWH_ru:PackingCode"/>
                        <xsl:if test="catWH_ru:PakingQuantity">
																					Кол-во
																						<xsl:value-of select="catWH_ru:PakingQuantity"/>
                        </xsl:if>	
																				;<br/>
                     </xsl:for-each>
                  </td>
               </tr>
            </tbody>
         </table>
      </xsl:if>
      <!--xsl:if test="ArriveShipment/nga:ContainerInformation">										
	Информация о контейнерах:			
	<xsl:for-each select="ArriveShipment/nga:ContainerInformation">			
	№ <xsl:value-of select="catWH_ru:ContainerNumber"/> 
	<xsl:text disable-output-escaping="yes">, </xsl:text>
	<Признак заполнения контейнера:<xsl:if test="./catWH_ru:FullIndicator">
																	<xsl:value-of select="./catWH_ru:FullIndicator"/>
																</xsl:if>
	<br/>	
	</xsl:for-each>		
	</xsl:if-->
      <!--xsl:if test="ArriveShipment/nga:ArriveTransportDoc">	
Транспортные документы
<table width="100%" cellpadding="6" cellspacing="0" border="1">
													<tbody>
														<tr>
															<td style="width:50mm;" class="graph" align="center">Наименование</td>
															<td style="width:50mm;" class="graph" align="center">Номер</td>
															<td style="width:50mm;" class="graph" align="center">Дата</td>
															<td style="width:30mm;" class="graph" align="center">Код вида документа</td>
														</tr>
<xsl:for-each select="ArriveShipment/nga:ArriveTransportDoc">
														<tr>
															<td style="width:50mm;" class="graph" align="center">
																<xsl:if test="cat_ru:PrDocumentName">
																	<xsl:value-of select="cat_ru:PrDocumentName"/>
																</xsl:if>
															</td>
															<td style="width:50mm;" class="graph" align="center">
																<xsl:if test="cat_ru:PrDocumentNumber">
																	<xsl:value-of select="cat_ru:PrDocumentNumber"/>
																</xsl:if>
															</td>
															<td style="width:50mm;" class="graph" align="center">
																<xsl:if test="cat_ru:PrDocumentDate">
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
																</xsl:call-template>
																</xsl:if>
															</td>
															<td style="width:30mm;" class="graph" align="center">
																<xsl:value-of select="catWH_ru:PresentedDocumentModeCode"/>
															</td>
														</tr>
</xsl:for-each>


													</tbody>
												</table>	
</xsl:if-->
      <!--
<xsl:if test="nga:ArrivePackingInformation">
	Информация об упаковках: 
	<xsl:for-each select="nga:ArrivePackingInformation">
		<xsl:if test="./nga:PakageTypeCode">
			Код наличия упаковки-<xsl:value-of select="./nga:PakageTypeCode"/>
		</xsl:if>
		<xsl:if test="./nga:PakageQuantity">
			<xsl:value-of select="./nga:PakageQuantity"/>
		</xsl:if>
		<xsl:if test="./nga:PakagePartQuantity">
			<xsl:value-of select="./nga:PakagePartQuantity"/>
		</xsl:if>
		<br/>
	<xsl:if test="./nga:PackingInformation">	
		Информация об упаковках:
		<xsl:for-each select="./nga:PackingInformation">
			Код вида упаковки <xsl:value-of select="./catWH_ru:PackingCode"/>
			<xsl:if test="./catWH_ru:PakingQuantity">
				Количество упаковок <xsl:value-of select="./catWH_ru:PakageQuantity"/>
			</xsl:if>
		</xsl:for-each>
		<br/>	
	</xsl:if>
	<xsl:if test="./nga:Cargo">	
		Сведения о виде груза (при перевозе товара без упаковки):
		<xsl:for-each select="./nga:Cargo">
			Код вида упаковки <xsl:value-of select="./catWH_ru:PackingCode"/>
			<xsl:if test="./catWH_ru:PakingQuantity">
				Количество упаковок <xsl:value-of select="./catWH_ru:PakageQuantity"/>
			</xsl:if>
		</xsl:for-each>
		<br/>	
	</xsl:if>
	<xsl:if test="./nga:Pallete">	
		Информация о паллетах и поддонах:
		<xsl:for-each select="./nga:Pallete">
			Количество поддонов <xsl:value-of select="./catWH_ru:PalleteQuantity"/>
			<xsl:if test="./catWH_ru:PalleteDescription">
				Описание поддонов <xsl:value-of select="./catWH_ru:PalleteDescription"/>
			</xsl:if>
		</xsl:for-each>
		<br/>	
	</xsl:if>
	
	
	</xsl:for-each>
</xsl:if>-->
   </xsl:template>
</xsl:stylesheet>
