<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gui="urn:customs.ru:Information:CustomsDocuments:GuaranteeUnacceptanceNotif:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="gui:GuaranteeUnacceptanceNotif">
      <html>
         <head>
            <title>Уведомление о невозможности использования обеспечения</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Уведомление о невозможности использования обеспечения</b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:choose>
                     <xsl:when test="gui:TDNumber">
                        <tr>
                           <td class="graph" style="border:solid 0pt">Номер транзитной декларации:
							<xsl:apply-templates select="gui:TDNumber"/>
                           </td>
                        </tr>
                     </xsl:when>
                     <xsl:otherwise>
                        <tr>
                           <td class="graph" style="border:solid 0pt">Номер книжки МДП:
							№ <xsl:value-of select="gui:TIRID/gui:TIRID"/> Серия <xsl:value-of select="gui:TIRID/gui:TIRSeries"/>
                              <xsl:if test="gui:TIRID/gui:TIRPageNumber">
							Лист № <xsl:value-of select="gui:TIRID/gui:TIRPageNumber"/>
                              </xsl:if>
                           </td>
                        </tr>
                     </xsl:otherwise>
                  </xsl:choose>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="gui:GuaranteeUnacceptanceInfo">
                     <tr>
                        <td align="center" class="graph" style="border:solid 0pt">Сведения о невозможности использования обеспечения
						<table>
                              <tr>
                                 <td align="center" class="graph" style="border:solid 1pt #000000">Код меры обеспечения</td>
                                 <td align="center" class="graph" style="border:solid 1pt #000000">Номер документа обеспечения</td>
                                 <td align="center" class="graph" style="border:solid 1pt #000000">Причина невозможности принятия обеспечени</td>
                              </tr>
                              <xsl:for-each select="gui:GuaranteeUnacceptanceInfo">
                                 <tr>
                                    <td align="center" class="graph" style="border:solid 1pt #000000">
                                       <xsl:value-of select="gui:MeasureCode"/>
                                    </td>
                                    <td align="center" class="graph" style="border:solid 1pt #000000">
                                       <xsl:value-of select="gui:GuaranteeDocNumber"/>
                                    </td>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:for-each select="gui:Reason">
                                          <xsl:value-of select="gui:Name"/>
                                          <xsl:if test="gui:Comment"> (<xsl:value-of select="gui:Comment"/>)</xsl:if>
                                          <xsl:if test="position()!=last()">
                                             <br/>
                                          </xsl:if>
                                       </xsl:for-each>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </table>
                        </td>
                     </tr>
                  </xsl:if>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="gui:TDNumber">
      <!--код/дата/номер-->
      <xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
</xsl:stylesheet>
