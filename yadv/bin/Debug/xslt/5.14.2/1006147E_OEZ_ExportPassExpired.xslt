<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="  cat_ru expex" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:expex="urn:customs.ru:Information:CustomsDocuments:OEZ_ExportPassExpired:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="expex:OEZ_ExportPassExpired">
      <html>
         <head>
            <title>Результат выполнения операции</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
				text-align: center;
					background: #cccccc;
					}
					
				div.page {
					width: 297mm;
					height: 210mm;
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
					font-family: Arial;
					border-bottom: solid 0.8pt #000000;
					}
					
				p.NumberDate {
					font-weight: bold;
					}
					
				.graph {
					font-family: Arial;
					font-size: 12pt;
					}
				td {
					font-family:Courier;
					}

				.graphMain {
					font-family: Arial;
					font-size: 9pt;
					font-weight: bold;
					}

				</style>
         </head>
         <body>
            <div class="page">
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" class="graph">
                           <b>УВЕДОМЛЕНИЕ ОБ АННУЛИРОВАНИИ РАЗРЕШЕНИЯ</b>
                           <br/>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">
									Разрешение №<span class="underlined">
                              <xsl:value-of select="expex:PassRegNumber/expex:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
                                 <xsl:with-param name="dateIn" select="expex:PassRegNumber/expex:RegistrationDate"/>
                              </xsl:call-template>/
									<xsl:value-of select="expex:PassRegNumber/expex:Number"/>
                           </span>
									аннулировано.
									 
									 <br/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">Дата аннулирования:<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="expex:DateEnd"/>
                           </xsl:call-template>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph">
                           <table style="width:210mm">
                              <tbody>
                                 <tr>
                                    <td align="center" class="underlined" style="width:100mm">
                                       <xsl:value-of select="expex:CustomsPerson/cat_ru:PersonName"/>
                                    </td>
                                    <td style="width:60mm"> </td>
                                    <td align="center" class="underlined" style="width:50mm">
                                       <xsl:value-of select="expex:CustomsPerson/cat_ru:LNP"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph">ФИО должностного лица таможенного органа</td>
                                    <td> </td>
                                    <td align="center" class="graph">ЛНП</td>
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
