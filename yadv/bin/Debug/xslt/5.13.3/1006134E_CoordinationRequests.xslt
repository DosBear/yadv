<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="coorr cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:coorr="urn:customs.ru:Information:CustomsDocuments:CoordinationRequests:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="coorr:CoordinationRequests">
      <html>
         <head>
            <title>Направление на согласование</title>
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
               <table border="0" cellspacing="0" width="100%">
                  <tbody>
                     <!--xsl:variable name="good" select="../../coorr:GoodsInfo/coorr:GoodsNumber"/-->
                     <tr>
                        <td align="center">
                           <span class="graphMain">Направление на согласование</span>
                           <br/>
                           <br/>
									№ <xsl:value-of select="coorr:GTDID/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="coorr:GTDID/cat_ru:RegistrationDate"/>
                           </xsl:call-template>/<xsl:value-of select="coorr:GTDID/cat_ru:GTDNumber"/> - <xsl:value-of select="coorr:CoordReqNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
								Меры, на основании которых было сформировано Направление на согласование в функциональные отделы таможен для принятия решений по видам документального контроля:
								</td>
                     </tr>
                     <xsl:for-each select="coorr:MeasureList">
                        <tr>
                           <td>Мера: <xsl:value-of select="coorr:MeasureCode"/>
                           </td>
                        </tr>
                        <xsl:for-each select="coorr:GoodsPRInfo">
                           <xsl:variable name="good" select="../../coorr:GoodsInfo"/>
                           <!--xsl:variable name="pos" select="position()"/-->
                           <xsl:variable name="risk" select="coorr:GoodsNumber"/>
                           <!--xsl:if test="$good/coorr:GoodsNumber = $risk"-->
                           <tr>
                              <td>
								По товару 
								
								
								
								
                                 <!--xsl:variable name="risk" select="../coorr:MeasureList/coorr:GoodsInfo/coorr:GoodsNumber"/-->
                                 <!--xsl:if test="../coorr:MeasureList/coorr:GoodsPRInfo/coorr:GoodsNumber = $risk"-->
                                 <xsl:value-of select="$good[coorr:GoodsNumber = $risk]/coorr:GoodsTNVEDCode"/> выявлены следующие профили риска:<br/>
                                 <!--xsl:for-each select=""-->
                                 <xsl:value-of select="coorr:PRRegKind"/>/
								<xsl:value-of select="coorr:PRRegCustomCode"/>/
								<xsl:call-template name="russian_date_gtd">
                                    <xsl:with-param name="dateIn" select="coorr:PRRegDate"/>
                                 </xsl:call-template>/<xsl:value-of select="coorr:PRRegNumber"/>
                                 <xsl:if test="coorr:PRVersion">
								 -<xsl:value-of select="coorr:PRVersion"/>
                                 </xsl:if>
								  в момент выявления (<xsl:value-of select="coorr:PRPointCode"/>)<br/>
                                 <!--/xsl:for-each-->
                              </td>
                           </tr>
                           <xsl:if test="$risk='0'">
                              <tr>
                                 <td>
								По партии товаров выявлены следующие профили риска:<br/>
                                    <!--xsl:for-each select=""-->
                                    <xsl:value-of select="coorr:PRRegKind"/>/
								<xsl:value-of select="coorr:PRRegCustomCode"/>/
								<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="dateIn" select="coorr:PRRegDate"/>
                                    </xsl:call-template>/<xsl:value-of select="coorr:PRRegNumber"/>
                                    <xsl:if test="coorr:PRVersion">
								 -<xsl:value-of select="coorr:PRVersion"/>
                                    </xsl:if>
								  в момент выявления (<xsl:value-of select="coorr:PRPointCode"/>)<br/>
                                    <!--/xsl:for-each-->
                                 </td>
                              </tr>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:for-each>
                     <tr>
                        <td>
                           <table style="width:210mm">
                              <tbody>
                                 <tr>
                                    <td style="width:100mm">Создано:
												<xsl:value-of select="coorr:CreateUserNameFIO/cat_ru:PersonSurname"/> 
												<xsl:value-of select="coorr:CreateUserNameFIO/cat_ru:PersonName"/> 
												<xsl:value-of select="coorr:CreateUserNameFIO/cat_ru:PersonMiddleName"/> 
												
												</td>
                                    <td style="width:60mm">
                                       <xsl:text> </xsl:text>
                                    </td>
                                    <td style="width:50mm">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="coorr:CoordReqDate"/>
                                       </xsl:call-template> <xsl:value-of select="coorr:CoordReqTime"/>
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
   <!--xsl:template match="catESAD_cu:Address">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="catESAD_cu:Address/*">
		<xsl:if test="preceding-sibling::*[1]">, </xsl:if>
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="catESAD_cu:IdentityCard"-->
   <!--<xsl:apply-templates/>-->
   <!--xsl:apply-templates select="cat_ru:IdentityCardCode"/>
		<xsl:apply-templates select="cat_ru:IdentityCardName"/>
		<xsl:apply-templates select="cat_ru:IdentityCardSeries"/>
		<xsl:apply-templates select="cat_ru:IdentityCardNumber"/>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
		    </xsl:call-template>											
	    <xsl:apply-templates select="cat_ru:OrganizationName"/>
	</xsl:template>
	<xsl:template match="catESAD_cu:IdentityCard/*">
		<xsl:if test="preceding-sibling::*[1]">, </xsl:if>
		<xsl:value-of select="."/>
	</xsl:template-->
</xsl:stylesheet>
