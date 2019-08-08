<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rwnv="urn:customs.ru:Information:PriorInformation:PI_NotifViolation:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template name="sub_time">
      <xsl:param name="timeLn"/>
      <xsl:choose>
         <xsl:when test="substring($timeLn,11, 1)='Z' ">
            <xsl:value-of select="substring($timeLn, 1, 8)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$timeLn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="rwnv:PI_NotifViolation">
      <html>
         <head>
            <title>Уведомление</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
						.page {
							width: 210mm;
							/*height: 297mm;*/
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding: 10mm;
							padding-left: 20mm;
							background: #ffffff;
							border: solid 1pt #000000;
						}
						
						.space {
							width: 30px;
						}
						
					.spec_column {
						border-bottom: 0px; 
						border-left:0px; 
						border-right:0px; 
						font-size: 10pt;
					}
					
					.violation {
						width:100%; 
						margin-top:-10px; 
						border: 1px #4F4F4F;
						border-collapse: collapse; 
					}
					
					.violation td {
						border: 1px solid #4F4F4F;
						padding-left: 3px;
						padding-right: 3px;
					}
					
					.header {
						font-weight: bold;
					}
					
                </style>
         </head>
         <body>
            <div class="page">
               <h2 align="center">Уведомление о нарушении вывоза товаров с таможенной территории Таможенного союза</h2>
               <div>
                  <xsl:choose>
                     <xsl:when test="rwnv:ViolationTime">
                        <table align="right" border="1" style="border:0">
                           <tbody>
                              <tr>
                                 <td align="center" style="border:0px">
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="rwnv:ViolationDate"/>
                                    </xsl:call-template> /	
												<xsl:call-template name="sub_time">
                                       <xsl:with-param name="timeLn" select="rwnv:ViolationTime"/>
                                    </xsl:call-template>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="center" class="spec_column">(Дата / время создания уведомления)</td>
                              </tr>
                           </tbody>
                        </table>
                     </xsl:when>
                     <xsl:otherwise>
                        <table align="right" border="1" style="border:0">
                           <tbody>
                              <tr>
                                 <td align="center" style="border:0px">
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="rwnv:ViolationDate"/>
                                    </xsl:call-template>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="center" class="spec_column">(Дата создания уведомления)</td>
                              </tr>
                           </tbody>
                        </table>
                     </xsl:otherwise>
                  </xsl:choose>
               </div>
               <div style="margin-top: 70px">
                  <p>Номер пакета электронных документов <xsl:value-of select="rwnv:URN"/>
                  </p>
                  <p class="header">Выявленные нарушения и несоответствия</p>
                  <table border="1" cellspacing="0" class="violation">
                     <tbody>
                        <tr>
                           <td rowspan="2" style="vertical-align:top; width: 20%">Описание</td>
                           <td rowspan="2" style="vertical-align:top">Статья ТК РФ, Номер нормативных актов и пунктов в них, нарушенных при заявлении сведений</td>
                           <td colspan="3" style="vertical-align:top">Документ, источник информации о выявленном нарушении</td>
                        </tr>
                        <tr>
                           <td>Наименование</td>
                           <td>Номер</td>
                           <td>Дата создания</td>
                        </tr>
                        <xsl:for-each select="rwnv:ViolationInfo">
                           <xsl:if test="position()>1">
                              <tr>
                                 <td colspan="5" height="25"/>
                              </tr>
                           </xsl:if>
                           <tr>
                              <td>
                                 <xsl:value-of select="rwnv:ViolationText"/>
                              </td>
                              <td>
                                 <xsl:value-of select="rwnv:LawArticle"/>
                              </td>
                              <!--td colspan="3">
												<table class="sub_violation" border="1" cellspacing="0" style="border: 0">
													<xsl:for-each select="rwnv:ViolationDoc">
														<tr>
															<td><xsl:value-of select="cat_ru:PrDocumentName"/></td>
															<td><xsl:value-of select="cat_ru:PrDocumentNumber"/></td>
															<td><xsl:value-of select="cat_ru:PrDocumentDate"/></td>
														</tr>
													</xsl:for-each>
												</table>
											</td-->
                              <td>
                                 <xsl:value-of select="rwnv:ViolationDoc/cat_ru:PrDocumentName"/>
                              </td>
                              <td>
                                 <xsl:value-of select="rwnv:ViolationDoc/cat_ru:PrDocumentNumber"/>
                              </td>
                              <td>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="rwnv:ViolationDoc/cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </td>
                           </tr>
                           <xsl:for-each select="rwnv:ViolationDoc">
                              <xsl:if test="position()>1">
                                 <tr>
                                    <td/>
                                    <td/>
                                    <td>
                                       <xsl:value-of select="cat_ru:PrDocumentName"/>
                                    </td>
                                    <td>
                                       <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                    </td>
                                    <td>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                    </td>
                                 </tr>
                              </xsl:if>
                           </xsl:for-each>
                        </xsl:for-each>
                     </tbody>
                  </table>
                  <p class="header">Таможенный орган</p>
                  <table style="margin-top:-20px">
                     <tbody>
                        <tr>
                           <td>Код таможенного органа</td>
                           <td>
                              <xsl:value-of select="rwnv:Customs/cat_ru:Code"/>
                           </td>
                        </tr>
                        <xsl:if test="rwnv:Customs/cat_ru:OfficeName">
                           <tr>
                              <td>Наименование</td>
                              <td>
                                 <xsl:value-of select="rwnv:Customs/cat_ru:OfficeName"/>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="rwnv:Customs/cat_ru:CustomsCountryCode">
                           <tr>
                              <td>Код государства</td>
                              <td>
                                 <xsl:value-of select="rwnv:Customs/cat_ru:CustomsCountryCode"/>
                              </td>
                           </tr>
                        </xsl:if>
                     </tbody>
                  </table>
                  <table border="1" class="person" style="border:0; margin-top:20px;">
                     <tbody>
                        <tr>
                           <td align="center" style="border:0px;">
                              <xsl:value-of select="rwnv:CustomsPerson/cat_ru:PersonName"/>
                           </td>
                           <td style="border:0px; width:130px"/>
                           <td align="center" style="border:0px">
                              <xsl:value-of select="rwnv:CustomsPerson/cat_ru:LNP"/>
                           </td>
                        </tr>
                        <tr>
                           <td class="spec_column">(ФИО должностного лица таможенного органа)</td>
                           <td style="border:0px;"/>
                           <td class="spec_column">(ЛНП должностного лица таможенного органа)</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
