<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="tmp cat_ru catESAD_ru" version="1.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tmp="urn:customs.ru:Information:CustomsDocuments:TransportMeansPassport:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="tmp:TransportMeansPassport">
      <html>
         <head>
            <title>ПАСПОРТ ТРАНСПОРТНОГО СРЕДСТВА</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					div.pagePortrait {
                        width: 210mm;}
					table { border: 0; cellpadding: 3; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 12pt; font-family: Courier New; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }
					td.bold { font-size: 8.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 12pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
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
					span.value { font-size: 12.0pt; font-family: Courier; color: windowtext; }
					div.page { width: 210mm; /*height: 297mm;*/ margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graph-number { font-size: 9pt; font-weight: bold; }
					.graph-bold { font-size: 12pt; font-weight: bold; }
			</style>
         </head>
         <body>
            <div class="page">
               <h4> ПАСПОРТ ТРАНСПОРТНОГО СРЕДСТВА</h4>
               <br/>
               <p/>
               <span class="graph-bold">
                  <xsl:value-of select="tmp:PTSSerialNumber/cat_ru:RegionCode"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="tmp:PTSSerialNumber/cat_ru:Series"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="tmp:PTSSerialNumber/cat_ru:PTSNumber"/>
               </span>
               <p/>
               <table width="210">
                  <tbody>
                     <tr>
                        <td width="140">Особые отметки <br/>
                           <xsl:value-of select="tmp:PTSData/tmp:SpecialMark"/>
                        </td>
                        <td width="70">
                           <table>
                              <tbody>
                                 <tr>
                                    <td align="left">
						1. Идентификационный номер (VIN): <span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/cat_ru:VINID"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="left">
							
							2. Марка, модель ТС: <span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/cat_ru:Model"/>
                                       </span>
                                       <xsl:text>      Код марки:  </xsl:text>
                                       <span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/cat_ru:MarkCode"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="tmp:PTSData/cat_ru:Mark"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
							3. Наименование (тип ТС):  <span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/tmp:Kind"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								4. Категория ТС (A, B, C, D, прицеп): <span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/tmp:TransportCategoryCode"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								5. Год изготовления транспортного средства: 
						<span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/cat_ru:OfftakeYear"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								6. Модель, N двигателя: 
						<span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/tmp:EngineModel"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="tmp:PTSData/cat_ru:EngineID"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								7. Шасси (рама) N: 
						<span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/cat_ru:ChassisID"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								8. Кузов (кабина, прицеп) N: 
						<span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/cat_ru:BodyID"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								9. Цвет кузова (кабины, прицепа) код: 
						<span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/tmp:TransportMeansColorCode"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								10. Идентификационный номер устройства или системы вызова экстренных оперативных служб, которыми оборудовано транспортное средство: 
						<span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/cat_ru:EmergencyDeviceID"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								11. Мощность двигателя, л.с. (кВт): 
						<span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/tmp:EnginePowerHpQuanity"/> (<xsl:value-of select="tmp:PTSData/tmp:EnginePowerKvtQuanity"/>)
						  </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								12. Рабочий объем двигателя, куб. см:
						<span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/cat_ru:EngineVolumeQuanity"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								13. Тип двигателя:
						<span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/tmp:EngineModeCode"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								14. Экологический класс:
						<span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/tmp:Ekoclass"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								15. Разрешенная максимальная масса, кг.:  <span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/tmp:MaxWeightQuantity"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								16. Масса без нагрузки, кг.:  <span class="graph-bold">
                                          <xsl:value-of select="tmp:PTSData/tmp:MinWeightQuantity"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								17. Организация - изготовитель ТС (страна):
						<span class="graph-bold">
                                          <xsl:value-of select="tmp:Manufacturer/catESAD_ru:TransportManufacturerName"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:if test="tmp:Manufacturer/catESAD_ru:ManufacturerCountryCode">
                                             <xsl:text>(</xsl:text>
                                             <xsl:value-of select="tmp:Manufacturer/catESAD_ru:ManufacturerCountryCode"/>
                                             <xsl:text>)</xsl:text>
                                          </xsl:if>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
								18. Одобрение типа ТС N:
						<span class="graph-bold">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="tmp:PTSData/tmp:ConformanceCertificate/catESAD_ru:DocumentID"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:if test="tmp:PTSData/tmp:ConformanceCertificate/catESAD_ru:IssueDate">
						 от <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="tmp:PTSData/tmp:ConformanceCertificate/catESAD_ru:IssueDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                          <xsl:if test="tmp:PTSData/tmp:ConformanceCertificate/catESAD_ru:OrganizationName">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text> выдано <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="tmp:PTSData/tmp:ConformanceCertificate/catESAD_ru:OrganizationName"/>
                                          </xsl:if>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
												19. Страна вывоза ТС: 
						<xsl:choose>
                                          <xsl:when test="tmp:CountryCode">
                                             <xsl:value-of select="tmp:CountryCode"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <xsl:text>Отсутствует</xsl:text>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
												20. Серия, N ТД, ТПО:   
						<xsl:choose>
                                          <xsl:when test="tmp:ImportCertification">
                                             <span class="graph-bold">
                                                <xsl:value-of select="tmp:ImportCertification/cat_ru:PrDocumentName"/>
                                                <xsl:text> </xsl:text>
                                             </span>
                                             <xsl:if test="tmp:ImportCertification/tmp:Series">
                                                <xsl:text>Серия  </xsl:text>
                                                <span class="graph-bold">
                                                   <xsl:value-of select="tmp:ImportCertification/tmp:Series"/>
                                                   <xsl:text> </xsl:text>
                                                </span>
                                             </xsl:if>
                                             <xsl:if test="tmp:ImportCertification/cat_ru:PrDocumentNumber">
                                                <xsl:text>N   </xsl:text>
                                                <span class="graph-bold">
                                                   <xsl:value-of select="tmp:ImportCertification/cat_ru:PrDocumentNumber"/>
                                                   <xsl:text> </xsl:text>
                                                </span>
                                             </xsl:if>
                                             <xsl:if test="tmp:ImportCertification/cat_ru:PrDocumentDate">
                                                <xsl:text> от  </xsl:text>
                                                <span class="graph-bold">
                                                   <xsl:call-template name="russian_date">
                                                      <xsl:with-param name="dateIn" select="tmp:ImportCertification/cat_ru:PrDocumentDate"/>
                                                   </xsl:call-template>
                                                </span>
                                             </xsl:if>
                                             <br/>
                                          </xsl:when>
                                          <xsl:when test="tmp:CustomsProfitOrder">
                                             <span class="graph-bold">
                                                <xsl:value-of select="tmp:CustomsProfitOrder/tmp:CustomsCode"/>
                                                <xsl:text>/</xsl:text>
                                                <xsl:call-template name="russian_date2">
                                                   <xsl:with-param name="dateIn" select="tmp:CustomsProfitOrder/tmp:RegistrationDate"/>
                                                </xsl:call-template>
                                                <xsl:text>/</xsl:text>
                                                <xsl:value-of select="tmp:CustomsProfitOrder/tmp:Series"/>
                                                <xsl:text>-</xsl:text>
                                                <xsl:value-of select="tmp:CustomsProfitOrder/tmp:Number"/>
                                             </span>
                                          </xsl:when>
                                          <xsl:when test="tmp:GTDID">
                                             <span class="graph-bold">
                                                <xsl:value-of select="tmp:GTDID/cat_ru:CustomsCode"/>
                                                <xsl:text>/</xsl:text>
                                                <xsl:call-template name="russian_date2">
                                                   <xsl:with-param name="dateIn" select="tmp:GTDID/cat_ru:RegistrationDate"/>
                                                </xsl:call-template>
                                                <xsl:text>/</xsl:text>
                                                <xsl:value-of select="tmp:GTDID/cat_ru:GTDNumber"/>
                                             </span>
                                          </xsl:when>
                                       </xsl:choose>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
												21. Таможенные ограничения: <span class="graph-bold">
                                          <xsl:value-of select="tmp:CustomsRestriction"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
												22. Наименование (ф.и.о.) собственника ТС:  
						<xsl:if test="tmp:TransportMeansOwner/catESAD_ru:OwnerModeCode = 'Ф'">
                                          <span class="graph-bold">
                                             <xsl:value-of select="tmp:TransportMeansOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:FirstName"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:TransportMeansOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Lastname"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:TransportMeansOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Patronymicname"/>
                                          </span>
                                       </xsl:if>
                                       <xsl:if test="tmp:TransportMeansOwner/catESAD_ru:OwnerModeCode = 'Ю'">
                                          <span class="graph-bold">
                                             <xsl:value-of select="tmp:TransportMeansOwner/catESAD_ru:TransportOwnerOrganization/cat_ru:OrganizationName"/>
                                          </span>
                                       </xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
												23. Адрес: 
						<xsl:if test="tmp:TransportMeansOwner/catESAD_ru:OwnerModeCode = 'Ф'">
                                          <span class="graph-bold">
                                             <xsl:apply-templates select="tmp:TransportMeansOwner//catESAD_ru:TransportOwnerPerson/catESAD_ru:Address"/>
                                          </span>
                                       </xsl:if>
                                       <xsl:if test="tmp:TransportMeansOwner/catESAD_ru:OwnerModeCode = 'Ю'">
                                          <span class="graph-bold">
                                             <xsl:apply-templates select="tmp:TransportMeansOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address"/>
                                          </span>
                                       </xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
												24. Наименование организации, выдавшей паспорт: 
						<span class="graph-bold">
                                          <xsl:value-of select="tmp:OrganizationName"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
												25. Адрес:  
						<span class="graph-bold">
                                          <xsl:apply-templates select="tmp:OrganizationlegalAddress"/>
                                       </span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
														26. Дата выдачи паспорта:  <span class="bord">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="tmp:IssueDate"/>
                                          </xsl:call-template>
                                       </span>
                                    </td>
                                 </tr>
                                 <!--tr>
												<td align="right">Подпись
													<p class="border-bottom"><xsl:value-of select="tmp:TSBargain/tmp:GIBDDRegistration/tmp:IssuingDocuments/cat_ru:PersonSurname"/>&#160;
													<xsl:value-of select="tmp:TSBargain/tmp:GIBDDRegistration/tmp:IssuingDocuments/cat_ru:PersonName"/>&#160;
													<xsl:value-of select="tmp:TSBargain/tmp:GIBDDRegistration/tmp:IssuingDocuments/cat_ru:PersonMiddleName"/>&#160;</p>
												</td>
											</tr-->
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <br/>
                     <tr>
                        <td align="left" colspan="2">
                           <br/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>  М.П. <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>                             Подпись:  <span class="underlined">
                              <xsl:value-of select="tmp:TSBargain/tmp:GIBDDRegistration/tmp:IssuingDocuments/cat_ru:PersonSurname"/> 
													<xsl:value-of select="tmp:TSBargain/tmp:GIBDDRegistration/tmp:IssuingDocuments/cat_ru:PersonName"/> 
													<xsl:value-of select="tmp:TSBargain/tmp:GIBDDRegistration/tmp:IssuingDocuments/cat_ru:PersonMiddleName"/> 										
									</span>
                           <br/>
                           <br/>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <xsl:for-each select="tmp:TSBargain">
                        <tr>
                           <td width="140">Особые отметки <br/>
                              <xsl:value-of select="tmp:SpecialMark"/>
                           </td>
                           <td>
                              <table>
                                 <tbody>
                                    <tr>
                                       <td colspan="2">
											Наименование (ф.и.о.) собственника шасси 
						<xsl:if test="tmp:NewTransportOwner/catESAD_ru:OwnerModeCode='Ф'">
                                             <span class="graph-bold">
                                                <xsl:value-of select="tmp:NewTransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:FirstName"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="tmp:NewTransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Patronymicname"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="tmp:NewTransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Lastname"/>
                                             </span>
                                          </xsl:if>
                                          <xsl:if test="tmp:NewTransportOwner/catESAD_ru:OwnerModeCode = 'Ю'">
                                             <span class="graph-bold">
                                                <xsl:value-of select="tmp:NewTransportOwner/catESAD_ru:TransportOwnerOrganization/cat_ru:OrganizationName"/>
                                             </span>
                                          </xsl:if>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">
											Адрес 						
						<xsl:if test="tmp:NewTransportOwner/catESAD_ru:OwnerModeCode = 'Ф'">
                                             <span class="graph-bold">
                                                <xsl:apply-templates select="tmp:NewTransportOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Address"/>
                                             </span>
                                          </xsl:if>
                                          <xsl:if test="tmp:NewTransportOwner/catESAD_ru:OwnerModeCode = 'Ю'">
                                             <span class="graph-bold">
                                                <xsl:apply-templates select="tmp:NewTransportOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address"/>
                                             </span>
                                          </xsl:if>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">
											Дата продажи (передачи):   <span class="graph-bold">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="tmp:SellingDate"/>
                                             </xsl:call-template>
                                          </span>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">
											Документ на право собственности:  <span class="graph-bold">
                                             <xsl:value-of select="tmp:DocPropertyRights/cat_ru:PrDocumentName"/>
                                             <xsl:text> </xsl:text>
                                          </span>
                                          <xsl:if test="tmp:DocPropertyRights/cat_ru:PrDocumentNumber">
                                             <xsl:text>N   </xsl:text>
                                             <span class="graph-bold">
                                                <xsl:value-of select="tmp:DocPropertyRights/cat_ru:PrDocumentNumber"/>
                                             </span>
                                             <xsl:text> </xsl:text>
                                          </xsl:if>
                                          <xsl:if test="tmp:DocPropertyRights/cat_ru:PrDocumentDate">
                                             <xsl:text> от  </xsl:text>
                                             <span class="graph-bold">
                                                <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="tmp:DocPropertyRights/cat_ru:PrDocumentDate"/>
                                                </xsl:call-template>
                                             </span>
                                          </xsl:if>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td>
                                          <br/>Подпись прежнего<br/> собственника</td>
                                       <td>
                                          <br/>Подпись настоящего<br/>собственника</td>
                                    </tr>
                                    <tr>
                                       <td>
                                          <span class="graph-bold">
                                             <!--xsl:value-of select="tmp:PrevOwnerSign/cat_ru:PersonPost"/-->
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:PrevOwnerSign/cat_ru:PersonSurname"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:PrevOwnerSign/cat_ru:PersonName"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:PrevOwnerSign/cat_ru:PersonMiddleName"/>
                                          </span>
                                          <br/>
                                          <br/>
                                       </td>
                                       <td>
                                          <span class="graph-bold">
                                             <!--xsl:value-of select="tmp:NewOwnerSign/cat_ru:PersonPost"/-->
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:NewOwnerSign/cat_ru:PersonSurname"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:NewOwnerSign/cat_ru:PersonName"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:NewOwnerSign/cat_ru:PersonMiddleName"/>
                                          </span>
                                          <br/>
                                          <br/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">
								Свидетельство о регистрации ТС <br/>
							Серия:  
							<span class="graph-bold">
                                             <xsl:value-of select="tmp:GIBDDRegistration/tmp:CertificateRegistration/tmp:Series"/>
                                          </span>
                                          <xsl:text>    N   </xsl:text>
                                          <span class="graph-bold">
                                             <xsl:value-of select="tmp:GIBDDRegistration/tmp:CertificateRegistration/tmp:Number"/>
                                          </span>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">
								Государственный регистрационный знак:  
							<span class="graph-bold">
                                             <xsl:value-of select="tmp:GIBDDRegistration/tmp:CertificateRegistration/tmp:RegSign"/>
                                          </span>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">
								Дата регистрации:  
							<span class="graph-bold">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="tmp:GIBDDRegistration/tmp:CertificateRegistration/tmp:RegData"/>
                                             </xsl:call-template>
                                          </span>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">
                                          <br/>
								Выдано ГИБДД:  
							<span class="graph-bold">
                                             <xsl:value-of select="tmp:GIBDDRegistration/tmp:CertificateRegistration/tmp:IssuedGIBDD"/>
                                          </span>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">
								М.П. <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>                             Подпись:  <span class="graph-bold">
                                             <xsl:value-of select="tmp:GIBDDRegistration/tmp:RegistrationSign/cat_ru:PersonPost"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:GIBDDRegistration/tmp:RegistrationSign/cat_ru:PersonSurname"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:GIBDDRegistration/tmp:RegistrationSign/cat_ru:PersonName"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:GIBDDRegistration/tmp:RegistrationSign/cat_ru:PersonMiddleName"/>
                                          </span>
                                          <br/>
                                          <br/>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">
								Отметка о снятии с учета <br/>
							Дата снятия с учета:   
							<span class="graph-bold">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="tmp:GIBDDRegistration//tmp:StrakeOffDate"/>
                                             </xsl:call-template>
                                          </span>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">
                                          <br/>
								М.П. <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>                             Подпись:  <span class="graph-bold">
                                             <xsl:value-of select="tmp:GIBDDRegistration/tmp:StrikeOffSign/cat_ru:PersonPost"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:GIBDDRegistration/tmp:StrikeOffSign/cat_ru:PersonSurname"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:GIBDDRegistration/tmp:StrikeOffSign/cat_ru:PersonName"/>
                                             <xsl:text> </xsl:text>
                                             <xsl:value-of select="tmp:GIBDDRegistration/tmp:StrikeOffSign/cat_ru:PersonMiddleName"/>
                                          </span>
                                          <br/>
                                          <br/>
                                          <br/>
                                          <br/>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="catESAD_ru:Address | tmp:OrganizationlegalAddress">
      <xsl:value-of select="cat_ru:StreetHouse"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:City"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:if test="string(cat_ru:PostalCode)!=''">
         <xsl:value-of select="cat_ru:PostalCode"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </xsl:if>
      <xsl:value-of select="cat_ru:CounryName"/>
      <!-- Исправить после изменений -->
   </xsl:template>
</xsl:stylesheet>
