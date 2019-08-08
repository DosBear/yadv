<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.13.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:cords="urn:customs.ru:Information:SQDocuments:ContentOfReferenceDataStatus:5.13.3">
	<!-- Шаблон для типа ContentOfReferenceDataStatusType -->
	<xsl:template match="cords:ContentOfReferenceDataStatus">
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
										<b>Состояние актуализации справочных данных</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор из реестра нормативно-справочной информации Евразийского экономического союза</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="cords:ReferenceDataId"/></td>
						</tr>
					</table>
					<xsl:if test="cords:UpdateDateTime">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время актуализации справочных данных</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cords:UpdateDateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(cords:UpdateDateTime, 12, 8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<div class="title marg-top">Дополнительные технологические реквизиты электронного документа (сведений)</div>
					<xsl:apply-templates select="cords:EECEDocHeaderAddInfo"/>
					<xsl:if test="cords:EAEUDocDetails">
						<div class="title marg-top">Сведения об акте органа Союза</div>
						<xsl:apply-templates select="cords:EAEUDocDetails"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cords:EAEUDocDetailsType -->
	<xsl:template match="cords:EAEUDocDetails">
		<xsl:if test="cords:EAEUDocKindCode or cords:EAEUDocName or cords:EAEUDocId or cords:EAEUDocCreationDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование акта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="cords:EAEUDocKindCode">
							<xsl:text>(</xsl:text>
							<xsl:value-of select="cords:EAEUDocKindCode"/>
							<xsl:text>) </xsl:text>
						</xsl:if>
						<xsl:if test="cords:EAEUDocName">
							<xsl:value-of select="cords:EAEUDocName"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:if test="cords:EAEUDocId">
							<xsl:text>№ </xsl:text>
							<xsl:value-of select="cords:EAEUDocId"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:if test="cords:EAEUDocCreationDate">
							<xsl:text>от </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cords:EAEUDocCreationDate"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cords:EAEUDocEffectiveDate or cords:EAEUDocValidityDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Период действия акта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="cords:EAEUDocEffectiveDate">
							<xsl:text>с </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cords:EAEUDocEffectiveDate"/>
							</xsl:call-template>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:if test="cords:EAEUDocValidityDate">
							<xsl:text>по </xsl:text>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="cords:EAEUDocValidityDate"/>
								</xsl:call-template>
							<xsl:text> </xsl:text>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cords:DescriptionText">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Описание акта</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="cords:DescriptionText"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cords:EAEUDocIssuerId or cords:EAEUDocIssuerName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Орган Союза, принявший акт</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="cords:EAEUDocIssuerId">(<xsl:value-of select="cords:EAEUDocIssuerId"/>) </xsl:if>
						<xsl:if test="cords:EAEUDocIssuerName"><xsl:value-of select="cords:EAEUDocIssuerName"/></xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:EECEDocHeaderAddInfoType -->
	<xsl:template match="cords:EECEDocHeaderAddInfo">
		<xsl:if test="RUScat_ru:InfEnvelopeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение сообщения общего процесса</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:InfEnvelopeCode"/></td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Кодовое обозначение электронного документа (сведений) в соответствии с реестром структур электронных документов и сведений</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:EDocCode"/></td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время создания электронного документа (сведений)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="RUScat_ru:EDocDateTime"/>
					</xsl:call-template>
					<xsl:text> </xsl:text>
					<xsl:value-of select="substring(RUScat_ru:EDocDateTime, 12, 8)"/>
				</td>
			</tr>
		</table>
		<xsl:if test="RUScat_ru:LanguageCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Кодовое обозначение языка</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="RUScat_ru:LanguageCode"/></td>
				</tr>
			</table>
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
</xsl:stylesheet>
