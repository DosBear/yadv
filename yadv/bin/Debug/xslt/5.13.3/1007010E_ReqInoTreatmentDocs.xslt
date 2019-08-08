<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rin="urn:customs.ru:Information:TreatmentDocuments:ReqInoTreatmentDocs:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ReqInoTreatmentDocsType -->
	<xsl:template match="rin:ReqInoTreatmentDocs">
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
									width: 200mm;
									margin: 10px auto;
									margin-top: 5pt;
									margin-bottom: 5pt;
									padding: 5mm;
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
										<b>Требование на предоставление электронного документа, указанного в описи, прилагаемой к заявлению на переработку товаров вне таможенной территории.</b>
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
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата направления</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rin:SendDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата формирования запроса</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rin:RequestDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Срок предоставления документов</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rin:DateLimit"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Запрашиваемый документ</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Порядковый номер записи в запросе</td>
								<td class="graphMain bordered">Код вида запрашиваемого документа</td>
								<td class="graphMain bordered">Вид документа</td>
								<td class="graphMain bordered">Цель, для которой запрашивается документ</td>
								<td class="graphMain bordered">Примечание</td>
								<td class="graphMain bordered">ФИО должностного лица, запрашивающего дополнительные документы и сведения</td>
							</tr>
							<xsl:for-each select="rin:RequestedDoc">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
					<div class="title marg-top">Средство связи</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Код средства связи</td>
								<td class="graphMain bordered">Номер средства связи / адрес</td>
							</tr>
							<xsl:for-each select="rin:Communication">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="rin:Customs">
						<div class="title marg-top">Таможенный орган</div>
						<xsl:apply-templates select="rin:Customs"/>
					</xsl:if>
					<xsl:if test="rin:CustomsPerson">
						<div class="title marg-top">Должностное лицо таможенного органа</div>
						<xsl:apply-templates select="rin:CustomsPerson"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rin:CommunicationType -->
	<xsl:template match="rin:Communication">
		<tr>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="rin:CommCode='1'">телефон</xsl:when>
					<xsl:when test="rin:CommCode='2'">факс</xsl:when>
					<xsl:when test="rin:CommCode='3'">телекс</xsl:when>
					<xsl:when test="rin:CommCode='4'">телеграф</xsl:when>
					<xsl:when test="rin:CommCode='5'">e-mail</xsl:when>
					<xsl:when test="rin:CommCode='6'">почта</xsl:when>
					<xsl:otherwise><xsl:value-of select="rin:CommCode"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rin:CommNumberAddress"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="rin:Customs">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:Code"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:OfficeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OfficeName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="rin:CustomsPerson">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:LNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:LNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rin:RequestedDocType -->
	<xsl:template match="rin:RequestedDoc">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rin:Position"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rin:DocCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rin:DocName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rin:ReqPurpose"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rin:Note"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rin:RequestorName"/>
			</td>
		</tr>
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
