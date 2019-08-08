<?xml version="1.0" encoding="UTF-8"?>
<!--xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"-->
<xsl:stylesheet version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:chit="urn:customs.ru:Information:TransportDocuments:Air:CheckInOut:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="chit:CheckInOut">
      <html>
         <head>
            <title>Уведомление о регистрации прибытия воздушного судна</title>
            <style type="text/css">
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
			
				h1 {
					font-size: 25;
				}
				
				.header {
					font-weight: bold;
				}
				
				.tab {
					width: 20px;	
				}
				
			</style>
         </head>
         <body>
            <div class="page">
               <xsl:if test="chit:SignInOut = '1' ">
                  <h2>Уведомление о регистрации прибытия воздушного судна</h2>
               </xsl:if>
               <xsl:if test="chit:SignInOut = '0' ">
                  <h2>Уведомление о разрешении на убытие воздушного судна</h2>
               </xsl:if>
               <table>
                  <tr>
                     <td class="header">УИН перевозки</td>
                     <td>
                        <xsl:value-of select="chit:UIN"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="header">Регистрационный номер</td>
                     <td>
                        <xsl:value-of select="chit:RegNumberInOut"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="header">Дата операции</td>
                     <td>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="chit:DateOperation"/>
                        </xsl:call-template>
                     </td>
                  </tr>
                  <xsl:if test="chit:TimeOperation">
                     <tr>
                        <td class="header">Время операции</td>
                        <td>
                           <xsl:value-of select="substring(chit:TimeOperation, 1, 8)"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="header">Принятое решение</td>
                     <td>
                        <xsl:value-of select="chit:ControlDecision"/>
                     </td>
                  </tr>
                  <tr class="header">
                     <td colspan="2" style="padding-top:20px">Таможенный пост</td>
                  </tr>
                  <xsl:if test="chit:Customs/cat_ru:OfficeName">
                     <tr>
                        <td>
                           <span class="tab"/> Название</td>
                        <td>
                           <xsl:value-of select="chit:Customs/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td>
                        <span class="tab"/> Код</td>
                     <td>
                        <xsl:value-of select="chit:Customs/cat_ru:Code"/>
                     </td>
                  </tr>
                  <xsl:if test="chit:Customs/cat_ru:CustomsCountryCode">
                     <tr>
                        <td>
                           <span class="tab"/>Код страны</td>
                        <td>
                           <xsl:value-of select="chit:Customs/cat_ru:CustomsCountryCode"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr class="header">
                     <td colspan="2">Должностное лицо таможенного поста</td>
                  </tr>
                  <tr>
                     <td>
                        <span class="tab"/> ФИО</td>
                     <td>
                        <xsl:value-of select="chit:CustomsPerson/cat_ru:PersonName"/>
                     </td>
                  </tr>
                  <xsl:if test="chit:CustomsPerson/cat_ru:LNP != '' ">
                     <tr>
                        <td>
                           <span class="tab"/> ЛНП</td>
                        <td>
                           <xsl:value-of select="chit:CustomsPerson/cat_ru:LNP"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:apply-templates select="chit:Flight"/>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="chit:Flight">
      <tr class="header">
         <td colspan="2" style="padding-top:15px">Рейс</td>
      </tr>
      <tr>
         <td>
            <span class="tab"/> Номер рейса</td>
         <td>
            <xsl:value-of select="catTrans_ru:FlightNumber"/>
         </td>
      </tr>
      <tr>
         <td>
            <span class="tab"/> Дата рейса</td>
         <td>
            <xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="catTrans_ru:FlightDate"/>
            </xsl:call-template>
         </td>
      </tr>
      <xsl:if test="catTrans_ru:FlightTime != '' ">
         <tr>
            <td>
               <span class="tab"/> Время прилета</td>
            <td>
               <xsl:value-of select="substring(catTrans_ru:FlightTime, 1, 8)"/>
            </td>
         </tr>
      </xsl:if>
      <xsl:if test="catTrans_ru:AirPlaneRegNum">
         <tr>
            <td>
               <span class="tab"/> Бортовой номер</td>
            <td>
               <xsl:value-of select="catTrans_ru:AirPlaneRegNum"/>
            </td>
         </tr>
      </xsl:if>
      <xsl:if test="catTrans_ru:Mark">
         <tr>
            <td>
               <span class="tab"/> Тип воздушного судна</td>
            <td>
               <xsl:value-of select="catTrans_ru:Mark"/>
            </td>
         </tr>
      </xsl:if>
      <tr>
         <td>
            <span class="tab"/>Аэропорт отправления:</td>
         <td>
            <xsl:value-of select="catTrans_ru:DepartureAirport/catTrans_ru:IATACode"/>
            <xsl:if test="catTrans_ru:DepartureAirport/catTrans_ru:Name"> (<xsl:value-of select="catTrans_ru:DepartureAirport/catTrans_ru:Name"/>)</xsl:if>
         </td>
      </tr>
      <tr>
         <td>
            <span class="tab"/>Аэропорт назначения:</td>
         <td>
            <xsl:value-of select="chit:DestinationAirport/catTrans_ru:IATACode"/>
            <xsl:if test="chit:DestinationAirport/catTrans_ru:Name"> (<xsl:value-of select="chit:DestinationAirport/catTrans_ru:Name"/>)</xsl:if>
         </td>
      </tr>
   </xsl:template>
</xsl:stylesheet>
