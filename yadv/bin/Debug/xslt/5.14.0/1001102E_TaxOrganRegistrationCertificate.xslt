<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="torc clt_ru cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:torc="urn:customs.ru:Information:RegistrationDocuments:TaxOrganRegistrationCertificate:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 1.4 от 18.12.2008. - для альбома 4.7.0  -->
   <!-- Для  xmlns=urn:customs.ru:Information:RegistrationDocuments:TaxOrganRegistrationCertificate:4.7.0  -->
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
   <xsl:template match="torc:TaxOrganRegistrationCertificate">
      <html>
         <head>
            <title>Свидетельство о постановке на учет в налоговом органе юридического лица</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 210mm;
						height: 297mm;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding:	10mm;
						padding-left:	20mm;
						background: #ffffff;
						border: solid 1pt #000000;
						}
						
					.bordered {
						border: solid 1pt #000000;
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						
					.underlined {
						border-bottom: solid 0.8pt #000000;
						}
						
					p.NumberDate {
						font-weight: bold;
						}
						
					.graph {
						font-family: Arial;
						font-size: 8pt;
						}
					td {
						font-family:Courier;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
				</style>
         </head>
         <body>
            <div class="page">
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:140mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:40mm;">
                           <xsl:text>Экз. единственный</xsl:text>
                        </td>
                     </tr>
                     <!--tr>
								<td colspan="2" style="width:180mm;" class="graphMain" align="center">
									<xsl:text>Министерство Российской Федерации по налогам и сборам</xsl:text>
								</td>
							</tr-->
                     <tr>
                        <td align="center" class="graph" colspan="2" style="width:180mm;">
                           <h3>Федеральная налоговая служба</h3>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="2" style="width:180mm;">
                           <h1>СВИДЕТЕЛЬСТВО</h1>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphMain" colspan="2" style="width:180mm;">
                           <xsl:text>о постановке на учет российской организации в налоговом</xsl:text>
                           <br/>
                           <xsl:text>органе по месту нахождения на территории </xsl:text>
                           <br/>
                           <xsl:text>Российской Федерации</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="2" style="width:180mm;">
                           <xsl:text>Настоящее cвидетельство подтверждает, что российская организация</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:35mm;">
                           <!--<xsl:text>юридическому лицу</xsl:text>-->
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:145mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:value-of select="torc:Company/cat_ru:OrganizationName"/>
                        </td>
                     </tr>
                     <xsl:if test="torc:Company/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
						<tr>
							<td class="graph" style="width:35mm;">ОГРН</td>
							<td align="center" class="graph" colspan="2" style="width:145mm;border-bottom:solid 0.8pt #000000;">
								<xsl:value-of select="torc:Company/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
							</td>
						</tr>
					</xsl:if>
                     <tr>
                        <td class="graph" style="width:35mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:145mm;">
                           <xsl:text>(полное наименование в соответствии с учредительными документами)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:35mm;">
                           <xsl:text>местонахождение</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:145mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:if test="torc:Company/cat_ru:Address/cat_ru:CountryCode">
                              <xsl:value-of select="torc:Company/cat_ru:Address/cat_ru:CountryCode"/>, 
									</xsl:if>
                           <xsl:if test="torc:Company/cat_ru:Address/cat_ru:CounryName">
                              <xsl:value-of select="torc:Company/cat_ru:Address/cat_ru:CounryName"/>, 
									</xsl:if>
                           <xsl:if test="torc:Company/cat_ru:Address/cat_ru:PostalCode">
                              <xsl:value-of select="torc:Company/cat_ru:Address/cat_ru:PostalCode"/>, 
									</xsl:if>
                           <xsl:if test="torc:Company/cat_ru:Address/cat_ru:Region">
                              <xsl:value-of select="torc:Company/cat_ru:Address/cat_ru:Region"/>, 
									</xsl:if>
                           <xsl:if test="torc:Company/cat_ru:Address/cat_ru:City">
                              <xsl:value-of select="torc:Company/cat_ru:Address/cat_ru:City"/>, 
									</xsl:if>
                           <xsl:if test="torc:Company/cat_ru:Address/cat_ru:StreetHouse">
                              <xsl:value-of select="torc:Company/cat_ru:Address/cat_ru:StreetHouse"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:35mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:145mm;">
                           <xsl:text>(адрес места нахождения в соответствии с учредительными документами)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:35mm;">
                           <xsl:text>сведения о регистрации:</xsl:text>
                        </td>
                        <td class="graph" colspan="2" style="width:145mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:35mm;">
                           <xsl:text>вид документа</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:145mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:if test="torc:RegistrationDocument/torc:DocumentName">
                              <xsl:value-of select="torc:RegistrationDocument/torc:DocumentName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:35mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:145mm;">
                           <xsl:text>(наименование)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:35mm;">
                           <xsl:text>реквизиты документа</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:145mm;border-bottom:solid 0.8pt #000000;">
                           <!--<xsl:value-of select="torc:RegistrationDocument/torc:DocumentID"/>-->
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="torc:RegistrationDocument/torc:IssueDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <!--tr>
								<td style="width:35mm;" class="graph">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td colspan="2" style="width:145mm;" class="graphLittle" align="center">
									<xsl:text>(серия, номер, дата выдачи /утверждения/ )</xsl:text>
								</td>
							</tr-->
                     <tr>
                        <td class="graph" style="width:35mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" class="graphLittle" style="width:95mm;">
                           <xsl:text>(серия, номер, дата выдачи /утверждения/ )     </xsl:text>
                        </td>
                        <td class="graph" style="width:50mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="width:180mm;">
                           <xsl:text>наименование органа, выдавшего /утвердившего/ документ</xsl:text>
                        </td>
                     </tr>
                     <!--<tr>
								<td colspan="3" style="width:180mm;border-bottom:solid 0.8pt #000000;" class="graph" align="center">
									<xsl:value-of select="torc:RegistrationDocument/torc:OrganizationName"/>
								</td>
							</tr>-->
                     <tr>
                        <td class="graph" colspan="2" style="width:130mm;">
                           <xsl:text>и подтверждает постановку юридического лица на учет</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:50mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="torc:RegistrationDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:130mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graphLittle" style="width:50mm;">
                           <xsl:text>(число, месяц, год постановки на учет)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:130mm;">
                           <xsl:text>по месту нахождения в</xsl:text>
                        </td>
                        <td class="graph" style="width:50mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:130mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:value-of select="torc:TaxOrganName"/>
                        </td>
                        <td align="left" class="graph" style="width:50mm;">
                           <xsl:value-of select="torc:TaxOrganID"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" colspan="2" style="width:130mm;">
                           <xsl:text>(наименование налогового органа и его код)</xsl:text>
                        </td>
                        <td class="graph" style="width:50mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:130mm;">
                           <xsl:text>и присвоение ему</xsl:text>
                        </td>
                        <td class="graph" style="width:50mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:35mm;border-right:solid 0.8pt #000000;">
                           <xsl:text>Идентификационного</xsl:text>
                        </td>
                        <td class="graph" style="width:95mm;">
                           <xsl:text>ИНН юридического лица</xsl:text>
                        </td>
                        <td class="graph" style="width:50mm;">
                           <xsl:value-of select="torc:Company/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:35mm;border-right:solid 0.8pt #000000;">
                           <xsl:text>Номера</xsl:text>
                        </td>
                        <td class="graph" style="width:95mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph" style="width:50mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:35mm;border-right:solid 0.8pt #000000;">
                           <xsl:text>Налогоплательщика:</xsl:text>
                        </td>
                        <td class="graph" style="width:95mm;">
                           <xsl:text>с кодом причины постановки на учет</xsl:text>
                        </td>
                        <td class="graph" style="width:50mm;">
                           <xsl:value-of select="torc:Company/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" class="graph" style="width:60mm;">
                           <xsl:text>Дата выдачи Свидетельства</xsl:text>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:40mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:if test="torc:CertificateDate">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="torc:CertificateDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </td>
                        <td class="graph" style="width:80mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:60mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:40mm;">
                           <xsl:text>(число, месяц, год)</xsl:text>
                        </td>
                        <td class="graph" style="width:80mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="width:180mm;">
                           <xsl:text>Свидетельство применяется во всех предусмотренных законодательством случаях и подлежит замене в случае изменения приведенных в нем сведений, а также в случае порчи, утери.</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="width:180mm;">
                           <xsl:text>Руководитель налогового органа</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:35mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" class="graph" colspan="2" style="width:145mm;border-bottom:solid 0.8pt #000000;">
                           <xsl:if test="torc:TaxOrganClerkSignature/cat_ru:PersonPost">
                              <xsl:value-of select="torc:TaxOrganClerkSignature/cat_ru:PersonPost"/> </xsl:if>
                           <xsl:value-of select="torc:TaxOrganClerkSignature/cat_ru:PersonSurname"/> <xsl:choose>
                              <xsl:when test="torc:TaxOrganClerkSignature/cat_ru:PersonMiddleName">
                                 <xsl:value-of select="substring(torc:TaxOrganClerkSignature/cat_ru:PersonName,1,1)"/>. <xsl:value-of select="substring(torc:TaxOrganClerkSignature/cat_ru:PersonMiddleName,1,1)"/>.</xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="torc:TaxOrganClerkSignature/cat_ru:PersonName"/>
                              </xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:130mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graphLittle" style="width:50mm;">
                           <xsl:text>(подпись, фамилия, имя, отчество)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="3" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:130mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graphMain" style="width:50mm;">
                           <xsl:text>серия, №: </xsl:text>
                           <xsl:value-of select="torc:CertificateID"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
