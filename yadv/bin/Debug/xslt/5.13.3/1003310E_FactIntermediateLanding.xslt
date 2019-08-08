<?xml version="1.0" encoding="UTF-8"?>
<!--xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"-->
<xsl:stylesheet version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:finl="urn:customs.ru:Information:TransportDocuments:Air:FactIntermediateLanding:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="finl:FactIntermediateLanding">
      <html>
         <head>
            <style type="text/css">
				div.page {
					width: 210mm;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding:	10mm;
					padding-left:	10mm;
					background: #ffffff;
					border: solid .5pt #000000;
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
            <div class="page" id="main">
               <h2>Уведомление о факте совершения воздушным судном посадки</h2>
               <table>
					<xsl:if test="finl:UIN">
					  <tr>
						 <td class="header">УИН перевозки</td>
						 <td><xsl:value-of select="finl:UIN"/></td>
					  </tr>
                  </xsl:if>
                  <xsl:if test="finl:UINP">
					  <tr>
						 <td class="header">УИНП</td>
						 <td><xsl:value-of select="finl:UINP"/></td>
					  </tr>
                  </xsl:if>
                  <tr class="header">
                     <td colspan="2">Информация о таможенном посте</td>
                  </tr>
                  <xsl:if test="finl:Customs/cat_ru:OfficeName">
                     <tr>
                        <td>
                           <span class="tab"/> Название</td>
                        <td>
                           <xsl:value-of select="finl:Customs/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td>
                        <span class="tab"/> Код</td>
                     <td>
                        <xsl:value-of select="finl:Customs/cat_ru:Code"/>
                     </td>
                  </tr>
                  <xsl:if test="finl:Customs/cat_ru:CustomsCountryCode">
                     <tr>
                        <td>
                           <span class="tab"/>Код страны</td>
                        <td>
                           <xsl:value-of select="finl:Customs/cat_ru:CustomsCountryCode"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:apply-templates select="finl:Flight"/>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="finl:Flight">
      <tr class="header">
         <td colspan="2">Информация о рейсе</td>
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
            <span class="tab"/> Дата прилета</td>
         <td>
            <xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="catTrans_ru:FlightDate"/>
            </xsl:call-template>
         </td>
      </tr>
      <tr>
         <td>
            <span class="tab"/> Время прилета</td>
         <td>
            <xsl:value-of select="substring(catTrans_ru:FlightTime, 1, 8)"/>
         </td>
      </tr>
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
            <xsl:value-of select="finl:DestinationAirport/catTrans_ru:IATACode"/>
            <xsl:if test="finl:DestinationAirport/catTrans_ru:Name"> (<xsl:value-of select="finl:DestinationAirport/catTrans_ru:Name"/>)</xsl:if>
         </td>
      </tr>
   </xsl:template>
</xsl:stylesheet>
