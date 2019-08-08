<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.13.2" xmlns:mprk="urn:customs.ru:Information:CustomsDocuments:MPOReestrMark:5.13.2">
	<!-- Шаблон для типа MPOReestrMarkType -->
	<xsl:template match="mprk:MPOReestrMark">
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
										<b>Решения по реестру МПО</b>
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
					<xsl:if test="mprk:Reestr_ID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный номер реестра</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mprk:Reestr_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mprk:MPOReestr">
						<div class="title marg-top">Регистрационный номер реестра МПО</div>
					</xsl:if>
					<xsl:apply-templates select="mprk:MPOReestr"/>
					<div class="title marg-top">Решения по МПО из реестра</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Уникальный номер записи в реестре МПО</td>
								<td class="graphMain bordered">Номер по порядку в реестре</td>
								<td class="graphMain bordered">Решения по МПО из реестра</td>
							</tr>
							<xsl:for-each select="mprk:MPORegInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="mpco:CustomsPerson">
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
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mpco:MPO_Registration">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpco:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="mpco:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Уникальный номер МПО</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpco:MPO_Number"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mpco:PrevMPOReestr">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpco:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="mpco:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Уникальный номер МПО</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpco:MPO_Number"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mprk:MPOReestr">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpco:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="mpco:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Уникальный номер МПО</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="mpco:MPO_Number"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа mprk:MPORegInfoType -->
	<xsl:template match="mprk:MPORegInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="mprk:MPO_ID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mprk:RecNum"/>
			</td>
			<td class="graphMain bordered">
				<div class="title marg-top">Решения по МПО из реестра</div>
				<table class="bordered w190">
					<tbody>
						<tr class="title">
							<tr>
								<td class="graphMain bordered">Дата и время решения </td>
								<td class="graphMain bordered">Решение</td>
								<td class="graphMain bordered">Описание принятого решения</td>
								<td class="graphMain bordered">Код причины принятого решения</td>
								<td class="graphMain bordered">Описание причины принятого решения</td>
								<td class="graphMain bordered">Описание рекомендации</td>
								<td class="graphMain bordered">Комментарии</td>
								<td class="graphMain bordered">Признак необходимости предоставления с уведомлением о прибытии результатов таможенного осмотра</td>
								<td class="graphMain bordered">Верно расчитанная сумма таможенных платежей в рублях</td>
								<td class="graphMain bordered">Регистрационный номер иного реестра МПО, с тем же номером МПО</td>
								<td class="graphMain bordered">Сведения о регистрационном номере МПО</td>
								<td class="graphMain bordered">Должностное лицо таможенного органа</td>
							</tr>
						</tr>
						<xsl:for-each select="mprk:MPORegInfo">
							<xsl:apply-templates select="." mode="reg1"/>
						</xsl:for-each>
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="mprk:MPORegInfo" mode="reg1">
		<tr>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="mpco:DecisionDate"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(mpco:DecisionDate, 12, 8)"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
					<xsl:when test="mpco:DecisionCode=10">
						<xsl:text>регистрация МПО</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=11">
						<xsl:text>предварительное решение "выпуск разрешен"</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=12">
						<xsl:text>отказ в выпуске товаров</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=13">
						<xsl:text>отказ в регистрации МПО</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=20">
						<xsl:text>выпуск товаров без уплаты таможенных платежей</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=21">
						<xsl:text>выпуск разрешен</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=22">
						<xsl:text>отказ в выпуске товаров</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=23">
						<xsl:text>отказ в выпуске</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=24">
						<xsl:text>отказ в автоматическом выпуске (см код причины)</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=25">
						<xsl:text>выпуск разрешен</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=26">
						<xsl:text>выпуск товаров приостановлен</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=27">
						<xsl:text>cрок выпуска товаров продлен</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=29">
						<xsl:text>отказ в выпуске по решению должностного лица</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=30">
						<xsl:text>выпуск с уплатой разрешен</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=40">
						<xsl:text>возврат разрешен</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:DecisionCode=41">
						<xsl:text>отказ в выпуске возвращаемых товаров</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="mpco:DecisionCode"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpco:DecisionDescription" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
					<xsl:when test="mpco:ReasonCode=001">
						<xsl:text>МПО оформляется по  иному реестру МПО</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:ReasonCode=002">
						<xsl:text>не соблюдены условия регистрации</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:ReasonCode=201">
						<xsl:text>не найдена предварительная информация по МПО</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:ReasonCode=202">
						<xsl:text>требуется предъявление МПО в ТО</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:ReasonCode=203">
						<xsl:text>отказ в выпуске МПО</xsl:text>
					</xsl:when>
					<xsl:when test="mpco:ReasonCode=204">
						<xsl:text>истек срок уплаты таможенных платежей</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="mpco:ReasonCode"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpco:ReasonDescription" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpco:RecomDescription" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="mpco:Comments" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
					<xsl:when test="mpco:InspectionSign='true'">
						<xsl:text>есть</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>нет</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(mpco:TotalAmount, '.', ',')" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="mpco:PrevMPOReestr" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
					<xsl:apply-templates select="mpco:PrevMPOReestr"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="mpco:MPO_Registration" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
					<xsl:apply-templates select="mpco:MPO_Registration"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="mpco:CustomsPerson" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
					<xsl:apply-templates select="mpco:CustomsPerson"/>
				</xsl:if>
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
