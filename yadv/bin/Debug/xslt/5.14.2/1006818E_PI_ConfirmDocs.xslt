<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rwcd="urn:customs.ru:Information:PriorInformation:PI_ConfirmDocs:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template name="sub_time">
      <xsl:param name="timeLn"/>
      <xsl:choose>
         <xsl:when test="substring($timeLn,11, 1)='Z' ">
            <xsl:value-of select="substring($timeLn, 1, 8)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$timeLn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="rwcd:PI_ConfirmDocs ">
      <html>
         <head>
            <title>Подтверждение получения документа</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
						.page {
							width: 210mm;
							/*height: 297mm;*/
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding: 10mm;
							padding-left: 20mm;
							background: #ffffff;
							border: solid 1pt #000000;
						}
						
						.space {
							width: 30px;
						}
						
						.spec_column {
							border-bottom: 0px; 
							border-left:0px; 
							border-right:0px; 
							font-size: 10pt;
						}
						
						.header {
							font-weight: bold;
						}
						
						.docs td {
							padding:5px
						}
                   </style>
         </head>
         <body>
            <div class="page">
               <h2 align="center">Подтверждение получения документа</h2>
               <table align="right" border="1" style="border:0">
                  <tbody>
                     <tr>
                        <td align="center" style="border:0px">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="rwcd:SendDate"/>
                           </xsl:call-template> /	
									<xsl:call-template name="sub_time">
                              <xsl:with-param name="timeLn" select="rwcd:SendTime"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="spec_column">(Дата / время создания подтверждения)</td>
                     </tr>
                  </tbody>
               </table>
               <div style="margin-top: 70px">
                  <p class="header">Информация о полученных документах</p>
                  <table border="1" cellspacing="0" class="docs" width="100%">
                     <tbody>
                        <tr>
                           <td style="vertical-align:top; width: 20%">Наименование</td>
                           <td style="vertical-align:top">Номер</td>
                           <td style="vertical-align:top">Дата</td>
                           <td style="vertical-align:top; width: 10%">Уникальный идентификатор</td>
                           <td style="vertical-align:top">Дата создания полученного документа</td>
                           <td style="vertical-align:top">Дата получения</td>
                           <td style="vertical-align:top">Время получения</td>
                        </tr>
                        <xsl:for-each select="rwcd:RecipDocument">
                           <tr>
                              <td>
                                 <xsl:value-of select="cat_ru:PrDocumentName"/>
                              </td>
                              <td>
                                 <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                              </td>
                              <td>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </td>
                              <td>
                                 <xsl:value-of select="rwcd:RecipDocumentID"/>
                              </td>
                              <td>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="rwcd:RecipDocDate"/>
                                 </xsl:call-template>
                              </td>
                              <td>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="rwcd:RecipDate"/>
                                 </xsl:call-template>
                              </td>
                              <td>
                                 <xsl:call-template name="sub_time">
                                    <xsl:with-param name="timeLn" select="rwcd:RecipTime"/>
                                 </xsl:call-template>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
                  <p class="header">Сведения о лице, создавшем подтвержение </p>
                  <div align="right">
                     <table border="1" style="border:0; margin-top:-10px">
                        <tbody>
                           <tr>
                              <xsl:if test="rwcd:DeclPerson/cat_ru:PersonPost">
                                 <td align="center" style="border:0px">
                                    <xsl:value-of select="rwcd:DeclPerson/cat_ru:PersonPost"/>
                                 </td>
                              </xsl:if>
                              <td style="border:0px; width:130px"/>
                              <td align="center" style="border:0px">
                                 <xsl:value-of select="rwcd:DeclPerson/cat_ru:PersonSurname"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="rwcd:DeclPerson/cat_ru:PersonName"/>
                                 <xsl:if test="rwcd:DeclPerson/cat_ru:PersonMiddleName">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="rwcd:DeclPerson/cat_ru:PersonMiddleName"/>
                                 </xsl:if>
                              </td>
                           </tr>
                           <tr>
                              <xsl:if test="rwcd:DeclPerson/cat_ru:PersonPost">
                                 <td align="center" class="spec_column">(Должность)</td>
                              </xsl:if>
                              <td style="border:0px; width:130px"/>
                              <td align="center" class="spec_column">(Ф.И.О.)</td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
