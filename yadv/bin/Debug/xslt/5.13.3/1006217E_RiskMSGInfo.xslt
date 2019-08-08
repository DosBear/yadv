<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:rskmsg="urn:customs.ru:Information:CustomsDocuments:RiskMSGInfo:5.12.0">
	<!-- Шаблон для типа RiskMSGInfoType -->
	<xsl:template match="rskmsg:RiskMSGInfo">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									font-size: 12pt;
									font-family:Arial;
									}

									div
									{
									/*white-space: nowrap;*/
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
										<b>Информация для создания сообщения о выявленном риске в ЕБВР</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/><br/>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Код ТО, отправившего запрос</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rskmsg:CustomsCode"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Краткое описание выявленного риска</td>
							<td class="graphMain value" style="width:50%">
								<xsl:for-each select="rskmsg:RiskDecsription">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип выявленного риска</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="rskmsg:RiskType='1'">классификация</xsl:when>
									<xsl:when test="rskmsg:RiskType='2'">тарифные преференции</xsl:when>
									<xsl:when test="rskmsg:RiskType='3'">льготы по уплате таможенных платежей (кроме тарифных преференций)</xsl:when>
									<xsl:when test="rskmsg:RiskType='4'">освобождение от уплаты таможенных пошлин, налогов</xsl:when>
									<xsl:when test="rskmsg:RiskType='5'">применением ставок таможенных пошлин</xsl:when>
									<xsl:when test="rskmsg:RiskType='6'">таможенная стоимость</xsl:when>
									<xsl:when test="rskmsg:RiskType='7'">лицензирование</xsl:when>
									<xsl:when test="rskmsg:RiskType='8'">ветеринарный контроль</xsl:when>
									<xsl:when test="rskmsg:RiskType='9'">фитосанитарный контроль</xsl:when>
									<xsl:when test="rskmsg:RiskType='10'">техническое регулирование</xsl:when>
									<xsl:when test="rskmsg:RiskType='11'">экспортное регулирование</xsl:when>
									<xsl:when test="rskmsg:RiskType='12'">интеллектуальная собственность</xsl:when>
									<xsl:when test="rskmsg:RiskType='13'">количество товара, недекларирование товара</xsl:when>
									<xsl:when test="rskmsg:RiskType='14'">валютный контроль</xsl:when>
									<xsl:when test="rskmsg:RiskType='15'">прочее</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="rskmsg:RiskType"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип документа, на котором выявлен риск</td>
							<td class="value graphMain" style="width:50%">
								декларация на товары<!--xsl:value-of select="rskmsg:DocType"/-->
							</td>
						</tr>
					</table>
					<xsl:apply-templates select="rskmsg:DocNumber"/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Код таможенный процедуры по справочнику OTAMREG</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rskmsg:Procedure"/>
							</td>
						</tr>
					</table>
					<xsl:if test="rskmsg:Direct">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Направление перемещения</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="rskmsg:Direct='0'">Импорт</xsl:when>
										<xsl:when test="rskmsg:Direct='1'">Экспорт</xsl:when>
										<xsl:otherwise><xsl:value-of select="rskmsg:Direct"/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Код результата применения меры по минимизации риска по справочнику RSKRMERA.DBF</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rskmsg:MeasureCode"/>
							</td>
						</tr>
					</table>
					<xsl:if test="rskmsg:EconomicDamage">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Размер экономического ущерба, руб.</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="translate(rskmsg:EconomicDamage, '.', ',')"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">ИНН налогоплательщика</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rskmsg:INNViolator"/>
							</td>
						</tr>
					</table>
					<xsl:if test="rskmsg:NameViolator">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Наименование налогоплательшика</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rskmsg:NameViolator"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rskmsg:RiskIndicator">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Индикикаторы, по которым может быть выявлен риск</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rskmsg:RiskIndicator"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Меры по минимизации выявленного риска</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rskmsg:Measures"/>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Товары документа, на котором выявлен риск</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Заявленное описание товара</td>
								<td class="graphMain bordered">Иностранный контрагент</td>
								<td class="graphMain bordered">Заявленный код страны</td>
								<td class="graphMain bordered">Откорректированный код страны</td>
								<td class="graphMain bordered">Заявленный код ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered">Заявленный код товара в соответствии с Классификатором</td>
								<td class="graphMain bordered">Откорректированный код ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered">Откорректированный код товара в соответствии с Классификатором</td>
								<td class="graphMain bordered">Код дополнительной таможенной информации</td>
								<td class="graphMain bordered">Откорректированный код дополнительной таможенной информации</td>
								<td class="graphMain bordered">Информация о товаре</td>
							</tr>
							<xsl:for-each select="rskmsg:Goods">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="rskmsg:Attachments">
						<div class="title marg-top">Приложенные файлы</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Имя файла</td>
									<td class="graphMain bordered">Просмотр</td>
									<td class="graphMain bordered">Формат файла</td>
								</tr>
								<xsl:for-each select="rskmsg:Attachments">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rskmsg:Division">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Код подразделения, выявившего риск</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="rskmsg:Division"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Код типового критерия</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rskmsg:CriterionCode"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Код направления деятельности подразделения, по направлению которого выявлен риск</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="rskmsg:ActivityCode"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">ИПС, сформировавшее запрос</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="rskmsg:SoftKind='00'">КПС «Постконтроль»</xsl:when>
									<xsl:when test="rskmsg:SoftKind='01'">АИС «АИСТ-М»</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="rskmsg:SoftKind"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rskmsg:AttachmentType -->
	<xsl:template match="rskmsg:Attachments">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:FileName"/>
			</td>
			<td class="graphMain bordered">
				<input type="button" value="Просмотр" OnClick="1006217E" Hint="Просмотр содержимого файла"></input>
				<div class="data" style="display:none;"><xsl:value-of select="rskmsg:FileData"/></div>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="rskmsg:FileKind='01'">изображение JPEG</xsl:when>
					<xsl:when test="rskmsg:FileKind='02'">изображение PNG</xsl:when>
					<xsl:when test="rskmsg:FileKind='03'">документ MS Word</xsl:when>
					<xsl:when test="rskmsg:FileKind='04'">документ MS Excel</xsl:when>
					<xsl:when test="rskmsg:FileKind='05'">видео (3gp)</xsl:when>
					<xsl:when test="rskmsg:FileKind='06'">видео (avi)</xsl:when>
					<xsl:when test="rskmsg:FileKind='07'">изображение BMP</xsl:when>
					<xsl:when test="rskmsg:FileKind='08'">файл базы данных DBase</xsl:when>
					<xsl:when test="rskmsg:FileKind='09'">изображение EMF</xsl:when>
					<xsl:when test="rskmsg:FileKind='10'">документ PostScript (EPS)</xsl:when>
					<xsl:when test="rskmsg:FileKind='11'">видео Flash</xsl:when>
					<xsl:when test="rskmsg:FileKind='12'">изображение GIF</xsl:when>
					<xsl:when test="rskmsg:FileKind='13'">веб-страница htm, html</xsl:when>
					<xsl:when test="rskmsg:FileKind='14'">база данных MS Access</xsl:when>
					<xsl:when test="rskmsg:FileKind='15'">сканированное изображение mdi</xsl:when>
					<xsl:when test="rskmsg:FileKind='16'">видео MKV</xsl:when>
					<xsl:when test="rskmsg:FileKind='17'">аудиофайл MP3</xsl:when>
					<xsl:when test="rskmsg:FileKind='18'">видео MP4</xsl:when>
					<xsl:when test="rskmsg:FileKind='19'">документ PDF</xsl:when>
					<xsl:when test="rskmsg:FileKind='20'">презентация MS PowerPoint</xsl:when>
					<xsl:when test="rskmsg:FileKind='21'">изображение Photoshop</xsl:when>
					<xsl:when test="rskmsg:FileKind='22'">документ RTF</xsl:when>
					<xsl:when test="rskmsg:FileKind='23'">изображение TIF</xsl:when>
					<xsl:when test="rskmsg:FileKind='24'">документ TXT</xsl:when>
					<xsl:when test="rskmsg:FileKind='25'">аудиофайл WAV</xsl:when>
					<xsl:when test="rskmsg:FileKind='26'">аудиофайл WMA</xsl:when>
					<xsl:when test="rskmsg:FileKind='27'">изображение WMF</xsl:when>
					<xsl:when test="rskmsg:FileKind='28'">видео WNV</xsl:when>
					<xsl:when test="rskmsg:FileKind='29'">документ MS Write</xsl:when>
					<xsl:when test="rskmsg:FileKind='30'">архив ZIP</xsl:when>
					<xsl:when test="rskmsg:FileKind='31'">архив RAR</xsl:when>
					<xsl:when test="rskmsg:FileKind='32'">видео MPG</xsl:when>
					<xsl:when test="rskmsg:FileKind='33'">видео MP2</xsl:when>
					<xsl:otherwise><xsl:value-of select="rskmsg:FileKind"/></xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="rskmsg:DocNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер документа, на котором выявлен риск</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:call-template name="gtd_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа rskmsg:GoodsInfoType -->
	<xsl:template match="rskmsg:Goods">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:Description"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:ForeignContractorName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:OriginCountryCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:CorrectedOriginCountryCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:TNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:AddTNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:CorrectedTNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:CorrectedAddTNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:CustomsInfoCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:CorrectedCustomsInfoCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="rskmsg:GoodsInformation">
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<tr>
									<td class="graphMain bordered">Производитель товара</td>
									<td class="graphMain bordered">Артикул товара</td>
									<td class="graphMain bordered">Модель товара</td>
									<td class="graphMain bordered">Товарный знак</td>
								</tr>
							</tr>
							<xsl:for-each select="rskmsg:GoodsInformation">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rskmsg:GoodsInformationType -->
	<xsl:template match="rskmsg:GoodsInformation">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:Manufacturer"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:Marking"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:Model"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rskmsg:TradeMark"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
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
