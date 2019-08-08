<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:efo="urn:customs.ru:Information:CommercialFinanceDocuments:ExtractFromOrder:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="efo:ExtractFromOrder">
      <html>
         <head>
            <title>Выписка из приказа о приеме на работу/переводу на другую работу </title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 6.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; /*white-space: nowrap;*/ padding-left:4pt }
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
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					span.bold { font-size: 12.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 12.0pt; font-family: Courier; color: windowtext; }
					div.page { width: 210mm; height: 297mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					p.value { margin-top:1.0pt; margin-right:0cm; margin-bottom:0cm; margin-left:0cm; margin-bottom:.0001pt; text-align:justify; font-size:10.0pt; font-family:Arial;	}
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graph-number { font-size: 9pt; font-weight: bold; }
					.graph-big { font-size: 9pt; }
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="center" class="border-bottom" colspan="4" height="58" valign="bottom" width="478">
                        <h2>
                           <xsl:value-of select="efo:Organization/cat_ru:ShortName"/>
                        </h2>
                     </td>
                     <td colspan="5" height="58" width="201"/>
                  </tr>
                  <tr>
                     <td align="center" colspan="4" height="83" rowspan="4" valign="bottom" width="478">
                        <h3>
                           <xsl:value-of select="efo:Organization/cat_ru:OrganizationName"/>
                        </h3>
                     </td>
                     <td height="23" width="25">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td height="23" width="22">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td height="23" width="49">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" class="border" colspan="2" height="23" width="105">
								Код</td>
                  </tr>
                  <tr>
                     <td align="right" colspan="3" height="21" width="96">Форма по ОКУД</td>
                     <td align="center" class="border" colspan="2" height="21" width="105">0301004</td>
                  </tr>
                  <tr>
                     <td align="right" colspan="3" height="21" width="96">Форма по ОКПО</td>
                     <td class="border" colspan="2" height="21" width="105">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td height="14" width="25"/>
                     <td height="14" width="22"/>
                     <td height="14" width="49"/>
                     <td height="14" width="58"/>
                     <td height="14" width="47"/>
                  </tr>
                  <tr>
                     <td height="20" width="138"/>
                     <td height="20" width="167">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td height="20" width="53">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" class="border" colspan="2" height="20" width="145">
								Номер документа</td>
                     <td align="center" class="border" colspan="3" height="20" width="129">
								Дата</td>
                     <td height="20" width="47">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" colspan="3" height="46" width="358">
                        <span style="font-size: 12.0pt">
                           <b>ВЫПИСКА из ПРИКАЗА</b>
                        </span>
                        <br/>
                        <xsl:if test="efo:OrderEmploymentTransfer='1'">
                           <span style="font-size: 9.0pt">
                              <b>о приеме на работу</b>
                           </span>
                        </xsl:if>
                        <xsl:if test="efo:OrderEmploymentTransfer = '0'">
                           <span style="font-size: 9.0pt">
                              <b>о переводе на другую работу</b>
                           </span>
                        </xsl:if>
                     </td>
                     <td align="center" class="border" colspan="2" height="46" width="145">
                        <span class="value">
                           <xsl:value-of select="efo:DocumentReference/cat_ru:PrDocumentName"/>
                           <xsl:text> № </xsl:text>
                           <xsl:value-of select="efo:DocumentReference/cat_ru:PrDocumentNumber"/>
                        </span>
                     </td>
                     <td align="center" class="border" colspan="3" height="46" width="129">
                        <span class="value">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="efo:DocumentReference/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                        </span>
                     </td>
                     <td height="46" width="47">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3" height="34" width="358"/>
                     <td height="34" width="120">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td height="34" width="25">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td height="34" width="22">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td colspan="2" height="34" width="107"/>
                     <td height="34" width="47">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td height="12" width="138"/>
                     <td height="12" width="167"/>
                     <td height="12" width="53"/>
                     <td height="12" width="120"/>
                     <td colspan="2" height="12" width="47"/>
                     <td align="center" class="border" colspan="2" height="12" width="107">Дата</td>
                     <td height="12" width="47"/>
                  </tr>
                  <tr>
                     <td class="value" colspan="3" height="21" width="358">
                        <xsl:choose>
                           <xsl:when test="efo:OrderEmploymentTransfer=('true' or '1')">
										1. Принять на работу
									</xsl:when>
                           <xsl:otherwise>1.  Перевести на другую работу</xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td height="21" width="120">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td class="border" colspan="2" height="21" width="47">
								c</td>
                     <td class="border" colspan="2" height="21" width="107">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="efo:BeginDate"/>
                        </xsl:call-template>
                     </td>
                     <td height="21" width="47">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td height="17" width="138"/>
                     <td height="17" width="167"/>
                     <td height="17" width="53"/>
                     <td height="17" width="120"/>
                     <td class="border" colspan="2" height="17" width="25">
								по</td>
                     <td class="border" colspan="2" height="17" width="107">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="efo:EndDate"/>
                        </xsl:call-template>
                     </td>
                     <td height="17" width="49"/>
                  </tr>
                  <tr>
                     <td colspan="9" height="20" width="679">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="border-bottom" colspan="4" height="31" width="478">
                        <span class="value">
                           <xsl:value-of select="efo:Employee/cat_ru:PersonSurname"/> 
									<xsl:value-of select="efo:Employee/cat_ru:PersonName"/> 
									<xsl:value-of select="efo:Employee/cat_ru:PersonMiddleName"/> 
								</span>
                     </td>
                     <td class="border-bottom" height="31" width="25">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td class="border-bottom" height="31" width="22">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" class="border" colspan="2" height="31" width="107">
								Табельный <br/> номер <br/>
                        <span class="value">
                           <xsl:value-of select="efo:Employee/efo:ClockNumber"/>
                        </span>
                     </td>
                     <td height="31" width="47">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="border-bottom" colspan="9" height="42" valign="top" width="679">
								фамилия, имя, отчество <br/>
                        <br/>
                        <span class="value">
                           <xsl:value-of select="efo:WorkKind"/>
                        </span>
                     </td>
                  </tr>
                  <tr align="center">
                     <td align="center" class="border-bottom" colspan="9" valign="top" width="679">
							вид перевода (постоянно, временно)
							<br/>
                        <br/>
                        <span class="value">
                           <xsl:for-each select="efo:TermsKindWork">
                              <xsl:value-of select="."/>
                              <br/>
                           </xsl:for-each>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" colspan="9" height="42" valign="top" width="679">
								(условия приема на работу, характер работы) 
								</td>
                  </tr>
                  <tr>
                     <td align="center" class="border-right" height="94" rowspan="3" width="138">
								прежнее место<br/>работы</td>
                     <td class="border-bottom" colspan="8" height="27" width="541">
                        <p align="left" class="value">
                           <xsl:value-of select="efo:LastEmployeePlace/efo:DepartmentName"/>
                        </p>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="border-bottom" colspan="8" height="31" width="541">
								наименование структурного подразделения<br/>
                        <p align="left" class="value">
                           <xsl:value-of select="efo:LastEmployeePlace/efo:PersonPost"/>
                        </p>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" colspan="8" height="34" valign="top" width="541">
							наименование профессии (должности), разряд, класс (категория) квалификации</td>
                  </tr>
                  <tr>
                     <td class="border-bottom" colspan="9" height="50" width="679">
                        <p class="value">
                           <xsl:value-of select="efo:TransferReason"/>
                        </p>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" colspan="9" height="27" valign="top" width="679">
								причина перевода</td>
                  </tr>
                  <tr>
                     <td align="center" class="border-right" height="124" rowspan="5" width="138">
								новое место<br/>работы</td>
                     <td class="border-bottom" colspan="8" height="28" width="541">
                        <p align="left" class="value">
                           <xsl:value-of select="efo:NewEmployeePlace/efo:DepartmentName"/>
                        </p>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="border-bottom" colspan="8" height="30" width="541">
								наименование структурного подразделения<br/>
                        <p align="left" class="value">
                           <xsl:value-of select="efo:NewEmployeePlace/efo:PersonPost"/>
                        </p>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="border-bottom" colspan="8" height="27" valign="top" width="541">
								наименование профессии (должности), разряд, класс (категория) квалификации</td>
                  </tr>
                  <tr>
                     <xsl:choose>
                        <xsl:when test="contains('efo:NewEmployeePlace/efo:MounthlyWage','.')='true'">
                           <td height="28" width="167">
								оклад (тарифная ставка)</td>
                           <td height="28" width="53"/>
                           <td align="right" class="border-bottom" colspan="2" height="28" width="145">
                              <p align="right" class="value">
                                 <xsl:value-of select="substring-before('efo:NewEmployeePlace/efo:MounthlyWage','.')"/>
                              </p>
                           </td>
                           <td height="28" width="22">
								руб</td>
                           <td align="right" class="border-bottom" colspan="2" height="28" width="107">
                              <p align="right" class="value">
                                 <xsl:value-of select="substring-after('efo:NewEmployeePlace/efo:MounthlyWage','.')"/>
                                 <!--xsl:value-of select="efo:NewEmployeePlace/efo:MounthlyWage"/-->
                              </p>
                           </td>
                           <td height="28" width="47">
								коп</td>
                        </xsl:when>
                        <xsl:otherwise>
                           <td height="28" width="167">
								оклад (тарифная ставка)</td>
                           <td height="28" width="53"/>
                           <td align="right" class="border-bottom" colspan="2" height="28" width="145">
                              <p align="right" class="value">
                                 <xsl:value-of select="efo:NewEmployeePlace/efo:MounthlyWage"/>
                              </p>
                           </td>
                           <td height="28" width="22">
								руб</td>
                           <td align="right" class="border-bottom" colspan="2" height="28" width="107">
                              <p align="right" class="value">00
								</p>
                           </td>
                           <td height="28" width="47">
								коп</td>
                        </xsl:otherwise>
                     </xsl:choose>
                  </tr>
                  <tr>
                     <xsl:choose>
                        <xsl:when test="contains('efo:NewEmployeePlace/efo:ExtraPay','.')='true'">
                           <td height="11" width="167">
								Надбавка</td>
                           <td height="11" width="53"/>
                           <td align="right" class="border-bottom" colspan="2" height="11" width="145">
                              <p align="right" class="value">
                                 <xsl:value-of select="substring-before(efo:NewEmployeePlace/efo:ExtraPay,'.')"/>
                              </p>
                           </td>
                           <td height="11" width="22">
								руб</td>
                           <td align="right" class="border-bottom" colspan="2" height="11" width="107">
                              <p align="right" class="value">
                                 <xsl:value-of select="substring-after(efo:NewEmployeePlace/efo:ExtraPay,'.')"/>
                              </p>
                           </td>
                           <td height="11" width="47">
								коп</td>
                        </xsl:when>
                        <xsl:otherwise>
                           <td height="11" width="167">
								Надбавка</td>
                           <td height="11" width="53"/>
                           <td align="right" class="border-bottom" colspan="2" height="11" width="145">
                              <p align="right" class="value">
                                 <xsl:value-of select="efo:NewEmployeePlace/efo:ExtraPay"/>
                              </p>
                           </td>
                           <td height="11" width="22">
								руб</td>
                           <td align="right" class="border-bottom" colspan="2" height="11" width="107">
                              <p align="right" class="value">00</p>
                           </td>
                           <td height="11" width="47">
								коп</td>
                        </xsl:otherwise>
                     </xsl:choose>
                  </tr>
                  <tr>
                     <td align="left" class="border-bottom" colspan="17" valign="top" width="679">
                        <br/>
                        <br/>
                        <span class="value">
								С испытанием на срок <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:value-of select="efo:TrialPeriod"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>месяцев
							</span>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" colspan="9" height="27" valign="top">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
                  <tr>
                     <td class="value" colspan="9" height="49" width="679">
                        <b>Основание:</b>
                        <p/>
                        <xsl:for-each select="efo:Ground">
							<xsl:value-of select="cat_ru:PrDocumentName"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>№<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:value-of select="cat_ru:PrDocumentNumber"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>от<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:call-template name="russian_date">
							   <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>
							<xsl:if test="position()!=last()"><br/></xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <xsl:if test="efo:EmployeeLNP">
                     <tr>
                        <td class="value" colspan="9" height="41" width="679">
									2. <xsl:value-of select="efo:EmployeeLNP"/>
                        </td>
                     </tr>
                  </xsl:if>
               </table>
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td align="left" class="graph" rowspan="2" style="width:60mm;" valign="middle">
													
													Руководитель организации <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:60mm;border-bottom:solid 0.8pt #000000;" valign="bottom">
                           <xsl:value-of select="efo:PersonSignature/cat_ru:PersonPost"/>
                        </td>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:55mm;border-bottom:solid 0.8pt #000000;" valign="bottom">
                           <xsl:value-of select="efo:PersonSignature/cat_ru:PersonSurname"/> 
									<xsl:value-of select="efo:PersonSignature/cat_ru:PersonName"/> 
									<xsl:value-of select="efo:PersonSignature/cat_ru:PersonMiddleName"/> 
									<xsl:if test="efo:PersonSignature/cat_ru:IssueDate">
													/<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="efo:PersonSignature/cat_ru:IssueDate"/>
                              </xsl:call-template>/
													</xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:60mm;" valign="top">
                           <xsl:text>(должность)</xsl:text>
                        </td>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:60mm;" valign="top">
                           <xsl:text>(подпись)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" rowspan="2" style="width:60mm;" valign="middle">
													
													C приказом работник ознакомлен <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:60mm;border-bottom:solid 0.8pt #000000;" valign="bottom">
                           <xsl:value-of select="efo:Employee/cat_ru:PersonSurname"/> 
									<xsl:value-of select="efo:Employee/cat_ru:PersonName"/> 
									<xsl:value-of select="efo:Employee/cat_ru:PersonMiddleName"/> 
								</td>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graph" style="width:55mm;border-bottom:solid 0.8pt #000000;" valign="bottom">
                           <xsl:if test="efo:PersonSignature/cat_ru:IssueDate">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="efo:Employee/cat_ru:IssueDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" style="width:60mm;" valign="top">
                           <xsl:text>(подпись)</xsl:text>
                        </td>
                        <td>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:60mm;" valign="top">
                           <xsl:text>(дата)</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
