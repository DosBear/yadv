<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:adm="urn:customs.ru:Information:CustomsDocuments:AssignmentDecisionMaking:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template name="russian_time">
      <xsl:param name="timeIn"/>
      <xsl:choose>
         <xsl:when test="substring($timeIn,3,1)=':' and substring($timeIn,6,1)=':'">
            <xsl:value-of select="substring($timeIn,1,2)"/> ч <xsl:value-of select="substring($timeIn,4,2)"/> мин
			</xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$timeIn"/>
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
   <xsl:template match="adm:AssignmentDecisionMaking">
      <html>
         <head>
            <title>Направление для принятия решений</title>
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
                        <td align="center" colspan="10">
                           <span align="center" class="bold">Направление <br/> для принятия решений
										<br/>
                              <br/>
                           </span>
                        </td>
                     </tr>
                     <xsl:if test="adm:GTDID">
                        <tr>
                           <td class="graphMain" colspan="10" valign="middle">По ДТ №
								<span class="graph">
                                 <xsl:value-of select="adm:GTDID/cat_ru:CustomsCode"/>
                                 <xsl:text>/ </xsl:text>
                                 <xsl:call-template name="russian_date2">
                                    <xsl:with-param name="dateIn" select="adm:GTDID//cat_ru:RegistrationDate"/>
                                 </xsl:call-template>
                                 <xsl:text>/ </xsl:text>
                                 <xsl:value-of select="adm:GTDID/cat_ru:GTDNumber"/>
                              </span>
                              <br/>
                              <br/>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graphMain">
							Требуется принятие решения (решений) по профилю (профелям) риска, оставленным по следующим направления деятельности:<br/>
							1. По товарной номенклатуре
							</td>
                     </tr>
                     <xsl:for-each select="adm:RiskTNVED">
                        <tr>
                           <td class="graph" colspan="10" valign="middle">
                              <xsl:value-of select="adm:TerrActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:CustomsActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="adm:RiskProfileRegDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumber"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumberVersion"/>
                              <xsl:text> </xsl:text>
                              <br/>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td class="graphMain">2. По происхождению товаров </td>
                     </tr>
                     <xsl:for-each select="adm:RiskCountry">
                        <tr>
                           <td class="graph" colspan="10" valign="middle">
                              <xsl:value-of select="adm:TerrActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:CustomsActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="adm:RiskProfileRegDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumber"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumberVersion"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <br/>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td class="graphMain">3. По торговым ограничениям и экспортному контролю</td>
                     </tr>
                     <xsl:for-each select="adm:RiskRestrictionExpControl">
                        <tr>
                           <td class="graph" colspan="10" valign="middle">
                              <xsl:value-of select="adm:TerrActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:CustomsActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="adm:RiskProfileRegDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumber"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumberVersion"/>
                              <xsl:text> </xsl:text>
                              <br/>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td class="graphMain">4. По защите интеллектуальной собственности</td>
                     </tr>
                     <xsl:for-each select="adm:RiskIntellectualProperty">
                        <tr>
                           <td class="graph" colspan="10" valign="middle">
                              <xsl:value-of select="adm:TerrActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:CustomsActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="adm:RiskProfileRegDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumber"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumberVersion"/>
                              <xsl:text> </xsl:text>
                              <br/>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td class="graphMain">5. По валютному контролю </td>
                     </tr>
                     <xsl:for-each select="adm:RiskCurrency">
                        <tr>
                           <td class="graph" colspan="10" valign="middle">
                              <xsl:value-of select="adm:TerrActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:CustomsActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="adm:RiskProfileRegDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumber"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumberVersion"/>
                              <xsl:text> </xsl:text>
                              <br/>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td class="graphMain">6. По контролю таможенной стоимости</td>
                     </tr>
                     <xsl:for-each select="adm:RiskCustomsCost">
                        <tr>
                           <td class="graph" colspan="10" valign="middle">
                              <xsl:value-of select="adm:TerrActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:CustomsActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="adm:RiskProfileRegDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumber"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumberVersion"/>
                              <xsl:text> </xsl:text>
                              <br/>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td class="graphMain">7. По таможенным платежам</td>
                     </tr>
                     <xsl:for-each select="adm:RiskDuty">
                        <tr>
                           <td class="graph" colspan="10" valign="middle">
                              <xsl:value-of select="adm:TerrActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:CustomsActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="adm:RiskProfileRegDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumber"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumberVersion"/>
                              <xsl:text> </xsl:text>
                              <br/>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td class="graphMain">8. По организации таможенных процедур и таможенного контроля</td>
                     </tr>
                     <xsl:for-each select="adm:RiskCustomsContril">
                        <tr>
                           <td class="graph" colspan="10" valign="middle">
                              <xsl:value-of select="adm:TerrActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:CustomsActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="adm:RiskProfileRegDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumber"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumberVersion"/>
                              <xsl:text> </xsl:text>
                              <br/>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td class="graphMain">9. По контролю делящихся и радиактивных материалов</td>
                     </tr>
                     <!--xsl:for-each select="adm:RiskRestrictionExpControl"-->
                     <tr>
                        <td class="graph" colspan="10" valign="middle">
                           <xsl:for-each select="adm:RiskControlFissileRadioactiveMaterial">
                              <xsl:value-of select="adm:TerrActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:CustomsActionCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="adm:RiskProfileRegDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumber"/>
                              <xsl:text> </xsl:text>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="adm:RiskProfileNumberVersion"/>
                              <xsl:text> </xsl:text>
                              <br/>
                           </xsl:for-each>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <!--/xsl:for-each-->
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td class="graphMain" style="width:60mm">Должностное лицо таможенного поста (ОТОиТК таможни)</td>
                        <td style="width:45mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal" style="width:45mm">
                           <xsl:value-of select="adm:CustomsPerson/cat_ru:PersonName"/>
                        </td>
                        <td align="center" class="graphMain" style="width:45mm">ЛНП:
								<span class="graph">
                              <xsl:value-of select="adm:CustomsPerson/cat_ru:LNP"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle">
								инициалы,фамилия
								</td>
                        <td colspan="1">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="4">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:60mm">Начальник таможенного поста (ОТОиТК таможни)</td>
                        <td style="width:45mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal" style="width:45mm">
                           <xsl:value-of select="adm:CustomsChief/cat_ru:PersonName"/>
                        </td>
                        <td align="center" class="graphMain" style="width:45mm">ЛНП:
								<span class="graph">
                              <xsl:value-of select="adm:CustomsChief/cat_ru:LNP"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle">
								инициалы,фамилия
								</td>
                        <td colspan="1">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="4">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" class="graphMain" colspan="4">Оборотная сторона</td>
                     </tr>
                     <tr>
                        <td colspan="4">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain">
                           <xsl:call-template name="russian_time">
                              <xsl:with-param name="timeIn" select="adm:Time"/>
                           </xsl:call-template>
                        </td>
                        <td colspan="1">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td colspan="1">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="right" class="graphMain">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="adm:Date"/>
                           </xsl:call-template>
								г.
								</td>
                     </tr>
                     <tr>
                        <td colspan="4">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="4">Отметки уполномоченных должностных лиц о принятии решения (решений)</td>
                     </tr>
                     <xsl:for-each select="adm:Mark ">
                        <tr>
                           <td class="graphMain">
                              <xsl:value-of select="position()"/>
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="."/>
                              <br/>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td colspan="4">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain">Иные служебные отметки
									</td>
                     </tr>
                     <tr>
                        <td class="graphMain">
                           <xsl:value-of select="adm:OtherMark"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
