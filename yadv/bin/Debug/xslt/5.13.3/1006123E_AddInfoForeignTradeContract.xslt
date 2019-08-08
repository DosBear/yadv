<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:aiftc="urn:customs.ru:Information:CustomsDocuments:AddInfoForeignTradeContract:5.12.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="aiftc:AddInfoForeignTradeContract ">
      <html>
         <head>
            <title>Дополнительные сведения по внешнеторговым контрактам.</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                    text-align: center;
                    background: #cccccc;
                    }
	.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
                    div.page {
                    width: {210*$k}mm;
                    height: {297*$k}mm;
                    margin-top: 6pt;
                    margin-bottom: 6pt;
                    padding: 10mm;
                    padding-left: 10mm;
                    background: #ffffff;
                    border: solid 1pt #000000;
                    }

                    div.goods {
                    background: #ffffff;
                    }

                    .bordered {
                    border: solid 1pt #000000;
                    padding-top:4pt;
                    padding-bottom:4pt;
                    font-family: Arial;
                    font-size: 9pt;
                    font-weight: bold;
                    }

                    .underlined {
                    border-bottom: solid 0.8pt #000000;
                    }

                    p.NumberDate {
                    font-weight: bold;
                    }

                    .graph {
                    font-family: Arial;
                    font-size: 7pt;
                    }
                    .graphColumn {
                    font-family: Arial;
                    font-size: 6.5pt;
                    }
                    .graphTitleIt {
                    font-family: Arial;
                    font-size: 7pt;
                    font-weight: italian;
                    }
                    td {
                    font-family:Courier;
                    }

                    .graphMain {
                    font-family: Arial;
                    font-size: 9pt;
                    font-weight: bold;
                    }

                    .graphNum {
                    font-family: Arial;
                    font-size: 7pt;
                    font-weight: bold;
                    }
.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
                    .graphNo {
                    font-size: 7pt;
                    font-weight: bold;
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <table cellpadding="0" cellspacing="0" style="width:190mm;border:solid 0pt #000000;">
                  <tbody>
                     <tr>
                        <td align="right" class="graphMain" colspan="3"> ДТ №
							<xsl:value-of select="aiftc:GtdRegNumber/cat_ru:CustomsCode"/>/
							<xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="aiftc:GtdRegNumber/cat_ru:RegistrationDate"/>
                           </xsl:call-template>/
							<xsl:value-of select="aiftc:GtdRegNumber/cat_ru:GTDNumber"/>
                        </td>
                     </tr>
                     <xsl:for-each select="aiftc:Goods">
                        <tr>
                           <td>Номер товара по ДТ
							<xsl:value-of select="aiftc:GoodsNumeric"/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" colspan="6" style="width:190mm;border:solid 0.8pt #000000;">
                              <table cellpadding="0" cellspacing="0" style="width:100%;">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">Паспорт сделки
                                                            </td>
                                       <td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">Контракт, приложения
                                                            </td>
                                       <td align="center" class="graph" style="width:35mm;border:solid 0.8pt #000000;">Отправитель / Получатель
                                                            </td>
                                       <td align="center" class="graph" style="width:35mm;border:solid 0.8pt #000000;">Получатель
                                                            </td>
                                       <td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">Условия поставки
                                                            </td>
                                       <td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">Страна происхождения
                                                            </td>
                                       <td align="center" class="graph" style="width:10mm;border:solid 0.8pt #000000;">Количество
                                                            </td>
                                       <td align="center" class="graph" style="width:15mm;border:solid 0.8pt #000000;">Валюта
                                                            </td>
                                       <td align="center" class="graph" style="width:15mm;border:solid 0.8pt #000000;">Стоимость
                                                            </td>
                                    </tr>
                                    <xsl:for-each select="aiftc:ContractList">
                                       <tr>
                                          <td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">
                                             <xsl:value-of select="catESAD_cu:DealPassportNumber"/>
                                          </td>
                                          <td class="graph" style="width:20mm;border:solid 0.8pt #000000;">
                                             <xsl:value-of select="catESAD_cu:ContractNumber"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="catESAD_cu:ContractDate"/>
                                             </xsl:call-template>
                                             <xsl:for-each select="catESAD_cu:AdditionalContract">
                                                <br/>
                                                <xsl:value-of select="cat_ru:PrDocumentName"/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:call-template name="russian_date">
                                                   <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                                </xsl:call-template>
                                             </xsl:for-each>
                                          </td>
                                          <td class="graph" colspan="7" style="width:150mm;border:solid 0.8pt #000000;">
                                             <table cellpadding="0" cellspacing="0">
                                                <tbody>
                                                   <xsl:for-each select="catESAD_cu:SupplyInformations">
                                                      <tr>
                                                         <td class="graph" style="width:35mm;border:solid 0.8pt #000000;">
                                                            <xsl:value-of select="catESAD_cu:SupplyConsignor/cat_ru:OrganizationName"/>
                                                            <span class="graph">(</span>
                                                            <xsl:value-of select="catESAD_cu:SupplyConsignor/cat_ru:ShortName"/>
                                                            <span class="graph">)</span>
                                                            <xsl:if test="catESAD_cu:SupplyConsignor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                                               <span class="graph">№</span>
                                                               <xsl:value-of select="catESAD_cu:SupplyConsignor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                                            </xsl:if>
                                                            <br/>
                                                            <xsl:if test="catESAD_cu:SupplyConsignor/catESAD_cu:CountryCode">
                                                               <xsl:value-of select="catESAD_cu:SupplyConsignor/catESAD_cu:CountryCode"/>
                                                               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            </xsl:if>
                                                            <xsl:if test="(catESAD_cu:SupplyConsignor/cat_ru:RFOrganizationFeatures/cat_ru:INN) or (catESAD_cu:SupplyConsignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP)">
                                                               <br/>
                                                               <span class="graph">№</span>
                                                               <xsl:value-of select="catESAD_cu:SupplyConsignor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                                               <xsl:if test="catESAD_cu:SupplyConsignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                                                                  <xsl:text> / </xsl:text>
                                                                  <xsl:value-of select="catESAD_cu:SupplyConsignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                                               </xsl:if>
                                                            </xsl:if>
                                                         </td>
                                                         <td class="graph" style="width:35mm;border:solid 0.8pt #000000;">
                                                            <xsl:value-of select="catESAD_cu:SupplyConsignee/cat_ru:OrganizationName"/>
                                                            <span class="graph">(</span>
                                                            <xsl:value-of select="catESAD_cu:SupplyConsignee/cat_ru:ShortName"/>
                                                            <span class="graph">)</span>
                                                            <xsl:if test="catESAD_cu:SupplyConsignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                                               <span class="graph">№</span>
                                                               <xsl:value-of select="catESAD_cu:SupplyConsignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                                            </xsl:if>
                                                            <br/>
                                                            <xsl:value-of select="catESAD_cu:SupplyConsignee/catESAD_cu:CountryCode"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:if test="(catESAD_cu:SupplyConsignee/cat_ru:RFOrganizationFeatures/cat_ru:INN) or (catESAD_cu:SupplyConsignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP)">
                                                               <br/>
                                                               <span class="graph">№</span>
                                                               <xsl:value-of select="catESAD_cu:SupplyConsignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                                               <xsl:if test="catESAD_cu:SupplyConsignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                                                                  <xsl:text> / </xsl:text>
                                                                  <xsl:value-of select="catESAD_cu:SupplyConsignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                                                               </xsl:if>
                                                            </xsl:if>
                                                         </td>
                                                         <td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">
                                                            <xsl:value-of select="catESAD_cu:DeliveryTerms/cat_ru:DeliveryTermsStringCode"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:for-each select="catESAD_cu:DeliveryTerms/cat_ru:DeliveryPlace">
                                                               <xsl:value-of select="."/>
                                                               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            </xsl:for-each>
                                                         </td>
                                                         <td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:value-of select="catESAD_cu:OriginCountryName"/>
                                                         </td>
                                                         <td align="center" class="graph" style="width:10mm;border:solid 0.8pt #000000;">
                                                            <xsl:value-of select="catESAD_cu:GoodsQuantity/cat_ru:GoodsQuantity"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:value-of select="catESAD_cu:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <xsl:value-of select="catESAD_cu:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
                                                         </td>
                                                         <td align="center" class="graph" style="width:15mm;border:solid 0.8pt #000000;">
                                                            <!--xsl:value-of select="catESAD_cu:Price"/>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text-->
                                                            <xsl:value-of select="catESAD_cu:ContractCurrencyCode"/>
                                                         </td>
                                                         <td align="center" class="graph" style="width:15mm;border:solid 0.8pt #000000;">
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                            <!--<xsl:value-of select="catESAD_ru:InvoicedCost"/>-->
                                                            <xsl:value-of select="catESAD_cu:CustomsCost"/>
                                                         </td>
                                                      </tr>
                                                   </xsl:for-each>
                                                </tbody>
                                             </table>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td align="center" class="normal" style="width:50mm">
                           <xsl:value-of select="aiftc:DeclarantSignature/cat_ru:PersonSurname"/> 
									<xsl:value-of select="aiftc:DeclarantSignature/cat_ru:PersonName"/> 
									<xsl:value-of select="aiftc:DeclarantSignature/cat_ru:PersonMiddleName"/>
                           <xsl:if test="aiftc:DeclarantSignature/cat_ru:PersonPost">/
									<xsl:value-of select="aiftc:DeclarantSignature/cat_ru:PersonPost"/>/
									</xsl:if>
                        </td>
                        <td colspan="2" style="width:100mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:50mm">
								(ФИО, должность лица составившего ДТ)
								</td>
                        <td colspan="2" style="width:140mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" style="width:50mm">
                           <xsl:value-of select="aiftc:CustomsPerson/cat_ru:PersonName"/>
                        </td>
                        <td style="width:100mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal" style="width:40mm">ЛНП:
								<xsl:value-of select="aiftc:CustomsPerson/cat_ru:LNP"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:50mm">
								(фамилия, инициалы должностного лица таможенного органа)
								</td>
                        <td colspan="2" style="width:140mm">
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
