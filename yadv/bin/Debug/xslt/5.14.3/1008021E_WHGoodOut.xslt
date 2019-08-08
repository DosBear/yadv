<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="whgou cat_ru catWH_ru" version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:whgou="urn:customs.ru:Information:WarehouseDocuments:WHGoodOut:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
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
   <xsl:template name="say_document_kind">
      <xsl:param name="kind"/>
      <xsl:choose>
         <xsl:when test="$kind='DtRegistration'">
            Сведения о товарах из зарегистрированной ДТ
         </xsl:when>
         <xsl:when test="$kind='DtCancelation'">
            Сведения об отзыве ДТ
         </xsl:when>
         <xsl:when test="$kind='DtIssueProhibited'">
            Сведения об отказе в выпуске товаров по ДТ
         </xsl:when>
         <xsl:when test="$kind='DtIssueSuspended'">
            Сведения о продлении сроков выпуска по ДТ
         </xsl:when>
         <xsl:when test="$kind='DtGoodsChanged'">
            Сведения о товарах из изменнной ДТ
         </xsl:when>
         <xsl:when test="$kind='GoodOutDecision'">
            Уведомление о выпуске товаров по ДТ
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$kind"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="whgou:WHGoodOut">
      <html>
         <head>
            <title>Информация по товарам для владельца склада</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {background: #CCCCCC; font-size: 9pt;}
                    div.page {
                        width: 210mm;
                        margin: 10px auto;
                        padding: 5mm 10mm;
                        background: white;
                        border: solid 1px black;
                        page-break-after: always;
                    }
                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}
                    div.goods {background: white;}
                    .bordered {
                        border: solid 1px black;
                        padding-top: 4pt;
                        padding-bottom: 4pt;
                        font-family: Arial;
                        font-size: 9pt;
                        font-weight: bold;
                    }
                    .underlined {border-bottom: solid 0.8pt black;}
                    p.NumberDate {font-weight: bold;}
                    .graph {font-family: Arial; font-size: 7pt;}
                    .graphColumn {font-family: Arial; font-size: 6.5pt;}
                    .graphTitleIt {font-family: Arial; font-size: 7pt; font-style: italic;}
                    .graphMain {font-family: Arial; font-size: 9pt; font-weight: bold; }
                    .graphNum {font-family: Arial; font-size: 7pt; font-weight: bold;}
                    .graphNo {font-size: 7pt; font-weight: bold;}
                    h1{font-size: 12pt;}
                    table.addInfo {border-collapse: collapse; vertical-align: top;}
                    table.addInfo th {border: 1px solid black; background-color: LightGrey;}
                    table.addInfo td {border: 1px solid black; vertical-align: top;}
                    hr {border: 0; border-bottom: 1px solid black; margin: 0;}
                    .tr {border-right: 1px solid black;}
                    .tl {border-left: 1px solid black;}
                    .tb {border-bottom: 1px solid black;}
                    .tt {border-top: 1px solid black;}
                    .br {border-right: 2px solid black;}
                    .bl {border-left: 2px solid black;}
                    .bb {border-bottom: 2px solid black;}
                    .bt {border-top: 2px solid black;}
                    .db {border-bottom: 1px dashed black;}
                    .dl {border-left: 1px dashed black;}
                    .number {
                        text-align: center;
                        color: black;
                        font-size: 11pt;
                        font-weight: bold;
                        vertical-align: middle;
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                  <tbody>
                     <tr>
                        <td align="center" class="graphMain" style="width:180mm;">
                              <xsl:call-template name="say_document_kind">
                                 <xsl:with-param name="kind" select="whgou:DocumentKind"/>
                              </xsl:call-template>
								<br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphMain" style="width:180mm;">
                           <br/>
									Дата и время направления
									<u>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="whgou:SendDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="whgou:SendTime"/>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <br/>
									Сведения о документе: 
										<xsl:value-of select="whgou:ProduceDocuments/cat_ru:PrDocumentName"/>
                           <xsl:if test="whgou:ProduceDocuments/cat_ru:PrDocumentNumber">
											№ <xsl:value-of select="whgou:ProduceDocuments/cat_ru:PrDocumentNumber"/>
                           </xsl:if>
                           <xsl:if test="whgou:ProduceDocuments/cat_ru:PrDocumentDate">
											от 
											<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="whgou:ProduceDocuments/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </xsl:if>
                           <xsl:if test="whgou:ReleaseDate">
                              <br/>
                          Дата выпуска: <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="whgou:ReleaseDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           	Сведения о лицензии СВХ: 
									<xsl:choose>
                              <xsl:when test="whgou:SVHLicenceNumber/whgou:DocumentModeCode='1'">Лицензия </xsl:when>
                              <xsl:when test="whgou:SVHLicenceNumber/whgou:DocumentModeCode='2'">Свидетельство </xsl:when>
                           </xsl:choose>
                           <xsl:value-of select="whgou:SVHLicenceNumber/cat_ru:PrDocumentName"/>
                           <xsl:if test="whgou:SVHLicenceNumber/cat_ru:PrDocumentNumber">
											№ <xsl:value-of select="whgou:SVHLicenceNumber/cat_ru:PrDocumentNumber"/>
                           </xsl:if>
                           <xsl:if test="whgou:SVHLicenceNumber/cat_ru:PrDocumentDate">
											от 
											<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="whgou:SVHLicenceNumber/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </td>
                     </tr>
                     <xsl:if test="whgou:TotalPackageNumber">
						 <tr>
								<td class="graph" style="width:180mm;">
									<xsl:text>Общее количество мест товара: </xsl:text><xsl:value-of select="whgou:TotalPackageNumber"/>
								</td>
						 </tr>
                     </xsl:if>
                     <xsl:for-each select="whgou:DeliveryGoods">
                        <tr>
                           <td align="center" class="graphMain" style="width:180mm;">
                              <br/>
									Описание товаров <xsl:value-of select="position()"/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:180mm;">
                              <br/>
                              <u> Грузополучатель: </u>
                              <br/>
                              <xsl:for-each select="whgou:Consignee">
                                 <xsl:value-of select="cat_ru:OrganizationName"/>
                                 <xsl:if test="cat_ru:ShortName">
                                    <span class="graph">(</span>
                                    <xsl:value-of select="cat_ru:ShortName"/>
                                    <span class="graph">)</span>
                                 </xsl:if>
                                 <xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
                                    <br/>
                                    <xsl:text>№ </xsl:text>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">ИТН: 
												<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
													<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
													<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
													<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН: 
												<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:UNP">УНП:
													<xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:BIN">БИН:
													<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:IIN">ИИН:
													<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН:
													<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                                       <xsl:text> / КПП: </xsl:text>
                                       <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                 </xsl:if>
                                 <xsl:if test="catWH_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="catWH_ru:Address/cat_ru:PostalCode"/>,
											</xsl:if>
                                 <xsl:if test="catWH_ru:Address/cat_ru:CountryCode">
                                    <xsl:value-of select="catWH_ru:Address/cat_ru:CountryCode"/>,
											</xsl:if>
                                 <xsl:if test="catWH_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="catWH_ru:Address/cat_ru:Region"/>,
											</xsl:if>
                                 <xsl:if test="catWH_ru:Address/cat_ru:City">
                                    <xsl:value-of select="catWH_ru:Address/cat_ru:City"/>,
											</xsl:if>
                                 <xsl:if test="catWH_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="catWH_ru:Address/cat_ru:StreetHouse"/>,
											</xsl:if>
                                 <xsl:if test="catWH_ru:Address/catWH_ru:AddressLine">
                                    <xsl:value-of select="catWH_ru:Address/catWH_ru:AddressLine"/>
                                 </xsl:if>
                                 <xsl:if test="catWH_ru:IdentityCard">
                                    <br/>
											Документ, удостоверяющий личность получателя: 
											<xsl:apply-templates select="catWH_ru:IdentityCard"/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:180mm;">
                              <br/>
                              <u> Описание транспортного средства: </u>
                              <xsl:for-each select="whgou:Transport">
                                 <br/>
                                 <xsl:value-of select="position()"/>.
											Код вида транспорта: <xsl:value-of select="catWH_ru:TransportModeCode"/>,
											номер: <xsl:value-of select="catWH_ru:TransportIdentifier"/>,
											<xsl:choose>
                                    <xsl:when test="catWH_ru:Avia">
                                       <xsl:if test="catWH_ru:Avia/catWH_ru:FlightNumber">
														номер рейса: <xsl:value-of select="catWH_ru:Avia/catWH_ru:FlightNumber"/>,
													</xsl:if>
                                       <xsl:if test="catWH_ru:Avia/catWH_ru:FlightDate">
														дата рейса: 
														<xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="catWH_ru:Avia/catWH_ru:FlightDate"/>
                                          </xsl:call-template>,
													</xsl:if>
                                    </xsl:when>
                                    <xsl:when test="catWH_ru:Avto">
                                       <xsl:if test="catWH_ru:Avto/catWH_ru:TrailerIdentifier">
														номер прицепного транспортного средства: <xsl:value-of select="catWH_ru:Avto/catWH_ru:TrailerIdentifier"/>,
													</xsl:if>
                                       <xsl:if test="catWH_ru:Avto/catWH_ru:SecondTrailerIdentifier">
														номер второго прицепного транспортного средства: <xsl:value-of select="catWH_ru:Avto/catWH_ru:SecondTrailerIdentifier"/>,
													</xsl:if>
                                    </xsl:when>
                                    <xsl:when test="catWH_ru:RailRoad">
                                       <xsl:if test="catWH_ru:RailRoad/catWH_ru:RailStation">
														код станции отправления/назначения: <xsl:value-of select="catWH_ru:RailRoad/catWH_ru:RailStation"/>,
													</xsl:if>
                                    </xsl:when>
                                    <xsl:when test="catWH_ru:Sea">
                                       <xsl:if test="catWH_ru:Sea/catWH_ru:EntryNumber">
														номер прихода/ухода: <xsl:value-of select="catWH_ru:Sea/catWH_ru:EntryNumber"/>,
													</xsl:if>
                                       <xsl:if test="catWH_ru:Sea/catWH_ru:CountryCode">
														страна принадлежности судна: <xsl:value-of select="catWH_ru:Sea/catWH_ru:CountryCode"/>,
													</xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:180mm;">
                              <br/>
                              <u> Товар: </u>
                              <xsl:for-each select="whgou:GoodInfo">
                                 <br/>
                                 <xsl:value-of select="catWH_ru:GoodsNumber"/>.
											<xsl:if test="catWH_ru:GoodsTNVEDCode">
												код товара: <xsl:value-of select="catWH_ru:GoodsTNVEDCode"/>,
											</xsl:if>
                                 <xsl:if test="catWH_ru:InvoiceCost">
												фактурная стоимость: <xsl:value-of select="catWH_ru:InvoiceCost"/>
                                 </xsl:if>
                                 <xsl:if test="catWH_ru:CurrencyCode">
                                    <xsl:value-of select="catWH_ru:CurrencyCode"/>,
											</xsl:if>
                                 <xsl:for-each select="catWH_ru:GoodsDescription">
                                    <xsl:value-of select="."/>
                                    <xsl:text> </xsl:text>
                                 </xsl:for-each>
                                 <xsl:if test="catWH_ru:MPONumber">
												номер МПО: <xsl:value-of select="catWH_ru:MPONumber"/>,
											</xsl:if>
                                 <xsl:if test="catWH_ru:CargoPlace">
                                    <br/>
                                    <xsl:if test="catWH_ru:CargoPlace/catWH_ru:PlaceNumber">
													Количество грузовых мест: <xsl:value-of select="catWH_ru:CargoPlace/catWH_ru:PlaceNumber"/>,
												</xsl:if>
                                    <xsl:if test="catWH_ru:CargoPlace/catWH_ru:PackageCode">
													код вида упаковки: <xsl:value-of select="catWH_ru:CargoPlace/catWH_ru:PackageCode"/>,
												</xsl:if>
                                    <xsl:if test="catWH_ru:CargoPlace/catWH_ru:PlaceDescription">
													описание грузовых мест: <xsl:value-of select="catWH_ru:CargoPlace/catWH_ru:PlaceDescription"/>,
												</xsl:if>
                                 </xsl:if>
                                 <xsl:if test="catWH_ru:BruttoVolQuant">
                                    <br/>
												Вес брутто / объем: 
												<xsl:apply-templates select="catWH_ru:BruttoVolQuant"/>
                                 </xsl:if>
                                 <xsl:if test="catWH_ru:MeasureQuantity">
                                    <br/>
												Количество в дополнительных  единицах измерения: 
												<xsl:apply-templates select="catWH_ru:MeasureQuantity"/>
                                 </xsl:if>
                                 <xsl:if test="whgou:Container">
                                    <br/>
												Контейнеры: 
												<xsl:apply-templates select="whgou:Container"/>
                                 </xsl:if>
                                 <xsl:if test="whgou:TransportDoc">
                                    <br/>
												Транспортные документы:  
												<xsl:apply-templates select="whgou:TransportDoc"/>
                                 </xsl:if>
                                 <xsl:if test="whgou:GoodsGroupDescription">
									 <br/>
												Описание групп товаров одного наименования с отличающимися от других групп характеристиками:
												<xsl:for-each select="whgou:GoodsGroupDescription">
													<xsl:value-of select="position()"/><xsl:text>) </xsl:text>
													<xsl:for-each select="whgou:GoodsDescription">
														<xsl:value-of select="."/>
													</xsl:for-each>
													<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
												</xsl:for-each>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <xsl:if test="whgou:Comments">
                        <tr>
                           <td class="graph" style="width:180mm;">
									Комментарии: <xsl:value-of select="whgou:Comments"/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:180mm;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <br/>
                           <u> Должностное лицо таможенного органа: </u>
                           <xsl:value-of select="whgou:CustomsPerson/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:if test="whgou:CustomsPerson/cat_ru:LNP">ЛНП: 
								<xsl:value-of select="whgou:CustomsPerson/cat_ru:LNP"/>
                           </xsl:if>
                           <br/>
                           <u> Таможенный орган: </u>
                           <xsl:value-of select="whgou:Customs/cat_ru:Code"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="whgou:Customs/cat_ru:OfficeName"/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="catWH_ru:IdentityCard">
      <xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>
      <xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
      <xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
      <xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
      <!--xsl:apply-templates select="cat_ru:RBIdentificationNumber"/-->
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
      </xsl:call-template>
      <xsl:apply-templates select="RUScat_ru:OrganizationName"/>
   </xsl:template>
   <xsl:template match="catWH_ru:IdentityCard/*">
      <xsl:if test="preceding-sibling::*[1]">,</xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="catWH_ru:BruttoVolQuant | catWH_ru:MeasureQuantity">
		Количество товара: <xsl:value-of select="catWH_ru:GoodsQuantity"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="catWH_ru:MeasureUnitQualifierName"/>,
		код единицы измерения: <xsl:value-of select="catWH_ru:MeasureUnitQualifierCode"/>
   </xsl:template>
   <xsl:template match="whgou:Container">
      <xsl:value-of select="catWH_ru:ContainerNumber"/>
      <xsl:if test="catWH_ru:GrossWeightQuantity">
			(<xsl:value-of select="catWH_ru:GrossWeightQuantity"/> кг ); 
		</xsl:if>
   </xsl:template>
   <xsl:template match="whgou:TransportDoc">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <xsl:if test="cat_ru:PrDocumentDate">
			от 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>; 
	</xsl:template>
</xsl:stylesheet>

