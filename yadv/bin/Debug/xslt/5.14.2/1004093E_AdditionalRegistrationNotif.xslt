<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:adrgn="urn:customs.ru:Information:ExchangeDocuments:AdditionalRegistrationNotif:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template match="/">
      <html>
         <head/>
         <body>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
                        <span style="font-size:large; font-weight:bold; ">Уведомление о регистрации дополнения к договору поручительства</span>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <br/>Дата формирования уведомления 
						<u>
                           <xsl:choose>
                              <xsl:when test="substring(//adrgn:RegDate,5,1)='-' and substring(//adrgn:RegDate,8,1)='-'">
                                 <xsl:value-of select="substring(//adrgn:RegDate,9,2)"/>.<xsl:value-of select="substring(//adrgn:RegDate,6,2)"/>.<xsl:value-of select="substring(//adrgn:RegDate,1,4)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="//adrgn:RegDate"/>
                              </xsl:otherwise>
                           </xsl:choose>
                        </u>
                     </td>
                  </tr>
               </tbody>
            </table>
            <br/>
            <table align="center" border="1" width="90%">
               <tbody>
                  <tr>
                     <td align="center" width="45%">Cсылочный номер гарантии в транзите </td>
                     <td align="center" width="45%">
                        <xsl:value-of select="//adrgn:GRN"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center">Уникальный идентификатор, присваеваемый дополнению к договору поручительства  при регистрации.
                            </td>
                     <td align="center">
                        <xsl:value-of select="//adrgn:AdditionalID"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center">Присвоенный номер дополнения к договору поручительства</td>
                     <td align="center">
                        <xsl:for-each select="//adrgn:AdditionalNumber">
                           <xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
                           </xsl:call-template>/<xsl:value-of select="cat_ru:GTDNumber"/>
                        </xsl:for-each>
                     </td>
                  </tr>
               </tbody>
            </table>
            <br/>  <br/>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
