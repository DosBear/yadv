<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cuop cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cuop="urn:customs.ru:Information:CustomsDocuments:CustOpinion:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template match="cuop:CustOpinion">
      <html>
         <head>
            <title>Заключение таможенного эксперта</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
               <h3>Федеральная таможенная служба</h3>
               <h4>Центральное экспертно-криминалистическое таможенное управление</h4>
               <h4>ЗАКЛЮЧЕНИЕ ТАМОЖЕННОГО ЭКСПЕРТА № <xsl:value-of select="cuop:RegNumber"/>
               </h4>
               <h5>г. <xsl:value-of select="cuop:CityName"/>
               </h5>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain" colspan="2"> Начато									
									<xsl:value-of select="cuop:DateTimeStart"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2"> Окончено									
									<xsl:value-of select="cuop:DateTimeEnd"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text>Основание для проведения таможенной экспертизы: </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text>Я, таможенный эксперт Центрального экспертно-криминалистического таможенного управления </xsl:text>
                           <xsl:value-of select="cuop:FIOExpert"/>
                           <xsl:text> (Экспертное свидетельство № </xsl:text>
                           <xsl:value-of select="cuop:ExpertCertificate/cat_ru:PrDocumentNumber"/>
                           <xsl:text> от </xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="cuop:ExpertCertificate/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                           <xsl:text> года, квалификация </xsl:text>
                           <xsl:value-of select="cuop:Qualification"/>
                           <xsl:text> экспертный стаж </xsl:text>
                           <xsl:value-of select="cuop:ExpertExperience"/>
                           <xsl:text> лет) в связи с поручением произвести таможенную экспертизу (вх. № </xsl:text>
                           <xsl:value-of select="cuop:Commission/cat_ru:PrDocumentNumber"/>
                           <xsl:text> ЦЭКТУ от </xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="cuop:Commission/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                           <xsl:text> г.), назначенную при осуществлении таможенного контроля, руководителем экспертного учреждения предупрежден об ответственности по ст. 19.26 КоАП РФ за дачу заведомо ложного заключения. </xsl:text>
                           <br/>
                           <xsl:text> Права и обязанности таможенного эксперта, предусмотренные статьей 394 ТК ЕАЭС, мне разъяснены. </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:190mm">
                           <table border="0" cellpadding="0" cellspacing="0" style="width:190mm">
                              <tbody>
                                 <xsl:for-each select="cuop:ExpertSignature">
                                    <tr>
                                       <td align="left" class="graphMain" style="width:50mm">
                                          <xsl:text> Таможенный эксперт </xsl:text>
                                       </td>
                                       <td align="right" class="graphMain" style="width:140mm">
                                          <xsl:value-of select="cat_ru:PersonSurname"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="cat_ru:PersonName"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="cat_ru:PersonMiddleName"/>
                                          <xsl:text> (И.О.Фамилия) </xsl:text>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="left" class="graphMain" style="width:50mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="right" class="graphMain" style="width:140mm">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
                                          </xsl:call-template>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text>На разрешение таможенного эксперта поставлены следующие вопросы: </xsl:text>
                           <xsl:for-each select="cuop:Questions">
                              <br/>
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                           <br/>
                           <xsl:text>На таможенную экспертизу в соответствии с решением о назначении таможенной экспертизы (постановлением таможенного органа) представлены: </xsl:text>
                           <xsl:for-each select="cuop:Presentation">
                              <br/>
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="2">
                           <xsl:text>Исследовательская часть </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="2">
                           <xsl:text>1. Внешний осмотр и оценка исходных данных </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2">
                           <xsl:for-each select="cuop:InspectionAccount">
                              <br/>
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="2">
                           <xsl:text>2. Исследование </xsl:text>
                           <br/>
                           <xsl:text>(с указанием примененных методов, материалов и документов, иллюстрирующих заключение таможенного эксперта, оценка результатов исследований). </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2">
                           <xsl:for-each select="cuop:Examination">
                              <br/>
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="2">
                           <xsl:text>3. Синтезирующая часть </xsl:text>
                           <br/>
                           <xsl:text>(в комплексных экспертизах при необходимости) </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2">
                           <xsl:for-each select="cuop:SynthesizingPortion">
                              <br/>
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" colspan="2">
                           <xsl:text>Выводы </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2">
                           <xsl:for-each select="cuop:Conclusions">
                              <br/>
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:190mm">
                           <table border="0" cellpadding="0" cellspacing="0" style="width:190mm">
                              <tbody>
                                 <xsl:for-each select="cuop:ExpertSignature">
                                    <tr>
                                       <td align="left" class="graphMain" style="width:50mm">
                                          <xsl:text> Таможенный эксперт </xsl:text>
                                       </td>
                                       <td align="right" class="graphMain" style="width:140mm">
                                          <xsl:value-of select="cat_ru:PersonSurname"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="cat_ru:PersonName"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="cat_ru:PersonMiddleName"/>
                                          <xsl:text> (И.О.Фамилия) </xsl:text>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td align="left" class="graphMain" style="width:50mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="right" class="graphMain" style="width:140mm">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
                                          </xsl:call-template>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
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
