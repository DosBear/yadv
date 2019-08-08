<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="do1cl cat_ru catWH_ru" version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.13.1" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:do1cl="urn:customs.ru:Information:WarehouseDocuments:DO1CloseReq:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="do1cl:DO1CloseReq">
      <html>
         <head>
            <title>Уведомление о полной выдаче товаров по отчетности ДО1</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {background: #CCCCCC; font-size: 9pt;}
                    div.page {
                        width: 210mm;
                        margin: 10px auto;
                        padding: 5mm 10mm;
                        background: white;
                        border: solid 1px black;
                        page-break-after: always;
                    }
                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}
                    div.goods {background: white;}
                    .bordered {
                        border: solid 1px black;
                        padding-top: 4pt;
                        padding-bottom: 4pt;
                        font-family: Arial;
                        font-size: 9pt;
                        font-weight: bold;
                    }
                    .underlined {border-bottom: solid 0.8pt black;}
                    p.NumberDate {font-weight: bold;}
                    .graph {font-family: Arial; font-size: 8pt;}
                    .graphColumn {font-family: Arial; font-size: 6.5pt;}
                    .graphLittle {font-family: Arial; font-size: 6.5pt;}
                    .graphTitleIt {font-family: Arial; font-size: 7pt; font-style: italic;}
                    .graphMain {font-family: Arial; font-size: 9pt; font-weight: bold; }
                    .graphNum {font-family: Arial; font-size: 7pt; font-weight: bold;}
                    .graphNo {font-size: 7pt; font-weight: bold;}
                    h1{font-size: 12pt;}
                    table.addInfo {border-collapse: collapse; vertical-align: top;}
                    table.addInfo th {border: 1px solid black; background-color: LightGrey;}
                    table.addInfo td {border: 1px solid black; vertical-align: top;}
                    hr {border: 0; border-bottom: 1px solid black; margin: 0;}
                    .tr {border-right: 1px solid black;}
                    .tl {border-left: 1px solid black;}
                    .tb {border-bottom: 1px solid black;}
                    .tt {border-top: 1px solid black;}
                    .br {border-right: 2px solid black;}
                    .bl {border-left: 2px solid black;}
                    .bb {border-bottom: 2px solid black;}
                    .bt {border-top: 2px solid black;}
                    .db {border-bottom: 1px dashed black;}
                    .dl {border-left: 1px dashed black;}
                    .number {
                        text-align: center;
                        color: black;
                        font-size: 11pt;
                        font-weight: bold;
                        vertical-align: middle;
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <h3 align="center">Уведомление о полной выдаче товаров по отчетности ДО1</h3>
               <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                  <tbody>
                     <tr>
                        <td align="center" class="graphMain" colspan="2" style="width:180mm;">
                           <u>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="do1cl:FormationMSGDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="do1cl:FormationMSGTime"/>
                           </u>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" colspan="2" style="width:180mm">
									(Дата и время формирования сообщения)
								</td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;">
									Регистрационный номер
								</td>
                        <td class="graph" style="width:90mm;">
                           <text/>
                           <xsl:value-of select="do1cl:RegNumberDO1/cat_ru:CustomsCode"/>
                           <xsl:text>/</xsl:text>
                           <xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="do1cl:RegNumberDO1/cat_ru:RegistrationDate"/>
                           </xsl:call-template>
                           <xsl:text>/</xsl:text>
                           <xsl:value-of select="do1cl:RegNumberDO1/cat_ru:GTDNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:90mm;">
                           <xsl:choose>
                              <xsl:when test="do1cl:RegNumberDO1/catWH_ru:CertificateNumber">
											Номер свидетельства о включении в реестр владельцев временного хранения
										</xsl:when>
                              <xsl:otherwise>
											Цифровой признак места временного хранения в соответствии с нумерацией, установленной пунктом 34 Порядка
										</xsl:otherwise>
                           </xsl:choose>
                        </td>
                        <td class="graph" style="width:90mm;">
                           <xsl:choose>
                              <xsl:when test="do1cl:RegNumberDO1/catWH_ru:CertificateNumber">
                                 <xsl:value-of select="do1cl:RegNumberDO1/catWH_ru:CertificateNumber"/>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="do1cl:RegNumberDO1/catWH_ru:OtherWHPlaceKind"/>
                              </xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" style="width:90mm;">
                           <u>
                              <xsl:value-of select="do1cl:CustomInspector/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="do1cl:CustomInspector/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="do1cl:CustomInspector/cat_ru:PersonMiddleName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="do1cl:CustomInspector/cat_ru:PersonPost"/>
                              <xsl:text> </xsl:text>
											ЛНП: <xsl:value-of select="do1cl:CustomInspector/catWH_ru:LNP"/>
                           </u>
                        </td>
                        <td align="center" class="graph" style="width:90mm;">
                           <text/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:90mm;">
									(должностне лицо таможенного органа)
								</td>
                        <td align="center" class="graphLittle" style="width:90mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
