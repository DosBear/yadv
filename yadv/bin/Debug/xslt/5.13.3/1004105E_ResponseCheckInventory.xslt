<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:resinv="urn:customs.ru:Information:ExchangeDocuments:ResponseCheckInventory:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="resinv:ResponseCheckInventory">
      <html>
         <head>
            <title>Ответ на запрос на сверку описи в ЭАД</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                        background: #cccccc;
                    }
                    
                    .common {
						font-family:Arial;
						font-size: 10pt
					}
				

                    div.page {
                        width: 210mm;
                        margin: auto;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }
                    
                    div.album_page {
                        width: 297mm;
                        margin: auto;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

					h2 {
						text-align:center;
						font: 20 ;
						font-family: Arial, serif;
					}
					
					.remark {
						text-align:right;
						font: 15;
						font-family: Arial, serif;
						text-decoration: underline;
					}
					
					.header {
						font-weight: bold;
					}
					
					 table {
                        width: 100%;
                        border: 0;
                        empty-cells: show;
                        border-collapse: collapse;
                        margin-top: 1px;
                    }

                    td {
                        border: 1px solid gray;
                        font-family: Courier, serif;
                        vertical-align:top;
                    }
                    
                    .in_table {
						border-bottom:0; 
						border-top:0;
                    }
                    
                    .low {
						font: 12;
						font-family: Arial, serif;
					}
					
                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }   
                   
                    .common tr td {
						border:0px;
                    }
                   
                </style>
         </head>
         <body>
            <div class="page">
               <h2>Ответ на запрос на сверку описи в ЭАД</h2>
               <div>
						Идентификатор описи документов 
						<span style="text-decoration:underline;">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                     <xsl:value-of select="resinv:InventoryID"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                  </span>
               </div>
               <br/>
               <table border="1" cellspacing="0" style="width:260mm; empty-cells: show; border-collapse:collapse;">
                  <tbody>
                     <tr>
                        <td align="center" class="common">Код вида документа</td>
                        <td align="center" class="common">Вид документа</td>
                        <xsl:if test="//resinv:CheckResult/resinv:InvDocNumber">
                           <td align="center" class="common">Номер документа</td>
                        </xsl:if>
                        <xsl:if test="//resinv:CheckResult/resinv:InvDocDate">
                           <td align="center" class="common">Дата документа</td>
                        </xsl:if>
                        <!--<td class="common" align="center">Порядковый номер записи в разделе</td>-->
                        <xsl:if test="//resinv:CheckResult/resinv:ArchID">
                           <td align="center" class="common">Идентификатор ЭАД</td>
                        </xsl:if>
                        <xsl:if test="//resinv:CheckResult/resinv:ArchDocID">
                           <td align="center" class="common">Идентификатор документа в ЭАД</td>
                        </xsl:if>
                        <xsl:if test="//resinv:CheckResult/resinv:InventDocumentID">
                           <td align="center" class="common">Уникальный идентификатор документа</td>
                        </xsl:if>
                        <xsl:if test="//resinv:CheckResult/resinv:InventLineID">
                           <td align="center" class="common">Уникальный идентификатор строки в описи</td>
                        </xsl:if>
                        <td align="center" class="common">Код результата  обработки</td>
                        <td align="center" class="common" style="width:100mm">Описание  результата обработки</td>
                     </tr>
                     <xsl:apply-templates select="resinv:CheckResult"/>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="resinv:CheckResult">
      <tr>
         <td class="common">
            <xsl:value-of select="resinv:InvDocCode"/>
         </td>
         <td class="common">
            <xsl:value-of select="resinv:InvDocName"/>
         </td>
         <xsl:if test="//resinv:InvDocNumber">
            <td class="common">
               <xsl:value-of select="resinv:InvDocNumber"/>
            </td>
         </xsl:if>
         <xsl:if test="//resinv:InvDocDate">
            <td class="common">
               <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="resinv:InvDocDate"/>
               </xsl:call-template>
            </td>
         </xsl:if>
         <!--<td class="common"><xsl:value-of select="resinv:RecordNumber"/></td>-->
         <xsl:if test="//resinv:ArchID">
            <td class="common">
               <xsl:value-of select="resinv:ArchID"/>
            </td>
         </xsl:if>
         <xsl:if test="//resinv:ArchDocID">
            <td class="common">
               <xsl:value-of select="resinv:ArchDocID"/>
            </td>
         </xsl:if>
         <xsl:if test="//resinv:InventDocumentID">
            <td class="common">
               <xsl:value-of select="resinv:InventDocumentID"/>
            </td>
         </xsl:if>
         <xsl:if test="//resinv:InventLineID">
            <td class="common">
               <xsl:value-of select="resinv:InventLineID"/>
            </td>
         </xsl:if>
         <td class="common">
            <xsl:value-of select="resinv:CheckResultCode"/>
         </td>
         <td class="common">
            <xsl:value-of select="resinv:CheckResultDesc"/>
         </td>
      </tr>
   </xsl:template>
</xsl:stylesheet>
