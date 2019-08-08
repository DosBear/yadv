<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:nvl="urn:customs.ru:Information:ExchangeDocuments:OEZ_NotifViolation:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Уведомление об отказе в выдаче разрешения на ввоз (вывоз) товаров</title>
            <style type="text/css">
                    td.graphUnderline {
                        border-bottom: 1px solid black;
                        text-align: center;
                       font-weight: bold; 
                    }
                    td.graphNormal {
                        border-bottom: 1px solid black;
                        font-weight: normal; 
                    }
                       td.graphLit {
                         text-align: center;
                       font-weight: normal; 
                        font-size: 7pt;
                    }

                    td.graph {
                        font-size: 7pt;
                        text-align: center;
                        padding: 0;
                        spacing: 0;
                        white-space: normal;
                    }

                    div.org {
                        text-align: center;
                        border: none;
                    }

                    table.declarant td.right {
                        padding-left: 10px;
                        border-bottom: 1px solid black;
                        padding-bottom: 0px;
                    }

                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    div.pagePortrait {
                        width: 210mm;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        margin-left: auto;
                        margin-right: auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                        text-align: left;
                    }

                    h2 {
                        font-size: 14;
                        font-weight: bold;
                        text-align: center;
                    }

                    span {
                        text-decoration: underline;
                    }

                    h3 {
                        text-align: left;
                        margin-top: 5pt;
                        margin-bottom: 5pt;
                    }

                    table {
                        margin: auto;
                    }
                </style>
         </head>
         <body>
            <xsl:apply-templates select="nvl:OEZ_NotifViolation"/>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="nvl:RegDate">
      <table>
         <tbody>
            <tr>
               <td class="graphUnderline">
                  <xsl:call-template name="date">
                     <xsl:with-param name="text" select="."/>
                  </xsl:call-template> г.
                    </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="date">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
            <xsl:value-of select="substring($text,9,2)"/>.<xsl:value-of select="substring($text,6,2)"/>.<xsl:value-of select="substring($text,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="nvl:Customs">
      <table>
         <tr>
            <td class="graphUnderline">
               <xsl:value-of select="cat_ru:Code"/>
            </td>
         </tr>
         <tr>
            <td class="graph">Код таможенного органа</td>
         </tr>
         <tr>
            <td class="graphUnderline">
               <xsl:value-of select="cat_ru:OfficeName"/>
            </td>
         </tr>
         <tr>
            <td class="graph">Наименование таможенного органа</td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template name="Organisation">
      <xsl:param name="base"/>
      <table style="width: 100%">
         <tr>
            <td class="graphUnderline">
               <xsl:value-of select="$base/cat_ru:OrganizationName"/>
               <xsl:if test="$base/cat_ru:ShortName">
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="$base/cat_ru:ShortName"/>
                  <xsl:text>)</xsl:text>
               </xsl:if>
            </td>
         </tr>
         <tr>
            <td class="graph">Наименование организации / ФИО физического
                    лица
                </td>
         </tr>
         <xsl:if test="$base/cat_ru:OGRN or $base/cat_ru:RFOrganizationFeatures/cat_ru:INN or $base/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
            <tr>
               <td class="graphUnderline">
                  <xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                     <xsl:text>ОГРН: </xsl:text>
                     <xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                     <xsl:text> ИНН: </xsl:text>
                     <xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                  </xsl:if>
                  <xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                     <xsl:text> КПП: </xsl:text>
                     <xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graph">Реквизиты</td>
            </tr>
         </xsl:if>
      </table>
   </xsl:template>
   <xsl:template match="nvl:Declarant_OEZ">
      <table align="center" border="0">
         <tbody>
            <tr title="Наименование организации / ФИО физического лица">
               <td class="graphUnderline">
                  <xsl:value-of select="cat_ru:OrganizationName"/>
               </td>
            </tr>
            <tr title="Наименование организации / ФИО физического лица">
               <td class="graph">
                  <xsl:choose>
					 <xsl:when test="//nvl:DocSign='0'">Наименование резидента ОЭЗ (нерезидента ОЭЗ), лица, действующего по его поручению</xsl:when>
                     <xsl:when test="//nvl:DocSign='1'">Наименование резидента ПОЭЗ, лица, действующего по его поручению</xsl:when>
                     <xsl:otherwise>Наименование резидента ТОСЭР, лица, действующего по его поручению</xsl:otherwise>
                  </xsl:choose>
               </td>
            </tr>
            <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
               <tr title="ОГРН/ОГРНИП">
                  <td class="graphUnderline">
                     <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                  </td>
               </tr>
               <tr title="ОГРН/ОГРНИП">
                  <td class="graph">ОГРН/ОГРНИП:</td>
               </tr>
            </xsl:if>
            <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
               <tr title="ИНН">
                  <td class="graphUnderline">
                     <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                  </td>
               </tr>
               <tr title="ИНН">
                  <td class="graph">ИНН:</td>
               </tr>
            </xsl:if>
            <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
               <tr title="КПП">
                  <td class="graphUnderline">
                     <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                  </td>
               </tr>
               <tr title="КПП">
                  <td class="graph">КПП:</td>
               </tr>
            </xsl:if>
         </tbody>
      </table>
   </xsl:template>
   <!--Подпись-->
   <xsl:template name="signature">
      <xsl:param name="base"/>
      <xsl:value-of select="$base/cat_ru:PersonSurname"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="$base/cat_ru:PersonName"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="$base/cat_ru:PersonMiddleName"/>
      <xsl:if test="$base/cat_ru:PersonPost">
         <xsl:text>, </xsl:text>
         <xsl:value-of select="$base/cat_ru:PersonPost"/>
      </xsl:if>
      <xsl:text>. </xsl:text>
      <xsl:if test="$base/cat_ru:IssueDate">
         <xsl:call-template name="date">
            <xsl:with-param name="text" select="$base/cat_ru:IssueDate"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template match="nvl:OEZ_NotifViolation">
      <div class="pagePortrait">
         <h2>Уведомление об отказе в выдаче разрешения</h2>
         <table border="0" style="width:190mm">
            <tbody>
               <tr>
                  <td align="left" colspan="3">
                     <xsl:apply-templates select="nvl:RegDate"/>
                  </td>
               </tr>
               <tr>
                  <td align="left" style="width:65mm">
                     <xsl:apply-templates select="nvl:Customs"/>
                  </td>
                  <td align="left" style="width:50mm">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td align="right" style="width:65mm">
                     <xsl:apply-templates select="nvl:Declarant_OEZ"/>
                  </td>
               </tr>
               <tr>
                  <td align="left" colspan="3" style="text-intend : 30pt;">
							Настоящим уведомляем, что уполномоченным таможенным органом принято решение о невозможности выдачи разрешения на
							<xsl:choose>
                        <xsl:when test="//nvl:DocSign='1'">ввоз/вывоз</xsl:when>
                        <xsl:otherwise>вывоз</xsl:otherwise>
                     </xsl:choose> следующих товаров:
							</td>
               </tr>
            </tbody>
         </table>
         <table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
            <tbody>
               <tr>
                  <td align="center" style="width:10mm">
							№ п/п
							</td>
                  <td align="center" style="width:180mm">
							Наименование товара
							</td>
               </tr>
               <tr>
                  <td align="center" style="width:10mm">
							1
							</td>
                  <td align="center" style="width:180mm">
							2
							</td>
               </tr>
               <xsl:for-each select="nvl:GoodsInfo">
                  <tr>
                     <td align="center" style="width:10mm">
                        <xsl:value-of select="nvl:Position"/>
                     </td>
                     <td align="left" style="width:180mm">
                        <xsl:for-each select="nvl:GoodsDescription">
                           <xsl:value-of select="."/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </xsl:for-each>
                     </td>
                  </tr>
               </xsl:for-each>
            </tbody>
         </table>
         <table border="0" cellpadding="0" cellspacing="0" style="width:190mm">
            <tbody>
               <tr>
                  <td align="left" style="width:190mm">
							по следующим причинам:
							</td>
               </tr>
               <xsl:for-each select="nvl:MotiveProhibition">
                  <tr>
                     <td align="left" class="graphNormal" style="width:190mm">
                        <xsl:value-of select="."/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
               </xsl:for-each>
               <tr>
                  <td align="left" class="graphLit" style="width:190mm">
							(указываются причины, по которым принято решение о невозможности выдачи разрешения на <xsl:choose>
                        <xsl:when test="//nvl:DocSign='1'">ввоз (вывоз)</xsl:when>
                        <xsl:otherwise>вывоз</xsl:otherwise>
                     </xsl:choose>)
							</td>
               </tr>
               <tr>
                  <td align="left" style="width:190mm">
							Вам необходимо: <br/>
							1) совершить следующие действия в отношении товаров и средств транспорта, перевозящих такие товары
							</td>
               </tr>
               <xsl:for-each select="nvl:NecessityActivity">
                  <tr>
                     <td align="left" class="graphNormal" style="width:190mm">
                        <xsl:value-of select="."/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
               </xsl:for-each>
               <tr>
                  <td align="left" style="width:190mm">
							2) представить в уполномоченный таможенный орган документы и сведения
							</td>
               </tr>
               <xsl:for-each select="nvl:ListDocumentInformation">
                  <tr>
                     <td align="left" class="graphNormal" style="width:190mm">
                        <xsl:value-of select="cat_ru:PrDocumentName"/>
                        <xsl:if test="cat_ru:PrDocumentNumber"> №
                                    <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                        </xsl:if> 
								<xsl:if test="cat_ru:PrDocumentDate">от
                                    <xsl:call-template name="date">
                              <xsl:with-param name="text" select="cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="nvl:AddInformation">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:for-each select="nvl:AddInformation">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </xsl:if>
							;<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
               </xsl:for-each>
            </tbody>
         </table>
         <table border="0" cellpadding="0" cellspacing="0" style="width:190mm">
            <tbody>
               <tr>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </tr>
               <tr>
                  <td align="center" class="graphNormal" style="width:80mm">
                     <xsl:value-of select="nvl:CustomsPerson/cat_ru:PersonName"/>
                  </td>
                  <td style="width:60mm">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td align="center" class="graphNormal" style="width:50mm">
                     <xsl:if test="nvl:CustomsPerson/cat_ru:LNP">
                        <xsl:value-of select="nvl:CustomsPerson/cat_ru:LNP"/>
                     </xsl:if>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graphLit" style="width:80mm">
						ФИО должностного лица таможенного органа 
						</td>
                  <td style="width:60mm">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td class="graphLit" style="width:50mm">ЛНП</td>
               </tr>
            </tbody>
         </table>
      </div>
   </xsl:template>
</xsl:stylesheet>
