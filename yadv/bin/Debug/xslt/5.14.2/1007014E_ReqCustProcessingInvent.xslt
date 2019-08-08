<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rcpi="urn:customs.ru:Information:TreatmentDocuments:ReqCustProcessingInvent:5.10.0">
	<!-- Шаблон для типа ReqCustProcessingInventType -->
	<xsl:template match="rcpi:ReqCustProcessingInvent">
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
									/*width: 260mm;*/
									margin: 5px auto;
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
										<b>Запрос документов из описи, прилагаемой к заявлению  на переработку товаров</b>
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
							<td class="annot graphMain" style="width:50%">Дата / время направления запроса</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rcpi:SendDate"/>
								</xsl:call-template>
								<xsl:if test="rcpi:SendTime">
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(rcpi:SendTime, 1,8)"/>
								</xsl:if>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата / время формирования запроса</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="rcpi:RequestDate"/>
								</xsl:call-template>
								<xsl:if test="rcpi:RequestTime">
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(rcpi:RequestTime, 1,8)"/>
								</xsl:if>
							</td>
						</tr>
					</table>
					<xsl:if test="rcpi:DateLimit">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Срок предоставления документов</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rcpi:DateLimit"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<div class="title marg-top">Запрашиваемый документ</div>
					<table class="w190">
						<!--tr class="title">
							<td class="graphMain bordered">Наименование документа</td>
							<td class="graphMain bordered">Номер документа</td>
							<td class="graphMain bordered">Дата документа</td>
							<td class="graphMain bordered">Идентификатор позиции в запросе. Используется в АПС "Электронное представление сведений"</td>
							<td class="graphMain bordered">Код вида запрашиваемого документа</td>
							<td class="graphMain bordered">Уникальный идентификатор декларанта в Электронном Архиве Декларанта.</td>
							<td class="graphMain bordered">Уникальный идентификатор архива декларанта</td>
							<td class="graphMain bordered">Уникальный идентификатор документа в архиве</td>
							<td class="graphMain bordered">Уникальный идентификатор документа</td>
							<td class="graphMain bordered">Цель, для которой запрашивается документ</td>
							<td class="graphMain bordered">Примечание</td>
							<td class="graphMain bordered">ФИО должностного лица, запрашивающего дополнительные документы и сведения</td>
							<td class="graphMain bordered">Уникальный идентификатор строки в описи. GUID</td>
						</tr-->
						<xsl:for-each select="rcpi:RequestedDoc">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
					<xsl:if test="rcpi:Customs">
						<div class="title marg-top">Таможенный орган, сформировавший запрос</div>
						<xsl:apply-templates select="rcpi:Customs"/>
					</xsl:if>
					<xsl:if test="rcpi:CustomsPerson">
						<div class="title marg-top">Должностное лицо таможенного органа</div>
						<xsl:apply-templates select="rcpi:CustomsPerson"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="rcpi:Customs">
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
	<xsl:template match="rcpi:CustomsPerson">
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
	<!-- Шаблон для типа rcpi:RequestedDocType -->
	<xsl:template match="rcpi:RequestedDoc">
		<tr bgcolor="#e3e3e3">
			<td class="annot graphMain" style="width:50%; border-top: 1px solid grey">Идентификатор позиции в запросе</td>
			<td class="value graphMain" style="width:50%; border-top: 1px solid grey"><xsl:value-of select="rcpi:RequestPositionID"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%">Наименование документа</td>
			<td class="value graphMain" style="width:50%">
				<xsl:if test="cat_ru:PrDocumentName">
					<xsl:value-of select="cat_ru:PrDocumentName"/>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:if test="cat_ru:PrDocumentNumber">
					<xsl:text>№ </xsl:text>
					<xsl:value-of select="cat_ru:PrDocumentNumber"/>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:if test="cat_ru:PrDocumentDate">
					<xsl:text>от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="rcpi:DocCode">
					<xsl:text> (код вида док-та: </xsl:text>
					<xsl:value-of select="rcpi:DocCode"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%; border-top">Уникальный идентификатор декларанта в Электронном Архиве Декларанта</td>
			<td class="value graphMain" style="width:50%; border-top"><xsl:value-of select="rcpi:ArchDeclID"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%; border-top">Уникальный идентификатор архива декларанта</td>
			<td class="value graphMain" style="width:50%; border-top"><xsl:value-of select="rcpi:ArchID"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%; border-top">Уникальный идентификатор документа в архиве</td>
			<td class="value graphMain" style="width:50%; border-top"><xsl:value-of select="rcpi:ArchDocID"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%; border-top">Уникальный идентификатор документа</td>
			<td class="value graphMain" style="width:50%; border-top"><xsl:value-of select="rcpi:ADocumentID"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%; border-top">Уникальный идентификатор строки в описи (GUID)</td>
			<td class="value graphMain" style="width:50%; border-top"><xsl:value-of select="rcpi:InventLineID"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%; border-top">Цель, для которой запрашивается документ</td>
			<td class="value graphMain" style="width:50%; border-top"><xsl:value-of select="rcpi:ReqPurpose"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%; border-top">Примечание</td>
			<td class="value graphMain" style="width:50%; border-top"><xsl:value-of select="rcpi:Note"/></td>
		</tr>
		<tr>
			<td class="annot graphMain" style="width:50%; border-top">ФИО должностного лица, запрашивающего дополнительные документы и сведения</td>
			<td class="value graphMain" style="width:50%; border-top"><xsl:value-of select="rcpi:RequestorName"/></td>
		</tr>
		<tr>
			<td colspan="2"><br/></td>		
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
