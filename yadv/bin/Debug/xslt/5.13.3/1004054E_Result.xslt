<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="  cat_ru rslt" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rslt="urn:customs.ru:Information:ExchangeDocuments:Result:5.11.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="rslt:Result">
      <html>
         <head>
            <title>Результат выполнения операции</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
				text-align: center;
					background: #cccccc;
					}
					
				div.page {
					/*width: 297mm;*/
					height: 210mm;
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
					font-size: 11pt;
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
					font-size: 10pt;
					}
				td {
					font-family:Courier;
					}

				.graphMain {
					font-family: Arial;
					font-size: 11pt;
					font-weight: bold;
					}

				</style>
         </head>
         <body>
            <div class="page">
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" class="graph" style="border-bottom:solid 0.8pt #000000;">
                           <span class="graph">Идентификатор исходного документа: </span>
                           <xsl:value-of select="cat_ru:RefDocumentID"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphMain">РЕЗУЛЬТАТ ВЫПОЛНЕНИЯ ОПЕРАЦИИ</td>
                     </tr>
                     <tr/>
                     <xsl:for-each select="rslt:Response">
                        <tr>
                           <td class="graph" style="border-bottom:solid 0pt #000000;">
                              <span class="graph">Идентификатор запроса / обработанного документа: </span>
                              <xsl:value-of select="rslt:RefDocumentID"/>
                              <br/>
                              <xsl:for-each select="rslt:ResultInformation">
                                 <xsl:if test="rslt:ResultSource">
                                    <span class="graph">Подсистема, вернувшая результат: </span>
                                    <xsl:value-of select="rslt:ResultSource"/>
                                    <br/>
                                 </xsl:if>
                                 <span class="graph">Код результата: </span>
                                 <xsl:value-of select="rslt:ResultCode"/>
                                 <br/>
                                 <span class="graph">Текстовое описание результата: <br/></span>
                                 <xsl:for-each select="rslt:ResultDescription">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position()!=last()"><br/></xsl:if>
                                 </xsl:for-each>
                                 <br/>
                                 <xsl:if test="rslt:ResultCategory">
                                    <span class="graph">Степень критичности ошибки: </span>
                                    <xsl:value-of select="rslt:ResultCategory"/>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rslt:ItemInfo">
                                    <span class="graph">Элемент с ошибкой: </span>
                                    <xsl:value-of select="rslt:ItemInfo/rslt:RefItem"/>
                                    <xsl:if test="rslt:ItemInfo/rslt:RecommendValue">
													, рекомендуемое значение: 
													<xsl:value-of select="rslt:ItemInfo/rslt:RecommendValue"/>
                                    </xsl:if>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rslt:EADInfo">
                                    <br/>
                                    <span class="graphMain">Сведения электронного архива декларанта</span>
                                    <br/>
                                    <xsl:if test="rslt:EADInfo/rslt:ArchDeclID">
                                       <span class="graph">Идентификатор декларанта: </span>
                                       <xsl:value-of select="rslt:EADInfo/rslt:ArchDeclID"/>
                                       <br/>
                                    </xsl:if>
                                    <xsl:if test="rslt:EADInfo/rslt:ArchID">
                                       <span class="graph">Идентификатор архива: </span>
                                       <xsl:value-of select="rslt:EADInfo/rslt:ArchID"/>
                                       <br/>
                                    </xsl:if>
                                    <xsl:if test="rslt:EADInfo/rslt:ArchDocID">
                                       <span class="graph">Идентификатор документа в архиве: </span>
                                       <xsl:value-of select="rslt:EADInfo/rslt:ArchDocID"/>
                                       <br/>
                                    </xsl:if>
                                    <xsl:if test="rslt:EADInfo/rslt:ArchDocStatus">
                                       <span class="graph">Статус документа в архиве: </span>
                                       <xsl:value-of select="rslt:EADInfo/rslt:ArchDocStatus"/>
                                       <br/>
                                    </xsl:if>
                                 </xsl:if>
                                 <xsl:if test="rslt:ProcInformation">
                                    <br/>
                                    <span class="graphMain">Информация о процессе</span>
                                    <br/>
                                    <span class="graph">Идентификатор процесса: </span>
                                    <xsl:value-of select="rslt:ProcInformation/rslt:ProcessID"/>
                                    <br/>
                                    <xsl:if test="rslt:ProcInformation/rslt:ProcState">
                                       <span class="graph">Статус процесса: </span>
                                       <xsl:value-of select="rslt:ProcInformation/rslt:ProcState"/>
                                       <br/>
                                    </xsl:if>
                                    <xsl:if test="rslt:ProcInformation/rslt:StateDescription">
                                       <span class="graph">Описание статуса: </span>
                                       <xsl:value-of select="rslt:ProcInformation/rslt:StateDescription"/>
                                       <br/>
                                    </xsl:if>
                                    <xsl:if test="rslt:ProcInformation/rslt:SoftVersion">
										<span class="graph">Версия ПО: </span>
                                       <xsl:value-of select="rslt:ProcInformation/rslt:SoftVersion"/>
                                       <br/>
                                    </xsl:if>
                                    <xsl:if test="rslt:ProcInformation/rslt:EventList">
                                       <br/>
                                       <span class="graph">Список сообщений</span>
                                       <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                          <tbody>
                                             <tr>
                                                <td align="center" class="graph" style="width:10mm;" valign="top">
                                                   <span class="graph">Код</span>
                                                </td>
                                                <td align="center" class="graph" style="width:25mm;" valign="top">
                                                   <span class="graph">Описание</span>
                                                </td>
                                                <td align="center" class="graph" style="width:20mm;" valign="top">
                                                   <span class="graph">Статус процесса после обработки сообщения</span>
                                                </td>
                                                <td align="center" class="graph" style="width:20mm;" valign="top">
                                                   <span class="graph">Дата и время приема сообщения</span>
                                                </td>
                                                <td align="center" class="graph" style="width:20mm;" valign="top">
                                                   <span class="graph">Дата и время отправки сообщения</span>
                                                </td>
                                                <td align="center" class="graph" style="width:20mm;" valign="top">
                                                   <span class="graph">Код вида д-та</span>
                                                </td>
                                                <td align="center" class="graph" style="width:25mm;" valign="top">
                                                   <span class="graph">Описание вида д-та</span>
                                                </td>
                                                <td align="center" class="graph" style="width:20mm;" valign="top">
                                                   <span class="graph">Идентификатор обработанного сообщения</span>
                                                </td>
                                                <td align="center" class="graph" style="width:20mm;" valign="top">
                                                   <span class="graph">Результат обработки документа</span>
                                                </td>
                                                <td align="center" class="graph" style="width:20mm;" valign="top">
                                                   <span class="graph">Ссылочный идентификатор сообщения</span>
                                                </td>
                                                <td align="center" class="graph" style="width:20mm;" valign="top">
                                                   <span class="graph">Дата и время создания сообщения</span>
                                                </td>
                                                <td align="center" class="graph" style="width:20mm;" valign="top">
                                                   <span class="graph">Идентификатор документ</span>
                                                </td>
                                                <td align="center" class="graph" style="width:20mm;" valign="top">
                                                   <span class="graph">Ссылочный идентификатор документа</span>
                                                </td>
                                             </tr>
                                             <xsl:for-each select="rslt:ProcInformation/rslt:EventList">
                                                <tr>
                                                   <td class="graph" style="width:10mm;" valign="top">
                                                      <xsl:value-of select="rslt:MessageCode"/>
                                                   </td>
                                                   <td class="graph" style="width:25mm;" valign="top">
                                                      <xsl:value-of select="rslt:MessageDescription"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                   <td class="graph" style="width:20mm;" valign="top">
                                                      <xsl:value-of select="rslt:ProcState"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                   <td class="graph" style="width:20mm;" valign="top">
                                                      <xsl:value-of select="rslt:RecvDateTime"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                   <td class="graph" style="width:20mm;" valign="top">
                                                      <xsl:value-of select="rslt:SendDateTime"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                   <td class="graph" style="width:20mm;" valign="top">
                                                      <xsl:value-of select="rslt:DocumentCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                   <td class="graph" style="width:25mm;" valign="top">
                                                      <xsl:value-of select="rslt:DocumentDescription"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                   <td class="graph" style="width:20mm;" valign="top">
                                                      <xsl:value-of select="rslt:MessageID"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                   <td class="graph" style="width:20mm;" valign="top">
                                                      <xsl:for-each select="rslt:DocumentResult">
                                                         <xsl:value-of select="rslt:ResultCode"/>
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         <xsl:value-of select="rslt:DocumentID"/>
                                                      </xsl:for-each>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                   <td class="graph" style="width:20mm;" valign="top">
                                                      <xsl:value-of select="rslt:MsgInitialEnvelopeID"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                   <td class="graph" style="width:20mm;" valign="top">
                                                      <xsl:value-of select="rslt:MsgPreparationDateTime"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                   <td class="graph" style="width:20mm;" valign="top">
                                                      <xsl:value-of select="rslt:MsgDocumentID"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                   <td class="graph" style="width:20mm;" valign="top">
                                                      <xsl:value-of select="rslt:MsgRefDocumentID"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                          </tbody>
                                       </table>
                                       <br/>
                                    </xsl:if>
                                 </xsl:if>
                              </xsl:for-each>
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
