<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:irg="urn:customs.ru:Information:CustomsDocuments:InqRecallGTD:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 4.7.0.0 от 25.02.2009.   -->
   <xsl:template match="/">
      <html>
         <head>
			 <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
         </head>
         <body>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
                        <span style="font-weight:bold; font-size:18pt;">Обращение об отзыве декларации </span>
                        <br/>
                        <span style="font-weight:bold;font-size:18pt; ">№</span>
                        <span style="font-weight:bold;font-size:18pt; "> </span>
                        <span style="font-weight:bold;font-size:18pt;">
							<xsl:apply-templates select="irg:InqRecallGTD/irg:GTDNumber"/>
                        </span>
                        <br/>
                     </td>
                  </tr>
               </tbody>
            </table>
            <br/>
            <table border="0">
               <tbody>
                 <tr>
                     <td style="width:20mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" style="font-size:16pt;">
                        <br/><b>Прошу отозвать декларацию
							<xsl:if test="irg:InqRecallGTD/irg:RecallReason"> по причине 
				<xsl:for-each select="irg:InqRecallGTD/irg:RecallReason">
                              <xsl:value-of select="."/> </xsl:for-each>
                        </xsl:if></b>
                     </td>
                  </tr>
                  <tr>
                     <td style="width:20mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="left" style="font-size:12pt;" colspan="2">
							Наименование организации/Ф.И.О. физ. лица: <xsl:value-of select=".//cat_ru:OrganizationName"/></td>
                  </tr>
                  <tr>
                     <td style="width:20mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
					<td align="left" style="font-size:12pt;" colspan="2">
						Краткое наименование организации: <xsl:value-of select=".//cat_ru:ShortName"/>
					</td>
				</tr>
                  <!--xsl:if test=".//cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                     <tr>
                        <td style="width:20mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" style="font-weight:bold; font-size:12pt;" width="75">
										ОГРН:
									</td>
                        <td align="left" width="400">
                           <xsl:value-of select=".//cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test=".//cat_ru:RFOrganizationFeatures/cat_ru:INN">
                     <tr>
                        <td style="width:20mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" style="font-weight:bold; font-size:12pt;" width="75">
										ИНН:
									</td>
                        <td align="left" width="400">
                           <xsl:value-of select=".//cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test=".//cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                     <tr>
                        <td style="width:20mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" style="font-weight:bold; font-size:12pt;" width="75">
										КПП:
									</td>
                        <td align="left" width="400">
                           <xsl:value-of select=".//cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test=".//cat_ru:RKOrganizationFeatures/cat_ru:ITN">
                     <tr>
                        <td style="width:20mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" style="font-weight:bold; font-size:12pt;" width="75">
										ИТН:
									</td>
                        <td align="left" width="400">
                           <xsl:value-of select=".//cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
										<xsl:value-of select=".//cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
										<xsl:value-of select=".//cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
										<xsl:value-of select=".//cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test=".//cat_ru:RBOrganizationFeatures/cat_ru:UNP">
                     <tr>
                        <td style="width:20mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" style="font-weight:bold; font-size:12pt;" width="75">
										УНП:
									</td>
                        <td align="left" width="400">
                           <xsl:value-of select=".//cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test=".//cat_ru:RKOrganizationFeatures/cat_ru:BIN">
                     <tr>
                        <td style="width:20mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" style="font-weight:bold; font-size:12pt;" width="75">
										БИН:
									</td>
                        <td align="left" width="400">
                           <xsl:value-of select=".//cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test=".//cat_ru:RKOrganizationFeatures/cat_ru:IIN">
                     <tr>
                        <td style="width:20mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" style="font-weight:bold; font-size:12pt;" width="75">
										ИИН:
									</td>
                        <td align="left" width="400">
                           <xsl:value-of select=".//cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td style="width:20mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <xsl:if test=".//cat_ru:OKPOID ">
                        <td align="left" style="font-weight:bold; font-size:12pt;" width="75">ОКПОИД:
							</td>
                        <td width="200">
                           <xsl:value-of select=".//cat_ru:OKPOID"/>
                        </td>
                     </xsl:if>
                  </tr>
                  <tr>
                     <td style="width:20mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <xsl:if test=".//cat_ru:OKATOCode ">
                        <td align="left" style="font-weight:bold; font-size:12pt;" width="75">ОКАТОКод:
							</td>
                        <td width="200">
                           <xsl:value-of select=".//cat_ru:OKATOCode"/>
                        </td>
                     </xsl:if>
                  </tr-->
                  <tr>
                     <td style="width:20mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                        <td align="left" style="font-size:12pt;">Адрес:
                           <xsl:if test=".//cat_ru:Address/cat_ru:PostalCode">
                              <xsl:value-of select=".//cat_ru:Address/cat_ru:PostalCode"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test=".//cat_ru:Address/cat_ru:CountryCode">
                              <xsl:text>, </xsl:text>
                              <xsl:value-of select=".//cat_ru:Address/cat_ru:CountryCode"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test=".//cat_ru:Address/cat_ru:CounryName">
                              <xsl:text>, </xsl:text>
                              <xsl:value-of select=".//cat_ru:Address/cat_ru:CounryName"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test=".//cat_ru:Address/cat_ru:Region">
                              <xsl:text>, </xsl:text>
                              <xsl:value-of select=".//cat_ru:Address/cat_ru:Region"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test=".//cat_ru:Address/cat_ru:City">
                              <xsl:text>, </xsl:text>
                              <xsl:value-of select=".//cat_ru:Address/cat_ru:City"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test=".//cat_ru:Address/cat_ru:StreetHouse">
                              <xsl:text>, </xsl:text>
                              <xsl:value-of select=".//cat_ru:Address/cat_ru:StreetHouse"/>
                           </xsl:if>
                        </td>
                  </tr>
                  <!--tr>
                     <td style="width:20mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="left" style="font-weight:bold; font-size:12pt;" width="75">
                        <xsl:if test=".//cat_ru:Phone">Тел.:
										
							</xsl:if>
                     </td>
                     <td width="600">
                        <xsl:if test=".//cat_ru:Phone">
                           <xsl:value-of select=".//cat_ru:Phone"/>
                           <xsl:text>, </xsl:text>
                        </xsl:if>
                        <xsl:if test=".//cat_ru:Fax">
                           <span style="font-weight:bold;font-size:12pt; ">факс:</span>
                           <xsl:value-of select=".//cat_ru:Fax"/>
                           <xsl:text>, </xsl:text>
                        </xsl:if>
                        <xsl:if test=".//cat_ru:Telex">
                           <span style="font-weight:bold;font-size:12pt; ">телекс:</span>
                           <xsl:value-of select=".//cat_ru:Telex"/>
                        </xsl:if>
                     </td>
                  </tr-->
               </tbody>
            </table>
			<table>
				<tbody>
					<tr>
					 <td style="width:20mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
						<td>
							УИН:
							<xsl:apply-templates select="irg:InqRecallGTD/irg:UIN"/>
						</td>
					</tr>
				</tbody>
			</table>
            <br/>
            <table border="0" align="right">
               <tbody>
                  <tr>
                     <td align="right"><b>Дата и время направления сообщения: </b>
                                <xsl:for-each select="irg:InqRecallGTD">
                           <xsl:for-each select="irg:SendDate">
                              <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
                           </xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="irg:InqRecallGTD">
                           <xsl:for-each select="irg:SendTime">
							   <xsl:value-of select="substring(., 1, 8)"/>
                              <!--xsl:apply-templates/-->
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
                        </xsl:for-each>
                     </td>
                  </tr>
               </tbody>
            </table> 
            <!--
                    
                </xsl:for-each>
                <xsl:for-each select="irg:InqRecallGTD">
                    <xsl:for-each select="irg:Applicant">
                        <xsl:for-each select="cat_ru:OGRN">
                            <xsl:apply-templates />
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
                   (<xsl:for-each select="irg:InqRecallGTD">
                    <xsl:for-each select="irg:Applicant">
                        <xsl:for-each select="cat_ru:Address/cat_ru:StreetHouse">
                            <xsl:apply-templates />
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>)<br />
                <xsl:apply-templates select="irg:InqRecallGTD/irg:Applicant/cat_ru:Address"/>
                
                <br />
                <br />
                <br />-->
         </body>
      </html>
   </xsl:template>
   <!--<xsl:template match="cat_ru:Address">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="cat_ru:Address/*">
		<xsl:if test="preceding-sibling::*[1]">, </xsl:if>
		<xsl:value-of select="."/>
	</xsl:template>-->
	<xsl:template match="irg:GTDNumber | irg:UIN">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		 <xsl:text>/</xsl:text>
		 <xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		 </xsl:call-template>
		 <xsl:text>/</xsl:text>
		 <xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
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
</xsl:stylesheet>
