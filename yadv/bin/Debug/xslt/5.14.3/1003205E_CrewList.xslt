<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru cl" version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cl="urn:customs.ru:Information:TransportDocuments:Sea:CrewList:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <title>Судовая роль</title>
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
			</style>
         </head>
         <body>
            <xsl:apply-templates/>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="cl:CrewList">
      <div class="page">
         <p align="right">ИМО ФАЛ</p>
         <p align="right">Форма 5</p>
         <h3>СУДОВАЯ РОЛЬ</h3>
         <table border="1" cellpadding="3" cellspacing="0" width="100%">
            <tbody>
               <tr>
                  <!--<td width="10" height="0" class="graph"></td>
							<td width="51" class="graph"></td>
							<td width="26.5" class="graph"></td>
							<td width="7.5" class="graph"></td>
							<td width="22" class="graph"></td>
							<td width="10.5" class="graph"></td>
							<td width="7.5" class="graph"></td>
							<td width="12.5" class="graph"></td>
							<td width="15" class="graph"></td>
							<td width="17.5" class="graph"></td>-->
               </tr>
               <tr>
                  <td class="graph" colspan="3" height="24" style="width:87.5mm;">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td align="center" class="graph" style="width:7.5mm;">
                     <xsl:if test="cl:ArrivalIndicator='1' or cl:ArrivalIndicator='t' or cl:ArrivalIndicator='true'">
                        <xsl:text>X</xsl:text>
                     </xsl:if>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td class="graph" colspan="2" style="width:32.5mm;">Приход</td>
                  <td align="center" class="graph" style="width:7.5mm;">
                     <xsl:if test="cl:ArrivalIndicator='0' or cl:ArrivalIndicator='f' or cl:ArrivalIndicator='false'">
                        <xsl:text>X</xsl:text>
                     </xsl:if>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td class="graph" colspan="2" style="width:37.5mm;">Отход</td>
                  <td class="graph" style="width:17.5mm;">Стр.№</td>
               </tr>
               <tr>
                  <td colspan="3" style="width:87.5mm;">
                     <span class="graph">1.Название судна</span>
                     <br/>
                     <xsl:value-of select="cl:Vessel/catTrans_ru:Name"/>
                  </td>
                  <td colspan="4" style="width:47.5mm;">
                     <span class="graph">2.Порт прихода/отхода</span>
                     <br/>
                     <xsl:choose>
                        <xsl:when test="cl:ArrivalIndicator='1' or cl:ArrivalIndicator='t' or cl:ArrivalIndicator='true'">
                           <xsl:value-of select="cl:Arrival/catTrans_ru:Name"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="cl:Sailing/catTrans_ru:Name"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </td>
                  <td colspan="3" style="width:45mm;">
                     <span class="graph">3.Дата прихода/отхода</span>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <br/>
                     <xsl:choose>
                        <xsl:when test="cl:ArrivalIndicator='1' or cl:ArrivalIndicator='t' or cl:ArrivalIndicator='true'">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="cl:Arrival/catTrans_ru:Date"/>
                           </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="cl:Sailing/catTrans_ru:Date"/>
                           </xsl:call-template>
                        </xsl:otherwise>
                     </xsl:choose>
                  </td>
               </tr>
               <tr>
                  <td colspan="3" style="width:87.5mm;">
                     <span class="graph">4.Национальная принадлежность судна</span>
                     <br/>
                     <xsl:value-of select="cl:Vessel/catTrans_ru:NationalityCode"/>
                  </td>
                  <td colspan="5" style="width:60mm;">
                     <span class="graph">5.Порт отправления</span>
                     <br/>
                     <xsl:value-of select="cl:DeparturePort"/>
                  </td>
                  <td class="graph" colspan="2" rowspan="2" style="width:32.5mm;">6.Вид и номер подтверждающего документа (паспорт моряка)</td>
               </tr>
               <tr>
                  <td class="graph" style="width:10mm;">7.№</td>
                  <td class="graph" style="width:51mm;">8.Фамилия, имя</td>
                  <td class="graph" style="width:26.5mm;">9.Должность</td>
                  <td class="graph" colspan="2" style="width:29.5mm;">10.Национальность</td>
                  <td class="graph" colspan="3" style="width:30.5mm;">11.Дата и место рождения</td>
               </tr>
               <xsl:for-each select="cl:CockpitPersonnel">
                  <tr>
                     <td style="width:10mm;">
                        <xsl:value-of select="cl:PersNumeric"/>
                     </td>
                     <td style="width:51mm;">
                        <xsl:value-of select="cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="cat_ru:PersonMiddleName"/>
                     </td>
                     <td style="width:26.5mm;">
                        <xsl:value-of select="cat_ru:PersonPost"/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" style="width:29.5mm;">
                        <xsl:value-of select="cl:Nationality"/>
                     </td>
                     <td colspan="3" style="width:30.5mm;">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="cl:DateofBirth"/>
                        </xsl:call-template>
                        <br/>
                        <xsl:value-of select="cl:BirthPlace"/>
                     </td>
                     <td colspan="2" style="width:32.5mm;">
                        <xsl:value-of select="cl:Document/RUScat_ru:IdentityCardName"/>
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="cl:Document/RUScat_ru:IdentityCardCode"/>
                        <xsl:text>) </xsl:text>
                        <xsl:value-of select="cl:Document/RUScat_ru:IdentityCardSeries"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="cl:Document/RUScat_ru:IdentityCardNumber"/>
                     </td>
                  </tr>
               </xsl:for-each>
            </tbody>
         </table>
         <p align="left" class="graph">12.Дата и подпись капитана, уполномоченного агента или лица командного состава</p>
         <xsl:for-each select="cl:DocumentSignature">
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td style="width:90mm;">
                        <xsl:value-of select="cat_ru:PersonPost"/>
                        <br/>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
                        </xsl:call-template>
                     </td>
                     <td style="width:90mm;">
                        <xsl:text>_____________</xsl:text>
                        <xsl:value-of select="cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="cat_ru:PersonMiddleName"/>
                        <br/>
                        <span class="graph">(Подпись,фамилия,инициалы)</span>
                     </td>
                  </tr>
               </tbody>
            </table>
         </xsl:for-each>
      </div>
      <div class="page">
         <p align="right">IMO FAL</p>
         <p align="right">Form 5</p>
         <h3>IMO CREW LIST</h3>
         <table border="1" cellpadding="3" cellspacing="0" width="100%">
            <tbody>
               <tr>
                  <!--td width="10" height="0" class="graph"></td>
							<td width="51" class="graph"></td>
							<td width="26.5" class="graph"></td>
							<td width="7.5" class="graph"></td>
							<td width="22" class="graph"></td>
							<td width="10.5" class="graph"></td>
							<td width="7.5" class="graph"></td>
							<td width="12.5" class="graph"></td>
							<td width="15" class="graph"></td>
							<td width="17.5" class="graph"></td-->
               </tr>
               <tr>
                  <td class="graph" colspan="3" height="24" style="width:87.5mm;">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td align="center" class="graph" style="width:7.5mm;">
                     <xsl:if test="cl:ArrivalIndicator='1' or cl:ArrivalIndicator='t' or cl:ArrivalIndicator='true'">
                        <xsl:text>X</xsl:text>
                     </xsl:if>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td class="graph" colspan="2" style="width:32.5mm;">Arrival</td>
                  <td align="center" class="graph" style="width:7.5mm;">
                     <xsl:if test="cl:ArrivalIndicator='0' or cl:ArrivalIndicator='f' or cl:ArrivalIndicator='false'">
                        <xsl:text>X</xsl:text>
                     </xsl:if>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td class="graph" colspan="2" style="width:37.5mm;">Departure</td>
                  <td class="graph" style="width:17.5mm;">Page №</td>
               </tr>
               <tr>
                  <td colspan="3" style="width:87.5mm;">
                     <span class="graph">1.Name of ship</span>
                     <br/>
                     <xsl:value-of select="cl:Vessel/catTrans_ru:Name"/>
                  </td>
                  <td colspan="4" style="width:47.5mm;">
                     <span class="graph">2.Port of arrival/departure</span>
                     <br/>
                     <xsl:choose>
                        <xsl:when test="cl:ArrivalIndicator='1' or cl:ArrivalIndicator='t' or cl:ArrivalIndicator='true'">
                           <xsl:value-of select="cl:Arrival/catTrans_ru:Name"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="cl:Sailing/catTrans_ru:Name"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </td>
                  <td colspan="3" style="width:45mm;">
                     <span class="graph">3.Date of arrival/departure</span>
                     <br/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:choose>
                        <xsl:when test="cl:ArrivalIndicator='1' or cl:ArrivalIndicator='t' or cl:ArrivalIndicator='true'">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="cl:Arrival/catTrans_ru:Date"/>
                           </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="cl:Sailing/catTrans_ru:Date"/>
                           </xsl:call-template>
                        </xsl:otherwise>
                     </xsl:choose>
                  </td>
               </tr>
               <tr>
                  <td colspan="3" style="width:87.5mm;">
                     <span class="graph">4.Nationality of ship</span>
                     <br/>
                     <xsl:value-of select="cl:Vessel/catTrans_ru:NationalityCode"/>
                  </td>
                  <td colspan="5" style="width:60mm;">
                     <span class="graph">5.Port arrived from</span>
                     <br/>
                     <xsl:value-of select="cl:DeparturePort"/>
                  </td>
                  <td class="graph" colspan="2" rowspan="2" style="width:32.5mm;">6.Nature and № or identity document (seeman’s passport)</td>
               </tr>
               <tr>
                  <td class="graph" style="width:10mm;">7.№</td>
                  <td class="graph" style="width:51mm;">8.Family name, given names</td>
                  <td class="graph" style="width:26.5mm;">9.Rank or rating</td>
                  <td class="graph" colspan="2" style="width:29.5mm;">10.Nationality</td>
                  <td class="graph" colspan="3" style="width:30.5mm;">11.Date and place of birth</td>
               </tr>
               <xsl:for-each select="cl:CockpitPersonnel">
                  <tr>
                     <td style="width:10mm;">
                        <xsl:value-of select="cl:PersNumeric"/>
                     </td>
                     <td style="width:51mm;">
                        <xsl:value-of select="cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="cat_ru:PersonMiddleName"/>
                     </td>
                     <td style="width:26.5mm;">
                        <xsl:value-of select="cat_ru:PersonPost"/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" style="width:29.5mm;">
                        <xsl:value-of select="cl:Nationality"/>
                     </td>
                     <td colspan="3" style="width:30.5mm;">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="cl:DateofBirth"/>
                        </xsl:call-template>
                        <br/>
                        <xsl:value-of select="cl:BirthPlace"/>
                     </td>
                     <td colspan="2" style="width:32.5mm;">
                        <xsl:value-of select="cl:Document/RUScat_ru:IdentityCardName"/>
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="cl:Document/RUScat_ru:IdentityCardCode"/>
                        <xsl:text>) </xsl:text>
                        <xsl:value-of select="cl:Document/RUScat_ru:IdentityCardSeries"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="cl:Document/RUScat_ru:IdentityCardNumber"/>
                     </td>
                  </tr>
               </xsl:for-each>
            </tbody>
         </table>
         <p align="left" class="graph">12.Date and signature by master, authorized agent or officer</p>
         <xsl:for-each select="cl:DocumentSignature">
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td style="width:90mm;">
                        <xsl:value-of select="cat_ru:PersonPost"/>
                        <br/>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
                        </xsl:call-template>
                     </td>
                     <td style="width:90mm;">
                        <xsl:text>_____________</xsl:text>
                        <xsl:value-of select="cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="cat_ru:PersonMiddleName"/>
                        <br/>
                        <span class="graph">(Signature,family name,initials)</span>
                     </td>
                  </tr>
               </tbody>
            </table>
         </xsl:for-each>
      </div>
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
</xsl:stylesheet>
