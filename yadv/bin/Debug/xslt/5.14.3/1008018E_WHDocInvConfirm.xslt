<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="whdic cat_ru catWH_ru" version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:whdic="urn:customs.ru:Information:WarehouseDocuments:WHDocInvConfirm:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="whdic:WHDocInvConfirm">
      <html>
         <head>
            <title>Подтверждение о получении перечня запрошенных документов</title>
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
                    .graph {font-family: Arial; font-size: 7pt;}
                    .graphColumn {font-family: Arial; font-size: 6.5pt;}
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
               <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                  <tbody>
                     <tr>
                        <td align="center" class="graphMain" style="width:180mm;">
								Подтверждение о получении перечня запрошенных документов<br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphMain" style="width:180mm;">
									Дата направления подтверждения
									<u>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="whdic:SendDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="whdic:SendTime"/>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphMain" style="width:180mm;">
									Дата получения перечня
									<u>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="whdic:RecDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="whdic:RecTime"/>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <br/>
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" style="width:10mm;border:solid 0.8pt #000000;">№ п/п</td>
                                    <td align="center" class="graph" style="width:25mm;border:solid 0.8pt #000000;">Код вида документа</td>
                                    <td align="center" class="graph" style="width:60mm;border:solid 0.8pt #000000;">Номер и дата документа</td>
                                    <td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">Количество листов </td>
                                    <td align="center" class="graph" style="width:75mm;border:solid 0.8pt #000000;">Примечание </td>
                                 </tr>
                                 <xsl:for-each select="whdic:InventDocument">
                                    <tr>
                                       <td align="center" class="graph" style="width:10mm;border:solid 0.8pt #000000;">
                                          <xsl:value-of select="position()"/>
                                       </td>
                                       <td align="center" class="graph" style="width:25mm;border:solid 0.8pt #000000;">
                                          <xsl:value-of select="whdic:InvDocCode"/>
                                       </td>
                                       <td align="center" class="graph" style="width:60mm;border:solid 0.8pt #000000;">
                                          <xsl:value-of select="whdic:InvDocNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="whdic:InvDocDate"/>
                                          </xsl:call-template>
                                       </td>
                                       <td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">
                                          <xsl:value-of select="whdic:InvDocLists"/>
                                       </td>
                                       <td class="graph" style="width:75mm;border:solid 0.8pt #000000;">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:if test="whdic:Note">
                                             <xsl:value-of select="whdic:Note"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:if>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <br/>
                           <u> Лицо, получившее перечень запрошенных документов: </u>
                           <xsl:if test="whdic:Person">
                              <xsl:value-of select="whdic:Person/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="whdic:Person/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="whdic:Person/cat_ru:PersonMiddleName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="whdic:Person/cat_ru:PersonPost"/>
                           </xsl:if>
                           <br/>
                           <u> Таможенный орган: </u>
                           <xsl:value-of select="whdic:Customs/cat_ru:Code"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="whdic:Customs/cat_ru:OfficeName"/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
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
