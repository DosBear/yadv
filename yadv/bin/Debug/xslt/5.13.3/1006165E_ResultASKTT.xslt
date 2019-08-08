<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:retrz="urn:customs.ru:Information:CustomsDocuments:ResultASKTT:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="retrz:ResultASKTT">
      <html>
         <head>
            <title>Результат проверки АСКТТ-2</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					.subscription td {
						font-family:Arial;
						font-size: 7pt;
						border: 0;
					}
					
					.common {
						font-family:Arial;
						font-size: 10pt
					}
				
					body {
						text-align: center;
							background: #cccccc;
							}
					div.page {
						width: 210mm;
						/*height: 297mm;*/
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding:	10mm;
						padding-left:	10mm;
						background: #ffffff;
						border: solid .5pt #000000;
					}
					
					div.album_page {
						width: 297mm;
						height: 210mm;
						margin: auto;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding: 10mm;
						padding-left: 10mm;
						background: #ffffff;
						border: solid 1pt #000000;
					}
											
						td {
							font-family:Courier;
						}
						
						.normal{
							pdding-top: -20mm;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							
						
							
							.bold2{
							font-weight: bold;
							font-family:Arial;
							font-size: 9pt; 
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
							.bold1{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: 1pt solid windowtext; 
							}
							.bold3{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: medium none; 
							}
							.bold4{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: medium none; border-bottom: medium none; 
							}
							.bold5{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.bold6{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: medium nonet; border-top:  1pt solid windowtext; border-bottom: medium none; 
							}
							.bold7{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium nonet; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: medium nonet; 
							}
							.bold8{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium nonet; border-right: 1pt solid windowtext; border-top: medium nonet; border-bottom: medium nonet; 
							}
							.bold9{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium nonet; border-right: medium nonet; border-top: medium nonet; border-bottom: 1pt solid windowtext; 
							}
							.bold10{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: 1pt solid windowtext; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.bold11{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium nonet; border-right: medium nonet; border-top: 1pt solid windowtext; border-bottom: medium nonet; 
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
							font-family: Arial;
							font-size: 10pt;
							border: solid 1pt #000000;
							empty-cells: show;
						}			
					</style>
         </head>
         <body>
            <div class="page">
               <h1>Результат проверки АСКТТ-2</h1>
               <table border="1" cellspacing="0" style="width:190mm; empty-cells: show; border-collapse:collapse;">
                  <tbody>
                     <tr>
                        <td align="center" class="common" colspan="5" style="height:30">Результаты проверки по ТД</td>
                     </tr>
                     <tr>
                        <td align="center" class="common">Результат</td>
                        <xsl:if test="//retrz:Comment">
                           <td align="center" class="common">Комментарии</td>
                        </xsl:if>
                        <xsl:if test="//retrz:OperatorDeliveryPlace">
                           <td align="center" class="common" width="90mm">Место доставки товаров УЭО</td>
                        </xsl:if>
                        <xsl:if test="//retrz:TDNumber">
                           <td align="center" class="common">Номер ТД</td>
                        </xsl:if>
                        <xsl:if test="//retrz:DeliveryPlace">
                           <td align="center" class="common">Место доставки</td>
                        </xsl:if>
                     </tr>
                     <xsl:apply-templates select="retrz:TDCheckResult"/>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="retrz:TDCheckResult">
      <tr>
         <td class="common">
            <xsl:choose>
               <xsl:when test="retrz:Result='1' or retrz:Result='t' or retrz:Result='true' ">Корректно</xsl:when>
               <xsl:otherwise>Не корректно</xsl:otherwise>
            </xsl:choose>
         </td>
         <xsl:if test="//retrz:Comment">
            <td class="common">
               <xsl:value-of select="retrz:Comment"/>
            </td>
         </xsl:if>
         <xsl:if test="//retrz:OperatorDeliveryPlace">
            <td class="common">
               <xsl:value-of select="retrz:OperatorDeliveryPlace"/>
            </td>
         </xsl:if>
         <xsl:if test="//retrz:TDNumber">
            <td class="common">
               <xsl:apply-templates select="retrz:TDNumber"/>
            </td>
         </xsl:if>
         <xsl:if test="//retrz:DeliveryPlace">
            <td class="common">
               <xsl:for-each select="retrz:DeliveryPlace">
                  <xsl:value-of select="cat_ru:OfficeName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                  <xsl:choose>
                     <xsl:when test="cat_ru:OfficeName"> (<xsl:value-of select="cat_ru:Code"/>) </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="cat_ru:Code"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:for-each>
            </td>
         </xsl:if>
      </tr>
   </xsl:template>
   <xsl:template match="retrz:TDNumber">
      <xsl:value-of select="cat_ru:CustomsCode"/> / 
		<xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
      </xsl:call-template> / 
		<xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
</xsl:stylesheet>
