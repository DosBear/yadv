<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cdi  cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cdi="urn:customs.ru:Information:RegistrationDocuments:CertificatDImmatriculation:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="cdi:CertificatDImmatriculation">
      <html>
         <head>
            <title>СВИДЕТЕЛЬСТВО  О РЕГИСТРАЦИИ ТРАНСПОРТНОГО СРЕДСТВА</title>
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
					span.value { font-size: 12.0pt; font-family: Courier New; color: windowtext; }
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
					СВИДЕТЕЛЬСТВО О РЕГИСТРАЦИИ ТРАНСПОРТНОГО СРЕДСТВА
					<p>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </p>
               <table height="352" width="678">
                  <tr>
                     <td class="border-left-top" height="35" width="331">
                        <span class="bold">Российская Федерация</span>
                     </td>
                     <td class="border-right-top" height="35" width="331">
                        <span class="bold">***** RUS *****</span>
                        <br/>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left" height="35" width="331">
							Свидетельство о регистрации ТС<br/>
							certificat d immatriculation
						</td>
                     <td class="border-right" height="35" width="331">
							Владелец <span class="value">
                           <xsl:value-of select="cdi:CDIAutomobileowner/cdi:Name"/>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left" height="26" width="331">
							Регистрационный N <span class="value">
                           <xsl:value-of select="cdi:CDITransportMeans/cdi:TransportStateSignID"/>
                        </span>
                     </td>
                     <td class="border-right" height="26" width="331">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left" height="14" width="331">
							Идентификационный номер (VIN) <span class="value">
                           <xsl:if test="cdi:CDITransportMeans/cat_ru:VINID">
                              <xsl:value-of select="cdi:CDITransportMeans/cat_ru:VINID"/>
                           </xsl:if>
                        </span>
                     </td>
                     <td class="border-right" height="14" width="331"/>
                  </tr>
                  <tr>
                     <td class="border-left" height="16" width="331">
							Марка, модель <span class="value">
                           <xsl:value-of select="cdi:CDITransportMeans/cat_ru:Mark"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="cdi:CDITransportMeans/cat_ru:Model"/>
                        </span>
                     </td>
                     <td class="border-right" height="16" width="331"/>
                  </tr>
                  <tr>
                     <td class="border-left" height="16" width="331">
							Тип ТС <span class="value">
                           <xsl:value-of select="cdi:CDITransportMeans/cdi:Kind"/>
                        </span>
                     </td>
                     <td class="border-right" height="16" width="331"/>
                  </tr>
                  <tr>
                     <td class="border-left" height="21" width="331">
							Категория ТС (АВСДЕ) <span class="value">
                           <xsl:value-of select="cdi:CDITransportMeans/cdi:TransportCategoryCode"/>
                        </span>
                     </td>
                     <td class="border-right" height="21" width="331">
							Республика, край, область, район <span class="value">
                           <xsl:value-of select="cdi:CDIAutomobileowner/cdi:PostalAdress/cat_ru:Region"/>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left" height="17" width="331">
							Год выпуска ТС <span class="value">
                           <xsl:value-of select="cdi:CDITransportMeans/cat_ru:OfftakeYear"/>
                        </span>
                     </td>
                     <td class="border-right" height="17" width="331">
                        <xsl:text> </xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left" height="17" width="331">
							Двигатель N <span class="value">
                           <xsl:value-of select="cdi:CDITransportMeans/cat_ru:EngineID"/>
                           <xsl:if test="cdi:CDITransportMeans/cdi:EngineModel">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="cdi:CDITransportMeans/cdi:EngineModel"/>
                           </xsl:if>
                        </span>
                     </td>
                     <td class="border-right" height="17" width="331">
                        <xsl:text> </xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left" height="17" width="331">
							Шасси (рама) N <span class="value">
                           <xsl:value-of select="cdi:CDITransportMeans/cat_ru:ChassisID"/>
                        </span>
                     </td>
                     <td class="border-right" height="17" width="331">
							Нас. пункт <span class="value">
                           <xsl:value-of select="cdi:CDIAutomobileowner/cdi:PostalAdress/cat_ru:City"/>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left" height="13" width="331">
							Кузов (коляска) N <span class="value">
                           <xsl:value-of select="cdi:CDITransportMeans/cat_ru:BodyID"/>
                        </span>
                     </td>
                     <td class="border-right" height="13" width="331">
							Улица, дом <span class="value">
                           <xsl:value-of select="cdi:CDIAutomobileowner/cdi:PostalAdress/cat_ru:StreetHouse"/>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left" height="18" width="331">
							Цвет <span class="value">
                           <xsl:value-of select="cdi:CDITransportMeans/cdi:TransportMeansColorCode"/>
                        </span>
                     </td>
                     <td class="border-right" height="18" width="331">
                        <xsl:text> </xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left" height="14" width="331">
							Мощность двигателя, кВт/л.с. <span class="value">
                           <xsl:value-of select="cdi:CDITransportMeans/cdi:EnginePowerKvtQuanity"/>/<xsl:value-of select="cdi:CDITransportMeans/cdi:EnginePowerHpQuanity"/>
                        </span>
                     </td>
                     <td class="border-right" height="14" width="331">
							Особые отметки						
						</td>
                  </tr>
                  <tr>
                     <td class="border-left" height="16" width="331">
							Разрешенная мах масса, kg	<span class="value">
                           <xsl:value-of select="cdi:CDITransportMeans/cdi:MaxWeightQuantity"/>
                        </span>
                     </td>
                     <td class="border-right" height="32" rowspan="1" width="331">
                        <xsl:for-each select="cdi:Comment">
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left" height="16" width="331">
							Масса без нагрузки, kg <span class="value">
                           <xsl:value-of select="cdi:CDITransportMeans/cdi:MinWeightQuantity"/>
                        </span>
                     </td>
                     <td class="border-right" height="16" width="331">
							ID аварийного устройства <span class="value">
                           <xsl:value-of select="cdi:CDITransportMeans/cat_ru:EmergencyDeviceID"/>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left" height="16" width="331">
                        <xsl:if test="cdi:PTSNumber">
							Регистрационный номер Паспорта ТС<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <span class="value">
                              <xsl:value-of select="cdi:PTSNumber"/>
                           </span>
                        </xsl:if>
                     </td>
                     <td class="border-right" height="16" width="331"></td>
                  </tr>
                  <tr>
                     <td class="border-left-bottom" height="21" width="331">
                        <br/>
                        <span class="value">
						   <xsl:value-of select="cdi:Registration/cdi:RegionCode"/>
						   <xsl:text> </xsl:text>
                           <xsl:value-of select="cdi:Registration/cdi:SeriesCode"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;№&amp;nbsp;</xsl:text>
                           <xsl:value-of select="cdi:Registration/cdi:DocumentNumber"/>
                        </span>
                     </td>
                     <td class="border-right-bottom" height="21" width="331">
						<xsl:text>Выдано ГИБДД </xsl:text>
                        <span class="value">
                              <xsl:value-of select="cdi:Registration/cdi:GAIName"/>
                        </span><br/>
                        <span class="value">М.П.                       Подпись<br/>
							<xsl:apply-templates mode="russian_date" select="cdi:Registration/cdi:IssueDate"/>
						</span>
                     </td>
                  </tr>
               </table>
            </div>
            <div class="page">
               <table height="340" width="677">
                  <tr>
                     <td class="border-left-right-top" height="264" width="677">
                        <span class="value">ТС снято с учета вследствие<br/>
                           <u>
                              <xsl:value-of select="cdi:UnRegistration/cdi:Cause"/>
                           </u>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left-right" height="60" width="677">
                        <span class="value">Наименование ГАИ<br/>
                           <u>
                              <xsl:value-of select="cdi:UnRegistration/cdi:GAIName"/>
                           </u>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="border-left-right-bottom" height="60" width="677">
                        <span class="value">М.П.<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>подпись<br/>
							<xsl:apply-templates mode="russian_date" select="cdi:UnRegistration/cdi:Date"/>
						</span>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template mode="russian_date" match="*">
		<xsl:param name="dateIn" select="."/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of
					select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
