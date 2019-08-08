<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pcdm="urn:customs.ru:Information:CustomsDocuments:PassengerCDMark:5.11.0">
	<!-- Шаблон для типа PassengerCDMarkType -->
	<xsl:template match="pcdm:PassengerCDMark">
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
										<b>Решение по пассажирской таможенной декларации</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>

					<xsl:if test="pcdm:PassengerCDBasicDocumentNumber">
						<div class="title marg-top">Регистрационный номер ПДТ. </div>
					</xsl:if>
					<xsl:apply-templates select="pcdm:PassengerCDBasicDocumentNumber"/>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата решения </td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="pcdm:DecisionDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Время решения </td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="substring(pcdm:DecisionTime, 1,8)"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Решение:</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="pcdm:Decision='1'">
										<xsl:text>выпуск товаров без уплаты таможенных платежей</xsl:text>
									</xsl:when>
									<xsl:when test="pcdm:Decision='2'">
										<xsl:text>требуется уплата таможенных платежей</xsl:text>
									</xsl:when>
									<xsl:when test="pcdm:Decision='3'">
										<xsl:text>отказ в выпуске товаров</xsl:text>
									</xsl:when>
									<xsl:when test="pcdm:Decision='4'">
										<xsl:text>выпуск товаров</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="pcdm:Decision"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="pcdm:DecisionDescription">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Описание</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="pcdm:DecisionDescription"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pcdm:RecomDescription">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Рекомендации</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="pcdm:RecomDescription"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pcdm:Comments">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Комментарии</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="pcdm:Comments">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pcdm:CustomsPerson">
						<div class="title marg-top">Должностное лицо таможенного органа</div>
					</xsl:if>
					<xsl:apply-templates select="pcdm:CustomsPerson"/>
					<xsl:if test="pcdm:Customs">
						<div class="title marg-top">Сведения о таможенном органе</div>
					</xsl:if>
					<xsl:apply-templates select="pcdm:Customs"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="pcdm:Customs">
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
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="pcdm:CustomsPerson">
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
		<xsl:if test="cat_ru:IssueDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата подписания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="pcdm:PassengerCDBasicDocumentNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:call-template name="num_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="num_date">
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
