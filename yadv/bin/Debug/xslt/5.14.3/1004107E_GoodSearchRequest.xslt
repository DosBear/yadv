<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gsch="urn:customs.ru:Information:ExchangeDocuments:GoodSearchRequest:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="gsch:GoodSearchRequest">
      <html>
         <head>
            <title>Запрос о розыске недоставленных товаров</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
					.page {
                        width: 210mm;
                        /*height: 297mm;*/
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }
                    
                    table {
						width: 100%;
						margin-top: 15px;
                    }
                    
                    th {
						font-size: 13pt;
                    }
                    
                    .low 
                    {
						font-size: 13;
                    }
                   </style>
         </head>
         <body>
            <div class="page">
               <h1>Запрос о розыске недоставленных товаров</h1>
               <table border="1" style="border:0">
                  <tbody>
                     <tr>
                        <td style="border:0" width="40%">Дата оформления товарной партии</td>
                        <td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="gsch:GoodsRegistrationDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <xsl:if test="gsch:ConsignmentNumber">
                        <tr>
                           <td style="border:0" width="40%">Номер товарно-транспортной накладной</td>
                           <td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom;">
                              <xsl:value-of select="gsch:ConsignmentNumber"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td style="border:0" width="40%">Номер транзитной декларации</td>
                        <td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom;">
                           <xsl:apply-templates select="gsch:TD"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="border:0" width="40%">Место отправления</td>
                        <td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom;">
                           <xsl:apply-templates select="gsch:DeparturePlace"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="border:0" width="40%">Место назначения</td>
                        <td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom;">
                           <xsl:apply-templates select="gsch:DestinationPlace"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <xsl:if test="gsch:Transport">
                  <div style="margin-top:5mm; font-weight:bold;">Сведения о транспортном(ых) средстве(ах): </div>
                  <xsl:for-each select="gsch:Transport">
                     <xsl:value-of select="position()"/>. 
								<xsl:if test="cat_ru:TransportIdentifier">
									Идентиф. <xsl:value-of select="cat_ru:TransportIdentifier"/>
                        <xsl:if test="cat_ru:TransportMeansNationalityCode">(<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>)</xsl:if>; 
								</xsl:if>
                     <xsl:if test="cat_ru:ActiveTransportIdentifier">
									идентиф. активного ТС 
									<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
                     </xsl:if>
                     <br/>
                     <xsl:if test="gsch:GoodsInfo">
									Описание товара 
									<table border="1" cellpadding="0" cellspacing="0" style="margin-top: 0mm; margin-bottom: 2mm">
                           <tbody>
                              <tr>
                                 <td>№ п/п</td>
                                 <td>Код ТН ВЭД ЕАЭС</td>
                                 <xsl:if test="//gsch:Container">
                                    <td>Контейнеры</td>
                                 </xsl:if>
                              </tr>
                              <xsl:for-each select="gsch:GoodsInfo">
                                 <tr>
                                    <td>
                                       <xsl:value-of select="position()"/>
                                    </td>
                                    <td>
                                       <xsl:value-of select="gsch:GoodsTNVEDCode"/>
                                    </td>
                                    <xsl:if test="//gsch:Container">
                                       <td>
                                          <xsl:for-each select="gsch:Container">
                                             <xsl:if test="position() > 1">
																	,<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </xsl:if>
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </td>
                                    </xsl:if>
                                 </tr>
                              </xsl:for-each>
                           </tbody>
                        </table>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:if>
               <xsl:apply-templates select="gsch:CustomsPerson"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="gsch:TD">
      <xsl:value-of select="cat_ru:CustomsCode"/> /
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/> /
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
   <xsl:template match="gsch:DeparturePlace | gsch:DestinationPlace">
      <xsl:value-of select="gsch:StationName"/>,   
			код станции <xsl:value-of select="gsch:StationCode"/>; 
		<xsl:if test="gsch:RailwayCode">
			код ж/д дороги: <xsl:value-of select="gsch:RailwayCode"/>
      </xsl:if>. 
	</xsl:template>
   <xsl:template match="gsch:CustomsPerson">
      <table border="1" style="margin-top:50px; width:100%; border: 0">
         <tbody>
            <tr>
               <td align="center" style="border-right:0; border-left:0; border-top:0">
                  <xsl:apply-templates select="//gsch:Customs"/>
               </td>
               <td style="border:0;" width="5%"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0">
                  <xsl:value-of select="cat_ru:PersonName"/>
               </td>
               <td style="border:0;" width="5%"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="30%">
                  <xsl:value-of select="cat_ru:LNP"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="low" style="border:0;">(Таможенный орган)</td>
               <td style="border:0;" width="5%"/>
               <td align="center" class="low" style="border:0;">(Ф.И.О.)</td>
               <td style="border:0;" width="5%"/>
               <td align="center" class="low" style="border:0;">(ЛНП)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="gsch:Customs">
      <xsl:choose>
         <xsl:when test="cat_ru:OfficeName">
            <xsl:value-of select="cat_ru:OfficeName"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			(<xsl:value-of select="cat_ru:Code"/>)
		</xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="cat_ru:Code"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
