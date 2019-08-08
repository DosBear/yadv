<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="ceru cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ceru="urn:customs.ru:Information:CustomsDocuments:CustExpertResult:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template match="ceru:CustExpertResult">
      <html>
         <head>
            <title>Сведения по результатам проведенной таможенной экспертизы</title>
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
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
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
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}	
                </style>
         </head>
         <body>
            <div class="page">
               <h3>СВЕДЕНИЯ</h3>
               <h4>по результатам проведенной таможенной экспертизы</h4>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain" style="width:50mm">
                           <xsl:value-of select="ceru:CustomsName"/>
                        </td>
                        <td align="right" class="graphMain" style="width:140mm">
                           <xsl:text> ЦЭКТУ, экспертно-криминалистическая служба – региональный филиал ЦЭКТУ </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2">
                           <xsl:text> По результатам экспертизы от </xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ceru:Expert/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                           <xsl:text> № </xsl:text>
                           <xsl:value-of select="ceru:Expert/cat_ru:PrDocumentNumber"/>
                           <xsl:text> , проведенной при таможенном контроле № </xsl:text>
                           <xsl:value-of select="ceru:ControlNumber"/>
                           <xsl:text> ДТ </xsl:text>
                           <xsl:value-of select="ceru:GTDID/cat_ru:CustomsCode"/>
                           <xsl:text>/</xsl:text>
                           <xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="ceru:GTDID/cat_ru:RegistrationDate"/>
                           </xsl:call-template>
                           <xsl:text>/</xsl:text>
                           <xsl:value-of select="ceru:GTDID/cat_ru:GTDNumber"/>
                           <xsl:text> , дела об административном правонарушении №  </xsl:text>
                           <xsl:value-of select="ceru:AdminInfractionNumber"/>
                           <xsl:text> , уголовного дела №    </xsl:text>
                           <xsl:value-of select="ceru:CriminalCaseNumber"/>
                           <xsl:text> , другие случаи    </xsl:text>
                           <xsl:value-of select="ceru:OtherCases"/>
                           <xsl:text> , в отношении товара (объекта) принято решение </xsl:text>
                           <xsl:for-each select="ceru:Decision">
                              <xsl:value-of select="."/>
                              <xsl:text> </xsl:text>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text>1. Полученный экономический эффект составил: </xsl:text>
                           <br/>
                           <xsl:text>1.1. Дополнительно начислено: </xsl:text>
                           <xsl:for-each select="ceru:RecEconomicEffect">
                              <xsl:choose>
                                 <xsl:when test="ceru:EconomicEffect=1">
                                    <br/>
                                    <xsl:text> таможенных пошлин   </xsl:text>
                                    <xsl:value-of select="ceru:SumWords"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:SumNumber"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:CurrencyCode"/>
                                 </xsl:when>
                                 <xsl:when test="ceru:EconomicEffect=2">
                                    <br/>
                                    <xsl:text> НДС   </xsl:text>
                                    <xsl:value-of select="ceru:SumWords"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:SumNumber"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:CurrencyCode"/>
                                 </xsl:when>
                                 <xsl:when test="ceru:EconomicEffect=3">
                                    <br/>
                                    <xsl:text> акцизов   </xsl:text>
                                    <xsl:value-of select="ceru:SumWords"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:SumNumber"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:CurrencyCode"/>
                                 </xsl:when>
                                 <xsl:when test="ceru:EconomicEffect=4">
                                    <br/>
                                    <xsl:text> штрафов   </xsl:text>
                                    <xsl:value-of select="ceru:SumWords"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:SumNumber"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:CurrencyCode"/>
                                 </xsl:when>
                                 <xsl:when test="ceru:EconomicEffect=5">
                                    <br/>
                                    <xsl:text> сумм денежных средств, вырученных от реализации товаров, обращенных в федеральную собственность     </xsl:text>
                                    <xsl:value-of select="ceru:SumWords"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:SumNumber"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:CurrencyCode"/>
                                 </xsl:when>
                              </xsl:choose>
                           </xsl:for-each>
                           <xsl:if test="ceru:RecEconomicEffect/ceru:EconomicEffect=6">
                              <br/>
                              <xsl:text> 1.2. Конфисковано товаров на сумму      </xsl:text>
                              <xsl:value-of select="ceru:RecEconomicEffect/ceru:SumWords"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="ceru:RecEconomicEffect/ceru:SumNumber"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="ceru:RecEconomicEffect/ceru:CurrencyCode"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text>2. Условный экономический эффект составил: </xsl:text>
                           <br/>
                           <xsl:for-each select="ceru:ConventionalEconomicEffect">
                              <xsl:choose>
                                 <xsl:when test="ceru:Section=1">
                                    <br/>
                                    <xsl:text> 2.1. Стоимость изъятых товаров, оборот которых запрещен:     </xsl:text>
                                    <xsl:value-of select="ceru:SumWords"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:SumNumber"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:CurrencyCode"/>
                                 </xsl:when>
                                 <xsl:when test="ceru:Section=2">
                                    <br/>
                                    <xsl:text> 2.2. Вес наркотических средств (по каждому виду)   </xsl:text>
                                    <xsl:value-of select="ceru:QuantityDrug"/>
                                 </xsl:when>
                                 <xsl:when test="ceru:Section=3">
                                    <br/>
                                    <xsl:text> 2.3. Стоимость некачественных и фальсифицированных товаров (по каждому виду), ввоз (вывоз) которых на (с) территорию Таможенного союза запрещен     </xsl:text>
                                    <xsl:value-of select="ceru:SumWords"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:SumNumber"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:CurrencyCode"/>
                                 </xsl:when>
                                 <xsl:when test="ceru:Section=4">
                                    <br/>
                                    <xsl:text> 2.4. Стоимость запрещенных (ограниченных) к ввозу/вывозу товаров   </xsl:text>
                                    <xsl:value-of select="ceru:SumWords"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:SumNumber"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="ceru:CurrencyCode"/>
                                 </xsl:when>
                              </xsl:choose>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:190mm">
                           <table border="0" cellpadding="0" cellspacing="0" style="width:190mm">
                              <tbody>
                                 <tr>
                                    <td align="left" class="graphMain" style="width:50mm">
                                       <xsl:text> Должностное лицо таможенного органа </xsl:text>
                                    </td>
                                    <td align="right" class="graphMain" style="width:140mm">
                                       <xsl:value-of select="ceru:CustomsPerson/cat_ru:PersonName"/>
                                       <xsl:text> (инициалы, фамилия) </xsl:text>
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
