<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cgms="urn:customs.ru:Information:TransportDocuments:Air:CargoManifest:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dategtd"/>
      <xsl:choose>
         <xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
            <xsl:value-of select="substring($dategtd,9,2)"/>
            <xsl:value-of select="substring($dategtd,6,2)"/>
            <xsl:value-of select="substring($dategtd,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dategtd"/>
         </xsl:otherwise>
      </xsl:choose>
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
   <xsl:template match="cgms:CargoManifest">
      <html>
         <head>
            <title>Грузовая ведомость / CARGO MANIFEST</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
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
							font-family:Courier;
							}
						.normal{
							font-weight: normal;
							font-family:Courier;
							}
						.bold{
							font-weight: bold;
							font-family:Courier;
							}
						.italic{
							font-style: italic;
							font-family:Courier;
							}
							.graph {
						font-family: Arial;
						font-size: 8pt;
						}
					.graphMain {
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}			
					</style>
         </head>
         <body>
            <div class="page">
               <table border="0">
                  <tbody>
                     <tr>
                        <td align="center" colspan="38">
                           <span style="font-weight:bold;  ">CARGO MANIFEST<br/>ГРУЗОВАЯ ВЕДОМОСТЬ<br/>
                              <br/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" colspan="10">
                           <span class="graph">OPERATOR<br/>Наименование перевозчика</span>
                        </td>
                        <td align="left" class="graphMain" colspan="12" valign="middle">
                           <xsl:if test="cgms:CarrierName">
                              <xsl:value-of select="cgms:CarrierName"/>
                              <xsl:text>, </xsl:text>
                           </xsl:if>
                           <xsl:value-of select="cgms:CarrierCode"/>
                        </td>
                        <td align="right" class="graph" colspan="8"> Дата составления манифеста:   </td>
                        <td align="left" class="graphMain" colspan="8">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="cgms:ManifestDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr style="height:4mm">
                        <br/>
                     </tr>
                     <tr>
                        <td align="left" colspan="10">
                           <span class="graph">AIRCRAFT<br/>Марка,рег.  номер воздушного судна</span>
                        </td>
                        <td align="left" class="graphMain" colspan="8" valign="middle">
                           <xsl:if test="cgms:FlightInfo/catTrans_ru:Mark">
                              <xsl:value-of select="cgms:FlightInfo/catTrans_ru:Mark"/>
                              <xsl:text>, </xsl:text>
                           </xsl:if>
                           <xsl:value-of select="cgms:FlightInfo/catTrans_ru:AirPlaneRegNum"/>
                        </td>
                        <td align="right" colspan="3">
                           <span class="graph">FLIGHT  <br/>Рейс  </span>
                        </td>
                        <td align="left" class="graphMain" colspan="3">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="cgms:FlightInfo/catTrans_ru:FlightNumber"/>
                        </td>
                        <td align="right" colspan="6">
                           <span class="graph">DATE/TIME <br/>Дата/время рейса</span>
                        </td>
                        <td align="left" class="graphMain" colspan="8">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="cgms:FlightInfo/catTrans_ru:FlightDate"/>
                           </xsl:call-template>
                           <xsl:if test="cgms:FlightInfo/catTrans_ru:FlightTime">
                              <xsl:text> / </xsl:text>
                              <xsl:value-of select="cgms:FlightInfo/catTrans_ru:FlightTime"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr style="height:4mm">
                        <br/>
                     </tr>
                     <td align="left" colspan="10">
                        <span class="graph">FROM<br/>Аэропорт вылета</span>
                     </td>
                     <td align="left" class="graphMain" colspan="12" valign="middle">
                        <xsl:if test="cgms:FlightInfo/catTrans_ru:DepartureAirport/catTrans_ru:Name">
                           <xsl:value-of select="cgms:FlightInfo/catTrans_ru:DepartureAirport/catTrans_ru:Name"/>
                           <xsl:text>, </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="cgms:FlightInfo/catTrans_ru:DepartureAirport/catTrans_ru:IATACode"/>
                     </td>
                     <td align="right" colspan="8">
						 <span class="graph">Признак NIL-манифеста </span>
                     </td>
                     <td align="left" class="graphMain" colspan="8">
						<xsl:choose>
							<xsl:when test="cgms:IsNilCargo='0' or cgms:IsNilCargo='false'"> нет</xsl:when>
							<xsl:when test="cgms:IsNilCargo='1' or cgms:IsNilCargo='true'"> да</xsl:when>
						</xsl:choose>
                     </td>
                     <tr style="height:4mm">
                        <br/>
                     </tr>
                  </tbody>
               </table>
               <hr size="1"/>
               <br/>
               <br/>
               <xsl:if test="cgms:DestinationInfo">
				   <xsl:for-each select="cgms:DestinationInfo">
                  <table border="0" cellpadding="4pt" cellspacing="0">
                     <tbody>
                        <tr>
                           <td align="left" colspan="10">
									UNLOAD<br/>Аэропорт разгрузки
										</td>
                           <td align="left" class="bold" colspan="28" valign="middle">
                              <xsl:if test="cgms:DestinationAirport/catTrans_ru:Name">
                                 <xsl:value-of select="cgms:DestinationAirport/catTrans_ru:Name"/>
                                 <xsl:text>, </xsl:text>
                              </xsl:if>
                              <xsl:value-of select="cgms:DestinationAirport/catTrans_ru:IATACode"/>
                           </td>
                           <td colspan="150">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <br/>
                  <xsl:if test="cgms:BulkGargo">
                     <table border="1" cellpadding="4pt" cellspacing="0" style="empty-cells: show;">
                        <tbody>
                           <tr>
                              <td align="center" class="bold" colspan="8">BULK LOADED / Погружено навалом</td>
                           </tr>
                           <tr align="left">
                              <td class="graph" style="width:30mm" valign="top">Air Waybill Num.<br/>Номер накладной</td>
                              <td class="graph" style="width:15mm" valign="top">Num of <br/>packages<br/>Кол-во <br/>упаковок</td>
                              <td class="graph" style="width:25mm" valign="top"> Nature of goods<br/>Описание товара</td>
                              <td class="graph" style="width:20mm" valign="top">Gross weight<br/>Вес брутто</td>
                              <td class="graph" style="width:25mm" valign="top">FROM-TO<br/>а/п отправл.- назнач.</td>
                              <td class="graph" style="width:35mm" valign="top">For official use<br/>Для служебных отметок</td>
                              <td class="graph" style="width:35mm" valign="top">GTD<br/>Сведения о декларации на товары</td>
                              <td class="graph" style="width:20mm" valign="top">Remark<br/>Примечания</td>
                           </tr>
                           <xsl:for-each select="cgms:BulkGargo">
                              <tr>
                                 <td class="graphMain" style="width:30mm" valign="top">
                                    <xsl:if test="catTrans_ru:AirlineIATACode">
                                       <xsl:value-of select="catTrans_ru:AirlineIATACode"/>
                                       <xsl:text>-</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select="catTrans_ru:DocumentNumber"/>
                                 </td>
                                 <td class="graphMain" style="width:15mm" valign="top">
                                    <xsl:value-of select="cgms:PlacesQuantity"/>
                                 </td>
                                 <td class="graphMain" style="width:25mm" valign="top">
                                    <xsl:value-of select="cgms:GoodsDescription"/>
                                    <xsl:if test="cgms:GoodsCommodityCode">
													 (Код ТН ВЭД ЕАЭС 
													<xsl:value-of select="cgms:GoodsCommodityCode"/>
													<xsl:text>)</xsl:text>
												</xsl:if>
                                    <br/>
                                    <br/>
                                    <xsl:if test="cgms:VolumeInfo">
                                       <span class="graphLittle">Volume/Общий объем:</span>
                                       <span class="graph8Bold">
                                          <xsl:value-of select="cgms:VolumeInfo/cgms:GoodsVolume"/>
                                          <xsl:text>(</xsl:text>
                                          <xsl:value-of select="cgms:VolumeInfo/cgms:VolumeUnitQualifierCode"/>
                                          <xsl:if test="cgms:VolumeInfo/cgms:VolumeUnitQualifierName">
                                             <xsl:text>,</xsl:text>
                                             <xsl:value-of select="cgms:VolumeInfo/cgms:VolumeUnitQualifierName"/>
                                          </xsl:if>
                                          <xsl:text>)</xsl:text>
                                          <br/>
                                          <br/>
                                       </span>
                                    </xsl:if>
                                    <xsl:if test="cgms:DimensionsInfo">
                                       <span class="graphLittle">Dimensions/Габариты:</span>
                                       <br/>
                                       <xsl:for-each select="cgms:DimensionsInfo">
                                          <span class="graphLittle">Размер:</span>
                                          <span class="graph8Bold">
                                             <xsl:value-of select="cgms:Dimensions/cat_ru:Lenght"/>
                                             <xsl:text>*</xsl:text>
                                             <xsl:value-of select="cgms:Dimensions/cat_ru:Wight"/>
                                             <xsl:text>*</xsl:text>
                                             <xsl:value-of select="cgms:Dimensions/cat_ru:Height"/>
                                             <xsl:text>(</xsl:text>
                                             <xsl:value-of select="cgms:Dimensions/cat_ru:DimensionsCode"/>
                                             <xsl:text>)  </xsl:text>
                                          </span>
                                          <span class="graphLittle">вес:</span>
                                          <span class="graph8Bold">
                                             <xsl:value-of select="cgms:WeightQuantity"/>
                                             <xsl:text>(</xsl:text>
                                             <xsl:value-of select="cgms:WeightCode"/>
                                             <xsl:text>)  </xsl:text>
                                          </span>
                                          <span class="graphLittle">мест:</span>
                                          <span class="graph8Bold">
                                             <xsl:value-of select="cgms:PiecesNumber"/>
                                          </span>
                                          <br/>
                                       </xsl:for-each>
                                    </xsl:if>
                                 </td>
                                 <td class="graphMain" style="width:20mm" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cgms:GrossWeightQuantity"/>
												<xsl:text> (</xsl:text>
												<xsl:value-of select="cgms:WeightUnitQualifierCode"/>
												<xsl:text>)</xsl:text>
											</td>
                                 <td style="width:25mm" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">FROM (откуда) </span>
                                    <span class="graphMain">
                                       <xsl:if test="cgms:OriginAirport/catTrans_ru:Name">
                                          <xsl:value-of select="cgms:OriginAirport/catTrans_ru:Name"/>
                                          <xsl:text>, </xsl:text>
                                       </xsl:if>
                                       <xsl:value-of select="cgms:OriginAirport/catTrans_ru:IATACode"/>
                                       <br/>
                                    </span>
                                    <span class="graph"> - TO (куда) </span>
                                    <span class="graphMain">
                                       <xsl:if test="cgms:DestimationAirport/catTrans_ru:Name">
                                          <xsl:value-of select="cgms:DestimationAirport/catTrans_ru:Name"/>
                                          <xsl:text>, </xsl:text>
                                       </xsl:if>
                                       <xsl:value-of select="cgms:DestimationAirport/catTrans_ru:IATACode"/>
                                       <br/>
                                    </span>
                                 </td>
                                 <td style="width:35mm" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="cgms:CustomsInfo">
                                       <span class="graphLittle">For Customs/Информация  для таможни:</span>
                                       <span class="graph8Bold">
                                          <xsl:value-of select="cgms:CustomsInfo/cgms:Notice"/>
                                          <br/>
                                       </span>
                                       <xsl:if test="cgms:CustomsInfo/cgms:OriginCountryCode">
                                          <span class="graphLittle">Страна происх.: </span>
                                          <span class="graph8Bold">
                                             <xsl:value-of select="cgms:CustomsInfo/cgms:OriginCountryCode"/>
                                             <br/>
                                          </span>
                                       </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="cgms:TotalConsigmentPieces">
                                       <span class="graphLittle">Всего  мест по накладной:</span>
                                       <span class="graph8Bold">
                                          <xsl:value-of select="cgms:TotalConsigmentPieces/cgms:NumberPieces"/>
                                          <br/>
                                       </span>
                                    </xsl:if>
                                    <br/>
                                    <xsl:if test="cgms:HandlingRequirement">
                                       <span class="graphLittle">Handling Requirement/<br/>Требования по обработке:</span>
                                       <br/>
                                       <xsl:for-each select="cgms:HandlingRequirement">
                                          <span class="graph8Bold">
                                             <xsl:value-of select="cgms:NumPP"/>
                                             <xsl:text>-</xsl:text>
                                             <xsl:value-of select="cgms:ServiceInfoCode"/>
                                             <xsl:if test="cgms:InfoDescription">
                                                <xsl:text>,</xsl:text>
                                                <xsl:value-of select="cgms:InfoDescription"/>
                                             </xsl:if>
                                             <br/>
                                          </span>
                                       </xsl:for-each>
                                    </xsl:if>
                                 </td>
                                 <td style="width:35mm;" valign="top">
                                    <xsl:choose>
                                       <xsl:when test="cgms:DTInfo">
                                          <span class="graphLittle">Номер товара по ДТ: <xsl:value-of select="cgms:DTInfo/cgms:GoodNumber"/>
                                             <br/>Декларация на товары:<br/>
                                             <xsl:value-of select="cgms:DTInfo/cgms:DTNumber/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                                                <xsl:with-param name="dategtd" select="cgms:DTInfo/cgms:DTNumber/cat_ru:RegistrationDate"/>
                                             </xsl:call-template>/<xsl:value-of select="cgms:DTInfo/cgms:DTNumber/cat_ru:GTDNumber"/>
                                             <br/>
                                             <xsl:if test="cgms:DTInfo/cgms:PartialExport='true' or cgms:DTInfo/cgms:PartialExport='1'">частичный ввоз</xsl:if>
                                          </span>
                                       </xsl:when>
                                       <xsl:otherwise> </xsl:otherwise>
                                    </xsl:choose>
                                 </td>
                                 <td style="width:20mm" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="cgms:OtherServiceInfo">
                                       <span class="graphLittle">Other Info/<br/>Прочая информация:</span>
                                       <span class="graph8Bold">
                                          <xsl:value-of select="cgms:OtherServiceInfo/cgms:Notice1"/>
                                          <br/>
                                          <xsl:value-of select="cgms:OtherServiceInfo/cgms:Notice2"/>
                                          <br/>
                                          <br/>
                                       </span>
                                    </xsl:if>
                                    <xsl:if test="cgms:GDInfo">
										<span class="graphLittle">
											<xsl:value-of select="cgms:GDInfo"/>
										</span>
                                    </xsl:if>
                                    <xsl:if test="cgms:MovementInfo">
										<br/>
                                       <span class="graphLittle">Route/Последующее перемещение:<br/>
                                       </span>
                                       <xsl:if test="cgms:MovementInfo/cgms:MovementPriorityCode">
                                          <span class="graphLittle">Приоритет:  </span>
                                          <span class="graph8Bold">
                                             <xsl:value-of select="cgms:MovementInfo/cgms:MovementPriorityCode"/>
                                             <br/>
                                          </span>
                                       </xsl:if>
                                       <xsl:if test="cgms:MovementInfo/cgms:RoutigInfo">
                                          <span class="graphLittle">Маршрут:</span>
                                          <xsl:for-each select="cgms:MovementInfo/cgms:RoutigInfo">
                                             <span class="graph8Bold">
                                                <xsl:value-of select="catTrans_ru:NumPP"/>
                                                <xsl:text>-</xsl:text>
                                                <xsl:if test="catTrans_ru:CarrierName">
                                                   <xsl:value-of select="catTrans_ru:CarrierName"/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:if>
                                                <xsl:value-of select="catTrans_ru:CarrierCode"/>
                                             </span>
                                             <br/>
                                             <xsl:if test="catTrans_ru:FlightNumber">
                                                <span class="graphLittle">Flight/Рейс:</span>
                                                <span class="graph8Bold">
                                                   <xsl:value-of select="catTrans_ru:FlightNumber"/>
                                                   <br/>
                                                </span>
                                             </xsl:if>
                                             <xsl:if test="catTrans_ru:FlightDate">
                                                <span class="graphLittle">Date/Дата:</span>
                                                <span class="graph8Bold">
                                                   <xsl:call-template name="russian_date">
                                                      <xsl:with-param name="dateIn" select="catTrans_ru:FlightDate"/>
                                                   </xsl:call-template>
                                                </span>
                                             </xsl:if>
                                             <xsl:if test="catTrans_ru:Airport">
                                                <span class="graphLittle">Airport/Аэропорт:</span>
                                                <span class="graph8Bold">
                                                   <xsl:if test="catTrans_ru:Airport/catTrans_ru:Name">
                                                      <xsl:value-of select="catTrans_ru:Airport/catTrans_ru:Name"/>
                                                      <xsl:text>, </xsl:text>
                                                   </xsl:if>
                                                   <xsl:value-of select="catTrans_ru:Airport/catTrans_ru:IATACode"/>
                                                   <br/>
                                                </span>
                                             </xsl:if>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </xsl:if>
                                 </td>
                              </tr>
                           </xsl:for-each>
                           <tr>
                              <td class="graph" style="width:30mm" valign="top">Итого мест:</td>
                              <td class="graphMain" style="width:15mm" valign="top">
                                 <xsl:value-of select="sum(cgms:BulkGargo/cgms:PlacesQuantity)"/>
                              </td>
                              <td class="graph" style="width:25mm" valign="top"> Общий  вес:</td>
                              <td class="graphMain" style="width:20mm" valign="top">
                                 <xsl:value-of select="sum(cgms:BulkGargo/cgms:GrossWeightQuantity)"/>
                              </td>
                              <td class="graph" colspan="4" style="width:115mm" valign="top">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                     <br/>
                     <br/>
                  </xsl:if>
                  <xsl:if test="cgms:ULDCargo">
                     <table border="1" cellpadding="4pt" cellspacing="0" style="empty-cells: show; ">
                        <tbody>
                           <tr>
                              <td align="center" class="bold" colspan="8">
                                 <br/>ULD LOADED / Погружено в контейнерах<br/>
                              </td>
                           </tr>
                           <xsl:for-each select="cgms:ULDCargo">
                              <tr>
                                 <td align="left" colspan="5" style="width:135mm" valign="top">
                                    <span class="normal">
                                       <br/>ULD Num./Номер контейнера :</span>
                                    <span class="bold">
                                       <xsl:value-of select="cgms:ULDType"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cgms:ULDSerialNumber"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cgms:ULDOwnerCode"/>
                                    </span>
                                    <br/>
                                    <br/>
                                 </td>
                                 <td class="graph" colspan="3" style="width:70mm" valign="top">For official use / Для служебных отметок: <br/>
                                    <xsl:if test="cgms:ULDComent">
                                       <span class="graphLittle">Примечание: </span>
                                       <span class="graph8Bold">
                                          <xsl:value-of select="cgms:ULDComent"/>
                                          <br/>
                                       </span>
                                    </xsl:if>
                                    <xsl:if test="cgms:ULDMoveInfo">
                                       <xsl:if test="cgms:ULDMoveInfo/cgms:ULDRoutingInfo">
                                          <span class="graphLittle">Маршрут:</span>
                                          <xsl:for-each select="cgms:ULDMoveInfo/cgms:ULDRoutingInfo">
                                             <span class="graph8Bold">
                                                <xsl:value-of select="catTrans_ru:NumPP"/>
                                                <xsl:text>-</xsl:text>
                                                <xsl:if test="catTrans_ru:CarrierName">
                                                   <xsl:value-of select="catTrans_ru:CarrierName"/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:if>
                                                <xsl:value-of select="catTrans_ru:CarrierCode"/>
                                             </span>
                                             <br/>
                                             <xsl:if test="catTrans_ru:FlightNumber">
                                                <span class="graphLittle">Flight/Рейс:</span>
                                                <span class="graph8Bold">
                                                   <xsl:value-of select="catTrans_ru:FlightNumber"/>
                                                   <br/>
                                                </span>
                                             </xsl:if>
                                             <xsl:if test="catTrans_ru:FlightDate">
                                                <span class="graphLittle">Date/Дата:</span>
                                                <span class="graph8Bold">
                                                   <xsl:call-template name="russian_date">
                                                      <xsl:with-param name="dateIn" select="catTrans_ru:FlightDate"/>
                                                   </xsl:call-template>
                                                </span>
                                             </xsl:if>
                                             <xsl:if test="catTrans_ru:Airport">
                                                <span class="graphLittle">Airport/Аэропорт:</span>
                                                <span class="graph8Bold">
                                                   <xsl:if test="catTrans_ru:Airport/catTrans_ru:Name">
                                                      <xsl:value-of select="catTrans_ru:Airport/catTrans_ru:Name"/>
                                                      <xsl:text>, </xsl:text>
                                                   </xsl:if>
                                                   <xsl:value-of select="catTrans_ru:Airport/catTrans_ru:IATACode"/>
                                                   <br/>
                                                </span>
                                             </xsl:if>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr align="left">
                                 <td class="graph" style="width:35mm" valign="top">Air Waybill Num.<br/>Номер накладной</td>
                                 <td class="graph" style="width:15mm" valign="top">Num of <br/>packages<br/>Кол-во <br/>упаковок</td>
                                 <td class="graph" style="width:25mm" valign="top"> Nature of goods<br/>Описание товара</td>
                                 <td class="graph" style="width:20mm" valign="top">Gross weight<br/>Вес брутто</td>
                                 <td class="graph" style="width:25mm" valign="top">FROM-TO<br/>а/п отправл.- назнач.</td>
                                 <td class="graph" style="width:35mm" valign="top">For official use<br/>Для служебных отметок</td>
                                 <td class="graph" style="width:30mm" valign="top">GTD<br/>Сведения о декларации на товары</td>
                                 <td class="graph" style="width:20mm" valign="top">Remark<br/>Примечания</td>
                              </tr>
                              <xsl:for-each select="cgms:ULDGoods">
                                 <tr>
                                    <td class="graphMain" style="width:35mm" valign="top">
                                       <xsl:if test="catTrans_ru:AirlineIATACode">
                                          <xsl:value-of select="catTrans_ru:AirlineIATACode"/>
                                          <xsl:text>-</xsl:text>
                                       </xsl:if>
                                       <xsl:value-of select="catTrans_ru:DocumentNumber"/>
                                    </td>
                                    <td class="graphMain" style="width:15mm" valign="top">
                                       <xsl:value-of select="cgms:PlacesQuantity"/>
                                    </td>
                                    <td class="graphMain" style="width:25mm" valign="top">
                                       <xsl:value-of select="cgms:GoodsDescription"/>
                                       <xsl:if test="cgms:GoodsCommodityCode">
													 (Код ТН ВЭД ЕАЭС 
													<xsl:value-of select="cgms:GoodsCommodityCode"/>
													<xsl:text>)</xsl:text>
												</xsl:if>
                                       <br/>
                                       <br/>
                                       <xsl:if test="cgms:VolumeInfo">
                                          <span class="graphLittle">Volume/Общий объем:</span>
                                          <span class="graph8Bold">
                                             <xsl:value-of select="cgms:VolumeInfo/cgms:GoodsVolume"/>
                                             <xsl:text>(</xsl:text>
                                             <xsl:value-of select="cgms:VolumeInfo/cgms:VolumeUnitQualifierCode"/>
                                             <xsl:if test="cgms:VolumeInfo/cgms:VolumeUnitQualifierName">
                                                <xsl:text>, </xsl:text>
                                                <xsl:value-of select="cgms:VolumeInfo/cgms:VolumeUnitQualifierName"/>
                                             </xsl:if>
                                             <xsl:text>)</xsl:text>
                                             <br/>
                                             <br/>
                                          </span>
                                       </xsl:if>
                                       <xsl:if test="cgms:DimensionsInfo">
                                          <span class="graphLittle">Dimensions/Габариты:</span>
                                          <br/>
                                          <xsl:for-each select="cgms:DimensionsInfo">
                                             <span class="graphLittle">Размер:</span>
                                             <span class="graph8Bold">
                                                <xsl:value-of select="cgms:Dimensions/cat_ru:Lenght"/>
                                                <xsl:text>*</xsl:text>
                                                <xsl:value-of select="cgms:Dimensions/cat_ru:Wight"/>
                                                <xsl:text>*</xsl:text>
                                                <xsl:value-of select="cgms:Dimensions/cat_ru:Height"/>
                                                <xsl:text>(</xsl:text>
                                                <xsl:value-of select="cgms:Dimensions/cat_ru:DimensionsCode"/>
                                                <xsl:text>)  </xsl:text>
                                             </span>
                                             <span class="graphLittle">вес:</span>
                                             <span class="graph8Bold">
                                                <xsl:value-of select="cgms:WeightQuantity"/>
                                                <xsl:text>(</xsl:text>
                                                <xsl:value-of select="cgms:WeightCode"/>
                                                <xsl:text>)  </xsl:text>
                                             </span>
                                             <span class="graphLittle">мест:</span>
                                             <span class="graph8Bold">
                                                <xsl:value-of select="cgms:PiecesNumber"/>
                                             </span>
                                             <br/>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </td>
                                    <td class="graphMain" style="width:20mm" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cgms:GrossWeightQuantity"/>
											    <xsl:text> (</xsl:text>
												<xsl:value-of select="cgms:WeightUnitQualifierCode"/>
												<xsl:text>)</xsl:text>
											</td>
                                    <td style="width:25mm" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">FROM (откуда) </span>
                                       <span class="graphMain">
                                          <xsl:if test="cgms:OriginAirport/catTrans_ru:Name">
                                             <xsl:value-of select="cgms:OriginAirport/catTrans_ru:Name"/>
                                             <xsl:text>, </xsl:text>
                                          </xsl:if>
                                          <xsl:value-of select="cgms:OriginAirport/catTrans_ru:IATACode"/>
                                          <br/>
                                       </span>
                                       <span class="graph"> - TO (куда) </span>
                                       <span class="graphMain">
                                          <xsl:if test="cgms:DestimationAirport/catTrans_ru:Name">
                                             <xsl:value-of select="cgms:DestimationAirport/catTrans_ru:Name"/>
                                             <xsl:text>, </xsl:text>
                                          </xsl:if>
                                          <xsl:value-of select="cgms:DestimationAirport/catTrans_ru:IATACode"/>
                                          <br/>
                                       </span>
                                    </td>
                                    <td style="width:35mm" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:if test="cgms:CustomsInfo">
                                          <span class="graphLittle">For Customs/Информация  для таможни:</span>
                                          <span class="graph8Bold">
                                             <xsl:value-of select="cgms:CustomsInfo/cgms:Notice"/>
                                             <br/>
                                          </span>
                                          <xsl:if test="cgms:CustomsInfo/cgms:OriginCountryCode">
                                             <span class="graphLittle">Страна происх.: </span>
                                             <span class="graph8Bold">
                                                <xsl:value-of select="cgms:CustomsInfo/cgms:OriginCountryCode"/>
                                                <br/>
                                             </span>
                                          </xsl:if>
                                       </xsl:if>
                                       <xsl:if test="cgms:TotalConsigmentPieces">
                                          <span class="graphLittle">Всего  мест по накладной:</span>
                                          <span class="graph8Bold">
                                             <xsl:value-of select="cgms:TotalConsigmentPieces/cgms:NumberPieces"/>
                                             <br/>
                                          </span>
                                       </xsl:if>
                                       <br/>
                                       <xsl:if test="cgms:HandlingRequirement">
                                          <span class="graphLittle">Handling Requirement/<br/>Требования по обработке:</span>
                                          <br/>
                                          <xsl:for-each select="cgms:HandlingRequirement">
                                             <span class="graph8Bold">
                                                <xsl:value-of select="cgms:NumPP"/>
                                                <xsl:text>-</xsl:text>
                                                <xsl:value-of select="cgms:ServiceInfoCode"/>
                                                <xsl:if test="cgms:InfoDescription">
                                                   <xsl:text>, </xsl:text>
                                                   <xsl:value-of select="cgms:InfoDescription"/>
                                                </xsl:if>
                                                <br/>
                                             </span>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </td>
                                    <td style="width:30mm" valign="top">
                                       <xsl:choose>
                                          <xsl:when test="cgms:DTInfo">
                                             <span class="graphLittle">Номер товара по ДТ: <xsl:value-of select="cgms:DTInfo/cgms:GoodNumber"/>
                                                <br/>Декларация на товары:<br/>
                                                <xsl:value-of select="cgms:DTInfo/cgms:DTNumber/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                                                   <xsl:with-param name="dategtd" select="cgms:DTInfo/cgms:DTNumber/cat_ru:RegistrationDate"/>
                                                </xsl:call-template>/<xsl:value-of select="cgms:DTInfo/cgms:DTNumber/cat_ru:GTDNumber"/>
                                                <br/>
                                                <xsl:if test="cgms:DTInfo/cgms:PartialExport='true' or cgms:DTInfo/cgms:PartialExport='1'">частичный ввоз</xsl:if>
                                             </span>
                                          </xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td style="width:20mm" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:if test="cgms:OtherServiceInfo">
                                          <span class="graphLittle">Other Info/<br/>Прочая информация:</span>
                                          <span class="graph8Bold">
                                             <xsl:value-of select="cgms:OtherServiceInfo/cgms:Notice1"/>
                                             <br/>
                                             <xsl:value-of select="cgms:OtherServiceInfo/cgms:Notice2"/>
                                             <br/>
                                             <br/>
                                          </span>
                                       </xsl:if>
                                       <xsl:if test="cgms:GDInfo">
										   <span class="graphLittle">
										   <xsl:value-of select="cgms:GDInfo"/>
										   </span>
										   <br/>
                                       </xsl:if>
                                       <xsl:if test="cgms:MovementInfo">
                                          <span class="graphLittle">Route/Последующее перемещение:<br/>
                                          </span>
                                          <xsl:if test="cgms:MovementInfo/cgms:MovementPriorityCode">
                                             <span class="graphLittle">Приоритет:  </span>
                                             <span class="graph8Bold">
                                                <xsl:value-of select="cgms:MovementInfo/cgms:MovementPriorityCode"/>
                                                <br/>
                                             </span>
                                          </xsl:if>
                                          <xsl:if test="cgms:MovementInfo/cgms:RoutigInfo">
                                             <span class="graphLittle">Маршрут:</span>
                                             <xsl:for-each select="cgms:MovementInfo/cgms:RoutigInfo">
                                                <span class="graph8Bold">
                                                   <xsl:value-of select="catTrans_ru:NumPP"/>
                                                   <xsl:text>-</xsl:text>
                                                   <xsl:if test="catTrans_ru:CarrierName">
                                                      <xsl:value-of select="catTrans_ru:CarrierName"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </xsl:if>
                                                   <xsl:value-of select="catTrans_ru:CarrierCode"/>
                                                </span>
                                                <br/>
                                                <xsl:if test="catTrans_ru:FlightNumber">
                                                   <span class="graphLittle">Flight/Рейс:</span>
                                                   <span class="graph8Bold">
                                                      <xsl:value-of select="catTrans_ru:FlightNumber"/>
                                                      <br/>
                                                   </span>
                                                </xsl:if>
                                                <xsl:if test="catTrans_ru:FlightDate">
                                                   <span class="graphLittle">Date/Дата:</span>
                                                   <span class="graph8Bold">
                                                      <xsl:call-template name="russian_date">
                                                         <xsl:with-param name="dateIn" select="catTrans_ru:FlightDate"/>
                                                      </xsl:call-template>
                                                   </span>
                                                </xsl:if>
                                                <xsl:if test="catTrans_ru:Airport">
                                                   <span class="graphLittle">Airport/Аэропорт:</span>
                                                   <span class="graph8Bold">
                                                      <xsl:if test="catTrans_ru:Airport/catTrans_ru:Name">
                                                         <xsl:value-of select="catTrans_ru:Airport/catTrans_ru:Name"/>
                                                         <xsl:text>, </xsl:text>
                                                      </xsl:if>
                                                      <xsl:value-of select="catTrans_ru:Airport/catTrans_ru:IATACode"/>
                                                      <br/>
                                                   </span>
                                                </xsl:if>
                                             </xsl:for-each>
                                          </xsl:if>
                                       </xsl:if>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                              <tr>
                                 <td class="graph" style="width:35mm" valign="top">Итого мест:</td>
                                 <td class="graphMain" style="width:15mm" valign="top">
                                    <xsl:value-of select="cgms:TotalULDPlacesQuantity"/>
                                 </td>
                                 <td class="graph" style="width:25mm" valign="top"> Общий  вес:</td>
                                 <td class="graphMain" style="width:20mm" valign="top">
                                    <xsl:value-of select="cgms:GrossWeightQuantity"/>
                                    <xsl:text>  (</xsl:text>
                                    <xsl:value-of select="cgms:WeightUnitQualifierCode"/>
                                    <xsl:text>)</xsl:text>
                                 </td>
                                 <td class="graph" colspan="2" style="width:110mm" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td class="graph" style="width:110mm" valign="top">
                                    <xsl:choose>
                                          <xsl:when test="cgms:DTInfo">
                                             <span class="graphLittle">Номер товара по ДТ: <xsl:value-of select="cgms:DTInfo/cgms:GoodNumber"/>
                                                <br/>Декларация на товары:<br/>
                                                <xsl:value-of select="cgms:DTInfo/cgms:DTNumber/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                                                   <xsl:with-param name="dategtd" select="cgms:DTInfo/cgms:DTNumber/cat_ru:RegistrationDate"/>
                                                </xsl:call-template>/<xsl:value-of select="cgms:DTInfo/cgms:DTNumber/cat_ru:GTDNumber"/>
                                                <br/>
                                                <xsl:if test="cgms:DTInfo/cgms:PartialExport='true' or cgms:DTInfo/cgms:PartialExport='1'">частичный ввоз</xsl:if>
                                             </span>
                                          </xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                 </td>
                                 <td class="graph" style="width:110mm" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="8" style="width:190mm" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                           </xsl:for-each>
                           <tr>
                              <td class="graph" style="width:35mm" valign="top">Итого по контейнерам. Мест :</td>
                              <td class="graphMain" style="width:15mm" valign="top">
                                 <xsl:value-of select="sum(cgms:ULDCargo/cgms:TotalULDPlacesQuantity)"/>
                              </td>
                              <td class="graph" style="width:25mm" valign="top"> Итого  по контейнерам. Общий  вес:</td>
                              <td class="graphMain" style="width:20mm" valign="top">
                                 <xsl:value-of select="sum(cgms:ULDCargo/cgms:GrossWeightQuantity)"/>
                              </td>
                              <td class="graph" colspan="4" style="width:110mm" valign="top">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </xsl:if>
                  <br/>
                  <br/>
               </xsl:for-each>
               </xsl:if>
               <xsl:if test="cgms:DestinationAirportForNilManifest">
				   <xsl:for-each select="cgms:DestinationAirportForNilManifest">
						<table border="0" cellpadding="4pt" cellspacing="0">
							<tbody>
								<tr>
									<td align="left">
										AIRPORT<br/>Сведения об аэропорте <br/>(городе)
									</td>
									<td align="left" class="bold" valign="middle">
										<xsl:if test="catTrans_ru:Name">
											<xsl:value-of select="catTrans_ru:Name"/>
											<br/>
									  </xsl:if>
									  <xsl:value-of select="catTrans_ru:IATACode"/>
								   </td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
