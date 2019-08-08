<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="rrg cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rrg="urn:customs.ru:Information:ExchangeDocuments:RepudRecallGTD:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 4.7.0.0 от 25.02.2009.   -->
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head/>
         <body>
            <table border="1">
               <tbody>
                  <tr>
                     <td align="center" width="126">
                        <xsl:for-each select="rrg:RepudRecallGTD">
                           <xsl:for-each select="rrg:SendDate">
                              <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
                           </xsl:for-each>
                        </xsl:for-each>  </td>
                  </tr>
               </tbody>
            </table>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
                        <span style="font-size:large; font-weight:bold; ">Запрет на отзыв декларации</span>
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
                                    <xsl:for-each select="rrg:RepudRecallGTD">
                                       <xsl:for-each select="rrg:Customs">
                                          <xsl:for-each select="cat_ru:Code">
                                             <xsl:apply-templates/>
                                          </xsl:for-each>
                                       </xsl:for-each>
                                    </xsl:for-each>
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
                                    <xsl:for-each select="rrg:RepudRecallGTD">
                                       <xsl:for-each select="rrg:Customs">
                                          <xsl:for-each select="cat_ru:OfficeName">
                                             <xsl:apply-templates/>
                                          </xsl:for-each>
                                       </xsl:for-each>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
               </tbody>
            </table>
            <br/>Отзыв таможенной декларации №<xsl:for-each select="rrg:RepudRecallGTD">
               <xsl:for-each select="rrg:GTDNumber">
                  <xsl:for-each select="cat_ru:CustomsCode">
                     <xsl:apply-templates/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each>/<xsl:for-each select="rrg:RepudRecallGTD">
               <xsl:for-each select="rrg:GTDNumber">
                  <xsl:for-each select="cat_ru:RegistrationDate">
                     <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="rrg:RepudRecallGTD">
               <xsl:for-each select="rrg:GTDNumber">
                  <xsl:for-each select="cat_ru:RegistrationDate">
                     <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="rrg:RepudRecallGTD">
               <xsl:for-each select="rrg:GTDNumber">
                  <xsl:for-each select="cat_ru:RegistrationDate">
                     <xsl:value-of select="format-number(substring(., 3, 2), '00')"/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each>/<xsl:for-each select="rrg:RepudRecallGTD">
               <xsl:for-each select="rrg:GTDNumber">
                  <xsl:for-each select="cat_ru:GTDNumber">
                     <xsl:apply-templates/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each> запрещен.<br/>
            <br/>
            <xsl:if test="string-length(  rrg:RepudRecallGTD/rrg:RepudReasons  )  != 0">Причины отказа: <xsl:for-each select="rrg:RepudRecallGTD">
                  <xsl:for-each select="rrg:RepudReasons">
                     <xsl:apply-templates/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:if> <br/>
            <br/>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center" width="422">
                        <xsl:for-each select="rrg:RepudRecallGTD">
                           <xsl:for-each select="rrg:CustomsPerson">
                              <xsl:for-each select="cat_ru:PersonName">
                                 <xsl:apply-templates/>
                              </xsl:for-each>
                           </xsl:for-each>
                        </xsl:for-each>
                     </td>
                     <td width="123"/>
                     <td align="center">
                        <xsl:for-each select="rrg:RepudRecallGTD">
                           <xsl:for-each select="rrg:CustomsPerson">
                              <xsl:for-each select="cat_ru:LNP">
                                 <xsl:apply-templates/>
                              </xsl:for-each>
                           </xsl:for-each>
                        </xsl:for-each>
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
</xsl:stylesheet>
