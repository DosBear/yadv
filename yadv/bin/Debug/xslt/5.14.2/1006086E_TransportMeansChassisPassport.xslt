<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="tcp cat_ru catESAD_ru" version="1.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tcp="urn:customs.ru:Information:CustomsDocuments:TransportMeansChassisPassport:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 4.7.0.0 от 25.02.2009.   -->
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
   <xsl:template match="tcp:TransportMeansChassisPassport">
      <html>
         <head>
            <title>ПАСПОРТ ШАССИ ТРАНСПОРТНОГО СРЕДСТВА</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 3; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 12pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }
					td.bold { font-size: 10pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: /*bottom; white-space: nowrap;*/ }					
					td.value { font-size: 12.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
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
					div.page { width: 210mm; height: 297mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
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
               <h4>						 ПАСПОРТ ШАССИ ТРАНСПОРТНОГО СРЕДСТВА</h4>
               <br/>
               <p/>
               <span class="graph-bold">
                  <xsl:value-of select="tcp:PShTSSerialNumber/cat_ru:RegionCode"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="tcp:PShTSSerialNumber/cat_ru:Series"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="tcp:PShTSSerialNumber/cat_ru:PTSNumber"/>
               </span>
               <p/>
               <p align="left">
                  <span class="value">
						1. Идентификационный номер:  <span class="graph-bold">
                        <xsl:value-of select="tcp:PShTSData/cat_ru:VINID"/>
                     </span>
                     <br/>
						2. Марка, модель шасси:  <span class="graph-bold">
                        <xsl:value-of select="tcp:PShTSData/cat_ru:Model"/>
                     </span>
                     <xsl:text>      Код марки:  </xsl:text>
                     <span class="graph-bold">
                        <xsl:value-of select="tcp:PShTSData/cat_ru:MarkCode"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="tcp:PShTSData/cat_ru:Mark"/>
                     </span>
                     <br/>
						3. Год изготовления шасси:  <span class="graph-bold">
                        <xsl:value-of select="tcp:PShTSData/cat_ru:OfftakeYear"/>
                     </span>
                     <br/>
						4. Модель, N двигателя:  <span class="graph-bold">
                        <xsl:value-of select="tcp:PShTSData/tcp:EngineModel"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="tcp:PShTSData/cat_ru:EngineID"/>
                     </span>
                     <br/>
						5. Шасси (рама) N:  <span class="graph-bold">
                        <xsl:value-of select="tcp:PShTSData/cat_ru:ChassisID"/>
                     </span>
                     <br/>
						6. Кузов N:  <span class="graph-bold">
                        <xsl:value-of select="tcp:PShTSData/cat_ru:BodyID"/>
                     </span>
                     <br/>
						7. Кабина N:  <span class="graph-bold">
                        <xsl:value-of select="tcp:PShTSData/cat_ru:CabID"/>
                     </span>
                     <br/>
						8. Цвет кабины (кузова):  <span class="graph-bold">
                        <xsl:value-of select="tcp:PShTSData/tcp:ColorCode"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="tcp:PShTSData/tcp:ColorName"/>
                        <br/>
                        <xsl:for-each select="tcp:PShTSData/tcp:ChassisColorList">
                           <xsl:value-of select="tcp:ColorCode"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="tcp:ColorName"/>
                           <br/>
                        </xsl:for-each>
                     </span>
						
						9. Мощность двигателя, л.с. (кВт):  <span class="graph-bold">
                        <xsl:value-of select="tcp:PShTSData/tcp:EnginePowerHpQuanity"/> (<xsl:value-of select="tcp:PShTSData/tcp:EnginePowerKvtQuanity"/>)</span>
                     <br/>
						10. Рабочий объем двигателя, куб. см:  <span class="graph-bold">
                        <xsl:value-of select="tcp:PShTSData/cat_ru:EngineVolumeQuanity"/>
                     </span>
                     <br/>
						11. Тип двигателя:  <span class="graph-bold">
                        <xsl:value-of select="tcp:PShTSData/tcp:EngineModeCode"/>
                     </span>
                     <br/>
						12. Экологический класс:  <span class="graph-bold">
                        <xsl:value-of select="tcp:PShTSData/tcp:Ekoclass"/>
                     </span>
                     <br/>
						13. Организация - изготовитель шасси (страна):  <span class="graph-bold">
                        <xsl:value-of select="tcp:Manufacturer/catESAD_ru:TransportManufacturerName"/>
                        <xsl:text> </xsl:text>
                        <xsl:if test="tcp:Manufacturer/catESAD_ru:ManufacturerCountryCode">
                           <xsl:text>(</xsl:text>
                           <xsl:value-of select="tcp:Manufacturer/catESAD_ru:ManufacturerCountryCode"/>
                           <xsl:text>)</xsl:text>
                        </xsl:if>
                     </span>
                     <br/>
						14. Заключение N:  <span class="graph-bold">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="tcp:PShTSData/tcp:ConformanceCertificate/catESAD_ru:DocumentID"/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:if test="tcp:PShTSData/tcp:ConformanceCertificate/catESAD_ru:IssueDate">
						 от <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="tcp:PShTSData/tcp:ConformanceCertificate/catESAD_ru:IssueDate"/>
                           </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="tcp:PShTSData/tcp:ConformanceCertificate/catESAD_ru:OrganizationName">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text> выдано <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="tcp:PShTSData/tcp:ConformanceCertificate/catESAD_ru:OrganizationName"/>
                        </xsl:if>
                     </span>
                     <br/>
						15. Страна вывоза шасси (код):  <span class="graph-bold">
                        <xsl:choose>
                           <xsl:when test="tcp:CountryCode">
                              <xsl:value-of select="tcp:CountryCode"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text>Отсутствует</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </span>
						16. Серия, N ТД, ТПО:  
							<xsl:choose>
                        <xsl:when test="tcp:ImportCertification">
                           <span class="graph-bold">
                              <xsl:value-of select="tcp:ImportCertification/cat_ru:PrDocumentName"/>
                              <xsl:text> </xsl:text>
                           </span>
                           <xsl:if test="tcp:ImportCertification/tcp:Series">
                              <xsl:text>Серия  </xsl:text>
                              <span class="graph-bold">
                                 <xsl:value-of select="tcp:ImportCertification/tcp:Series"/>
                                 <xsl:text> </xsl:text>
                              </span>
                           </xsl:if>
                           <xsl:if test="tcp:ImportCertification/cat_ru:PrDocumentNumber">
                              <xsl:text>N   </xsl:text>
                              <span class="graph-bold">
                                 <xsl:value-of select="tcp:ImportCertification/cat_ru:PrDocumentNumber"/>
                                 <xsl:text> </xsl:text>
                              </span>
                           </xsl:if>
                           <xsl:if test="tcp:ImportCertification/cat_ru:PrDocumentDate">
                              <xsl:text> от  </xsl:text>
                              <span class="graph-bold">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="tcp:ImportCertification/cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </span>
                           </xsl:if>
                           <br/>
                        </xsl:when>
                        <xsl:when test="tcp:CustomsProfitOrder">
                           <span class="graph-bold">
                              <xsl:value-of select="tcp:CustomsProfitOrder/tcp:CustomsCode"/>
                              <xsl:text>/</xsl:text>
                              <xsl:call-template name="russian_date2">
                                 <xsl:with-param name="dateIn" select="tcp:CustomsProfitOrder/tcp:RegistrationDate"/>
                              </xsl:call-template>
                              <xsl:text>/</xsl:text>
                              <xsl:value-of select="tcp:CustomsProfitOrder/tcp:Series"/>
                              <xsl:text>-</xsl:text>
                              <xsl:value-of select="tcp:CustomsProfitOrder/tcp:Number"/>
                           </span>
                        </xsl:when>
                        <xsl:when test="tcp:GTDID">
                           <span class="graph-bold">
                              <xsl:value-of select="tcp:GTDID/cat_ru:CustomsCode"/>
                              <xsl:text>/</xsl:text>
                              <xsl:call-template name="russian_date2">
                                 <xsl:with-param name="dateIn" select="tcp:GTDID/cat_ru:RegistrationDate"/>
                              </xsl:call-template>
                              <xsl:text>/</xsl:text>
                              <xsl:value-of select="tcp:GTDID/cat_ru:GTDNumber"/>
                           </span>
                        </xsl:when>
                     </xsl:choose>
                     <br/>
						17. Таможенные ограничения: <span class="graph-bold">
                        <xsl:value-of select="tcp:CustomsRestriction"/>
                     </span>
                     <br/>
						18. Наименование (ф.и.о.) собственника шасси 
						<xsl:if test="tcp:TransportMeansChassisOwner/catESAD_ru:OwnerModeCode = 'Ф'">
                        <span class="graph-bold">
                           <xsl:value-of select="tcp:TransportMeansChassisOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:FirstName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="tcp:TransportMeansChassisOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Patronymicname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="tcp:TransportMeansChassisOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Lastname"/>
                        </span>
                     </xsl:if>
                     <xsl:if test="tcp:TransportMeansChassisOwner/catESAD_ru:OwnerModeCode = 'Ю'">
                        <span class="graph-bold">
                           <xsl:value-of select="tcp:TransportMeansChassisOwner/catESAD_ru:TransportOwnerOrganization/cat_ru:OrganizationName"/>
                        </span>
                     </xsl:if>
                     <br/>
						19. Адрес 
						
						<xsl:if test="tcp:TransportMeansChassisOwner/catESAD_ru:OwnerModeCode = 'Ф'">
                        <span class="graph-bold">
                           <xsl:apply-templates select="tcp:TransportMeansChassisOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Address"/>
                        </span>
                     </xsl:if>
                     <xsl:if test="tcp:TransportMeansChassisOwner/catESAD_ru:OwnerModeCode = 'Ю'">
                        <span class="graph-bold">
                           <xsl:apply-templates select="tcp:TransportMeansChassisOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address"/>
                        </span>
                     </xsl:if>
                     <br/>
						20. Наименование организации, выдавшей паспорт:  <span class="graph-bold">
                        <xsl:value-of select="tcp:OrganizationName"/>
                     </span>
                     <br/>
						21. Адрес:  <span class="graph-bold">
                        <xsl:apply-templates select="tcp:OrganizationLegalAddress"/>
                     </span>
                     <br/>
						22. Дата выдачи паспорта:  <span class="graph-bold">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="tcp:IssueDate"/>
                        </xsl:call-template>
                     </span>
                     <br/>
                     <br/>
                     <br/>
                     <br/>

						М.П. <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>                             Подпись:  <span class="graph-bold">
                        <xsl:value-of select="tcp:PersonSign/cat_ru:PersonPost"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="tcp:PersonSign/cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="tcp:PersonSign/cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="tcp:PersonSign/cat_ru:PersonMiddleName"/>
                     </span>
                  </span>
               </p>
               <br/>
               <br/>
               <br/>
               <br/>
               <p align="left">
							Особые отметки <br/>
                  <span class="graph-bold">
                     <xsl:value-of select="tcp:SpecialMark"/>
                  </span>
                  <br/>
                  <br/>
                  <br/>
                  <xsl:for-each select="tcp:ChassicBargain">
									Наименование (ф.и.о.) собственника шасси 
						<xsl:if test="tcp:NewChassisOwner/catESAD_ru:OwnerModeCode = 'Ф'">
                        <span class="graph-bold">
                           <xsl:value-of select="tcp:NewChassisOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:FirstName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="tcp:NewChassisOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Patronymicname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="tcp:NewChassisOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Lastname"/>
                        </span>
                     </xsl:if>
                     <xsl:if test="tcp:NewChassisOwner/catESAD_ru:OwnerModeCode = 'Ю'">
                        <span class="graph-bold">
                           <xsl:value-of select="tcp:NewChassisOwner/catESAD_ru:TransportOwnerOrganization/cat_ru:OrganizationName"/>
                        </span>
                     </xsl:if>
                     <br/>
						Адрес 						
						<xsl:if test="tcp:NewChassisOwner/catESAD_ru:OwnerModeCode = 'Ф'">
                        <span class="graph-bold">
                           <xsl:apply-templates select="tcp:NewChassisOwner/catESAD_ru:TransportOwnerPerson/catESAD_ru:Address"/>
                        </span>
                     </xsl:if>
                     <xsl:if test="tcp:NewChassisOwner/catESAD_ru:OwnerModeCode = 'Ю'">
                        <span class="graph-bold">
                           <xsl:apply-templates select="tcp:NewChassisOwner/catESAD_ru:TransportOwnerOrganization/catESAD_ru:Address"/>
                        </span>
                     </xsl:if>
                     <br/>
						Дата продажи (передачи):   <span class="graph-bold">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="tcp:SellingDate"/>
                        </xsl:call-template>
                     </span>
                     <br/>
						Документ на право собственности:  <span class="graph-bold">
                        <xsl:value-of select="tcp:DocPropertyRights/cat_ru:PrDocumentName"/>
                        <xsl:text> </xsl:text>
                     </span>
                     <xsl:if test="tcp:DocPropertyRights/cat_ru:PrDocumentNumber">
                        <xsl:text>N   </xsl:text>
                        <span class="graph-bold">
                           <xsl:value-of select="tcp:DocPropertyRights/cat_ru:PrDocumentNumber"/>
                        </span>
                        <xsl:text> </xsl:text>
                     </xsl:if>
                     <xsl:if test="tcp:DocPropertyRights/cat_ru:PrDocumentDate">
                        <xsl:text> от  </xsl:text>
                        <span class="graph-bold">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="tcp:DocPropertyRights/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                        </span>
                     </xsl:if>
                     <br/>
                     <br/>
                     <table>
                        <tbody>
                           <tr>
                              <td>Подпись прежнего</td>
                              <td>Подпись настоящего</td>
                           </tr>
                           <tr>
                              <td>собственника</td>
                              <td>собственника</td>
                           </tr>
                           <tr>
                              <td>
                                 <span class="graph-bold">
                                    <xsl:value-of select="tcp:PrevOwnerSign/cat_ru:PersonSurname"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="tcp:PrevOwnerSign/cat_ru:PersonName"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="tcp:PrevOwnerSign/cat_ru:PersonMiddleName"/>
                                    <xsl:text> </xsl:text>
                                 </span>
                              </td>
                              <td>
                                 <span class="graph-bold">
                                    <xsl:value-of select="tcp:NewOwnerSign/cat_ru:PersonSurname"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="tcp:NewOwnerSign/cat_ru:PersonName"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="tcp:NewOwnerSign/cat_ru:PersonMiddleName"/>
                                    <xsl:text> </xsl:text>
                                 </span>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                     <br/>
                     <br/>
                     <!--
									Подпись прежнего<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>Подпись настоящего<br/>
									собственника ______<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>собственника __________<br/>
						<br/>
						<br/>
						<br/>

									М.П.<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>М.П.
-->
                  </xsl:for-each>
               </p>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="catESAD_ru:Address | tcp:OrganizationLegalAddress">
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
