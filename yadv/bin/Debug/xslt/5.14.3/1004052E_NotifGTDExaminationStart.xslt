<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:nges="urn:customs.ru:Information:ExchangeDocuments:NotifGTDExaminationStart:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 1.2 от 19.11.2007.   -->
   <xsl:template name="russian_date_gtd">
      <xsl:param name="gtd"/>
      <xsl:choose>
         <xsl:when test="substring($gtd,5,1)='-' and substring($gtd,8,1)='-'">
            <xsl:value-of select="substring($gtd,9,2)"/>
            <xsl:value-of select="substring($gtd,6,2)"/>
            <xsl:value-of select="substring($gtd,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$gtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="DocID">
	    <xsl:param name="DocID"/>
		<xsl:choose>
			<xsl:when test="$DocID/nges:DTRegNum">
				<xsl:for-each select="$DocID/nges:DTRegNum">
					<xsl:call-template name="gdt_number">
						<xsl:with-param name="customsCode" select="cat_ru:CustomsCode"/>
						<xsl:with-param name="date" select="cat_ru:RegistrationDate"/>
						<xsl:with-param name="number" select="cat_ru:GTDNumber"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$DocID/nges:MPORegNum">
				<xsl:for-each select="$DocID/nges:MPORegNum">
					<xsl:call-template name="gdt_number">
						<xsl:with-param name="customsCode" select="nges:CustomsCode"/>
						<xsl:with-param name="date" select="nges:RegistrationDate"/>
						<xsl:with-param name="number" select="nges:MPO_Number"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$DocID/nges:PI_RegID"><xsl:value-of select="$DocID/nges:PI_RegID"/></xsl:when>
		</xsl:choose>   
   </xsl:template>
   <xsl:template name="gdt_number">
	   <xsl:param name="customsCode"/>
	   <xsl:param name="date"/>
	   <xsl:param name="number"/>
	   <xsl:if test="$customsCode != ''">
		   <xsl:value-of select="$customsCode"/><xsl:text>/</xsl:text>
	   </xsl:if>
	   <xsl:if test="$date != ''">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="gtd" select="$date"/>
            </xsl:call-template><xsl:text>/</xsl:text>
       </xsl:if>
		<xsl:value-of select="$number"/>
   </xsl:template>
   <xsl:template match="/">
      <html>
         <head>
			 <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
         </head>
         <body>
            <table border="1">
               <tbody>
                  <tr>
                     <td align="center" width="156">
                        <xsl:for-each select="nges:NotifGTDExaminationStart">
                           <xsl:for-each select="nges:ControlStartDate">
                              <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
                           </xsl:for-each>
                        </xsl:for-each>  <xsl:for-each select="nges:NotifGTDExaminationStart">
                           <xsl:for-each select="nges:ControlStartTime">
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
                        </xsl:for-each> </td>
                  </tr>
               </tbody>
            </table>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
						<xsl:choose>
							<xsl:when test="nges:NotifGTDExaminationStart/nges:DocSign='0'"><span style="font-size:large; font-weight:bold; ">Уведомление<br/>о начале проверки ДТ</span></xsl:when>
							<xsl:when test="nges:NotifGTDExaminationStart/nges:DocSign='1'"><span style="font-size:large; font-weight:bold; ">Уведомление<br/>о фактическом предъявлении МПО в ТО</span></xsl:when>
							<xsl:when test="nges:NotifGTDExaminationStart/nges:DocSign='2'"><span style="font-size:large; font-weight:bold; ">Уведомление<br/>о поступление МПО на осмотр</span></xsl:when>
							<xsl:when test="nges:NotifGTDExaminationStart/nges:DocSign='3'"><span style="font-size:large; font-weight:bold; ">Уведомление<br/>о начале проверки МПО</span></xsl:when>
							<xsl:when test="nges:NotifGTDExaminationStart/nges:DocSign='4'"><span style="font-size:large; font-weight:bold; ">Уведомление<br/>о начале проверки пакета информации</span></xsl:when>
						</xsl:choose>
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
                                    <xsl:for-each select="nges:NotifGTDExaminationStart">
                                       <xsl:for-each select="nges:Customs">
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
                                    <xsl:for-each select="nges:NotifGTDExaminationStart">
                                       <xsl:for-each select="nges:Customs">
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
            <br/>
				<xsl:if test="nges:NotifGTDExaminationStart/nges:DocID/nges:DTRegNum">ДТ</xsl:if>
				<xsl:if test="nges:NotifGTDExaminationStart/nges:DocID/nges:MPORegNum">МПО</xsl:if>
				<xsl:if test="nges:NotifGTDExaminationStart/nges:DocID/nges:PI_RegID">Пакет информации</xsl:if>
				 <xsl:text> № </xsl:text>
				<xsl:call-template name="DocID">
					<xsl:with-param name="DocID" select="nges:NotifGTDExaminationStart/nges:DocID"/>
				</xsl:call-template>
            .<br/>
            <br/>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center" width="422">
                        <xsl:for-each select="nges:NotifGTDExaminationStart">
                           <xsl:for-each select="nges:CustomsPerson">
                              <xsl:for-each select="cat_ru:PersonName">
                                 <xsl:apply-templates/>
                              </xsl:for-each>
                           </xsl:for-each>
                        </xsl:for-each>
                     </td>
                     <td width="123"/>
                     <td align="center">
                        <xsl:for-each select="nges:NotifGTDExaminationStart">
                           <xsl:for-each select="nges:CustomsPerson">
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
