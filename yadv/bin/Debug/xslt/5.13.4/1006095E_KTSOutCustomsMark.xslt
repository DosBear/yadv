<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="ktscm cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ktscm="urn:customs.ru:Information:CustomsDocuments:KTSOutCustomsMark:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="ktscm:KTSOutCustomsMark">
      <html>
         <head>
            <title>Служебные отметки КТС</title>
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
						font-size: 12pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
				</style>
         </head>
         <body>
            <div class="page">
               <h2>Служебные отметки КТС</h2>
               <br/>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graphMain" style="width:120mm;">
									Регистрационный номер таможенного документа:
								</td>
                        <td class="graph" style="width:60mm;">
                           <xsl:value-of select="ktscm:GTDID/cat_ru:CustomsCode"/>
                           <xsl:text> / </xsl:text>
                           <xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="ktscm:GTDID/cat_ru:RegistrationDate"/>
                           </xsl:call-template>
                           <xsl:text> / </xsl:text>
                           <xsl:value-of select="ktscm:GTDID/cat_ru:GTDNumber"/>
                        </td>
                     </tr>
                     <xsl:if test="ktscm:KTSOutCustomsMarkGoods">
                        <tr>
                           <td class="graphMain" colspan="2" style="width:180mm;">
										Служебные отметки по товарам
									</td>
                        </tr>
                        <tr>
                           <td colspan="2" style="width:180mm;">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:10mm;">Номер товара</td>
                                       <td align="center" class="graph" style="width:10mm;">Номер бланка формы КТС-1</td>
                                       <td align="center" class="graph" style="width:20mm;">Код вида обеспечения уплаты</td>
                                       <td align="center" class="graph" style="width:20mm;">Номер и дата документа</td>
                                       <td align="center" class="graph" style="width:40mm;">Служебная запись</td>
                                       <td align="center" class="graph" style="width:20mm;">Номер бланка основного листа пред- шествующей формы КТС</td>
                                       <td align="center" class="graph" style="width:20mm;">ФИО должност- ного лица</td>
                                       <td align="center" class="graph" style="width:10mm;">ЛНП долж- ностного лица</td>
                                       <td align="center" class="graph" style="width:15mm;">Дата внесения служебной отметки</td>
                                       <td align="center" class="graph" style="width:15mm;">Время внесения служебной отметки</td>
                                    </tr>
                                    <xsl:for-each select="ktscm:KTSOutCustomsMarkGoods">
                                       <tr>
                                          <td align="center" class="graph" style="width:10mm;">
                                             <xsl:value-of select="ktscm:GoodsNumeric"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:10mm;">
                                             <xsl:value-of select="ktscm:KTS1FormNumber"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="ktscm:PaymentEnsuringModeCodeType"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="ktscm:DocumentNumber"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="ktscm:DocumentDate"/>
                                             </xsl:call-template>
                                          </td>
                                          <td class="graph" style="width:40mm;">
                                             <xsl:value-of select="ktscm:MarkDescription"/>
                                          </td>
                                          <td align="center" class="graph" style="width:20mm;">
                                             <xsl:value-of select="ktscm:KTSFormNumber"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:20mm;">
                                             <xsl:value-of select="ktscm:CustomsPerson/cat_ru:PersonName"/>
                                          </td>
                                          <td align="center" class="graph" style="width:10mm;">
                                             <xsl:value-of select="ktscm:CustomsPerson/cat_ru:LNP"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:15mm;">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="ktscm:CustomsPerson/ktscm:MarkDate"/>
                                             </xsl:call-template>
                                          </td>
                                          <td align="center" class="graph" style="width:15mm;">
                                             <xsl:value-of select="ktscm:CustomsPerson/ktscm:MarkTime"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:180mm;">
									Общие служебные отметки
								</td>
                     </tr>
                     <tr>
                        <td colspan="2" style="width:180mm;">
                           <table border="1" cellpadding="3" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" style="width:10mm;">Номер бланка формы КТС-1</td>
                                    <td align="center" class="graph" style="width:20mm;">Обозначение графы</td>
                                    <td align="center" class="graph" style="width:20mm;">Код вида обеспечения уплаты</td>
                                    <td align="center" class="graph" style="width:20mm;">Номер и дата документа</td>
                                    <td align="center" class="graph" style="width:40mm;">Служебная запись</td>
                                    <td align="center" class="graph" style="width:20mm;">ФИО должност- ного лица</td>
                                    <td align="center" class="graph" style="width:20mm;">ЛНП должност- ного лица</td>
                                    <td align="center" class="graph" style="width:15mm;">Дата внесения служебной отметки</td>
                                    <td align="center" class="graph" style="width:15mm;">Время внесения служебной отметки</td>
                                 </tr>
                                 <xsl:for-each select="ktscm:KTSOutCustomsMarkGeneral">
                                    <tr>
                                       <td align="center" class="graph" style="width:10mm;">
                                          <xsl:value-of select="ktscm:KTS1FormNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graph" style="width:20mm;">
                                          <xsl:value-of select="ktscm:GRNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graph" style="width:20mm;">
                                          <xsl:value-of select="ktscm:PaymentEnsuringModeCodeType"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graph" style="width:20mm;">
                                          <xsl:value-of select="ktscm:DocumentNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="ktscm:DocumentDate"/>
                                          </xsl:call-template>
                                       </td>
                                       <td class="graph" style="width:40mm;">
                                          <xsl:value-of select="ktscm:MarkDescription"/>
                                       </td>
                                       <td class="graph" style="width:20mm;">
                                          <xsl:value-of select="ktscm:CustomsPerson/cat_ru:PersonName"/>
                                       </td>
                                       <td align="center" class="graph" style="width:20mm;">
                                          <xsl:value-of select="ktscm:CustomsPerson/cat_ru:LNP"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                       <td align="center" class="graph" style="width:15mm;">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="ktscm:CustomsPerson/ktscm:MarkDate"/>
                                          </xsl:call-template>
                                       </td>
                                       <td align="center" class="graph" style="width:15mm;">
                                          <xsl:value-of select="ktscm:CustomsPerson/ktscm:MarkTime"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                 </xsl:for-each>
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
</xsl:stylesheet>
