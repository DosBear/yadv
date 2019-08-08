<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="oezin cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:oezin="urn:customs.ru:Information:CustomsDocuments:OEZ_Inventory:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
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
   <xsl:template match="oezin:OEZ_Inventory">
      <html>
         <head>
            <title>Опись документов к ДТ</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 3; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 6.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }
					td.bold { font-size: 8.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 10.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
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
					td.border-left-right-top { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; }
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					td.border-left-top { border-left: .5pt solid windowtext; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-right-top { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					span.bold { font-size: 12.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 12.0pt; font-family: Arial; color: windowtext; }
					div.page { width: 210mm; height: 297mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 12pt; }
					.graphLittle { font-family: Arial; font-size: 7pt; }
					.graphMain { font-family: Arial; font-size: 12pt;font-weight: bold;  }
					.graph-number { font-size: 9pt; font-weight: bold; }
					</style>
         </head>
         <body>
            <div class="page">
               <!--h3>Опись документов ОЭЗ </h3-->
               <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                  <tbody>
                     <!--tr>
								<td style="width:180mm;" class="value">
									<span class="value">Сведения о декларанте: </span>
									<br/>
									<xsl:value-of select="ivt:GTDPerson/cat_ru:OrganizationName"/>
									<span class="value"> (</span>
									<xsl:value-of select="ivt:GTDPerson/cat_ru:ShortName"/>
									<span class="value">) </span>
									<xsl:if test="(ivt:GTDPerson/cat_ru:RFOrganizationFeatures) or (ivt:GTDPerson/cat_ru:RBOrganizationFeatures) or (ivt:GTDPerson/cat_ru:RKOrganizationFeatures)">
										<br/>
										<xsl:text>№ </xsl:text>
										<xsl:if test="ivt:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:ITN">
											<xsl:value-of select="ivt:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
											<xsl:value-of select="ivt:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
											<xsl:value-of select="ivt:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
											<xsl:value-of select="ivt:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
										</xsl:if>
										<xsl:if test="ivt:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
											<xsl:value-of select="ivt:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
										</xsl:if>
									</xsl:if>
									<br/>
									<xsl:text>№ </xsl:text>
									<xsl:if test="ivt:GTDPerson/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
										<xsl:value-of select="ivt:GTDPerson/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
									</xsl:if>
									<xsl:if test="ivt:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
										<xsl:value-of select="ivt:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
									</xsl:if>
									<xsl:if test="ivt:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
										<xsl:value-of select="ivt:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
									</xsl:if>
									<xsl:if test="ivt:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:INN">
										<xsl:value-of select="ivt:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</xsl:if>
									<xsl:if test="ivt:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										<xsl:text> / </xsl:text>
										<xsl:value-of select="ivt:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</xsl:if>
									<xsl:if test="ivt:GTDPerson/ivt:BranchOrganizationName">
										<br/>
										<xsl:value-of select="ivt:GTDPerson/ivt:BranchOrganizationName"/>
									</xsl:if>
								</td>
							</tr-->
                     <!--tr>
								<td style="width:180mm;" class="graph" align="center"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(наименование декларанта или таможенного представителя)</td>
							</tr-->
                     <tr>
                        <td align="center" class="graphMain" style="width:180mm;">
								ОПИСЬ ДОКУМЕНТОВ<br/>
                           <!--	№ ДТ 
									<u>
										<xsl:value-of select="ivt:GTDNumber/cat_ru:CustomsCode"/>
										<xsl:text> / </xsl:text>
										<xsl:call-template name="russian_date_gtd">
											<xsl:with-param name="dateIn" select="ivt:GTDNumber/cat_ru:RegistrationDate"/>
										</xsl:call-template>
										<xsl:text> / </xsl:text>
										<xsl:value-of select="ivt:GTDNumber/cat_ru:GTDNumber"/>
									</u-->
                           <br/>
						предоставляемых 
									<u>
                              <xsl:value-of select="oezin:InventoryInstancePerson/cat_ru:PersonSurname"/> 
										<xsl:value-of select="oezin:InventoryInstancePerson/cat_ru:PersonName"/> 
										<xsl:value-of select="oezin:InventoryInstancePerson/cat_ru:PersonMiddleName"/> </u>
                           <br/>
                           <span class="graphLittle">(ФИО лица, подающего опись)</span>
                           <br/>
                           <xsl:if test="oezin:InventoryInstancePerson/oezin:IdentityCard">
                              <u>
                                 <xsl:value-of select="oezin:InventoryInstancePerson/oezin:IdentityCard/RUScat_ru:IdentityCardCode"/> 
											<xsl:value-of select="oezin:InventoryInstancePerson/oezin:IdentityCard/RUScat_ru:IdentityCardName"/> 
											<xsl:value-of select="oezin:InventoryInstancePerson/oezin:IdentityCard/RUScat_ru:IdentityCardSeries"/> 
											<xsl:value-of select="oezin:InventoryInstancePerson/oezin:IdentityCard/RUScat_ru:IdentityCardNumber"/> 
											<!--xsl:value-of select="oezin:InventoryInstancePerson/oezin:IdentityCard/cat_ru:RBIdentificationNumber"/--> 
											<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="oezin:InventoryInstancePerson/oezin:IdentityCard/RUScat_ru:IdentityCardDate"/>
                                 </xsl:call-template> 
											<xsl:value-of select="oezin:InventoryInstancePerson/oezin:IdentityCard/cat_ru:OrganizationName"/> </u>
                              <br/>
                              <span class="graphLittle">(документ удостоверяющий личность)</span>
                              <br/>
                           </xsl:if>
                           <xsl:if test="oezin:InventoryInstancePerson/oezin:AuthoritesDocument">
                              <u>
                                 <xsl:value-of select="oezin:InventoryInstancePerson/oezin:AuthoritesDocument/cat_ru:PrDocumentName"/> 
											<xsl:value-of select="oezin:InventoryInstancePerson/oezin:AuthoritesDocument/cat_ru:PrDocumentNumber"/> 
											<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="oezin:InventoryInstancePerson/oezin:AuthoritesDocument/cat_ru:PrDocumentDate"/>
                                 </xsl:call-template> 
											<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="oezin:InventoryInstancePerson/oezin:AuthoritesDocument/cat_ru:ComplationAuthorityDate"/>
                                 </xsl:call-template> 
											</u>
                              <br/>
                              <span class="graphLittle">(документ удостоверяющий полномочия лица)</span>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <br/>
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" style="width:10mm;border:solid 0.8pt #000000;">№ п/п</td>
                                    <!--td style="width:50mm;border:solid 0.8pt #000000;" class="graph">Вид, номер и дата составления документа</td-->
                                    <td align="center" class="graph" style="width:25mm;border:solid 0.8pt #000000;">Код вида документа</td>
                                    <td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">Наименование документа</td>
                                    <!--td style="width:10mm;border:solid 0.8pt #000000;" class="graph">Оригинал / копия</td-->
                                    <td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">Количество экземпляров</td>
                                    <td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">Количество листов </td>
                                    <td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">Способ предоставления документа </td>
                                    <td align="center" class="graph" style="width:55mm;border:solid 0.8pt #000000;">Примечание </td>
                                 </tr>
                                 <!--tr>
												<td style="width:10mm;border:solid 0.8pt #000000;" class="graph" align="center">1</td>
												<td colspan="3" style="width:85mm;border:solid 0.8pt #000000;" class="graph" align="center">2</td>
												<td style="width:20mm;border:solid 0.8pt #000000;" class="graph" align="center">3</td>
												<td style="width:65mm;border:solid 0.8pt #000000;" class="graph" align="center">4</td>
											</tr-->
                                 <!--tr>
												<td colspan="6" style="width:180mm;border:solid 0.8pt #000000;" class="graph">1. Документы, необходимые для принятия ДТ</td>
											</tr-->
                                 <xsl:for-each select="oezin:InventDocument">
                                    <xsl:variable name="pos" select="position()"/>
                                    <!--xsl:if test="ivt:SectionNumber=0"-->
                                    <tr>
                                       <td align="center" class="graph" style="width:10mm;border:solid 0.8pt #000000;">
                                          <xsl:number value="position()"/>
                                       </td>
                                       <td align="center" class="graph" style="width:25mm;border:solid 0.8pt #000000;">
                                          <xsl:value-of select="oezin:InvDocCode"/>
                                       </td>
                                       <td class="graph" style="width:30mm;border:solid 0.8pt #000000;">
                                          <xsl:value-of select="oezin:InvDocName"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="oezin:InvDocNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="oezin:InvDocDate"/>
                                          </xsl:call-template>
                                       </td>
                                       <td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">
                                          <xsl:value-of select="oezin:InvDocCopies"/>
                                       </td>
                                       <td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">
                                          <xsl:value-of select="oezin:InvDocLists"/>
                                       </td>
                                       <td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">
                                          <xsl:choose>
                                             <xsl:when test="(oezin:PaperDocumentSign='true') or (oezin:PaperDocumentSign='t') or (oezin:PaperDocumentSign='1')">в виде бумажного документа</xsl:when>
                                             <xsl:otherwise>в электронной форме</xsl:otherwise>
                                          </xsl:choose>
                                       </td>
                                       <td class="graph" style="width:55mm;border:solid 0.8pt #000000;">
                                          <xsl:if test="oezin:Note">
                                             <xsl:value-of select="oezin:Note"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:if>
                                       </td>
                                    </tr>
                                    <!--/xsl:if-->
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <br/>
									
									Ф.И.О лица, подавшего ДТ,
									<u>
                              <xsl:value-of select="oezin:InventoryInstancePerson/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="oezin:InventoryInstancePerson/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="oezin:InventoryInstancePerson/cat_ru:PersonMiddleName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="oezin:InventoryInstancePerson/cat_ru:PersonPost"/>
                           </u>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <br>
                           <td class="graph" style="width:180mm;">
								Дата
									<u>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="oezin:InventoryInstanceDate"/>
                                 </xsl:call-template>
                              </u>
                           </td>
                        </br>
                     </tr>
                     <tr>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
								Подпись<text>__________________</text>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
