<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ndreq="urn:customs.ru:Information:SQDocuments:NotarialReq:5.13.3">
	<!-- Шаблон для типа NotarialReqType -->
	<xsl:template match="ndreq:NotarialReq">
		<html>
			<head>
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
									width: 180mm;
									max-width: 180mm;
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
										<b>Представление сведений ЕИС нотариата</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
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
					<xsl:if test="ndreq:ApplicationID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Идентификатор заявки в АПС "Электронные Госуслуги" (Для запросов, совершаемых в рамках исполнения госуслуг)</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="ndreq:ApplicationID"/></td>
							</tr>
						</table>
					</xsl:if>					
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата удостоверения документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="ndreq:Date"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Реестровый номер документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ndreq:RegCode"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ndreq:Notary">
						<div class="title marg-top">Нотариус</div>
					</xsl:if>
					<xsl:apply-templates select="ndreq:Notary"/>
					<xsl:if test="ndreq:Assistant"/>
					<xsl:if test="ndreq:Assistant">
						<div class="title marg-top">ВРИО нотариуса</div>
					</xsl:if>
					<xsl:apply-templates select="ndreq:Assistant"/>
					<xsl:if test="ndreq:Blank">
						<div class="title marg-top">Бланки документа</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Серия</td>
									<td class="graphMain bordered">Номер</td>
									<td class="graphMain bordered">Идентификатор</td>
								</tr>
								<xsl:for-each select="ndreq:Blank">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="ndreq:Sample">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Запрос приложений в отчете</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="ndreq:Sample=0"><xsl:text>Образец подписи нотариуса</xsl:text></xsl:when>
										<xsl:when test="ndreq:Sample=1"><xsl:text>Образец печати подписи</xsl:text></xsl:when>
										<xsl:otherwise><xsl:value-of select="ndreq:Sample"/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ndreq:Attach"/>
					<xsl:if test="ndreq:Attach">
						<div class="title marg-top">Электронная копия нотариально оформленного документа</div>
					</xsl:if>
					<xsl:apply-templates select="ndreq:Attach"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="ndreq:Assistant">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фамилия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonMiddleName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Отчество</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ndreq:AttachType -->
	<xsl:template match="ndreq:Attach">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя файла документа с расширением</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ndreq:Name"/>
				</td>
			</tr>
		</table>
		<!--table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Файл в формате base64</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ndreq:Base"/>
				</td>
			</tr>
		</table-->
	</xsl:template>
	<!-- Шаблон для типа ndreq:BlankType -->
	<xsl:template match="ndreq:Blank">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="ndreq:Series"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ndreq:Number"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ndreq:Id"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="ndreq:Notary">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фамилия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonMiddleName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Отчество</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
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
