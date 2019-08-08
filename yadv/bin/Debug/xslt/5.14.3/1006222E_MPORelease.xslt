<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:mpor="urn:customs.ru:Information:RegistrationDocuments:MPORelease:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа MPOReleaseType -->
	<xsl:template match="mpor:MPORelease">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									font-family:Arial;
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
									div.titleit { font-style:italic; font-weight:bold; }
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
										<b>Сведения о выдаче МПО получателю</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="mpor:MPORegNum">
						<div class="title marg-top">Номер МПО</div>
					</xsl:if>
					<xsl:apply-templates select="mpor:MPORegNum"/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:40%">Дата выдачи МПО</td>
							<td class="value graphMain" style="width:60%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="mpor:ReleaseDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="mpor:INN">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:40%">ИНН плательщика</td>
								<td class="value graphMain" style="width:60%">
									<xsl:value-of select="mpor:INN"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpor:SNILS">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:40%">СНИЛС плательщика</td>
								<td class="value graphMain" style="width:60%">
									<xsl:value-of select="mpor:SNILS"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpor:Consignee">
						<div class="title marg-top">Получатель МПО</div>
					</xsl:if>
					<xsl:apply-templates select="mpor:Consignee"/>
					<xsl:if test="mpor:EmpoweredPerson"/>
					<xsl:if test="mpor:EmpoweredPerson">
						<div class="title marg-top">Доверенное лицо</div>
					</xsl:if>
					<xsl:apply-templates select="mpor:EmpoweredPerson"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AuthoritesDocumentType -->
	<xsl:template match="mpor:AuthoritesDocument">
		<xsl:if test="cat_ru:PrDocumentName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование документа</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:PrDocumentName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Номер документа</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:PrDocumentNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата документа</td>
					<td class="value graphMain" style="width:60%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ComplationAuthorityDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата окончания полномочий</td>
					<td class="value graphMain" style="width:60%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:ComplationAuthorityDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа mpor:PersonInfoType -->
	<xsl:template match="mpor:Consignee">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Фамилия</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Имя</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonMiddleName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Отчество</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Должность</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="mpor:Birthday">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата рождения</td>
					<td class="value graphMain" style="width:60%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="mpor:Birthday"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="mpor:AuthoritesDocument"/>
		<xsl:if test="mpor:AuthoritesDocument">
			<div class="titleit marg-top">Документ, удостоверяющий полномочия, доверенностсь на совершение действий</div>
		</xsl:if>
		<xsl:apply-templates select="mpor:AuthoritesDocument"/>
		<xsl:if test="mpor:IdentityCard"/>
		<xsl:if test="mpor:IdentityCard">
			<div class="titleit marg-top">Документ, удостоверяющий личность</div>
		</xsl:if>
		<xsl:apply-templates select="mpor:IdentityCard"/>
		<xsl:if test="mpor:Birthday">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата рождения</td>
					<td class="value graphMain" style="width:60%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="mpor:Birthday"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа mpor:PersonInfoType -->
	<xsl:template match="mpor:EmpoweredPerson">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Фамилия</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="cat_ru:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Имя</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonMiddleName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Отчество</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Должность</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="mpor:Birthday">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата рождения</td>
					<td class="value graphMain" style="width:60%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="mpor:Birthday"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="mpor:AuthoritesDocument"/>
		<xsl:if test="mpor:AuthoritesDocument">
			<div class="titleit marg-top">Документ, удостоверяющий полномочия, доверенность на совершение действий</div>
		</xsl:if>
		<xsl:apply-templates select="mpor:AuthoritesDocument"/>
		<xsl:if test="mpor:IdentityCard"/>
		<xsl:if test="mpor:IdentityCard">
			<div class="titleit marg-top">Документ, удостоверяющий личность</div>
		</xsl:if>
		<xsl:apply-templates select="mpor:IdentityCard"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="mpor:IdentityCard">
		<xsl:if test="RUScat_ru:IdentityCardCode">
			Код вида документа: <xsl:value-of select="RUScat_ru:IdentityCardCode"/>,
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			Серия и номер:
			<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
			<xsl:text>, выдан </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>	<!-- Шаблон для типа mpor:MPORegNumType -->
	<xsl:template match="mpor:MPORegNum">
		<xsl:if test="mpor:CustomsCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="mpor:CustomsCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="mpor:RegistrationDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:60%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="mpor:RegistrationDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Уникальный номер МПО</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="mpor:MPO_Number"/>
				</td>
			</tr>
		</table>
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
