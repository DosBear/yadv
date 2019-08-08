<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rdir="urn:customs.ru:Information:CustomsDocuments:RevealedDirections:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа RevealedDirectionsType -->
	<xsl:template match="rdir:RevealedDirections">
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
										<b>Результат выявления оперативных ориентировок</b>
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
					<xsl:if test="rdir:DirectionsList">
						<div class="title marg-top">Список сработавших оперативных ориентировок</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Тип оперативной ориентировки</td>
									<td class="graphMain bordered">Информационное сообщение для должностного лица пункта пропуска</td>
									<td class="graphMain bordered">Регистрационный номер оперативной ориентировки</td>
									<td class="graphMain bordered">Информация о владельце оперативной ориентировки</td>
								</tr>
								<xsl:for-each select="rdir:DirectionsList">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rdir:ContactInfoType -->
	<xsl:template match="rdir:ContactInfo">
		<b><xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>		
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
			<xsl:text> </xsl:text>	
		</xsl:if></b>
		<xsl:if test="cat_ru:PersonPost">
			<xsl:text>- </xsl:text>
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
		<br/>
		<xsl:text>Наименование отдела: </xsl:text>
		<xsl:value-of select="rdir:ContactDepartament"/>
		<br/>
		<xsl:text>Контактный телефон пользователя: </xsl:text>
		<xsl:value-of select="rdir:ContactPhone"/>
	</xsl:template>
	<!-- Шаблон для типа rdir:DirectionRegNumberType -->
	<xsl:template match="rdir:DirectionRegNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код ТО</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:SerialNumber"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер версии</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="rdir:SeqNumberVersion"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа rdir:DirectionsListType -->
	<xsl:template match="rdir:DirectionsList">
		<tr>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="rdir:DirectionKind='1'"><xsl:text>информационная</xsl:text></xsl:when>
					<xsl:when test="rdir:DirectionKind='2'"><xsl:text>скрытая</xsl:text></xsl:when>
					<xsl:when test="rdir:DirectionKind='3'"><xsl:text>блокирующая</xsl:text></xsl:when>
					<xsl:otherwise><xsl:value-of select="rdir:DirectionKind"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="rdir:InformationText"><xsl:value-of select="."/></xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="rdir:DirectionRegNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="rdir:ContactInfo"/>
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
