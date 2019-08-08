<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="ngt cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ngt="urn:customs.ru:Information:ExchangeDocuments:NotifGoodsTimeOut:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 4.7.0.0 от 25.02.2009.   -->
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
   <xsl:template match="ngt:NotifGoodsTimeOut">
      <html>
         <head>
            <title>Уведомление об истечении сроков предъявления товаров</title>
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
               <h3>
						Уведомление об истечении сроков предъявления товаров
					</h3>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graphMain" style="width:90mm;">Идентификатор процесса, для которого запрашивается статус/история</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="ngt:ProcessID"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:90mm;">Дата и время смены статуса</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ngt:StateChDate"/>
                           </xsl:call-template>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="ngt:StateChTime"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" style="width:90mm;">Текущий статус процесса</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="ngt:ProcState"/>
                        </td>
                     </tr>
                     <xsl:if test="ngt:StateDescription">
                        <tr>
                           <td class="graphMain" style="width:90mm;">Описание текущего статусного состояния</td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="ngt:StateDescription"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graphMain" style="width:90mm;">Предыдущий статус процесса</td>
                        <td class="graph" style="width:90mm;">
                           <xsl:value-of select="ngt:PrevProcState"/>
                        </td>
                     </tr>
                     <xsl:if test="ngt:PrevStateDescription">
                        <tr>
                           <td class="graphMain" style="width:90mm;">Описание предыдущего статусного состояния</td>
                           <td class="graph" style="width:90mm;">
                              <xsl:value-of select="ngt:PrevStateDescription"/>
                           </td>
                        </tr>
                     </xsl:if>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
