<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="rdro cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rdro="urn:customs.ru:Information:ExchangeDocuments:RejectDeclReqOperation:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="rdro:RejectDeclReqOperation">
      <html>
         <head>
            <title>Отказ декларанта в запрашиваемых действиях</title>
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
               <h2>Отказ декларанта в запрашиваемых действиях
						<br/>
                  <xsl:if test="rdro:RejectNumber">
							№ <xsl:value-of select="rdro:RejectNumber"/>
                  </xsl:if>
                  <xsl:if test="rdro:RejectDate">
							от 
							<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="rdro:RejectDate"/>
                     </xsl:call-template>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="rdro:RejectTime"/>
                  </xsl:if>
               </h2>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">Запрос инспектора </span>
                           <xsl:if test="rdro:ReqNumber">
										№ <xsl:value-of select="rdro:ReqNumber"/>
                           </xsl:if>
									от 
									<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="rdro:ReqDate"/>
                           </xsl:call-template>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">Декларант </span>
                           <xsl:apply-templates select="rdro:Declarant"/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">Причины отказа:</span>
                           <xsl:for-each select="rdro:RejectReason">
                              <br/>
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <br/>
                           <br/>
                           <table border="0" cellpadding="3" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td class="graph" style="width:90mm;">
                                       <xsl:value-of select="rdro:PersonSignature/cat_ru:PersonPost"/>
                                       <br/>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="rdro:PersonSignature/cat_ru:IssueDate"/>
                                       </xsl:call-template>
                                    </td>
                                    <td class="graph" style="width:90mm;">
                                       <xsl:text>_____________</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="rdro:PersonSignature/cat_ru:PersonSurname"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="rdro:PersonSignature/cat_ru:PersonName"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="rdro:PersonSignature/cat_ru:PersonMiddleName"/>
                                       <br/>
                                       <span class="graph">(Подпись,фамилия,инициалы)</span>
                                    </td>
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
   <xsl:template match="rdro:Declarant">
      <xsl:value-of select="./cat_ru:OrganizationName"/>
      <xsl:if test="./cat_ru:ShortName">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:value-of select="./cat_ru:ShortName"/>)
									</xsl:if>
      <br/>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
										ОГРН 
										<xsl:value-of select="./cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:INN">
										ИНН 
										<xsl:value-of select="./cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										КПП 
										<xsl:value-of select="./cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
