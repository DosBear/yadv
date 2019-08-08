<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ddrd="urn:customs.ru:Information:CustomsDocuments:DetailDataRD:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="ddrd:DetailDataRD">
      <html>
         <head>
            <title>Сведения по неквотируемому документу</title>
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
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <xsl:if test="ddrd:FormNumber">
                           <td align="left" class="graph" colspan="2" style="width:190mm"> Номер бланка 
									<xsl:value-of select="ddrd:FormNumber"/>
                           </td>
                        </xsl:if>
                     </tr>
                     <tr>
                        <td align="center" class="bold2" colspan="2" style="width:190mm">	
								Сведения по неквотируемому документу<br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="bold2" colspan="2" style="width:190mm">
								№ 
								<span class="normal">
                              <xsl:value-of select="ddrd:DocumentNumber"/>
                           </span> от 
									<span class="normal">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="ddrd:IssueDate"/>
                              </xsl:call-template>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" class="graph" colspan="2" style="width:190mm">срок действия <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ddrd:Term"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:190mm;">
                           <span class="bold">Изготовитель: </span>
                           <xsl:apply-templates select="ddrd:Manufacturer/ddrd:Name/ddrd:Text"/>,<xsl:text> </xsl:text>
                           <xsl:apply-templates select="ddrd:Manufacturer/ddrd:CountryCode"/>,<xsl:text> </xsl:text>
                           <xsl:apply-templates select="ddrd:Manufacturer/ddrd:CountryName"/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:190mm;">
                           <span class="bold">Получатель: </span>
                           <xsl:apply-templates select="ddrd:Receiver/ddrd:Name/ddrd:Text"/>
                           <xsl:text> </xsl:text>
                           <xsl:apply-templates select="ddrd:Receiver/ddrd:CountryCode"/>
                           <xsl:text> </xsl:text>
                           <xsl:apply-templates select="ddrd:Receiver/ddrd:CountryName"/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:190mm;">
                           <span class="bold">Статус документа </span>
                           <xsl:apply-templates select="ddrd:Status"/>
                           <xsl:text> </xsl:text>
                           <span class="bold">дата установки</span>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ddrd:StatusDate"/>
                           </xsl:call-template>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" class="bold" style="width:10mm">
								Тип продукции
								</td>
                        <td align="center" class="bold" style="width:90mm">
							 Наименование продукции
								</td>
                        <td align="center" class="bold" style="width:100mm">
								Номер и размер партии или номер изделия
								</td>
                     </tr>
                     <xsl:for-each select="ddrd:GoodsInfo">
                        <tr>
                           <td align="center" class="graphMain" style="width:10mm">
                              <xsl:value-of select="ddrd:GoodsKind"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:90mm">
                              <xsl:value-of select="ddrd:GoodsName/ddrd:Text"/>
                           </td>
                           <td align="center" class="graphMain" style="width:100mm">
                              <xsl:value-of select="ddrd:GoodsIdentification/ddrd:Text"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <!--tr>
								<td style="width:100mm" class="bold">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="width:90mm" class="graph" align="right">
дата выдачи: <xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="ddrd:IssueDate"/>
									</xsl:call-template>
								</td>
							</tr-->
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
