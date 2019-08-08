<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ppts="urn:customs.ru:Information:CustomsDocuments:PackagePTS:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0">
	<!-- Шаблон для типа PackagePTSType -->
	<xsl:template match="ppts:PackagePTS">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									/*white-space: nowrap;*/
									}

									div.page {
									/*width: 277mm;*/
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
										<b>Пакет с информацией об оформлении бланков ПТС и ПШТС.</b>
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
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор системы таможенного оформления и таможенного контроля</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ppts:SystemId"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Номер версии пакета</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ppts:Version"/>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Бланк ПТС (210) или ПШТС-Т(220)</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Тип бланка</td>
								<td class="graphMain bordered">Код ТО</td>
								<td class="graphMain bordered">Код региона, серия и номер бланка</td>
								<td class="graphMain bordered">Дата и время оформления</td>
								<td class="graphMain bordered">Дата и время изменения состояния</td>
								<td class="graphMain bordered">Дата и время выгрузки записи</td>
								<td class="graphMain bordered">Уникальный ИД</td>
								<td class="graphMain bordered">Код региона, серия и номер</td>
								<td class="graphMain bordered">Новое состояние</td>
								<td class="graphMain bordered">Номер документа</td>
								<!--td class="graphMain bordered">Номер ТПО </td>
								<td class="graphMain bordered">Номер ДТ</td-->
								<td class="graphMain bordered">Инспектор</td>
								<td class="graphMain bordered">ТО</td>
							</tr>
							<xsl:for-each select="ppts:Form">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="ppts:Customs">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="ppts:CustomsPerson">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"> </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа ppts:FormType -->
	<xsl:template match="ppts:Form">
		<tr>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="ppts:FormType=210">
						<xsl:text>ПТС</xsl:text>
					</xsl:when>
					<xsl:when test="ppts:FormType=220">
						<xsl:text>ПШТС</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="ppts:FormType"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ppts:LNPCustomsCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ppts:FormNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date_time">
					<xsl:with-param name="dateIn" select="ppts:DateState"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date_time">
					<xsl:with-param name="dateIn" select="ppts:ModificationDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date_time">
					<xsl:with-param name="dateIn" select="ppts:UnloadDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ppts:GUID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ppts:OldFormNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="ppts:OldFormState=2">
						<xsl:text>аннулирован</xsl:text>
					</xsl:when>
					<xsl:when test="ppts:OldFormState=4">
						<xsl:text>утрачен после оформления</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="ppts:OldFormState"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="ppts:TPONumber">	
					<xsl:text>Номер ТПО: </xsl:text>
					<xsl:apply-templates select="ppts:TPONumber"/>
				</xsl:if>
				<xsl:if test="ppts:GTDID">
					<xsl:text>Номер ДТ: </xsl:text>
					<xsl:apply-templates select="ppts:GTDID"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="ppts:CustomsPerson"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="ppts:Customs"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="ppts:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="GTDdate">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа ppts:TPOIDType -->
	<xsl:template match="ppts:TPONumber">
		<xsl:value-of select="ppts:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="GTDdate">
			<xsl:with-param name="dateIn" select="ppts:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="ppts:TPONumber"/>
	</xsl:template>
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="$dateIn"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateIn, 12, 8)"/>
	</xsl:template>
	<xsl:template name="GTDdate">
		<xsl:param name="dateIn"/>
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
