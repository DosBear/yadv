<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="gare  cat_ru" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gare="urn:customs.ru:Information:CustomsDocuments:GoodsArriveReport:5.11.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="gare:GoodsArriveReport">
      <html>
         <head>
            <title>Информация о прибытии товаров</title>
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
                        white-space: nowrap;
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
                        white-space: nowrap;
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
                           <b>ИНФОРМАЦИЯ О ПРИБЫТИИ ТОВАРОВ</b>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <b>Дата и время формирования запроса:</b>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="gare:ReqDate"/>
                           </xsl:call-template> 
									<xsl:value-of select="substring(gare:ReqTime, 1, 8)"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <b>Код и наименование ТО:</b>
                           <xsl:value-of select="gare:Customs/cat_ru:Code"/> 
								<xsl:value-of select="gare:Customs/cat_ru:OfficeName"/>
                           <br/>
                        </td>
                     </tr>
					 <xsl:if test="gare:DO1Sign">
						<tr>
							<td>
								<b>Признак наличия ДО-1:</b>
								<xsl:choose>
									<xsl:when test="gare:DO1Sign='true' or gare:DO1Sign='t' or gare:DO1Sign='1'">есть</xsl:when>
									<xsl:when test="gare:DO1Sign='false' or gare:DO1Sign='f' or gare:DO1Sign='0'">нет</xsl:when>
									<xsl:otherwise><xsl:value-of select="gare:DO1Sign"/></xsl:otherwise>
								</xsl:choose>
								<br/>
							</td>
						</tr>
                     </xsl:if>
                  </tbody>
               </table>
               <table border="1" width="210mm">
                  <tbody>
                     <tr>
                        <td align="center" style="width:10mm">
                           <b>Номер товара в ДТ</b>
                        </td>
                        <td align="center" style="width:25mm">
                           <b>Код товара</b>
                        </td>
                        <td align="center" style="width:45mm">
                           <b>Описание товара</b>
                        </td>
                        <td align="center" style="width:70mm">
                           <b>Транспортные документы</b>
                        </td>
                        <td align="center" style="width:20mm">
                           <b>Признак присутствия товара на СВХ</b>
                        </td>
                        <td align="center" style="width:40mm">
                           <b>Примечание</b>
                        </td>
                     </tr>
                     <xsl:for-each select="gare:GoodsInfo">
                        <tr>
                           <td align="center" style="width:30mm">
                              <xsl:value-of select="gare:GTDGoodsNumber"/>
                           </td>
                           <td align="center" style="width:30mm">
                              <xsl:value-of select="gare:GoodsTNVEDCode"/>
                           </td>
                           <td align="center" style="width:50mm">
                              <xsl:for-each select="gare:GoodsDescription">
                                 <xsl:value-of select="."/>;  </xsl:for-each>
                           </td>
                           <td align="center" style="width:100mm">
                              <xsl:for-each select="gare:TransportDocuments">
                                 <xsl:value-of select="cat_ru:PrDocumentName"/> 
											№<xsl:value-of select="cat_ru:PrDocumentNumber"/> 
											от<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>;
										</xsl:for-each>
                           </td>
                           <td align="center">
                              <xsl:choose>
                                 <xsl:when test="(gare:ValuePresence='true') or (gare:ValuePresence='t') or (gare:ValuePresence='1')">
											Присутсвует
										</xsl:when>
                                 <xsl:otherwise>Отсутствует</xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <td align="center">
                              <xsl:for-each select="gare:Note">
                                 <xsl:value-of select="."/>; </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <xsl:if test="gare:TransportMeanArrive">
                  <table border="1" style="width:210mm">
                     <tbody>
                        <tr>
                           <td colspan="8" style="border: 0pt solid #000000">
                              <b>Сведения о транспортных средствах</b>
                           </td>
                        </tr>
                        <tr>
                           <td>Тип</td>
                           <td>Марка</td>
                           <td>Номер</td>
                           <td>Код страны</td>
                           <td>Номер шасси</td>
                           <td>Признак нахождения ТС в зоне таможенного контроля</td>
                           <td>Дата пересечения границы</td>
                           <td>Дополнительные сведения</td>
                        </tr>
                        <xsl:for-each select="gare:TransportMeanArrive">
                           <tr>
                              <td>
                                 <xsl:value-of select="cat_ru:TransportKindCode"/>
                              </td>
                              <td>
                                 <xsl:value-of select="cat_ru:TransportMarkCode"/>
                              </td>
                              <td>
                                 <xsl:value-of select="cat_ru:TransportIdentifier"/>
                                 <xsl:if test="cat_ru:ActiveTransportIdentifier">
											 <xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
                                 </xsl:if>
                              </td>
                              <td>
                                 <xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
                              </td>
                              <td>
                                 <xsl:value-of select="cat_ru:VIN"/>
                              </td>
                              <td>
                                 <xsl:choose>
                                    <xsl:when test="(gare:TransportMeanArriveFlag= 'true') or (gare:TransportMeanArriveFlag= 't') or (gare:TransportMeanArriveFlag= '1')">ТС в зоне таможенного контроля</xsl:when>
                                    <xsl:otherwise>ТС вне зоны таможенного контроля</xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <td>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="gare:Date"/>
                                 </xsl:call-template>
                              </td>
                              <td>
                                 <xsl:value-of select="gare:Note"/>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <table>
                  <tbody>
                     <tr>
                        <td align="center" class="bordered">
                           <xsl:value-of select="gare:CustomsPerson/cat_ru:PersonName"/> 
								</td>
                        <td>
                           <text>     </text>
                        </td>
                        <td align="center" class="bordered">
                           <xsl:value-of select="gare:CustomsPerson/cat_ru:LNP"/>
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
   <xsl:template match="gare:Declarant">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
      <xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
      <br/>
      <br/>
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <span class="header">Адрес:</span>
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <span class="header">Документ, удостоверяющий личность:</span>
      <br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode"/>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
