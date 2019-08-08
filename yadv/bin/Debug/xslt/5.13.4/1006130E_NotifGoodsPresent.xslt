<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="ngpr  cat_ru catESAD_cu" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ngpr="urn:customs.ru:Information:CustomsDocuments:NotifGoodsPresent:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
            <xsl:value-of select="substring($dategtd,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dategtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="ngpr:NotifGoodsPresent">
      <html>
         <head>
            <title>Информация о местонахождении товаров/уведомление о предоставлении товаров</title>
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
                        vertical-align: top;
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
               <table width="100%">
                  <tbody>
                     <tr>
                        <td align="center" colspan="3">
                           <b>
                              <xsl:choose>
                                 <xsl:when test="ngpr:DocSign='1'">УВЕДОМЛЕНИЕ О ПРЕДОСТАВЛЕНИИ ТОВАРОВ</xsl:when>
                                 <xsl:when test="ngpr:DocSign='0'">ИНФОРМАЦИЯ О МЕСТОНАХОЖДЕНИИ ТОВАРОВ</xsl:when>
                              </xsl:choose>
                           </b>
                           <br/>
                        </td>
                     </tr>
                     <tr valign="top">
                        <td colspan="2"><b>Дата и время формирования запроса:</b></td>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ngpr:NotifDate"/>
                           </xsl:call-template> 
							<xsl:value-of select="substring(ngpr:NotifTime,1,8)"/>
                        </td>
                     </tr>
                     <xsl:if test="ngpr:GTDID">
						 <tr valign="top">
							<td colspan="2"><b>Номер ДТ:</b></td>
							<td>  
								<xsl:for-each select="ngpr:GTDID">
									<xsl:value-of select="cat_ru:CustomsCode"/>
									<xsl:text>/</xsl:text>
									<xsl:call-template name="gtd_date">
										<xsl:with-param name="dategtd" select="cat_ru:RegistrationDate"/>
									</xsl:call-template>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="cat_ru:GTDNumber"/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
						 </tr>
                     </xsl:if>
                     <tr valign="top">
                        <td colspan="2"><b>Код и наименование ТО, в который предоставляются товары:</b></td>
                        <td>                           
                           <xsl:value-of select="ngpr:Customs/cat_ru:Code"/> 
						   <xsl:value-of select="ngpr:Customs/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                     <xsl:if test="ngpr:PersonBase">
						 <tr valign="top">
							<td colspan="2"><b>ФИО декларанта:</b></td>
							<td>
								<xsl:for-each select="ngpr:PersonBase">
									<xsl:value-of select="cat_ru:PersonSurname"/> 
									<xsl:text> </xsl:text>
									<xsl:value-of select="cat_ru:PersonName"/> 
									<xsl:text> </xsl:text>
									<xsl:value-of select="cat_ru:PersonMiddleName"/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
						 </tr>
                     </xsl:if>
                     <tr>
                        <td colspan="3"><b>Местонахождение товаров</b></td>
                     </tr>
                     <xsl:for-each select="ngpr:GoodsLocation">
                        <xsl:if test="ngpr:CustomsOffice">
							<tr valign="top">
								<td width="3%"/>
								<td width="37%"><b>Код ТО:</b></td>
                                <td width="60%"><xsl:value-of select="ngpr:CustomsOffice"/></td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="ngpr:CustomsCountryCode">
							<tr valign="top">
								<td width="3%"/>
								<td width="37%"><b>Код страны:</b></td>
                                <td width="60%"><xsl:value-of select="ngpr:CustomsCountryCode"/></td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="ngpr:Address">
							<tr valign="top">
								<td width="3%"/>
								<td width="37%"><b>Адрес местонахождения товаров:</b></td>
								<td width="60%">
									 <xsl:value-of select="ngpr:Address/cat_ru:PostalCode"/>
									 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									 <xsl:value-of select="ngpr:Address/cat_ru:CountryCode"/>
									 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									 <xsl:value-of select="ngpr:Address/cat_ru:CounryName"/>
									 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									 <xsl:value-of select="ngpr:Address/cat_ru:Region"/>
									 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									 <xsl:value-of select="ngpr:Address/cat_ru:City"/>
									 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									 <xsl:value-of select="ngpr:Address/cat_ru:StreetHouse"/>
                                 </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="ngpr:GoodsLocationWarehouse">
							<tr valign="top">
								<td width="3%"/>
								<td width="37%"><b>Сведения о складе:</b></td>
								<td width="60%">
									 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									 <xsl:if test="ngpr:GoodsLocationWarehouse/ngpr:DocumentModeCode='1'">
										 <xsl:text>Лицензия: </xsl:text>
									 </xsl:if>
									 <xsl:if test="ngpr:GoodsLocationWarehouse/ngpr:DocumentModeCode='2'">
										 <xsl:text>Свидетельство: </xsl:text>
									 </xsl:if>
									 <xsl:if test="ngpr:GoodsLocationWarehouse/cat_ru:PrDocumentName">
										<xsl:value-of select="ngpr:GoodsLocationWarehouse/cat_ru:PrDocumentName"/>
									 </xsl:if>
									 <xsl:if test="ngpr:GoodsLocationWarehouse/cat_ru:PrDocumentNumber">
										<xsl:text> № </xsl:text>
										<xsl:value-of select="ngpr:GoodsLocationWarehouse/cat_ru:PrDocumentNumber"/>
									 </xsl:if>
									 <xsl:if test="ngpr:GoodsLocationWarehouse/cat_ru:PrDocumentDate">
										<xsl:text> Дата выдачи: </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="ngpr:GoodsLocationWarehouse/cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									 </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="ngpr:CUGoodsLocationPlace/catESAD_cu:NumberCustomsZone">
							<tr valign="top">
								<td width="3%"/>
								<td width="37%"><b>Номер зоны таможенного контроля/ номер склада:</b></td>
								<td width="60%"><xsl:value-of select="ngpr:CUGoodsLocationPlace/catESAD_cu:NumberCustomsZone"/></td>
							</tr>
                        </xsl:if>
                        <xsl:if test="ngpr:CUTransport">
							<tr valign="top">
								<td width="3%"/>
								<td width="37%"><b>Транспорт:</b></td>
								<td width="60%">
									 <xsl:choose>
										<xsl:when test="(number(ngpr:CUTransport/catESAD_cu:TransporKind)=1) or (ngpr:CUTransport/catESAD_cu:TransporKind='true') or (ngpr:CUTransport/catESAD_cu:TransporKind='t')">Ж/Д: </xsl:when>
										<xsl:otherwise>АВТО: </xsl:otherwise>
									 </xsl:choose>
									 <xsl:for-each select="ngpr:CUTransport/catESAD_cu:TransporIdentifier">
										<xsl:value-of select="."/>, 
									 </xsl:for-each>
								</td>
							</tr>
                        </xsl:if>
                     </xsl:for-each>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
