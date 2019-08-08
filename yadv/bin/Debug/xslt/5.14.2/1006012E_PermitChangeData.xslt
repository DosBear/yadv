<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pcd="urn:customs.ru:Information:CustomsDocuments:PermitChangeData:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 1.2 от 19.11.2007.   -->
   <xsl:template match="/">
      <html>
         <head>
			 <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
         </head>
         <body>
            <table border="1">
               <tbody>
                  <tr>
                     <td align="center" width="126">
                        <xsl:for-each select="pcd:PermitChangeData">
                           <xsl:for-each select="pcd:SendDate">
                              <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
                           </xsl:for-each>
                        </xsl:for-each> <xsl:for-each select="pcd:PermitChangeData">
                           <xsl:for-each select="pcd:SendTIme">
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
                        </xsl:for-each>   </td>
                  </tr>
               </tbody>
            </table>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
                        <span style="font-size:large; font-weight:bold; ">Разрешение</span>
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
                                    <xsl:for-each select="pcd:PermitChangeData">
                                       <xsl:for-each select="pcd:Customs">
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
                                    <xsl:for-each select="pcd:PermitChangeData">
                                       <xsl:for-each select="pcd:Customs">
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
            <br/>    Разрешено изменение, дополнение сведений, заявленных в таможенной декларации №<xsl:for-each select="pcd:PermitChangeData">
               <xsl:for-each select="pcd:GTDNumber">
                  <xsl:for-each select="cat_ru:CustomsCode">
                     <xsl:apply-templates/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each>/<xsl:for-each select="pcd:PermitChangeData">
               <xsl:for-each select="pcd:GTDNumber">
                  <xsl:for-each select="cat_ru:RegistrationDate">
                     <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="pcd:PermitChangeData">
               <xsl:for-each select="pcd:GTDNumber">
                  <xsl:for-each select="cat_ru:RegistrationDate">
                     <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="pcd:PermitChangeData">
               <xsl:for-each select="pcd:GTDNumber">
                  <xsl:for-each select="cat_ru:RegistrationDate">
                     <xsl:value-of select="format-number(substring(., 3, 2), '00')"/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each>/<xsl:for-each select="pcd:PermitChangeData">
               <xsl:for-each select="pcd:GTDNumber">
                  <xsl:for-each select="cat_ru:GTDNumber">
                     <xsl:apply-templates/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:for-each>.<br/>
            <br/>
            <xsl:for-each select="pcd:PermitChangeData">
               <xsl:for-each select="pcd:Comments">
                  <xsl:apply-templates/>
               </xsl:for-each>
            </xsl:for-each>
            <br/>
            <br/>
            <xsl:if test="//pcd:KDTRegNumber">
            Регистрационный номер КДТ: <xsl:apply-templates select="//pcd:KDTRegNumber"/>
            <br/>
            </xsl:if>
            <xsl:if test="//pcd:RequestNumber">
            Регистрационный номер обращения декларанта: <xsl:apply-templates select="//pcd:RequestNumber"/>
            <br/>
            </xsl:if>
            <br/>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center" width="422">
                        <xsl:for-each select="pcd:PermitChangeData">
                           <xsl:for-each select="pcd:CustomsPerson">
                              <xsl:for-each select="cat_ru:PersonName">
                                 <xsl:apply-templates/>
                              </xsl:for-each>
                           </xsl:for-each>
                        </xsl:for-each>
                     </td>
                     <td width="123"/>
                     <td align="center">
                        <xsl:for-each select="pcd:PermitChangeData">
                           <xsl:for-each select="pcd:CustomsPerson">
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
            <br/>  
        </body>
      </html>
   </xsl:template>
   <xsl:template match="pcd:KDTRegNumber | pcd:RequestNumber"><!--код/дата/номер-->
	<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/><xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
	<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>/<xsl:value-of select="pcd:SerialNumber"/>
</xsl:template>
</xsl:stylesheet>
