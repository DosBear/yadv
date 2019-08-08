<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:sqdr="urn:customs.ru:Information:SQDocuments:SQ_DocResponse:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="sqdr:SQ_DocResponse">
      <html>
         <head>
            <title>Предоставление документов по запросу из ФОИВ</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #cccccc;
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
				
				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				.graph {
							font-family: Arial;
							font-size: 12pt;
							}
							
								
						.graphMain {
							font-family: Arial;
							font-size: 14pt;
							
							}
				</style>
         </head>
         <body>
            <div align="center" class="page">
               <h2>Предоставление документов по запросу из ФОИВ</h2>
               <br/>
               <br/>
               <table width="800">
                  <tr>
                     <td align="left" class="graph" style="border:0pt" width="400">
										Идентификатор позиции в исходном запросе:</td>
                     <td align="left" class="graph" style="border:0pt">
                        <xsl:value-of select="sqdr:RequestPositionID"/>
                     </td>
                  </tr>
                  <xsl:if test="sqdr:RequestPositionNumeric">
                     <tr>
                        <td align="left" class="graph" style="border:0pt" width="400">
										Порядковый номер позиции в исходном запросе:</td>
                        <td align="left" class="graph" style="border:0pt">
                           <xsl:value-of select="sqdr:RequestPositionNumeric"/>
                        </td>
                     </tr>
                  </xsl:if>
               </table>
               <br/>
               <table width="800">
                  <tr>
                     <td align="center" class="graphMain" colspan="2" style="border:0pt">
                        <u>Запрашиваемые документы</u>
                     </td>
                  </tr>
                  <xsl:for-each select="sqdr:DocResponse">
                     <tr>
                        <td class="graph" style="border:0pt">
                           <table border="0" width="800">
                              <tr>
                                 <td align="left" class="graph" style="border:0pt" width="400">
                                    <xsl:value-of select="position()"/>. ФОИВ:</td>
                                 <td align="left" class="graph" style="border:0pt">
                                    <xsl:value-of select="sqdr:NameAuthority"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="graph" style="border:0pt" width="400">Результат поиска запрашиваемого документа:
										</td>
                                 <td align="left" class="graph" style="border:0pt">
                                    <xsl:choose>
                                       <xsl:when test="(sqdr:SearchResult = 'true') or (sqdr:SearchResult = '1') or (sqdr:SearchResult = 't')">найден
                                            </xsl:when>
                                       <xsl:otherwise>не найден</xsl:otherwise>
                                    </xsl:choose>
                                 </td>
                              </tr>
                              <xsl:if test="sqdr:ResultDescription">
                                 <tr>
                                    <td align="left" class="graph" style="border:0pt" width="400">Описание результата поиска:</td>
                                    <td align="left" class="graph" style="border:0pt">
                                       <xsl:value-of select="sqdr:ResultDescription"/>
                                    </td>
                                 </tr>
                              </xsl:if>
                           </table>
                        </td>
                     </tr>
                  </xsl:for-each>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
