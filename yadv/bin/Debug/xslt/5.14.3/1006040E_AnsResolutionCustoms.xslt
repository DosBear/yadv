<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:arc="urn:customs.ru:Information:CustomsDocuments:AnsResolutionCustoms:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template match="arc:AnsResolutionCustoms">
      <html>
         <head>
            <title>Ответ декларанта на решение таможенного органа по таможенной стоимости</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                        background: #cccccc;
                    }

                    div.page {
                        width: 210mm;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                    }

                    @media print {
                        div.page {
                            border: none;
                        }
                    }

                    h1 {
                        font-size: 14pt;
                        margin-bottom: 30pt;
                        text-align: center;
                    }

                    td {
                        font-family: Courier, serif;
                    }

                    .normal {
                        font-weight: bold;
                        font-family: Arial, serif;
                        font-size: 10pt;
                        border-style: none;
                        border-bottom: 1pt solid black;
                        text-align: center;
                    }

                    .normal2 {
                        font-weight: bold;
                        font-family: Arial, serif;
                        font-size: 10pt;
                        border-left: 1pt solid windowtext;
                        border-right: 1pt solid windowtext;
                        border-top: 1pt solid windowtext;
                        border-bottom: 1pt solid windowtext;
                    }

                    .graphMain {
                        font-family: Arial, serif;
                        font-size: 10pt;
                        font-weight: normal;
                    }

                    .graphLittle {
                        font-family: Arial, serif;
                        font-size: 7pt;
                        text-align: center;
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <h1>Ответ декларанта на решение таможенного органа по таможенной стоимости</h1>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <xsl:choose>
                           <xsl:when test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:OrganizationName">
                              <td align="center" class="normal" style="width:90mm">
                                 <xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:OrganizationName"/>
                              </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td align="center" style="width:90mm">
                                 <xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:ShortName"/>
                              </td>
                           </xsl:otherwise>
                        </xsl:choose>
                        <td style="width:80mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:90mm">
                                    (декларант: наименование или инициалы и фамилия (для физических лиц)(из графы 14
                                    ДТ)
                                </td>
                        <td style="width:80mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="normal" style="width:90mm">
                           <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН:<xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН:<xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RBOrganizationFeatures/cat_ru:UNP">УПН:<xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
														 BIN:
														<xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                           </xsl:if>
                           <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
														INN:
														<xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                           </xsl:if>
                           <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:ITN">
                              <span class="graphMain"> ITN:</span>
                              <xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:ITN"/>
                           </xsl:if>
                        </td>
                        <td style="width:80mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="normal" style="width:90mm">
                           <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП:<xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:OKPOID">ОКПО:<xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:OKPOID"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:OKATOCode">ОКАТО:<xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:OKATOCode"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                        </td>
                        <td style="width:80mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Contact/cat_ru:Phone|arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Contact/cat_ru:Fax|arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Contact/cat_ru:Telex">
                        <tr>
                           <td class="normal" style="width:90mm">
                              <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Contact/cat_ru:Phone">
                                            тел.
                                            <xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Contact/cat_ru:Phone"/>
                                 <xsl:text> </xsl:text>
                              </xsl:if>
                              <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Contact/cat_ru:Fax">
                                            факс
                                            <xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Contact/cat_ru:Fax"/>
                                 <xsl:text> </xsl:text>
                              </xsl:if>
                              <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Contact/cat_ru:Telex">
                                            телекс
                                            <xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Contact/cat_ru:Telex"/>
                                 <xsl:text> </xsl:text>
                              </xsl:if>
                           </td>
                           <td style="width:80mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graphLittle" style="width:90mm">
                                        телефон, телефакс
                                    </td>
                           <td style="width:80mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Address">
                        <tr>
                           <td class="normal" style="width:90mm">
                              <xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Address/cat_ru:PostalCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Address/cat_ru:CountryCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Address/cat_ru:CounryName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Address/cat_ru:Region"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Address/cat_ru:City"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="arc:AnsDeclarant/arc:InfoAnsDeclarant/cat_ru:Address/cat_ru:StreetHouse"/>
                              <xsl:text> </xsl:text>
                           </td>
                           <td style="width:80mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graphLittle" style="width:90mm">адрес</td>
                           <td style="width:80mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graphMain" colspan="2" style="padding-top: 20pt;">
                                    В связи с получением решения таможенного органа о необходимости корректировки
                                    таможенной стоимости, заявленной в ДТ №
                                    <span class="normal">
                              <xsl:value-of select="arc:GTDID/cat_ru:CustomsCode"/>
                              <xsl:text>/ </xsl:text>
                              <xsl:call-template name="russian_date2">
                                 <xsl:with-param name="dateIn" select="arc:GTDID//cat_ru:RegistrationDate"/>
                              </xsl:call-template>
                              <xsl:text>/ </xsl:text>
                              <xsl:value-of select="arc:GTDID/cat_ru:GTDNumber"/>
                           </span>
                           <xsl:text>, </xsl:text> сообщаю:
                                </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" style="margin-top: 20pt;">
                  <tbody>
                     <tr>
                        <td class="graphMain" style="width:100mm">Согласен уточнить структуру заявленной
                                    таможенной стоимости в рамках выбранного метода
                                </td>
                        <td style="width:70mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <xsl:choose>
                           <xsl:when test="arc:RefinedStructure = 'true' or arc:RefinedStructure = '1' or arc:RefinedStructure = 't'">
                              <td align="center" class="normal2" style="width:5mm">X</td>
                              <td class="normal2" style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="normal2" style="width:5mm">X</td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <td style="width:100mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td style="width:70mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:5mm">
                                    Да
                                </td>
                        <td align="center" class="graphLittle" style="width:5mm">
                                    Нет
                                </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:100mm">Согласен определить таможенную стоимость
                                    <br/>
                                    другим методом
                                </td>
                        <td style="width:70mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <xsl:choose>
                           <xsl:when test="arc:DesignateTS = 'true' or arc:DesignateTS = 't' or arc:DesignateTS = '1'">
                              <td align="center" class="normal2" style="width:5mm">X</td>
                              <td class="normal2" style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="normal2" style="width:5mm">X</td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <td style="width:100mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td style="width:70mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:5mm">
                                    Да
                                </td>
                        <td align="center" class="graphLittle" style="width:5mm">
                                    Нет
                                </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="4" style="width:190mm">При несогласии сообщить причины
                                </td>
                     </tr>
                     <tr>
                        <td class="normal" colspan="4" style="width:190mm">
                           <xsl:for-each select="arc:Reason">
							   <xsl:value-of select="."/>
							   <xsl:if test="position()!=last()"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="4" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:100mm">Требуется проведение консультации<br/>по
                                    выбору метода определения таможенной стоимости
                                </td>
                        <td style="width:70mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <xsl:choose>
                           <xsl:when test="arc:Consultation = 'true' or arc:Consultation = 't' or arc:Consultation = '1'">
                              <td align="center" class="normal2" style="width:5mm">X</td>
                              <td class="normal2" style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:5mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="normal2" style="width:5mm">X</td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <td style="width:100mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td style="width:70mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:5mm">
                                    Да
                                </td>
                        <td align="center" class="graphLittle" style="width:5mm">
                                    Нет
                                </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" style="width:190mm; margin-top: 20pt;">
                  <tr>
                     <td class="graphMain" style="width:80mm">Предлагаемая дата проведения консультаций</td>
                     <td style="width:10mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" class="normal">
                        <xsl:value-of select="arc:AnsDeclarantSignature/cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="arc:AnsDeclarantSignature/cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="arc:AnsDeclarantSignature/cat_ru:PersonMiddleName"/>
                     </td>
                     <td align="center" class="normal">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="arc:AnsDeclarantSignature/cat_ru:IssueDate"/>
                        </xsl:call-template>
                     </td>
                  </tr>
                  <tr>
                     <td style="width:80mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td style="width:10mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" class="graphLittle">
                                подпись
                            </td>
                     <td align="center" class="graphLittle">
                                дата
                            </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
