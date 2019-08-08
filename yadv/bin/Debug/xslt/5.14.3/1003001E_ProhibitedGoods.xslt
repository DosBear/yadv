<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pipg="urn:customs.ru:Information:TransportDocuments:ProhibitedGoods:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template name="ResidencePlace">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="pipg:ProhibitedGoods">
      <html>
         <head>
            <title>Документ о товарах запрещенных или ограниченных к ввозу</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 15pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						
						.graphMainbold {
						font-family: Arial;
						font-size: 10pt;
						font-weight:bold;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}				
						.bordered {
					border-bottom: solid 1pt #000000;
					font-weight: bold;
										}	
					.borderednormal {
					border-bottom: solid 1pt #000000;
					font-weight: normal;
										}	
                </style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td class="bold">Документ о товарах запрещенных или ограниченных к ввозу
							</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain">
                           <br/>Сведения о судне
								<span class="bordered">
                              <xsl:value-of select="pipg:ShipInfo/pipg:ShipName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="pipg:ShipInfo/pipg:ShipFlag"/>
                           </span>
                           <br/>
                           <xsl:if test="pipg:ShipInfo/pipg:DepaturePort">
									Порт отправления
									<span class="bordered">
                                 <xsl:value-of select="pipg:ShipInfo/pipg:DepaturePort"/>
                              </span>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain">Сведения о документе о товарах запрещенных или ограниченных к ввозу
									<span class="bordered">
                              <xsl:value-of select="pipg:DocumentInfo/cat_ru:PrDocumentName"/>
                              <xsl:if test="pipg:DocumentInfo/cat_ru:PrDocumentNumber"> №
									<xsl:value-of select="pipg:DocumentInfo/cat_ru:PrDocumentNumber"/>
                              </xsl:if>
                              <xsl:if test="pipg:DocumentInfo/cat_ru:PrDocumentDate"> от 
									<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="pipg:DocumentInfo/cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                           </span>
                           <br/>
                        </td>
                     </tr>
                     <xsl:if test="pipg:ArmsInfo">
                        <tr>
                           <td align="left" class="graph8Bold">
                              <br/>Информация о наличии оружия и боеприпасов:
							</td>
                        </tr>
                     </xsl:if>
                  </tbody>
               </table>
               <xsl:if test="pipg:ArmsInfo">
                  <table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
                     <tbody>
                        <tr>
                           <td align="center" class="graphMain">Наименование оружия
								</td>
                           <td align="center" class="graphMain">Количество оружия (код единицы измерения)
								
								</td>
                           <td align="center" class="graphMain">Описание оружия
							</td>
                        </tr>
                        <xsl:for-each select="pipg:ArmsInfo">
                           <tr>
                              <td align="center" class="graphMain">
                                 <xsl:value-of select="pipg:Name"/>
                              </td>
                              <td align="center" class="graphMain">
                                 <xsl:value-of select="cat_ru:GoodsQuantity"/> (<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
								</td>
                              <td align="center" class="graphMain">
                                 <xsl:value-of select="pipg:Description"/>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <table style="width:190mm">
                  <tbody>
                     <xsl:if test="pipg:CurrencyInfo">
                        <tr>
                           <td align="left" class="graph8Bold">
                              <br/>Информация о валюте и валютных ценностях:
							</td>
                        </tr>
                     </xsl:if>
                  </tbody>
               </table>
               <xsl:if test="pipg:CurrencyInfo">
                  <table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
                     <tbody>
                        <tr>
                           <td align="center" class="graphMain">Сумма
								</td>
                           <td align="center" class="graphMain">Код вида валюты
								</td>
                        </tr>
                        <xsl:for-each select="pipg:CurrencyInfo">
                           <tr>
                              <td align="center" class="graphMain">
                                 <xsl:value-of select="pipg:Amout"/>
                              </td>
                              <td align="center" class="graphMain">
                                 <xsl:value-of select="pipg:CurrencyCode"/>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <table style="width:190mm">
                  <tbody>
                     <xsl:if test="pipg:DrugsSubstanceInfo">
                        <tr>
                           <td align="left" class="graph8Bold">
                              <br/>Сведения о наличии лекарственных средств:
							</td>
                        </tr>
                     </xsl:if>
                  </tbody>
               </table>
               <xsl:if test="pipg:DrugsSubstanceInfo">
                  <table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
                     <tbody>
                        <tr>
                           <td align="center" class="graphMain">Наименование лекарственного средства
								</td>
                           <td align="center" class="graphMain">Количество (код единицы измерения)
								
								</td>
                           <td align="center" class="graphMain">Описание лекарственного средства
							</td>
                        </tr>
                        <xsl:if test="pipg:DrugsSubstanceInfo/pipg:DrugsType = 1">
                           <tr>
                              <td align="left" class="graphMainbold" colspan="3">Наркотические лекарственные средства</td>
                           </tr>
                        </xsl:if>
                        <xsl:for-each select="pipg:DrugsSubstanceInfo">
                           <xsl:if test="pipg:DrugsType = 1">
                              <tr>
                                 <td align="center" class="graphMain">
                                    <xsl:value-of select="pipg:Name"/>
                                 </td>
                                 <td align="center" class="graphMain">
                                    <xsl:value-of select="cat_ru:GoodsQuantity"/> (<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
								</td>
                                 <td align="center" class="graphMain">
                                    <xsl:value-of select="pipg:Description"/>
                                 </td>
                              </tr>
                           </xsl:if>
                        </xsl:for-each>
                        <xsl:if test="pipg:DrugsSubstanceInfo/pipg:DrugsType = 2">
                           <tr>
                              <td align="left" class="graphMainbold" colspan="3">Сильнодействующие лекарственные средства</td>
                           </tr>
                        </xsl:if>
                        <xsl:for-each select="pipg:DrugsSubstanceInfo">
                           <xsl:if test="pipg:DrugsType = 2">
                              <tr>
                                 <td align="center" class="graphMain">
                                    <xsl:value-of select="pipg:Name"/>
                                 </td>
                                 <td align="center" class="graphMain">
                                    <xsl:value-of select="cat_ru:GoodsQuantity"/> (<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
								</td>
                                 <td align="center" class="graphMain">
                                    <xsl:value-of select="pipg:Description"/>
                                 </td>
                              </tr>
                           </xsl:if>
                        </xsl:for-each>
                        <xsl:if test="pipg:DrugsSubstanceInfo/pipg:DrugsType = 3">
                           <tr>
                              <td align="left" class="graphMainbold" colspan="3">Психотропные лекарственные средства</td>
                           </tr>
                        </xsl:if>
                        <xsl:for-each select="pipg:DrugsSubstanceInfo">
                           <xsl:if test="pipg:DrugsType = 3">
                              <tr>
                                 <td align="center" class="graphMain">
                                    <xsl:value-of select="pipg:Name"/>
                                 </td>
                                 <td align="center" class="graphMain">
                                    <xsl:value-of select="cat_ru:GoodsQuantity"/> (<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
								</td>
                                 <td align="center" class="graphMain">
                                    <xsl:value-of select="pipg:Description"/>
                                 </td>
                              </tr>
                           </xsl:if>
                        </xsl:for-each>
                        <xsl:if test="pipg:DrugsSubstanceInfo/pipg:DrugsType = 4">
                           <tr>
                              <td align="left" class="graphMainbold" colspan="3">Ядовитые лекарственные средства</td>
                           </tr>
                        </xsl:if>
                        <xsl:for-each select="pipg:DrugsSubstanceInfo">
                           <xsl:if test="pipg:DrugsType = 4">
                              <tr>
                                 <td align="center" class="graphMain">
                                    <xsl:value-of select="pipg:Name"/>
                                 </td>
                                 <td align="center" class="graphMain">
                                    <xsl:value-of select="cat_ru:GoodsQuantity"/> (<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
								</td>
                                 <td align="center" class="graphMain">
                                    <xsl:value-of select="pipg:Description"/>
                                 </td>
                              </tr>
                           </xsl:if>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <table style="width:190mm">
                  <tbody>
                     <xsl:if test="pipg:PermitionDocs">
                        <tr>
                           <td align="left" class="graph8Bold">
                              <br/>Разрешительные документы:
							</td>
                        </tr>
                     </xsl:if>
                     <xsl:for-each select="pipg:PermitionDocs">
                        <tr>
                           <td align="left" class="graphMain">
                              <xsl:value-of select="position()"/>.
									<span class="borderednormal">
                                 <xsl:value-of select="cat_ru:PrDocumentName"/>
                                 <xsl:if test="cat_ru:PrDocumentNumber"> №
										<xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                 </xsl:if>
                                 <xsl:if test="cat_ru:PrDocumentDate"> от
										<xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                 </xsl:if>
										Наименование организации, выдавшей документ
										<xsl:value-of select="pipg:PermitDocOrganization"/>:<br/>
                                 <xsl:value-of select="pipg:DocumentDescriprion"/>
                              </span>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
