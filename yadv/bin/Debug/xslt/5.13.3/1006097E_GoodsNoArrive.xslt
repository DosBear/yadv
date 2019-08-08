<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="gno cat_ru catESAD_cu" version="1.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gno="urn:customs.ru:Information:CustomsDocuments:GoodsNoArrive:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="gno:GoodsNoArrive">
      <html>
         <head>
            <title>Уведомление  о непоступлении товарной партии</title>
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
						border-bottom: solid 0.5pt #000000;
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
               <h2>
						Уведомление  о непоступлении товарной партии <br/>
                  <xsl:if test="gno:ResNumber">№
							<xsl:value-of select="gno:ResNumber"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                  </xsl:if>
							от <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="gno:ResDate"/>
                  </xsl:call-template>
               </h2>
               <table border="0" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graphNo" style="width:180mm;">
                           <span class="graphNo"> Входящий запрос </span>
                           <xsl:if test="gno:ReqNumber">№
										<xsl:value-of select="gno:ReqNumber"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           </xsl:if>
								от <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="gno:ReqDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">Грузополучатель </span>
                           <xsl:apply-templates select="gno:Consignee"/>
                        </td>
                     </tr>
                     <xsl:if test="gno:GoodsShipment/gno:ContainerNumber">
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <span class="graphNo"> Контейнеры: </span>
                              <xsl:for-each select="gno:GoodsShipment/gno:ContainerNumber">
                                 <xsl:value-of select="catESAD_cu:ContainerIdentificaror"/>
                                 <xsl:if test="catESAD_cu:FullIndicator='2'">
                                    <xsl:text> (товар занимает часть контейнера)</xsl:text>
                                 </xsl:if>
                                 <xsl:text>, </xsl:text>
                              </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">Представленные документы</span>
                           <br/>
                           <table border="1" cellpadding="6" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                    <td align="center" class="graph" style="width:50mm;">Номер</td>
                                    <td align="center" class="graph" style="width:50mm;">Дата</td>
                                    <td align="center" class="graph" style="width:30mm;">Код вида документа</td>
                                 </tr>
                                 <xsl:for-each select="gno:GoodsShipment/gno:PresentDocument">
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">
                                          <xsl:if test="cat_ru:PrDocumentName">
                                             <xsl:value-of select="cat_ru:PrDocumentName"/>
                                          </xsl:if>
                                       </td>
                                       <td align="center" class="graph" style="width:50mm;">
                                          <xsl:if test="cat_ru:PrDocumentNumber">
                                             <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                          </xsl:if>
                                       </td>
                                       <td align="center" class="graph" style="width:50mm;">
                                          <xsl:if test="cat_ru:PrDocumentDate">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                             </xsl:call-template>
                                          </xsl:if>
                                       </td>
                                       <td align="center" class="graph" style="width:30mm;">
                                          <xsl:value-of select="gno:PresentedDocumentModeCode"/>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <br/>
                     <tr>
                        <td class="graphNo" style="width:90mm;">
										Таможенный орган:
									</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="gno:Customs/cat_ru:Code"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="gno:Customs/cat_ru:OfficeName">
                              <xsl:value-of select="gno:Customs/cat_ru:OfficeName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphNo" style="width:90mm;">
										Должностное лицо таможенного органа:
									</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="gno:CustomsPerson/cat_ru:PersonName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="gno:CustomsPerson/cat_ru:LNP">
											ЛНП <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="gno:CustomsPerson/cat_ru:LNP"/>
                           </xsl:if>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="gno:Consignee | gno:Consignor ">
      <xsl:value-of select="./cat_ru:OrganizationName"/>
      <xsl:if test="./cat_ru:ShortName">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:value-of select="./cat_ru:ShortName"/>)
		</xsl:if>
      <br/>
      <xsl:if test="./cat_ru:Address">
         <xsl:apply-templates select="./cat_ru:Address"/>
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
      <br/>
      <xsl:if test="./cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="cat_ru:Address/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <!--<xsl:apply-templates/>-->
      <xsl:apply-templates select="cat_ru:IdentityCardCode"/>
      <xsl:apply-templates select="cat_ru:IdentityCardName"/>
      <xsl:apply-templates select="cat_ru:IdentityCardSeries"/>
      <xsl:apply-templates select="cat_ru:IdentityCardNumber"/>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
      </xsl:call-template>
      <xsl:apply-templates select="cat_ru:OrganizationName"/>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
</xsl:stylesheet>
