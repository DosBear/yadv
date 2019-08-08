<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fdti="urn:customs.ru:Information:ExchangeDocuments:FilledDTInfo:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template match="/">
      <html>
         <head/>
         <body>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
                        <span style="font-size:large; font-weight:bold; ">Ответ на уведомление о дублировании ДТ</span>
                     </td>
                  </tr>
               </tbody>
            </table>
            <br/>
            <table border="1" width="100%">
               <tbody>
                  <tr>
                     <td align="center" width="50%">Уникальный идентификатор ДТ, по которой найдено совпадение</td>
                     <td align="center">
                        <xsl:value-of select="//fdti:DeclarationID"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center">Признак дублирования</td>
                     <!--<td align="center"><xsl:choose>
								<xsl:when test="//fdti:SignDoubl = '1'">
							[ <span class="graphBold">X</span>
							] дубль
							</xsl:when>
									<xsl:otherwise>[<b>X</b>] не дубль</xsl:otherwise>
							</xsl:choose>
							  </td>-->
                     <td align="center">
                        <!--<xsl:variable name="indicator" select="//fdti:SignDouble"/>-->
							<xsl:if test="(//fdti:SignDouble)='0' or ((//fdti:SignDouble)='false') or ((//fdti:SignDouble)='f')">не дубль</xsl:if>
							<xsl:if test="((//fdti:SignDouble)=1) or ((//fdti:SignDouble)='true') or ((//fdti:SignDouble)='t')">дубль</xsl:if>
							<!--[<xsl:choose>
                           <xsl:when test="(//fdti:SignDouble)='0' or ((//fdti:SignDouble)='false') or ((//fdti:SignDouble)='f')">
                              <span class="graphBold">х</span>
                           </xsl:when>
                           <xsl:otherwise>
                              <span class="graphBold"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text></span>
                           </xsl:otherwise>
                        </xsl:choose>] – не дубль
							[<xsl:choose>
                           <xsl:when test="((//fdti:SignDouble)=1) or ((//fdti:SignDouble)='true') or ((//fdti:SignDouble)='t')">
                              <span class="graphBold">х</span>
                           </xsl:when>
                           <xsl:otherwise>
                              <span class="graphBold"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text></span>
                           </xsl:otherwise>
                        </xsl:choose>] – дубль-->
							 </td>
                  </tr>
                  <tr>
                     <td align="center">Комментарии/примечания
                            </td>
                     <td align="center">
                        <xsl:for-each select="//fdti:Comments">
                           <xsl:value-of select="."/>
                           <br/>
                        </xsl:for-each>
                     </td>
                  </tr>
               </tbody>
            </table>
            <br/>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
