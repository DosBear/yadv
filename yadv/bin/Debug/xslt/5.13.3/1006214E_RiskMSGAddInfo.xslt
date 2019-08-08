<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rskmsgadd="urn:customs.ru:Information:CustomsDocuments:RiskMSGAddInfo:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0">
	<!-- Шаблон для типа RiskMSGAddInfoType -->
	<xsl:template match="rskmsgadd:RiskMSGAddInfo">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									/*white-space: nowrap;*/
									}

									div.page {
									width: 190mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
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
									font-family: Arial;
									font-size: 9pt;
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
										<b>Дополнительная информация для сообщений о выявленных рисках</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="title marg-top">Выгруженные данные в ЕБВР</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered" width="50%">Критерии сопоставления с записями ЕБВР</td>
								<td class="graphMain bordered" width="50%">Добавляемая информация</td>
							</tr>
							<xsl:for-each select="rskmsgadd:AddInformation">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rskmsgadd:AddInfoType -->
	<xsl:template match="rskmsgadd:AddInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор решения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rskmsgadd:ClassDecisionID"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата принятия решения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="rskmsgadd:ClassDecisionDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Статус</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="rskmsgadd:Status='03'">отменено по результатам ведомственного контроля</xsl:when>
						<xsl:when test="rskmsgadd:Status='04'">отменено по решению суда</xsl:when>
						<xsl:when test="rskmsgadd:Status='05'">отменено по результатам проверки</xsl:when>
						<xsl:when test="rskmsgadd:Status='06'">отменено по иным обстоятельствам</xsl:when>
						<xsl:when test="rskmsgadd:Status='10'">опубликовано</xsl:when>
						<xsl:when test="rskmsgadd:Status='19'">истек срок актуальности</xsl:when>
						<xsl:when test="rskmsgadd:Status='23'">отменено в связи с исключением кода из ТН ВЭД ЕАЭС</xsl:when>
						<xsl:when test="rskmsgadd:Status='24'">отменено в связи с обжалованием</xsl:when>
						<xsl:when test="rskmsgadd:Status='26'">отменено в связи с несогласием таможенных органов</xsl:when>
						<xsl:when test="rskmsgadd:Status='27'">отменено в связи с принятием решения ЕЭК</xsl:when>
						<xsl:when test="rskmsgadd:Status='28'">отменено в связи с принятием решения ВТамО</xsl:when>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="rskmsgadd:ClassifSign">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Классификационные признаки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rskmsgadd:ClassifSign"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rskmsgadd:CustInspect">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Характеристики товара в акте таможенного досмотра</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rskmsgadd:CustInspect"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rskmsgadd:ExpertQuestions">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Вопросы эксперту</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rskmsgadd:ExpertQuestions"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rskmsgadd:KeyWords">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Ключевые слова</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rskmsgadd:KeyWords"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rskmsgadd:AddInformationType -->
	<xsl:template match="rskmsgadd:AddInformation">
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="rskmsgadd:SearchCriterion"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="rskmsgadd:AddInfo"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rskmsgadd:RegistrationNumberType -->
	<xsl:template match="rskmsgadd:ClassDecision">
		РКТ-
		<xsl:value-of select="rskmsgadd:CustomsCode"/>-
		<xsl:value-of select="substring(rskmsgadd:RegistrationDate,3,2)"/>/
		<xsl:value-of select="rskmsgadd:Number"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="rskmsgadd:DocNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gdt_date"><xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/></xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа rskmsgadd:SearchCriterionType -->
	<xsl:template match="rskmsgadd:SearchCriterion">
		<xsl:if test="rskmsgadd:DocNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер документа, на котором выявлен риск</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="rskmsgadd:DocNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Заявленный код ТН ВЭД ЕАЭС</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rskmsgadd:TNVEDCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="rskmsgadd:AddTNVEDCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Заявленный код товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rskmsgadd:AddTNVEDCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Откорректированный код ТН ВЭД ЕАЭС</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rskmsgadd:CorrectedTNVEDCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="rskmsgadd:CorrectedAddTNVEDCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Откорректированный код товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="rskmsgadd:CorrectedAddTNVEDCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="rskmsgadd:ClassDecision">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер решения о классификации товаров</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="rskmsgadd:ClassDecision"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="gdt_date">
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
