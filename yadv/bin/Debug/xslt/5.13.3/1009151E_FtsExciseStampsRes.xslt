<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:esres="urn:customs.ru:Information:SQDocuments:FtsExciseStampsRes:5.13.1">
	<!-- Шаблон для типа FtsExciseStampsResType -->
	<xsl:template match="esres:FtsExciseStampsRes">
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
										<b>Предоставление сведений о выданных акцизных марках</b>
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
					<div class="title marg-top">Организация-импортер</div>
					<xsl:apply-templates select="esres:Importer"/>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:40%"><b>ИНН получателя</b></td>
							<td class="value graphMain" style="width:60%"><xsl:value-of select="esres:RecipientINN"/></td>
						</tr>
					</table>
					<xsl:if test="esres:IssueStampInfo">
						<div class="title marg-top">Сведения о выданных акцизных марках</div>
						<table class="bordered w190">
							<tr class="title">
								<td class="graphMain bordered" rowspan="2" style="width:10%; vertical-align: middle">Сведения о документе о выдаче</td>
								<td class="graphMain bordered" rowspan="2" style="width:8%; vertical-align: middle">Серия акцизной марки</td>
								<td class="graphMain bordered" colspan="4" align="center" style="width:80%">Сведения о выданных диапазонах акцизных марок</td>
							</tr>
							<tr class="title">
								<td class="graphMain bordered" style="width:13%; vertical-align: middle">Информация о выданном диапазоне</td>
								<td class="graphMain bordered" style="width:23%; vertical-align: middle">Нанесенные на товар акцизные марки</td>
								<td class="graphMain bordered" style="width:23%; vertical-align: middle">Уничтоженные акцизные марки</td>
								<td class="graphMain bordered" style="width:23%; vertical-align: middle">Утраченные акцизные марки</td>
							</tr>
							<xsl:for-each select="esres:IssueStampInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа esres:AppliedStampsType -->
	<xsl:template match="esres:AppliedStamps">
		<u>
		<xsl:choose>
			<xsl:when test="esres:DocumentType=1">Декларация на товары</xsl:when>
			<xsl:when test="esres:DocumentType=2">Заявление об уплате</xsl:when>
		</xsl:choose>
		</u>
		<xsl:text> № </xsl:text>
		<xsl:value-of select="esres:DeclarationNumber"/><br/>
		<xsl:text> дата: </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="esres:DeclarationDate"/>
		</xsl:call-template>
		<br/>
		<xsl:text>диапазоны использованных марок: </xsl:text><br/>
		<xsl:for-each select="esres:StampRangeInfo">
			<xsl:apply-templates select="."/><br/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа esres:DestroyedStampsType -->
	<xsl:template match="esres:DestroyedStamps">
		<u>
		<xsl:text>Акт об уничтожении</xsl:text>
		</u>
		<xsl:text> № </xsl:text>
		<xsl:value-of select="esres:ActNumber"/><br/>
		<xsl:text> дата: </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="esres:ActDate"/>
		</xsl:call-template>
		<br/>
		<xsl:text>диапазоны уничтоженных марок: </xsl:text><br/>
		<xsl:for-each select="esres:StampRangeInfo">
			<xsl:apply-templates select="."/><br/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа esres:LostStampsType -->
	<xsl:template match="esres:LostStamps">
		<u>
		<xsl:choose>
			<xsl:when test="esres:DocumentType=1">Заявление об утрате</xsl:when>
			<xsl:when test="esres:DocumentType=2">ТПО на взыскание</xsl:when>
		</xsl:choose>
		</u>
		<xsl:text> № </xsl:text>
		<xsl:value-of select="esres:LossStatementNumber"/><br/>
		<xsl:text> дата: </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="esres:LossStatementDate"/>
		</xsl:call-template>
		<br/>
		<xsl:text>диапазоны утраченных марок: </xsl:text><br/>
		<xsl:for-each select="esres:StampRangeInfo">
			<xsl:apply-templates select="."/><br/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа esres:ImporterType -->
	<xsl:template match="esres:Importer">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Наименование</td>
				<td class="value graphMain" style="width:60%"><xsl:value-of select="esres:OrganizationName"/></td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Адрес местонахождения и осуществления деятельности</td>
				<td class="value graphMain" style="width:60%"><xsl:value-of select="esres:OrganizationAddress"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа esres:IssueRangeType -->
	<xsl:template match="esres:IssueRange">
		<td class="graphMain bordered" style="font-size: 11pt"><xsl:apply-templates select="esres:StampRangeInfo"/></td>
		<td class="graphMain bordered" style="font-size: 11pt">
			<xsl:for-each select="esres:AppliedStamps">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</td>
		<td class="graphMain bordered" style="font-size: 11pt">
			<xsl:for-each select="esres:DestroyedStamps">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</td>
		<td class="graphMain bordered" style="font-size: 11pt">
			<xsl:for-each select="esres:LostStamps">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</td>
	</xsl:template>
	<!-- Шаблон для типа esres:IssueStampInfoType -->
	<xsl:template match="esres:IssueStampInfo">
		<xsl:variable name="kol_series" select="count(esres:SeriesInfo/esres:IssueRange)"/>
		<tr>
			<td class="graphMain bordered" rowspan="{$kol_series}">
				<xsl:text>№ </xsl:text>
				<xsl:value-of select="esres:DocumentNumber"/>
				<xsl:text> от </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="esres:DocumentDate"/>
				</xsl:call-template>
			</td>
			<xsl:for-each select="esres:SeriesInfo[1]">
				<td class="graphMain bordered" rowspan="{count(esres:IssueRange)}"><xsl:value-of select="esres:Series"/>
				</td>
				<xsl:apply-templates select="esres:IssueRange[1]"/>
			</xsl:for-each>
		</tr>
		<xsl:for-each select="esres:SeriesInfo[1]/esres:IssueRange[position() &gt; 1]">
			<tr>
				<xsl:apply-templates select="."/>
			</tr>	
		</xsl:for-each>
		<xsl:for-each select="esres:SeriesInfo[position() &gt; 1]">
			<tr>
				<td class="graphMain bordered" rowspan="{count(esres:IssueRange)}"><xsl:value-of select="esres:Series"/></td>
				<xsl:apply-templates select="esres:IssueRange[1]"/>
			</tr>
			<xsl:for-each select="esres:IssueRange[position() &gt; 1]">
				<tr>
					<xsl:apply-templates select="."/>
				</tr>	
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа esres:StampRangeInfoType -->
	<xsl:template match="esres:StampRangeInfo">
		<xsl:text> – начинается с </xsl:text> 
		<xsl:value-of select="esres:StartNumber"/>
		<xsl:text>, кол-во марок - </xsl:text> 
		<xsl:value-of select="esres:Count"/>
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
