<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:oeznr="urn:customs.ru:Information:CustomsDocuments:OEZ_NotifReg:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="oeznr:OEZ_NotifReg">
      <html>
         <head>
			 <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
         </head>
         <body>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
                        <span style="font-size:large; font-weight:bold; ">Регистрационный номер 
								<xsl:choose>
                              <xsl:when test="oeznr:DocumentSign='1'">уведомления о ввозе</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='2'">уведомления о вывозе</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='3'">заявления на уничтожение</xsl:when>
                              <xsl:otherwise>акта об уничтожении</xsl:otherwise>
                           </xsl:choose> товаров</span>
                        <br/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center"/>
                  </tr>
               </tbody>
            </table>
            <br/>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td width="131">
                        <table border="1">
                           <tbody>
                              <tr>
                                 <td align="center" width="110">
                                    <xsl:value-of select="oeznr:Customs/cat_ru:Code"/>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                     <td>
                        <table border="1">
                           <tbody>
                              <tr>
                                 <td align="center" height="22" width="371">
                                    <xsl:value-of select="oeznr:Customs/cat_ru:OfficeName"/>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
               </tbody>
            </table>
            <table>
               <tbody>
                  <tr>
                     <td>
                        <b>	Регистрационный номер <xsl:choose>
                              <xsl:when test="oeznr:DocumentSign='1'">уведомления о ввозе</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='2'">уведомления о вывозе</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='3'">заявления на уничтожение</xsl:when>
                              <xsl:otherwise>акта об уничтожении</xsl:otherwise>
                           </xsl:choose> товаров</b>
                        <u>
                           <!--<xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
									</xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>-->
                           <xsl:choose>
                              <xsl:when test="oeznr:DocumentSign='1'">
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>
                                 </u>
                              </xsl:when>
                              <xsl:when test="oeznr:DocumentSign='2'">
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>
                                 </u>
                              </xsl:when>
                              <xsl:when test="oeznr:DocumentSign='3'">
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>ЗУН
								</u>
                              </xsl:when>
                              <xsl:otherwise>
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>АУ
								</u>
                              </xsl:otherwise>
                           </xsl:choose>
                        </u>
                     </td>
                  </tr>
               </tbody>
            </table>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center" width="422">
                        <xsl:value-of select="oeznr:CustomsPerson/cat_ru:PersonName"/>
                     </td>
                     <td width="123"/>
                     <td align="center">
                        <xsl:value-of select="oeznr:CustomsPerson/cat_ru:LNP"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" width="422">
                        <hr color="black" size="1"/>Уполномоченное должностное лицо таможенного органа</td>
                     <td width="123"/>
                     <td align="center">
                        <hr color="black" size="1"/>ЛНП</td>
                  </tr>
               </tbody>
            </table>
            <br/>  <br/>
         </body>
      </html>
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
      <xsl:param name="date"/>
      <xsl:choose>
         <xsl:when test="substring($date,5,1)='-' and substring($date,8,1)='-'">
            <xsl:value-of select="substring($date,9,2)"/>
            <xsl:value-of select="substring($date,6,2)"/>
            <xsl:value-of select="substring($date,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$date"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
