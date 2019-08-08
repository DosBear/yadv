<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rdexp="urn:customs.ru:Information:CustomsDocuments:ResolutionDefinitionExpertise:5.11.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ResolutionDefinitionExpertiseType -->
	<xsl:template match="rdexp:ResolutionDefinitionExpertise">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: normal;
									}

									div.page {
									width: 210mm;
									max-width: 210mm;
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
									max-width: 100%;
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
									}

									div.title, tr.title td { font-weight:bold;  }
									.bordered { border-collapse: collapse; }
									td.bordered
									{
									border: solid 1px windowtext;
									}

									td.graphMain
									{
										vertical-align:top;
									}
									td.value.graphMain
									{
										vertical-align:bottom;
									}
									
									.definition
									{
										font-size:8pt;
										text-align: center;
									}
								</style>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="rdexp:DefinitionOrResolution='1'">
						<!--определение-->
						<div class="page">
							<table class="w190">
								<tbody>
									<tr>
										<td align="center" class="graphMain">
											<xsl:value-of select="rdexp:Initiator/cat_ru:OfficeName"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table class="w190">
								<tbody>
									<tr>
										<td align="center" colspan="3">
											ОПРЕДЕЛЕНИЕ<br/>
											о назначении <xsl:value-of select="rdexp:ExpertiseKind"/>  экспертизы
										</td>
									</tr>
									<tr>
										<td align="left">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="rdexp:RDEDate"/>
											</xsl:call-template> г.
										</td>
										<td width="30%"/>
										<td align="right">
											<xsl:value-of select="rdexp:RDEPlace"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td>
											<xsl:value-of select="rdexp:InspectorInfo/cat_ru:PersonPost"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="rdexp:InspectorInfo/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="rdexp:InspectorInfo/cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="rdexp:InspectorInfo/cat_ru:PersonMiddleName"/>
											<xsl:text>, изучив материалы дела об административном правонарушении № </xsl:text>
											<xsl:value-of select="rdexp:ActNumber"/>
											<xsl:text> в отношении </xsl:text>
											<xsl:value-of select="rdexp:Definition/rdexp:ObjectofAct"/>
											<xsl:text> по ч.</xsl:text>
											<xsl:value-of select="rdexp:Definition/rdexp:PartNumber"/>
											<xsl:text> ст.</xsl:text>
											<xsl:value-of select="rdexp:Definition/rdexp:ArticleNumber"/>
											<xsl:text> КоАП России</xsl:text>
										</td>
									</tr>
									<tr>
										<td align="center"><br/><br/>УСТАНОВИЛ:</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="rdexp:BasisOfExpertise"/>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center"><br/><br/>ОПРЕДЕЛИЛ:</td>
									</tr>
									<tr>
										<td align="justify">
											1. Назначить по настоящему делу  об административном правонарушении <xsl:value-of select="rdexp:ExpertiseKind"/> экспертизу, поручив ее производство <xsl:value-of select="rdexp:NameOfInstitutionExpertise"/>
											<br/>
											<br/>
											2. Поставить на разрешение эксперту следующие вопросы:
											<br/>
											<xsl:for-each select="rdexp:Question">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text><xsl:value-of select="rdexp:QuestionNumber"/>. <xsl:value-of select="rdexp:QuestionText"/>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
											<br/>
											<br/>
											3. Предоставить в распоряжение эксперта:<br/>
											предметы административного правонарушения, товары:<br/>
											<xsl:for-each select="rdexp:Goods">
												<xsl:for-each select="rdexp:StudyObject">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;- </xsl:text><xsl:apply-templates select="rdexp:Template"/>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
											<br/><br/>
											документы: <br/>
											<xsl:for-each select="rdexp:PresentedDocuments/rdexp:Document">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;- </xsl:text>
												<xsl:for-each select="*">
													<xsl:choose>
														<xsl:when test="local-name(.)='ContainerDocumentID'"/>
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
												<xsl:if test="position()!=last()"><br/></xsl:if>
											</xsl:for-each>
											<br/>
											<br/>
											4. Поручить <xsl:value-of select="rdexp:PersonWhoInstructedExpert"/> разъяснить эксперту его права и обязанности, предусмотренные ст. 25.9 КоАП РФ, и предупредить его об административной ответственности за дачу заведомо ложного заключения (ст. 17.9 КоАП РФ).
										</td>
									</tr>
								</tbody>
							</table>
							<table class="w190">
								<tbody>
									<tr>
										<td width="40%">Должностное лицо таможенного органа</td>
										<td width="30%" style="border-bottom:1px solid;"/>
										<td width="30%" style="border-bottom:1px solid;" align="center">
											<xsl:value-of select="rdexp:InspectorInfo/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="substring(rdexp:InspectorInfo/cat_ru:PersonName,1,1)"/>
											<xsl:text>. </xsl:text>
											<xsl:if test="rdexp:InspectorInfo/cat_ru:PersonMiddleName">
												<xsl:value-of select="substring(rdexp:InspectorInfo/cat_ru:PersonMiddleName,1,1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td/>
										<td class="definition">(подпись)</td>
										<td class="definition">(фамилия и инициалы)</td>
									</tr>
								</tbody>
							</table>
							<table class="w190">
								<tbody>
									<tr>
										<td colspan="3">
											<br/><br/>
											Права и обязанности, предусмотренные ст. 25.9 КоАП РФ, мне разъяснены «___» ________20 ___г. Одновременно я предупрежден об административной ответственности за дачу заведомо ложного заключения (ст. 17.9 КоАП РФ).
										</td>
									</tr>
									<tr>
										<td width="40%">Эксперт</td>
										<td width="30%" style="border-bottom:1px solid;"/>
										<td width="30%" style="border-bottom:1px solid;" align="center"/>
									</tr>
									<tr>
										<td/>
										<td class="definition">(подпись)</td>
										<td class="definition">(фамилия и инициалы)</td>
									</tr>
									<tr>
										<td colspan="3">
											<br/>
											<br/>
											С настоящим определением ознакомлен(а)	«____» ____________ 20____г.
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<br/>
											<br/>
											<br/>
											До направления настоящего определения для исполнения мне
										</td>
									</tr>
									<tr>
										<td colspan="3" style="border-bottom:1px solid;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="definition">
											(наименование, организационно-правовая форма юридического лица; фамилия, имя, отчество,, должность законного представителя юридического
										</td>
									</tr>
									<tr>
										<td colspan="3" style="border-bottom:1px solid;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="definition">
											лица; фамилия, имя, отчество индивидуального предпринимателя; фамилия, имя, отчество,
										</td>
									</tr>
									<tr>
										<td colspan="3" style="border-bottom:1px solid;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="definition">
											физического лица (или его законного представителя) серия, номер документа, удостоверяющего личность, кем и когда выдан)
										</td>
									</tr>
									<tr>
										<td colspan="3">
											разъяснены права лица, в отношении которого ведется производство по делу об административном правонарушении, в том числе: заявлять отвод эксперту, просить о привлечении в качестве эксперта указанных мной лиц, ставить вопросы для дачи на них ответов в заключении эксперта. 
										</td>
									</tr>
									<tr>
										<td width="40%">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
										<td width="30%" style="border-bottom:1px solid;"/>
										<td width="30%" style="border-bottom:1px solid;" align="center"/>
									</tr>
									<tr>
										<td/>
										<td class="definition">(подпись)</td>
										<td class="definition">(фамилия и инициалы)</td>
									</tr>
									<tr>
										<td colspan="3">
											<br/>
											<br/>
											С настоящим определением ознакомлен(а)	«____» ____________ 20____г.
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<br/>
											<br/>
											<br/>
											До направления настоящего определения для исполнения мне
										</td>
									</tr>
									<tr>
										<td colspan="3" style="border-bottom:1px solid;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="definition">
											(наименование, организационно-правовая форма юридического лица;
										</td>
									</tr>
									<tr>
										<td colspan="3" style="border-bottom:1px solid;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="definition">
											фамилия, имя, отчество, должность законного представителя юридического лица;
										</td>
									</tr>
									<tr>
										<td colspan="3" style="border-bottom:1px solid;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="definition">
											фамилия, имя, отчество индивидуального предпринимателя;
										</td>
									</tr>
									<tr>
										<td colspan="3" style="border-bottom:1px solid;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="definition">
											фамилия, имя, отчество, физического лица (его законного представителя) серия, номер документа, 
										</td>
									</tr>
									<tr>
										<td colspan="3" style="border-bottom:1px solid;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="definition">
											удостоверяющего личность, кем и когда выдан)
										</td>
									</tr>
									<tr>
										<td colspan="3">
											разъяснены права потерпевшего по делу об административном правонарушении, в том числе: заявлять отвод эксперту, просить о привлечении в качестве эксперта указанных мной лиц, ставить вопросы для дачи на них ответов в заключении эксперта.
										</td>
									</tr>
									<tr>
										<td width="40%">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
										<td width="30%" style="border-bottom:1px solid;"/>
										<td width="30%" style="border-bottom:1px solid;" align="center"/>
									</tr>
									<tr>
										<td/>
										<td class="definition">(подпись)</td>
										<td class="definition">(фамилия и инициалы)</td>
									</tr>
									<tr>
										<td colspan="3" style="font-size:9pt;">
											<br/>
											<br/>
											Примечание: Должностное лицо таможенного органа, в производстве которого находится дело об административном правонарушении, в соответствии с ч. 4 статьи 26.4 КоАП РФ обязано ознакомить лицо, в отношении которого ведется производство по делу об административном правонарушении или его законного представителя, а также потерпевшего или его законного представителя с определением о назначении экспертизы  до его направления эксперту или в учреждение, которому поручено проведение экспертизы.
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:when>
					<xsl:when test="rdexp:DefinitionOrResolution='2'">
						<!--постановление-->
						<div class="page">
							<table class="w190">
								<tbody>
									<tr>
										<td align="center" class="graphMain">
											<xsl:value-of select="rdexp:Initiator/cat_ru:OfficeName"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table class="w190">
								<tbody>
									<tr>
										<td align="center" colspan="3">
											ПОСТАНОВЛЕНИЕ<br/>
											о назначении <xsl:value-of select="rdexp:ExpertiseKind"/>  экспертизы
										</td>
									</tr>
									<tr>
										<td align="left">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="rdexp:RDEDate"/>
											</xsl:call-template> г.
										</td>
										<td width="30%"/>
										<td align="right">
											<xsl:value-of select="rdexp:RDEPlace"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td>
											<xsl:value-of select="rdexp:InspectorInfo/cat_ru:PersonPost"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="rdexp:InspectorInfo/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="rdexp:InspectorInfo/cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="rdexp:InspectorInfo/cat_ru:PersonMiddleName"/>
											<xsl:text>, рассмотрев материалы уголовного дела № </xsl:text>
											<xsl:value-of select="rdexp:ActNumber"/>
										</td>
									</tr>
									<tr>
										<td align="center"><br/>УСТАНОВИЛ:</td>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="rdexp:BasisOfExpertise"/>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center"><br/>ПОСТАНОВИЛ:</td>
									</tr>
									<tr>
										<td align="justify">
											1. Назначить <xsl:value-of select="rdexp:ExpertiseKind"/> экспертизу, производство которой поручить <xsl:value-of select="rdexp:NameOfInstitutionExpertise"/>
											<br/>
											<br/>
											2. Поставить перед  экспертом  вопросы:
											<br/>
											<xsl:for-each select="rdexp:Question">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text><xsl:value-of select="rdexp:QuestionNumber"/>. <xsl:value-of select="rdexp:QuestionText"/>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
											<br/>
											<br/>
											3. Предоставить в распоряжение эксперта:<br/>
											материалы:<br/>
											<xsl:for-each select="rdexp:Goods">
												<xsl:for-each select="rdexp:StudyObject">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;- </xsl:text><xsl:apply-templates select="rdexp:Template"/>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
											<br/><br/>
											документы: <br/>
											<xsl:for-each select="rdexp:PresentedDocuments/rdexp:Document">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;- </xsl:text>
												<xsl:for-each select="*">
													<xsl:choose>
														<xsl:when test="local-name(.)='ContainerDocumentID'"/>
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
												<xsl:if test="position()!=last()"><br/></xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
											4. Поручить <xsl:value-of select="rdexp:PersonWhoInstructedExpert"/> разъяснить эксперту его права и обязанности, предусмотренные ст.  57 УПК РФ, и предупредить его об уголовной ответственности по ст. 307 УК РФ за дачу заведомо ложного заключения.
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table class="w190">
								<tbody>
									<tr>
										<td width="40%">Должностное лицо</td>
										<td width="30%" style="border-bottom:1px solid;"/>
										<td width="30%" style="border-bottom:1px solid;" align="center">
											<xsl:value-of select="rdexp:InspectorInfo/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="substring(rdexp:InspectorInfo/cat_ru:PersonName,1,1)"/>
											<xsl:text>. </xsl:text>
											<xsl:if test="rdexp:InspectorInfo/cat_ru:PersonMiddleName">
												<xsl:value-of select="substring(rdexp:InspectorInfo/cat_ru:PersonMiddleName,1,1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td/>
										<td class="definition">(подпись)</td>
										<td class="definition">(фамилия и инициалы)</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table class="w190">
								<tbody>
									<tr>
										<td colspan="3">
											Права и обязанности, предусмотренные ст. 57 УПК РФ, мне разъяснены «___» ________20 ___г. Одновременно я предупрежден об уголовной ответственности по  ст.  307  УК  РФ  за  дачу  заведомо ложного заключения.
											<br/><br/>
										</td>
									</tr>
									<tr>
										<td width="40%">Эксперт</td>
										<td width="30%" style="border-bottom:1px solid;"/>
										<td width="30%" style="border-bottom:1px solid;" align="center"/>
									</tr>
									<tr>
										<td/>
										<td class="definition">(подпись)</td>
										<td class="definition">(фамилия и инициалы)</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:when>
				</xsl:choose>
			</body>
		</html>
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
</xsl:stylesheet>
