<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="quc cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:quc="urn:customs.ru:Information:RegistrationDocuments:QualificationCertificate:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template name="russian_date3">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="quc:QualificationCertificate">
      <html>
         <head>
            <title>Квалификационный аттестат специалиста по таможенному оформлению</title>
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
                        <td align="center" class="bold"> РОССИЙСКАЯ ФЕДЕРАЦИЯ <br/>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА
							</td>
                     </tr>
                     <tr>
                        <td align="center" colspan="10">
                           <span align="center" class="bold">Квалификационный аттестат специалиста <br/>по таможенному оформлению <br/>
                              <br/>
                              <br/>
                              <xsl:value-of select="quc:Form/quc:FormSerial"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="quc:Form/quc:FormNumber"/>
                              <br/>
                              <br/>
                              <xsl:value-of select="quc:RegistrationNumberCertificate/quc:NumberManagement"/>/
									<xsl:value-of select="quc:RegistrationNumberCertificate/quc:Date"/>
                              <!--xsl:call-template name="russian_date3">
										<xsl:with-param name="dateIn" select="quc:RegistrationNumberCertificate/quc:Date"/>
									</xsl:call-template-->
                              <xsl:value-of select="quc:RegistrationNumberCertificate/quc:SerialNumber"/>
                              <br/>
                              <br/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain">
								Настоящим Федеральная таможенная служба подтверждает, что гражданин (ка)
								</td>
                     </tr>
                     <tr>
                        <td align="center" class="normal">
                           <xsl:value-of select="quc:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="quc:DateBirth"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle">
								(фамилия, имя, отчество, дата рождения)
								</td>
                     </tr>
                     <tr>
                        <td class="graphMain">
								документ, удостоверяющий личность
								<span class="normal">
                              <xsl:value-of select="quc:IdentityCard/cat_ru:IdentityCardName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="quc:IdentityCard/cat_ru:IdentityCardSeries"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="quc:IdentityCard/cat_ru:IdentityCardNumber"/>,</span>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle">
								(наименование документа, серия, номер)
								</td>
                     </tr>
                     <tr>
                        <td class="graphMain">
								выданный 
								<span class="normal">
                              <xsl:value-of select="quc:IdentityCard/cat_ru:OrganizationName"/>
                              <xsl:text> </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="quc:IdentityCard/cat_ru:IdentityCardDate"/>
                              </xsl:call-template>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle">
								(выдавший орган, дата выдачи)
								</td>
                     </tr>
                     <tr>
                        <td class="graphMain">
								успешно сдал (а) квалификационный экзамен и вправе осуществлять деятельность в качестве специалиста по таможенному оформлению.
								</td>
                     </tr>
                     <tr>
                        <td class="graphMain">
								Решение экзаменационной комиссии
								<span class="normal">
                              <xsl:value-of select="quc:Customs/cat_ru:Code"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="quc:Customs/cat_ru:OfficeName"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle">
								(код и наименование таможенного органа)
								</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain">от 
								<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="quc:DateIssueCertificate"/>
                           </xsl:call-template>г.
								</td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain">
									Председатель экзаменационной комиссии
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;
									&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;
									&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <span class="normal">
                              <xsl:value-of select="quc:SignatureChairmanCommission/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="quc:SignatureChairmanCommission/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="quc:SignatureChairmanCommission/cat_ru:PersonMiddleName"/>
                              <xsl:text> </xsl:text>/
									<xsl:value-of select="quc:SignatureChairmanCommission/cat_ru:PersonPost"/>
                              <xsl:text> </xsl:text>/
									<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="quc:SignatureChairmanCommission/cat_ru:IssueDate"/>
                              </xsl:call-template>г.</span>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" class="graphMain">
								Оборотная сторона <br/>квалификационного аттестата
								</td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphMain">
									СВЕДЕНИЯ <br/> о прохождении обучения по программам повышения квалификации
									</td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td class="graph">
							Период прохождения обучения по программам квалификации
								</td>
                        <td class="graph">
							Наименование организации, проводившей обучение, номер лицензии на право ведения образовательной деятельности
								</td>
                        <td class="graph">
							Наименование документа, подтверждающего прохождение обучения, номер и дата выдачи
								</td>
                        <td class="graph">
							Отметка таможенного органа о соблюдении требовании о повышении квалификации (подпись уполномоченного лица, заверенная оттиском печати таможенного органа)
								</td>
                     </tr>
                     <xsl:for-each select="quc:InfoLearning">
                        <tr>
                           <td class="graphMain">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="quc:StartPeriod"/>
                              </xsl:call-template>
                              <xsl:text>-</xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="quc:EndPeriod"/>
                              </xsl:call-template>
                           </td>
                           <td class="graphMain">
                              <xsl:value-of select="quc:NameOrganizaion"/>, 
							<xsl:value-of select="quc:NubmerLicenseOrganization"/>
                           </td>
                           <td class="graphMain">
								<xsl:for-each select="quc:DocumentLearning">
									<xsl:value-of select="cat_ru:PrDocumentName"/>,
									<xsl:value-of select="cat_ru:PrDocumentNumber"/>
								    <xsl:text> </xsl:text> от<xsl:text> </xsl:text>
								    <xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
								    </xsl:call-template>
								    <xsl:if test="position()!=last()"><br/></xsl:if>
								</xsl:for-each>
                           </td>
                           <td class="graphMain">
                              <xsl:value-of select="quc:MarkCustoms"/>
                              <br/>
							(
								<xsl:for-each select="quc:SignatureAuthorizedPerson">
									<xsl:value-of select="cat_ru:PersonSurname"/>
									  <xsl:text> </xsl:text>
									  <xsl:value-of select="cat_ru:PersonName"/>
									  <xsl:text> </xsl:text>
									  <xsl:value-of select="cat_ru:PersonMiddleName"/>/
									<xsl:value-of select="cat_ru:PersonPost"/>/
									<xsl:call-template name="russian_date">
										 <xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
									  </xsl:call-template>
									<xsl:if test="position()!=last()">, </xsl:if>
                              </xsl:for-each>
                              )
								</td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
