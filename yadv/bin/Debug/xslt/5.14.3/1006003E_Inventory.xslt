<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="ivt cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ivt="urn:customs.ru:Information:CustomsDocuments:Inventory:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="ivt:Inventory">
      <html>
         <head>
            <title>Опись документов к ДТ</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 3; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 6.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; padding-left:4pt; word-wrap:break-word; word-break: break-all}
					td.bold { font-size: 8.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 10.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
					td.border-left { border-left: medium none; border-right: .5pt solid black; }
					td.border { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: medium none; } 
					td.border-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; } 
					td.border-top { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-bottom { border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; } 
					td.border-top-bottom { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; } 
					td.border-top-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-top-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left-right-bottom { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right-top { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; }
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					td.border-left-top { border-left: .5pt solid windowtext; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-right-top { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					span.bold { font-size: 12.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 12.0pt; font-family: Arial; color: windowtext; }
					div.page { width: 210mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #ffffff; }
					p.number-date { font-weight: bold; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 12pt; }
					.graphLittle { font-family: Arial; font-size: 10pt; }
					.graphMain { font-family: Arial; font-size: 12pt;font-weight: bold;  }
					.graph-number { font-size: 9pt; font-weight: bold; }
					</style>
         </head>
         <body>
            <div class="page">
               <!--h3>ОПИСЬ ДОКУМЕНТОВ </h3-->
               <table align="center" cellpadding="0" cellspacing="0" style="width:160mm;;border:solid 0pt #000000;">
                     <tr>
                        <td align="center" class="graphMain" colspan="2">ОПИСЬ ДОКУМЕНТОВ, </td>
                     </tr>
                     <tr>
						 <td align="right" class="graphMain">предоставляемых </td>
						 <td align="left" class="graphMain" style="border-bottom:solid 1px black;">
							 <xsl:value-of select="ivt:GTDPerson/cat_ru:OrganizationName"/>
                        </td>
                     </tr>
                     <tr>
						<td/>
                        <td align="center" class="graphLittle">(наименование декларанта или таможенного представителя)</td>
                     </tr>
                </table>     
				<br/>
			   <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;table-layout: fixed;">
				 <tr>
					<td align="center" class="graph" style="width:10mm;border:solid 0.8pt #000000;">№ п/п</td>
					<!--td style="width:50mm;border:solid 0.8pt #000000;" class="graph">Вид, номер и дата составления документа</td-->
					<td align="center" class="graph" style="width:25mm;border:solid 0.8pt #000000;">Код вида документа</td>
					<td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">Наименование документа</td>
					<!--td style="width:10mm;border:solid 0.8pt #000000;" class="graph">Оригинал / копия</td-->
					<td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">Количество экземпляров</td>
					<td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">Количество листов </td>
					<td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">Способ предоставления документа </td>
					<td align="center" class="graph" style="width:55mm;border:solid 0.8pt #000000;">Примечание </td>
				 </tr>
				 <!--tr>
								<td colspan="6" style="width:180mm;border:solid 0.8pt #000000;" class="graph">1. Документы, необходимые для принятия ДТ</td>
							</tr-->
				 <xsl:for-each select="ivt:InventoryInstance/ivt:InventDocument">
					<!--xsl:if test="ivt:SectionNumber=0"-->
					<tr>
					   <td align="center" class="graph" style="width:10mm;border:solid 0.8pt #000000;">
						  <xsl:value-of select="position()"/>
					   </td>
					   <td align="center" class="graph" style="width:25mm;border:solid 0.8pt #000000;">
						  <xsl:value-of select="ivt:InvDocCode"/>
					   </td>
					   <td class="graph" style="width:30mm;border:solid 0.8pt #000000;">
						  <xsl:value-of select="ivt:InvDocName"/>
						  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						  <xsl:value-of select="ivt:InvDocNumber"/>
						  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						  <xsl:call-template name="russian_date">
							 <xsl:with-param name="dateIn" select="ivt:InvDocDate"/>
						  </xsl:call-template>
					   </td>
					   <!--td style="width:25mm;border:solid 0.8pt #000000;" class="value" align="center">
											<xsl:value-of select="ivt:InvDocCode"/>
										</td-->
					   <!--td style="width:10mm;border:solid 0.8pt #000000;" class="value" align="center">
											<xsl:choose>
												<xsl:when test="ivt:InvDocPresentation">
													<xsl:value-of select="ivt:InvDocPresentation"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</td-->
					   <td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">
						  <!--xsl:choose>
												<xsl:when test="(ivt:InvDocLists) or (ivt:InvDocCopies)">
													<xsl:value-of select="ivt:InvDocLists"/>
													<xsl:if test="ivt:InvDocCopies">
														<xsl:text> / </xsl:text>
														<xsl:value-of select="ivt:InvDocCopies"/>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:otherwise>
											</xsl:choose-->
						  <xsl:value-of select="ivt:InvDocCopies"/>
					   </td>
					   <td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">
						  <xsl:value-of select="ivt:InvDocLists"/>
					   </td>
					   <td align="center" class="graph" style="width:30mm;border:solid 0.8pt #000000;">
						  <xsl:choose>
							 <xsl:when test="(ivt:DocumentFormSign='true') or (ivt:DocumentFormSign='t') or (ivt:DocumentFormSign='1')">в виде бумажного документа</xsl:when>
							 <xsl:otherwise>в электронной форме</xsl:otherwise>
						  </xsl:choose>
					   </td>
					   <td class="graph" style="width:55mm;border:solid 0.8pt #000000;">
						  <xsl:if test="ivt:Note">
							 <xsl:value-of select="ivt:Note"/>
							 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						  </xsl:if>
						  <xsl:value-of select="ivt:PrevGTDNumber/cat_ru:CustomsCode"/>
						  <xsl:text> / </xsl:text>
						  <xsl:call-template name="russian_date_gtd">
							 <xsl:with-param name="dateIn" select="ivt:PrevGTDNumber/cat_ru:RegistrationDate"/>
						  </xsl:call-template>
						  <xsl:text> / </xsl:text>
						  <xsl:value-of select="ivt:PrevGTDNumber/cat_ru:GTDNumber"/>
						  <br/>
						  <xsl:if test="ivt:AddControlDescription"> 
											Решение о проведении дополнительной проверки
											<xsl:value-of select="ivt:AddControlDescription/ivt:AddControlNumber"/>
							 <xsl:if test="ivt:AddControlDescription/ivt:AddControlDate"> 
											от 
											<xsl:call-template name="russian_date">
								   <xsl:with-param name="dateIn" select="ivt:AddControlDescription/ivt:AddControlDate"/>
								</xsl:call-template>
							 </xsl:if>
						  </xsl:if>
						  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						  <xsl:if test="ivt:GoodsPresentDate">
							 <br/>
												Дата представления товарной партии<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							 <xsl:call-template name="russian_date_gtd">
								<xsl:with-param name="dateIn" select="ivt:GoodsPresentDate/ivt:PresentDate"/>
							 </xsl:call-template>
						  </xsl:if>
						  <xsl:if test="ivt:ArchDocID">
							 <br/>
							 <br/>ИН документа в ЭАДД - <xsl:value-of select="ivt:ArchDocID"/>
						  </xsl:if>
						  <xsl:if test="ivt:SerialNumberSign='1' or ivt:SerialNumberSign='t' or ivt:SerialNumberSign='true'">
							 <br/>
						  ЭПДТ (порядковый номер №<xsl:value-of select="ivt:SerialNumber"/>) является последней в последовательности<xsl:if test="ivt:SerialNumber"/>
						  </xsl:if>
						  <xsl:if test="ivt:PI_RegID">
							 <br/>
							  ИДПИ - <xsl:value-of select="ivt:PI_RegID"/>
						  </xsl:if>
					   </td>
					</tr>
					<!--/xsl:if-->
				 </xsl:for-each>
                </table>
               <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
							<xsl:if test="ivt:GTDNumber">
							УИН:
                                 <xsl:value-of select="ivt:GTDNumber/cat_ru:CustomsCode"/>
                                 <xsl:text>/</xsl:text>
                                 <xsl:call-template name="russian_date_gtd">
                                    <xsl:with-param name="dateIn" select="ivt:GTDNumber/cat_ru:RegistrationDate"/>
                                 </xsl:call-template>
                                 <xsl:text>/</xsl:text>
                                 <xsl:value-of select="ivt:GTDNumber/cat_ru:GTDNumber"/>
                            </xsl:if>
                        </td>
                     </tr>
					<xsl:if test="ivt:PrevMPO">
						<tr>
							<td class="graph">Предшествующие МПО:<br/>
								<xsl:apply-templates select="ivt:PrevMPO"/>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="ivt:SumCheck or ivt:CheckCurrency">
						<tr>
							<td class="graph">
								Сумма уплаты по чеку: <xsl:value-of select="ivt:SumCheck"/>
								<xsl:if test="ivt:CheckCurrency">
									<xsl:text> </xsl:text>
									<xsl:value-of select="ivt:CheckCurrency"/>
								</xsl:if>
							</td>
						</tr>
					</xsl:if>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <br/>
                           <!--Ф.И.О лица, подавшего ДТ,-->
									Ф.И.О лица, составившего опись:
									<u>
                              <xsl:value-of select="ivt:InventoryInstance/ivt:InventoryInstancePerson/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="ivt:InventoryInstance/ivt:InventoryInstancePerson/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="ivt:InventoryInstance/ivt:InventoryInstancePerson/cat_ru:PersonMiddleName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="ivt:InventoryInstance/ivt:InventoryInstancePerson/cat_ru:PersonPost"/>
                           </u>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <br>
                           <td class="graph" style="width:180mm;">
								Дата
									<u>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="ivt:InventoryInstance/ivt:InventoryInstanceDate"/>
                                 </xsl:call-template>
                              </u>
                           </td>
                        </br>
                     </tr>
                     <tr>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
								Подпись<text>__________________</text>
                        </td>
                     </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
	<xsl:template match="ivt:PrevMPO">
		<xsl:text>№ </xsl:text>
		<xsl:value-of select="ivt:MPONumber"/>
		<xsl:text> стоимость </xsl:text>
		<xsl:value-of select="ivt:Cost"/>
		<xsl:text> вес </xsl:text>
		<xsl:value-of select="ivt:LimitWeight"/>
		<xsl:if test="position()!=last()"><br/></xsl:if>
	</xsl:template>
</xsl:stylesheet>
