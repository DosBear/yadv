<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="catWH_ru cat_ru whgd" version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:whgd="urn:customs.ru:Information:WarehouseDocuments:WHGoodsDeadline:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <!--Шаблоны-->
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
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
   <xsl:template name="head1">
      <table style="width:80mm">
         <tbody>
            <tr>
               <td>
                  <br/>
               </td>
            </tr>
            <tr>
               <td align="center"/>
            </tr>
            <tr>
               <td align="center" class="underlined" style="width:80mm">
                  <xsl:value-of select="whgd:Customs/cat_ru:Code"/> <xsl:value-of select="whgd:Customs/cat_ru:OfficeName"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph" style="width:80mm">
				 (наименование таможенного органа)
				</td>
            </tr>
            <tr>
               <td>
                  <table style="width:80mm">
                     <tbody>
                        <tr>
                           <td align="center" class="underlined" style="width:37mm">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="whgd:DocumentDate"/>
                              </xsl:call-template>
                           </td>
                           <td style="width:5mm">№</td>
                           <td class="underlined" style="width:37mm">
                              <xsl:value-of select="whgd:DocumentNumber"/>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="width:37mm">
						(дата)
						</td>
                           <td class="graph" style="width:5mm"/>
                           <td class="graph" style="width:37mm"/>
                        </tr>
                     </tbody>
                  </table>
               </td>
               <!--td align="justify">
					<u>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="whgd:DocumentDate"/>
					</xsl:call-template></u>
					№<u><xsl:value-of select="whgd:DocumentNumber"/></u>
				</td-->
            </tr>
            <!--tr>
				<-td align="left" class="graph">
				&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; (дата)
				</td>
			</tr-->
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="head2">
      <table style="width:80mm">
         <tbody>
            <tr>
               <td align="left" style="width:80mm">
					Руководителю
				</td>
            </tr>
            <tr>
               <td align="center" class="underlined" style="width:80mm">
                  <xsl:value-of select="whgd:Receiver/cat_ru:OrganizationName"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph" style="width:80mm">
				 (полное наименование организации)
				</td>
            </tr>
            <tr>
               <td align="center" class="underlined" style="width:80mm">
                  <xsl:value-of select="whgd:Receiver/whgd:DirectorInfo/cat_ru:PersonSurname"/> 
					<xsl:value-of select="whgd:Receiver/whgd:DirectorInfo/cat_ru:PersonName"/> 
					<xsl:value-of select="whgd:Receiver/whgd:DirectorInfo/cat_ru:PersonMiddleName"/> 
					</td>
            </tr>
            <tr>
               <td align="center" class="underlined" style="width:80mm">
                  <xsl:for-each select="whgd:Receiver/whgd:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph" style="width:80mm">
				 (адрес организации)
				</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="org">
      <xsl:value-of select="cat_ru:OrganizationName"/> 
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
         <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
		</xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
         <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
		</xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
         <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
		</xsl:if>
      <xsl:for-each select="whgd:Address">
         <xsl:call-template name="Address"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="body1">
      <table style="width:210mm">
         <tbody>
            <tr>
               <td align="center" style="width:210mm">
                  <b>Уведомление<br/>
             о предстоящем истечении срока временного хранения
</b>
               </td>
            </tr>
            <tr>
               <td style="width:210mm">
					Настоящим  информируем о том, что срок временного хранения товаров,
ввезенных по транспортному документу
					</td>
            </tr>
            <tr>
               <td style="width:210mm">
                  <table style="width:210mm">
                     <tbody>
                        <tr>
                           <td align="center" class="underlined" style="width:105mm">
                              <xsl:value-of select="whgd:TransportDoc/cat_ru:PrDocumentName"/>
                           </td>
                           <td align="center" style="width:5mm">от</td>
                           <td align="center" class="underlined" style="width:50mm">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="whgd:TransportDoc/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </td>
                           <td align="center" style="width:5mm">№</td>
                           <td align="center" class="underlined" style="width:40mm">
                              <xsl:value-of select="whgd:TransportDoc/cat_ru:PrDocumentNumber"/>
						,
					</td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="width:105mm">
						(вид документа)
					</td>
                           <td align="right" class="graph" style="width:5mm"/>
                           <td align="center" class="graph" style="width:50mm">
						 (дата)
					</td>
                           <td align="right" class="graph" style="width:5mm"/>
                           <td align="right" class="graph" style="width:40mm"/>
                        </tr>
                     </tbody>
                  </table>
               </td>
               <!--td style="width:210mm">
						<u>
							<xsl:value-of select="whgd:TransportDoc/cat_ru:PrDocumentName"/>
						</u> 
					от <u>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="whgd:TransportDoc/cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</u>
					№<u>
							<xsl:value-of select="whgd:TransportDoc/cat_ru:PrDocumentNumber"/>
						</u>,
					</td-->
            </tr>
            <tr>
               <td style="width:210mm">
						транзитной декларации (книжке МДП) №
						<u>
                     <xsl:value-of select="whgd:TIRTDNumber"/>
                  </u>
               </td>
            </tr>
            <tr>
               <td style="width:210mm">
						перевозчиком<u>
                     <xsl:for-each select="whgd:Carrier">
                        <xsl:call-template name="org"/>
                     </xsl:for-each>
                  </u>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph" style="width:210mm">
						(наименование организации)
					</td>
            </tr>
            <tr>
               <td style="width:210mm">
						в адрес получателя<u>
                     <xsl:for-each select="whgd:Receiver">
                        <xsl:call-template name="org"/>
                     </xsl:for-each>
                  </u>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph" style="width:210mm">
						(наименование организации)
					</td>
            </tr>
            <tr>
               <td>
                  <table>
                     <tbody>
                        <tr>
                           <td style="width:80mm">
						и помещенных на временное хранение
								</td>
                           <td align="center" class="underlined" style="width:45mm">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="whgd:PlacementDate"/>
                              </xsl:call-template>
                           </td>
                           <td style="width:15mm">
									на СВХ
								</td>
                           <td align="center" class="underlined" style="width:70mm">
                              <xsl:choose>
                                 <xsl:when test="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind!='lic_Permition'">
                                    <xsl:value-of select="whgd:Warehouse/cat_ru:OrganizationName"/>,
												
											</xsl:when>
                                 <xsl:otherwise/>
                              </xsl:choose>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:70mm"/>
                           <td align="center" class="graph" style="width:45mm"> (дата)</td>
                           <td class="graph" style="width:15mm"/>
                           <td align="center" class="graph" style="width:80mm">(наименование СВХ)</td>
                        </tr>
                     </tbody>
                  </table>
               </td>
            </tr>
            <tr>
               <td style="width:210mm"> свидетельство о включении в реестр владельцев СВХ (наименование СВХ)
						от<xsl:choose>
                     <xsl:when test="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind!='lic_Permition'">
                        <u>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate"/>
                           </xsl:call-template>
                        </u>
                     </xsl:when>
                     <xsl:otherwise>_________________</xsl:otherwise>
                  </xsl:choose>	
						№
						<xsl:choose>
                     <xsl:when test="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind!='lic_Permition'">
                        <u>
                           <xsl:value-of select="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/>
                        </u>
                     </xsl:when>
                     <xsl:otherwise>_________________</xsl:otherwise>
                  </xsl:choose>		
						,
					</td>
            </tr>
            <tr>
               <td style="width:210mm">(иное место временного хранения 
					
						<xsl:choose>
                     <xsl:when test="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind='lic_Permition'">
                        <u>
                           <xsl:value-of select="whgd:Warehouse/cat_ru:OrganizationName"/>
                        </u>
                     </xsl:when>
                     <xsl:otherwise>_________________</xsl:otherwise>
                  </xsl:choose>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph" style="width:210mm">(Наименование организации)</td>
            </tr>
            <tr>
               <td style="width:210mm">в соответсвии с разрешением таможни №
					<xsl:choose>
                     <xsl:when test="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind='lic_Permition'">
                        <u>
                           <xsl:value-of select="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/>
                        </u>
                     </xsl:when>
                     <xsl:otherwise>_________________</xsl:otherwise>
                  </xsl:choose>		
								) 
						истекает <u>
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="whgd:EndDate"/>
                     </xsl:call-template>
                  </u>.
					</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="body2">
      <table style="width:210mm">
         <tbody>
            <tr>
               <td align="center" style="width:210mm">
                  <b>Акт об истечении сроков временного хранения</b>
               </td>
            </tr>
            <tr>
               <td style="width:210mm">
					Настоящий  акт  составлен  о  том, что срок временного хранения товаров, ввезенных по транспортному документу

					</td>
            </tr>
            <tr>
               <td style="width:210mm">
                  <table style="width:210mm">
                     <tbody>
                        <tr>
                           <td align="center" class="underlined" style="width:105mm">
                              <xsl:value-of select="whgd:TransportDoc/cat_ru:PrDocumentName"/>
                           </td>
                           <td align="center" style="width:5mm">от</td>
                           <td align="center" class="underlined" style="width:50mm">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="whgd:TransportDoc/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </td>
                           <td align="center" style="width:5mm">№</td>
                           <td align="center" class="underlined" style="width:40mm">
                              <xsl:value-of select="whgd:TransportDoc/cat_ru:PrDocumentNumber"/>
						,
					</td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="width:105mm">
						(вид документа)
					</td>
                           <td align="right" class="graph" style="width:5mm"/>
                           <td align="center" class="graph" style="width:50mm">
						 (дата)
					</td>
                           <td align="right" class="graph" style="width:5mm"/>
                           <td align="right" class="graph" style="width:40mm"/>
                        </tr>
                     </tbody>
                  </table>
               </td>
               <!--td style="width:210mm">
						<u>
							<xsl:value-of select="whgd:TransportDoc/cat_ru:PrDocumentName"/>
						</u> 
					от <u>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="whgd:TransportDoc/cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</u>
					№<u>
							<xsl:value-of select="whgd:TransportDoc/cat_ru:PrDocumentNumber"/>
						</u>,
					</td-->
            </tr>
            <tr>
               <td style="width:210mm">
						транзитной декларации (книжке МДП) №
						<u>
                     <xsl:value-of select="whgd:TIRTDNumber"/>
                  </u>
               </td>
            </tr>
            <tr>
               <td style="width:210mm">
						перевозчиком<u>
                     <xsl:for-each select="whgd:Carrier">
                        <xsl:call-template name="org"/>
                     </xsl:for-each>
                  </u>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph" style="width:210mm">
						(наименование организации)
					</td>
            </tr>
            <tr>
               <td style="width:210mm">
						в адрес получателя<u>
                     <xsl:for-each select="whgd:Receiver">
                        <xsl:call-template name="org"/>
                     </xsl:for-each>
                  </u>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph" style="width:210mm">
						(наименование организации)
					</td>
            </tr>
            <tr>
               <td>
                  <table>
                     <tbody>
                        <tr>
                           <td style="width:80mm">
						и помещенных на временное хранение
								</td>
                           <td align="center" class="underlined" style="width:45mm">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="whgd:PlacementDate"/>
                              </xsl:call-template>
                           </td>
                           <td style="width:15mm">
									на СВХ
								</td>
                           <td align="center" class="underlined" style="width:70mm">
                              <xsl:choose>
                                 <xsl:when test="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind!='lic_Permition'">
                                    <xsl:value-of select="whgd:Warehouse/cat_ru:OrganizationName"/>,
												
											</xsl:when>
                                 <xsl:otherwise/>
                              </xsl:choose>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:70mm"/>
                           <td align="center" class="graph" style="width:45mm"> (дата)</td>
                           <td class="graph" style="width:15mm"/>
                           <td align="center" class="graph" style="width:80mm">(наименование СВХ)</td>
                        </tr>
                     </tbody>
                  </table>
               </td>
            </tr>
            <tr>
               <td style="width:210mm"> свидетельство о включении в реестр владельцев СВХ (наименование СВХ)
						от<xsl:choose>
                     <xsl:when test="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind!='lic_Permition'">
                        <u>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate"/>
                           </xsl:call-template>,
								</u>
                     </xsl:when>
                     <xsl:otherwise>_________________,</xsl:otherwise>
                  </xsl:choose>	
						№
						<xsl:choose>
                     <xsl:when test="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind!='lic_Permition'">
                        <u>
                           <xsl:value-of select="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/>
                        </u>
                     </xsl:when>
                     <xsl:otherwise>_________________</xsl:otherwise>
                  </xsl:choose>		
						,
					</td>
            </tr>
            <tr>
               <td style="width:210mm">(иное место временного хранения 
					
						<xsl:choose>
                     <xsl:when test="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind='lic_Permition'">
                        <u>
                           <xsl:value-of select="whgd:Warehouse/cat_ru:OrganizationName"/>
                        </u>
                     </xsl:when>
                     <xsl:otherwise>_________________</xsl:otherwise>
                  </xsl:choose>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph" style="width:210mm">(Наименование организации)</td>
            </tr>
            <tr>
               <td style="width:210mm">в соответсвии с разрешением таможни № 
					<xsl:choose>
                     <xsl:when test="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind='lic_Permition'">
                        <u>
                           <xsl:value-of select="whgd:Warehouse/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/>
                        </u>
                     </xsl:when>
                     <xsl:otherwise>_________________</xsl:otherwise>
                  </xsl:choose>		
								) 
						истекает <u>
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="whgd:EndDate"/>
                     </xsl:call-template>
                  </u>.
					</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="Signature">
      <table width="210mm">
         <tbody>
            <tr>
               <td align="center" class="underlined">
                  <xsl:value-of select="whgd:CustomInspector/cat_ru:PersonPost"/>
               </td>
               <td align="center" class="graph">
                  <xsl:text> </xsl:text>
               </td>
               <td align="center" class="underlined">
                  <!--xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
						</xsl:call-template-->
                  <xsl:value-of select="whgd:CustomInspector/catWH_ru:LNP"/>
               </td>
               <td align="center" class="graph">
                  <xsl:text> </xsl:text>
               </td>
               <td align="center" class="underlined">
                  <xsl:value-of select="whgd:CustomInspector/cat_ru:PersonSurname"/> 
						<xsl:value-of select="whgd:CustomInspector/cat_ru:PersonName"/> 
						<xsl:value-of select="whgd:CustomInspector/cat_ru:PersonMiddleName"/> 
					</td>
            </tr>
            <tr>
               <td align="center" class="graph">(должность)</td>
               <td align="center" class="graph">
                  <xsl:text> </xsl:text>
               </td>
               <td align="center" class="graph">(подпись)</td>
               <td align="center" class="graph">
                  <xsl:text> </xsl:text>
               </td>
               <td align="center" class="graph">(инициалы, фамилия)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="whgd:WHGoodsDeadline">
      <html>
         <head>
            <title>Уведомление/Акт  об истечении сроков временного хранения товаров</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; }
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
					div.page { width: 210mm; height: 297mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graph-number { font-size: 9pt; font-weight: bold; }
				</style>
         </head>
         <body>
            <div class="page">
               <xsl:if test="whgd:WHSign='1'">
                  <table border="0" cellpadding="3" cellspacing="0" style="width:210mm">
                     <tr>
                        <td align="center" style="width:80mm" valign="middle">
                           <xsl:call-template name="head1"/>
                        </td>
                        <td style="width:50mm">
                           <xsl:text disable-output-escaping="yes"/>
                        </td>
                        <td style="width:80mm">
                           <xsl:call-template name="head2"/>
                        </td>
                     </tr>
                  </table>
                  <table border="0" cellpadding="3" cellspacing="0" width="210mm">
                     <tr>
                        <td style="width:210mm">
                           <xsl:call-template name="body1"/>
                        </td>
                     </tr>
                  </table>
                  <table border="0" cellpadding="3" cellspacing="0" width="210mm">
                     <tr>
                        <td style="width:210mm">
                           <br/>
                           <xsl:call-template name="Signature"/>
                        </td>
                     </tr>
                  </table>
               </xsl:if>
               <xsl:if test="whgd:WHSign='2'">
                  <table border="0" cellpadding="3" cellspacing="0" width="210mm">
                     <tr>
                        <td style="width:105mm">
                           <xsl:call-template name="head1"/>
                        </td>
                        <td style="width:105mm"/>
                     </tr>
                  </table>
                  <table border="0" cellpadding="3" cellspacing="0" width="210mm">
                     <tr>
                        <td style="width:210mm">
                           <xsl:call-template name="body2"/>
                        </td>
                     </tr>
                  </table>
                  <table border="0" cellpadding="3" cellspacing="0" width="210mm">
                     <tr>
                        <td style="width:210mm">
                           <br/>
                           <xsl:call-template name="Signature"/>
                        </td>
                     </tr>
                  </table>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
