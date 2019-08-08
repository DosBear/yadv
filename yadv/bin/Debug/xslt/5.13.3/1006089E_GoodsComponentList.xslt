<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gcl="urn:customs.ru:Information:CustomsDocuments:GoodsComponentList:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
            <xsl:value-of select="substring($timeIn,1,2)"/> ч <xsl:value-of select="substring($timeIn,4,2)"/> мин
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
   <xsl:variable name="formName"/>
   <xsl:template match="gcl:GoodsComponentList">
      <html>
         <head>
            <title>Поставка компонентами - Список компонентов</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
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
               <h2>Список компонентов</h2>
               <h3>ДТ № 
									<xsl:value-of select="gcl:GTDID/cat_ru:CustomsCode"/> /	
								
								
									<xsl:call-template name="russian_date2">
                     <xsl:with-param name="dateIn" select="gcl:GTDID/cat_ru:RegistrationDate"/>
                  </xsl:call-template>/
								
								<xsl:value-of select="gcl:GTDID/cat_ru:GTDNumber"/>
               </h3>
               <table border="1" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" class="graph" style="width:10mm">№ товара</td>
                        <td align="center" class="graph" style="width:10mm">№ товара в итоговой декларации</td>
                        <td align="center" class="graph" style="width:40mm">Наименование товара</td>
                        <td align="center" class="graph" style="width:20mm">Код ТН ВЭД</td>
                        <td align="center" class="graph" style="width:20mm">Количество</td>
                        <td align="center" class="graph" style="width:20mm">Ед. изм.</td>
                        <td align="center" class="graph" style="width:20mm">Вес нетто(кг)</td>
                        <td align="center" class="graph" style="width:20mm">Цена товара</td>
                        <td align="center" class="graph" style="width:20mm">Служебный номер компонента</td>
                        <td align="center" class="graph" style="width:20mm">Сборочный номер компонента</td>
                     </tr>
                     <xsl:for-each select="gcl:ComponentsList/gcl:MechanismUnit">
                        <tr>
                           <td align="center" class="graphMain" style="width:10mm">
                              <xsl:value-of select="position()"/>.
							</td>
						   <td align="center" class="graphMain" style="width:10mm">
                              <xsl:value-of select="../gcl:GoodsNumeric"/>
							</td>
                           <td align="center" class="graphMain" style="width:40mm">
                              <xsl:value-of select="gcl:UnitDescription"/>
                           </td>
                           <td align="center" class="graphMain" style="width:20mm">
                              <xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/>
                           </td>
                           <td align="center" class="graphMain" style="width:30mm">
                              <xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
                           </td>
                           <td align="center" class="graphMain" style="width:30mm">
                              <xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
							(<xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)
							</td>
                           <td align="center" class="graphMain" style="width:30mm">
                              <xsl:value-of select="catESAD_cu:KGWeight"/>
                           </td>
                           <td align="center" class="graphMain" style="width:30mm">
                              <xsl:value-of select="catESAD_cu:InvoicedCost"/>
							(<xsl:value-of select="catESAD_cu:InvoiceCurrencyCode"/>)
							</td>
							<td align="center" class="graph" style="width:20mm"></td>
							<td align="center" class="graph" style="width:20mm"></td>
                        </tr>
                        <xsl:for-each select="gcl:MechUnitPart">
                           <tr>
                              <td align="center" class="graphMain" style="width:10mm">
                                 <xsl:number count="gcl:MechanismUnit|gcl:MechUnitPart" format="1.1 " level="multiple"/>
                              </td>
                              <td></td>
                              <td align="center" class="graphMain" style="width:40mm">
                                 <xsl:value-of select="catESAD_cu:PartDescription"/>
                              </td>
                              <td align="center" class="graphMain" style="width:20mm">
                                 <xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/>
                              </td>
                              <td align="center" class="graphMain" style="width:30mm">
                                 <xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
                              </td>
                              <td align="center" class="graphMain" style="width:30mm">
                                 <xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
							(<xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)
							</td>
                              <td align="center" class="graphMain" style="width:30mm">
                                 <xsl:value-of select="catESAD_cu:KGWeight"/>
                              </td>
                              <td align="center" class="graphMain" style="width:30mm">
                                 <xsl:value-of select="catESAD_cu:InvoicedCost"/>
							(<xsl:value-of select="catESAD_cu:InvoiceCurrencyCode"/>)
							</td>
							<td align="center" class="graph" style="width:20mm"><xsl:value-of select="gcl:ServiceID"/></td>
							<td align="center" class="graph" style="width:20mm"><xsl:value-of select="gcl:ComponentNumber"/></td>
                           </tr>
                        </xsl:for-each>
                     </xsl:for-each>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
