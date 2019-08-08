<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:dqdrd="urn:customs.ru:Information:CustomsDocuments:DetailQuotDataRD:5.11.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="dqdrd:DetailQuotaDataRD">
      <html>
         <head>
            <title>Сведения по квотируемому документу</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 297mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.bold2{
							font-weight: bold;
							font-family:Arial;
							font-size: 12pt; 
							}
							.normal2{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt;
							}
							
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;

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
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}
						table{
							border-collapse: collapse;
						}		
					</style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:280mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graph" colspan="2" style="width:280mm">
									Номер и серия бланка <xsl:value-of select="dqdrd:PaperCarrier/dqdrd:FormSeries"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="dqdrd:PaperCarrier/dqdrd:FormNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" colspan="2" style="width:280mm">
								дата печати 
								<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="dqdrd:PaperCarrier/dqdrd:FormPrintDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="bold2" colspan="2" style="width:280mm">	
								Сведения по квотируемому документу<br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="bold2" colspan="2" style="width:280mm">
								№ 
								<span class="normal">
                              <xsl:value-of select="dqdrd:DocumentNumber"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" colspan="2" style="width:280mm">
                           <span class="bold">  Контракт: </span>
                           <xsl:value-of select="dqdrd:ConNumber"/>
                           <xsl:text> дата подписания:</xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="dqdrd:ConDateSignature"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" colspan="2" style="width:280mm">
                           <span class="bold"> Лицензия: </span>
                           <xsl:value-of select="dqdrd:LicenseKind"/>
                           <xsl:text> срок действия </xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="dqdrd:LicenseTerm"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" colspan="2" style="width:280mm">
                           <table>
                              <tbody>
                                 <tr>
                                    <td style="width:18mm">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="left" class="graph" style="width:262mm">
                                       <span class="bold">Cтатус лицензии: </span>
                                       <xsl:value-of select="dqdrd:LicenseStatusCode"/>, 
								<xsl:value-of select="dqdrd:LicenseStatus"/>
                                       <xsl:text> </xsl:text>
                                       <span class="bold">дата установления:</span>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="dqdrd:LicenseStatusDate"/>
                                       </xsl:call-template>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" colspan="2" style="width:280mm">
                           <xsl:if test="dqdrd:CustomsOriginalLicense">
                              <span class="bold">Таможенного органа (оригинала лицензии):  </span>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="dqdrd:CustomsOriginalLicense/cat_ru:OfficeName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <xsl:if test="dqdrd:CustomsCopyLicense">
                        <tr>
                           <td align="left" class="graph" style="width:80mm">
                              <span class="bold">	 Таможенного органа (копии лицензии):  </span>
                           </td>
                           <td align="left" class="graph" style="width:200mm">
                              <xsl:for-each select="dqdrd:CustomsCopyLicense">
                                 <xsl:value-of select="cat_ru:OfficeName"/>
                                 <br/>
                              </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="left" class="graph" colspan="2" style="width:280mm">
                           <span class="bold"> Направление перемещения: </span>
                           <xsl:value-of select="dqdrd:Movement"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" colspan="2" style="width:280mm">
                           <span class="bold"> Категория квоты </span>
                           <xsl:value-of select="dqdrd:QuotaCategoryCode"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" colspan="2" style="width:280mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:280mm;">
                           <span class="bold">Владелец (заявитель): </span>
                           <xsl:apply-templates select="dqdrd:OwnersLicense/dqdrd:OrganizationName"/>
                           <xsl:if test="dqdrd:OwnersLicense/dqdrd:OGRN">
                              <span class="graphMain"> ОГРН:</span>
                              <xsl:value-of select="dqdrd:OwnersLicense/dqdrd:OGRN"/>
                           </xsl:if>
                           <xsl:if test="dqdrd:OwnersLicense/dqdrd:INN">
                              <span class="graphMain"> ИНН:</span>
                              <xsl:value-of select="dqdrd:OwnersLicense/dqdrd:INN"/>
                           </xsl:if>
                           <xsl:if test="dqdrd:OwnersLicense/dqdrd:KPP">
                              <span class="graphMain"> КПП:</span>
                              <xsl:value-of select="dqdrd:OwnersLicense/dqdrd:KPP"/>
                           </xsl:if>
                           <xsl:if test="dqdrd:OwnersLicense/dqdrd:OKPOID">
                              <span class="graphMain"> ОКПО:</span>
                              <xsl:value-of select="dqdrd:OwnersLicense/dqdrd:OKPOID"/>
                           </xsl:if>
                           <xsl:if test="dqdrd:OwnersLicense/dqdrd:ITN">
                              <span class="graphMain"> ИТН:</span>
                              <xsl:value-of select="dqdrd:OwnersLicense/dqdrd:ITN"/>
                           </xsl:if>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:280mm;">
                           <span class="bold">Адрес: </span>
                           <xsl:if test="dqdrd:OwnersLicense/dqdrd:LegalAddress">
                              <span class="graphMain"/>
                              <xsl:value-of select="dqdrd:OwnersLicense/dqdrd:LegalAddress"/>
                           </xsl:if>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:280mm;">
                           <span class="bold">Покупатель (продавец): </span>
                           <xsl:apply-templates select="dqdrd:OrganizationInfo/dqdrd:OrganizationName"/>
                           <!--xsl:if test="dqdrd:OrganizationInfo/dqdrd:OGRN">
                              <span class="graphMain"> ОГРН:</span>
                              <xsl:value-of select="dqdrd:OrganizationInfo/dqdrd:OGRN"/>
                           </xsl:if>
                           <xsl:if test="dqdrd:OrganizationInfo/dqdrd:INN">
                              <span class="graphMain"> ИНН:</span>
                              <xsl:value-of select="dqdrd:OrganizationInfo/dqdrd:INN"/>
                           </xsl:if>
                           <xsl:if test="dqdrd:OrganizationInfo/dqdrd:KPP">
                              <span class="graphMain"> КПП:</span>
                              <xsl:value-of select="dqdrd:OrganizationInfo/dqdrd:KPP"/>
                           </xsl:if>
                           <xsl:if test="dqdrd:OrganizationInfo/dqdrd:OKPOID">
                              <span class="graphMain"> ОКПО:</span>
                              <xsl:value-of select="dqdrd:OrganizationInfo/dqdrd:OKPOID"/>
                           </xsl:if>
                           <xsl:if test="dqdrd:OrganizationInfo/dqdrd:ITN">
                              <span class="graphMain"> ИТН:</span>
                              <xsl:value-of select="dqdrd:OrganizationInfo/dqdrd:ITN"/>
                           </xsl:if-->
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:280mm;">
                           <span class="bold">Адрес: </span>
                           <xsl:if test="dqdrd:OrganizationInfo/dqdrd:Address">
                              <span class="graphMain"/>
                              <xsl:value-of select="dqdrd:OrganizationInfo/dqdrd:Address"/>
                           </xsl:if>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" colspan="2" style="width:280mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1">
                  <tbody>
                     <tr>
                        <td align="center" class="bold" rowspan="2" style="width:23mm;">Код товара</td>
                        <td align="center" class="bold" rowspan="2" style="width:23mm;">Код ТНВЭД</td>
                        <td align="center" class="bold" colspan="4" style="width:140mm;">Наименование</td>
                        <td align="center" class="bold" rowspan="2" style="width:20mm;">Код страны происхождения</td>
                        <td align="center" class="bold" colspan="2" style="width:20mm;">Квота
							<span class="graphMain">	(<xsl:value-of select="dqdrd:GoodsInfo/dqdrd:QuantitativeCharact/cat_ru:MeasureUnitQualifierName"/>)</span>
                        </td>
                        <td align="center" class="bold" rowspan="2" style="width:20mm;">Фасовка</td>
                        <td align="center" class="bold" rowspan="2" style="width:20mm;">Кол-во упаковок</td>
                        <td align="center" class="bold" colspan="2" style="width:40mm;">Стоимость
								<span class="graphMain">
                              <xsl:if test="dqdrd:GoodsInfo/dqdrd:QuantitativeCharact/dqdrd:CurrencyCode">(<xsl:value-of select="dqdrd:GoodsInfo/dqdrd:QuantitativeCharact/dqdrd:CurrencyCode"/>) </xsl:if>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="bold" style="width:35mm;">Описание товара</td>
                        <td align="center" class="bold" style="width:35mm;">Торговое наименование</td>
                        <td align="center" class="bold" style="width:35mm;">Международное наименование</td>
                        <td align="center" class="bold" style="width:35mm;">Наименование изготовителя</td>
                        <td align="center" class="bold" style="width:35mm;">Начальное знач.</td>
                        <td align="center" class="bold" style="width:35mm;">Конечное знач.</td>
                        <td align="center" class="bold" style="width:20mm;">Статическая</td>
                        <td align="center" class="bold" style="width:20mm;">Фактурная</td>
                     </tr>
                     <xsl:for-each select="dqdrd:GoodsInfo">
                        <tr>
                           <td align="center" class="graphMain" style="width:23mm;">
                              <xsl:value-of select="dqdrd:GoodsCategoryCode"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:23mm;">
                              <xsl:value-of select="dqdrd:GoodsTNVED"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:35mm;">
                              <xsl:value-of select="dqdrd:GoodsDescription"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:35mm;">
                              <xsl:value-of select="dqdrd:CommercialName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:35mm;">
                              <xsl:value-of select="dqdrd:InternationalName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:35mm;">
                              <xsl:value-of select="dqdrd:ProducerName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:20mm;">
                              <xsl:value-of select="dqdrd:OriginCountryCode"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:20mm;">
                              <xsl:value-of select="dqdrd:QuantitativeCharact/cat_ru:GoodsQuantity"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:20mm;">
                              <xsl:value-of select="dqdrd:QuantitativeCharact/dqdrd:RestQuota"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:20mm;">
                              <xsl:value-of select="dqdrd:QuantitativeCharact/dqdrd:Packing"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:20mm;">
                              <xsl:value-of select="dqdrd:QuantitativeCharact/dqdrd:QuantityPacking"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:20mm;">
                              <xsl:value-of select="dqdrd:QuantitativeCharact/dqdrd:StatisticalCost"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:20mm;">
                              <xsl:value-of select="dqdrd:QuantitativeCharact/dqdrd:Invoice"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <table>
                  <tbody>
                     <tr>
                        <td align="center" colspan="2" style="width:280mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:200mm;">Документ выдан: <xsl:value-of select="dqdrd:AgencyIssuedDoc/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="dqdrd:AgencyIssuedDoc/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="dqdrd:AgencyIssuedDoc/cat_ru:PersonMiddleName"/> / <xsl:value-of select="dqdrd:AgencyIssuedDoc/cat_ru:PersonPost"/>/, дата: 	<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="dqdrd:AgencyIssuedDoc/cat_ru:IssueDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
