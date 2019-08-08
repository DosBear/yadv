<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:asw="urn:customs.ru:Information:CustomsDocuments:AirShoppingWaybill:5.14.3" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="asw:AirShoppingWaybill ">
      <html>
         <head>
            <title>Товарно - транспортная накладная магазина на борту ВС</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				td.border-bottom { border-bottom: medium none;  } 
				td.border-right { border-left:medium none;  border-right: medium none;  border-top: medium none; border-bottom: medium none;  } 
				td.border-left { border-left:medium none; border-top: medium none; border-bottom: medium none;  } 
				td.border-top-bottom {    border-top: medium none; border-bottom: medium none;  } 
				table.border-right { border-left:medium none;  border-right: medium none;  border-top: medium none; border-bottom: medium none; border-collapse: collapse; } 
				table.border{  border-collapse: collapse; } 
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 295mm;
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
							font-family:Arial;
							font-size: 10pt;
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 8pt;
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
               <table border="0" style="width:275mm">
                  <tbody>
                     <tr>
                        <td align="center" colspan="10">
                           <span align="center" style="font-weight:bold;  ">ТОВАРНО - ТРАНСПОРТНАЯ НАКЛАДНАЯ МАГАЗИНА НА БОРТУ ВС 
									<xsl:value-of select="asw:Carrier/cat_ru:OrganizationName"/>
                              <br/>
                              <br/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" class="bold" colspan="10">Накладная №		
								<span class="normal">
                              <xsl:value-of select="asw:RegNumberWaybill"/>
                              <br/>
                              <br/>
                           </span>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" style="width:275mm">
                  <tbody>
                     <tr>
                        <td align="left" class="normal" colspan="1" style="width:43mm">Дата/время вылета <br/>
                        </td>
                        <td align="left" class="bold" colspan="1" style="width:30mm">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="asw:GoodsMovement/catTrans_ru:FlightDate"/>
                           </xsl:call-template>
                           <xsl:if test="asw:GoodsMovement/catTrans_ru:FlightTime">
                              <xsl:text>/</xsl:text>
                              <xsl:value-of select="asw:GoodsMovement/catTrans_ru:FlightTime"/>
                           </xsl:if>
                        </td>
                        <td align="left" class="normal" colspan="1" style="width:28mm">Рейс<br/>
                        </td>
                        <td align="left" class="bold" colspan="1" style="width:28mm">
                           <xsl:value-of select="asw:GoodsMovement/catTrans_ru:FlightNumber"/>
                        </td>
                        <xsl:if test="asw:GoodsMovement/asw:ReturnFlightNumber">
                           <td align="left" class="normal" colspan="1" style="width:28mm">Обр.рейс<br/>
                           </td>
                           <td align="left" class="bold" colspan="1" style="width:28mm">
                              <xsl:value-of select="asw:GoodsMovement/asw:ReturnFlightNumber"/>
                           </td>
                        </xsl:if>
                     </tr>
                     <tr>
                        <td align="left" class="normal" colspan="1" style="width:45mm">Аэропорт отправления<br/>
                        </td>
                        <td align="left" class="bold" colspan="1" style="width:28mm">
                           <xsl:if test="asw:GoodsMovement/catTrans_ru:DepartureAirport/catTrans_ru:Name">
                              <xsl:value-of select="asw:GoodsMovement/catTrans_ru:DepartureAirport/catTrans_ru:Name"/>
                              <xsl:text>,</xsl:text>
                           </xsl:if>
                           <xsl:value-of select="asw:GoodsMovement/catTrans_ru:DepartureAirport/catTrans_ru:IATACode"/>
                        </td>
                        <td align="left" class="normal" colspan="1" style="width:28mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <xsl:if test="asw:GoodsMovement/asw:DestinationAirport">
                           <td align="left" class="normal" colspan="2" style="width:45mm">Аэропорт назначения<br/>
                           </td>
                           <td align="left" class="bold" colspan="1" style="width:28mm">
                              <xsl:if test="asw:GoodsMovement/asw:DestinationAirport/catTrans_ru:Name">
                                 <xsl:value-of select="asw:GoodsMovement/asw:DestinationAirport/catTrans_ru:Name"/>
                                 <xsl:text>,</xsl:text>
                              </xsl:if>
                              <xsl:value-of select="asw:GoodsMovement/asw:DestinationAirport/catTrans_ru:IATACode"/>
                           </td>
                        </xsl:if>
                     </tr>
                     <tr>
                        <xsl:if test="asw:GoodsMovement/catTrans_ru:AirPlaneRegNum">
                           <td align="left" class="normal" colspan="1" style="width:45mm">Регистрационный номер ВС<br/>
                           </td>
                           <td align="left" class="bold" colspan="1" style="width:34mm">
                              <xsl:value-of select="asw:GoodsMovement/catTrans_ru:AirPlaneRegNum"/>
                           </td>
                        </xsl:if>
                        <xsl:if test="asw:GoodsMovement/catTrans_ru:Mark">
                           <td align="left" class="normal" colspan="1" style="width:28mm">Марка ВС<br/>
                           </td>
                           <td align="left" class="bold" colspan="1" style="width:28mm">
                              <xsl:value-of select="asw:GoodsMovement/catTrans_ru:Mark"/>
                           </td>
                        </xsl:if>
                     </tr>
                  </tbody>
               </table>
               <table border="0" style="width:275mm">
                  <tbody>
                     <tr>
                        <td align="left" class="normal" style="width:47mm"> Перевозчик: </td>
                        <td align="left" class="bold" colspan="4" style="width:160mm">
                           <xsl:value-of select="asw:Carrier/cat_ru:OrganizationName"/>
                           <xsl:text>, </xsl:text>
                           <xsl:value-of select="asw:Carrier/cat_ru:ShortName"/>
                        </td>
                     </tr>
                     <tr>
                        <xsl:if test="asw:Carrier/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                           <td align="left" class="normal" style="width:40mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" class="bold" colspan="4" style="width:160mm">
									ОГРН:
										<xsl:value-of select="asw:Carrier/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                           </td>
                        </xsl:if>
                     </tr>
                     <tr>
                        <xsl:if test="asw:Carrier/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                           <td align="left" class="normal" style="width:40mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" class="bold" colspan="4" style="width:160mm">
									ИНН:
										<xsl:value-of select="asw:Carrier/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                           </td>
                           <tr>
                              <xsl:if test="asw:Carrier/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                                 <td align="left" class="normal" style="width:40mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td align="left" class="bold" colspan="4" style="width:160mm">
									КПП:
										<xsl:value-of select="asw:Carrier/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                 </td>
                              </xsl:if>
                           </tr>
                        </xsl:if>
                     </tr>
                  </tbody>
               </table>
               <p align="left" class="normal"> Сведения о контейнере: </p>
               <table border="1" class="border-right " style="width:275mm">
                  <tbody>
                     <tr>
                        <td align="left" class="bold" colspan="1" style="width:30mm">Номер </td>
                        <td align="left" class="bold" colspan="1" style="width:30mm">Замок</td>
                        <td align="left" class="bold" colspan="1" style="width:30mm">Пломба</td>
                        <td class="border-right " style="width:185mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <xsl:for-each select="asw:ContainerInfo">
                        <tr>
                           <td align="left" class="normal" colspan="1" style="width:30mm">
                              <xsl:value-of select="asw:Number"/>
                           </td>
                           <xsl:choose>
                              <xsl:when test="asw:NumberLock">
                                 <td align="left" class="normal" colspan="1" style="width:30mm">
                                    <xsl:value-of select="asw:NumberLock"/>
                                 </td>
                              </xsl:when>
                              <xsl:otherwise>
                                 <td align="left" class="normal" colspan="1" style="width:30mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </xsl:otherwise>
                           </xsl:choose>
                           <xsl:choose>
                              <xsl:when test="asw:NumberSeal">
                                 <td align="left" class="normal" colspan="1" style="width:30mm">
                                    <xsl:value-of select="asw:NumberSeal"/>
                                 </td>
                              </xsl:when>
                              <xsl:otherwise>
                                 <td align="left" class="normal" colspan="1" style="width:30mm">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </xsl:otherwise>
                           </xsl:choose>
                           <td class="border-right " style="width:185mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <br/>
               <table border="1" class="border" style="width:275mm">
                  <tbody>
                     <tr>
                        <td align="center" class="bold" style="width:10mm">Код PLU</td>
                        <td align="center" class="bold" style="width:100mm">Наименование</td>
                        <td align="center" class="bold" style="width:10mm">Кол. отп.</td>
                        <td align="center" class="bold" style="width:10mm">Кол. возв.</td>
                        <td align="center" class="bold" style="width:10mm">Кол. прод.</td>
                        <td align="center" class="bold" style="width:20mm">Стоимость за ед.</td>
                        <td align="center" class="bold" style="width:10mm">Стоимость  прод.</td>
                        <td align="center" class="bold" style="width:10mm">Код валюту</td>
                        <td align="center" class="bold" style="width:95mm">Комментарии </td>
                     </tr>
                     <xsl:if test="asw:GoodsInfo/asw:FreeGoods">
                        <tr>
                           <td align="left" class="bold" colspan="23">Бесплатные товары</td>
                        </tr>
                        <xsl:for-each select="asw:GoodsInfo/asw:FreeGoods">
                           <tr>
                              <td align="left" class="normal" style="width:10mm">
                                 <xsl:value-of select="asw:PLUCodeFreeGoods"/>
                              </td>
                              <td align="left" class="normal" style="width:100mm">
                                 <xsl:value-of select="asw:NameFreeGoods"/>
                              </td>
                              <td align="left" class="normal" style="width:10mm">
                                 <xsl:value-of select="asw:NumberFreeGoods"/>
                              </td>
                              <xsl:choose>
                                 <xsl:when test="asw:NumberReturnFreeGoods">
                                    <td align="left" class="normal" style="width:10mm">
                                       <xsl:value-of select="asw:NumberReturnFreeGoods"/>
                                    </td>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <td align="left" class="normal" style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </xsl:otherwise>
                              </xsl:choose>
                              <td align="left" class="normal">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="left" class="normal">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="left" class="normal">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="left" class="normal">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="left" class="normal">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </xsl:if>
                     <xsl:if test="asw:GoodsInfo/asw:SoldGoods">
                        <tr>
                           <td align="left" class="bold" colspan="23">Продаваемые товары</td>
                        </tr>
                        <xsl:for-each select="asw:GoodsInfo/asw:SoldGoods/asw:GoodsList">
                           <tr>
                              <td align="left" class="normal" style="width:10mm">
                                 <xsl:value-of select="asw:PLUCode"/>
                              </td>
                              <td align="left" class="normal" style="width:100mm">
                                 <xsl:value-of select="asw:GoodsDescription"/>
                              </td>
                              <td align="left" class="normal" style="width:10mm">
                                 <xsl:value-of select="asw:NumberSentGoods"/>
                              </td>
                              <xsl:choose>
                                 <xsl:when test="asw:NumberReturnGoods">
                                    <td align="left" class="normal" style="width:10mm">
                                       <xsl:value-of select="asw:NumberReturnGoods"/>
                                    </td>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <td align="left" class="normal" style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </xsl:otherwise>
                              </xsl:choose>
                              <xsl:choose>
                                 <xsl:when test="asw:NumberSoldGoods">
                                    <td align="left" class="normal" style="width:10mm">
                                       <xsl:value-of select="asw:NumberSoldGoods"/>
                                    </td>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <td align="left" class="normal" style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </xsl:otherwise>
                              </xsl:choose>
                              <td align="left" class="normal" style="width:20mm">
                                 <xsl:value-of select="asw:PriceUnit"/>
                              </td>
                              <xsl:choose>
                                 <xsl:when test="asw:PriceGoods">
                                    <td align="left" class="normal" style="width:10mm">
                                       <xsl:value-of select="asw:PriceGoods"/>
                                    </td>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <td align="left" class="normal" style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </xsl:otherwise>
                              </xsl:choose>
                              <td align="left" class="normal" style="width:10mm">
                                 <xsl:value-of select="asw:CurrencyCode"/>
                              </td>
                              <xsl:choose>
                                 <xsl:when test="asw:Comments">
                                    <td align="left" class="normal" style="width:10mm">
										<xsl:for-each select="asw:Comments">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
										</xsl:for-each>
                                    </td>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <td align="left" class="normal" style="width:10mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </tr>
                        </xsl:for-each>
                     </xsl:if>
                  </tbody>
               </table>
               <xsl:if test="asw:GoodsInfo/asw:SoldGoods">
                  <p align="left" class="bold">
								Всего единиц товара: <xsl:value-of select="asw:GoodsInfo/asw:SoldGoods/asw:AllUnitGoods"/>
                     <xsl:text> </xsl:text> на сумму: <xsl:value-of select="asw:GoodsInfo/asw:SoldGoods/asw:TotalCostGoods"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="asw:GoodsInfo/asw:SoldGoods/asw:CurrencyCode"/>
                  </p>
                  <p align="left" class="bold"> Продано товара на сумму: 
									<xsl:value-of select="asw:GoodsInfo/asw:SoldGoods/asw:TotalCostSoldGoods"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="asw:GoodsInfo/asw:SoldGoods/asw:CurrencyCode"/>
                  </p>
                  <p align="left" class="bold"> Иные сведения:
					    <xsl:for-each select="asw:GoodsInfo/asw:GeneralComments">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
					    </xsl:for-each>
                  </p>
               </xsl:if>
               <xsl:if test="asw:RateListCurrency">
                  <table border="1" class="border-right " style="width:275mm">
                     <tbody>
                        <tr>
                           <td align="center" class="bold" style="width:100mm">Наименование товара</td>
                           <td align="center" class="bold" style="width:20mm">Валюта</td>
                           <td align="center" class="bold" style="width:40mm">Курс</td>
                           <td class="border-right " style="width:115mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <xsl:for-each select="asw:RateListCurrency">
                           <tr>
                              <td align="left" class="normal" style="width:100mm">
                                 <xsl:value-of select="asw:CurrencyName"/>
                              </td>
                              <td align="center" class="normal" style="width:20mm">
                                 <xsl:value-of select="asw:Currency"/>
                              </td>
                              <td align="center" class="normal" style="width:40mm">
                                 <xsl:value-of select="asw:CurrencyRate"/>
                              </td>
                              <td class="border-right " style="width:115mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <br/>
               <table border="1" class="border-right" style="width:275mm">
                  <tbody>
                     <tr>
                        <td align="center" colspan="2" style="width:200mm">
                           <span class="normal">Преведение проверки на предмет боя и порчи  </span>
                        </td>
                        <td class="border-right " style="width:75mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" style="width:100mm">Вылет</td>
                        <td align="center" class="normal" style="width:100mm">Прилет</td>
                        <td class="border-right " style="width:75mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="border-bottom" style="width:100mm">
                           <br/>
                           <span class="normal">Отв.б/п </span>
                           <span class="bold">
                              <xsl:value-of select="asw:CheckingItemFightingDamage/asw:BoardConductorDeparting/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="asw:CheckingItemFightingDamage/asw:BoardConductorDeparting/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="asw:CheckingItemFightingDamage/asw:BoardConductorDeparting/cat_ru:PersonMiddleName"/>
                              <xsl:if test="asw:CheckingItemFightingDamage/asw:BoardConductorDeparting/cat_ru:PersonPost">
                                 <xsl:text>/</xsl:text>
                                 <xsl:value-of select="asw:CheckingItemFightingDamage/asw:BoardConductorDeparting/cat_ru:PersonPost"/>
                                 <xsl:text> /</xsl:text>
                              </xsl:if>
                           </span>
                        </td>
                        <td class="border-bottom" style="width:100mm">
                           <br/>
                           <span class="normal">Отв.б/п </span>
                           <span class="bold">
                              <xsl:value-of select="asw:CheckingItemFightingDamage/asw:BoardConductorArrival/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="asw:CheckingItemFightingDamage/asw:BoardConductorArrival/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="asw:CheckingItemFightingDamage/asw:BoardConductorArrival/cat_ru:PersonMiddleName"/>
                              <xsl:if test="asw:CheckingItemFightingDamage/asw:BoardConductorArrival/cat_ru:PersonPost">
                                 <xsl:text>/</xsl:text>
                                 <xsl:value-of select="asw:CheckingItemFightingDamage/asw:BoardConductorArrival/cat_ru:PersonPost"/>
                                 <xsl:text> /</xsl:text>
                              </xsl:if>
                           </span>
                        </td>
                        <td class="border-right " style="width:75mm">
                           <br/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="border-top-bottom " style="width:100mm">
                           <br/>
                           <span class="normal">Трансп.орг.</span>
                           <span class="bold">
                              <xsl:value-of select="asw:CheckingItemFightingDamage/asw:TransOrganizationDeparting/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="asw:CheckingItemFightingDamage/asw:TransOrganizationDeparting/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="asw:CheckingItemFightingDamage/asw:TransOrganizationDeparting/cat_ru:PersonMiddleName"/>
                              <xsl:if test="asw:CheckingItemFightingDamage/asw:TransOrganizationDeparting/cat_ru:PersonPost">
                                 <xsl:text>/</xsl:text>
                                 <xsl:value-of select="asw:CheckingItemFightingDamage/asw:TransOrganizationDeparting/cat_ru:PersonPost"/>
                                 <xsl:text> /</xsl:text>
                              </xsl:if>
                           </span>
                        </td>
                        <td class="border-top-bottom  " style="width:100mm">
                           <br/>
                           <span class="normal"> Трансп.орг.</span>
                           <span class="bold">
                              <xsl:value-of select="asw:CheckingItemFightingDamage/asw:TransOrganizationArrival/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="asw:CheckingItemFightingDamage/asw:TransOrganizationArrival/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="asw:CheckingItemFightingDamage/asw:TransOrganizationArrival/cat_ru:PersonMiddleName"/>
                              <xsl:if test="asw:CheckingItemFightingDamage/asw:TransOrganizationArrival/cat_ru:PersonPost">
                                 <xsl:text>/</xsl:text>
                                 <xsl:value-of select="asw:CheckingItemFightingDamage/asw:TransOrganizationArrival/cat_ru:PersonPost"/>
                                 <xsl:text> /</xsl:text>
                              </xsl:if>
                           </span>
                        </td>
                        <td class="border-right " style="width:75mm">
                           <br/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:200mm">
                           <span class="normal">Примечания:
								<xsl:for-each select="asw:Comments/asw:Notice">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
								</xsl:for-each>
                              <br/>
                           </span>
                        </td>
                        <td class="border-right " style="width:75mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <p align="left" class="normal">Подпись лица составившего накладную:
					</p>
               <p align="left" class="normal">
                  <xsl:if test="asw:Person/asw:ScheduledNumber">
					Таб.номер 
					<span class="bold">
                        <xsl:value-of select="asw:Person/asw:ScheduledNumber"/>
                     </span>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                  </xsl:if>
					Ф.И.О. 
					<span class="bold">
                     <xsl:value-of select="asw:Person/cat_ru:PersonSurname"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="asw:Person/cat_ru:PersonName"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="asw:Person/cat_ru:PersonMiddleName"/>
                     <xsl:if test="asw:Person/cat_ru:PersonPost">
                        <xsl:text>  /</xsl:text>
                        <span class="bold">
                           <xsl:value-of select="asw:Person/cat_ru:PersonPost"/>
                           <xsl:text>/</xsl:text>
                        </span>
                     </xsl:if>
                  </span>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                  <xsl:if test="asw:Person/cat_ru:IssueDate">
					Дата
					<span class="bold">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="asw:Person/cat_ru:IssueDate"/>
                        </xsl:call-template>
                     </span>
                  </xsl:if>
               </p>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
