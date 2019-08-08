<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exs="urn:customs.ru:Information:CustomsDocuments:ExpertSummary:5.14.2" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ExpertSummaryType -->
	<xsl:template match="exs:ExpertSummary">
		<xsl:variable name="me_us">
			<xsl:choose>
				<xsl:when test="count(exs:CustomsPerson) > 1">Мы</xsl:when>
				<xsl:otherwise>Я</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="me_us2">
			<xsl:choose>
				<xsl:when test="count(exs:CustomsPerson) > 1">Нам</xsl:when>
				<xsl:otherwise>Мне</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="hasCounter">
			<xsl:value-of select="count(exs:CustomsPerson)"/>
		</xsl:variable>
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									font-family: Arial;
									font-size: 10pt;
									}

									div.page {
									width: 180mm;
									padding: 10mm;
									padding-left:	20mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									table
									{
									width: 100%;
									border: 0;
									empty-cells: show;
									border-collapse: collapse;
									margin-top: 1px;
									table-layout: fixed;
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
									}

									div.title, tr.title td { font-weight:bold;  }
									.bordered { border-collapse: collapse; }
									td.bordered
									{
									border: solid 1px windowtext;
									}

									.underlined {
									border-bottom: 1px solid windowtext;
									vertical-align:bottom;
									}

									td {
									word-break: break-word;
									word-wrap: break-word;
									-ms-word-break: break-all;
									max-width: 180mm;
									}
									.graphMain
									{
									font-family: Arial;
									font-size: 10pt;
									}

									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}
									div.page {
										border: solid 1pt #ffffff;
									}
								</style>
			</head>
			<body>
<!-- ========================================================================= -->
				<xsl:if test="exs:CustomsControl"> <!-- Экспертиза в рамках ТК (Форма по Приказу ФТС России от 17.01.2019 № 46)-->
					<!--ТК-->
					<div class="page graphMain">
						<table>
							<tbody>
								<tr>
									<td align="center">
										<b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b>
										<br/>
										<b>Центральное экспертно-криминалистическое таможенное управление</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b><xsl:value-of select="exs:EKSName"/></b>
										<xsl:if test="exs:CEKTUDivision/exs:BranchNotEKSSign = '1' or exs:CEKTUDivision/exs:BranchNotEKSSign = 't' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'true' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'T'">
											<br/>
											<b><xsl:value-of select="exs:CEKTUDivision/exs:Name"/></b>
										</xsl:if>	
										<br/>
										<xsl:value-of select="exs:CEKTUDivision/exs:Address"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>
											<xsl:text>ЗАКЛЮЧЕНИЕ ТАМОЖЕННОГО ЭКСПЕРТА</xsl:text>
											<!--xsl:choose>
												<xsl:when test="count(exs:CustomsPerson) > 1">ТАМОЖЕННЫХ ЭКСПЕРТОВ</xsl:when>
												<xsl:otherwise>ТАМОЖЕННОГО ЭКСПЕРТА</xsl:otherwise>
											</xsl:choose-->
										</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td width="40%" valign="top">
														<xsl:text>№ </xsl:text>
														<u>&#160;<xsl:value-of select="exs:ExpertSummaryNumber"/>&#160;</u>
														<br/><xsl:text>от </xsl:text>
														<xsl:call-template name="DateStr">
															<xsl:with-param name="date" select="exs:ExpertSummaryDate"/>
														</xsl:call-template>
													</td>
													<td width="60%" align="right" valign="top">
														<u>&#160;&#160;<xsl:value-of select="exs:ExpertSummaryCity"/>&#160;&#160;</u>
													</td>
												</tr>
											</tbody>
										</table>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;"><b>1. </b>Таможенным экспертом: 
										<!--xsl:value-of select="$me_us"/>
										<xsl:text>, </xsl:text-->
										<xsl:for-each select="exs:CustomsPerson">
											<u><xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/></u>,
											<xsl:apply-templates select="exs:Qualification"/>
											<xsl:if test="position()!=last()">
												<xsl:text>; </xsl:text>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>на основании </xsl:text><u><xsl:text>решения о назначении таможенной экспертизы  от </xsl:text>
										<xsl:call-template name="monthword_date">
											<xsl:with-param name="dateIn" select="exs:CustomsControl/exs:DecisionDate"/>
										</xsl:call-template>
										<xsl:text> г. </xsl:text>
										по документам: <xsl:if test="exs:PresentedDocuments/exs:GTDNumber">ДТ № <xsl:apply-templates select="exs:PresentedDocuments/exs:GTDNumber"/>
										</xsl:if>
										<xsl:if test="exs:PresentedDocuments/exs:DocumentName">
											<xsl:if test="exs:PresentedDocuments/exs:GTDNumber">,</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:for-each select="//exs:DocumentName">
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'">
															<xsl:text> от </xsl:text>
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="."/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="."/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()">
														<xsl:text> </xsl:text>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<xsl:text>, </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										<xsl:text>, вынесенного </xsl:text>
										<xsl:if test="exs:CustomsControl">
											<xsl:if test="exs:CustomsControl/exs:Customs/cat_ru:OfficeName">
												<xsl:value-of select="exs:CustomsControl/exs:Customs/cat_ru:OfficeName"/>
												<xsl:text> (</xsl:text>
											</xsl:if>
											<xsl:value-of select="exs:CustomsControl/exs:Customs/cat_ru:Code"/>
											<xsl:if test="exs:CustomsControl/exs:Customs/cat_ru:OfficeName">
												<xsl:text>), </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:value-of select="concat(exs:CustomsControl/exs:InitiatorPerson/cat_ru:PersonSurname,' ',exs:CustomsControl/exs:InitiatorPerson/cat_ru:PersonName,' ',exs:CustomsControl/exs:InitiatorPerson/cat_ru:PersonMiddleName)"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="exs:CustomsControl/exs:InitiatorPerson/cat_ru:PersonPost"/></u>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>проведена </xsl:text><xsl:value-of select="exs:CustomsControl/exs:CustomExpertiseKind"/><xsl:text> </xsl:text><u>
										<xsl:text> место проведения: </xsl:text>
										<xsl:apply-templates select="exs:CustomsControl/exs:PlaceExp"/></u><br/>
										<xsl:text> с </xsl:text>
										<xsl:call-template name="DateStr">
											<xsl:with-param name="date" select="exs:StudyStartDateTime"/>
										</xsl:call-template>
										<xsl:text> по </xsl:text>
										<xsl:call-template name="DateStr">
											<xsl:with-param name="date" select="exs:StudyStopDateTime"/>
										</xsl:call-template><br/>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">&#160;&#160;&#160;&#160;
										<xsl:text>Об ответственности за дачу заведомо ложного заключения таможенного эксперта по статье 19.26 Кодекса Российской Федерации об административных правонарушениях предупрежден.</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td width="20%"/>
									<td width="2%"/>
									<td width="50%"/>
									<td width="2%"/>
									<td width="26%"/>
								</tr>
								<xsl:for-each select="exs:CustomsPerson">
									<tr>
										<td class="underlined">&#160;<br/>
											<br/>
										</td>
										<td/>
										<td class="underlined" align="center">
											<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>
										</td>
										<td/>
										<td class="underlined" align="center">
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="../exs:StudyStartDateTime"/></xsl:call-template>
										</td>
										<td/>
									</tr>
									<tr>
										<td align="center" style="font-size:10">(подпись)</td>
										<td/>
										<td align="center" style="font-size:10"></td>
										<td/>
										<td/>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td>
										<br/>
										<b>2. Для проведения таможенной экспертизы предоставлены:</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:PresentedObject">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Документы:</xsl:text><br/>
										<xsl:if test="exs:PresentedDocuments/exs:GTDNumber and not(exs:CustomsControl)"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>- ДТ № <xsl:apply-templates select="exs:PresentedDocuments/exs:GTDNumber"/><br/>
										</xsl:if>
										<xsl:if test="exs:PresentedDocuments/exs:DocumentName">
											<xsl:for-each select="//exs:DocumentName">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;- </xsl:text>
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'"> от <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template></xsl:when>
														<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">&#160;&#160;&#160;&#160;
										<xsl:text>В решении о назначении таможенной экспертизы видоизменение, частичное или полное уничтожение, разрушение материалов, документов, проб и образцов исследования </xsl:text>
										<xsl:if test="exs:CustomsControl/exs:DestructionResolution='true' or exs:CustomsControl/exs:DestructionResolution='1'">разрешено</xsl:if>
										<xsl:if test="exs:CustomsControl/exs:DestructionResolution='false' or exs:CustomsControl/exs:DestructionResolution='0'">запрещено</xsl:if>
										<xsl:text>.</xsl:text>
										<!--xsl:if test="exs:CustomsControl/exs:ProlongationDaysCount">
										<br/>&#160;&#160;&#160;&#160;
										Срок производства таможенной  экспертизы продлевался на <xsl:value-of select="exs:CustomsControl/exs:ProlongationDaysCount"/> раб. дн. в соответствии с ч. 3 ст, 172 Федерального закона от 27 ноября 2010 г. № 311-ФЗ «О таможенном регулировании в Российской Федерации».
										</xsl:if-->
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<b>3. Перед таможенным экспертом поставлены вопросы:</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Question">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td>
										<br/>
										<b>4. Содержание и результаты исследования:</b>
									</td>
								</tr>
								<xsl:for-each select="exs:CustomsPerson">
									<tr>
										<td>
											<xsl:if test="$hasCounter &gt; 1">4.<xsl:value-of select="position()"/><xsl:text>. </xsl:text><br/></xsl:if>
											<b><xsl:text>Внешний осмотр</xsl:text></b><br/>
											<xsl:apply-templates select="exs:Inspection"/>
											<br/><b><xsl:text>Исследование</xsl:text></b><br/>
											<xsl:apply-templates select="exs:Study"/>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<table>
												<tbody>
													<tr>
														<td width="25%">Таможенный эксперт</td>
														<td width="2%"/>
														<td width="20%" class="underlined"/>
														<td width="2%"/>
														<td width="51%"><xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/></td>
													</tr>
													<tr>
														<td/>
														<td/>
														<td align="center" style="font-size:10">(подпись)</td>
														<td/>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td>
										<br/>
										<b>5. Оценка результатов исследований:</b>
									</td>
								</tr>
								<xsl:if test="exs:Synthesis">
									<tr>
										<td style="text-align: justify;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text><xsl:apply-templates select="exs:Synthesis"/>
										</td>
									</tr>
								</xsl:if>	
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td>
										<br/>
										<b>6. Выводы:</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:Conclusion">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<xsl:for-each select="exs:CustomsPerson">
							<table>
								<tbody>
									<tr>
										<td width="25%">Таможенный эксперт</td>
										<td width="2%"/>
										<td width="20%" class="underlined"/>
										<td width="2%"/>
										<td width="51%"><xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/></td>
									</tr>
									<tr>
										<td/>
										<td/>
										<td align="center" style="font-size:10">(подпись)</td>
										<td/>
										<td/>
									</tr>
								</tbody>
							</table>
						</xsl:for-each>
					</div>
				</xsl:if>
<!-- ========================================================================= -->
				<xsl:if test="exs:AdministrativeOffence"> <!-- Экспертиза в рамках АП (форма "Экспертиза в рамках АП") -->
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td align="center">
										<b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b>
										<br/>
										<b>Центральное экспертно-криминалистическое таможенное управление</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b><xsl:value-of select="exs:EKSName"/></b>
										<xsl:if test="exs:CEKTUDivision/exs:BranchNotEKSSign = '1' or exs:CEKTUDivision/exs:BranchNotEKSSign = 't' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'true' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'T'">
											<br/>
											<b><xsl:value-of select="exs:CEKTUDivision/exs:Name"/></b>
										</xsl:if>	
										<br/>
										<xsl:value-of select="exs:CEKTUDivision/exs:Address"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<th>ЗАКЛЮЧЕНИЕ ЭКСПЕРТА<br/></th>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td>
														<xsl:text>№ </xsl:text>
														<xsl:value-of select="exs:ExpertSummaryNumber"/>
														<xsl:text> составлено </xsl:text>
														<xsl:call-template name="monthword_date">
															<xsl:with-param name="dateIn" select="exs:ExpertSummaryDate"/>
														</xsl:call-template>
														<xsl:text> года     </xsl:text>
													</td>
													<td align="right">
														<xsl:value-of select="exs:ExpertSummaryCity"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<br/>
										<br/>&#160;&#160;&#160;&#160;
										<xsl:value-of select="$me_us2"/>
										<xsl:text>, </xsl:text>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:value-of select="concat(cat_ru:PersonSurname,' ',cat_ru:PersonName,' ',cat_ru:PersonMiddleName,', ',cat_ru:PersonPost)"/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
										<xsl:text>, поручено провести экспертизу по делу об административном правонарушении № </xsl:text>
										<xsl:value-of select="exs:AdministrativeOffence/exs:APNumber"/>.
										<br/>&#160;&#160;&#160;&#160;В соответствии со ст. 14 Федерального закона от 31.05.2001 № 73-ФЗ “О государственной судебно-экспертной деятельности в Российской Федерации” руководителем <xsl:value-of select="exs:EKSName"/> разъяснены обязанности и права эксперта, предусмотренные ст. <xsl:value-of select="exs:AdministrativeOffence/exs:ArcticleNumberRigth"/> Кодекса Российской Федерации об административных правонарушениях (далее - КоАП России).
										<br/>&#160;&#160;&#160;&#160;При поручении производства экспертизы об административной ответственности за дачу заведомо ложного заключения по ст. <xsl:value-of select="exs:AdministrativeOffence/exs:ArcticleNumber"/> КоАП России предупрежден<xsl:if test="count(exs:CustomsPerson)>1">ы</xsl:if>.</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td width="20%"/>
									<td width="30%"/>
									<td width="40%"/>
									<td width="10%"/>
								</tr>
								<xsl:for-each select="exs:CustomsPerson">
									<tr>
										<td class="underlined">&#160;<br/>
											<br/>
										</td>
										<td/>
										<td class="underlined" align="center">
											<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>
										</td>
										<td/>
									</tr>
									<tr>
										<td align="center" style="font-size:10">(подпись)</td>
										<td/>
										<td align="center" style="font-size:10">(инициалы, фамилия)</td>
										<td/>
									</tr>
									<tr>
										<td/>
										<td/>
										<td align="center">
											<br/><xsl:call-template name="monthword_date"><xsl:with-param name="dateIn" select="../exs:StudyStartDateTime"/></xsl:call-template></td>
										<td/>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;"><br/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;На основании определения о назначении экспертизы от </xsl:text>
										<xsl:call-template name="monthword_date">
											<xsl:with-param name="dateIn" select="exs:AdministrativeOffence/exs:DecisionDate"/>
										</xsl:call-template>
										<xsl:text> г., должность назначившего: </xsl:text><xsl:value-of select="exs:AdministrativeOffence/exs:InitiatorPerson/cat_ru:PersonPost"/>
										<xsl:text>, Ф.И.О. назначившего: </xsl:text>
										<xsl:value-of select="concat(exs:AdministrativeOffence/exs:InitiatorPerson/cat_ru:PersonSurname,' ',exs:AdministrativeOffence/exs:InitiatorPerson/cat_ru:PersonName,' ',exs:AdministrativeOffence/exs:InitiatorPerson/cat_ru:PersonMiddleName)"/>
										<xsl:text>, </xsl:text>
										<xsl:text> по делу об административном правонарушении № </xsl:text><xsl:value-of select="exs:AdministrativeOffence/exs:APNumber"/><xsl:text>, </xsl:text>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:text> эксперт: </xsl:text>
											<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>,
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="exs:Qualification"/>
											<xsl:text>, </xsl:text>
										</xsl:for-each>
										<xsl:text> проведена </xsl:text>
										<xsl:value-of select="exs:AdministrativeOffence/exs:CustomExpertiseKind"/>
										<xsl:text> экспертиза.</xsl:text>
										<br/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Экспертиза начата </xsl:text>
										<xsl:text> </xsl:text>
										<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStartDateTime"/>
										</xsl:call-template>
										<xsl:text>, окончена </xsl:text>
										<xsl:text> </xsl:text>
										<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStopDateTime"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>I. Описание поступивших на исследование объектов:</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:PresentedObject">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Документы:</xsl:text><br/>
										<xsl:if test="exs:PresentedDocuments/exs:GTDNumber"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>- ДТ № <xsl:apply-templates select="exs:PresentedDocuments/exs:GTDNumber"/><br/>
										</xsl:if>
										<xsl:if test="exs:PresentedDocuments/exs:DocumentName">
											<xsl:for-each select="//exs:DocumentName">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;- </xsl:text>
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'"> от <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template></xsl:when>
														<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>II. Вопросы, поставленные перед экспертом:</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Question">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>III. ИССЛЕДОВАТЕЛЬСКАЯ ЧАСТЬ</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/><b>1. Внешний осмотр</b></td>
								</tr>
								<tr>
									<td>
										<xsl:for-each select="exs:CustomsPerson">
											<!--xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text--><xsl:if test="$hasCounter &gt; 1">1.<xsl:value-of select="position()"/><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="exs:Inspection"/>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="title_position" select="'Эксперт'"/>
														<xsl:with-param name="NotNeedPersonPost" select="1"/>
													</xsl:call-template>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<br/><b>2. Исследование</b></td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:for-each select="exs:CustomsPerson">
											<!--xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text--><xsl:if test="$hasCounter &gt; 1">2.<xsl:value-of select="position()"/><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="exs:Study"/>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="title_position" select="'Эксперт'"/>
														<xsl:with-param name="NotNeedPersonPost" select="1"/>
													</xsl:call-template>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<xsl:if test="exs:Synthesis">
									<tr>
										<td align="center">
											<br/>
											<br/><b>3. Синтезирующая часть</b></td>
									</tr>
									<tr>
										<td>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text><xsl:apply-templates select="exs:Synthesis"/>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="title_position" select="'Эксперт'"/>
														<xsl:with-param name="NotNeedPersonPost" select="1"/>
													</xsl:call-template>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>ВЫВОДЫ</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Conclusion">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="title_position" select="'Эксперт'"/>
														<xsl:with-param name="NotNeedPersonPost" select="1"/>
													</xsl:call-template>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
<!-- ========================================================================= -->
				<xsl:if test="exs:CriminalCase"> <!--Экспертиза в рамка УД (форма "Экспертиза в рамках УД")-->
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td align="center">
										<b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b>
										<br/>
										<b>Центральное экспертно-криминалистическое таможенное управление</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b><xsl:value-of select="exs:EKSName"/></b>
										<xsl:if test="exs:CEKTUDivision/exs:BranchNotEKSSign = '1' or exs:CEKTUDivision/exs:BranchNotEKSSign = 't' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'true' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'T'">
											<br/>
											<b><xsl:value-of select="exs:CEKTUDivision/exs:Name"/></b>
										</xsl:if>	
										<br/>
										<xsl:value-of select="exs:CEKTUDivision/exs:Address"/>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>ЗАКЛЮЧЕНИЕ ЭКСПЕРТА</b>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<table>
											<tbody>
												<tr>
													<td>
														<xsl:text>№ </xsl:text>
														<xsl:value-of select="exs:ExpertSummaryNumber"/>
														<xsl:text> составлено </xsl:text>
														<xsl:call-template name="monthword_date">
															<xsl:with-param name="dateIn" select="exs:ExpertSummaryDate"/>
														</xsl:call-template>
														<xsl:text> года</xsl:text>
													</td>
													<td align="right">
														<xsl:value-of select="exs:ExpertSummaryCity"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<br/>&#160;&#160;&#160;&#160;
										<xsl:value-of select="$me_us2"/>
										<xsl:text>, </xsl:text>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:value-of select="concat(cat_ru:PersonSurname,' ',cat_ru:PersonName,' ',cat_ru:PersonMiddleName,', ',cat_ru:PersonPost)"/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
										<xsl:text>, поручено провести экспертизу по уголовному делу № </xsl:text>
										<xsl:value-of select="exs:CriminalCase/exs:UDNumber"/>.
										<br/>&#160;&#160;&#160;&#160;В соответствии со ст. 14 Федерального закона от 31.05.2001 № 73-ФЗ “О государственной судебно-экспертной деятельности в Российской Федерации” (далее - ФЗ ГСЭД) руководителем <xsl:value-of select="exs:EKSName"/> разъяснены обязанности и права эксперта, предусмотренные ст. <xsl:value-of select="exs:CriminalCase/exs:ArcticleNumberRigth"/> УПК России.
										<br/>&#160;&#160;&#160;&#160;При поручении производства судебной экспертизы об уголовной ответственности за дачу заведомо ложного заключения по ст. <xsl:value-of select="exs:CriminalCase/exs:ArcticleNumber"/> Уголовного кодекса Российской Федерации предупрежден.</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td width="20%"/>
									<td width="30%"/>
									<td width="40%"/>
									<td width="10%"/>
								</tr>
								<xsl:for-each select="exs:CustomsPerson">
									<tr>
										<td class="underlined">&#160;<br/>
											<br/>
										</td>
										<td/>
										<td class="underlined" align="center">
											<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>
										</td>
										<td/>
									</tr>
									<tr>
										<td align="center" style="font-size:10">(подпись)</td>
										<td/>
										<td align="center" style="font-size:10">(инициалы, фамилия)</td>
										<td/>
									</tr>
									<tr>
										<td/>
										<td/>
										<td align="center">
											<br/><xsl:call-template name="monthword_date"><xsl:with-param name="dateIn" select="../exs:StudyStartDateTime"/></xsl:call-template></td>
										<td/>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;"><br/>&#160;&#160;&#160;&#160;
										<xsl:text>На основании постановления о назначении судебной экспертизы от </xsl:text>
										<xsl:call-template name="monthword_date">
											<xsl:with-param name="dateIn" select="exs:CriminalCase/exs:DecisionDate"/>
										</xsl:call-template>
										<xsl:text> г., </xsl:text>
										<xsl:value-of select="concat(exs:CriminalCase/exs:InitiatorPerson/cat_ru:PersonSurname,' ',exs:CriminalCase/exs:InitiatorPerson/cat_ru:PersonName,' ',exs:CriminalCase/exs:InitiatorPerson/cat_ru:PersonMiddleName)"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="exs:CriminalCase/exs:InitiatorPerson/cat_ru:PersonPost"/>
										<xsl:text> по уголовному делу № </xsl:text><xsl:value-of select="exs:CriminalCase/exs:UDNumber"/><xsl:text>, </xsl:text>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:text> экспертом </xsl:text>
											<xsl:value-of select="concat(cat_ru:PersonName,' ',cat_ru:PersonMiddleName,' ',cat_ru:PersonSurname)"/>,
											<xsl:apply-templates select="exs:Qualification"/>
											<xsl:text>, </xsl:text>
										</xsl:for-each>
										<xsl:text> проведена </xsl:text>
										<xsl:value-of select="exs:CriminalCase/exs:CustomExpertiseKind"/>
										<xsl:text> экспертиза.</xsl:text>
										<br/>
										<xsl:text>&#160;&#160;&#160;&#160;Экспертиза начата </xsl:text>
										<xsl:text> </xsl:text>
										<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStartDateTime"/>
										</xsl:call-template>
										<xsl:text>, окончена </xsl:text>
										<xsl:text> </xsl:text>
										<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStopDateTime"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>I. Описание поступивших на исследование объектов:</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:PresentedObject">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>Документы:<br/>
										<xsl:if test="exs:PresentedDocuments/exs:GTDNumber"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>- ДТ № <xsl:apply-templates select="exs:PresentedDocuments/exs:GTDNumber"/><br/>
										</xsl:if>
										<xsl:if test="exs:PresentedDocuments/exs:DocumentName">
											<xsl:for-each select="//exs:PresentedDocuments/exs:DocumentName">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text><xsl:text>- </xsl:text>
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'"> от <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template></xsl:when>
														<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>II. Вопросы, поставленные перед экспертом:</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Question">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>III. ИССЛЕДОВАТЕЛЬСКАЯ ЧАСТЬ</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/><b>1. Внешний осмотр</b></td>
								</tr>
								<tr>
									<td>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
											<xsl:if test="$hasCounter &gt; 1">1.<xsl:value-of select="position()"/><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="exs:Inspection"/>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="title_position" select="'Эксперт'"/>
														<xsl:with-param name="NotNeedPersonPost" select="1"/>
													</xsl:call-template>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<br/><b>2. Исследование</b></td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text><xsl:if test="$hasCounter &gt; 1">2.<xsl:value-of select="position()"/><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="exs:Study"/>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="title_position" select="'Эксперт'"/>
														<xsl:with-param name="NotNeedPersonPost" select="1"/>
													</xsl:call-template>
												</xsl:for-each>
											</tbody>
										</table>
										<br/>
									</td>
								</tr>
								<xsl:if test="exs:Synthesis">
									<tr>
										<td align="center">
											<br/>
											<br/>3. Синтезирующая часть</td>
									</tr>
									<tr>
										<td align="justify">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text><xsl:apply-templates select="exs:Synthesis"/>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<xsl:for-each select="exs:CustomsPerson">
														<xsl:call-template name="CustomsPerson">
															<xsl:with-param name="person" select="."/>
															<xsl:with-param name="title_position" select="'Эксперт'"/>
															<xsl:with-param name="NotNeedPersonPost" select="1"/>
														</xsl:call-template>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>IV.ВЫВОДЫ</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Conclusion">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="title_position" select="'Эксперт'"/>
														<xsl:with-param name="NotNeedPersonPost" select="1"/>
													</xsl:call-template>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="exs:CustomsControlStudy"> <!--Данные к заключению специалиста по исследованию, назначенному при таможенном контроле (форма "Исследование в рамках ТК")-->
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td align="center">
										<b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b>
										<br/>
										<b>Центральное экспертно-криминалистическое таможенное управление</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b><xsl:value-of select="exs:EKSName"/></b>
										<xsl:if test="exs:CEKTUDivision/exs:BranchNotEKSSign = '1' or exs:CEKTUDivision/exs:BranchNotEKSSign = 't' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'true' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'T'">
											<br/>
											<b><xsl:value-of select="exs:CEKTUDivision/exs:Name"/></b>
										</xsl:if>	
										<br/>
										<xsl:value-of select="exs:CEKTUDivision/exs:Address"/>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>Заключение по результатам исследования</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td>
														<xsl:text>№ </xsl:text>
														<xsl:value-of select="exs:ExpertSummaryNumber"/>
														<xsl:text> от </xsl:text>
														<xsl:call-template name="monthword_date">
															<xsl:with-param name="dateIn" select="exs:ExpertSummaryDate"/>
														</xsl:call-template>
														<xsl:text> года</xsl:text>
													</td>
													<td align="right">
														<xsl:value-of select="exs:ExpertSummaryCity"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<br/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>Исследование проведено: 
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:value-of select="concat(cat_ru:PersonSurname,' ',cat_ru:PersonName,' ',cat_ru:PersonMiddleName)"/>,
											<xsl:value-of select="cat_ru:PersonPost"/>, 
											<xsl:apply-templates select="exs:Qualification"/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
										<xsl:text>.</xsl:text>
										<br/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>На основании запроса <xsl:value-of select="exs:CustomsControlStudy/exs:Initiator"/> от 
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="exs:CustomsControlStudy/exs:DecisionDate"/></xsl:call-template>
										№ <xsl:value-of select="exs:CustomsControlStudy/exs:DecisionNumber"/> представлены:
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:PresentedObject">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Документы:</xsl:text><br/>
										<xsl:if test="exs:PresentedDocuments/exs:GTDNumber"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>- ДТ № <xsl:apply-templates select="exs:PresentedDocuments/exs:GTDNumber"/><br/>
										</xsl:if>
										<xsl:if test="exs:PresentedDocuments/exs:DocumentName">
											<xsl:for-each select="//exs:DocumentName">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;- </xsl:text>
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'"> от <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template></xsl:when>
														<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<br/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Исследование начато </xsl:text>
										<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStartDateTime"/>
										</xsl:call-template>
										<xsl:text>, </xsl:text>
										<xsl:text> окончено </xsl:text>
										<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStopDateTime"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td>
										<br/><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Исследование проводится в целях ответа на вопросы:</xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:Question">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/><b>ИССЛЕДОВАНИЕ</b>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:for-each select="exs:CustomsPerson">
											<!--xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text--><xsl:apply-templates select="exs:Study"/>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>ВЫВОДЫ</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:Conclusion">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
													</xsl:call-template>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
<!-- ========================================================================= -->
				<xsl:if test="exs:OperationalSearchActivities"> <!-- Данные к заключению специалиста по исследованию в рамках оперативно-розыскных мероприятий (форма "Исследование в рамках ОРД") -->
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td align="center">
										<b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b>
										<br/>
										<b>Центральное экспертно-криминалистическое таможенное управление</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b><xsl:value-of select="exs:EKSName"/></b>
										<xsl:if test="exs:CEKTUDivision/exs:BranchNotEKSSign = '1' or exs:CEKTUDivision/exs:BranchNotEKSSign = 't' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'true' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'T'">
											<br/>
											<b><xsl:value-of select="exs:CEKTUDivision/exs:Name"/></b>
										</xsl:if>	
										<br/>
										<xsl:value-of select="exs:CEKTUDivision/exs:Address"/>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>ЗАКЛЮЧЕНИЕ СПЕЦИАЛИСТА</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td>
														<xsl:text>№ </xsl:text>
														<xsl:value-of select="exs:ExpertSummaryNumber"/>
														<xsl:text> от </xsl:text>
														<xsl:call-template name="monthword_date">
															<xsl:with-param name="dateIn" select="exs:ExpertSummaryDate"/>
														</xsl:call-template>
														<xsl:text> года</xsl:text>
													</td>
													<td align="right">
														<xsl:value-of select="exs:ExpertSummaryCity"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<br/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text><xsl:text>Специалист</xsl:text><xsl:if test="count(exs:CustomsPerson)>1">ы</xsl:if>
										<xsl:text> отдела </xsl:text><xsl:value-of select="exs:CEKTUDivision/exs:Name"/><xsl:text> </xsl:text><xsl:value-of select="exs:EKSName"/><xsl:text> </xsl:text>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:if test="cat_ru:PersonName">
												<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
											<xsl:if test="cat_ru:PersonMiddleName">
												<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
											<xsl:if test="cat_ru:PersonName or cat_ru:PersonMiddleName">
												<xsl:text> </xsl:text>
											</xsl:if>
											<xsl:value-of select="cat_ru:PersonSurname"/>
											<xsl:text>, </xsl:text>
											<xsl:if test="cat_ru:PersonPost">
												<xsl:value-of select="cat_ru:PersonPost"/>
												<xsl:text>, </xsl:text>
											</xsl:if>	
										</xsl:for-each>
										 на основании письма <xsl:value-of select="exs:OperationalSearchActivities/exs:Initiator"/> от 
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="exs:OperationalSearchActivities/exs:DecisionDate"/></xsl:call-template>
										№ <xsl:value-of select="exs:OperationalSearchActivities/exs:DecisionNumber"/> , на основании письма № 
										<xsl:value-of select="exs:OperationalSearchActivities/exs:NumberCheck"/>, 
										произвел <xsl:value-of select="exs:OperationalSearchActivities/exs:CustomExpertiseKind"/> исследование.<br/>
									</td>
								</tr>
								<tr>
									<td align="center"><b>НА ИССЛЕДОВАНИЕ ПРЕДОСТАВЛЕНО:</b></td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:PresentedObject">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Документы:</xsl:text><br/>
										<xsl:if test="exs:PresentedDocuments/exs:GTDNumber"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>- ДТ № <xsl:apply-templates select="exs:PresentedDocuments/exs:GTDNumber"/><br/>
										</xsl:if>
										<xsl:if test="exs:PresentedDocuments/exs:DocumentName">
											<xsl:for-each select="//exs:DocumentName">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;- </xsl:text>
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'"> от <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template></xsl:when>
														<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/><b>ИССЛЕДОВАНИЕМ ТРЕБУЕТСЯ УСТАНОВИТЬ:</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Question">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<br/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text>Исследование начато </xsl:text>
										<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStartDateTime"/>
										</xsl:call-template>
										<xsl:text>, окончено </xsl:text>
										<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStopDateTime"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/><b>ИССЛЕДОВАНИЕ</b>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="exs:Study"/>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>ПРОВЕДЕННЫМ ИССЛЕДОВАНИЕМ УСТАНОВЛЕНО:</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Conclusion">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="expert" select="'spec'"/>
													</xsl:call-template>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
<!-- ========================================================================= -->
				<xsl:if test="exs:ContinuousExpertSupport"> <!-- Данные к заключению специалиста по исследованию в рамках непрерывного экспертного обеспечения (форма "Исследование в рамках НЭО")-->
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td align="center">
										<b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b>
										<br/>
										<b>Центральное экспертно-криминалистическое таможенное управление</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b><xsl:value-of select="exs:EKSName"/></b>
										<xsl:if test="exs:CEKTUDivision/exs:BranchNotEKSSign = '1' or exs:CEKTUDivision/exs:BranchNotEKSSign = 't' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'true' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'T'">
											<br/>
											<b><xsl:value-of select="exs:CEKTUDivision/exs:Name"/></b>
										</xsl:if>	
										<br/>
										<xsl:value-of select="exs:CEKTUDivision/exs:Address"/>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>ЗАКЛЮЧЕНИЕ СПЕЦИАЛИСТА</b>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text>Дата составления: </xsl:text>
										<xsl:call-template name="monthword_date">
											<xsl:with-param name="dateIn" select="exs:ExpertSummaryDate"/>
										</xsl:call-template>
										<xsl:text> года </xsl:text>
										<br/>
										<xsl:text>Место составления: </xsl:text>
										<xsl:value-of select="exs:ExpertSummaryCity"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text>Составлено специалист</xsl:text><xsl:choose>
											<xsl:when test="count(exs:CustomsPerson)>1">ами</xsl:when>
											<xsl:otherwise>ом</xsl:otherwise>
										</xsl:choose>
										<xsl:text>: </xsl:text>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:value-of select="concat(cat_ru:PersonSurname,' ',cat_ru:PersonName,' ',cat_ru:PersonMiddleName)"/>
											<xsl:if test="cat_ru:PersonPost">
												<xsl:text>, должность: </xsl:text>
												<xsl:value-of select="cat_ru:PersonPost"/>
											</xsl:if>
											<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
										</xsl:for-each>
										<xsl:text>, на основании задания на экспертно-криминалистическое обеспечение, выданного </xsl:text>
										<xsl:value-of select="exs:ContinuousExpertSupport/exs:Initiator"/>
										<xsl:text> в рамках неотложных следственных действий.</xsl:text>	
									</td>
								</tr>
								<tr>
									<td><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>Представлены исследуемые объекты:</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:PresentedObject">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Документы:</xsl:text><br/>
										<xsl:if test="exs:PresentedDocuments/exs:GTDNumber"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>- ДТ № <xsl:apply-templates select="exs:PresentedDocuments/exs:GTDNumber"/><br/>
										</xsl:if>
										<xsl:if test="exs:PresentedDocuments/exs:DocumentName">
											<xsl:for-each select="//exs:DocumentName">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;- </xsl:text>
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'"> от <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template></xsl:when>
														<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>
										<br/><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>Требуется ответить на следующие вопросы:
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Question">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center"><b>ИССЛЕДОВАНИЕ</b></td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text>Исследование начато </xsl:text>
										<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStartDateTime"/>
										</xsl:call-template>
										<xsl:text>, окончено </xsl:text>
										<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStopDateTime"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:for-each select="exs:CustomsPerson">
											<!--xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text-->
											<xsl:apply-templates select="exs:Study"/>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>ИССЛЕДОВАНИЕМ УСТАНОВЛЕНО:</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Conclusion">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="expert" select="'spec'"/>
													</xsl:call-template>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа exs:CEKTUDivisionInformationType -->
	<xsl:template match="exs:CEKTUDivision">
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Код подразделения ЦЭКТУ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="exs:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование подразделения ЦЭКТУ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="exs:Name"/>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Адрес подразделения ЦЭКТУ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="exs:Address"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа exs:ConclusionType -->
	<xsl:template match="exs:Conclusion">
		<tr>
			<td width="5%" valign="top">
				<!--xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text--><xsl:value-of select="exs:ConclusionNumber"/>.
			</td>
			<td>
				<xsl:for-each select="exs:ConclusionText">
					<xsl:value-of select="normalize-space(.)"/>
					<xsl:if test="position()!=last()"> </xsl:if>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа exs:CustomsPersonType -->
	<xsl:template match="exs:CustomsPerson">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PersonSurname"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PersonName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PersonMiddleName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PersonPost"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="exs:Qualification"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа exs:DecisionNumberType -->
	<xsl:template match="exs:DecisionNumber">
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:SerialNumber"/>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Момент назначения экспертизы (ДВ - до выпуска ДТ, ПВ - после выпуска ДТ) </td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="exs:ExpertisePoint=ДВ">
							<xsl:text>до выпуска ДТ</xsl:text>
						</xsl:when>
						<xsl:when test="exs:ExpertisePoint=ПВ">
							<xsl:text>после выпуска ДТ</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="exs:ExpertisePoint"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа exs:SummaryType -->
	<xsl:template match="exs:ExternalIinspection">
</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="exs:GTDNumber">
		<xsl:variable name="CustCode" select="cat_ru:CustomsCode"/>
		<xsl:variable name="date">
			<xsl:call-template name="number_date">
				<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="gdtNum" select="cat_ru:GTDNumber"/>
		<xsl:value-of select="concat($CustCode,'/',$date,'/',$gdtNum)"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="exs:InitiatorPerson">
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Фамилия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Имя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonMiddleName">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Отчество</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа exs:PresentedDocumentsType -->
	<xsl:template match="exs:PresentedDocuments">
		<xsl:if test="exs:GTDNumber">
			<div class="title marg-top">Регистрационный номер ДТ.</div>
		</xsl:if>
		<xsl:apply-templates select="exs:GTDNumber"/>
		<xsl:if test="exs:DocumentName">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="exs:DocumentName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа exs:PresentedObjectsType -->
	<xsl:template match="exs:PresentedObject">
		<tr valign="top">
			<td width="5%">
				<!--xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text-->
				<xsl:value-of select="exs:ObjectNumber"/>.
			</td>
			<td>
				<xsl:apply-templates select="exs:ObjectNote"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа exs:QualificationType -->
	<xsl:template match="exs:Qualification">
		образование: <xsl:value-of select="exs:Education"/>, 
        специальность: <xsl:apply-templates select="exs:Specialization"/>, 
		свидетельство: <xsl:value-of select="exs:ExpertSertificateNumber"/>, 
		стаж экспертной работы(лет): <xsl:value-of select="exs:WorkExperience"/>
	</xsl:template>
	<!-- Шаблон для типа exs:QuestionType -->
	<xsl:template match="exs:Question">
		<xsl:variable name="QuestionNumber" select="exs:QuestionNumber"/>
		<tr valign="top">
			<td width="5%">
				<!--xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text--><xsl:value-of select="exs:QuestionNumber"/><xsl:text>. </xsl:text>
			</td>
			<td>
				<xsl:value-of select="exs:QuestionText"/>
				<xsl:if test="//exs:CustomsPerson/exs:QuestionTextExpertInfo[exs:QuestionNumber=$QuestionNumber]">
					<br/>
					<xsl:text>Вопрос интерпретирован экспертом в следующей формулировке: </xsl:text>
					<xsl:for-each select="//exs:CustomsPerson/exs:QuestionTextExpertInfo[exs:QuestionNumber = $QuestionNumber]">
						<br/>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="exs:QuestionTextExpertInfo">
		<u><xsl:value-of select="concat(../cat_ru:PersonSurname,' ',substring(../cat_ru:PersonName,1,1),'.',substring(../cat_ru:PersonMiddleName,1,1))"/>
		<xsl:text>:</xsl:text></u>
		<xsl:text> </xsl:text>
		<!--xsl:text>: Вопрос </xsl:text>
		<xsl:value-of select="exs:QuestionNumber"/>
		<xsl:text> </xsl:text-->
		<xsl:apply-templates select="exs:QuestionTextExpert"/>
	</xsl:template>
	<!-- Шаблон для типа exs:SummaryType -->
	<xsl:template name="additionElement">
		<xsl:param name="num"/>
		<tr>
			<td width="5%" valign="top">
				<xsl:value-of select="$num"/>.<xsl:value-of select="exs:OrderNumber"/>.</td>
			<td>
				<xsl:for-each select="exs:Description">
					<xsl:value-of select="normalize-space(.)"/>
					<xsl:if test="position()!=last()">&#160;</xsl:if>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="CustomsPerson">
		<xsl:param name="person"/>
		<xsl:param name="expert"/>
		<xsl:param name="title_position"/>
		<xsl:param name="NotNeedPersonPost" select="0"/>
		<tr>
			<td colspan="5">
				<br/>
				<br/>
					<!--xsl:choose>
						<xsl:when test="$expert='spec'">Специалист</xsl:when>
						<xsl:otherwise>Таможенный эксперт</xsl:otherwise>
					</xsl:choose-->
					<!--(<xsl:value-of select="exs:Qualification/exs:Specialization"/>)-->
					<!--xsl:text>Должность эксперта </xsl:text-->
					<xsl:value-of select="$title_position"/>
					<xsl:if test="cat_ru:PersonPost and $NotNeedPersonPost!=1 and $NotNeedPersonPost!='true'">
						<br/>
						<xsl:value-of select="cat_ru:PersonPost"/>
					</xsl:if>
				</td>
		</tr>
		<tr>
			<td width="5%"/>
			<td align="center" width="50%" class="underlined">
				<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),' ',cat_ru:PersonSurname)"/>
			</td>
			<td width="20%"/>
			<td width="25%" class="underlined"/>
			<td/>
		</tr>
		<tr>
			<td/>
			<td align="center" style="font-size:10">(инициалы, фамилия)</td>
			<td/>
			<td align="center" style="font-size:10">(подпись)</td>
			<td/>
		</tr>
	</xsl:template>
	<xsl:template name="time_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,12,2)"/> ч. <xsl:value-of select="substring($dateIn,15,2)"/> мин.
				<xsl:text> </xsl:text>
				<xsl:call-template name="monthword_date">
					<xsl:with-param name="dateIn" select="$dateIn"/>
				</xsl:call-template>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="number_date">
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
	<xsl:template name="monthword_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:variable name="month" select="substring($dateIn,6,2)"/>
				<xsl:choose>
					<xsl:when test="substring($dateIn,6,2)='01'">января</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='02'">февраля</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='03'">марта</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='04'">апреля</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='05'">мая</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='06'">июня</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='07'">июля</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='08'">августа</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='09'">сентября</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='10'">октября</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='11'">ноября</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='12'">декабря</xsl:when>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0 and substring($date,1,10)!='0001-01-01'">
				<xsl:variable name="month" select="substring($date, 6, 2)"/>
				&#34;<u><xsl:value-of select="substring($date,9,2)"/></u>&#34;
				&#160;<u>&#160;
				<xsl:choose>
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
				</xsl:choose> 					
				</u>&#160;<xsl:value-of select="substring($date,1,2)"/><u><xsl:value-of select="substring($date,3,2)"/></u>&#160;г.
			</xsl:when>
			<xsl:otherwise>
				&#34;<u>&#160;&#160;&#160;&#160;&#160;</u>&#34;
				&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
