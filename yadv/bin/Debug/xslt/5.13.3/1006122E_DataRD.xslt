<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:drd="urn:customs.ru:Information:CustomsDocuments:DateRD:5.10.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="drd:DataRD">
      <html>
         <head>
            <title>Перечень разрешительных документов</title>
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
					</style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:280mm">
                  <tbody>
                     <tr>
                        <td align="center" class="bold2" colspan="2" style="width:280mm">	
								Перечень разрешительных документов<br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="bold2" colspan="2" style="width:280mm">
								№ 
								<span class="normal">
                              <xsl:value-of select="drd:DocumentNumber"/>
                           </span>
                           <xsl:if test="drd:IssueDate"> от <span class="normal">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="drd:IssueDate"/>
                                 </xsl:call-template>
                              </span>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="bold" colspan="2" style="width:280mm">
								Код документа: <span class="graphMain">
                              <xsl:value-of select="drd:DocumentCode"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <xsl:if test="drd:Quota">
                           <td align="left" class="bold" colspan="2" style="width:280mm">
								Квотируемые документы
								</td>
                        </xsl:if>
                     </tr>
                     <tr>
                        <xsl:if test="drd:NotQuota">
                           <td align="left" class="bold" colspan="2" style="width:280mm">
								Неквотируемые документы
								</td>
                        </xsl:if>
                     </tr>
                  </tbody>
               </table>
               <xsl:if test="drd:Quota">
                  <table border="1" style="width:280mm">
                     <tbody>
                        <tr>
                           <td align="center" class="graphMain" rowspan="2" style="width:50mm;">
								Номер и серия бланка</td>
                           <td align="center" class="graphMain" colspan="2" style="width:60mm;">
								Контракт</td>
                           <td align="center" class="graphMain" rowspan="2" style="width:50mm;">
								Наименование  владельца лицензии</td>
                           <td align="center" class="graphMain" rowspan="2" style="width:50mm;">
								Наименование продавца (покупателя)</td>
                           <td align="center" class="graphMain" rowspan="2" style="width:30mm;">
								Код ТНВЭД</td>
                           <td align="center" class="graphMain" rowspan="2" style="width:50mm;">
								Описание (наименование) товара</td>
                        </tr>
                        <tr>
                           <td align="center" class="graphMain" style="width:30mm;">
								Номер</td>
                           <td align="center" class="graphMain" style="width:30mm;">
								Дата</td>
                        </tr>
                        <xsl:for-each select="drd:Quota">
                           <tr>
                              <td align="center" class="graphMain" style="width:50mm;">
                                 <xsl:value-of select="drd:SeriesForm"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="drd:FormNumber"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="graphMain" style="width:30mm;">
                                 <xsl:value-of select="drd:ConNumber"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="graphMain" style="width:30mm;">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="drd:ConDateSignature"/>
                                 </xsl:call-template>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="graphMain" style="width:50mm;">
                                 <xsl:value-of select="drd:OwnersLicense"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="graphMain" style="width:50mm;">
                                 <xsl:value-of select="drd:OrganizationName"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="graphMain" style="width:30mm;">
                                 <xsl:value-of select="drd:GoodsTNVED"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td align="center" class="graphMain" style="width:50mm;">
                                 <xsl:value-of select="drd:GoodsDescription"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <xsl:if test="drd:NotQuota">
                  <table border="1" style="width:280mm">
                     <tbody>
                        <tr>
                           <td align="center" class="graphMain" style="width:50mm;">
								Номер бланка</td>
                           <td align="center" class="graphMain" style="width:65mm;">
								Наименование фирмы изготовителя</td>
                           <td align="center" class="graphMain" style="width:65mm;">
								Наименование фирмы получателя</td>
                           <td align="center" class="graphMain" style="width:100mm;">
								Наименование продукции</td>
                        </tr>
                        <xsl:for-each select="drd:NotQuota">
                           <tr>
                              <td align="center" class="graphMain" style="width:50mm;">
                                 <xsl:value-of select="drd:FormNumber"/>
                              </td>
                              <td align="center" class="graphMain" style="width:65mm;">
                                 <xsl:for-each select="drd:ManufacturerName">
                                    <xsl:value-of select="drd:Text"/>
                                 </xsl:for-each>
                              </td>
                              <td align="center" class="graphMain" style="width:65mm;">
                                 <xsl:for-each select="drd:ReceiverName">
                                    <xsl:value-of select="drd:Text"/>
                                 </xsl:for-each>
                              </td>
                              <td align="center" class="graphMain" style="width:100mm;">
                                 <xsl:for-each select="drd:GoodsName">
                                    <xsl:value-of select="drd:Text"/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
