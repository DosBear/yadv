<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:res_cim="urn:customs.ru:Information:SQDocuments:ResponseCIM:5.10.0">
	<!-- Шаблон для типа ResponseCIMType -->
	<xsl:template match="res_cim:ResponseCIM">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: nowrap;
									}

									div.page {
									/*width: 190mm;*/
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
									font-family: Arial;
									font-size: 9pt;
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
										<b>Ответ на запрос сведений о маркированных товарах</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="res_cim:GTDNumber">
						<div class="title marg-top">Регистрационный номер ДТ</div>
					</xsl:if>
					<xsl:apply-templates select="res_cim:GTDNumber"/>
					<xsl:if test="res_cim:CustomsProcedure">
						<table class="w190">
							<tr>
								<td class="annot graphMain">
									<xsl:value-of select="res_cim:CustomsProcedure"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<div class="title marg-top">Сведения о товаре и контрольном (идентификационном) знаке</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered" style="width: 14%">Номер КИЗ</td>
								<!--td class="graphMain bordered">Идентификатор чипа RFID</td-->
								<td class="graphMain bordered" style="width: 14%">Идентификатор<br/>Global Trade Item Number</td>
								<td class="graphMain bordered" style="width: 14%">Статус КИЗ</td>
								<td class="graphMain bordered" style="width: 28%">Информация о заказчике КИЗ</td>
								<td class="graphMain bordered" style="width: 30%">Сведения о товаре</td>
							</tr>
							<xsl:for-each select="res_cim:CIMListRes">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="cat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
			<xsl:text> </xsl:text>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CategoryCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный  код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:KATOCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:RNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITNReserv">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:ITNReserv"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGINN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ОКПО - общий идентификационный код предприятий, организаций и индивидуальных предпринимателей</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KGOKPO"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:UNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН/ОГРНИП </xsl:text><xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text><xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text><xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:BIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:IIN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:ITN"/>
		<xsl:if test="cat_ru:ITN">
			<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:ITN"/>
	</xsl:template>
	<!-- Шаблон для типа res_cim:CIMListResType -->
	<xsl:template match="res_cim:CIMListRes">
		<tr valign="top">
			<td class="bordered">
				<xsl:value-of select="res_cim:VisualIdentifierCIM"/>
			</td>
			<!--td class="graphMain bordered">
				<xsl:value-of select="res_cim:RFID_TID"/>
			</td-->
			<td class="bordered">
				<xsl:value-of select="res_cim:GTINIdentifier"/>
			</td>
			<td class="bordered">
				<xsl:choose>
					<xsl:when test="res_cim:CIMSignStatus=0">
						<xsl:text>КИЗ получен от эмитента и подтвержден заказчиком</xsl:text>
					</xsl:when>
					<xsl:when test="res_cim:CIMSignStatus=1">
						<xsl:text>КИЗ отсутствует в системе</xsl:text>
					</xsl:when>
					<xsl:when test="res_cim:CIMSignStatus=2">
						<xsl:text>КИЗ эмитирован</xsl:text>
					</xsl:when>
					<xsl:when test="res_cim:CIMSignStatus=3">
						<xsl:text>КИЗ уничтожен</xsl:text>
					</xsl:when>
					<xsl:when test="res_cim:CIMSignStatus=4">
						<xsl:text>КИЗ уже выпущен в обращение</xsl:text>
					</xsl:when>
					<xsl:when test="res_cim:CIMSignStatus=9">
						<xsl:text>иной статус не допускающий выпуск товара</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="res_cim:CIMSignStatus"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="bordered">
				<xsl:if test="res_cim:RequesterCIM">
					<xsl:apply-templates select="res_cim:RequesterCIM"/>
				</xsl:if>
			</td>
			<td class="bordered">
				<xsl:if test="res_cim:Goods">
					<xsl:apply-templates select="res_cim:Goods"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа res_cim:GoodsType -->
	<xsl:template match="res_cim:Goods">
		<xsl:if test="res_cim:GoodsNumeric">
			<u>Номер товара по ДТ: </u>
			<xsl:value-of select="res_cim:GoodsNumeric"/>
		</xsl:if>
		<xsl:if test="res_cim:GoodsTNVEDCode">
			<br/>
			<u>Код по ТНВЭД ЕАЭС: </u>
			<xsl:value-of select="res_cim:GoodsTNVEDCode"/>
		</xsl:if>
		<xsl:if test="res_cim:Manufacturer">
			<br/>
			<u>Сведения о производителе: </u>
			<xsl:for-each select="res_cim:Manufacturer"><xsl:value-of select="."/></xsl:for-each>
		</xsl:if>
		<xsl:if test="res_cim:OriginCountryCode or res_cim:OriginCountryName">
			<br/>
			<u>Страна происхождения: </u>
			(<xsl:value-of select="res_cim:OriginCountryCode"/>) 
			<xsl:if test="res_cim:OriginCountryName"> <xsl:value-of select="res_cim:OriginCountryName"/></xsl:if>
		</xsl:if>
		<xsl:if test="res_cim:MeasureUnitQualifierName or res_cim:MeasureUnitQualifierCode">
			<br/>
			<u>Наименование ДЕИ: </u>
			<xsl:value-of select="res_cim:MeasureUnitQualifierName"/>
			<xsl:if test="res_cim:MeasureUnitQualifierCode">
				<xsl:text> (код: </xsl:text>
				<xsl:value-of select="res_cim:MeasureUnitQualifierCode"/>
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
		<xsl:if test="res_cim:GoodsInfo">
			<xsl:apply-templates select="res_cim:GoodsInfo"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа res_cim:GoodsInfoType -->
	<xsl:template match="res_cim:GoodsInfo">
		<xsl:if test="res_cim:FurKindCode">
			<br/>
			<u>Код вида меха: </u>
			<xsl:value-of select="res_cim:FurKindCode"/>
		</xsl:if>
		<br/>
			<u>Описание товара: </u>
		<xsl:for-each select="res_cim:GoodsDescription">
			<xsl:value-of select="."/>
		</xsl:for-each>
		<xsl:if test="res_cim:FurKindInfo">
			<br/>
			<u>Разновидность товара: </u>
			<xsl:for-each select="res_cim:FurKindInfo">
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="res_cim:GTDNumber">
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
	<!-- Шаблон для типа res_cim:RequesterCIMType -->
	<xsl:template match="res_cim:RequesterCIM">
		<xsl:if test="cat_ru:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="value graphMain">
						<xsl:value-of select="cat_ru:ShortName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
			<u>Сведения об организации: </u>
			<br/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="cat_ru:Address">
			<br/>
			<u>Адрес организации: </u>
			<xsl:apply-templates select="cat_ru:Address"/>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCard">
			<br/>
			<u>Документ, удостоверяющий личность: </u>
			<xsl:apply-templates select="cat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="cat_ru:Contact">
			<br/>
			<u>Контактная информация: </u>
			<xsl:apply-templates select="cat_ru:Contact"/>
		</xsl:if>
		
		<br/>
		<u>Признак: </u> 
		<xsl:choose>
			<xsl:when test="res_cim:RequesterCIMSign=0">физ. лицо</xsl:when>
			<xsl:when test="res_cim:RequesterCIMSign=1">юр. лицо</xsl:when>
			<xsl:otherwise><xsl:value-of select="res_cim:RequesterCIMSign"/></xsl:otherwise>
		</xsl:choose>
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
