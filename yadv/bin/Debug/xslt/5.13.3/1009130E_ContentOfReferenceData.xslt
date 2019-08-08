<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.13.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:cord="urn:customs.ru:Information:SQDocuments:ContentOfReferenceData:5.13.3">
	<!-- Шаблон для типа ContentOfReferenceDataType -->
	<xsl:template match="cord:ContentOfReferenceData">
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
									width: 270mm;
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
										<b>Справочные данные</b>
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
							<td class="value graphMain" style="width:50%"><xsl:value-of select="cord:ReferenceDataId"/></td>
						</tr>
					</table>
					<xsl:if test="cord:UpdateDateTime">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время актуализации справочных данных</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cord:UpdateDateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(cord:UpdateDateTime, 12, 8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<div class="title marg-top">Дополнительные технологические реквизиты электронного документа (сведений)</div>
					<xsl:apply-templates select="cord:EECEDocHeaderAddInfo"/>
					<xsl:if test="cord:ReferenceDataSectionDetails">
						<div class="title marg-top">Совокупность сведений о разделе справочника или классификатора</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered" rowspan="2">Код и наименование раздела</td>
									<td class="graphMain bordered" rowspan="2">Код родительского раздела</td>
									<td class="graphMain bordered" colspan="4" align="center">Статус раздела</td>
									<td class="graphMain bordered" rowspan="2">Код страны, в которой используется раздел</td>
								</tr>
								<tr class="title">
									<td class="graphMain bordered">Дата установки статуса</td>
									<td class="graphMain bordered">Код статуса</td>
									<td class="graphMain bordered">Примечание к статусу</td>
									<td class="graphMain bordered">Сведения об акте органа Союза</td>
								</tr>
								<xsl:for-each select="cord:ReferenceDataSectionDetails">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="cord:ReferenceDataItemDetails">
						<div class="title marg-top">Совокупность сведений о записи справочных данных</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered" rowspan="2">Код вида справочных данных</td>
									<td class="graphMain bordered" rowspan="2">Код вида акта органа Союза</td>
									<td class="graphMain bordered" rowspan="2">Наименование, содержащееся в записи</td>
									<td class="graphMain bordered" rowspan="2">Oписание, содержащееся в записи</td>
									<td class="graphMain bordered" colspan="2" align="center">Код родительских</td>
									<td class="graphMain bordered" colspan="4" align="center">Статус записи</td>
									<td class="graphMain bordered" rowspan="2">Код страны, в которой используется запись</td>
								</tr>
								<tr class="title">
									<td class="graphMain bordered" align="center">раздела</td>
									<td class="graphMain bordered" align="center">записи</td>
									<td class="graphMain bordered">Дата установки статуса</td>
									<td class="graphMain bordered">Код статуса</td>
									<td class="graphMain bordered">Примечание к статусу</td>
									<td class="graphMain bordered">Сведения об акте органа Союза</td>
								</tr>
								<xsl:for-each select="cord:ReferenceDataItemDetails">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cord:EAEUDocDetailsType -->
	<xsl:template match="cord:EAEUDocDetails">
		<xsl:if test="cord:EAEUDocKindCode">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="cord:EAEUDocKindCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="cord:EAEUDocName">
			<xsl:value-of select="cord:EAEUDocName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cord:EAEUDocId">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cord:EAEUDocId"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cord:EAEUDocCreationDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cord:EAEUDocCreationDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cord:EAEUDocEffectiveDate or cord:EAEUDocValidityDate">
			<xsl:text>действует: </xsl:text>
			<xsl:if test="cord:EAEUDocEffectiveDate">
				<xsl:text>с </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cord:EAEUDocEffectiveDate"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
			</xsl:if>			
			<xsl:if test="cord:EAEUDocValidityDate">
				<xsl:text>по </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cord:EAEUDocValidityDate"/>
					</xsl:call-template>
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cord:DescriptionText">
			<br/><xsl:value-of select="cord:DescriptionText"/>
		</xsl:if>
		<xsl:if test="cord:EAEUDocIssuerId or cord:EAEUDocIssuerName">
			<br/><xsl:text>выдан: </xsl:text>
			<xsl:if test="cord:EAEUDocIssuerId">(<xsl:value-of select="cord:EAEUDocIssuerId"/>) </xsl:if>
			<xsl:if test="cord:EAEUDocIssuerName"><xsl:value-of select="cord:EAEUDocIssuerName"/></xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cord:EAEUStatusDetailsType -->
	<xsl:template match="cord:EAEUStatusDetails">
		<td class="graphMain bordered">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cord:EventDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring(cord:EventDate, 12, 8)"/>
		</td>
		<td class="graphMain bordered"><xsl:value-of select="cord:StatusCode"/></td>
		<td class="graphMain bordered"><xsl:value-of select="cord:NoteText"/></td>
		<td class="graphMain bordered"><xsl:apply-templates select="cord:EAEUDocDetails"/></td>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:EECEDocHeaderAddInfoType -->
	<xsl:template match="cord:EECEDocHeaderAddInfo">
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
	<!-- Шаблон для типа cord:ReferenceDataItemDetailsType -->
	<xsl:template match="cord:ReferenceDataItemDetails">
		<xsl:variable name="krecord" select="count(cord:EAEUStatusDetails)"/>
		<tr>
			<td class="graphMain bordered" rowspan="{$krecord}"><xsl:value-of select="cord:ReferenceDataKindCode"/></td>
			<td class="graphMain bordered" rowspan="{$krecord}">
				<xsl:for-each select="cord:ReferenceDataItemCode">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered" rowspan="{$krecord}">
				<xsl:for-each select="cord:ReferenceDataItemName"><xsl:value-of select="."/></xsl:for-each>
			</td>
			<td class="graphMain bordered" rowspan="{$krecord}">
				<xsl:for-each select="cord:ReferenceDataItemText"><xsl:value-of select="."/></xsl:for-each>
			</td>
			<td class="graphMain bordered" rowspan="{$krecord}"><xsl:value-of select="cord:ParentReferenceDataSectionCode"/></td>
			<td class="graphMain bordered" rowspan="{$krecord}"><xsl:value-of select="cord:ParentReferenceDataItemCode"/></td>
			<xsl:choose>
				<xsl:when test="cord:EAEUStatusDetails"><xsl:apply-templates select="cord:EAEUStatusDetails[1]"/></xsl:when>
				<xsl:otherwise>
					<td class="graphMain bordered"/>
					<td class="graphMain bordered"/>
					<td class="graphMain bordered"/>
					<td class="graphMain bordered"/>
				</xsl:otherwise>
			</xsl:choose>
			<td class="graphMain bordered" rowspan="{$krecord}">
				<xsl:for-each select="cord:CountryCode">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
			</td>
		</tr>
		<xsl:for-each select="cord:EAEUStatusDetails[position() &gt; 1]">
			<tr><xsl:apply-templates select="."/></tr>
		</xsl:for-each>	
	</xsl:template>
	<!-- Шаблон для типа cord:ReferenceDataSectionDetailsType -->
	<xsl:template match="cord:ReferenceDataSectionDetails">
		<xsl:variable name="kstatus" select="count(cord:EAEUStatusDetails)"/>
		<tr>
			<td class="graphMain bordered" rowspan="{$kstatus}">
				<xsl:text>(</xsl:text>
				<xsl:value-of select="cord:ReferenceDataSectionCode"/>
				<xsl:text>) </xsl:text>
				<xsl:value-of select="cord:ReferenceDataSectionName"/>
			</td>
			<td class="graphMain bordered" rowspan="{$kstatus}"><xsl:value-of select="cord:ParentReferenceDataSectionCode"/></td>
			<xsl:choose>
				<xsl:when test="cord:EAEUStatusDetails"><xsl:apply-templates select="cord:EAEUStatusDetails[1]"/></xsl:when>
				<xsl:otherwise>
					<td class="graphMain bordered"/>
					<td class="graphMain bordered"/>
					<td class="graphMain bordered"/>
					<td class="graphMain bordered"/>
				</xsl:otherwise>
			</xsl:choose>
			<td class="graphMain bordered" rowspan="{$kstatus}">
				<xsl:for-each select="cord:CountryCode">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
			</td>
		</tr>
		<xsl:for-each select="cord:EAEUStatusDetails[position() &gt; 1]">
			<tr><xsl:apply-templates select="."/></tr>
		</xsl:for-each>	
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
