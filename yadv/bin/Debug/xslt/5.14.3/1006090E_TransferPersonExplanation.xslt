<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tpex="urn:customs.ru:Information:CustomsDocuments:TransferPersonExplanation:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
   <xsl:output encoding="utf-8" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
            <xsl:value-of select="substring($dateIn,9,2)"/>.
                <xsl:value-of select="substring($dateIn,6,2)"/>.
                <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="tpex:TransferPersonExplanation ">
      <html>
         <head>
            <title>Пояснение лица, имеющего отношение к перемещению товаров и транспортных средств через таможенную границу Российской Федерации</title>
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
                            padding:    10mm;
                            padding-left:    10mm;
                            background: #ffffff;
                            border: solid .5pt #000000;
                            }
                        /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
                        @media print {div.page {border: none; margin: 0; padding: 0;}}
                        td {
                            font-family:Arial;
                            }
                        .normal{
                            font-weight: normal;
                            font-family:Arial;
                            font-size: 7pt;
                            }
                        .bold{
                            font-weight:  normal;
                            font-family:Arial;
                            font-size: 13pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
                            }
                        .italic{
                            font-style: italic; 
                            font-family:Arial;
                            font-size: 9pt
                            }
                            .graph {
                        font-family: Arial;
                        font-size: 8pt;
                        }
                    .graphMain {
                        font-family: Arial;
                        font-size: 12pt;
                        font-weight: normal;;
                        }
                        .graphLittle {
                        font-family: Arial;
                        font-size: 12pt;
                        }
                        .graph13Bold {
                        font-family: Arial;
                        font-size: 13pt;
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
                        <td style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="bold" style="width:95mm">
                           <span class="graphMain">Начальнику </span>
                           <xsl:value-of select="tpex:CustomsOffice/cat_ru:Code"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="tpex:CustomsOffice/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal "> (наименование таможенного органа)
                                        </td>
                     </tr>
                     <tr>
                        <td style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="bold" style="width:95mm">
                           <span class="graphMain">от </span>
                           <xsl:value-of select="tpex:ExplanationPerson/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="tpex:ExplanationPerson/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="tpex:ExplanationPerson/cat_ru:PersonMiddleName"/>
                           <xsl:text>/ </xsl:text>
                           <xsl:value-of select="tpex:ExplanationPerson/cat_ru:PersonPost"/>
                           <xsl:text>/ </xsl:text>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal "> (инициалы,фамилия, должность)
                                        </td>
                     </tr>
                     <tr>
                        <td style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="bold" style="width:95mm">
                           <xsl:value-of select="tpex:ExplanationPerson/tpex:IdentityCard/RUScat_ru:IdentityCardName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="tpex:ExplanationPerson/tpex:IdentityCard/RUScat_ru:IdentityCardSeries"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="tpex:ExplanationPerson/tpex:IdentityCard/RUScat_ru:IdentityCardNumber"/>
                           <xsl:text> </xsl:text>
                                    
                            от 
                                    <xsl:call-template name="russian_date2">
                              <xsl:with-param name="dateIn" select="tpex:ExplanationPerson/tpex:IdentityCard/RUScat_ru:IdentityCardDate"/>
                           </xsl:call-template>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal "> (номер паспорта или иного документа,
                                        </td>
                     </tr>
                     <tr>
                        <td style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="bold" style="width:95mm">
                           <xsl:value-of select="tpex:ExplanationPerson/tpex:IdentityCard/cat_ru:OrganizationName"/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal "> удостоверяющего личность)
                                        </td>
                     </tr>
                     <tr>
                        <td style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="left" class="bold" style="width:95mm">
                            представляющего
                            <xsl:value-of select="tpex:ExplanationPerson/tpex:PersonOrganization"/>
                        </td>
                     </tr>
                     <tr>
                        <td style="width:95mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal " style="width:95mm"> (наименование организации)<br/>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" colspan="2">
                           <span class="graph13Bold">Пояснение лица, имеющего отношение к перемещению товаров и транспортных средств через таможенную границу Российской Федерации</span>
                           <br/>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td class="bold">
                           <xsl:value-of select="tpex:Declarant/cat_ru:OrganizationName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="normal "> (наименование декларанта или иного лица, имеющего отношение к перемещению
                                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="normal "> товаров и транспортных средств через таможенную границу Российской Федерации)
                                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain">
                                        ( в соответствии с договором от
                                        <span class="bold">
                              <xsl:call-template name="russian_date2">
                                 <xsl:with-param name="dateIn" select="tpex:Declarant/tpex:DeclContract/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </span>
                                        №
                                        <span class="bold">
                              <xsl:value-of select="tpex:Declarant/tpex:DeclContract/cat_ru:PrDocumentNumber"/>
                           </span>)
                                        выступает/выступал(а) в качестве <span class="bold">получателя</span> в отношении товаров и/или транспортных средств, перемещаемых через таможенную границу Российской Федерации, по документам 
                                        </td>
                     </tr>
                     <tr>
                        <td class="bold">
                           <xsl:value-of select="tpex:TransferDocs/tpex:PresentDoc/cat_ru:PrDocumentName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="tpex:TransferDocs/tpex:PresentDoc/cat_ru:PrDocumentNumber"/> от
                                        <xsl:call-template name="russian_date2">
                              <xsl:with-param name="dateIn" select="tpex:TransferDocs/tpex:PresentDoc/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="normal "> наименование и номер документов( таможенного декларации, транзитной декларации,книжки МДП, транспортные документы,пр.)</td>
                     </tr>
                     <tr>
                        <td class="graphMain">
                                    В целях уточнения сведений об обстоятельствах, имеющих значение для проведения таможенного контроля, поясняю следующее<br/>
                           <br/>
                           <xsl:apply-templates select="tpex:ExplanationText/tpex:TextLine"/>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table>
                  <tr>
                     <td align="center" class="bold" valign="bottom">
                        <xsl:value-of select="tpex:CustomsMark/tpex:PersonPost"/>
                     </td>
                     <td rowspan="2" style="width: 10px;"/>
                     <td align="center" class="bold" valign="bottom">
                        <!--xsl:value-of select="tpex:CustomsMark/cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text-->
                        <xsl:value-of select="tpex:CustomsMark/cat_ru:PersonName"/>
                        <!--xsl:text> </xsl:text>
                        <xsl:value-of select="tpex:CustomsMark/cat_ru:PersonMiddleName"/-->
                     </td>
                     <td rowspan="2" style="width: 10px;"/>
                     <td align="center" class="bold" valign="bottom">
                        <xsl:value-of select="tpex:CustomsMark/cat_ru:LNP"/>
                     </td>
                     <td rowspan="2" style="width: 10px;"/>
                     <td align="center" class="bold" valign="bottom">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="tpex:CustomsMark/tpex:ReceiveDate"/>
                        </xsl:call-template>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="normal">(должностное лицо таможенного органа, <br/>принявшее объявление)<br/>
                        <br/>
                     </td>
                     <td align="center" class="normal">(инициалы и фамилия)</td>
                     <td align="center" class="normal">(ЛНП)</td>
                     <td align="center" class="normal">(дата)</td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="tpex:ExplanationText/tpex:TextLine">
      <p style="font-style: italic; margin: 0;">
         <xsl:value-of select="."/>
      </p>
   </xsl:template>
</xsl:stylesheet>
