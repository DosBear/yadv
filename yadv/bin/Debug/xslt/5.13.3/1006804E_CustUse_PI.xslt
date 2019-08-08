<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cupi cat_ru catpi_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cupi="urn:customs.ru:Information:PriorInformation:CustUse_PI:5.13.3" xmlns:catpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonAggregateTypes:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="cupi:CustUse_PI">
      <html>
         <head>
            <title>Уведомление об использовании предварительной информации</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
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
						padding-left:	20mm;
						background: #ffffff;
						border: solid 1pt #000000;
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
						border-bottom: solid 0.5pt #000000;
						}
						
					p.NumberDate {
						font-weight: bold;
						}
						
					.graph {
						font-family: Arial;
						font-size: 10pt;
						}
					td {
						font-family:Courier;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						
						.graphNo {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <h3>Уведомление об использовании предварительной информации</h3>
               <table border="0" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <xsl:if test="cupi:UseDocumentNumber">
							   Документ, в котором использована предварительная информация, № <xsl:value-of select="cupi:UseDocumentNumber"/>
                           </xsl:if>
                           <xsl:if test="cupi:UseDocumentDate">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								от <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="cupi:UseDocumentDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <xsl:if test="cupi:UseDocDscrepancy">Наличие расхождений в ПИ и оформленном документе: 
									<xsl:if test="number(cupi:UseDocDscrepancy)=1">
                                 <span class="graph">расхождения выявлены.</span>
                              </xsl:if>
                              <xsl:if test="number(cupi:UseDocDscrepancy)=0">
                                 <span class="graph">расхождения не выявлены.</span>
                              </xsl:if>
                              <br/>
                              <xsl:if test="cupi:UseDocumentKind">Тип документа в котором использована предварительная информация: 
										<xsl:value-of select="cupi:UseDocumentKind"/>
                              </xsl:if>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <xsl:if test="cupi:PI_RegID">Идентификатор запрашиваемой предварительной информации:
									<xsl:value-of select="cupi:PI_RegID"/>
                           </xsl:if>
                           <xsl:if test="cupi:TIR_ID">
										Номер книжки МДП <xsl:value-of select="cupi:TIR_ID/catpi_ru:TIRID"/> серия <xsl:value-of select="cupi:TIR_ID/catpi_ru:TIRSeries"/>
                              <br/>
										Номер белого листа книжки МДП <xsl:value-of select="cupi:TIR_ID/catpi_ru:TIRWhitePageNumber"/>
                              <xsl:if test="cupi:TIR_ID/catpi_ru:TIRGreenPageNumber">
										Номер зеленого листа книжки МДП <xsl:value-of select="cupi:TIR_ID/catpi_ru:TIRGreenPageNumber"/>
                              </xsl:if>
                              <br/>
                              <xsl:if test="cupi:TIR_ID/catpi_ru:TIRHolder">
										Идентификационный номер держателя книжки МДП 
										<xsl:value-of select="cupi:TIR_ID/catpi_ru:TIRHolder"/>
                              </xsl:if>
                           </xsl:if>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
