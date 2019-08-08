<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:red="urn:customs.ru:Information:CustomsDocuments:RepudDecl:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="red:RepudDecl">
      <html>
         <head>
            <title>Отказ в принятии таможенной декларации</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 210mm;
						height: 297mm;
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
						border-bottom: solid 0.8pt #000000;
						}
						
					p.NumberDate {
						font-weight: bold;
						}
						
					.graph {
						font-family: Arial;
						font-size: 8pt;
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
						font-size: 9pt;
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
               <h2>Отказ в принятии таможенной декларации
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </h2>
               <table border="0" cellpadding="2" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graphLittle">
								Дата создания докумета:
								<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="red:SendDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td class="graphLittle">
								Время создания документа:
								<xsl:value-of select="red:SendTime"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <hr align="center;" size="2"/>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width = 180mm;">
                           <br/>
                           <br/>
                           <xsl:if test="string-length(red:Customs/cat_ru:OfficeName)  != 0">
                              <span class="graphNo">Наименование таможенного органа: </span>
                              <xsl:value-of select="red:Customs/cat_ru:OfficeName"/>
                           </xsl:if>
                        </td>
                        <br/>
                     </tr>
                     <tr>
                        <td class="graph" style="width = 180mm;">
                           <span class="graphNo">Код таможенного органа: </span>
                           <xsl:value-of select="red:Customs/cat_ru:Code"/>
                        </td>
                        <br/>
                     </tr>
                     <tr>
                        <tr>
                           <td class="graph" style="width = 180mm;">
                              <br/>
                              <br/>
                              <xsl:if test="string-length(red:RepudReason/red:ReasonDescription) !=0">
                                 <span class="graphNo">Причины отказа: </span>
                                 <xsl:for-each select="red:RepudReason/red:ReasonDescription">
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates/>
                                 </xsl:for-each>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width = 180mm;">
                              <xsl:if test="string-length(red:Comments) !=0">
                                 <span class="graphNo">Комментарий: </span>
                                 <xsl:for-each select="red:Comments">
                                    <xsl:apply-templates/>
                                 </xsl:for-each>
                              </xsl:if>
                           </td>
                        </tr>
                        <td align="center" class="graph;" width="180mm;">
                           <br/>
                           <xsl:value-of select="red:CustomsPerson/cat_ru:PersonName"/>
                           <hr color="black" size="1"/>
                           <span class="graphNo">Уполномоченное должностное лицо таможенного органа </span>
                        </td>
                        <td align="center" class="graph;" width="180mm;">
                           <br/>
                           <xsl:if test="string-length(red:CustomsPerson/cat_ru:LNP) !=0">
                              <xsl:value-of select="red:CustomsPerson/cat_ru:LNP"/>
                              <hr color="black" size="1"/>
                              <span class="graphNo">ЛНП</span>
                           </xsl:if>
                        </td>
                        <br/>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
