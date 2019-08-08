<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:nnt="urn:customs.ru:Information:CustomsDocuments:NotifNotDecl:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 4.7.0.0 от 25.02.2009.   -->
   <xsl:output encoding="UTF-8" indent="no" media-type="text/html" omit-xml-declaration="no" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template name="russian_date2">
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
   <xsl:template match="nnt:NotifNotDecl">
      <html>
         <head/>
         <body>
            <table border="1">
               <tbody>
                  <tr>
                     <td align="center" width="126">
                        <xsl:for-each select="nnt:SendDate">
                           <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                           <xsl:text>.</xsl:text>
                           <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                           <xsl:text>.</xsl:text>
                           <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
                        </xsl:for-each>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:for-each select="nnt:SendTime">
                           <xsl:apply-templates/>
                           <!--
                                        <xsl:value-of select="format-number(substring(substring-before(., ':'), string-length(substring-before(., ':')) - 1), '00')" />
                                        <xsl:text>:</xsl:text>
                                        <xsl:value-of select="format-number(substring-before(substring-after(., ':'), ':'), '00')" />
                                        <xsl:text>:</xsl:text>
                                        <xsl:choose>
                                            <xsl:when test="contains(., 'Z')">
                                                <xsl:value-of select="format-number(substring-after(substring-before(., 'Z'), ':'), '00')" />
                                            </xsl:when>
                                            <xsl:when test="contains(., '+')">
                                                <xsl:value-of select="format-number(substring-after(substring-after(substring-before(., '+'), ':'), ':'), '00')" />
                                            </xsl:when>
                                            <xsl:when test="contains(substring-after(substring-after(., ':'), ':'), '-')">
                                                <xsl:value-of select="format-number(substring-before(substring-after(substring-after(., ':'), ':'), '-'), '00')" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="format-number(substring-after(substring-after(., ':'), ':'), '00')" />
                                            </xsl:otherwise>
                                        </xsl:choose>
											-->
                        </xsl:for-each>
                     </td>
                  </tr>
               </tbody>
            </table>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
                        <span style="font-size:large; font-weight:bold; ">Уведомление</span>
                        <br/>
                        <span style="font-size:medium; font-weight:bold; "> о том, что таможенная декларация считается неподанной</span>
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
                                    <xsl:value-of select="nnt:Customs/cat_ru:Code"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
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
                                    <xsl:value-of select="nnt:Customs/cat_ru:OfficeName"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
               </tbody>
            </table>
            <br/>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="left">Уведомляем Вас о том, что таможенная декларация считается неподаной</td>
                  </tr>
               </tbody>
            </table>
            <br/>
                Регистрационный номер  ДТ: 
                <xsl:if test="nnt:GTDID">
               <xsl:value-of select="nnt:GTDID/cat_ru:CustomsCode"/>
               <xsl:text>/</xsl:text>
               <xsl:call-template name="russian_date2">
                  <xsl:with-param name="dateIn" select="nnt:GTDID/cat_ru:RegistrationDate"/>
               </xsl:call-template>
               <xsl:text>/</xsl:text>
               <xsl:value-of select="nnt:GTDID/cat_ru:GTDNumber"/>
            </xsl:if>
            <br/>
            <br/>
            <xsl:if test="nnt:Comments">Комментарии:
						<xsl:for-each select="nnt:Comments">
                  <xsl:value-of select="."/>
               </xsl:for-each>
            </xsl:if>
            <br/>
            <br/>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center" width="422">
                        <xsl:if test="nnt:CustomsPerson/cat_ru:PersonName">
                           <xsl:value-of select="nnt:CustomsPerson/cat_ru:PersonName"/>
                        </xsl:if>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td width="123"/>
                     <td align="center">
                        <xsl:if test="nnt:CustomsPerson/cat_ru:LNP">
                           <xsl:value-of select="nnt:CustomsPerson/cat_ru:LNP"/>
                        </xsl:if>
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
            </table>  </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
