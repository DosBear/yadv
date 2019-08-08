<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ici="urn:customs.ru:Information:TreatmentDocuments:InqChangeInoTreatment:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="ici:InqChangeInoTreatment">
      <html>
         <head>
            <title>Обращение на внесение изменений в действующее разрешение на переработку товаров вне таможенной территории</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}			
					</style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain">
									Дата и время направления запроса: 
									<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ici:SendDate"/>
                           </xsl:call-template>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="ici:SendTime"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" style="width:70mm">
                           <xsl:value-of select="ici:Customs/cat_ru:Code"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="ici:Customs/cat_ru:OfficeName"/>
                        </td>
                        <td class="graphMain" style="width:130mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:70mm">
								(наименование таможенного органа)
								</td>
                        <td class="graphMain" style="width:130mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="bold" colspan="2">Обращение на внесение изменений в действующее разрешение на переработку товаров вне таможенной территории
							</td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:50mm">
								Декларант:
								</td>
                        <td align="left" class="normal" style="width:140mm">
                           <xsl:value-of select="ici:Applicant/cat_ru:OrganizationName"/>
                        </td>
                     </tr>
                     <xsl:if test="ici:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                        <tr>
                           <td align="left" class="graphMain" style="width:50mm">
								ОГРН:
								</td>
                           <td align="left" class="normal" style="width:140mm">
                              <xsl:value-of select="ici:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ici:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                        <tr>
                           <td align="left" class="graphMain" style="width:50mm">
								ИНН:
								</td>
                           <td align="left" class="normal" style="width:140mm">
                              <xsl:value-of select="ici:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ici:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                        <tr>
                           <td align="left" class="graphMain" style="width:50mm">
								КПП:
								</td>
                           <td align="left" class="normal" style="width:140mm">
                              <xsl:value-of select="ici:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ici:Applicant/cat_ru:OKPOID">
                        <tr>
                           <td align="left" class="graphMain" style="width:50mm">
								ОКПОПД:
								</td>
                           <td align="left" class="normal" style="width:140mm">
                              <xsl:value-of select="ici:Applicant/cat_ru:OKPOID"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ici:Applicant/cat_ru:OKATOCode">
                        <tr>
                           <td align="left" class="graphMain" style="width:50mm">
								ОКАТОКод:
								</td>
                           <td align="left" class="normal" style="width:140mm">
                              <xsl:value-of select="ici:Applicant/cat_ru:OKATOCode"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ici:Applicant/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
                        <tr>
                           <td align="left" class="graphMain" style="width:50mm">
								УНП:
								</td>
                           <td align="left" class="normal" style="width:140mm">
                              <xsl:value-of select="ici:Applicant/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ici:Applicant/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
                        <tr>
                           <td align="left" class="graphMain" style="width:50mm">
								БИН:
								</td>
                           <td align="left" class="normal" style="width:140mm">
                              <xsl:value-of select="ici:Applicant/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ici:Applicant/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
                        <tr>
                           <td align="left" class="graphMain" style="width:50mm">
								ИИН:
								</td>
                           <td align="left" class="normal" style="width:140mm">
                              <xsl:value-of select="ici:Applicant/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ici:Applicant/cat_ru:RKOrganizationFeatures/cat_ru:ITN">
                        <tr>
                           <td align="left" class="graphMain" style="width:50mm">
								ИТН №:
								</td>
                           <td align="left" class="normal" style="width:140mm">
                              <xsl:value-of select="ici:Applicant/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
										<xsl:value-of select="ici:Applicant/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
										<xsl:value-of select="ici:Applicant/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
										<xsl:value-of select="ici:Applicant/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test=".//cat_ru:Address">
                        <tr>
                           <td align="left" class="graphMain" style="width:50mm">Адрес:</td>
                           <td align="left" class="normal" style="width:140mm">
                              <xsl:if test=".//cat_ru:Address/cat_ru:PostalCode">
                                 <xsl:value-of select=".//cat_ru:Address/cat_ru:PostalCode"/>
                              </xsl:if>
                              <xsl:if test=".//cat_ru:Address/cat_ru:CountryCode">
                                 <xsl:text>, </xsl:text>
                                 <xsl:value-of select=".//cat_ru:Address/cat_ru:CountryCode"/>
                              </xsl:if>
                              <xsl:if test=".//cat_ru:Address/cat_ru:CounryName">
                                 <xsl:text>, </xsl:text>
                                 <xsl:value-of select=".//cat_ru:Address/cat_ru:CounryName"/>
                              </xsl:if>
                              <xsl:if test=".//cat_ru:Address/cat_ru:Region">
                                 <xsl:text>, </xsl:text>
                                 <xsl:value-of select=".//cat_ru:Address/cat_ru:Region"/>
                              </xsl:if>
                              <xsl:if test=".//cat_ru:Address/cat_ru:City">
                                 <xsl:text>, </xsl:text>
                                 <xsl:value-of select=".//cat_ru:Address/cat_ru:City"/>
                              </xsl:if>
                              <xsl:if test=".//cat_ru:Address/cat_ru:StreetHouse">
                                 <xsl:text>, </xsl:text>
                                 <xsl:value-of select=".//cat_ru:Address/cat_ru:StreetHouse"/>
                              </xsl:if>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="left" class="graphMain" style="width:50mm">
                           <xsl:if test=".//cat_ru:Contact/cat_ru:Phone">Тел.:</xsl:if>
                        </td>
                        <td align="left" class="normal" style="width:140mm">
                           <xsl:if test=".//cat_ru:Contact/cat_ru:Phone">
                              <xsl:value-of select=".//cat_ru:Contact/cat_ru:Phone"/>
                              <xsl:text>, </xsl:text>
                           </xsl:if>
                           <xsl:if test=".//cat_ru:Contact/cat_ru:Fax">факс:
										<xsl:value-of select=".//cat_ru:Contact/cat_ru:Fax"/>
                              <xsl:text>, </xsl:text>
                           </xsl:if>
                           <xsl:if test=".//cat_ru:Contact/cat_ru:Telex">телекс:
										<xsl:value-of select=".//cat_ru:Contact/cat_ru:Telex"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:190mm">
								Прошу внести изменения в действующее разрешение на переработку товаров вне таможенной территории: 
								</td>
                     </tr>
                     <xsl:for-each select="ici:Changes">
                        <xsl:for-each select="ici:ChDescription">
                           <tr>
                              <td class="normal" colspan="2" style="width:190mm">
                                 <xsl:value-of select="."/>
                              </td>
                           </tr>
                        </xsl:for-each>
                        <xsl:for-each select="ici:Comments">
                           <tr>
                              <td class="graphMain" style="width:50mm">
								Комментарии:
								</td>
                              <td class="normal" style="width:140mm">
                                 <xsl:value-of select="."/>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </xsl:for-each>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
