<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:apsd="urn:customs.ru:Information:CustomsAuditDocuments:AppPersonSubmitDocs:5.14.3" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
	<!--ИМО-000573 Письмо ГУТКПВТ от 06.11.2018 № 23-20/69566-->
	<xsl:template match="apsd:AppPersonSubmitDocs">
		<html>
			<head>
				<style>
			body {
			background: #cccccc;
			}

			div
			{
			white-space: nowrap;
			}

			div.page {
			width: 180mm;
			max-width: 180mm;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
			}

			div.page_album {
			width: 267mm;
			max-width: 267mm;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
			}

			.marg-top
			{
			margin-top:5mm;
			}

			table
			{
			width: 100%;
			table-layout: fixed;
			word-wrap: break-word;
			border: 0;
			empty-cells: show;
			border-collapse: collapse;
			margin-top: 1px;
			}

			table.border tr td
			{
			border: 1px solid windowtext;
			}

			.graph {
			font-family: Arial;
			font-size: 10pt;
			}

			.value
			{
			border-bottom: solid 1px black;
			font-style: Italic;
			}

			div.title, tr.title td { font-weight:bold;  }
			.bordered { border-collapse: collapse; }
			td.bordered
			{
				border: solid 1px windowtext;
			}

			.border_bottom
			{
			border-bottom: 1px solid black;
			}

			.graphMain
			{
			font-family: Arial;
			font-size: 11pt;
			}

			.graphLittle 
			{
			font-family: Arial;
			font-size: 7pt;
			text-align: center;
			}
	
			.tableContent
			{
			font-family: Arial;
			font-size: 10pt;
			text-align: center;
			}	
	
			.graphDelim 
			{
			font-family: Arial;
			font-size: 4pt;
			}

			td.graphMain
			{
			vertical-align:top;
			}
			td.value.graphMain
			{
			vertical-align:top;
			}

			.graphHeader
			{
			font-family: Arial;
			font-size: 12pt;
			font-weight:bold;
			}

			td.graphHeader
			{
			vertical-align:top;
			}
			td.value.graphHeader
			{
			vertical-align:bottom;
			}

			.normal
			{
			font-size: 11pt;
			font-family:Arial;
			}			

			.bold
			{
			font-weight: bold;
			font-family:Arial;
			font-size: 9pt;
			}			

			.italic
			{
			font-style: italic;
			font-family:Arial;
			font-size: 11pt;
			}		
			
			.delim {
				height: 7pt;
			}

			.delim_3 {
				height: 3pt;
			}

		</style>
			</head>
			<body>
				<div class="page_album">
					<table width="100%">
						<tbody align="left" class="graphMain">
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphHeader" colspan="2">Обращение проверяемого лица в таможенный орган 
по вопросу представления документов и (или) сведений 
в соответствии с требованиями таможенного органа о представлении документов и (или) сведений</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<tr align="left">
								<td width="50%">от <xsl:call-template name="text_date">
										<xsl:with-param select="apsd:AppDate" name="date"/>
									</xsl:call-template>
								</td>
								<td width="50%"/>
							</tr>
							<tr align="center">
								<td width="50%"/>
								<td class="value" width="50%">
									<xsl:apply-templates select="apsd:CustomsPerson"/>
								</td>
							</tr>
							<tr align="center">
								<td/>
								<td class="graphLittle">(должность лица таможенного органа, в адрес которого направлено обращение)</td>
							</tr>
							<tr align="center">
								<td width="50%"/>
								<td class="value" width="50%">
									<xsl:apply-templates select="apsd:Customs"/>
								</td>
							</tr>
							<tr align="center">
								<td/>
								<td class="graphLittle">(наименование таможенного органа, в адрес которого направлено обращение)</td>
							</tr>
							<tr>
								<td width="50%"/>
								<td width="50%" class="graphMain">От руководителя</td>
							</tr>
							<tr align="center">
								<td width="50%"/>
								<td class="value" width="50%">
									<xsl:apply-templates select="apsd:Applicant"/>
								</td>
							</tr>
							<tr align="center">
								<td/>
								<td class="graphLittle">(организационно-правовая форма и наименование проверяемого лица, ИНН)</td>
							</tr>
							<tr align="center">
								<td width="50%"/>
								<td class="value" width="50%">
									<xsl:apply-templates select="apsd:Applicant/apsd:Chief"/>
									<xsl:if test="string-length(apsd:Applicant/apsd:Chief) = '0'">
										<xsl:value-of select="apsd:Applicant/cat_ru:OrganizationName"/>
									</xsl:if>
								</td>
							</tr>
							<tr align="center">
								<td/>
								<td class="graphLittle">(фамилия, имя, отчество (отчество указывается при наличии) руководителя (индивидуального предпринимателя)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td class="graphMain">Во исполнение Требования </td>
							</tr>
							<tr class="delim_3">
								<td>
									<br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td class="value">
									<xsl:if test="apsd:IdentKindRequest = '1'">о предоставлении документов и (или) сведений при камеральной таможенной проверке</xsl:if>
									<xsl:if test="apsd:IdentKindRequest = '2'"> о предоставлении документов и (или) сведений при выездной таможенной проверке</xsl:if>
									<xsl:if test="apsd:IdentKindRequest = '3'"> о предоставлении документов и (или) сведений при таможенной проверке у лица, связанного с проверяемым лицом по сделкам (операциям) с товарами, в отношении которых проводитсся таможенная проверка</xsl:if>
								</td>
							</tr>
							<tr align="center">
								<td class="graphLittle">(указать вид Требования – Требование о представлении документов и (или) сведений при камеральной таможенной проверке; Требование о представлении документов и (или) сведений лицом, связанным с проверяемым лицом по сделкам (операциям) с товарами, в отношении которых проводится таможенная проверка; Требование о представлении документов и (или) сведений при выездной таможенной проверке) </td>
							</tr>
							<tr class="delim_3">
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graphMain">
									<xsl:text> от </xsl:text>
									<span class="value">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="apsd:Notif4Audit//adt_cat:Date"/>
										</xsl:call-template>
									</span>
									<xsl:text> № </xsl:text>
									<span class="value">
										<xsl:value-of select="apsd:Notif4Audit/adt_cat:Number"/>
									</span>&#160;<xsl:choose>
										<xsl:when test="apsd:NotificationType='1'">
											<span class="value">(уведомление о проведении камеральной таможенной проверки / </span>
											<s>уведомление о проведении плановой выездной таможенной проверки</s>
										</xsl:when>
										<xsl:when test="apsd:NotificationType='2'">(<s>уведомление о проведении камеральной таможенной проверки</s>
											<span class="value"> / уведомление о проведении плановой выездной таможенной проверки</span>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text> (уведомление о проведении камеральной таможенной проверки / уведомление о проведении плановой выездной таможенной проверки</xsl:text>
										</xsl:otherwise>
									</xsl:choose>&#160;<xsl:text> № </xsl:text>
									<span class="value">
										<xsl:value-of select="apsd:RequestNumber/adt_cat:Number"/>
									</span>
									<xsl:text> от </xsl:text>
									<span class="value">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="apsd:RequestNumber/adt_cat:Date"/>
										</xsl:call-template>
									</span>)</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graphMain" width="100%">
									<table>
										<tbody>
											<tr>
												<td align="center" style="border: solid 2pt " class="bordered" width="5%">
													<xsl:if test="apsd:DocList/apsd:SubtmissionKind=1">
														<b>X</b>
													</xsl:if>
												</td>
												<td class="graphMain " width="95%">&#160;I. &#160;Представляю заверенные копии следующих документов и (или) </td>
											</tr>
											<tr>
												<td/>
												<td/>
											</tr>
											<tr>
												<td colspan="2" class="graphMain ">сведений:</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table class="tableContent" width="100%">
										<tbody>
											<tr>
												<td width="2%"/>
												<td width="5%"/>
												<td width="10%"/>
												<td width="6%"/>
												<td width="7%"/>
												<td width="10%"/>
												<td width="6%"/>
												<td width="9%"/>
												<td width="10%"/>
												<td width="9%"/>
												<td width="10%"/>
												<td width="6%"/>
												<td width="10%"/>
											</tr>
											<tr>
												<td class="bordered" valign="top" rowspan="2">№ п/п</td>
												<td class="bordered" valign="top" colspan="6">Сведения о документах и (или) 
сведениях, которые необходимо 
представить согласно Требованию</td>
												<td class="bordered" valign="top" width="9%" rowspan="2">Отметка проверяемого лица о представлении документа и (или) сведений<span class="graphLittle">
														<sup>1</sup>
													</span>
												</td>
												<td class="bordered" valign="top" colspan="5">Информация о  представляемых документах и (или) сведениях</td>
											</tr>
											<tr>
												<td class="bordered">Вид<span class="graphLittle">
														<sup>2</sup>
													</span>
												</td>
												<td class="bordered">Наименование</td>
												<td class="bordered">№ </td>
												<td class="bordered">Дата</td>
												<td class="bordered">Способ представления<span class="graphLittle">
														<sup>3</sup>
													</span>
												</td>
												<td class="bordered">Тип<span class="graphLittle">
														<sup>4</sup>
													</span>
												</td>
												<td class="bordered">Наименование и размер  файла (файлов), количество листов</td>
												<td class="bordered">Отметки о представлении ранее  документа и (или) сведений в таможенный орган</td>
												<td class="bordered">Способ представления</td>
												<td class="bordered">Тип</td>
												<td class="bordered">Примечание</td>
											</tr>
											<tr>
												<td class="bordered">1</td>
												<td class="bordered">2</td>
												<td class="bordered">3</td>
												<td class="bordered">4</td>
												<td class="bordered">5</td>
												<td class="bordered">6</td>
												<td class="bordered">7</td>
												<td class="bordered">8</td>
												<td class="bordered">9</td>
												<td class="bordered">10</td>
												<td class="bordered">11</td>
												<td class="bordered">12</td>
												<td class="bordered">13</td>
											</tr>
											<xsl:for-each select="apsd:DocList">
												<xsl:if test="apsd:SubtmissionKind=1">
													<tr>
														<xsl:for-each select="apsd:RequestDoc">
															<td class="bordered">
																<xsl:value-of select="apsd:Position"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="apsd:DocCode"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="cat_ru:PrDocumentName"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="cat_ru:PrDocumentNumber"/>
															</td>
															<td class="bordered">
																<xsl:call-template name="russian_date">
																	<xsl:with-param select="cat_ru:PrDocumentDate" name="dateIn"/>
																</xsl:call-template>
															</td>
															<td class="bordered">
																<xsl:if test="apsd:ProvidingWay='1'">электронный</xsl:if>
																<xsl:if test="apsd:ProvidingWay='2'">на бумажном носителе</xsl:if>
																<xsl:if test="apsd:ProvidingWay='3'">электронный с досылом на бумажном носителе </xsl:if>
															</td>
															<td class="bordered">
																<xsl:if test="apsd:DocKind='1'">формализованный</xsl:if>
																<xsl:if test="apsd:DocKind='2'">неформализованный</xsl:if>
															</td>
														</xsl:for-each>
														<td class="bordered">
															<xsl:if test="apsd:ProvideMark='1'">представлен</xsl:if>
															<xsl:if test="apsd:ProvideMark='2'">представлен не в полном объеме</xsl:if>
														</td>
														<xsl:for-each select="apsd:FactDoc">
															<td class="bordered">
																<xsl:for-each select="apsd:Files">
																	<xsl:for-each select="apsd:FileName">
																		<xsl:value-of select=" ."/>
																	</xsl:for-each>
																	<xsl:if test="apsd:FileSize">
																		<xsl:if test="apsd:FileName"/>,&#160;<xsl:value-of select="apsd:FileSize"/>
																	</xsl:if>
																	<xsl:if test="apsd:SheetsNumber">
																		<xsl:if test="string-length (apsd:FileName) or string-length (apsd:FileSize) &gt; 0">,&#160;</xsl:if>
																		<xsl:value-of select="apsd:SheetsNumber"/>  л.</xsl:if>
																	<xsl:if test="position()!=last()">;&#160;<br/>
																	</xsl:if>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:for-each select="apsd:ProvidePreviousMark">
																	<xsl:value-of select="apsd:DocumentID"/>
																	<xsl:for-each select="apsd:CustomsLetter">
																		<xsl:if test="cat_ru:PrDocumentNumber">№&#160;<xsl:value-of select="cat_ru:PrDocumentNumber"/>
																		</xsl:if>
																		<xsl:if test="cat_ru:PrDocumentDate">&#160;от&#160;<xsl:call-template name="russian_date">
																				<xsl:with-param select="cat_ru:PrDocumentDate" name="dateIn"/>
																			</xsl:call-template>&#160;</xsl:if>
																		<xsl:apply-templates select="apsd:Customs"/>
																	</xsl:for-each>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:if test="apsd:ProvidingWay='1'">электронный</xsl:if>
																<xsl:if test="apsd:ProvidingWay='2'">на бумажном носителе</xsl:if>
																<xsl:if test="apsd:ProvidingWay='3'">электронный с досылом на бумажном носителе </xsl:if>
															</td>
															<td class="bordered">
																<xsl:if test="apsd:DocKind='1'">формализованный</xsl:if>
																<xsl:if test="apsd:DocKind='2'">неформализованный</xsl:if>
															</td>
														</xsl:for-each>
														<td class="bordered">
															<xsl:for-each select="apsd:Note">
																<xsl:value-of select=" ."/>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table class="graphLittle" width="100%">
						<tbody>
							<tr>
								<td class="value" width="30%"/>
								<td width="70%"/>
							</tr>
							<tr>
								<td colspan="2" align="left">
									<sup>1</sup>указывается значение «представлен» либо  «представлен не в полном объеме».</td>
							</tr>
							<tr>
								<td colspan="2" align="left">
									<sup>2</sup>указывается вид документа и (или) сведений  в соответствии с классификатором видов документов и сведений (решение Комиссии Таможенного союза от 20.09.2010 № 378) </td>
							</tr>
							<tr>
								<td colspan="2" align="left">
									<sup>3</sup>указывается один из возможных вариантов: «электронный», «на бумажном носителе» или «электронным способом с досылом на бумажном носителе». В случае необходимости представления документов электронным способом дополнительно указывается формат представления документа и (или) сведений.</td>
							</tr>
							<tr>
								<td colspan="2" align="left">
									<sup>4</sup>указывается одно из значений: «формализованный», «неформализованный».</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td class="graphMain" width="100%">
									<table>
										<tbody>
											<tr>
												<td width="5%" align="center" style="border: solid 2pt " class="bordered">
													<xsl:if test="apsd:DocList/apsd:SubtmissionKind=2">
														<b>X</b>
													</xsl:if>
												</td>
												<td class="graphMain" width="95%">&#160;II. &#160;Прошу продлить срок представления следующих документов и  (или) </td>
											</tr>
											<tr>
												<td/>
												<td/>
											</tr>
											<tr>
												<td colspan="2" rowspan="2" class="graphMain">сведений<xsl:if test="apsd:ProlongDate"> до <xsl:call-template name="text_date">
															<xsl:with-param select="apsd:ProlongDate" name="date"/>
														</xsl:call-template>
													</xsl:if>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table class="tableContent" width="100%">
										<tbody>
											<tr>
												<td width="3%"/>
												<td width="5%"/>
												<td width="14%"/>
												<td width="11%"/>
												<td width="8%"/>
												<td width="10%"/>
												<td width="12%"/>
												<td width="10%"/>
												<td width="14%"/>
												<td width="13%"/>
											</tr>
											<tr>
												<td class="bordered" valign="top" rowspan="2">№ п/п</td>
												<td class="bordered" valign="top" colspan="6">Сведения о документах и (или) 
сведениях, которые необходимо 
представить согласно Требованию</td>
												<td class="bordered" valign="top" rowspan="2">Срок, к которому может быть представлен документ и (или) сведения</td>
												<td class="bordered" valign="top" rowspan="2">Обоснование причин невозможности представления документа и (или) сведений к установленному в Требовании сроку</td>
												<td class="bordered" valign="top" rowspan="2">Примечание</td>
											</tr>
											<tr>
												<td class="bordered">Вид</td>
												<td class="bordered">Наименование</td>
												<td class="bordered">№ </td>
												<td class="bordered">Дата</td>
												<td class="bordered">Способ представления</td>
												<td class="bordered">Тип</td>
											</tr>
											<tr>
												<td class="bordered">1</td>
												<td class="bordered">2</td>
												<td class="bordered">3</td>
												<td class="bordered">4</td>
												<td class="bordered">5</td>
												<td class="bordered">6</td>
												<td class="bordered">7</td>
												<td class="bordered">8</td>
												<td class="bordered">9</td>
												<td class="bordered">10</td>
											</tr>
											<xsl:for-each select="apsd:DocList">
												<xsl:if test="apsd:SubtmissionKind=2">
													<tr>
														<xsl:for-each select="apsd:RequestDoc">
															<td class="bordered">
																<xsl:value-of select="apsd:Position"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="apsd:DocCode"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="cat_ru:PrDocumentName"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="cat_ru:PrDocumentNumber"/>
															</td>
															<td class="bordered">
																<xsl:call-template name="russian_date">
																	<xsl:with-param select="cat_ru:PrDocumentDate" name="dateIn"/>
																</xsl:call-template>
															</td>
															<td class="bordered">
																<xsl:if test="apsd:ProvidingWay='1'">электронный</xsl:if>
																<xsl:if test="apsd:ProvidingWay='2'">на бумажном носителе</xsl:if>
																<xsl:if test="apsd:ProvidingWay='3'">электронный с досылом на бумажном носителе </xsl:if>
															</td>
															<td class="bordered">
																<xsl:if test="apsd:DocKind='1'">формализованный</xsl:if>
																<xsl:if test="apsd:DocKind='2'">неформализованный</xsl:if>
															</td>
														</xsl:for-each>
														<td class="bordered">
															<xsl:call-template name="russian_date">
																<xsl:with-param select="apsd:PossibleTerm" name="dateIn"/>
															</xsl:call-template>
														</td>
														<td class="bordered">
															<xsl:for-each select="apsd:Reason">
																<xsl:value-of select=" ."/>
															</xsl:for-each>
														</td>
														<td class="bordered">
															<xsl:for-each select="apsd:Note">
																<xsl:value-of select=" ."/>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td class="graphMain" width="100%">
									<table>
										<tbody>
											<tr>
												<td width="5%" align="center" style="border: solid 2pt " class="bordered">
													<xsl:if test="apsd:DocList/apsd:SubtmissionKind=3">
														<b>X</b>
													</xsl:if>
												</td>
												<td width="95%" class="graphMain">&#160;III. &#160;Отсутствует возможность представления заверенных копий </td>
											</tr>
											<tr>
												<td/>
												<td/>
											</tr>
											<tr>
												<td colspan="2" class="graphMain" rowspan="2">следующих документов и (или) сведений:</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table class="tableContent" width="100%">
										<tbody>
											<tr>
												<td width="3%"/>
												<td width="5%"/>
												<td width="15%"/>
												<td width="13%"/>
												<td width="9%"/>
												<td width="11%"/>
												<td width="14%"/>
												<td width="16%"/>
												<td width="14%"/>
											</tr>
											<tr>
												<td class="bordered" valign="top" rowspan="2">№ п/п</td>
												<td class="bordered" valign="top" colspan="6">Сведения о документах и (или) 
сведениях, которые необходимо 
представить согласно Требованию</td>
												<td class="bordered" valign="top" rowspan="2">Обоснование причин невозможности представления документа и (или) сведений </td>
												<td class="bordered" valign="top" rowspan="2">Примечание</td>
											</tr>
											<tr>
												<td class="bordered">Вид</td>
												<td class="bordered">Наименование</td>
												<td class="bordered">№ </td>
												<td class="bordered">Дата</td>
												<td class="bordered">Способ представления</td>
												<td class="bordered">Тип</td>
											</tr>
											<tr>
												<td class="bordered">1</td>
												<td class="bordered">2</td>
												<td class="bordered">3</td>
												<td class="bordered">4</td>
												<td class="bordered">5</td>
												<td class="bordered">6</td>
												<td class="bordered">7</td>
												<td class="bordered">8</td>
												<td class="bordered">9</td>
											</tr>
											<xsl:for-each select="apsd:DocList">
												<xsl:if test="apsd:SubtmissionKind=3">
													<tr>
														<xsl:for-each select="apsd:RequestDoc">
															<td class="bordered">
																<xsl:value-of select="apsd:Position"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="apsd:DocCode"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="cat_ru:PrDocumentName"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="cat_ru:PrDocumentNumber"/>
															</td>
															<td class="bordered">
																<xsl:call-template name="russian_date">
																	<xsl:with-param select="cat_ru:PrDocumentDate" name="dateIn"/>
																</xsl:call-template>
															</td>
															<td class="bordered">
																<xsl:if test="apsd:ProvidingWay='1'">электронный</xsl:if>
																<xsl:if test="apsd:ProvidingWay='2'">на бумажном носителе</xsl:if>
																<xsl:if test="apsd:ProvidingWay='3'">электронный с досылом на бумажном носителе </xsl:if>
															</td>
															<td class="bordered">
																<xsl:if test="apsd:DocKind='1'">формализованный</xsl:if>
																<xsl:if test="apsd:DocKind='2'">неформализованный</xsl:if>
															</td>
														</xsl:for-each>
														<td class="bordered">
															<xsl:for-each select="apsd:Reason">
																<xsl:value-of select=" ."/>
															</xsl:for-each>
														</td>
														<td class="bordered">
															<xsl:for-each select="apsd:Note">
																<xsl:value-of select=" ."/>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td>Приложение: <xsl:if test="apsd:Files">
										<span class="value">
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="apsd:Files"/>
											<xsl:text>&#160;</xsl:text>
										</span>
									</xsl:if>
									<xsl:if test="string-length(apsd:Files)='0'">
										<span class="value">
											<xsl:text>&#160;&#160;&#160;&#160;</xsl:text>
										</span>
									</xsl:if> файлов., на <xsl:if test="apsd:Sheets">
										<span class="value">
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="apsd:Sheets"/>
											<xsl:text>&#160;</xsl:text>
										</span>
									</xsl:if>
									<xsl:if test="string-length(apsd:Sheets)='0'">
										<span class="value">
											<xsl:text>&#160;&#160;&#160;&#160;</xsl:text>
										</span>
									</xsl:if> л.</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td>Руководитель проверяемого лица</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody align="left" class="graphMain">
											<tr class="graphMain" align="center">
												<td width="38%"/>
												<td width="20%" class="border_bottom"> </td>
												<td width="2%"> </td>
												<td width="40%" valign="bottom" class="border_bottom value">
													<xsl:apply-templates select="apsd:Applicant/apsd:Chief"/>
												</td>
											</tr>
											<tr class="graphLittle" valign="top" align="center">
												<td/>
												<td valign="top">(подпись)</td>
												<td> </td>
												<td valign="top">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="apsd:Customs">
		<xsl:if test="adt_cat:FullOfficeName">
			<xsl:value-of select="adt_cat:FullOfficeName"/>
		</xsl:if>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:if test="string-length(adt_cat:FullOfficeName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:OfficeName"/>
			<xsl:if test="string-length(adt_cat:FullOfficeName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:Code">&#160; (<xsl:value-of select="cat_ru:Code"/>)&#160;</xsl:if>
	</xsl:template>
	<xsl:template match="apsd:Applicant/apsd:Chief">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<br/>
		<xsl:if test="cat_ru:PersonPost">&#160;</xsl:if>
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>&#160;</xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<span class="italic"> (код вида адреса</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			</span>
			<span class="normal">) </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalCode">
			<span class="italic">почтовый индекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:PostalCode"/>
			</span>
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
			<xsl:if test="RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</span>
			<xsl:if test="RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Region"/>
			</span>
			<xsl:if test="RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:District"/>
			</span>
			<xsl:if test="RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Town"/>
			</span>
			<xsl:if test="RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:City"/>
			</span>
			<xsl:if test="RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:StreetHouse"/>
			</span>
			<xsl:if test="RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:House"/>
			</span>
			<xsl:if test="RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Room"/>
			</span>
			<xsl:if test="RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</span>
			<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO">
			<span class="italic">ОКТМО </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OKTMO"/>
			</span>
			<xsl:if test="RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKATO">
			<span class="italic">OKАTO </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OKATO"/>
			</span>
			<xsl:if test="RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:KLADR">
			<span class="italic">КЛАДР </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:KLADR"/>
			</span>
			<xsl:if test="RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOGUID">
			<span class="italic">Глобальный идентификатор адресного объекта по ФИАС </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AOGUID"/>
			</span>
			<xsl:if test="RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:TerritoryCode">
			<span class="italic">Код единицы административно-территориального деления </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:TerritoryCode"/>
			</span>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<span class="italic">а/я </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="apsd:Applicant">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">,&#160;<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:if test="position()=1">; 
				<span class="normal">
						<br/>
					</span>
					<span class="italic">Адрес</span>
					<span class="normal">: </span>
				</xsl:if>
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">, </span>
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
				<span class="normal">: </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">, </span>
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">, </span>
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">, </span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">, </span>
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">, </span>
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">, </span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">, </span>
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">, </span>
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">, </span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic"> по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<span class="normal">, </span>
		<span class="italic">Документ, удостоверяющий личность ФЛ</span>
		<span class="normal">: </span>
		<xsl:if test="RUScat_ru:IdentityCardCode">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardCode"/>
			</span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:if test="string-length(RUScat_ru:IdentityCardName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
			</span>
			<xsl:if test="string-length(RUScat_ru:IdentityCardName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			<span class="italic">серия</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
			</span>
			<xsl:if test="string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
				<span class="normal">&#160;</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			<span class="italic">№</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardDate) &gt; 0 or string-length(RUScat_ru:OrganizationName) &gt; 0">
			<!--xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
			<span class="normal">, </span>
			<span class="italic">выдан</span>
			<span class="normal">: </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<span class="normal">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationName">
			<span class="normal">&#160;</span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OrganizationName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IssuerCode">
			<span class="normal">, </span>
			<span class="italic">код подразделения</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IssuerCode"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<span class="normal">, </span>
			<span class="italic">идентификатор организации</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AuthorityId"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">, </span>
			<span class="italic">страна в уд.личности</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal"> УИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"> (</span>
			<span class="normal">страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CommunicationDetails">
		<span class="normal">, </span>
		<span class="italic">Контактные данные</span>
		<span class="normal">: </span>
		<xsl:variable name="temp">
			<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
		</xsl:variable>
		<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
	</xsl:template>
	<xsl:template match="apsd:CustomsPerson">
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="cat_ru:PersonPost">&#160;<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="apsd:Rank">&#160;<xsl:value-of select="apsd:Rank"/>
		</xsl:if>
		<xsl:if test="apsd:Department">&#160;<xsl:value-of select="apsd:Department"/>
		</xsl:if>
		<xsl:if test="apsd:CustomsDept">&#160;<xsl:value-of select="cat_ru:OfficeName"/>
			<xsl:if test="cat_ru:Code">&#160;(</xsl:if>
			<xsl:value-of select="cat_ru:Code"/>
			<xsl:if test="cat_ru:Code">)</xsl:if>
		</xsl:if>
		<xsl:if test="apsd:PersonCustomsID">,&#160;номер служебного удостоверения:&#160;<xsl:value-of select="apsd:PersonCustomsID"/>
		</xsl:if>
		<xsl:if test="apsd:LNP">,&#160;ЛНП:&#160;<xsl:value-of select="apsd:LNP"/>
		</xsl:if>
		<xsl:if test="apsd:Phone">&#160;Тел:&#160;<xsl:value-of select="apsd:Phone"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
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
	<xsl:template name="text_date">
		<xsl:param name="date"/>«<span class="value">&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</span>
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
			</xsl:choose>&#160;</span>&#160;<xsl:value-of select="substring($date,1,2)"/>
		<span class="value">
			<xsl:value-of select="substring($date,3,2)"/>
		</span> г.</xsl:template>
</xsl:stylesheet>
