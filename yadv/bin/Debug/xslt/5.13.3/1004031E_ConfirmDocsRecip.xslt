<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="catExch_ru cat_ru cdr" version="1.0" xmlns:catExch_ru="urn:customs.ru:Information:ExchangeDocuments:ExchangeCommonAggregateTypes:5.13.1" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cdr="urn:customs.ru:Information:ExchangeDocuments:ConfirmDocsRecip:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="/">
      <html>
         <head>
			 <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
         </head>
         <body>
            <table border="1">
               <tbody>
                  <tr>
                     <td align="center" width="146">
                        <xsl:for-each select="cdr:ConfirmDocsRecip">
                           <xsl:for-each select="cdr:SendDate">
                              <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                              <xsl:text>.</xsl:text>
                              <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
                           </xsl:for-each>
                        </xsl:for-each> </td>
                  </tr>
               </tbody>
            </table>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
                        <span style="font-size:large; font-weight:bold; ">Подтверждение</span>
                        <br/>
                        <span style="font-size:medium; font-weight:bold; ">получения должностным лицом таможенного органа электронных документов</span>
                     </td>
                  </tr>
                  <tr>
                     <td align="center"/>
                  </tr>
               </tbody>
            </table>
            <br/>
            <xsl:if test="string-length(  cdr:ConfirmDocsRecip/cdr:Comments  )  = 0">Получины следующие документы</xsl:if>
            <xsl:for-each select="cdr:ConfirmDocsRecip">
               <xsl:for-each select="cdr:Comments">
                  <xsl:apply-templates/>
               </xsl:for-each>
            </xsl:for-each>
            <br/>
            <br/>
            <xsl:for-each select="cdr:ConfirmDocsRecip">
               <table border="0" frame="void">
                  <tbody>
                     <tr>
                        <td>Количество полученных документов: 
                                        <xsl:value-of select="cdr:NumberOfDocs"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </xsl:for-each>
            <table border="1" width="100%">
               <tbody>
                  <tr>
                     <td align="center" width="30%">Уникальный идентификатор документа</td>
                     <td align="center" width="3%">Код вида документа</td>
                     <td align="center" width="30%">Реквизиты документа</td>
                     <td align="center" width="7%">Время создания документа</td>
                     <td align="center" width="30%">Дата/время получения документа</td>
                  </tr>
                  <xsl:for-each select="cdr:ConfirmDocsRecip/cdr:RecipDoc">
                     <tr>
                        <td align="center" width="30%">
                           <xsl:value-of select="catExch_ru:RecipDocumentID"/>
                        </td>
                        <xsl:choose>
                           <xsl:when test="(catExch_ru:RecipDocumentModeID) or (cat_ru:PrDocumentName) or (cat_ru:PrDocumentNumber)">
                              <td align="center" width="3%">
                                 <xsl:value-of select="catExch_ru:RecipDocumentModeID"/>
                              </td>
                              <td align="center" width="30%">
                                 <xsl:value-of select="cat_ru:PrDocumentName"/> 
									<xsl:value-of select="cat_ru:PrDocumentNumber"/> 
									<xsl:for-each select="cat_ru:PrDocumentDate"> от 
                                            <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                                    <xsl:text>.</xsl:text>
                                    <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                                    <xsl:text>.</xsl:text>
                                    <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
                                 </xsl:for-each> 
									</td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td align="center" width="3%">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                           <xsl:when test="catExch_ru:RecipDocTime">
                              <td align="center" width="7%">
                                 <xsl:value-of select="catExch_ru:RecipDocTime"/>
                              </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td align="center" width="7%">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                           <xsl:when test="(catExch_ru:RecipDate) or (catExch_ru:RecipTime)">
                              <td align="center" width="30%">
                                 <xsl:for-each select="catExch_ru:RecipDate">
                                    <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
                                    <xsl:text>.</xsl:text>
                                    <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
                                    <xsl:text>.</xsl:text>
                                    <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
                                 </xsl:for-each> 
									<xsl:value-of select="catExch_ru:RecipTime"/>
                              </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td align="center" width="30%">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                  </xsl:for-each>
               </tbody>
            </table>
            <table border="0" width="100%">
               <tbody>
                  <xsl:for-each select="cdr:ConfirmDocsRecip">
                     <tr>
                        <td>
                           <br/>
                           <br/>
									Таможенный пост:
									<xsl:value-of select="cdr:Customs/cat_ru:Code"/>
                           <xsl:if test="cdr:Customs/cat_ru:OfficeName">, 
									<xsl:value-of select="cdr:Customs/cat_ru:OfficeName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <br/>
										Должностное лицо таможенного органа
										<xsl:value-of select="cdr:CustomsPerson/cat_ru:PersonName"/>
                           <xsl:if test="cdr:CustomsPerson/cat_ru:LNP"> ЛНП 
									<xsl:value-of select="cdr:CustomsPerson/cat_ru:LNP"/>
                           </xsl:if>
                        </td>
                     </tr>
                  </xsl:for-each>
               </tbody>
            </table>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
