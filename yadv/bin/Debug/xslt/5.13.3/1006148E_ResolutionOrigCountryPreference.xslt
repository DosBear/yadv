<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="rocp cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rocp="urn:customs.ru:Information:CustomsDocuments:ResolutionOrigCountryPreference:5.10.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <!--Шаблоны-->
   <!--xsl:template name="Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/>,&#160;
	</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>,&#160;
	</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:value-of select="cat_ru:Region"/>,&#160;
	</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:value-of select="cat_ru:City"/>,&#160;
	</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template-->
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
      <xsl:param name="date"/>
      <xsl:choose>
         <xsl:when test="substring($date,5,1)='-' and substring($date,8,1)='-'">
            <xsl:value-of select="substring($date,9,2)"/>
            <xsl:value-of select="substring($date,6,2)"/>
            <xsl:value-of select="substring($date,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$date"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--xsl:template name="org">
		<xsl:value-of select="cat_ru:OrganizationName"/>&#160;
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>&#160;
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>&#160;
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>&#160;
		</xsl:if>
		<xsl:for-each select="whgd:Address">
			<xsl:call-template name="Address"/>
		</xsl:for-each>
	</xsl:template-->
   <xsl:template match="rocp:ResolutionOrigCountryPreference">
      <html>
         <head>
            <title>Решение (решения) о стране происхождения товаров и (или) предоставлении тарифных преференций</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; word-wrap: break-word;}
					td { font-size: 11.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }
					td.bold { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 8.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
					td.border-left { border-left: medium none; border-right: .5pt solid black; }
					td.border { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: medium none; } 
					td.border-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; } 
					td.border-top { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-bottom { border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; } 
					td.border-top-bottom { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; } 
					td.border-top-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-top-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left-right-bottom { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					span.bold { font-size: 12.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 12.0pt; font-family: Courier; color: windowtext; }
					div.page { width: 210mm; height: 297mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000;}
					.graph { font-family: Arial; font-size: 7pt; }
					.graphMain { font-family: Arial; font-size: 14pt; }
					.graph-number { font-size: 9pt; font-weight: bold; }
				</style>
         </head>
         <body>
            <div class="page">
               <table align="center" style="width:210mm;">
                  <tbody>
                     <tr>
                        <td align="center" style="width:210mm">
                           <table>
                              <tbody align="center">
                                 <tr align="center">
                                    <td align="center" style="width:70mm; border:solid 1pt #000000;">
                                       <!--Наименование таможенного органа-->
                                       <xsl:value-of select="rocp:Customs/cat_ru:OfficeName"/>
                                       <br/>
                                       <xsl:value-of select="rocp:Customs/cat_ru:Code"/>
                                    </td>
                                    <td style="width:30mm;">
                                       <xsl:text> </xsl:text>
                                       <xsl:text> </xsl:text>
                                    </td>
                                    <td align="center" style="width:110mm;border:solid 1pt #000000;">
                                       <!--Наименование декларанта (таможенного представителя)-->
                                       <xsl:value-of select="rocp:OrganizationName"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <br/>
                           <table style="width:210mm">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graphMain">
                                       <b>РЕШЕНИЕ (РЕШЕНИЯ) О СТРАНЕ ПРОИСХОЖДЕНИЯ ТОВАРОВ И (ИЛИ) <br/>ПРЕДОСТАВЛЕНИИ ТАРИФНЫХ ПРЕФЕРЕНЦИЙ</b>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center">
									от <u>
                                          <xsl:value-of select="substring(rocp:ResolutionDate, 9,2)"/> 
									<xsl:choose>
                                             <xsl:when test="(substring(rocp:ResolutionDate,6,2))='01'">января</xsl:when>
                                             <xsl:when test="(substring(rocp:ResolutionDate,6,2))='02'">февраля</xsl:when>
                                             <xsl:when test="(substring(rocp:ResolutionDate,6,2))='03'">марта</xsl:when>
                                             <xsl:when test="(substring(rocp:ResolutionDate,6,2))='04'">апреля</xsl:when>
                                             <xsl:when test="(substring(rocp:ResolutionDate,6,2))='05'">мая</xsl:when>
                                             <xsl:when test="(substring(rocp:ResolutionDate,6,2))='06'">июня</xsl:when>
                                             <xsl:when test="(substring(rocp:ResolutionDate,6,2))='07'">июля</xsl:when>
                                             <xsl:when test="(substring(rocp:ResolutionDate,6,2))='08'">августа</xsl:when>
                                             <xsl:when test="(substring(rocp:ResolutionDate,6,2))='09'">сентября</xsl:when>
                                             <xsl:when test="(substring(rocp:ResolutionDate,6,2))='10'">октября</xsl:when>
                                             <xsl:when test="(substring(rocp:ResolutionDate,6,2))='11'">ноября</xsl:when>
                                             <xsl:when test="(substring(rocp:ResolutionDate,6,2))='12'">декабря</xsl:when>
                                          </xsl:choose>
                                       </u>
									20<u>
                                          <xsl:value-of select="substring(rocp:ResolutionDate,3,2)"/>
                                       </u> 
									№<u>
                                          <xsl:value-of select="rocp:ResolutionNumber/rocp:CustomsCode"/>/
														<xsl:value-of select="rocp:ResolutionNumber/rocp:NomenclatureNumber"/>/
														<xsl:value-of select="rocp:ResolutionNumber/rocp:SerialNumber"/>
                                       </u>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <br/>
                           <table style="width:210mm">
                              <tbody>
                                 <tr>
                                    <td align="center" style="width:210mm">
													По результатам таможенного контроля таможенным органом по ДТ № <u>
                                          <xsl:value-of select="rocp:GTDID/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                                             <xsl:with-param name="date" select="rocp:GTDID/cat_ru:RegistrationDate"/>
                                          </xsl:call-template>/<xsl:value-of select="rocp:GTDID/cat_ru:GTDNumber"/>
                                       </u>
													принято следующее решение (решения):</td>
                                 </tr>
                              </tbody>
                           </table>
                           <br/>
                           <table style="width:210mm">
                              <xsl:if test="rocp:ResolutionDescription/rocp:DecisionSign='1'">
                                 <tr>
                                    <td>
                                       <span style="border: 1pt solid #000000">
                                          <b> V </b>
                                       </span> О СТРАНЕ ПРОИСХОЖДЕНИЯ (СП) ТОВАРОВ:
														</td>
                                 </tr>
                                 <tr>
                                    <td style="width:210mm">
                                       <br/>
													1. Заявленные сведения о стране происхождения товаров приняты в отношении следующих товаров:
													<table border="1" style="width:210mm">
                                          <tbody>
                                             <br/>
                                             <tr align="center">
                                                <td style="width:50mm">Номер товара по ДТ</td>
                                                <td style="width:50mm">Заявленный код СП</td>
                                                <td style="width:110mm">Номер и дата документа, подтверждающего заявленную СП</td>
                                             </tr>
                                             <xsl:choose>
                                                <xsl:when test="rocp:ResolutionDescription/rocp:DecisionMeaning='1'">
                                                   <xsl:for-each select="rocp:ResolutionDescription/rocp:InfoCountryCode[../rocp:DecisionMeaning='1']">
                                                      <tr>
                                                         <td style="width:50mm">
                                                            <xsl:for-each select="rocp:GoodsNumber">
                                                               <xsl:if test="position()>1">, </xsl:if>
                                                               <xsl:value-of select="."/>
                                                            </xsl:for-each>
                                                         </td>
                                                         <td style="width:50mm">
                                                            <xsl:value-of select="rocp:DeclCountryCode"/>
                                                         </td>
                                                         <td style="width:110mm">
                                                            <xsl:for-each select="rocp:DocumentCountryCode">
                                                               <xsl:value-of select="cat_ru:PrDocumentName"/> 
																						№<xsl:value-of select="cat_ru:PrDocumentNumber"/>
																						 от  <xsl:call-template name="russian_date">
                                                                  <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                               </xsl:call-template> 
																				</xsl:for-each>
                                                         </td>
                                                      </tr>
                                                   </xsl:for-each>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <tr style="height:25px">
                                                      <td/>
                                                      <td/>
                                                      <td/>
                                                   </tr>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td style="width:210mm">
                                       <br/>
													2. Заявленные сведения о стране происхождения товаров скорректированы в отношении следующих товаров:
													<table border="1" style="width:210mm">
                                          <tbody>
                                             <br/>
                                             <tr align="center">
                                                <td style="width:20mm">Номер товара по ДТ</td>
                                                <td style="width:20mm">Заявленный код СП</td>
                                                <td style="width:80mm">Номер и дата документа, подтверждающего заявленную СП</td>
                                                <td style="width:30mm">Скорректированный код СП</td>
                                                <td style="width:60mm">Обоснование принятого решения</td>
                                             </tr>
                                             <xsl:choose>
                                                <xsl:when test="rocp:ResolutionDescription/rocp:DecisionMeaning='2'">
                                                   <xsl:for-each select="rocp:ResolutionDescription/rocp:InfoCountryCode[../rocp:DecisionMeaning='2']">
                                                      <tr>
                                                         <td style="width:20mm">
                                                            <xsl:for-each select="rocp:GoodsNumber">
                                                               <xsl:if test="position()>1">, </xsl:if>
                                                               <xsl:value-of select="."/>
                                                            </xsl:for-each>
                                                         </td>
                                                         <td style="width:20mm">
                                                            <xsl:value-of select="rocp:DeclCountryCode"/>
                                                         </td>
                                                         <td style="width:80mm">
                                                            <xsl:for-each select="rocp:DocumentCountryCode">
                                                               <xsl:value-of select="cat_ru:PrDocumentName"/> 
												№<xsl:value-of select="cat_ru:PrDocumentNumber"/>
																				 от  <xsl:call-template name="russian_date">
                                                                  <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                               </xsl:call-template> 
											</xsl:for-each>
                                                         </td>
                                                         <td style="width:30mm">
                                                            <xsl:value-of select="rocp:AdjCountryCode"/>
                                                         </td>
                                                         <td style="width:60mm; word-wrap: break-word; white-space: pre;">
															<xsl:for-each select="rocp:RationaleDecision">
																<xsl:apply-templates select="."/>
															</xsl:for-each>
                                                         </td>
                                                      </tr>
                                                   </xsl:for-each>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <tr style="height:25px">
                                                      <td/>
                                                      <td/>
                                                      <td/>
                                                      <td/>
                                                      <td/>
                                                   </tr>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="rocp:ResolutionDescription/rocp:DecisionSign='0'">
                                 <tr>
                                    <td style="width:210mm">
                                       <br/>
                                       <span style="border: 1pt solid #000000">
                                          <b> V </b>
                                       </span> 	 О ПРЕДОСТАВЛЕНИИ ТАРИФНЫХ ПРЕФЕРЕНЦИЙ<br/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td style="width:210mm">
                                       <br/>
													1. Тарифная преференция предоставлена в отношении следующих товаров:
													<table border="1" style="width:210mm">
                                          <tbody>
                                             <br/>
                                             <tr align="center">
                                                <td style="width:50mm">Номер товара по ДТ</td>
                                                <td style="width:50mm">Заявленный код СП</td>
                                                <td style="width:110mm">Номер и дата документа, подтверждающего заявленную СП</td>
                                             </tr>
                                             <xsl:choose>
                                                <xsl:when test="rocp:ResolutionDescription/rocp:DecisionMeaning='3'">
                                                   <xsl:for-each select="rocp:ResolutionDescription/rocp:InfoCountryCode[../rocp:DecisionMeaning='3']">
                                                      <tr>
                                                         <td style="width:50mm">
                                                            <xsl:for-each select="rocp:GoodsNumber">
                                                               <xsl:if test="position()>1">, </xsl:if>
                                                               <xsl:value-of select="."/>
                                                            </xsl:for-each>
                                                         </td>
                                                         <td style="width:50mm">
                                                            <xsl:value-of select="rocp:DeclCountryCode"/>
                                                         </td>
                                                         <td style="width:110mm">
                                                            <xsl:for-each select="rocp:DocumentCountryCode">
                                                               <xsl:value-of select="cat_ru:PrDocumentName"/> 
												№<xsl:value-of select="cat_ru:PrDocumentNumber"/>
																				 от  <xsl:call-template name="russian_date">
                                                                  <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                               </xsl:call-template> 
											</xsl:for-each>
                                                         </td>
                                                      </tr>
                                                   </xsl:for-each>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <tr style="height:25px">
                                                      <td/>
                                                      <td/>
                                                      <td/>
                                                   </tr>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td style="width:210mm">
                                       <br/>
													2. Тарифная преференция не предоставлена в отношении следующих товаров:
													<table border="1" style="width:210mm">
                                          <tbody>
                                             <br/>
                                             <tr align="center">
                                                <td style="width:20mm">Номер товара по ДТ</td>
                                                <td style="width:20mm">Заявленный код СП</td>
                                                <td style="width:80mm">Номер и дата документа, подтверждающего заявленную СП</td>
                                                <td style="width:30mm">Скорректированный код СП</td>
                                                <td style="width:60mm">Обоснование принятого решения</td>
                                             </tr>
                                             <xsl:choose>
                                                <xsl:when test="rocp:ResolutionDescription/rocp:DecisionMeaning='4'">
                                                   <xsl:for-each select="rocp:ResolutionDescription/rocp:InfoCountryCode[../rocp:DecisionMeaning='4']">
                                                      <tr>
                                                         <td style="width:20mm">
                                                            <xsl:for-each select="rocp:GoodsNumber">
                                                               <xsl:if test="position()>1">, </xsl:if>
                                                               <xsl:value-of select="."/>
                                                            </xsl:for-each>
                                                         </td>
                                                         <td style="width:20mm">
                                                            <xsl:value-of select="rocp:DeclCountryCode"/>
                                                         </td>
                                                         <td style="width:80mm">
                                                            <xsl:for-each select="rocp:DocumentCountryCode">
                                                               <xsl:value-of select="cat_ru:PrDocumentName"/> 
												№<xsl:value-of select="cat_ru:PrDocumentNumber"/>
																				 от  <xsl:call-template name="russian_date">
                                                                  <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                               </xsl:call-template> 
											</xsl:for-each>
                                                         </td>
                                                         <td style="width:30mm">
                                                            <xsl:value-of select="rocp:AdjCountryCode"/>
                                                         </td>
                                                         <td style="width:60mm; word-wrap: break-word; white-space: pre;">
															<xsl:for-each select="rocp:RationaleDecision">
																<xsl:apply-templates select="."/>
															</xsl:for-each>
                                                         </td>
                                                      </tr>
                                                   </xsl:for-each>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <tr style="height:25px">
                                                      <td/>
                                                      <td/>
                                                      <td/>
                                                      <td/>
                                                      <td/>
                                                   </tr>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </xsl:if>
                           </table>
                           <table style="width:210mm">
                              <tbody>
                                 <br/>
                                 <br/>
                                 <tr>
                                    <td align="center" class="graph" style="width:70mm">
                                       <u>
                                          <xsl:value-of select="rocp:Person/cat_ru:PersonPost"/>
                                       </u>
                                    </td>
                                    <td style="width:25mm">
                                       <xsl:text> </xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:30mm"/>
                                    <td style="width:25mm">
                                       <xsl:text> </xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:60mm">
                                       <u>
                                          <xsl:value-of select="rocp:Person/cat_ru:PersonSurname"/> <xsl:value-of select="rocp:Person/cat_ru:PersonName"/> <xsl:value-of select="rocp:Person/cat_ru:PersonMiddleName"/>
                                       </u>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:70mm">
													(наименование должности)
												</td>
                                    <td style="width:25mm">
                                       <xsl:text> </xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:30mm;border-top: .5pt solid windowtext;">
													(подпись)
												</td>
                                    <td style="width:25mm">
                                       <xsl:text> </xsl:text>
                                    </td>
                                    <td align="center" class="graph" style="width:60mm">
													(Ф.И.О. должностного лица)
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
