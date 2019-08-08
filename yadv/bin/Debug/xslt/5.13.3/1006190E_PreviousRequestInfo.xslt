<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pri="urn:customs.ru:Information:CustomsDocuments:PreviousRequestInfo:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="pri:PreviousRequestInfo">
      <html>
         <head>
            <title>Информация о наличии ранее поступивших запросов от таможенных органов о размещении товаров на СВХ</title>
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
                           <b>Информация о наличии ранее поступивших запросов от таможенных органов о размещении товаров на СВХ<br/>
                           </b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <xsl:choose>
                           <xsl:when test="pri:PreviousRequestSign='0' or pri:PreviousRequestSign='f' or pri:PreviousRequestSign='false'">
								Предыдущие запросы о размещении товаров на СВХ отсутствуют
							</xsl:when>
                           <xsl:otherwise>Предыдущие запросы о размещении товаров на СВХ:
									<table>
                                 <tbody>
                                    <tr>
                                       <td>Дата запроса</td>
                                       <td>Время запроса</td>
                                       <td>Таможенный орган</td>
                                    </tr>
                                    <xsl:for-each select="pri:PreviousRequests">
                                       <tr>
                                          <td>
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="pri:PreviousRequestDate"/>
                                             </xsl:call-template>
                                          </td>
                                          <td>
                                             <xsl:value-of select="pri:PreviousRequestTime"/>
                                          </td>
                                          <td>
                                             <xsl:value-of select="pri:Customs/cat_ru:Code"/> <xsl:value-of select="pri:Customs/cat_ru:OfficeName"/>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
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
