<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pomf="urn:customs.ru:Information:TransportDocuments:PostalManifest:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="pomf:PostalManifest">
      <html>
         <head>
            <title>Почтовый манифест</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
					body1 {
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
							font-weight: .normal;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							
						.normal2{
							font-weight: .normal;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: 1pt solid windowtext; border-top: medium none; border-bottom: 1pt solid windowtext; 
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
						
						.graphMain2 {
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
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border-bottom: solid 1pt #000000;
					font-weight: bold;
										}	
						.bold {
							font-weight: bold;
							font-family:Arial;
							font-size: 15pt;
						}	
						p {
							margin: 5px;
						}
						
						table tr td {
							font-family: Arial;
							font-size: 10pt;
							font-weight: normal;
						}
						body {
						/*text-align: center;*/
							background: #cccccc;
							font-family: Arial;
							font-size: 10pt;
							font-weight: normal;
						}
						.bt {font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						border-top: 2px solid black;}
                </style>
         </head>
         <body>
            <div class="page">
               <xsl:choose>
                  <xsl:when test="pomf:FormSign='1'">
                     <table width="100%">
                        <tr>
                           <td style="border:solid 0pt" width="40%">Назначенный оператор страны подачи:<br/>
                              <xsl:if test="pomf:DesignatedOperator/cat_ru:OrganizationName">
                                 <xsl:value-of select="pomf:DesignatedOperator/cat_ru:OrganizationName"/>
                              </xsl:if>
                           </td>
                           <td rowspan="3" style="border:solid 0pt" valign="top" width="13%"> </td>
                           <td colspan="2" rowspan="2" style="border:solid 0pt" valign="top" width="40%">
                              <b>НАКЛАДНАЯ СДАЧИ</b>
                              <br/>
                              <b>Наземные депеши</b>
                              <br/>
									Дата 
						<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="pomf:ManifestDate"/>
                              </xsl:call-template>    
						        № серии <xsl:if test="pomf:SerialNumber">
                                 <xsl:value-of select="pomf:SerialNumber"/>
                              </xsl:if>
                           </td>
                           <td align="right" rowspan="3" style="border:solid 0pt" valign="top" width="7%">
                              <b>CN 37</b>
                           </td>
                        </tr>
                        <tr>
                           <td>Учреждение обмена подачи накладной:<br/>
                              <xsl:if test="pomf:FeedBillAgency/cat_ru:OrganizationName">
                                 <xsl:value-of select="pomf:FeedBillAgency/cat_ru:OrganizationName"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt">Учреждение назначения накладной:<br/>
                              <xsl:value-of select="pomf:DestinationAgency/cat_ru:OrganizationName"/>
                           </td>
                           <td style="border:solid 0pt" width="15%"> </td>
                           <td>
                              <table>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:RW_Transport">X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Поездом</td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:SeaTransport">X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Почтовым судном</td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:AutoTransport">X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Автомобилем</td>
                                 </tr>
                              </table>
                           </td>
                        </tr>
                     </table>
                     <table style="border:solid 1pt #000000; border-collapse: collapse" width="100%">
                        <tr>
                           <td colspan="3"> </td>
                           <td>Дата отправления<br/>
                              <xsl:if test="pomf:RW_Transport/pomf:SendDate">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="pomf:RW_Transport/pomf:SendDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                              <xsl:if test="pomf:AutoTransport/pomf:SendDate">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="pomf:AutoTransport/pomf:SendDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                           </td>
                           <td>Время<br/>
                              <xsl:if test="pomf:RW_Transport/pomf:SendTime">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="substring(pomf:RW_Transport/pomf:SendTime, 1, 8)"/>
                              </xsl:if>
                              <xsl:if test="pomf:AutoTransport/pomf:SendTime">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="substring(pomf:AutoTransport/pomf:SendTime, 1, 8)"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <table>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:PrioritySign='1' or pomf:PrioritySign='t' or pomf:PrioritySign='true'">X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Приоритетная</td>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:PrioritySign='0' or pomf:PrioritySign='f' or pomf:PrioritySign='false'">X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Неприоритетная</td>
                                 </tr>
                              </table>
                           </td>
                           <td colspan="4"> </td>
                        </tr>
                        <tr>
                           <td>№ поезда/автомобиля<br/>
                              <xsl:if test="pomf:RW_Transport">
                                 <xsl:value-of select="pomf:RW_Transport/pomf:TransportNumber"/>
                              </xsl:if>
                              <xsl:if test="pomf:AutoTransport">
                                 <xsl:value-of select="pomf:AutoTransport/pomf:TransportNumber"/>
                              </xsl:if>
                           </td>
                           <td> </td>
                           <td>Путь направления<br/>
                              <xsl:if test="pomf:RW_Transport">
                                 <xsl:value-of select="pomf:RW_Transport/pomf:Direction"/>
                              </xsl:if>
                              <xsl:if test="pomf:AutoTransport">
                                 <xsl:value-of select="pomf:AutoTransport/pomf:Direction"/>
                              </xsl:if>
                           </td>
                           <td>№ печати<br/>
                              <xsl:if test="pomf:RW_Transport/pomf:SealID">
                                 <xsl:value-of select="pomf:RW_Transport/pomf:SealID"/>
                              </xsl:if>
                              <xsl:if test="pomf:AutoTransport/pomf:SealID">
                                 <xsl:value-of select="pomf:AutoTransport/pomf:SealID"/>
                              </xsl:if>
                           </td>
                           <td> </td>
                        </tr>
                        <tr>
                           <td colspan="5" style="border-bottom:1px solid #000000;"> </td>
                        </tr>
                        <tr>
                           <td>Название судна<br/>
                              <xsl:if test="pomf:SeaTransport">
                                 <xsl:value-of select="pomf:SeaTransport/pomf:ShipName"/>
                              </xsl:if>
                           </td>
                           <td> </td>
                           <td>Порт выгрузки<br/>
                              <xsl:if test="pomf:SeaTransport">
                                 <xsl:value-of select="pomf:SeaTransport/pomf:UnloadingPort"/>
                              </xsl:if>
                           </td>
                           <td>Компания<br/>
                              <xsl:if test="pomf:SeaTransport/pomf:Company">
                                 <xsl:value-of select="pomf:SeaTransport/pomf:Company"/>
                              </xsl:if>
                           </td>
                           <td> </td>
                        </tr>
                        <tr>
                           <td colspan="5" style="border-bottom:1px solid #000000;"> </td>
                        </tr>
                        <tr>
                           <td colspan="2" valign="middle">В случае использования контейнера</td>
                           <td colspan="2">
                              <table width="100%">
                                 <tr>
                                    <td>№ контейнера</td>
                                    <td>№ печати</td>
                                 </tr>
                                 <xsl:for-each select="pomf:Container">
                                    <tr>
                                       <td>
                                          <xsl:value-of select="pomf:ContainerNumber"/>
                                          <br/>
                                       </td>
                                       <td>
                                          <xsl:if test="pomf:StampNumber">
                                             <xsl:value-of select="pomf:StampNumber"/>
                                          </xsl:if>
                                          <br/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </table>
                           </td>
                           <td> </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td>
                              <b>Требуемые данные</b>
                           </td>
                        </tr>
                     </table>
                     <table style="border-collapse: collapse" width="100%">
                        <tr>
                           <td align="center" rowspan="2" style="border:solid 0.8pt black;">№ депеши</td>
                           <td align="center" rowspan="2" style="border:solid 0.8pt black;">Учреждение подачи</td>
                           <td align="center" rowspan="2" style="border:solid 0.8pt black;">Учреждение назначения</td>
                           <td align="center" colspan="3" style="border:solid 0.8pt black;">Количество</td>
                           <td align="center" colspan="3" style="border:solid 0.8pt black;">Вес брутто емкостей и т.д.</td>
                           <td align="center" rowspan="2" style="border:solid 0.8pt black;">Примечания</td>
                        </tr>
                        <tr>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">емкостей с письменной корреспонденцией</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">емкостей СР и посылок без емкости</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">партий порожних мешков</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">Письменная корреспонденция</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">СР</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">Порожние емкости</td>
                        </tr>
                        <tr>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">1</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">2</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">3</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">4</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">5</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">6</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">7</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">8</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">9</td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">10</td>
                        </tr>
                        <xsl:for-each select="pomf:DespatchInfo">
                           <tr>
                              <td align="center" style="width:10mm;border:solid 0.8pt black;">
                                 <xsl:value-of select="pomf:DespatchNumber"/>
                              </td>
                              <td align="center" style="width:10mm;border:solid 0.8pt black;">
                                 <xsl:value-of select="pomf:FilingAgency"/>
                              </td>
                              <td align="center" style="width:10mm;border:solid 0.8pt black;">
                                 <xsl:value-of select="pomf:DestinationAgency"/>
                              </td>
                              <td align="center" style="width:10mm;border:solid 0.8pt black;">
                                 <xsl:if test="pomf:WrittenCorrespondence/pomf:Quantity">
                                    <xsl:value-of select="pomf:WrittenCorrespondence/pomf:Quantity"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="width:10mm;border:solid 0.8pt black;">
                                 <xsl:if test="pomf:UncapacityParcels/pomf:Quantity">
                                    <xsl:value-of select="pomf:UncapacityParcels/pomf:Quantity"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="width:10mm;border:solid 0.8pt black;">
                                 <xsl:if test="pomf:EmptyContainers/pomf:Quantity">
                                    <xsl:value-of select="pomf:EmptyContainers/pomf:Quantity"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="width:10mm;border:solid 0.8pt black;">
                                 <xsl:if test="pomf:WrittenCorrespondence/pomf:Weight">
                                    <xsl:value-of select="pomf:WrittenCorrespondence/pomf:Weight"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="width:10mm;border:solid 0.8pt black;">
                                 <xsl:if test="pomf:UncapacityParcels/pomf:Weight">
                                    <xsl:value-of select="pomf:UncapacityParcels/pomf:Weight"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="width:10mm;border:solid 0.8pt black;">
                                 <xsl:if test="pomf:EmptyContainers/pomf:Weight">
                                    <xsl:value-of select="pomf:EmptyContainers/pomf:Weight"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="width:10mm;border:solid 0.8pt black;">
                                 <xsl:for-each select="pomf:Comments">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position()!=last()"> </xsl:if>
                                 </xsl:for-each>
									 
									</td>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="right" colspan="3" style="width:10mm;border:solid 0.8pt black;">
                              <b>Итого</b>
                           </td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">
                              <xsl:if test="pomf:TotalWrittenCorr/pomf:Quantity">
                                 <xsl:value-of select="pomf:TotalWrittenCorr/pomf:Quantity"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">
                              <xsl:if test="pomf:TotalUncapacityParcels/pomf:Quantity">
                                 <xsl:value-of select="pomf:TotalUncapacityParcels/pomf:Quantity"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">
                              <xsl:if test="pomf:TotalEmptyContainers/pomf:Quantity">
                                 <xsl:value-of select="pomf:TotalEmptyContainers/pomf:Quantity"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">
                              <xsl:if test="pomf:TotalWrittenCorr/pomf:Weight">
                                 <xsl:value-of select="pomf:TotalWrittenCorr/pomf:Weight"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">
                              <xsl:if test="pomf:TotalUncapacityParcels/pomf:Weight">
                                 <xsl:value-of select="pomf:TotalUncapacityParcels/pomf:Weight"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;">
                              <xsl:if test="pomf:TotalEmptyContainers/pomf:Weight">
                                 <xsl:value-of select="pomf:TotalEmptyContainers/pomf:Weight"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="width:10mm;border:solid 0.8pt black;"> </td>
                        </tr>
                     </table>
                  </xsl:when>
                  <xsl:when test="pomf:FormSign='2'">
                     <table style="border-collapse: collapse;" width="100%">
                        <tr>
                           <td>Назначенный оператор страны подачи<br/>
                              <xsl:if test="pomf:DesignatedOperator/cat_ru:OrganizationName">
                                 <xsl:value-of select="pomf:DesignatedOperator/cat_ru:OrganizationName"/>
                              </xsl:if>
                           </td>
                           <td rowspan="3"/>
                           <td rowspan="2">
                              <b>НАКЛАДНАЯ СДАЧИ<br/>
                              </b>
                              <b>Авиадепеши</b>
                              <br/>
									Дата 
									<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="pomf:ManifestDate"/>
                              </xsl:call-template>    
						        № серии <xsl:if test="pomf:SerialNumber">
                                 <xsl:value-of select="pomf:SerialNumber"/>
                              </xsl:if>
                           </td>
                           <td align="right" rowspan="3" valign="top" width="7%">
                              <b>CN 38</b>
                           </td>
                        </tr>
                        <tr>
                           <td>Учреждение подачи накладной<br/>
                              <xsl:if test="pomf:FeedBillAgency/cat_ru:OrganizationName">
                                 <xsl:value-of select="pomf:FeedBillAgency/cat_ru:OrganizationName"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td>Учреждение назначения накладной<br/>
                              <xsl:if test="pomf:DestinationAgency/cat_ru:OrganizationName">
                                 <xsl:value-of select="pomf:DestinationAgency/cat_ru:OrganizationName"/>
                              </xsl:if>
                           </td>
                           <td>
                              <table>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:PrioritySign='1' or pomf:PrioritySign='t' or pomf:PrioritySign='true'">X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Приоритетная</td>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:AirTransport">X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Авиа</td>
                                 </tr>
                              </table>
                           </td>
                        </tr>
                     </table>
                     <table>
                        <tbody>
                           <tr>
                              <th/>
                           </tr>
                        </tbody>
                     </table>
                     <table style="border-collapse: collapse; border:solid 1pt black;" width="100%">
                        <tr>
                           <td style="border-bottom:1px solid #000000;">№ рейса<br/>
                              <xsl:value-of select="pomf:AirTransport/pomf:FlightNumber"/>
                           </td>
                           <td style="border-bottom:1px solid #000000;"> </td>
                           <td style="border-bottom:1px solid #000000;">Дата отправки<br/>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="pomf:AirTransport/pomf:SendDate"/>
                              </xsl:call-template>
                           </td>
                           <td style="border-bottom:1px solid #000000;">Время<br/>
                              <xsl:if test="pomf:AirTransport/pomf:SendTime">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="substring(pomf:AirTransport/pomf:SendTime, 1, 8)"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td style="border-bottom:1px solid #000000;">Аэропорт прямой перегрузки<br/>
                              <xsl:value-of select="pomf:AirTransport/pomf:DirectOverloadAirport"/>
                           </td>
                           <td style="border-bottom:1px solid #000000;"> </td>
                           <td style="border-bottom:1px solid #000000;">Аэропорт выгрузки<br/>
                              <xsl:value-of select="pomf:AirTransport/pomf:UnloadAirport"/>
                              <td style="border-bottom:1px solid #000000;"> </td>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="2" rowspan="2" valign="middle">В случае использования контейнера</td>
                           <td>№ контейнера</td>
                           <td>№ печати</td>
                        </tr>
                        <tr>
                           <td colspan="2">
                              <table width="100%">
                                 <xsl:for-each select="pomf:Container">
                                    <tr>
                                       <td width="50%">
                                          <xsl:value-of select="pomf:ContainerNumber"/>
                                          <br/>
                                       </td>
                                       <td align="center">
                                          <xsl:if test="pomf:StampNumber">
                                             <xsl:value-of select="pomf:StampNumber"/>
                                          </xsl:if>
                                          <br/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </table>
                           </td>
                        </tr>
                     </table>
                     <table width="100%">
                        <tr>
                           <td>
                              <b>Требуемые данные</b>
                           </td>
                        </tr>
                     </table>
                     <table style="border-collapse: collapse; border:solid 1pt black;" width="100%">
                        <tr>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">№ депеши</td>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">Учреждение подачи</td>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">Учреждение назначения</td>
                           <td align="center" colspan="3" style="border:solid 1pt black;">Количество</td>
                           <td align="center" colspan="3" style="border:solid 1pt black;">Вес брутто емкостей и т.д.</td>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">Примечания (включая количество мешков М и/или посылок без емкости)</td>
                        </tr>
                        <tr>
                           <td style="border:solid 1pt black;">емкостей с письменной корреспонденцией</td>
                           <td style="border:solid 1pt black;">емкостей СР и посылок без емкости</td>
                           <td style="border:solid 1pt black;">емкостей EMS</td>
                           <td style="border:solid 1pt black;">Письменная корреспонденция</td>
                           <td style="border:solid 1pt black;">СР</td>
                           <td style="border:solid 1pt black;">EMS</td>
                        </tr>
                        <tr>
                           <td align="center" style="border:solid 1pt black;">1</td>
                           <td align="center" style="border:solid 1pt black;">2</td>
                           <td align="center" style="border:solid 1pt black;">3</td>
                           <td align="center" style="border:solid 1pt black;">4</td>
                           <td align="center" style="border:solid 1pt black;">5</td>
                           <td align="center" style="border:solid 1pt black;">6</td>
                           <td align="center" style="border:solid 1pt black;">7</td>
                           <td align="center" style="border:solid 1pt black;">8</td>
                           <td align="center" style="border:solid 1pt black;">9</td>
                           <td align="center" style="border:solid 1pt black;">10</td>
                        </tr>
                        <xsl:for-each select="pomf:DespatchInfo">
                           <tr>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:value-of select="pomf:DespatchNumber"/>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:value-of select="pomf:FilingAgency"/>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:value-of select="pomf:DestinationAgency"/>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:WrittenCorrespondence/pomf:Quantity">
                                    <xsl:value-of select="pomf:WrittenCorrespondence/pomf:Quantity"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:UncapacityParcels/pomf:Quantity">
                                    <xsl:value-of select="pomf:UncapacityParcels/pomf:Quantity"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:EMS/pomf:Quantity">
                                    <xsl:value-of select="pomf:EMS/pomf:Quantity"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:WrittenCorrespondence/pomf:Weight">
                                    <xsl:value-of select="pomf:WrittenCorrespondence/pomf:Weight"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:UncapacityParcels/pomf:Weight">
                                    <xsl:value-of select="pomf:UncapacityParcels/pomf:Weight"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:EMS/pomf:Weight">
                                    <xsl:value-of select="pomf:EMS/pomf:Weight"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:for-each select="pomf:Comments">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position()!=last()"> </xsl:if>
                                 </xsl:for-each>
                              </td>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="right" colspan="3" style="border:solid 1pt black;">
                              <b>Итого</b>
                           </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalWrittenCorr/pomf:Quantity">
                                 <xsl:value-of select="pomf:TotalWrittenCorr/pomf:Quantity"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalUncapacityParcels/pomf:Quantity">
                                 <xsl:value-of select="pomf:TotalUncapacityParcels/pomf:Quantity"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;"> </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalWrittenCorr/pomf:Weight">
                                 <xsl:value-of select="pomf:TotalWrittenCorr/pomf:Weight"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalUncapacityParcels/pomf:Weight">
                                 <xsl:value-of select="pomf:TotalUncapacityParcels/pomf:Weight"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;"> </td>
                           <td align="center" style="border:solid 1pt black;"> </td>
                        </tr>
                     </table>
                  </xsl:when>
                  <xsl:when test="pomf:FormSign='3'">
                     <table style="border-collapse: collapse;" width="100%">
                        <tr>
                           <td>Почтовая администрация подачи<br/>
                              <xsl:if test="pomf:DesignatedOperator/cat_ru:OrganizationName">
                                 <xsl:value-of select="pomf:DesignatedOperator/cat_ru:OrganizationName"/>
                              </xsl:if>
                           </td>
                           <td rowspan="3"/>
                           <td rowspan="2">
                              <b>НАКЛАДНАЯ СДАЧИ<br/>
                              </b>
									Наземные депеши, <br/>(прежний перевозимые воздушным путем С 18 бис)<br/>
									путем (S.A.L.)<br/>
									Дата 
									<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="pomf:ManifestDate"/>
                              </xsl:call-template>    
						        № серии <xsl:if test="pomf:SerialNumber">
                                 <xsl:value-of select="pomf:SerialNumber"/>
                              </xsl:if>
                           </td>
                           <td align="right" rowspan="3" valign="top" width="7%">
                              <b>CN 41</b>
                           </td>
                        </tr>
                        <tr>
                           <td>Учреждение подачи накладной<br/>
                              <xsl:if test="pomf:FeedBillAgency/cat_ru:OrganizationName">
                                 <xsl:value-of select="pomf:FeedBillAgency/cat_ru:OrganizationName"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td>Учреждение назначения накладной<br/>
                              <xsl:if test="pomf:DestinationAgency/cat_ru:OrganizationName">
                                 <xsl:value-of select="pomf:DestinationAgency/cat_ru:OrganizationName"/>
                              </xsl:if>
                           </td>
                        </tr>
                     </table>
                     <table style="border-collapse: collapse; border:solid 1pt black;" width="100%">
                        <tr>
                           <td style="border-bottom:1px solid #000000;">№ рейса<br/>
                              <xsl:value-of select="pomf:AirTransport/pomf:FlightNumber"/>
                           </td>
                           <td style="border-bottom:1px solid #000000;">Дата отправки<br/>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="pomf:AirTransport/pomf:SendDate"/>
                              </xsl:call-template>
                           </td>
                           <td style="border-bottom:1px solid #000000;">Время<br/>
                              <xsl:if test="pomf:AirTransport/pomf:SendTime">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="substring(pomf:AirTransport/pomf:SendTime, 1, 8)"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td style="border-bottom:1px solid #000000;">Аэропорт прямой перегрузки<br/>
                              <xsl:value-of select="pomf:AirTransport/pomf:DirectOverloadAirport"/>
                           </td>
                           <td style="border-bottom:1px solid #000000;">Аэропорт выгрузки<br/>
                              <xsl:value-of select="pomf:AirTransport/pomf:UnloadAirport"/>
                              <td style="border-bottom:1px solid #000000;"> </td>
                           </td>
                        </tr>
                        <tr>
                           <td rowspan="2" valign="middle">В случае использования контейнера</td>
                           <td colspan="2">
                              <table width="100%">
                                 <tr>
                                    <td>№ контейнера</td>
                                    <td>№ печати</td>
                                 </tr>
                                 <xsl:for-each select="pomf:Container">
                                    <tr>
                                       <td>
                                          <xsl:value-of select="pomf:ContainerNumber"/>
                                          <br/>
                                       </td>
                                       <td>
                                          <xsl:if test="pomf:StampNumber">
                                             <xsl:value-of select="pomf:StampNumber"/>
                                          </xsl:if>
                                          <br/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </table>
                           </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td>
                              <b>Запись</b>
                           </td>
                        </tr>
                     </table>
                     <table style="border-collapse: collapse; border:solid 1pt black;" width="100%">
                        <tr>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">№ депеши</td>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">Учреждение подачи</td>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">Учреждение назначения</td>
                           <td align="center" colspan="3" style="border:solid 1pt black;">Количество</td>
                           <td align="center" colspan="3" style="border:solid 1pt black;">Вес брутто емкостей и т.д., кг</td>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">Примечания</td>
                        </tr>
                        <tr>
                           <td style="border:solid 1pt black;">мешков с письменной корреспон-<br/>денцией</td>
                           <td style="border:solid 1pt black;">мешков СР и посылок без мешка</td>
                           <td style="border:solid 1pt black;">мешков с порожними мешками</td>
                           <td style="border:solid 1pt black;">Письменная корреспон-<br/>денция</td>
                           <td style="border:solid 1pt black;">СР</td>
                           <td style="border:solid 1pt black;">Порожние мешки</td>
                        </tr>
                        <tr>
                           <td align="center" style="border:solid 1pt black;">1</td>
                           <td align="center" style="border:solid 1pt black;">2</td>
                           <td align="center" style="border:solid 1pt black;">3</td>
                           <td align="center" style="border:solid 1pt black;">4</td>
                           <td align="center" style="border:solid 1pt black;">5</td>
                           <td align="center" style="border:solid 1pt black;">6</td>
                           <td align="center" style="border:solid 1pt black;">7</td>
                           <td align="center" style="border:solid 1pt black;">8</td>
                           <td align="center" style="border:solid 1pt black;">9</td>
                           <td align="center" style="border:solid 1pt black;">10</td>
                        </tr>
                        <xsl:for-each select="pomf:DespatchInfo">
                           <tr>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:value-of select="pomf:DespatchNumber"/>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:value-of select="pomf:FilingAgency"/>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:value-of select="pomf:DestinationAgency"/>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:WrittenCorrespondence/pomf:Quantity">
                                    <xsl:value-of select="pomf:WrittenCorrespondence/pomf:Quantity"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:UncapacityParcels/pomf:Quantity">
                                    <xsl:value-of select="pomf:UncapacityParcels/pomf:Quantity"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:EmptyContainers/pomf:Quantity">
                                    <xsl:value-of select="pomf:EmptyContainers/pomf:Quantity"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:WrittenCorrespondence/pomf:Weight">
                                    <xsl:value-of select="pomf:WrittenCorrespondence/pomf:Weight"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:UncapacityParcels/pomf:Weight">
                                    <xsl:value-of select="pomf:UncapacityParcels/pomf:Weight"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:EmptyContainers/pomf:Weight">
                                    <xsl:value-of select="pomf:EmptyContainers/pomf:Weight"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:for-each select="pomf:Comments">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position()!=last()"> </xsl:if>
                                 </xsl:for-each>
                              </td>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="right" colspan="3" style="border:solid 1pt black;">
                              <b>Итого</b>
                           </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalWrittenCorr/pomf:Quantity">
                                 <xsl:value-of select="pomf:TotalWrittenCorr/pomf:Quantity"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalUncapacityParcels/pomf:Quantity">
                                 <xsl:value-of select="pomf:TotalUncapacityParcels/pomf:Quantity"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalEmptyContainers/pomf:Quantity">
                                 <xsl:value-of select="pomf:TotalEmptyContainers/pomf:Quantity"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalWrittenCorr/pomf:Weight">
                                 <xsl:value-of select="pomf:TotalWrittenCorr/pomf:Weight"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalUncapacityParcels/pomf:Weight">
                                 <xsl:value-of select="pomf:TotalUncapacityParcels/pomf:Weight"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalEmptyContainers/pomf:Weight">
                                 <xsl:value-of select="pomf:TotalEmptyContainers/pomf:Weight"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;"> </td>
                        </tr>
                     </table>
                  </xsl:when>
                  <xsl:when test="pomf:FormSign='4'">
                     <table style="border-collapse: collapse" width="100%">
                        <tr>
                           <td>Авиакомпания, составляющая заменяющую накладную<br/>
                              <xsl:if test="pomf:ReplacementBillInfo/pomf:FormingAircompany">
                                 <xsl:value-of select="pomf:ReplacementBillInfo/pomf:FormingAircompany"/>
                              </xsl:if>
                           </td>
                           <td rowspan="2"> </td>
                           <td rowspan="2" valign="top">
                              <b>ЗАМЕНЯЮЩАЯ НАКЛАДНАЯ<br/>
									СДАЧИ</b>
                              <br/>
									Дата
									<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="pomf:ManifestDate"/>
                              </xsl:call-template>
                           </td>
                           <td align="right" rowspan="2" valign="top">
                              <b>CN 46</b>
                           </td>
                        </tr>
                        <tr>
                           <td>Аэропорт подачи заменяющей накладной<br/>
                              <xsl:if test="pomf:ReplacementBillInfo/pomf:SubmitAirport">
                                 <xsl:value-of select="pomf:ReplacementBillInfo/pomf:SubmitAirport"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4"> </td>
                        </tr>
                     </table>
                     <table style="border:solid 1pt #000000;border-collapse: collapse" width="100%">
                        <tr>
                           <td style="border:solid 1pt black;">Замечания, касающиеся найденных депеш<br/>
                              <xsl:for-each select="pomf:ReplacementBillInfo/pomf:Remarks">
                                 <xsl:value-of select="."/>
                                 <xsl:if test="position()!=last()"> </xsl:if>
                              </xsl:for-each> </td>
                           <td colspan="2" style="border:solid 1pt black;">Назначенный оператор страны подачи депеш<br/>
                              <xsl:if test="pomf:ReplacementBillInfo/pomf:OperatorSupplyCountry">
                                 <xsl:value-of select="pomf:ReplacementBillInfo/pomf:OperatorSupplyCountry"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td rowspan="2" valign="top" width="50%">В случае использования контейнера</td>
                           <td width="25%">№ контейнера</td>
                           <td width="25%">№ печати</td>
                        </tr>
                        <tr>
                           <td colspan="2">
                              <table width="100%">
                                 <xsl:for-each select="pomf:Container">
                                    <tr>
                                       <td width="50%">
                                          <xsl:value-of select="pomf:ContainerNumber"/>
                                          <br/>
                                       </td>
                                       <td width="50%">
                                          <xsl:if test="pomf:StampNumber">
                                             <xsl:value-of select="pomf:StampNumber"/>
                                          </xsl:if>
                                          <br/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </table>
                           </td>
                        </tr>
                     </table>
                     <table width="100%">
                        <tr>
                           <td>
                              <b>Описание депеш в том виде, в котором они были обнаружены (согласно данным ярлыков CN 35, CN 36, CP 84 или CP 85)</b>
                           </td>
                        </tr>
                     </table>
                     <table style="border-collapse: collapse; border:solid 1pt black;" width="100%">
                        <tr>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">№ депеши</td>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">Учреждение подачи</td>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">Учреждение назначения</td>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">№ рейса</td>
                           <td align="center" colspan="2" style="border:solid 1pt black;">Аэропорт</td>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">Дата отправки депеши</td>
                           <td align="center" colspan="3" style="border:solid 1pt black;">Количество емкостей</td>
                           <td align="center" rowspan="2" style="border:solid 1pt black;">Вес брутто (письменной корреспонденции), кг</td>
                        </tr>
                        <tr>
                           <td align="center" style="border:solid 1pt black;">перегрузки</td>
                           <td align="center" style="border:solid 1pt black;">выгрузки</td>
                           <td align="center" style="border:solid 1pt black;">с письменной корреспонденцией</td>
                           <td align="center" style="border:solid 1pt black;">СР</td>
                           <td align="center" style="border:solid 1pt black;">EMS/Других отправлений</td>
                        </tr>
                        <xsl:for-each select="pomf:DespatchInfo">
                           <tr>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:value-of select="pomf:DespatchNumber"/>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:value-of select="pomf:FilingAgency"/>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:value-of select="pomf:DestinationAgency"/>
                              </td>
                              <td style="border:solid 1pt black;"> </td>
                              <td style="border:solid 1pt black;"> </td>
                              <td style="border:solid 1pt black;"> </td>
                              <td style="border:solid 1pt black;"> </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:WrittenCorrespondence/pomf:Quantity">
                                    <xsl:value-of select="pomf:WrittenCorrespondence/pomf:Quantity"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:UncapacityParcels/pomf:Quantity">
                                    <xsl:value-of select="pomf:UncapacityParcels/pomf:Quantity"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:EMS/pomf:Quantity">
                                    <xsl:value-of select="pomf:EMS/pomf:Quantity"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:WrittenCorrespondence/pomf:Weight">
                                    <xsl:value-of select="pomf:WrittenCorrespondence/pomf:Weight"/>
                                 </xsl:if>
                              </td>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="right" colspan="7" style="border:solid 1pt black;">
                              <b>Итого</b>
                           </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalWrittenCorr/pomf:Quantity">
                                 <xsl:value-of select="pomf:TotalWrittenCorr/pomf:Quantity"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalUncapacityParcels/pomf:Quantity">
                                 <xsl:value-of select="pomf:TotalUncapacityParcels/pomf:Quantity"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;"> </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalWrittenCorr/pomf:Weight">
                                 <xsl:value-of select="pomf:TotalWrittenCorr/pomf:Weight"/>
                              </xsl:if>
                           </td>
                        </tr>
                     </table>
                     <table style="border-collapse: collapse;" width="100%">
                        <tr>
                           <td> </td>
                        </tr>
                        <tr>
                           <td>
                              <b>Направление депеши</b>
                           </td>
                        </tr>
                     </table>
                     <table style="border-collapse: collapse;" width="100%">
                        <tr>
                           <td style="border:solid 1pt black;">Аэропорт погрузки<br/>
                           </td>
                           <td style="border:solid 1pt black;">№ рейса<br/>
                              <xsl:value-of select="pomf:AirTransport/pomf:FlightNumber"/>
                           </td>
                           <td style="border:solid 1pt black;">Дата отправки<br/>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="pomf:AirTransport/pomf:SendDate"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 1pt black;">Аэропорт выгрузки<br/>
                              <xsl:if test="pomf:AirTransport/pomf:UnloadAirport">
                                 <xsl:value-of select="pomf:AirTransport/pomf:UnloadAirport"/>
                              </xsl:if>
                           </td>
                           <td colspan="2" style="border:solid 1pt black;">Учреждение назначения депеши<br/>
                              <xsl:if test="pomf:DestinationAgency/cat_ru:OrganizationName">
                                 <xsl:value-of select="pomf:DestinationAgency/cat_ru:OrganizationName"/>
                              </xsl:if>
                           </td>
                        </tr>
                     </table>
                  </xsl:when>
                  <xsl:when test="pomf:FormSign='5'">
                     <table width="100%">
                        <tr>
                           <td style="border:solid 0pt" width="40%">Назначенный оператор страны подачи<br/>
                              <xsl:if test="pomf:DesignatedOperator/cat_ru:OrganizationName">
                                 <xsl:value-of select="pomf:DesignatedOperator/cat_ru:OrganizationName"/>
                              </xsl:if>
                           </td>
                           <td rowspan="4" style="border:solid 0pt" valign="top" width="13%"> </td>
                           <td colspan="2" rowspan="2" style="border:solid 0pt" valign="top" width="40%">
                              <b>НАКЛАДНАЯ СДАЧИ</b>
                              <br/>
                              <b>Депеши с порожними емкостями</b>
                              <br/>
									Дата 
						<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="pomf:ManifestDate"/>
                              </xsl:call-template>    
						        № серии <xsl:if test="pomf:SerialNumber">
                                 <xsl:value-of select="pomf:SerialNumber"/>
                              </xsl:if>
                           </td>
                           <td align="right" rowspan="4" style="border:solid 0pt" valign="top" width="7%">
                              <b>CN 47</b>
                           </td>
                        </tr>
                        <tr>
                           <td>Учреждение обмена подачи накладной<br/>
                              <xsl:if test="pomf:FeedBillAgency/cat_ru:OrganizationName">
                                 <xsl:value-of select="pomf:FeedBillAgency/cat_ru:OrganizationName"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt">Учреждение назначения<br/>
                              <xsl:value-of select="pomf:DestinationAgency/cat_ru:OrganizationName"/>
                           </td>
                           <td rowspan="2">
                              <table>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:PrioritySign='1' or pomf:PrioritySign='t'or pomf:PrioritySign='true'">X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Приоритетная</td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:PrioritySign='0' or pomf:PrioritySign='f'or pomf:PrioritySign='false'">X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Неприоритетная</td>
                                 </tr>
                              </table>
                           </td>
                           <td rowspan="2" style="border:solid 0pt">
                              <table>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:AirTransport">X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Авиа</td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
											 </td>
                                    <td>S.A.L.</td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:RW_Transport | pomf:AutoTransport | pomf:SeaTransport">X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Наземный путь</td>
                                 </tr>
                              </table>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt">Назначенный оператор, которому принадлежат емкости<br/>
                              <xsl:if test="pomf:OperatorContainerOwner">
                                 <xsl:value-of select="pomf:OperatorContainerOwner"/>
                              </xsl:if>
                           </td>
                        </tr>
                     </table>
                     <table style="border:solid 1pt #000000; border-collapse: collapse" width="100%">
                        <tr>
                           <td colspan="4" style="border:solid 0pt #000000;" valign="top"> </td>
                           <td>Дата отправки<br/>
                              <xsl:if test="pomf:AirTransport">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="pomf:AirTransport/pomf:SendDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                              <xsl:if test="pomf:RW_Transport">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="pomf:RW_Transport/pomf:SendDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                              <xsl:if test="pomf:AutoTransport">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="pomf:AutoTransport/pomf:SendDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                           </td>
                           <td valign="top">Время<br/>
                              <xsl:if test="pomf:AirTransport/pomf:SendTime">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="substring(pomf:AirTransport/pomf:SendTime, 1, 8)"/>
                              </xsl:if>
                              <xsl:if test="pomf:RW_Transport/pomf:SendTime">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="substring(pomf:RW_Transport/pomf:SendTime, 1, 8)"/>
                              </xsl:if>
                              <xsl:if test="pomf:AutoTransport/pomf:SendTime">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="substring(pomf:AutoTransport/pomf:SendTime, 1, 8)"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td>Тип возвращаемых емкостей</td>
                           <td> </td>
                           <td style="border-bottom:1px solid #000000;">№ рейса<br/>
                              <xsl:if test="pomf:AirTransport">
                                 <xsl:value-of select="pomf:AirTransport/pomf:FlightNumber"/>
                              </xsl:if>
                           </td>
                           <td style="border-bottom:1px solid #000000;">Аэропорт прямой перегрузки<br/>
                              <xsl:if test="pomf:AirTransport">
                                 <xsl:value-of select="pomf:AirTransport/pomf:DirectOverloadAirport"/>
                              </xsl:if>
                           </td>
                           <td style="border-bottom:1px solid #000000;">Аэропорт выгрузки<br/>
                              <xsl:if test="pomf:AirTransport">
                                 <xsl:value-of select="pomf:AirTransport/pomf:UnloadAirport"/>
                              </xsl:if>
                           </td>
                           <td style="border-bottom:1px solid #000000;"> </td>
                        </tr>
                        <tr>
                           <td valign="bottom">
                              <table>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:ReturnedContainersKind/pomf:PriorityAviaKind='1' or pomf:ReturnedContainersKind/pomf:PriorityAviaKind='t' or pomf:ReturnedContainersKind/pomf:PriorityAviaKind='true'">X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Приоритетные/Авиа</td>
                                 </tr>
                              </table>
                           </td>
                           <td> </td>
                           <td style="border-bottom:1px solid #000000;">№ поезда<br/>
                              <xsl:if test="pomf:RW_Transport">
                                 <xsl:value-of select="pomf:RW_Transport/pomf:TransportNumber"/>
                              </xsl:if>
                              <xsl:if test="pomf:AutoTransport">
                                 <xsl:value-of select="pomf:AutoTransport/pomf:TransportNumber"/>
                              </xsl:if>
                           </td>
                           <td colspan="2" style="border-bottom:1px solid #000000;">Путь направления<br/>
                              <xsl:if test="pomf:RW_Transport">
                                 <xsl:value-of select="pomf:RW_Transport/pomf:Direction"/>
                              </xsl:if>
                              <xsl:if test="pomf:AutoTransport">
                                 <xsl:value-of select="pomf:AutoTransport/pomf:Direction"/>
                              </xsl:if>
                           </td>
                           <td style="border-bottom:1px solid #000000;"> </td>
                        </tr>
                        <tr>
                           <td>
                              <table>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:ReturnedContainersKind/pomf:UnpriorityLandKind='1' or pomf:ReturnedContainersKind/pomf:UnpriorityLandKind='t' or pomf:ReturnedContainersKind/pomf:UnpriorityLandKind='true'">
											X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Неприоритетные/Наземные</td>
                                 </tr>
                              </table>
                           </td>
                           <td> </td>
                           <td>Название судна<br/>
                              <xsl:if test="pomf:SeaTransport">
                                 <xsl:value-of select="pomf:SeaTransport/pomf:ShipName"/>
                              </xsl:if>
                           </td>
                           <td>Порт выгрузки<br/>
                              <xsl:if test="pomf:SeaTransport">
                                 <xsl:value-of select="pomf:SeaTransport/pomf:UnloadingPort"/>
                              </xsl:if>
                           </td>
                           <td>Компания<br/>
                              <xsl:if test="pomf:SeaTransport/pomf:Company">
                                 <xsl:value-of select="pomf:SeaTransport/pomf:Company"/>
                              </xsl:if>
                           </td>
                           <td> </td>
                        </tr>
                        <tr>
                           <td>
                              <table>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:ReturnedContainersKind/pomf:ParcelKind='1' or pomf:ReturnedContainersKind/pomf:ParcelKind='t' or pomf:ReturnedContainersKind/pomf:ParcelKind='true'">
											X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>Посылки</td>
                                 </tr>
                              </table>
                           </td>
                           <td colspan="5"> </td>
                        </tr>
                        <tr>
                           <td valign="top">
                              <table>
                                 <tr>
                                    <td align="center" class="graphMain" style="border:solid 0.8pt #000000; width:5mm;">
                                       <xsl:choose>
                                          <xsl:when test="pomf:ReturnedContainersKind/pomf:EMSKind='1' or pomf:ReturnedContainersKind/pomf:EMSKind='t' or pomf:ReturnedContainersKind/pomf:EMSKind='true'">
											X</xsl:when>
                                          <xsl:otherwise> </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                    <td>EMS</td>
                                 </tr>
                              </table>
                           </td>
                           <td colspan="3" style="border-top:1px solid #000000; border-left:1px solid #000000;">В случае использования контейнера</td>
                           <td colspan="2" style="border-top:1px solid #000000;">
                              <table>
                                 <tr>
                                    <td>№ контейнера</td>
                                    <td>№ печати</td>
                                 </tr>
                                 <xsl:for-each select="pomf:Container">
                                    <tr>
                                       <td>
                                          <xsl:value-of select="pomf:ContainerNumber"/>
                                       </td>
                                       <td>
                                          <xsl:if test="pomf:StampNumber">
                                             <xsl:value-of select="pomf:StampNumber"/>
                                          </xsl:if>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </table>
                           </td>
                        </tr>
                     </table>
                     <table>
                        <tr>
                           <td>
                              <b>Запись</b>
                           </td>
                        </tr>
                     </table>
                     <table style="border-collapse: collapse; border:solid 1pt black;" width="100%">
                        <tr>
                           <td align="center" style="border:solid 1pt black;">№ депеши</td>
                           <td align="center" style="border:solid 1pt black;">Учреждение подачи</td>
                           <td align="center" style="border:solid 1pt black;">Учреждение назначения</td>
                           <td align="center" style="border:solid 1pt black;">Кол-во партий порожних мешков и других возвращаемых порожних емкостей</td>
                           <td align="center" style="border:solid 1pt black;">Вес брутто, кг</td>
                           <td align="center" style="border:solid 1pt black;">Примечания</td>
                        </tr>
                        <tr>
                           <td align="center" style="border:solid 1pt black;">1</td>
                           <td align="center" style="border:solid 1pt black;">2</td>
                           <td align="center" style="border:solid 1pt black;">3</td>
                           <td align="center" style="border:solid 1pt black;">4</td>
                           <td align="center" style="border:solid 1pt black;">5</td>
                           <td align="center" style="border:solid 1pt black;">6</td>
                        </tr>
                        <xsl:for-each select="pomf:DespatchInfo">
                           <tr>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:value-of select="pomf:DespatchNumber"/>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:value-of select="pomf:FilingAgency"/>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:value-of select="pomf:DestinationAgency"/>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:EmptyContainers/pomf:Quantity">
                                    <xsl:value-of select="pomf:EmptyContainers/pomf:Quantity"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:if test="pomf:EmptyContainers/pomf:Weight">
                                    <xsl:value-of select="pomf:EmptyContainers/pomf:Weight"/>
                                 </xsl:if>
                              </td>
                              <td align="center" style="border:solid 1pt black;">
                                 <xsl:for-each select="pomf:Comments">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position()!=last()"> </xsl:if>
                                 </xsl:for-each>
                              </td>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="right" colspan="3" style="border:solid 1pt black;">
                              <b>Итого</b>
                           </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalEmptyContainers/pomf:Quantity">
                                 <xsl:value-of select="pomf:TotalEmptyContainers/pomf:Quantity"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;">
                              <xsl:if test="pomf:TotalEmptyContainers/pomf:Weight">
                                 <xsl:value-of select="pomf:TotalEmptyContainers/pomf:Weight"/>
                              </xsl:if>
                           </td>
                           <td align="center" style="border:solid 1pt black;"> </td>
                        </tr>
                     </table>
                  </xsl:when>
               </xsl:choose>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
