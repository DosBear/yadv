<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:insp="urn:customs.ru:Information:CustomsDocuments:CommissionInspection:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template name="russian_time">
      <xsl:param name="timeIn"/>
      <xsl:choose>
         <xsl:when test="substring($timeIn,3,1)=':' and substring($timeIn,6,1)=':'">
            <xsl:value-of select="substring($timeIn,1,2)"/> час.
                <xsl:value-of select="substring($timeIn,4,2)"/> мин.
            </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$timeIn"/>
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
   <xsl:template match="insp:CommissionInspection">
      <html>
         <head>
            <title>Поручение на досмотр</title>
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
                        padding: 10mm;
                        padding-left: 10mm;
                        background: white;
                        border: solid .5pt #000000;
                    }

                    .normal {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        border-left: medium none;
                        border-right: medium none;
                        border-top: medium none;
                        border-bottom: 1pt solid windowtext;
                    }

                    .normal2 {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 10pt;
                        border-left: 1pt solid windowtext;
                        border-right: 1pt solid windowtext;
                        border-top: 1pt solid windowtext;
                        border-bottom: 1pt solid windowtext;
                    }

                    .bold {
                        font-weight: bold;
                        font-family: Arial;
                        font-size: 13pt;
                    }

                    .italic {
                        font-style: italic;
                        font-family: Arial;
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

                    .graph10Bold {
                        font-family: Arial;
                        font-size: 10pt;
                        font-weight: bold;
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
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" class="normal" colspan="2" style="width:85mm">
                           <xsl:value-of select="insp:Customs/cat_ru:OfficeName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="insp:Customs/cat_ru:Code"/>
                        </td>
                        <td colspan="2" style="width:85mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" colspan="2" style="width:90mm">
                                    (наименование таможенного органа)
                                </td>
                     </tr>
                     <tr>
                        <td colspan="4" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="bold" colspan="4" style="width:190mm">
                                    ПОРУЧЕНИЕ НА ДОСМОТР №
                                    <span class="normal">
                              <xsl:value-of select="insp:CommissionInspectionID/cat_ru:CustomsCode"/>
                              <xsl:text>/ </xsl:text>
                              <xsl:call-template name="russian_date2">
                                 <xsl:with-param name="dateIn" select="insp:CommissionInspectionID//cat_ru:RegistrationDate"/>
                              </xsl:call-template>
                              <xsl:text>/ </xsl:text>
                              <xsl:value-of select="insp:CommissionInspectionID/cat_ru:SerialNumber"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="4" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="4" style="text-align: justify;">
                           <xsl:text>Должностным лицам </xsl:text>
                           <span style="text-decoration: underline; font-weight: bold;">
                              <xsl:for-each select="insp:CustomsPerson">
                                 <xsl:if test="position() > 1">
                                    <xsl:text>, </xsl:text>
                                 </xsl:if>
                                 <xsl:value-of select="cat_ru:PersonName"/>
                              </xsl:for-each>
                           </span>
                           <xsl:text> в срок до </xsl:text>
                           <span style="text-decoration: underline; font-weight: bold;">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="insp:DateInspection"/>
                              </xsl:call-template>
                           </span>
                           <xsl:text> провести таможенный досмотр </xsl:text>
                           <xsl:if test="insp:ObjectType = 1">
                                    товаров <s>(транспортного средства)</s>
                           </xsl:if>
                           <xsl:if test="insp:ObjectType = 2">
                              <s>товаров</s> (транспортного средства)
                                    </xsl:if>
                           <!--span style="text-decoration: underline; font-weight: bold;">
                                        <xsl:value-of select="insp:InfoTransport/catESAD_ru:TransportTraditionalName"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="insp:InfoTransport/catESAD_ru:TransportModeCode"/>
                                    </span-->
                        </td>
                     </tr>
                     <!--xsl:if test="(insp:InfoTransport/cat_ru:TransportModeCode) or (insp:InfoTransport/cat_ru:TransportNationalityCode)">
								<tr>
									<td class="normal" colspan="4" align="center">
										<xsl:value-of select="insp:InfoTransport/cat_ru:TransportModeCode"/>&#160;
										<xsl:value-of select="insp:InfoTransport/cat_ru:TransportNationalityCode"/>&#160;
									</td>
								</tr>
								<tr>
									<td class="graphLittle" align="center" style="width:190mm" colspan="4">
										(код вида транспортного средства, буквенный код страны принадлежности транспортных средств по классификатору стран мира)
									</td>
								</tr>
                            </xsl:if-->
                     <xsl:for-each select="insp:InfoTransport/insp:TransportMeans">
                        <tr>
                           <td align="center" class="normal" colspan="4">
                              <!--<xsl:value-of select="cat_ru:VIN"/>&#160;-->
                              <xsl:if test="cat_ru:TransportKindCode">
                                 <xsl:value-of select="cat_ru:TransportKindCode"/>, </xsl:if>
                              <xsl:if test="cat_ru:TransportMarkCode">
                                 <xsl:value-of select="cat_ru:TransportMarkCode"/>, </xsl:if>
                              <xsl:if test="cat_ru:TransportIdentifier">
                                 <xsl:value-of select="cat_ru:TransportIdentifier"/> </xsl:if>
                              <!--<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>&#160;-->
                              <!--xsl:if test="insp:InfoTransport/catESAD_ru:SecondTrailerIdentifier">номер 2-го
											прицепа
											<xsl:value-of select="insp:InfoTransport/catESAD_ru:SecondTrailerIdentifier"/>
										</xsl:if-->
                              <!--<xsl:value-of select="insp:InfoTransport/cat_ru:TransportRegNumber"/>-->
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="graphLittle" colspan="4" style="width:190mm">
										(тип, наименование, регистрационный номер транспортного средства)
									</td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td align="center" class="normal" colspan="4">
                           <xsl:value-of select="insp:PersonInspection/cat_ru:OrganizationName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="insp:PersonInspection/cat_ru:ShortName"/>
                           <xsl:text> </xsl:text>
                           <xsl:if test="insp:PersonInspection/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН
                                        <xsl:value-of select="insp:PersonInspection/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="insp:PersonInspection/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН
                                        <xsl:value-of select="insp:PersonInspection/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="insp:PersonInspection/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП
                                        <xsl:value-of select="insp:PersonInspection/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="insp:PersonInspection/insp:IdentityCard">
                              <xsl:text>, </xsl:text>
                              <xsl:value-of select="insp:PersonInspection/insp:IdentityCard/cat_ru:IdentityCardCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="insp:PersonInspection/insp:IdentityCard/cat_ru:IdentityCardName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="insp:PersonInspection/insp:IdentityCard/cat_ru:IdentityCardSeries"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="insp:PersonInspection/insp:IdentityCard/cat_ru:IdentityCardNumber"/>
                              <!--xsl:text> </xsl:text>
                              <xsl:value-of select="insp:PersonInspection/insp:IdentityCard/cat_ru:RBIdentificationNumberr"/-->
                              <xsl:text> </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="insp:PersonInspection/insp:IdentityCard/cat_ru:IdentityCardDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="insp:PersonInspection/insp:IdentityCard/cat_ru:OrganizationName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" colspan="4" style="width:190mm">
                                    (наименование получателя/отправтеля, перевозчика, инициалы, фамилия физического лица
                                    (получателя/отправителя))
                                </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="1" style="width:48mm">по документам

                                </td>
                        <td align="center" class="normal" colspan="3" style="width:142mm">
                           <xsl:value-of select="insp:Document/cat_ru:PrDocumentName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="insp:Document/insp:PresentedDocumentModeCode"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="insp:Document/cat_ru:PrDocumentNumber"/> от
                                    <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="insp:Document/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="1" style="width:48mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="3" style="width:142mm">
                                    (транспортные (перевозочные) документы, коммерческие документы, книжка МДП,
                                    таможенные документы)
                                </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphMain" style="width:48mm">из
                                    <span class="normal">
                              <xsl:value-of select="insp:InfoGoods/insp:NameDepartureCountry"/>
                           </span>
                        </td>
                        <td align="center" class="graphMain" style="width:65mm">в количестве
                                    <span class="normal">
                              <xsl:value-of select="insp:InfoGoods/insp:Quantity"/>
                           </span>
                                    мест,
                                </td>
                        <td align="center" class="graphMain" style="width:30mm">весом
                                    <span class="normal">
                              <xsl:value-of select="insp:InfoGoods/insp:NetWeightQuantity"/>
                           </span>
                        </td>
                        <td align="center" class="graphMain" style="width:47mm">нетто
                                    <span class="normal">
                              <xsl:value-of select="insp:InfoGoods/insp:GrossWeightQuantity"/>
                           </span>
                                    брутто
                                </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:48mm">Место назначения</td>
                        <xsl:choose>
                           <xsl:when test="(insp:Destination/insp:ImportExport = 'true') or (insp:Destination/insp:ImportExport = 't') or (insp:Destination/insp:ImportExport = '1')">
                              <td align="center" class="normal" colspan="3" style="width:142mm">
                                            ввоз-населенный пункт
                                            <xsl:value-of select="insp:Destination/insp:NameCountry"/>
                              </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal" colspan="3" style="width:142mm">вывоз-населенный пункт
                                            <xsl:value-of select="insp:Destination/insp:NameCountry"/>
                              </td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <td colspan="1" style="width:48mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="3" style="width:142mm">
                                    (при ввозе- населенный пункт, при вывозе - страна назначения)
                                </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:48mm">Место таможенного досмотра</td>
                        <td align="center" class="normal" colspan="3" style="width:142mm">
                           <xsl:if test="insp:GoodsLocation/insp:WarehousePlace">
                              <xsl:if test="insp:GoodsLocation/insp:WarehousePlace/insp:DocumentModeCode=1">Лицензия</xsl:if>
                              <xsl:if test="insp:GoodsLocation/insp:WarehousePlace/insp:DocumentModeCode=2">Свидетельство</xsl:if>
                              <!--xsl:value-of select="insp:GoodsLocation/insp:WarehousePlace/catESAD_ru:DocumentModeCode"/-->
                              <xsl:text> № </xsl:text>
                              <xsl:value-of select="insp:GoodsLocation/insp:WarehousePlace/catESAD_ru:CertificateNumber"/>
                              <xsl:text> от </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="insp:GoodsLocation/insp:WarehousePlace/catESAD_ru:CertificateDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="insp:GoodsLocation/insp:WarehousePlace/catESAD_ru:CustomsOfficeID"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="insp:GoodsLocation/insp:GoodsLocationPlace">
                              <xsl:value-of select="insp:GoodsLocation/insp:GoodsLocationPlace/catESAD_ru:GoodsLocationPlaceDesc"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="insp:GoodsLocation/insp:GoodsLocationPlace/catESAD_ru:CustomsOfficeID"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="insp:GoodsLocation/insp:GoodsLocationPlace/catESAD_ru:RailwayStationCode"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="insp:GoodsLocation/insp:GoodsLocationPlace/catESAD_ru:RailwayStationName"/>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="insp:GoodsLocation/insp:GoodsLocationPlace/catESAD_ru:Address">
                              <xsl:value-of select="insp:GoodsLocation/insp:GoodsLocationPlace/catESAD_ru:Address/cat_ru:PostalCode"/>
                              <xsl:text>, </xsl:text>
                              <xsl:value-of select="insp:GoodsLocation/insp:GoodsLocationPlace/catESAD_ru:Address/cat_ru:CountryCode"/>
                              <xsl:text>, </xsl:text>
                              <xsl:value-of select="insp:GoodsLocation/insp:GoodsLocationPlace/catESAD_ru:Address/cat_ru:CounryName"/>
                              <xsl:text>, </xsl:text>
                              <xsl:value-of select="insp:GoodsLocation/insp:GoodsLocationPlace/catESAD_ru:Address/cat_ru:Region"/>
                              <xsl:text>, </xsl:text>
                              <xsl:value-of select="insp:GoodsLocation/insp:GoodsLocationPlace/catESAD_ru:Address/cat_ru:City"/>
                              <xsl:text>, </xsl:text>
                              <xsl:value-of select="insp:GoodsLocation/insp:GoodsLocationPlace/catESAD_ru:Address/cat_ru:StreetHouse"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="1" style="width:48mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="3" style="width:142mm">
                                    (вид, склада, номер свидетельства о включении в Реестр владельцев складов временного
                                    хранения, либо иное место нахождения товаров)
                                </td>
                     </tr>
                     <xsl:if test="insp:BasisExamination">
                        <tr>
                           <td class="graphMain" style="width:48mm">Основание для досмотра</td>
                           <td align="center" class="normal" colspan="3" style="width:142mm">
                              <xsl:value-of select="insp:BasisExamination"/>
                           </td>
                        </tr>
                     </xsl:if>
                  </tbody>
               </table>
               <table border="0" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td style="width:2mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph10Bold " style="width:93mm">
                                    Цель досмотра:
                                </td>
                        <td align="left" style="width:2mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph10Bold " style="width:93mm">Степень досмотра:</td>
                     </tr>
                     <tr>
                        <xsl:choose>
                           <xsl:when test="(insp:AimInspection/insp:IdentifierGood= 'true') or (insp:AimInspection/insp:IdentifierGood= 't') or (insp:AimInspection/insp:IdentifierGood= '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 1 индентификация товаров</td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:93mm">- 1 индентификация товаров</td>
                           </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                           <xsl:when test="insp:DegreeInspection/insp:Weighing= '1'">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 1 взвешивание (полное)
                                        </td>
                           </xsl:when>
                           <xsl:when test="insp:DegreeInspection/insp:Weighing= '2'">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 1 взвешивание (выборочное)
                                        </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 1 без взвешивания
                                        </td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <td style="width:2mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td style="width:93mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <xsl:choose>
                           <xsl:when test="(insp:DegreeInspection/insp:ConvertingFreightPlace= 'true') or (insp:DegreeInspection/insp:ConvertingFreightPlace= 't') or (insp:DegreeInspection/insp:ConvertingFreightPlace= '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 2 пересчет грузовых мест</td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:93mm">- 2 пересчет грузовых мест</td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <td style="width:2mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td style="width:93mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <xsl:choose>
                           <xsl:when test="(insp:DegreeInspection/insp:ChooseOpening = 'true') or (insp:DegreeInspection/insp:ChooseOpening = 't') or (insp:DegreeInspection/insp:ChooseOpening = '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 2.1 с выборочным вскрытием</td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:93mm">- 2.1 с выборочным вскрытием</td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <xsl:choose>
                           <xsl:when test="(insp:AimInspection/insp:ChooseControl = 'true') or (insp:AimInspection/insp:ChooseControl = 't') or (insp:AimInspection/insp:ChooseControl = '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 2 выборочная проверка</td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:93mm">- 2 выборочная проверка</td>
                           </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                           <xsl:when test="(insp:DegreeInspection/insp:OpeningAllFreightPlace = 'true') or (insp:DegreeInspection/insp:OpeningAllFreightPlace = 't') or (insp:DegreeInspection/insp:OpeningAllFreightPlace = '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 2.2 со вскрытием всех грузовых мест
                                        </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:93mm">- 2.2 со вскрытием всех грузовых мест
                                        </td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <td style="width:2mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td style="width:93mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <xsl:choose>
                           <xsl:when test="(insp:DegreeInspection/insp:ConvertingQuantityObjects = 'true') or (insp:DegreeInspection/insp:ConvertingQuantityObjects = 't') or (insp:DegreeInspection/insp:ConvertingQuantityObjects = '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 3 пересчет количества предметов в
                                            грузовых местах:
                                        </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:93mm">- 3 пересчет количества предметов в
                                            грузовых местах:
                                        </td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <td style="width:2mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td style="width:93mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <xsl:choose>
                           <xsl:when test="(insp:DegreeInspection/insp:Choose = 'true') or (insp:DegreeInspection/insp:Choose = 't') or (insp:DegreeInspection/insp:Choose = '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 3.1 выборочно</td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:93mm">- 3.1 выборочно</td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <xsl:choose>
                           <xsl:when test="(insp:AimInspection/insp:Others= 'true') or (insp:AimInspection/insp:Others= 't') or (insp:AimInspection/insp:Others= '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 3 прочее
                                            <xsl:value-of select="insp:AimInspection/insp:OtherComments"/>
                              </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:93mm">- 3 прочее</td>
                           </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                           <xsl:when test="(insp:DegreeInspection/insp:All = 'true') or (insp:DegreeInspection/insp:All = 't') or (insp:DegreeInspection/insp:All = '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 3.2 во всех</td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:93mm">- 3.2 во всех</td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <td style="width:2mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td style="width:93mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <xsl:choose>
                           <xsl:when test="(insp:DegreeInspection/insp:MeasurementDeterminationBehaviourGoods = 'true') or (insp:DegreeInspection/insp:MeasurementDeterminationBehaviourGoods = 't') or (insp:DegreeInspection/insp:MeasurementDeterminationBehaviourGoods = '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 4 измерение и определение
                                            характеристик товаров
                                        </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:93mm">- 4 измерение и определение
                                            характеристик товаров
                                        </td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <td style="width:2mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph10Bold" style="width:93mm">
                                    Обьем досмотра:
                                </td>
                        <td style="width:2mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graphMain" style="width:93mm">(с частичной разборкой/с полной разборкой):
                                </td>
                     </tr>
                     <tr>
                        <td style="width:2mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td style="width:93mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <xsl:choose>
                           <xsl:when test="(insp:DegreeInspection/insp:WithoutThievingSampling  = 'true') or (insp:DegreeInspection/insp:WithoutThievingSampling  = 't') or (insp:DegreeInspection/insp:WithoutThievingSampling  = '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 4.1 без проб и образцов</td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:93mm">- 4.1 без проб и образцов</td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <xsl:choose>
                           <xsl:when test="(insp:VolumeInspection/insp:Percent10  = 'true') or (insp:VolumeInspection/insp:Percent10  = 't') or (insp:VolumeInspection/insp:Percent10  = '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">
                                 <table border="0" cellspacing="0" style="width:93mm">
                                    <tbody>
                                       <td class="graphMain" style="width:30mm">- 10%</td>
                                       <xsl:choose>
                                          <xsl:when test="(insp:VolumeInspection/insp:Percent50  = 'true') or (insp:VolumeInspection/insp:Percent50  = 't') or (insp:VolumeInspection/insp:Percent50  = '1')">
                                             <td align="left" class="normal2" style="width:2mm">X</td>
                                             <td class="graphMain" style="width:30mm">- 50%</td>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <td class="normal2" style="width:2mm">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td class="graphMain" style="width:30mm">- 50%</td>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                       <xsl:choose>
                                          <xsl:when test="(insp:VolumeInspection/insp:Percent100  = 'true') or (insp:VolumeInspection/insp:Percent100  = 't') or (insp:VolumeInspection/insp:Percent100  = '1')">
                                             <td align="left" class="normal2" style="width:2mm">X</td>
                                             <td class="graphMain" style="width:30mm">- 100%</td>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <td class="normal2" style="width:2mm">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td class="graphMain" style="width:30mm">- 100%</td>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </tbody>
                                 </table>
                              </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:27mm">
                                 <table border="0" cellspacing="0" style="width:93mm">
                                    <tbody>
                                       <td class="graphMain" style="width:30mm">- 10%</td>
                                       <xsl:choose>
                                          <xsl:when test="(insp:VolumeInspection/insp:Percent50  = 'true') or (insp:VolumeInspection/insp:Percent50  = 't') or (insp:VolumeInspection/insp:Percent50  = '1')">
                                             <td align="left" class="normal2" style="width:2mm">X</td>
                                             <td class="graphMain" style="width:30mm">- 50%</td>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <td class="normal2" style="width:2mm">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td class="graphMain" style="width:30mm">- 50%</td>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                       <xsl:choose>
                                          <xsl:when test="(insp:VolumeInspection/insp:Percent100  = 'true') or (insp:VolumeInspection/insp:Percent100  = 't') or (insp:VolumeInspection/insp:Percent100  = '1')">
                                             <td align="left" class="normal2" style="width:2mm">X</td>
                                             <td class="graphMain" style="width:30mm">- 100%</td>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <td class="normal2" style="width:2mm">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td class="graphMain" style="width:30mm">- 100%</td>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </tbody>
                                 </table>
                              </td>
                           </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                           <xsl:when test="(insp:DegreeInspection/insp:WithThievingSampling  = 'true') or (insp:DegreeInspection/insp:WithThievingSampling  = 't') or (insp:DegreeInspection/insp:WithThievingSampling  = '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 4.2 с взятием проб и образцов</td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:93mm">- 4.2 с взятием проб и образцов</td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <td style="width:2mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td style="width:93mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <xsl:choose>
                           <xsl:when test="(insp:DegreeInspection/insp:Others  = 'true') or (insp:DegreeInspection/insp:Others  = 't') or (insp:DegreeInspection/insp:Others  = '1')">
                              <td align="left" class="normal2" style="width:2mm">X</td>
                              <td class="graphMain" style="width:93mm">- 5 прочее
                                            <xsl:value-of select="insp:DegreeInspection/insp:OtherComments"/>
                              </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td class="normal2" style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graphMain" style="width:93mm">- 5 прочее

                                        </td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td style="width:2mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graph10Bold" style="width:188mm">
                                    Применение ТСТК:
                                </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '01'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">-1 досмотровая рентгенотелевизионная техника:
											<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '01']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '01']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '02'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">- 2 флюороскопическая досмотровая техника:
												<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '02']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '02']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '03'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">- 3 инспекционно-досмотровые комплексы:
												<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '03']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '03']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '04'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">- 4 средства поиска:
												<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '04']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '04']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '05'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">- 5 редства нанесения и считывания специальных меток:
												<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '05']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '05']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '06'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">- 6 досмотровый инструмент:
												<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '06']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '06']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '08'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">- 8 технические средства подповерхностного зондирования:
												<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '08']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '08']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '09'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">- 9 технические средства идентификации:
												<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '09']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '09']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '10'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">- 10 химические средства идентификации:
												<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '10']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '10']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '11'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">- 11 технические средства документирования:
												<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '11']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '11']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '12'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">- 12 технические средства контроля носителей аудио- и видеоинформации:
												<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '12']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '12']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '13'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">- 13 технические средства таможенного контроля количественных и качественных показателей лесо- и пиломатериалов:
												<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '13']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '13']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '14'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">- 14 приборы взвешивания:
												<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '14']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '14']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '15'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">- 15 технические средства таможенного контроля делящихся и радиоактивных материалов и обеспечения радиационной безопасности:
												<xsl:if test="insp:ApplicationTSTK[insp:TSTKCode= '15']/insp:Comments">
                              <u>
                                 <xsl:for-each select="insp:ApplicationTSTK[insp:TSTKCode= '15']/insp:Comments">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </u>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" style="width:2mm">[<xsl:if test="insp:ApplicationTSTK/insp:TSTKCode= '16'">X</xsl:if>]</td>
                        <td class="graphMain" style="width:188mm">
																	- 16 без применения технических средств таможенного контроля
																</td>
                     </tr>
                     <xsl:if test="insp:IdentityMeans">
                        <tr>
                           <td class="graph10Bold" colspan="2" style="padding-top: 15pt;">
                                        Применение средств идентификации:
                                        <span class="normal">
                                 <xsl:apply-templates select="insp:IdentityMeans"/>
                                 <xsl:text>.</xsl:text>
                              </span>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td style="width:2mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td style="width:188mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0">
                  <tbody>
                     <tr>
                        <td align="center" class="normal" style="vertical-align: bottom; white-space: nowrap;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="insp:DateCompile"/>
                           </xsl:call-template>
                           <xsl:text> г.</xsl:text>
                        </td>
                        <xsl:if test="insp:CustomsPresonDecision">
                           <td align="center" class="normal" style="vertical-align: bottom;">
                              <xsl:value-of select="insp:CustomsPresonDecision/cat_ru:PersonName"/>
                              <span class="graphMain">, ЛНП: </span>
                              <xsl:value-of select="insp:CustomsPresonDecision/cat_ru:LNP"/>
                           </td>
                        </xsl:if>
                        <xsl:if test="insp:CustomsChief">
                           <td align="center" class="normal" style="vertical-align: bottom;">
                              <xsl:value-of select="insp:CustomsChief/cat_ru:PersonName"/>
                              <span class="graphMain">, ЛНП: </span>
                              <xsl:value-of select="insp:CustomsChief/cat_ru:LNP"/>
                           </td>
                        </xsl:if>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle">
                                    Дата
                                </td>
                        <td align="center" class="graphLittle">Подпись, инициалы, фамилия должностного лица,оформившего поручение(принявшего решение) о проведении таможенного досмотра)</td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2">
                                    Время выдачи поручения
                                    <xsl:call-template name="russian_time">
                              <xsl:with-param name="timeIn" select="insp:TimeDeliveryInspection"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2">
                                    Время получения акта
                                    <xsl:call-template name="russian_time">
                              <xsl:with-param name="timeIn" select="insp:TimeReceiptAct"/>
                           </xsl:call-template>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="insp:DateReceiptAct"/>
                           </xsl:call-template>
                                    г.
                                </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="insp:IdentityMeans">
      <xsl:if test="position() > 1">
         <xsl:text>; </xsl:text>
      </xsl:if>
      <xsl:choose>
         <xsl:when test="insp:Kind = 1">
            <xsl:text>пломба: </xsl:text>
         </xsl:when>
         <xsl:when test="insp:Kind = 2">
            <xsl:text>печать: </xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>иное: </xsl:text>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="insp:Quantity"/>
      <xsl:text> шт</xsl:text>
      <!--xsl:if test="insp:Description">
            <xsl:text>, </xsl:text>
            <xsl:value-of select="insp:Description"/>
        </xsl:if-->
   </xsl:template>
</xsl:stylesheet>
