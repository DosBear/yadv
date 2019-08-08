<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:adrr="urn:customs.ru:Information:ExchangeDocuments:AddRegistrationRefusal:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head/>
         <body>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
                        <span style="font-size:large; font-weight:bold; ">Отказ по дополнению к договору поручительства</span>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <br/>Дата принятия решения об отказе 
						<u>
                           <xsl:choose>
                              <xsl:when test="substring(//adrr:RefusalDate,5,1)='-' and substring(//adrr:RefusalDate,8,1)='-'">
                                 <xsl:value-of select="substring(//adrr:RefusalDate,9,2)"/>.<xsl:value-of select="substring(//adrr:RefusalDate,6,2)"/>.<xsl:value-of select="substring(//adrr:RefusalDate,1,4)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="//adrr:RefusalDate"/>
                              </xsl:otherwise>
                           </xsl:choose>
                        </u>
                     </td>
                  </tr>
               </tbody>
            </table>
            <br/>
            <table border="0" width="100%">
               <tbody>
                  <tr style="font-size:15pt;font-weight: bold;">
                     <td align="center">Причины отказа</td>
                  </tr>
               </tbody>
            </table>
            <table align="center" border="1" width="70%">
               <tbody>
                  <tr style="font-weight:bold">
                     <td align="center" width="35%">Код причины отказа</td>
                     <td align="center" width="35%">Описание причины отказа</td>
                  </tr>
                  <xsl:for-each select="//adrr:RefuseReason">
                     <tr>
                        <td align="center">
                           <xsl:value-of select="adrr:RefusalReasonCode"/>
                        </td>
                        <td>
                           <xsl:for-each select="adrr:RefusalReasonDescription">
                              <xsl:value-of select="."/>
                              <br/>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </xsl:for-each>
               </tbody>
            </table>
            <br/>  <br/>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
