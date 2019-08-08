<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pdres="urn:customs.ru:Information:CustomsDocuments:PresentedDocInfoRes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="pdres:PresentedDocInfoRes">
      <html>
         <head>
            <title>Информация о разрешительных документах, указанных в графе 44 ТД</title>
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
							font-size: 12pt;
							}
				jh {
				font: 18;
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
                        <b>Информация о разрешительных документах, указанных в графе 44 ТД</b>
                     </td>
                  </tr>
                  <tr>
                     <td style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:for-each select="pdres:PresentedDoc">
                     <tr>
                        <xsl:choose>
                           <xsl:when test="pdres:TDNumber">
                              <td align="left" class="graph" style="border:solid 0pt">Номер транзитной декларации
												<xsl:value-of select="pdres:TDNumber/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                                    <xsl:with-param name="dategtd" select="pdres:TDNumber/cat_ru:RegistrationDate"/>
                                 </xsl:call-template>/<xsl:value-of select="pdres:TDNumber/cat_ru:GTDNumber"/>
                              </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td align="left" class="graph" style="border:solid 0pt">Номер книжки МДП:
												<xsl:value-of select="pdres:TIRID/pdres:TIRSeries"/>
                                 <xsl:value-of select="pdres:TIRID/pdres:TIRID"/>
                                 <xsl:if test="pdres:TIRID/pdres:TIRPageNumber">
												/<xsl:value-of select="pdres:TIRID/pdres:TIRPageNumber"/>
                                 </xsl:if>
                              </td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <xsl:if test="pdres:TransitStatus">
                        <tr>
                           <td align="left" class="graph" style="border:solid 0pt">    Статус таможенного транзита: 
										<xsl:choose>
                                 <xsl:when test="pdres:TransitStatus='1'">Транзит открыт, товары не поступили</xsl:when>
                                 <xsl:when test="pdres:TransitStatus='2'">Транзит закрыт</xsl:when>
                                 <xsl:otherwise>Транзит открыт, товары поступили</xsl:otherwise>
                              </xsl:choose>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="pdres:DateTransitClosed">
						<tr>
							<td align="left" class="graph" style="border:solid 0pt">    Дата и время завершения процедуры таможенного транзита: 
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="pdres:DateTransitClosed"/>
								</xsl:call-template>
                           </td>
						</tr>
                     </xsl:if>
                     <xsl:for-each select="pdres:PresentedDocument">
                        <tr>
                           <td align="left" class="graph" style="border:solid 0pt">    Тип представленного документа: 
										<xsl:value-of select="pdres:DocumentKind"/>   
										<xsl:call-template name="Docum">
                                 <xsl:with-param name="doc" select="."/>
                              </xsl:call-template>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <td style="border:solid 0pt"> </td>
                  </xsl:for-each>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dategtd"/>
      <xsl:choose>
         <xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
            <xsl:value-of select="substring($dategtd,9,2)"/>
            <xsl:value-of select="substring($dategtd,6,2)"/>
            <xsl:value-of select="substring($dategtd,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dategtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="Docum">
      <xsl:param name="doc"/>
      <xsl:if test="cat_ru:PrDocumentName">
         <xsl:value-of select="cat_ru:PrDocumentName"/> </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">№<xsl:value-of select="cat_ru:PrDocumentNumber"/> 
			</xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">от <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
         </xsl:call-template>
      </xsl:if>
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
</xsl:stylesheet>
