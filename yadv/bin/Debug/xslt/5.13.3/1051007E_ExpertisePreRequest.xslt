<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:epr="urn:customs.ru:Information:CustomsDocuments:ExpertisePreRequest:5.11.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ExpertisePreRequestType -->
	<xsl:template match="epr:ExpertisePreRequest">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: nowrap;
									}

									div.page {
									width: 190mm;
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
								</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Предварительный запрос возможности проведения ЭИР</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/><br/>
					<table class="w190">
						<tbody>
							<tr align="right">
								<td>
									<xsl:value-of select="epr:Initiator/cat_ru:OfficeName"/>
									<xsl:text> (</xsl:text>
									<xsl:value-of select="epr:Initiator/cat_ru:Code"/>
									<xsl:text>)</xsl:text>
									<br/>
									<xsl:value-of select="epr:Initiator/epr:Address"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/><br/>
					<table class="w190">
						<tbody>
							<tr align="justify">
								<td>
									Имеется ли в ЦЭТКУ, код подразделения <xsl:value-of select="epr:CEKTUDivision"/>, возможность провести 
									<xsl:choose>
										<xsl:when test="epr:CustomExpertiseKind='1'">первичную</xsl:when>
										<xsl:when test="epr:CustomExpertiseKind='2'">дополнительную</xsl:when>
										<xsl:when test="epr:CustomExpertiseKind='3' or epr:CustomExpertiseKind='4' or epr:CustomExpertiseKind='5'">повторную</xsl:when>
									</xsl:choose>
									<xsl:text> экспертизу объектов: </xsl:text>
									<xsl:for-each select="epr:StudyObjectsDescriptions">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									<xsl:text>.</xsl:text>
								</td>
							</tr>
							<tr align="justify">
								<td>
									<br/>
									<xsl:text>В срок с </xsl:text>
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="epr:BeginDate"/></xsl:call-template>
									<xsl:text> г. по </xsl:text>
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="epr:EndDate"/></xsl:call-template>
									<xsl:text> г.</xsl:text>
								</td>
							</tr>
							<tr align="justify">
								<td>
									<br/>
									Перед экспертом требуется поставить вопросы:
								</td>
							</tr>
							<tr align="justify">
								<td>
									<table>
										<tbody>
											<xsl:for-each select="epr:Question">
												<tr valign="top">
													<td style="width:5mm;">
														<xsl:value-of select="epr:QuestionNumber"/>
													</td>
													<td>
														<xsl:value-of select="epr:QuestionText"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<xsl:if test="epr:IsPossybleExpertiseOnlyPhoto='true' or epr:IsPossybleExpertiseOnlyPhoto='1'">
								<tr align="justify">
									<td>
										<br/>
										Возможно ли проведение ЭИР на основании фотографий объектов исследования и (или) иных документов? 
									</td>
								</tr>
							</xsl:if>
							<tr align="justify">
								<td>
									<xsl:text>Возможность предоставить эксперту объекты исследования </xsl:text>
									<xsl:choose>
										<xsl:when test="epr:IsPossibleGiveStudyObjects='true' or epr:IsPossibleGiveStudyObjects='1'">присутствует</xsl:when>
										<xsl:otherwise>отсутствует</xsl:otherwise>
									</xsl:choose>
									<xsl:text>.</xsl:text>
								</td>
							</tr>
							<xsl:if test="epr:AddressStorageStudyObjects">
								<tr align="justify">
									<td>
										<br/>
										Для осмотра и изучения объектов исследования эксперту необходимо явиться на СВХ по адресу: <xsl:value-of select="epr:AddressStorageStudyObjects"/>. 
									</td>
								</tr>
							</xsl:if>
							<tr align="right">
								<td>
									<br/><br/><br/>
									<xsl:for-each select="epr:InspectorInfo">
										<xsl:value-of select="cat_ru:PersonPost"/>
										<br/>
										<xsl:value-of select="cat_ru:PersonSurname"/><xsl:text> </xsl:text><xsl:value-of select="cat_ru:PersonName"/><xsl:text> </xsl:text><xsl:value-of select="cat_ru:PersonMiddleName"/>
										<br/>
										<xsl:value-of select="epr:Phone"/>
									</xsl:for-each>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа epr:InitiatorType -->
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
