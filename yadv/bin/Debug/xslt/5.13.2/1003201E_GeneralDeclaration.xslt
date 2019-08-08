<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru gd" version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gd="urn:customs.ru:Information:TransportDocuments:Sea:GeneralDeclaration:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template name="russian_datetime">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="substring($dateIn,12,8)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="gd:GeneralDeclaration">
      <html>
         <head>
            <title>Общая (генеральная) декларация</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 297mm;
						height: 210mm;
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
						font-size: 9pt;
						font-weight: bold;
						}
				</style>
         </head>
         <body>
            <div class="page">
               <h2>ИМО ГЕНЕРАЛЬНАЯ (ОБЩАЯ) ДЕКЛАРАЦИЯ</h2>
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:75mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:61.5mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:7.5mm;">
                           
                           <xsl:if  test="(gd:ArrivalIndicator='true') or (gd:ArrivalIndicator='t') or (gd:ArrivalIndicator='1')" >
                              <xsl:text>X</xsl:text>
                           </xsl:if>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:25.5mm;">Приход</td>
                        <td align="center" class="graph" style="width:7.5mm;">
                           
                           <xsl:if  test="(gd:ArrivalIndicator='false') or (gd:ArrivalIndicator='f') or (gd:ArrivalIndicator='0')" >
                              <xsl:text>X</xsl:text>
                           </xsl:if>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:25.5mm;">Отход</td>
                        <td class="graph" style="width:65mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:136.5mm;">
                           <span class="graph">1.Название и описание судна</span>
                           <br/>
                           <xsl:value-of select="gd:VesselRegistration/catTrans_ru:Name"/>
                           <br/>
								Тип судна: <xsl:value-of select="gd:VesselRegistration/gd:VesselType"/>
                        </td>
                        <td colspan="4" style="width:66mm;">
                           <span class="graph">2.Порт прихода/отхода</span>
                           <br/>
                           <!--xsl:value-of select="gd:VesselRegistration/cat_ru:NameInf"/-->
                           <xsl:choose>
                              <xsl:when test="(gd:ArrivalIndicator)=1">
                                 <xsl:value-of select="gd:Arrival/gd:PortName"/> (<xsl:value-of select="gd:Arrival/gd:CountyName"/>)
									</xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="gd:Sailing/gd:PortName"/> (<xsl:value-of select="gd:Sailing/gd:CountyName"/>)
									</xsl:otherwise>
                           </xsl:choose>
                        </td>
                        <td style="width:65mm;">
                           <span class="graph">3.Дата-время прихода/отхода</span>
                           <br/>
                           <!--xsl:value-of select="gd:VesselRegistration/cat_ru:NameInf"/-->
                           <xsl:choose>
                              <xsl:when test="(gd:ArrivalIndicator)=1">
                                 <xsl:call-template name="russian_datetime">
                                    <xsl:with-param name="dateIn" select="gd:Arrival/gd:DateTimeInf"/>
                                 </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:call-template name="russian_datetime">
                                    <xsl:with-param name="dateIn" select="gd:Sailing/gd:DateTimeInf"/>
                                 </xsl:call-template>
                              </xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:75mm;">
                           <span class="graph">4.Национальная принадлежность судна</span>
                           <br/>
                           <xsl:value-of select="gd:VesselRegistration/catTrans_ru:NationalityCode"/>
                        </td>
                        <td style="width:61.5mm;">
                           <span class="graph">5.Фамилия капитана</span>
                           <br/>
                           <xsl:value-of select="gd:VesselRegistration/catTrans_ru:Shipmaster"/>
                        </td>
                        <td colspan="5" style="width:131mm;">
                           <span class="graph">6.Порт отправления/ Порт назначения</span>
                           <br/>
                           <xsl:value-of select="gd:DeparturePort"/>
                           <xsl:text>/</xsl:text>
                           <xsl:value-of select="gd:DestinationPort"/>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:136.5mm;">
                           <span class="graph">7.Свидетельство о регистрации (порт, дата, номер)</span>
                           <br/>
                           <xsl:value-of select="gd:VesselRegistration/gd:RegistrationPort"/>
                           <xsl:text>, </xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="gd:VesselRegistration/gd:RegistrationDate"/>
                           </xsl:call-template>
                           <xsl:text>, </xsl:text>
                           <xsl:value-of select="gd:VesselRegistration/gd:RegistrationID"/>
                        </td>
                        <td colspan="5" style="width:131mm;">
                           <span class="graph">8.Наименование и адрес судового агента</span>
                           <xsl:if test="gd:ShipAgent/cat_ru:OrganizationName">
							   <xsl:value-of select="gd:ShipAgent/cat_ru:OrganizationName"/>
                           </xsl:if>
                           <xsl:if test="gd:ShipAgent/cat_ru:ShortName and not(gd:ShipAgent/cat_ru:OrganizationName)">
							   <xsl:value-of select="gd:ShipAgent/cat_ru:ShortName"/>
                           </xsl:if>
                           <br/>
                           <xsl:value-of select="gd:ShipAgent/cat_ru:Address/cat_ru:PostalCode"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:ShipAgent/cat_ru:Address/cat_ru:CountryCode"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:ShipAgent/cat_ru:Address/cat_ru:Region"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:ShipAgent/cat_ru:Address/cat_ru:StreetHouse"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:ShipAgent/cat_ru:Address/cat_ru:City"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:75mm;">
                           <span class="graph">9.Валовая вместимость</span>
                           <br/>
                           <xsl:value-of select="gd:VesselRegistration/gd:GrossTonnage"/>
                        </td>
                        <td style="width:61.5mm;">
                           <span class="graph">10.Чистая вместимость</span>
                           <br/>
                           <xsl:value-of select="gd:VesselRegistration/gd:NetTonnage"/>
                        </td>
                        <td class="graph" colspan="5" style="width:131mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:136.5mm;">
                           <span class="graph">11.Место стоянки в порту</span>
                           <br/>
                           <xsl:value-of select="gd:Mooring"/>
                        </td>
                        <td class="graph" colspan="5" style="width:131mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="7" style="width:267.5mm;">
                           <span class="graph">12.Краткие сведения о рейсе (предыдущие и последующие порты захода; подчеркнуть, где будет выгружен остающийся на борту груз)</span>
                           <br/>
                           <xsl:value-of select="gd:VoyageDescription"/>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="7" style="width:267.5mm;">
                           <span class="graph">13.Краткое описание груза</span>
                           <br/>
                           <xsl:value-of select="gd:GoodsDescription"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:75mm;">
                           <span class="graph">14.Количество членов экипажа судна (включая капитана)</span>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:MembershipNumber"/>
                        </td>
                        <td style="width:61.5mm;">
                           <span class="graph">15.Количество пассажиров</span>
                           <br/>
                           <xsl:value-of select="gd:PassengerNumber"/>
                        </td>
                        <td colspan="5" style="width:131mm;">
                           <span class="graph">16.Замечание</span>
                           <br/>
                           <!--<xsl:value-of select="gd:Notice"/>-->
                           <xsl:for-each select="gd:Notice">
                              <xsl:value-of select="."/> </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="2" style="width:136.5mm;">Прилагаемые документы
								<br/>
								(укажите количество экземпляров)
							</td>
                        <td class="graph" colspan="5" style="width:131mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:75mm;">
                           <span class="graph">17.Декларация о грузе</span>
                           <xsl:text> </xsl:text>
                           <!--ПОсмотреть, число каких деклараций нужно -прихода или отхода-->
                           <xsl:choose>
                              <xsl:when test="(gd:ArrivalIndicator)=1">
                                 <xsl:value-of select="gd:EnclosedDocument/gd:ArrivalCargoDeclarationCopyNumber"/>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="gd:EnclosedDocument/gd:SailingCargoDeclarationCopyNumber"/>
                              </xsl:otherwise>
                           </xsl:choose>
                        </td>
                        <td style="width:61.5mm;">
                           <span class="graph">18.Декларация о судовых запасах</span>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:EnclosedDocument/gd:ShipStoresDeclarationCopyNumber"/>
                        </td>
                        <td class="graph" colspan="5" style="width:131mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:75mm;">
                           <span class="graph">19.Судовая роль</span>
                           <br/>
                           <xsl:value-of select="gd:EnclosedDocument/gd:CrewListCopyNumber"/>
                        </td>
                        <td style="width:61.5mm;">
                           <span class="graph">20.Список пассажиров</span>
                           <br/>
                           <xsl:value-of select="gd:EnclosedDocument/gd:PassengerListCopyNumber"/>
                        </td>
                        <td colspan="5" style="width:131mm;">
                           <span class="graph">21.Дата и подпись капитана, уполномоченного агента или лица командного состава</span>
                           <br/>
                           <xsl:value-of select="gd:DocumentSignature/cat_ru:PersonPost"/>
                           <xsl:text> </xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="gd:DocumentSignature/cat_ru:IssueDate"/>
                           </xsl:call-template>
                           <xsl:text> _______________</xsl:text>
                           <xsl:value-of select="gd:DocumentSignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:DocumentSignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:DocumentSignature/cat_ru:PersonMiddleName"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:75mm;">
                           <span class="graph">22.Декларация о личных вещах экипажа *</span>
                           <br/>
                           <xsl:value-of select="gd:EnclosedDocument/gd:BaggageDeclarationCopyNumber"/>
                        </td>
                        <td style="width:61.5mm;">
                           <span class="graph">23.Морская санитарная декларация *</span>
                           <br/>
                           <xsl:value-of select="gd:EnclosedDocument/gd:SeaMedicalDeclarationCopyNumber"/>
                        </td>
                        <td class="graph" colspan="5" style="width:131mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <p align="left" class="graph">* Для использования официальными властями.</p>
            </div>
            <div class="page">
               <h2>IMO GENERAL DECLARATION</h2>
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:75mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:61.5mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:7.5mm;">
                           <xsl:if test="(gd:ArrivalIndicator)=1">
                              <xsl:text>X</xsl:text>
                           </xsl:if>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:25.5mm;">Arrival</td>
                        <td align="center" class="graph" style="width:7.5mm;">
                           <xsl:if test="(gd:ArrivalIndicator)=0">
                              <xsl:text>X</xsl:text>
                           </xsl:if>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:25.5mm;">Departure</td>
                        <td class="graph" style="width:65mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:136.5mm;">
                           <span class="graph">1.Name and description of ship</span>
                           <br/>
                           <xsl:value-of select="gd:VesselRegistration/catTrans_ru:Name"/>
                           <br/>
								Тип судна: <xsl:value-of select="gd:VesselRegistration/gd:VesselType"/>
                        </td>
                        <td colspan="4" style="width:66mm;">
                           <span class="graph">2.Port of arrival/departure</span>
                           <br/>
                           <xsl:choose>
                              <xsl:when test="(gd:ArrivalIndicator)=1">
                                 <xsl:value-of select="gd:Arrival/gd:PortName"/>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="gd:Sailing/gd:PortName"/>
                              </xsl:otherwise>
                           </xsl:choose>
                        </td>
                        <td style="width:65mm;">
                           <span class="graph">3.Date – time of arrival/departure</span>
                           <br/>
                           <xsl:choose>
                              <xsl:when test="(gd:ArrivalIndicator)=1">
                                 <xsl:call-template name="russian_datetime">
                                    <xsl:with-param name="dateIn" select="gd:Arrival/gd:DateTimeInf"/>
                                 </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:call-template name="russian_datetime">
                                    <xsl:with-param name="dateIn" select="gd:Sailing/gd:DateTimeInf"/>
                                 </xsl:call-template>
                              </xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:75mm;">
                           <span class="graph">4.Nationality of ship</span>
                           <br/>
                           <xsl:value-of select="gd:VesselRegistration/catTrans_ru:NationalityCode"/>
                        </td>
                        <td style="width:61.5mm;">
                           <span class="graph">5.Name of master</span>
                           <br/>
                           <xsl:value-of select="gd:VesselRegistration/catTrans_ru:Shipmaster"/>
                        </td>
                        <td colspan="5" style="width:131mm;">
                           <span class="graph">6.Port arrived from/Port of destination</span>
                           <br/>
                           <xsl:value-of select="gd:DeparturePort"/>
                           <xsl:text>/</xsl:text>
                           <xsl:value-of select="gd:DestinationPort"/>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:136.5mm;">
                           <span class="graph">7.Certificate of registry (Port, date, number)</span>
                           <br/>
                           <xsl:value-of select="gd:VesselRegistration/gd:RegistrationPort"/>
                           <xsl:text>, </xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="gd:VesselRegistration/gd:RegistrationDate"/>
                           </xsl:call-template>
                           <xsl:text>, </xsl:text>
                           <xsl:value-of select="gd:VesselRegistration/gd:RegistrationID"/>
                        </td>
                        <td colspan="5" style="width:131mm;">
                           <span class="graph">8.Name and address of ship’s agent</span>
                           <xsl:if test="gd:ShipAgent/cat_ru:OrganizationName">
							   <xsl:value-of select="gd:ShipAgent/cat_ru:OrganizationName"/>
                           </xsl:if>
                           <xsl:if test="gd:ShipAgent/cat_ru:ShortName and not(gd:ShipAgent/cat_ru:OrganizationName)">
							   <xsl:value-of select="gd:ShipAgent/cat_ru:ShortName"/>
                           </xsl:if>
                           <br/>
                           <xsl:value-of select="gd:ShipAgent/cat_ru:Address/cat_ru:PostalCode"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:ShipAgent/cat_ru:Address/cat_ru:CountryCode"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:ShipAgent/cat_ru:Address/cat_ru:Region"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:ShipAgent/cat_ru:Address/cat_ru:StreetHouse"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:ShipAgent/cat_ru:Address/cat_ru:City"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:75mm;">
                           <span class="graph">9.Gross tonnage</span>
                           <br/>
                           <xsl:value-of select="gd:VesselRegistration/gd:GrossTonnage"/>
                        </td>
                        <td style="width:61.5mm;">
                           <span class="graph">10.Net tonnage</span>
                           <br/>
                           <xsl:value-of select="gd:VesselRegistration/gd:NetTonnage"/>
                        </td>
                        <td class="graph" colspan="5" style="width:131mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:136.5mm;">
                           <span class="graph">11.Position of the ship in the port (berth or station)</span>
                           <br/>
                           <xsl:value-of select="gd:Mooring"/>
                        </td>
                        <td class="graph" colspan="5" style="width:131mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="7" style="width:267.5mm;">
                           <span class="graph">12.Brief particulars of voyage (previous and subsequent ports of call: underline where remaining cargo will be discharged)</span>
                           <br/>
                           <xsl:value-of select="gd:VoyageDescription"/>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="7" style="width:267.5mm;">
                           <span class="graph">13.Brief description of the cargo</span>
                           <br/>
                           <xsl:value-of select="gd:GoodsDescription"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:75mm;">
                           <span class="graph">14.Number of crew (incl. master)</span>
                           <br/>
                           <xsl:value-of select="gd:MembershipNumber"/>
                        </td>
                        <td style="width:61.5mm;">
                           <span class="graph">15.Number of passengers</span>
                           <br/>
                           <xsl:value-of select="gd:PassengerNumber"/>
                        </td>
                        <td colspan="5" style="width:131mm;">
                           <span class="graph">16.Remarks</span>
                           <br/>
                           <!--<xsl:value-of select="gd:Notice"/>-->
                           <xsl:for-each select="gd:Notice">
                              <xsl:value-of select="."/> </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="2" style="width:136.5mm;">Attached documents
								<br/>
								(indicate number of copies)
							</td>
                        <td class="graph" colspan="5" style="width:131mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:75mm;">
                           <span class="graph">17.Cargo Declaration</span>
                           <xsl:text> </xsl:text>
                           <!--ПОсмотреть, число каких деклараций нужно -прихода или отхода-->
                           <xsl:choose>
                              <xsl:when test="(gd:ArrivalIndicator)=1">
                                 <xsl:value-of select="gd:EnclosedDocument/gd:ArrivalCargoDeclarationCopyNumber"/>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="gd:EnclosedDocument/gd:SailingCargoDeclarationCopyNumber"/>
                              </xsl:otherwise>
                           </xsl:choose>
                        </td>
                        <td style="width:61.5mm;">
                           <span class="graph">18.Ship’s Stores Declaration</span>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:EnclosedDocument/gd:ShipStoresDeclarationCopyNumber"/>
                        </td>
                        <td class="graph" colspan="5" style="width:131mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:75mm;">
                           <span class="graph">19.Crew List</span>
                           <br/>
                           <xsl:value-of select="gd:EnclosedDocument/gd:CrewListCopyNumber"/>
                        </td>
                        <td style="width:61.5mm;">
                           <span class="graph">20.Passenger List</span>
                           <br/>
                           <xsl:value-of select="gd:EnclosedDocument/gd:PassengerListCopyNumber"/>
                        </td>
                        <td colspan="5" style="width:131mm;">
                           <span class="graph">21.Date and signature by master, authorized agent or officer</span>
                           <br/>
                           <xsl:value-of select="gd:DocumentSignature/cat_ru:PersonPost"/>
                           <xsl:text> </xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="gd:DocumentSignature/cat_ru:IssueDate"/>
                           </xsl:call-template>
                           <xsl:text> _______________</xsl:text>
                           <xsl:value-of select="gd:DocumentSignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:DocumentSignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="gd:DocumentSignature/cat_ru:PersonMiddleName"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:75mm;">
                           <span class="graph">22.Crew’s Effects Declaration *</span>
                           <br/>
                           <xsl:value-of select="gd:EnclosedDocument/gd:BaggageDeclarationCopyNumber"/>
                        </td>
                        <td style="width:61.5mm;">
                           <span class="graph">23.Maritime Declaration of Health *</span>
                           <br/>
                           <xsl:value-of select="gd:EnclosedDocument/gd:SeaMedicalDeclarationCopyNumber"/>
                        </td>
                        <td class="graph" colspan="5" style="width:131mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <p align="left" class="graph">* For official use.</p>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
