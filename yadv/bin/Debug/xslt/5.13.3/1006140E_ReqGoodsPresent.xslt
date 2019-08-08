<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="regp  cat_ru" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:regp="urn:customs.ru:Information:CustomsDocuments:ReqGoodsPresent:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template name="gtd_date">
      <xsl:param name="dategtd"/>
      <xsl:choose>
         <xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
            <xsl:value-of select="substring($dategtd,9,2)"/>
            <xsl:value-of select="substring($dategtd,6,2)"/>
            <xsl:value-of select="substring($dategtd,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dategtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="regp:ReqGoodsPresent">
      <html>
         <head>
            <!-- <title>Требование на предоставление товаров таможенному органу</title>-->
            <title>Запрос сведений о местонахождении товаров/реквизитах ТО, в зоне деятельности которого находятся товары/Уведомление о необходимости предоставления товаров в ТО</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    table {
                        border: 0;
                        cellpadding: 3;
                        cellspacing: 0;
                        width: 100%;
                        border-collapse: collapse;
                    }

                    

                    td.bold {
                        font-size: 8.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 700;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: bottom;
                        /*white-space: nowrap;*/
                    }

                    td.value {
                        font-size: 10.0pt;
                        font-family: Courier;
                        color: windowtext;
                        font-weight: 400;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: top;
                        /*white-space: nowrap;*/
                    }

                    .bordered {
                        border-bottom: .1pt solid windowtext;
                    }

                    span.bold {
                        font-size: 12.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 700;
                        font-style: normal;
                    }

                    span.value {
                        font-size: 12.0pt;
                        font-family: Courier;
                        color: windowtext;
                    }

                    div.page {
                        width: 210mm;
                        heifht: 297mm;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    p.bold {
                        font-weight: bold;
                    }

                    .graph {
                        font-family: Arial;
                        font-size: 7pt;
                    }

                    @media print {
                        div.page {
                            border: none;
                        }
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tbody>
                     <tr>
                        <!--<td align="center"><b>ТРЕБОВАНИЕ НА ПРЕДОСТАВЛЕНИЕ ТОВАРОВ ТАМОЖЕННОМУ ОРГАНУ</b></td>-->
                        <td align="center">
                           <b>
                              <xsl:choose>
                                 <xsl:when test="regp:DocSign='1'">ЗАПРОС СВЕДЕНИЙ О МЕСТОНАХОЖДЕНИИ ТОВАРОВ</xsl:when>
                                 <xsl:when test="regp:DocSign='2'">ЗАПРОС СВЕДЕНИЙ О РЕКВИЗИТАХ ТАМОЖЕННОГО ОРГАНА, В ЗОНЕ ДЕЯТЕЛЬНОСТИ КОТОРОГО НАХОДЯТСЯ ТОВАРЫ</xsl:when>
                                 <xsl:when test="regp:DocSign='3'">УВЕДОМЛЕНИЕ О НЕОБХОДИМОСТИ ПРЕДОСТАВЛЕНИЯ ТОВАРОВ В ТАМОЖЕННЫЙ ОРГАН</xsl:when>
                              </xsl:choose>
                           </b>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <b>Дата и время формирования запроса:</b>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="regp:ReqDate"/>
                           </xsl:call-template> 
									<xsl:value-of select="regp:ReqTime"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <b>Номер ДТ:</b>
                           <xsl:value-of select="regp:GTDID/cat_ru:CustomsCode"/>/<xsl:call-template name="gtd_date">
                              <xsl:with-param name="dategtd" select="regp:GTDID/cat_ru:RegistrationDate"/>
                           </xsl:call-template>/<xsl:value-of select="regp:GTDID/cat_ru:GTDNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <b>Код и наименование ТО:</b>
                           <xsl:value-of select="regp:Customs/cat_ru:Code"/> 
								<xsl:value-of select="regp:Customs/cat_ru:OfficeName"/>
                           <br/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table>
                  <tbody>
                     <tr>
                        <td align="center" class="bordered">
                           <xsl:value-of select="regp:CustomsPerson/cat_ru:PersonName"/> 
								</td>
                        <td>
                           <text>     </text>
                        </td>
                        <td align="center" class="bordered">
                           <xsl:value-of select="regp:CustomsPerson/cat_ru:LNP"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center">ФИО</td>
                        <td>
                           <text>     </text>
                        </td>
                        <td align="center">ЛНП</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
