<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rcd="urn:customs.ru:Information:CustomsDocuments:ReqCorrectedDecision:5.13.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ReqCorrectedDecisionType -->
	<xsl:template match="rcd:ReqCorrectedDecision">
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
									width: 190mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm 10mm 10mm 20mm;
									background: #ffffff;
									border: solid 1pt #000000;
									font-family: Arial;
									font-size: 10pt;
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
									font-family: Arial;
									font-size: 9pt;
									}

									table.border tr td
									{
									border: 1px solid gray;
									}

									.graph {
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

									.graphMainValue
									{
									vertical-align:bottom;
									font-size: 9pt;
									font-family:Arial;
									font-weight: normal;
									border-bottom: solid 1px DarkGrey;
									}

									.graphMainTitle
									{
									vertical-align:top;
									font-size: 9pt;
									font-family:Arial;
									font-weight: bold;
									}

									td.value.graphMain
									{
									font-weight: normal;
									vertical-align:bottom;
									}
								</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMainTitle">
									ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMainTitle">
									<font size="4">
										<b>Требование на корректировку <!-- сведений, заявленных в документе-основании проведения экспертно-исследовательской работы --></b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table class="w190">
						<tr>
							<td class="graphMainTitle" style="width:50%">Уникальный идентификатор документа</td>
							<td class="graphMainValue" width="50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="graphMainTitle" width="50%">Уникальный идентификатор исходного документа</td>
								<td class="graphMainValue" width="50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<table class="w190">
						<tr>
							<td class="graphMainTitle" width="50%">Дата требования на корректировку:</td>
							<td class="graphMainValue" width="50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rcd:RequestDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="rcd:TKPunkt">
						<br/>
						<table class="w190">
							<tr>
								<td class="graphMainTitle"  width="50%">Номер статьи, в соответствии с которой направляется документ:</td>
								<td class="graphMainValue"  width="50%"><xsl:value-of select="rcd:TKPunkt"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rcd:DecisionNumber">
						<br/>
						<table class="w190">
							<tr>
								<td class="graphMainTitle" width="50%">Номер документа-основания проведения ЭИР:</td>
								<td class="graphMainValue" width="50%"><xsl:apply-templates select="rcd:DecisionNumber"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rcd:Uncertainty">
						<br/>
						<table class="w190">
							<tr>
								<td class="graphMainTitle" width="50%">Выявленные несоответствия:</td>
								<td class="graphMainValue" width="50%">
									<xsl:for-each select="rcd:Uncertainty/rcd:UncertDescription">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rcd:Instruction">
						<br/>
						<table class="w190">
							<tr>
								<td class="graphMainTitle" width="100%">Действия, необходимые для устранения<br/>несоответствий, описание:</td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
								<td class="graphMainValue" width="100%">
									<xsl:for-each select="rcd:Instruction/rcd:InstructionDescription">
										<!--xsl:value-of select="position()"/>
										<xsl:text>) </xsl:text-->
										<xsl:value-of select="."/>
										<!--br/-->
									</xsl:for-each>
								</td>
							</tr>
						</table>		
						<br/>
					</xsl:if>
					<xsl:if test="rcd:Instruction/rcd:InstrDocument">
						<br/>
						<table class="w190">
							<tr>
								<td class="graphMainTitle" width="50%">Документ,  в соответствии с которым требуется выполнение действий для устранения несоответствий:</td>
								<td class="graphMainValue" width="50%">
									<xsl:for-each select="rcd:Instruction/rcd:InstrDocument">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<br/>
					<table class="w190">
						<tr>
							<td class="graphMainTitle" width="50%">Код подразделения ЦЭКТУ:</td>
							<td class="graphMainValue" width="50%">
								<xsl:value-of select="rcd:CEKTUDivision"/>
							</td>
						</tr>
					</table>
					<xsl:if test="rcd:CEKTUDivision/cat_ru:OfficeName">
						<br/>
						<table class="w190">
							<tr>
								<td class="graphMainTitle" width="50%">Наименование подразделения ЦЭКТУ:</td>
								<td class="graphMainValue" width="50%">
									<xsl:value-of select="rcd:CEKTUDivision/cat_ru:OfficeName"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rcd:CustomsPerson">
						<br/>
						<table class="w190">
							<tr>
								<td class="graphMainTitle" width="100%">Должностное лицо, сформировавшее<br/>Требование на корректировку:</td>
							</tr>
						</table>		
						<xsl:apply-templates select="rcd:CustomsPerson"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rcd:PersonType -->
	<xsl:template match="rcd:CustomsPerson">
		<br/>
		<table class="w190">
			<tr>
				<td class="graphMainTitle" width="50%">&#160;&#160;&#160;&#160;&#160;Должность:</td>
				<td class="graphMainValue" width="50%">
					<xsl:value-of select="rcd:PersonPost"/>
				</td>
			</tr>
		</table>
		<br/>
		<table class="w190">
			<tr>
				<td class="graphMainTitle" width="50%">&#160;&#160;&#160;&#160;&#160;ФИО должностного лица:</td>
				<td class="graphMainValue" width="50%">
					<xsl:value-of select="rcd:PersonSurname"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="rcd:PersonName"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="rcd:PersonMiddleName"/>
				</td>
			</tr>
		</table>
		<br/>
		<table class="w190">
			<tr>
				<td class="graphMainTitle" width="50%">&#160;&#160;&#160;&#160;&#160;Телефон должностного лица:</td>
				<td class="graphMainValue" width="50%">
					<xsl:value-of select="rcd:Phone"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа rcd:DecisionNumberType -->
	<xsl:template match="rcd:DecisionNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:SerialNumber"/>
		<xsl:text> (</xsl:text>
		<xsl:choose>
			<xsl:when test="rcd:ExpertisePoint='ДВ'">до выпуска ДТ</xsl:when>
			<xsl:when test="rcd:ExpertisePoint='ПВ'">после выпуска ДТ</xsl:when>
			<xsl:otherwise><xsl:value-of select="rcd:ExpertisePoint"/></xsl:otherwise>
		</xsl:choose>
		<xsl:text>)</xsl:text>
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
	<xsl:template name="gtd_date">
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
</xsl:stylesheet>
