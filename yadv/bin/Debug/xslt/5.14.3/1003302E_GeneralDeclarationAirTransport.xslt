<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gdat="urn:customs.ru:Information:TransportDocuments:Air:GeneralDeclarationAirTransport:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="gdat:GeneralDeclarationAirTransport">
      <html>
         <head>
            <title>Генеральная авиа декларация</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 6.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }
					td.bold { font-size: 8.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 10.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
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
					span.bold { font-size: 12.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 12.0pt; font-family: Courier; color: windowtext; }
					span.value2 { font-size: 10.0pt; font-family: Courier; color: windowtext; }
					div.page { width: 210mm; height: 297mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
						.graphMainbold {
						font-family: Arial;
						font-size: 10pt;
						font-weight:bold;
						}
					.bordered {
					border-bottom: solid 1pt #000000;
					font-weight: bold;
										}	
											.borderednormal {
					border-bottom: solid 1pt #000000;
					font-weight: normal;
										}	
					td.value2 { font-size: 10.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; white-space: nowrap; border-bottom: solid 1pt #000000;}
					
				
					td.value3 {
						font-family: Arial;
						font-size: 8pt;
						font-weight:bold;
						}
							span.value5 {
						font-family: Arial;
						font-size: 8pt;
						font-weight:normal;
						}
								
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graph-number { font-size: 9pt; font-weight: bold; }
				</style>
         </head>
         <body>
            <div class="page">
               <span class="graphMainbold">
				ГЕНЕРАЛЬНАЯ ДЕКЛАРАЦИЯ<br/>
				GENERAL DECLARATION
				</span>
               <p/>
               <p align="left">
                  <span class="graphMainbold">
					Owner or Operator: </span>
                  <span class="bordered">
                     <xsl:value-of select="gdat:Carrier"/>
                  </span>
                  <br/>
                  <br/>
                  <span class="graphMainbold">Marks of Nationality and Registration:</span>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <span class="bordered">
                     <xsl:value-of select="gdat:Flight/catTrans_ru:AirPlaneRegNum"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="gdat:Flight/catTrans_ru:Mark"/>
                  </span>
                  <span class="graphMainbold">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Flight No
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </span>
                  <span class="bordered">
                     <xsl:value-of select="gdat:Flight/catTrans_ru:FlightNumber"/>
                  </span>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <span class="graphMainbold">Date :</span>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <span class="bordered">
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="gdat:Flight/catTrans_ru:FlightDate"/>
                     </xsl:call-template>
                  </span>
                  <br/>
                  <span class="graphMainbold">
                     <br/>Departure from:
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </span>
                  <span class="bordered">
                     <xsl:value-of select="gdat:Flight/catTrans_ru:DepartureAirport/catTrans_ru:IATACode"/>
                     <xsl:if test="gdat:Flight/catTrans_ru:DepartureAirport/catTrans_ru:Name">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(<xsl:value-of select="gdat:Flight/catTrans_ru:DepartureAirport/catTrans_ru:Name"/>)</xsl:if>
                  </span>
                  <span class="graphMainbold">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Arrival at:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </span>
                  <span class="bordered">
                     <xsl:value-of select="gdat:DestinationAirport/catTrans_ru:IATACode"/>
                     <xsl:if test="gdat:DestinationAirport/catTrans_ru:Name">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(<xsl:value-of select="gdat:DestinationAirport/catTrans_ru:Name"/>)</xsl:if>
                  </span>
                  <br/>
                  <br/>
               </p>
               <xsl:for-each select="gdat:RoutingInfo">
                  <p align="center">
                     <span class="borderednormal">
                        <xsl:value-of select="catTrans_ru:CarrierName"/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="catTrans_ru:CarrierCode"/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="catTrans_ru:FlightNumber"/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="catTrans_ru:FlightDate"/>
                        </xsl:call-template>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="catTrans_ru:Airport/catTrans_ru:Name"/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </span>
                  </p>
               </xsl:for-each>
               <span class="value">FLIGHT ROUTING</span>
               <br/>
               <span class="borderednormal">
                  <xsl:if test="(gdat:RoutingSign='true') or (gdat:RoutingSign='t') or (gdat:RoutingSign='1')">Прилет</xsl:if>
                  <xsl:if test="(gdat:RoutingSign='false') or (gdat:RoutingSign='f') or (gdat:RoutingSign='0')">Вылет</xsl:if>
               </span>
               <table border="1" cellpadding="0" cellspacing="0">
                  <tbody>
                     <tr>
                        <td class="value" width="50%">PLACE</td>
                        <td class="value" width="50%">TOTAL NUMBER OF CREW (<xsl:value-of select="gdat:CrewMembersNumber"/>)</td>
                        <td class="value" width="50%">NUMBER OF PASSENGERS<br/> ON THIS STAGE (<xsl:value-of select="gdat:PassengerQuantity/gdat:DeparturePass"/>)</td>
                     </tr>
                     <tr>
                        <td class="value" rowspan="12" width="50%">
                           <xsl:for-each select="gdat:RoutingInfo">
                              <xsl:value-of select="catTrans_ru:Airport/catTrans_ru:IATACode"/>
                              <br/>
                           </xsl:for-each>
                        </td>
                        <td align="center" rowspan="12" width="50%">
                           <table align="center" border="0" cellpadding="0" cellspacing="0" style="width:100%">
                              <tbody>
                                 <xsl:for-each select="gdat:CockpitPersonnel">
                                    <tr>
                                       <td class="value2">
                                          <xsl:value-of select="cat_ru:PersonSurname"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="cat_ru:PersonName"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="cat_ru:PersonMiddleName"/>
                                          <br/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                        <td class="value3" width="50%">Departure Place:
								<xsl:if test="(gdat:RoutingSign='false') or (gdat:RoutingSign='f') or (gdat:RoutingSign='0')">
                              <xsl:if test="(gdat:SignInOut/gdat:LandingSign='true') or (gdat:SignInOut/gdat:LandingSign='t') or (gdat:SignInOut/gdat:LandingSign='1')">
								Воздушное судно совершит промежуточную вынужденную <br/>(техническую) посадку на территории Российской Федерации<br/>
                              </xsl:if>
                              <xsl:if test="(gdat:SignInOut/gdat:GoodSign='true') or (gdat:SignInOut/gdat:GoodSign='t') or (gdat:SignInOut/gdat:GoodSign='1')">
								На борту отсутствуют товары, подлежащие <br/>разгрузке (выгрузке) или погрузке в места посадки.
							    </xsl:if>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="value3">Embarking	<xsl:value-of select="gdat:DepartureCountry/gdat:CountryName"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="value3">Through on same fight</td>
                     </tr>
                     <tr>
                        <td class="value3">Arrival Place:
								<xsl:if test="(gdat:RoutingSign='true') or (gdat:RoutingSign='t') or (gdat:RoutingSign='1')">
                              <xsl:if test="(gdat:SignInOut/gdat:LandingSign='true') or (gdat:SignInOut/gdat:LandingSign='t') or (gdat:SignInOut/gdat:LandingSign='1')">
								Воздушное судно совершит промежуточную вынужденную <br/>(техническую) посадку на территории Российской Федерации<br/>
                              </xsl:if>
                              <xsl:if test="(gdat:SignInOut/gdat:GoodSign='true') or (gdat:SignInOut/gdat:GoodSign='t') or (gdat:SignInOut/gdat:GoodSign='1')">
								На борту отсутствуют товары, подлежащие <br/>разгрузке (выгрузке) или погрузке в места посадки.
							    </xsl:if>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="value3">Disembarking <xsl:value-of select="gdat:DestinationCountry/gdat:CountryName"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="value3">Through on same fight</td>
                     </tr>
                     <tr>
                        <td class="value3">Additional information</td>
                     </tr>
                     <tr>
                        <td class="value3">Fuel <xsl:value-of select="gdat:FuelInfo/gdat:FuelQuantity"/> (<xsl:value-of select="gdat:FuelInfo/gdat:FuelQualifierName"/>)
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					Max.fuel capacity - <xsl:value-of select="gdat:FuelInfo/gdat:MaxFuelQuantity"/>(<xsl:value-of select="gdat:FuelInfo/gdat:FuelQualifierName"/>)
					</td>
                     </tr>
                     <tr>
                        <td class="value3">Oil <xsl:value-of select="gdat:POLInformation/gdat:ItemQuantity"/> (<xsl:value-of select="gdat:POLInformation/gdat:QuantityCode"/>)
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					Receipt №
					</td>
                     </tr>
                     <tr>
                        <td class="value3">Meals <xsl:value-of select="gdat:FoodSetQuantity"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="value3">The remedies which structure contains narcotic,<br/>
					 drastic remedies, psychotropic and <br/>
					 poisonous substances. Air waybill №  <xsl:for-each select="gdat:PsychotropicAgentInfo">
                              <xsl:apply-templates select="gdat:AirWayBillNumber"/>
                              <xsl:if test="gdat:BillNumber">; Expenditury Bill №
										<xsl:value-of select="gdat:BillNumber"/>
                              </xsl:if>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="value3">
                           <span class="bordered">Weapon and ammunition. Air waybill № 
								<xsl:for-each select="gdat:WeaponInfo">
                                 <xsl:apply-templates select="gdat:AirWayBillNumber"/>
                                 <xsl:if test="gdat:BillNumber">; Expenditury Bill №
										<xsl:value-of select="gdat:BillNumber"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td class="value3" colspan="2" rowspan="2">DECLARATION OF HEALTH<br/>
								Name and seat number or function of persons on board with illnesses other than <br/>
								airsickness or the effects of accidents, who may be suffering from a communicable<br/>
								 disease (a fever - temperature 38'C/ 100'F or greater - associated with one or more<br/>
								  of the following signs or symptoms, e.g. appearing obviously unwell; persistent <br/>
								  coughing;impaired breathing; persistent diarrhea; persistent vomiting; skin rash; <br/>
								  bruising or bleeding wuthout previous injury; or confusion of recent onset, <br/>
								  increases the likelihood that the person is suffering a communicable disease) as<br/>
								   well as such cases of illness disembarked during a previous stop)
								</td>
                        <td align="center" class="value2" rowspan="3">FOR OFFICIAL USE <br/>ONLY</td>
                     </tr>
                     <tr>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <br/>
                     </tr>
                     <tr>
                        <td class="value3" colspan="2">Details of each disinsection or sanitary treatment (place, date, time, method) <br/> during the flight. If no disinsection has been carried out during the flight, give <br/> details of most recent disinsection <br/>
                           <br/> 
		Signed, if required, with time and date		
			<span class="bordered">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </span>
                           <br/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <span class="value5">Crew member concerned</span>
                        </td>
                     </tr>
                     <tr>
                        <td class="value3" colspan="3">I declare that all statements and particulars contained in this General Declaration, and in any supplementary forms required to be <br/> presented with this General Declaration are complete, exact and true to the best of my knowledge and that through passengers will<br/> continue/have continued on the flight.<br/>
                           <br/>
                           <br/>
                           <p align="right">Signature 
					<span class="bordered">
                                 <xsl:value-of select="gdat:DocumentSignature/cat_ru:PersonSurname"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="gdat:DocumentSignature/cat_ru:PersonName"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="gdat:DocumentSignature/cat_ru:PersonMiddleName"/> /<xsl:value-of select="gdat:DocumentSignature/cat_ru:PersonPost"/>/
							</span>
                              <br/>Authorized Agent or Pilot-in-Command
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </p>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <div class="page">
				<span class="graphMainbold">ДОПОЛНИТЕЛЬНАЯ ИНФОРМАЦИЯ</span>
				<br/><br/>
				<p align="left">
					<xsl:if test="gdat:DateBegTransitGoodsOfTheCU">
						<span class="value2">Дата начала международной перевозки грузов по территории Таможенного Союза: </span>
						<span class="bordered">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="gdat:DateBegTransitGoodsOfTheCU"/>
							</xsl:call-template>
						</span>
						<br/>
					</xsl:if>
					<xsl:if test="gdat:DateReturnVehicle">
						<span class="value2">Дата обратного ввоза/вывоза транспортного средства: </span>
						<span class="bordered">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="gdat:DateReturnVehicle"/>
							</xsl:call-template>
						</span>
						<br/>
					</xsl:if>
					<xsl:if test="gdat:FlyAwayKit">
						<span class="value2">Наличие на борту ВС технической аптечки (Fly Away Kit): </span>
						<span class="bordered">
							<xsl:choose>
								<xsl:when test="gdat:FlyAwayKit=1 or gdat:FlyAwayKit='true'">Да</xsl:when>
								<xsl:when test="gdat:FlyAwayKit=0 or gdat:FlyAwayKit='false'">Нет</xsl:when>
								<xsl:otherwise><xsl:value-of select="gdat:FlyAwayKit"/></xsl:otherwise>
							</xsl:choose>
						</span>
						<br/>
					</xsl:if>	
				</p>	
				<xsl:if test="gdat:EquipmentInfo">
					<br/>
					<p align="left"><span class="graphMainbold">Запасные части и оборудование на борту:</span></p>
					<table border="1" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td class="value2" width="50%">Наименование агрегата</td>
								<td class="value2" width="25%">Партийный номер агрегата</td>
								<td class="value2" width="25%">Серийный номер агрегата</td>
							</tr>
							<xsl:for-each select="gdat:EquipmentInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<xsl:if test="gdat:GDATGoodsInfo">
					<br/>
					<p align="left"><span class="graphMainbold">Информация о грузе:</span></p>
					<xsl:apply-templates select="gdat:GDATGoodsInfo"/>
				</xsl:if>
				<xsl:if test="gdat:GDAT_MPOInfo">
					<br/>
					<p align="left"><span class="graphMainbold">Информация о почте:</span></p>
					<xsl:apply-templates select="gdat:GDAT_MPOInfo"/>
				</xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
	<!-- Шаблон для типа gdat:EquipmentInfoType -->
	<xsl:template match="gdat:EquipmentInfo">
		<tr>
			<td class="value"><xsl:value-of select="gdat:EquipmentName"/></td>
			<td class="value"><xsl:value-of select="gdat:PartyUnitNumber"/></td>
			<td class="value"><xsl:value-of select="gdat:SerialUnitNumber"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа gdat:GDATGoodsInfoType -->
	<xsl:template match="gdat:GDATGoodsInfo">
		<p align="left">
			<span class="value2">Количество грузовых мест: </span>
			<span class="bordered"><xsl:value-of select="gdat:PlacesQuantity"/></span>
			<br/>
			<span class="value2">Вес товара в кг, брутто: </span>
			<span class="bordered"><xsl:value-of select="translate(gdat:GrossWeightQuantity, '.', ',')"/></span>
			<br/>
		</p>	
	</xsl:template>
	<!-- Шаблон для типа gdat:GDAT_MPOInfoType -->
	<xsl:template match="gdat:GDAT_MPOInfo">
		<p align="left">
			<span class="value2">Количество мест: </span>
			<span class="bordered"><xsl:value-of select="gdat:MPOPlacesQuantity"/></span>
			<br/>
			<span class="value2">Вес в кг: </span>
			<span class="bordered"><xsl:value-of select="translate(gdat:MPOGrossWeightQuantity, '.', ',')"/></span>
			<br/>
		</p>	
	</xsl:template>  
   <xsl:template match="gdat:AirWayBillNumber">
      <xsl:if test="catTrans_ru:AirlineIATACode">
         <xsl:value-of select="catTrans_ru:AirlineIATACode"/>
      </xsl:if>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="catTrans_ru:DocumentNumber"/>
   </xsl:template>
</xsl:stylesheet>
