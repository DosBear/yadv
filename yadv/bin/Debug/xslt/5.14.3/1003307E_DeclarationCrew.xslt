<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:deccr="urn:customs.ru:Information:TransportDocuments:Sea:DeclarationCrew:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="deccr:DeclarationCrew">
      <html>
         <head>
            <title>Декларация о личных вещах экипажа.</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
							border: solid black 1pt #000000;
							border-collapse: collapse;
							}	
						table
							{
							
							border-collapse: collapse;
							background: #ffffff;
							}
							
							
						td {
							font-family:Arial;
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
						
						.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph14Bold {
						font-family: Arial;
						font-size: 14pt;
						font-weight: bold;
						}				
						.bordered {
					border-bottom: solid 1pt #000000;
										}	
						.uplined {
					border-top: solid 1pt #000000;
										}	
						.borderAll {
					border-bottom: solid 1pt #000000;
					border-left: solid 1pt #000000;
					border-right: solid 1pt #000000;
					border-top: solid 1pt #000000;
										}									
                </style>
         </head>
         <body>
            <div class="page">
               <table cellpadding="0" cellspacing="0" style="width:210mm">
                  <tbody>
                     <tr>
                        <td class="graph14Bold">Декларация о личных вещах экипажа
									<br/>
                           <br/>
                        </td>
                     </tr>
                     <xsl:if test="deccr:ArrivalPort">
                        <tr>
                           <td align="left">
									Порт прихода:<xsl:value-of select="deccr:ArrivalPort"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="deccr:DeparturePort">
                        <tr>
                           <td align="left">
									Порт отхода:<xsl:value-of select="deccr:DeparturePort"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <!--tr>
								<td style="width:180mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="width:10mm" class="borderAll">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="width:20mm" class="borderAll">
									Стр.No.
								</td>			
							</tr-->
                     <tr>
                        <td>
                           <br/>
                           <table align="left" border="1" cellpadding="0" cellspacing="0" style="width:210mm">
                              <tbody>
                                 <tr>
                                    <td>
                                       <table align="left" border="1" cellpadding="0" cellspacing="0" style="width:210mm">
                                          <tbody>
                                             <tr>
                                                <td align="left" style="width:60mm">
													1. Название судна<br/>
                                                   <xsl:value-of select="deccr:ShipName"/>
                                                </td>
                                                <td align="left" style="width:80mm">
														2. Предметы, которые подлежат или подтверждению на запрещение, или ограничению 
												</td>
                                                <td style="width:70mm">
                                                   <xsl:for-each select="deccr:Subject">
                                                      <xsl:value-of select="."/> 
													</xsl:for-each>
                                                </td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                       <table align="left" border="1" cellpadding="0" cellspacing="0" style="width:210mm">
                                          <tbody>
                                             <tr>
                                                <td align="left" style="width:60mm">
													3. Национальная принадлежность судна
												</td>
                                                <td align="left" style="width:150mm">
                                                   <xsl:value-of select="deccr:NationalityVessel"/> 
											</td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                       <table border="1" cellpadding="0" cellspacing="0" style="width:210mm">
                                          <tbody>
                                             <tr>
                                                <td style="width:10mm">
													4. No
												</td>
                                                <td style="width:40mm">
													5. Фамилия имя
												</td>
                                                <td style="width:100mm">
													6. Должность
												</td>
                                                <td style="width:60mm">
													7. Подпись
												</td>
                                             </tr>
                                             <xsl:for-each select="deccr:PersonSignature">
                                                <tr>
                                                   <td>
                                                      <xsl:number value="position()"/>
                                                   </td>
                                                   <td>
                                                      <xsl:value-of select="cat_ru:PersonSurname"/> 
														<xsl:value-of select="cat_ru:PersonName"/> 
														<xsl:value-of select="cat_ru:PersonMiddleName"/> 
													</td>
                                                   <td>
                                                      <xsl:value-of select="cat_ru:PersonPost"/>
                                                   </td>
                                                   <td>
                                                      <xsl:value-of select="cat_ru:PersonPost"/>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <table cellpadding="0" cellspacing="0" style="width:210mm">
                              <tbody>
                                 <tr>
                                    <td align="left">  8. Дата и подпись капитана, уполномоченного агента или лица командного состава.<br/>
                                       <xsl:value-of select="deccr:CaptainSignature/cat_ru:PersonSurname"/> 
									<xsl:value-of select="deccr:CaptainSignature/cat_ru:PersonName"/> 
									<xsl:value-of select="deccr:CaptainSignature/cat_ru:PersonMiddleName"/>     
									<xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="deccr:CaptainSignature/cat_ru:IssueDate"/>
                                       </xsl:call-template>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
