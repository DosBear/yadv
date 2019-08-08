<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="ngwa  cat_ru catESAD_cu" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ngwa="urn:customs.ru:Information:CustomsDocuments:NotifGoodsWhArrive:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="ngwa:NotifGoodsWhArrive">
      <html>
         <head>
            <title>Уведомление о поступлении товаров на СВХ</title>
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
                        <td align="center">
                           <b>УВЕДОМЛЕНИЕ О ПОСТУПЛЕНИИ ТОВАРОВ НА СВХ</b>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <b>Дата и время формирования запроса:</b>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ngwa:NotifDate"/>
                           </xsl:call-template> 
									<xsl:value-of select="ngwa:NotifTime"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <b>Номер ДТ:</b>
                           <xsl:value-of select="ngwa:GTDID/cat_ru:CustomsCode"/>/<xsl:call-template name="gtd_date">
                              <xsl:with-param name="dategtd" select="ngwa:GTDID/cat_ru:RegistrationDate"/>
                           </xsl:call-template>/<xsl:value-of select="ngwa:GTDID/cat_ru:GTDNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <b>Код и наименование ТО, в который предоставлены товары:</b>
                           <xsl:value-of select="ngwa:Customs/cat_ru:Code"/> 
								<xsl:value-of select="ngwa:Customs/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <b>Местонахождение товаров</b>
                           <br/>
                           <xsl:for-each select="ngwa:GoodsLocation">
                              <xsl:if test="ngwa:CustomsOffice">
                                 <b>Код ТО:</b>
                                 <xsl:value-of select="ngwa:CustomsOffice"/>
                              </xsl:if>
                              <xsl:if test="ngwa:CustomsCountryCode">
                                 <b>Код страны:</b>
                                 <xsl:value-of select="ngwa:CustomsCountryCode"/>
                              </xsl:if>
                              <xsl:if test="ngwa:Address">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <b>Адрес местонахождения товаров:</b>
                                 <xsl:value-of select="ngwa:Address/cat_ru:PostalCode"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="ngwa:Address/cat_ru:CountryCode"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="ngwa:Address/cat_ru:CounryName"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="ngwa:Address/cat_ru:Region"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="ngwa:Address/cat_ru:City"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="ngwa:Address/cat_ru:StreetHouse"/>
                                 <br/>
                              </xsl:if>
                              <xsl:if test="ngwa:GoodsLocationWarehouse">
                                 <b>Сведения о складе:</b>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:if test="ngwa:GoodsLocationWarehouse/ngwa:DocumentModeCode='1'">
                                    <b>Лицензия</b>
                                 </xsl:if>
                                 <xsl:if test="ngwa:GoodsLocationWarehouse/ngwa:DocumentModeCode='2'">
                                    <b>Свидетельство</b>
                                 </xsl:if>
                                 <xsl:if test="ngwa:GoodsLocationWarehouse/cat_ru:PrDocumentName">
                                    <b>Наименование документа:</b>
                                    <xsl:value-of select="ngwa:GoodsLocationWarehouse/cat_ru:PrDocumentName"/>
                                 </xsl:if>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <b>Номер документа:</b>
                                 <xsl:value-of select="ngwa:GoodsLocationWarehouse/cat_ru:PrDocumentNumber"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <b>Дата выдачи:</b>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="ngwa:GoodsLocationWarehouse/cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                              <xsl:if test="ngwa:CUGoodsLocationPlace/catESAD_cu:NumberCustomsZone">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <b>Номер зоны таможенного контроля/ номер склада:</b>
                                 <xsl:value-of select="ngwa:CUGoodsLocationPlace/catESAD_cu:NumberCustomsZone"/>
                              </xsl:if>
                              <xsl:if test="ngwa:CUTransport">
                                 <b>Транспорт:</b>
                                 <!--<xsl:choose>
											<xsl:when test="(number(ngwa:CUTransport/ngwa:TransporKind)=1) or (ngwa:CUTransport/catESAD_cu:TransporKind='true') or (ngwa:CUTransport/catESAD_cu:TransporKind='t')">Ж/Д:</xsl:when>
											<xsl:otherwise>АВТО:</xsl:otherwise>
										</xsl:choose>-->
                                 <xsl:value-of select="ngwa:CUTransport/catESAD_cu:TransporKind"/>: 
										<xsl:for-each select="ngwa:CUTransport/catESAD_cu:TransporIdentifier">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position()!=last()">,</xsl:if>
                                 </xsl:for-each>
                              </xsl:if>
                              <br/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <table style="width:210mm">
                              <tbody>
                                 <tr>
                                    <td align="center" class="bordered" style="width:100mm">
                                       <xsl:value-of select="ngwa:CustomsPerson/cat_ru:PersonName"/>
                                    </td>
                                    <td style="width:70mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="center" class="bordered" style="width:40mm">
                                       <xsl:value-of select="ngwa:CustomsPerson/cat_ru:LNP"/>
                                    </td>
                                 </tr>
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
