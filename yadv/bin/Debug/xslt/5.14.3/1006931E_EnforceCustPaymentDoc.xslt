<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ ФТС России от 21.11.2018 г. № 1876 "Об утверждении форм документов, применяемых таможенными органами в целях обеспечения взыскания таможенных платежей,
специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет имущества и обращения взыскания на товары-->
<!--
Приложение 1 - Решение таможенного органа о наложении ареста на имущество (DocType=РАИ)
Приложение 2 - Решение таможенного органа на пользование и распоряжение имуществом, на которое наложен арест (DocType=РПИ)
Приложение 3 - Заявление о замене ареста имущества на денежный залог (DocType=ЗЗИ)
Приложение 4 - Уведомление таможенного органа об отказе в замене ареста имущества на денежный залог(DocType=УОЗИ)
Приложение 5 - Решение таможенного органа о замене ареста имущества на денежный залог (DocType=РЗИ)
Приложение 7 - Решение таможенного органа об отмене ареста имущества (DocType=РОАИ)
Приложение 8 - Решение таможенного органа о наложении ареста на товары (DocType=РАТ)
Приложение 9 - Решение таможенного органа об обращении взыскания на товары (DocType=РОВТ)
Приложение 11 - Решение таможенного органа об отмене ареста товаров (DocType=РОАТ)
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ecpd="urn:customs.ru:Information:CustomsAuditDocuments:DecisionSeizedProperty:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа EnforceCustPaymentDocType -->
	<xsl:template match="ecpd:EnforceCustPaymentDoc">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									font-family: Arial;}

									div
									{
									/*white-space: nowrap;*/
									}

									div.page {
									width: 180mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm 10mm 10mm 20mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									.marg-top
									{
									margin-top:5mm;
									}

									table
									{
									width: 100%;
									border: 0;
									empty-cells: show;
									border-collapse: collapse;
									margin-top: 1px;
									}

									table.border tr td
									{
									border: 1px solid gray;
									}

									.graph {
									font-family: Arial;
									font-size: 10pt;
									}

									.value
									{
									border-bottom: solid 1px black;
									font-style: italic;
									text-align: center;
									}

									div.title, tr.title td { font-weight:bold;  }
									.bordered { border-collapse: collapse; }
									td.bordered
									{
									border: solid 1px windowtext;
									}

			                        .delim_3 {
				                    height: 3pt;
			                        }

									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}
									.graph8{
									font-size:8pt;
									}
									div.cellwidener {
									margin-top: 0pt;
									margin-left: 0pt;
									margin-bottom: 0pt;
									margin-right: 5pt;
									}
									.indent{
						             text-indent: 1.5em;
					                }	
									underline 
									{ text-decoration: underline; }
								</style>
			</head>
			<body>
				<div class="page">
					<xsl:choose>
						<xsl:when test="ecpd:DocType='РАИ'">
							<table width="100%">
								<tbody>
									<tr valign="top">
										<td width="50%"/>
										<td width="50%"/>
									</tr>
									<tr valign="top">
										<td/>
										<td align="center">САНКЦИОНИРУЮ</td>
									</tr>
									<tr valign="top">
										<td class="delim_3" colspan="2"/>
									</tr>
									<tr valign="top">
										<td align="right">Прокурор</td>
										<td class="value">
											<xsl:value-of select="ecpd:ProsecutorPerson/ecpd:ProsecutorOffice"/>
										</td>
									</tr>
									<tr valign="top">
										<td/>
										<td align="center" class="graph8">(наименование прокуратуры)</td>
									</tr>
									<tr valign="top">
										<td/>
										<td class="value">
											<xsl:apply-templates select="ecpd:ProsecutorPerson" mode="personBase"/>
											<xsl:value-of select="ecpd:ProsecutorPerson/ecpd:ClassRank"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr valign="top">
										<td/>
										<td align="center" class="graph8">(фамилия, имя, отчество (при наличии), классный чин)</td>
									</tr>
									<tr valign="top">
										<td/>
										<td class="value">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr valign="top">
										<td/>
										<td align="center" class="graph8">(подпись, печать)</td>
									</tr>
									<tr>
										<td colspan="2" align="right">
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:ProsecutorPerson/cat_ru:IssueDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="2">
											<br/>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td colspan="2">
											<b>
												<xsl:text>Решение таможенного органа о наложении ареста на имущество №  </xsl:text>
												<span class="value">&#160;  <xsl:value-of select="ecpd:RegNumber"/>&#160;  </span>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="2">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<table width="100%">
								<tbody>
									<tr>
										<td class="value" width="35%">
											<xsl:value-of select="ecpd:PlaceName"/>
										</td>
										<td width="30%"/>
										<td align="right" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DocDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">(населенный пункт)</td>
										<td colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="ecpd:CustomsIssued"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением) плательщиком (лицом, несущим солидарную обязанность с плательщиком по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней в срок, установленный правом Евразийского экономического союза и (или) законодательством Российской Федерации о таможенном регулировании, исисленных (начисленных):</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="NoticePayment" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании части 9 статьи 78 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>В обеспечение полноты взыскания подлежащих уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней в сумме </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="ecpd:TotalAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, в том числе: таможенных платежей, специальных, антидемпинговых, компенсационных пошлин </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="ecpd:PaymentsFeesAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей,  пеней </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="ecpd:PenaltyAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, процентов </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="ecpd:PercentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, наложить арест на имущество </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="ecpd:Owner"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сведения о лице, на имущество которого налагается арест)<span>
												<sup>1</sup>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:text>находящееся по адресу:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates select="ecpd:GoodsLocation"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">
											<xsl:text>(сведения о местонахождении имущества)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="Goods" select="."/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="ecpd:CustomsChief"/>
							<br/>
							<xsl:apply-templates select="ecpd:Executor"/>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="ecpd:DocType='РПИ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td colspan="3">
											<br/>
											<br/>
											<b>
												<xsl:text>Разрешение таможенного органа на пользование и распоряжение имуществом, на которое наложен арест №  </xsl:text>
												<span class="value">&#160;  <xsl:value-of select="ecpd:RegNumber"/>&#160; </span>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value" width="35%">
											<xsl:value-of select="ecpd:PlaceName"/>
										</td>
										<td width="30%"/>
										<td align="right" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DocDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">(населенный пункт)</td>
										<td colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td width="99%" class="value">
															<xsl:apply-templates select="ecpd:CustomsIssued"/>
														</td>
														<td width="1%">
															<xsl:text>,</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>рассмотрев заявление</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="ecpd:Owner"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сведения о заявителе, на имущество которого наложен арест)<span>
												<sup>1</sup>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:ApplicationUse/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="ecpd:ApplicationUse/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> на владение, пользование и распоряжение имуществом, в отношении которого принято решение таможенного органа о наложении ареста на имущество от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DecisionArrest/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="ecpd:DecisionArrest/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> , на основании части 5 статьи 78 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение: </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>Разрешить в период с </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:StartUseDate" name="date"/>
											</xsl:call-template>
											<xsl:text> по </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:EndUseDate" name="date"/>
											</xsl:call-template>
											<xsl:text> совершать следующие действия: </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:for-each select="ecpd:AllowedActions">
												<xsl:value-of select="."/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:for-each>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(действия по пользованию и распоряжению имуществом, разрешенные таможенным органом)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в отношении арестованного имущества:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="Goods" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>имущество должно находиться:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="ecpd:GoodsKeeper"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:if test="ecpd:GoodsKeeper/ecpd:StoragePlace">
												<xsl:text> Место хранения: </xsl:text>
												<xsl:apply-templates select="ecpd:GoodsKeeper/ecpd:StoragePlace"/>
											</xsl:if>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сведени о лице, которому передано на хранение имущество,<sup>2</sup> адрес и место хранения имущества)</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="ecpd:CustomsChief"/>
							<br/>
							<xsl:apply-templates select="ecpd:Executor"/>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);					</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>2 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);					</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="ecpd:DocType='ЗЗИ'">
							<table width="100%">
								<tbody>
									<tr valign="top">
										<td width="50%"/>
										<td width="50%"/>
									</tr>
									<tr valign="top">
										<td class="delim_3" colspan="2"/>
									</tr>
									<tr valign="top">
										<td align="right">Начальнику</td>
										<td class="value">
											<xsl:apply-templates select="ecpd:CustomsIssued"/>
										</td>
									</tr>
									<tr valign="top">
										<td/>
										<td align="center" class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr valign="top">
										<td align="right">от</td>
										<td class="value">
											<xsl:apply-templates mode="organization" select="ecpd:Owner"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr valign="top">
										<td/>
										<td align="center" class="graph8">(сведения о лице, на имущество которого наложен арест)<span>
												<sup>1</sup>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="2">
											<br/>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td colspan="2">
											<b>
												<xsl:text>Заявление о замене ареста имущества на денежный залог</xsl:text>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="2">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<table width="100%">
								<tbody>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>На основании части 36 статьи 78 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" в связи с принятым решением таможенного органа о наложении ареста на имущество от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DecisionArrest/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="ecpd:DecisionArrest/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> прошу заменить арест имущества на денежный залог. </xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>В качестве подтверждения внесения обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин в виде денежного залога в соответствии с частью 5 статьи 60 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" оформлена таможенная расписка</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td width="5%">
															<xsl:text>№ </xsl:text>
														</td>
														<td width="45%" class="value">
															<xsl:apply-templates select="ecpd:CustomsReceipt/ecpd:CustomsReceiptID"/>
														</td>
														<td align="center" width="15%">
															<xsl:text> на сумму </xsl:text>
														</td>
														<td width="30%" class="value">
															<xsl:value-of select="ecpd:CustomsReceipt/ecpd:CRAmount"/>
														</td>
														<td width="5%">
															<xsl:text> руб. </xsl:text>
														</td>
													</tr>
													<tr>
														<td/>
														<td align="center" class="graph8">
															<xsl:text> (реквизиты таможенной расписки) </xsl:text>
														</td>
														<td/>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<table width="100%">
								<tbody>
									<tr>
										<td class="value" width="60%"/>
										<td width="10%"/>
										<td class="value" width="20%">
											<xsl:value-of select="ecpd:ChiefSignature/cat_ru:PersonPost"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="ecpd:ChiefSignature" mode="personBase"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">
											<xsl:text>(подпись руководителя организации (индивидуального предпринимателя) или уполномоченного от имени организации (индивидуального предпринимателя) лица)</xsl:text>
										</td>
										<td/>
										<td valign="top" align="center" class="graph8">
											<xsl:text>(инициалы, фамилия)</xsl:text>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="left" colspan="3">
											<xsl:text>от  </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:ChiefSignature/cat_ru:IssueDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);					</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="ecpd:DocType='УОЗИ'">
							<table width="100%">
								<tbody>
									<tr valign="top">
										<td class="delim_3" colspan="3">
											<br/>
											<br/>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td colspan="3">
											<b>
												<xsl:text>Уведомление таможенного органа об отказе в замене ареста имущества на денежный залог</xsl:text>
											</b>
										</td>
									</tr>
									<tr valign="top">
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="left" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DocDate" name="date"/>
											</xsl:call-template>
										</td>
										<td align="right" width="30%">
											<xsl:text>№ </xsl:text>
										</td>
										<td class="value" width="35%">
											<xsl:value-of select="ecpd:RegNumber"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td class="value" width="99%">
															<xsl:apply-templates select="ecpd:CustomsIssued"/>
														</td>
														<td>
															<xsl:text>,</xsl:text>
														</td>
													</tr>
													<tr align="center">
														<td colspan="2" class="graph8">(наименование таможенного органа)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>рассмотрев обращение</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="ecpd:Owner"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сведения о лице, на имущество которого наложен арест)<span>
												<sup>1</sup>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify;">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:ReplacementReq/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text>, уведомляет об отказе в замене ареста имущества согласно принятому решению таможенного органа о наложении ареста на имущество от  </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DecisionArrest/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="ecpd:DecisionArrest/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> на денежный залог в связи с</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:for-each select="ecpd:DecisionReason">
												<xsl:value-of select="."/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:for-each>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(основания принятия решения)</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="ecpd:CustomsChief"/>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);					</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="ecpd:DocType='РЗИ'">
							<table width="100%">
								<tbody>
									<tr valign="top">
										<td class="delim_3" colspan="3">
											<br/>
											<br/>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td colspan="3">
											<b>
												<xsl:text>Решение таможенного органа о замене ареста имущества на денежный залог</xsl:text>
											</b>
										</td>
									</tr>
									<tr valign="top">
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="left" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DocDate" name="date"/>
											</xsl:call-template>
										</td>
										<td align="right" width="30%">
											<xsl:text>№ </xsl:text>
										</td>
										<td class="value" width="35%">
											<xsl:value-of select="ecpd:RegNumber"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr valign="top" align="center">
														<td width="99%" class="value">
															<xsl:apply-templates select="ecpd:CustomsIssued"/>
														</td>
														<td width="1%">
															<xsl:text>,</xsl:text>
														</td>
													</tr>
													<tr align="center">
														<td class="graph8">(наименование таможенного органа)</td>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>рассмотрев заявление</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="ecpd:Owner"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сведения о лице, на имущество которого наложен арест)<span>
												<sup>1</sup>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify;">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:ReplacementReq/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text>, на основании части 35 статьи 78 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимет решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>Заменить арест имущества согласно принятому решению таможенного органа о наложении ареста на имущество от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DecisionArrest/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="ecpd:DecisionArrest/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> на денежный залог, внесенный в качестве обеспечения исполнения обязаности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин по таможенной расписке</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td width="5%">
															<xsl:text>№ </xsl:text>
														</td>
														<td width="45%" class="value">
															<xsl:apply-templates select="ecpd:CustomsReceipt/ecpd:CustomsReceiptID"/>
														</td>
														<td align="center" width="15%">
															<xsl:text> на сумму </xsl:text>
														</td>
														<td width="30%" class="value">
															<xsl:value-of select="ecpd:CustomsReceipt/ecpd:CRAmount"/>
														</td>
														<td width="5%">
															<xsl:text> руб. </xsl:text>
														</td>
													</tr>
													<tr>
														<td/>
														<td align="center" class="graph8">
															<xsl:text> (реквизиты таможенной расписки) </xsl:text>
														</td>
														<td/>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="ecpd:CustomsChief"/>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);					</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="ecpd:DocType='РОАИ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td colspan="3">
											<br/>
											<br/>
											<b>
												<xsl:text>Решение таможенного органа об отмене ареста имущества</xsl:text>
												<br>
													<xsl:text>№  </xsl:text>
												</br>
												<span class="value">&#160;  <xsl:value-of select="ecpd:RegNumber"/>&#160;  </span>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value" width="35%">
											<xsl:value-of select="ecpd:PlaceName"/>
										</td>
										<td width="30%"/>
										<td align="right" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DocDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">(населенный пункт)</td>
										<td colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="ecpd:CustomsIssued"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании подпункта "</xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="ecpd:Paragraph"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text>" части 41 статьи 78 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>Отменить решение таможенного органа о наложении ареста на имущество от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DecisionArrest/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="ecpd:DecisionArrest/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> и снять наложенный в отношении имущества </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="ecpd:Owner"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(сведения о лице, на имущество которого наложен арест)<span>
												<sup>1</sup>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>арест имущества, находящегося по адресу:</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="99%" class="value">
															<xsl:apply-templates select="ecpd:GoodsLocation"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td valign="bottom" width="1%">
															<xsl:text>,</xsl:text>
														</td>
													</tr>
													<tr>
														<td align="center" class="graph8">(сведения о местонахождении арестованного имущества)</td>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>включающего:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="Goods" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="ecpd:CustomsChief"/>
							<br/>
							<xsl:apply-templates select="ecpd:Executor"/>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);					</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="ecpd:DocType='РАТ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td colspan="3">
											<br/>
											<br/>
											<b>
												<xsl:text>Решение таможенного органа о наложении ареста на товары</xsl:text>
												<br>
													<xsl:text>№  </xsl:text>
												</br>
												<span class="value">&#160;  <xsl:value-of select="ecpd:RegNumber"/>&#160;  </span>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value" width="35%">
											<xsl:value-of select="ecpd:PlaceName"/>
										</td>
										<td width="30%"/>
										<td align="right" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DocDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">(населенный пункт)</td>
										<td colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="ecpd:CustomsIssued"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в связи с неисполнением или ненадлежащим исполнением плательщиком (лицом, несущим солидарную обязанность с плательщиком по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин) обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней в срок, установленный правом Евразийского экономического союза и (или) законодательством Российской Федерации о таможенном регулировании, исчисленных (начисленных):</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="CustPaymentCalcDoc" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании части 14 статьи 78 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>В обеспечение полноты взыскания подлежащих уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней в сумме </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="ecpd:TotalAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, в том числе: таможенных платежей, специальных, антидемпинговых, компенсационных пошлин </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="ecpd:PaymentsFeesAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей,  пеней </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="ecpd:PenaltyAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, процентов </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="ecpd:PercentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> , в соответствии с принятым решением об обращении взыскания на товары от</xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DecisionCollect/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="ecpd:DecisionCollect/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<span class="graph8">
												<sup>2</sup>
											</span>
											<xsl:text> наложить арест на товары</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="97%" class="value" align="center">
															<xsl:choose>
																<xsl:when test="ecpd:Owner">
																	<xsl:apply-templates mode="organization" select="ecpd:Owner"/>
																</xsl:when>
																<xsl:when test="not(ecpd:Owner)">
																	<xsl:text>сведения о плательщике отсутствуют</xsl:text>
																</xsl:when>
															</xsl:choose>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td valign="bottom" width="3%">
															<xsl:text>, </xsl:text>
															<span class="graph8">
																<sup>3</sup>
															</span>
														</td>
													</tr>
													<tr align="center">
														<td class="graph8">(сведения о лице, на товары которого налагается арест)<span>
																<sup>4</sup>
															</span>
														</td>
														<td/>
													</tr>
													<tr>
														<td colspan="2" class="delim_3"/>
													</tr>
													<tr>
														<td colspan="2" style="text-align: justify">
															<xsl:text>находящиеся по адресу:</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="value">
															<xsl:apply-templates select="ecpd:GoodsLocation"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td valign="bottom" width="1%">
															<xsl:text>, </xsl:text>
														</td>
													</tr>
													<tr>
														<td align="center" class="graph8">(сведения о местонахождении товаров)</td>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>включающие:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="Goods" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="ecpd:CustomsChief"/>
							<br/>
							<xsl:apply-templates select="ecpd:Executor"/>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Федеральный закон от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза" (собрание законодательства российской Федерации, 2017, № 47, ст. 6843);</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>2 </sup>
											<xsl:text>При наличии такого решения;</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>3 </sup>
											<xsl:text>При отсутствии сведений о плательщике таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней указывается: "сведения о плательщике отсутствуют";</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>4 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);					</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="ecpd:DocType='РОВТ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td colspan="3">
											<br/>
											<br/>
											<b>
												<xsl:text>Решение таможенного органа об обращении взыскания на товары</xsl:text>
												<br>
													<xsl:text>№  </xsl:text>
												</br>
												<span class="value">&#160;  <xsl:value-of select="ecpd:RegNumber"/>&#160;  </span>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value" width="35%">
											<xsl:value-of select="ecpd:PlaceName"/>
										</td>
										<td width="30%"/>
										<td align="right" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DocDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">(населенный пункт)</td>
										<td colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="ecpd:CustomsIssued"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в связи с неисполнением (ненадлежащим исполнением) обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней в срок, установленный правом Евразийского экономического союза и (или) законодательством Российской Федерации о таможенном регулировании, исчисленных (начисленных):</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="CustPaymentCalcDoc" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<xsl:if test="ecpd:NoticePayment">
										<tr>
											<td style="text-align: justify">
												<xsl:text>при неисполнении в установленный срок уведомления (ий) (уточнения (ий) к уведомлению) о не плаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых пошлин, процентов и пеней:</xsl:text>
											</td>
										</tr>
										<tr>
											<td class="delim_3"/>
										</tr>
										<tr>
											<td>
												<xsl:apply-templates mode="NoticePaymentWithDate" select="."/>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="delim_3"/>
									</tr>
									<xsl:if test="not(ecpd:NoticePayment)">
										<tr>
											<td style="text-align: justify">
												<xsl:text>в случаях, предусмотренных частью 2 статьи 79 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" при которых уведомление(я) (уточнение(я) к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых пошлин, процентов и пеней не направлялось(лись)</xsl:text>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании части 3 статьи 79 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>Взыскать таможенные платежи, специальные, антидемпинговые, компенсационные пошлины, процентовы и пени на общую сумму </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="ecpd:TotalAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, в том числе: таможенные платежи, специальные, антидемпинговые, компенсационные пошлины </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="ecpd:PaymentsFeesAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, а также пени </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="ecpd:PenaltyAmount"/>&#160;&#160;&#160;</span>
											<xsl:text> рублей, проценты </xsl:text>
											<span class="value">&#160;&#160;&#160;<xsl:value-of select="ecpd:PercentAmount"/>&#160;&#160;&#160;</span>
											<xsl:text>рублей, за счет товаров </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="97%" class="value" align="center">
															<xsl:choose>
																<xsl:when test="ecpd:Owner">
																	<xsl:apply-templates mode="organization" select="ecpd:Owner"/>
																</xsl:when>
																<xsl:when test="not(ecpd:Owner)">
																	<xsl:text>сведения о плательщике отсутствуют</xsl:text>
																</xsl:when>
															</xsl:choose>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td valign="bottom" width="3%">
															<xsl:text>, </xsl:text>
															<span class="graph8">
																<sup>2</sup>
															</span>
														</td>
													</tr>
													<tr align="center">
														<td class="graph8">(сведения о плательщике)<span>
																<sup>3</sup>
															</span>
														</td>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>включающих:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="Goods" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="ecpd:CustomsChief"/>
							<br/>
							<xsl:apply-templates select="ecpd:Executor"/>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Федеральный закон от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза" (собрание законодательства российской Федерации, 2017, № 47, ст. 6843);</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>2 </sup>
											<xsl:text>При отсутствии сведений о плательщике таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней указывается: "сведения о плательщике отсутствуют";</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>3 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);					</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="ecpd:DocType='РОАТ'">
							<table width="100%">
								<tbody>
									<tr align="center" valign="top">
										<td colspan="3">
											<br/>
											<br/>
											<b>
												<xsl:text>Решение таможенного органа об отмене ареста товаров</xsl:text>
												<br>
													<xsl:text>№  </xsl:text>
												</br>
												<span class="value">&#160;  <xsl:value-of select="ecpd:RegNumber"/>&#160;  </span>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value" width="35%">
											<xsl:value-of select="ecpd:PlaceName"/>
										</td>
										<td width="30%"/>
										<td align="right" width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DocDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">(населенный пункт)</td>
										<td colspan="2"/>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:apply-templates select="ecpd:CustomsIssued"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование таможенного органа)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании подпункта "</xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="ecpd:Paragraph"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text>" части 41 статьи 78 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" принимает решение:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%;">
											<xsl:text>Отменить решение таможенного органа о наложении ареста на товары от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="ecpd:DecisionArrest/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="ecpd:DecisionArrest/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> и снять наложенный в отношении товаров </xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="97%" class="value" align="center">
															<xsl:choose>
																<xsl:when test="ecpd:Owner">
																	<xsl:apply-templates mode="organization" select="ecpd:Owner"/>
																</xsl:when>
																<xsl:when test="not(ecpd:Owner)">
																	<xsl:text>сведения о плательщике отсутствуют</xsl:text>
																</xsl:when>
															</xsl:choose>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td valign="bottom" width="3%">
															<span class="graph8">
																<sup>1</sup>
															</span>
														</td>
													</tr>
													<tr align="center">
														<td class="graph8">(сведения о лице, на товары которого наложен арест)<span>
																<sup>2</sup>
															</span>
														</td>
														<td/>
													</tr>
													<tr>
														<td colspan="2" class="delim_3"/>
													</tr>
													<tr>
														<td colspan="2" style="text-align: justify">
															<xsl:text>арест товаров, находящегося по адресу:</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="value">
															<xsl:apply-templates select="ecpd:GoodsLocation"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td valign="bottom" width="1%">
															<xsl:text>, </xsl:text>
														</td>
													</tr>
													<tr>
														<td align="center" class="graph8">(сведения о местонахождении арестованных товаров)</td>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>включающих:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="Goods" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<xsl:apply-templates select="ecpd:CustomsChief"/>
							<br/>
							<xsl:apply-templates select="ecpd:Executor"/>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>При отсутствии сведений о плательщике таможенных платежей,специальных, антидемпинговых, компенсационных пошлин, процентов и пеней указывается: "сведения о плательщике отсутствуют";</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>2 </sup>
											<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);					</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="organization" match="*">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">&#032;<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">,&#032;Код страны:&#032;<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">,&#032;ОПФ:&#032;<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:choose>
					<xsl:when test="RUScat_ru:AddressKindCode=1">,&#032;Адрес регистрации: </xsl:when>
					<xsl:when test="RUScat_ru:AddressKindCode=2">,&#032;Фактический адрес: </xsl:when>
					<xsl:when test="RUScat_ru:AddressKindCode=3">,&#032;Почтовый адрес: </xsl:when>
					<xsl:otherwise>
						<xsl:text>,&#032;Адрес: </xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<xsl:for-each select="RUScat_ru:CommunicationDetails">
				<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">,&#032;</span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">:&#032;</span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">,&#032;</span>
			<span class="italic">ОГРН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">,&#032;</span>
			<span class="italic">БИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">,&#032;</span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">,&#032;</span>
			<span class="italic">ИТН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal">&#032;/&#032;</span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">,&#032;</span>
			<span class="italic">УНП</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">,&#032;</span>
			<span class="italic">УНН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">,&#032;</span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">,&#032;УИТН:&#032;<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#032;(<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>)</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode"> Код ОПФ: <xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId"> (по справ. <xsl:value-of select="RUScat_ru:CodeListId"/>)</xsl:if>
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone"> Тел:<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>,&#032;</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">Факс: <xsl:value-of select="cat_ru:Fax"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:Telex">Телекс: <xsl:value-of select="cat_ru:Telex"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:E_mail">Email:<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>,&#032;</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails | ecpd:GoodsLocation | ecpd:StoragePlace">
		<xsl:for-each select="RUScat_ru:PostalCode|RUScat_ru:CountryCode|RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="Goods">
		<table>
			<tbody width="100%" select="ecpd:Goods">
				<tr valign="top" align="center">
					<td class="bordered" width="10%">№ п/п</td>
					<td class="bordered" width="40%">Наименование</td>
					<td class="bordered" width="15%">Количество (ед. изм)</td>
					<td class="bordered" width="35%">Индивидуальные признаки</td>
				</tr>
				<xsl:for-each select="ecpd:Goods">
					<tr align="center">
						<td class="bordered">
							<xsl:value-of select="position()"/>
						</td>
						<td class="bordered">
							<xsl:for-each select="ecpd:GoodsDescription">
								<!--xsl:apply-templates/-->
								<xsl:value-of select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:for-each>
						</td>
						<td class="bordered">
							<xsl:if test="ecpd:GoodsQuantity">
								<xsl:value-of select="ecpd:GoodsQuantity/cat_ru:GoodsQuantity"/>&#160;<xsl:if test="ecpd:GoodsQuantity/cat_ru:MeasureUnitQualifierName">
									<xsl:value-of select="ecpd:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
								</xsl:if>
								<xsl:if test="ecpd:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
													(<xsl:value-of select="ecpd:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)
													</xsl:if>
							</xsl:if>
						</td>
						<td class="bordered">
							<xsl:for-each select="ecpd:GoodsCharacteristics">
								<!--xsl:apply-templates/-->
								<xsl:value-of select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:for-each>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="ecpd:PaymentRequisitions">
		<!--xsl:value-of select="catComFin_ru:BankName"/-->
		<xsl:if test="catComFin_ru:OKPOID">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="catComFin_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:BICID">
			<xsl:text>, БИК: </xsl:text>
			<xsl:value-of select="catComFin_ru:BICID"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:SWIFTID">
			<xsl:text>, SWIFT: </xsl:text>
			<xsl:value-of select="catComFin_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:AccountNumeric">
			<xsl:text>, корр.счет: </xsl:text>
			<xsl:value-of select="catComFin_ru:AccountNumeric"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:CurrentCurrencyAccount">
			<xsl:text>, валютный счет (текущий): </xsl:text>
			<xsl:for-each select="catComFin_ru:CurrentCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catComFin_ru:TransitCurrencyAccount">
			<xsl:text>, валютный счет (транзитный): </xsl:text>
			<xsl:for-each select="catComFin_ru:TransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catComFin_ru:SpecialTransitCurrencyAccount">
			<xsl:text>, валютный счет (специальный): </xsl:text>
			<xsl:for-each select="catComFin_ru:SpecialTransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catComFin_ru:RoubleCurrencyAccount">
			<xsl:text>, рублевый счет: </xsl:text>
			<xsl:value-of select="catComFin_ru:RoubleCurrencyAccount"/>
		</xsl:if>
		<xsl:if test="catComFin_ru:BankPostalAddress">
			<xsl:text>, адрес: </xsl:text>
			<xsl:for-each select="catComFin_ru:BankPostalAddress/*">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="document" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ecpd:Executor">
		<table width="100%">
			<tbody>
				<tr valign="bottom">
					<td width="16%">Исполнитель</td>
					<td width="55%" class="value" align="center">
						<xsl:value-of select="cat_ru:PersonPost"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates mode="personBase" select="."/>
					</td>
					<td width="29%"/>
				</tr>
				<tr align="center" valign="top">
					<td/>
					<td class="graph8">(инициалы, фамилия должностного лица таможенного органа)</td>
					<td/>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="ecpd:CustomsChief">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="39%" align="left">Начальник таможенного органа<br/>(или лицо, им уполномоченное)</td>
					<td width="4%"/>
					<td class="value" width="12%"/>
					<td width="5%"/>
					<td class="value" width="40%">
						<xsl:value-of select="cat_ru:PersonPost"/>
						<xsl:apply-templates mode="personBase" select="."/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
				</tr>
				<tr align="center">
					<td class="graph8"/>
					<td/>
					<td class="graph8">(подпись)</td>
					<td/>
					<td class="graph8">(инициалы, фамилия)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="NoticePayment" match="*">
		<table width="100%">
			<tbody>
				<tr valign="top" align="center">
					<td class="bordered" width="10%">№ п/п</td>
					<td class="bordered" width="50%">Реквизиты уведомления (уточнения к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней</td>
					<td class="bordered" width="40%">Срок исполнения обазанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней</td>
				</tr>
				<xsl:for-each select="ecpd:NoticePayment">
					<tr align="center">
						<td class="bordered">
							<xsl:value-of select="position()"/>
						</td>
						<td class="bordered">
							<xsl:value-of select="cat_ru:PrDocumentNumber"/>
						</td>
						<td class="bordered">
							<xsl:apply-templates mode="russian_date" select="ecpd:PeriodExecution"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="NoticePaymentWithDate" match="*">
		<table width="100%">
			<tbody>
				<tr valign="top" align="center">
					<td class="bordered" rowspan="2">№ п/п</td>
					<td class="bordered" colspan="3">Уведомление (уточнение к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсациоанных пошлин, процентов и пеней</td>
				</tr>
				<tr align="center">
					<td class="bordered">регистрационный номер</td>
					<td class="bordered">дата</td>
					<td class="bordered">срок исполнения</td>
				</tr>
				<xsl:for-each select="ecpd:NoticePayment">
					<tr align="center">
						<td class="bordered">
							<xsl:value-of select="position()"/>
						</td>
						<td class="bordered">
							<xsl:value-of select="cat_ru:PrDocumentNumber"/>
						</td>
						<td class="bordered">
							<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
						</td>
						<td class="bordered">
							<xsl:apply-templates mode="russian_date" select="ecpd:PeriodExecution"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="CustPaymentCalcDoc" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="top">
					<td width="10%" class="bordered">№ п/п</td>
					<td width="60%" class="bordered">Реквизиты корректировки декларации на товары, расчета таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин, корректировки таможенного приходного ордера либо заявления, предусмотренного пунктом 4 статьи 277 Таможенного кодекса Евразийского экономического союза<span class="graph8">
							<sup>1</sup>
						</span>
					</td>
					<td width="30%" class="bordered">Срок исполнения обязанности по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней</td>
				</tr>
				<xsl:for-each select="ecpd:CustPaymentCalc">
					<tr valign="top">
						<td align="center" class="bordered">
							<xsl:value-of select="position()"/>
						</td>
						<td align="left" class="bordered">
							<xsl:choose>
								<xsl:when test="ecpd:CustPaymentCalcDoc/ecpd:KDTID">
									<xsl:text>КДТ: </xsl:text>
									<xsl:apply-templates mode="gtd_number" select="ecpd:CustPaymentCalcDoc/ecpd:KDTID"/>
								</xsl:when>
								<xsl:when test="ecpd:CustPaymentCalcDoc/ecpd:CPCID">
									<xsl:text>РТП: </xsl:text>
									<xsl:apply-templates mode="gtd_number" select="ecpd:CustPaymentCalcDoc/ecpd:CPCID"/>
								</xsl:when>
								<xsl:when test="ecpd:CustPaymentCalcDoc/ecpd:KTPOID">
									<xsl:text>КТПО: </xsl:text>
									<xsl:text> тип ордера:</xsl:text>
									<xsl:value-of select="ecpd:CustPaymentCalcDoc/ecpd:KTPOID/ecpd:TPOTypeCode/ecpd:MovementPurpose"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="ecpd:CustPaymentCalcDoc/ecpd:KTPOID/ecpd:TPOTypeCode/ecpd:MovementWay"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="ecpd:CustPaymentCalcDoc/ecpd:KTPOID/ecpd:TPOTypeCode/ecpd:TransportKindCode"/>
									<br>
										<xsl:text> справочный номер:</xsl:text>
										<xsl:value-of select="ecpd:CustPaymentCalcDoc/ecpd:KTPOID/ecpd:TPORegNumber/ecpd:CustomsCode"/>
										<xsl:text>/</xsl:text>
										<xsl:apply-templates mode="num_date" select="ecpd:CustPaymentCalcDoc/ecpd:KTPOID/ecpd:TPORegNumber/ecpd:RegistrationDate"/>
										<xsl:text>/</xsl:text>
										<xsl:value-of select="ecpd:CustPaymentCalcDoc/ecpd:KTPOID/ecpd:TPORegNumber/ecpd:DocNumber"/>
									</br>
								</xsl:when>
								<xsl:when test="ecpd:CustPaymentCalcDoc/ecpd:Application">
									<xsl:text>ЗРА: </xsl:text>
									<xsl:value-of select="ecpd:CustPaymentCalcDoc/ecpd:Application/cat_ru:PrDocumentName"/>
									<xsl:if test="ecpd:CustPaymentCalcDoc/ecpd:Application/cat_ru:PrDocumentDate">
										<xsl:text> от </xsl:text>
										<xsl:apply-templates select="ecpd:CustPaymentCalcDoc/ecpd:Application/cat_ru:PrDocumentDate" mode="russian_date"/>
									</xsl:if>
									<xsl:if test="ecpd:CustPaymentCalcDoc/ecpd:Application/cat_ru:PrDocumentNumber">
										<xsl:text> №  </xsl:text>
										<xsl:value-of select="ecpd:CustPaymentCalcDoc/ecpd:Application/cat_ru:PrDocumentNumber"/>
									</xsl:if>
								</xsl:when>
							</xsl:choose>
						</td>
						<td align="center" class="bordered">
							<xsl:apply-templates mode="russian_date" select="ecpd:PeriodExecution"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="personBase">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="ecpd:CustomsIssued">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="not(cat_ru:OfficeName) and adt_cat:FullOfficeName">
			<xsl:value-of select="adt_cat:FullOfficeName"/>
		</xsl:if>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text>)</xsl:text>
	</xsl:template>
	<xsl:template match="ecpd:CustomsReceiptID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:if test="ecpd:DocNumberPrefix">
			<xsl:value-of select="ecpd:DocNumberPrefix"/>
			<xsl:text>-</xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template mode="gtd_number" match="*">
		<xsl:if test="./*[local-name()='DocNumberPrefix']">
			<xsl:value-of select="./*[local-name()='DocNumberPrefix']"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="./*[local-name()='CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="./*[local-name()='RegistrationDate']"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="./*[local-name()='RegNumber']|./*[local-name()='GTDNumber']"/>
		<xsl:if test="./*[local-name()='Code']">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="./*[local-name()='Code']"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="num_date" match="*">
		<xsl:param name="dateIn" select="."/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="text_date">
		<xsl:param name="date"/>«<span class="value">&#160;<xsl:choose>
				<xsl:when test="substring($date,9,2)">
					<xsl:value-of select="substring($date,9,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>&#160;</span>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>»&#160;<span class="value">&#160;<xsl:choose>
				<xsl:when test="$month=1">января</xsl:when>
				<xsl:when test="$month=2">февраля</xsl:when>
				<xsl:when test="$month=3">марта</xsl:when>
				<xsl:when test="$month=4">апреля</xsl:when>
				<xsl:when test="$month=5">мая</xsl:when>
				<xsl:when test="$month=6">июня</xsl:when>
				<xsl:when test="$month=7">июля</xsl:when>
				<xsl:when test="$month=8">августа</xsl:when>
				<xsl:when test="$month=9">сентября</xsl:when>
				<xsl:when test="$month=10">октября</xsl:when>
				<xsl:when test="$month=11">ноября</xsl:when>
				<xsl:when test="$month=12">декабря</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>&#160;</span>&#160;<xsl:choose>
			<xsl:when test="substring($date,1,2)">
				<xsl:value-of select="substring($date,1,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>20</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<span class="value">
			<xsl:choose>
				<xsl:when test="substring($date,3,2)">
					<xsl:value-of select="substring($date,3,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</span> г.</xsl:template>
	<xsl:template mode="russian_date" match="*">
		<xsl:param name="dateIn" select="."/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
